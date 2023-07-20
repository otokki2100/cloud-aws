module "db" {
  source = "terraform-aws-modules/rds/aws"

  identifier = "demodb"

  engine            = "mariadb"
  engine_version    = "10.6.14"
  instance_class    = "db.t3.micro"
  allocated_storage = 20

  db_name  = "demodb"
  username = "admin"
  port     = "3306"
  password = "Password123!@#"

  iam_database_authentication_enabled = false

  vpc_security_group_ids = [module.security_group_rds.security_group_id]

  monitoring_interval    = "60"
  monitoring_role_name   = "RDSMonitoringRole"
  create_monitoring_role = true

  tags = {
    Name       = "demodb"
  }

  create_db_subnet_group = true
  subnet_ids             = module.vpc.private_subnets

  family = "mariadb10.6"
  major_engine_version = "10.6"

  deletion_protection = false

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
}
