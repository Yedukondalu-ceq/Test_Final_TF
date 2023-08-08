data "aws_ami" "amazon_linux2" {
  most_recent = true
  filter {
    name   = "name"
    values = ["amzn2-ami-kernel-5.10-hvm-*-x86_64-gp2"]
  }
  filter {
    name   = "owner-alias"
    values = ["amazon"]
  }
  owners = ["amazon"]
}

# Create a launch configuration
resource "aws_launch_configuration" "tu-launch-config" {
  name_prefix                 = "${var.project-name}-${var.Environment}-lc"
  image_id                    = data.aws_ami.amazon_linux2.id
  instance_type               = var.instance_type
  security_groups             = [var.security_groups]
  associate_public_ip_address = var.associate_public_ip_address
  key_name                    = var.key_name
  iam_instance_profile        = var.instance_profile
  user_data                   = file("${path.module}/script.sh")

#   lifecycle {
#     create_before_destroy = true
#   }
}

# Create a autoscaling group
resource "aws_autoscaling_group" "my-tu-autoscale" {
  launch_configuration  = aws_launch_configuration.tu-launch-config.name
  vpc_zone_identifier   = var.subnets_id
  target_group_arns     = [var.target_group_arns]
  health_check_type     = "EC2"
  min_size              = var.min_size
  desired_capacity      = var.desired_capacity
  max_size              = var.max_size

  tag {
    key                 = "Name"
    value               = "${var.project-name}-${var.Environment}-asg"
    propagate_at_launch = true
  }

}
  