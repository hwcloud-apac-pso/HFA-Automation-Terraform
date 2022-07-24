resource "random_string" "random" {
  count            = 3
  length           = 8
  special          = false
  upper            = false
}


resource "huaweicloud_obs_bucket" "cts_system_bucket" {
  bucket = "cts-system-bucket-${random_string.random[0].result}"
  acl    = "private"
  multi_az = true
  encryption = true
  force_destroy = true
  versioning = true
  lifecycle_rule {
    name = "cts_rotation"
    enabled = true
    expiration {
        days = var.cts_local_rotation_day
    }
  }
}

resource "huaweicloud_obs_bucket" "cts_data_bucket" {
  bucket = "cts-data-bucket-${random_string.random[1].result}"
  acl    = "private"
  multi_az = true
  encryption = true 
  force_destroy = true
  versioning = true
  lifecycle_rule {
    name = "cts_rotation"
    enabled = true
    expiration {
        days = var.cts_local_rotation_day
    }
  }
}


resource "huaweicloud_obs_bucket" "cts_data_bucket_archive" {
  bucket = "cts-data-bucket-archive-${random_string.random[2].result}"
  acl    = "private"
  multi_az = true
  encryption = true
  force_destroy = true
  versioning = true
}


resource "huaweicloud_cts_tracker" "default" {
  bucket_name = huaweicloud_obs_bucket.cts_system_bucket.id
  file_prefix = "cts"
  lts_enabled = true
  enabled = tostring(try(var.cts_switch, true))
  validate_file = true
  depends_on = [
    huaweicloud_obs_bucket.cts_system_bucket
  ]
}


resource "huaweicloud_cts_data_tracker" "default" {
  name = "cts_data_tracker"

  data_bucket = huaweicloud_obs_bucket.cts_data_bucket.id
  bucket_name = huaweicloud_obs_bucket.cts_data_bucket_archive.id
  obs_retention_period = var.cts_local_rotation_day
  file_prefix = "cts"
  lts_enabled = true
  validate_file = true
  enabled = tostring(try(var.cts_switch, true))
  depends_on = [
    huaweicloud_obs_bucket.cts_data_bucket,huaweicloud_obs_bucket.cts_data_bucket_archive,
  ]
}
