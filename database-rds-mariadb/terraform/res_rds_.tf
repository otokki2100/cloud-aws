data "aws_kms_key" "default" {
  key_id = "alias/aws/rds"
}

module "db" {
  source = "terraform-aws-modules/rds/aws"

  identifier = "demodb"

  engine            = "mariadb"
  engine_version    = "10.6.14"
  instance_class    = "db.t3.micro"
  allocated_storage = 20
  max_allocated_storage = 100

  db_name  = "demodb"
  username = "admin"
  port     = "3306"
  password = "Password12#"
  manage_master_user_password = false

  iam_database_authentication_enabled = false

  vpc_security_group_ids = [module.security_group_rds.security_group_id]

  create_db_subnet_group = true
  subnet_ids             = module.vpc.private_subnets

  family = "mariadb10.6"
  major_engine_version = "10.6"

  skip_final_snapshot = true

  monitoring_interval    = "60"
  monitoring_role_name   = "RDSMonitoringRole"
  create_monitoring_role = true

  #performance_insights_enabled          = true
  #performance_insights_kms_key_id = 
  #performance_insights_retention_period = 7

  create_db_parameter_group = true

  parameters = [
    {
      name  = "character_set_client"
      value = "utf8mb4"
    },
    {
      name  = "character_set_server"
      value = "utf8mb4"
    }
  ]

  create_db_option_group = true

  options = [
    {
      option_name = "MARIADB_AUDIT_PLUGIN"

      option_settings = [
        {
          name  = "SERVER_AUDIT_EVENTS"
          value = "CONNECT"
        },
        {
          name  = "SERVER_AUDIT_FILE_ROTATIONS"
          value = "30"
        },
      ]
    },
  ]

  deletion_protection = false

  tags = {
    Name       = "demodb"
  }  
}
