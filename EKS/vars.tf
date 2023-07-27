variable "region" {
  type        = string
  description = "Region where resource will be created."
}

variable "vpc_id" {
  description = "ID of the VPC where the resources will be created"
  type        = string
}

variable "vpn_ip_whitelist" {
  description = "IP whitelist for VPN access"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs"
  type        = list(string)
}

variable "cluster_endpoint_access_cidrs" {
  description = "List of CIDR blocks for cluster endpoint access"
  type        = list(string)
}

variable "enable_whitelist_ip" {
  description = "Enable whitelisting of IP addresses in the security group"
  type        = bool
  default     = true
}

variable "enable_source_security_group_entry" {
  description = "Enable allowing traffic from the source security group in the security group"
  type        = bool
  default     = false
}

variable "eks_sg_name" {
  description = "Name of the EKS security group"
  type        = string
}

variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
}

variable "eks_cluster_version" {
  description = "Version of the EKS cluster"
  type        = string
}

variable "common_tags" {
  description = "Common tags to be applied to resources"
  type        = map(string)
}

variable "kubeconfig_name" {
  description = "Name of the kubeconfig file"
  type        = string
}

variable "config_output_path" {
  description = "Output path for the kubeconfig file"
  type        = string
}

variable "eks_node_group_name" {
  description = "Name of the EKS node group"
  type        = string
}

variable "cluster_endpoint_whitelist" {
  description = "whether want to whitelist cluster endpoint"
  type        =  bool
}

variable "create_node_group" {
  description = "Create EKS node group"
  type        = bool
  default     = true
}

variable "endpoint_private" {
  description = "Whether to create private endpoint access"
  type        = bool
  default     = true
}

variable "endpoint_public" {
  description = "Whether to create public endpoint access"
  type        = bool
  default     = false
}

variable "k8s_spot_termination_handler" {
  description = "Enable K8S Spot Termination Handler"
  type        = bool
  default     = true
}

variable "cluster_autoscaler" {
  description = "Enable Cluster Autoscaler"
  type        = bool
  default     = true
}

variable "metrics_server" {
  description = "Enable Metrics Server"
  type        = bool
  default     = true
}

variable "ssh_key" {
  description = "SSH key for node instances"
  type        = string
}

variable "instance_type" {
  description = "Instance type for node instances"
  type        = list(string)
}

variable "desired_capacity" {
  description = "Desired capacity for the node group"
  type        = number
}

variable "disk_size" {
  description = "Disk size for node instances"
  type        = number
}

variable "max_capacity" {
  description = "Maximum capacity for the node group"
  type        = number
}

variable "min_capacity" {
  description = "Minimum capacity for the node group"
  type        = number
}

variable "capacity_type" {
  description = "Capacity type for the node group"
  type        = string
}

variable "worker_group1_tags" {
  description = "Tags specific to worker group 1"
  type        = map(string)
}

variable "labels" {
  description = "Labels for the node group"
  type        = map(string)
}

variable "slackUrl" {
  description = "Slack URL for notifications"
  type        = string
}
variable "ami_type" {
  description = "Type of Amazon Machine Image (AMI) associated with the EKS Node Group"
  type        = string
}
