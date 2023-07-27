locals {
  vpc_id                        = var.vpc_id
  vpn_ip_whitelist              = var.vpn_ip_whitelist
  subnet_ids                    = var.subnet_ids
  cluster_endpoint_access_cidrs = var.cluster_endpoint_access_cidrs
}

module "eks_internal_ssh_security_group" {
  source                             = "OT-CLOUD-KIT/security-groups/aws"
  version                            = "1.0.0"
  enable_whitelist_ip                = var.enable_whitelist_ip
  enable_source_security_group_entry = var.enable_source_security_group_entry
  name_sg                            = var.eks_sg_name
  vpc_id                             = local.vpc_id
  ingress_rule = {
    rules = {
      rule_list = [
        {
          description  = "22 port for Opstree Team"
          from_port    = 22
          to_port      = 22
          protocol     = "tcp"
          cidr         = ["${local.vpn_ip_whitelist}"]
          ipv6_cidr    = []
          source_SG_ID = []
        }
      ]
    }
  }
}

module "valuefy_eks_cluster" {
  source                        = "OT-CLOUD-KIT/eks/aws"
  version                       = "1.1.0"
  cluster_name                  = var.cluster_name
  eks_cluster_version           = var.eks_cluster_version
  subnets                       = local.subnet_ids
  tags                          = var.common_tags
  kubeconfig_name               = var.kubeconfig_name
  config_output_path            = var.config_output_path
  eks_node_group_name           = var.eks_node_group_name
  region                        = var.region
  cluster_endpoint_whitelist    = var.cluster_endpoint_whitelist
  cluster_endpoint_access_cidrs = local.cluster_endpoint_access_cidrs
  create_node_group             = var.create_node_group
  endpoint_private              = var.endpoint_private
  endpoint_public               = var.endpoint_public
  k8s-spot-termination-handler  = var.k8s_spot_termination_handler
  cluster_autoscaler            = var.cluster_autoscaler
  metrics_server                = var.metrics_server
  vpc_id                        = local.vpc_id
  slackUrl                      = var.slackUrl
  node_groups = {
    "worker1" = {
      subnets            = local.subnet_ids
      ssh_key            = var.ssh_key
      security_group_ids = [module.eks_internal_ssh_security_group.sg_id]
      instance_type      = var.instance_type
      ami_type           = var.ami_type
      desired_capacity   = var.desired_capacity
      disk_size          = var.disk_size
      max_capacity       = var.max_capacity
      min_capacity       = var.min_capacity
      capacity_type      = var.capacity_type
      tags               = merge(var.common_tags, var.worker_group1_tags)
      labels             = var.labels 
    }
  }
}
