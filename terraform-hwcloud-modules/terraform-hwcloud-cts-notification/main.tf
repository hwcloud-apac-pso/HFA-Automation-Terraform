resource "huaweicloud_smn_topic" "cts_important_notices" {
  name         = "cts_imp_notices_topic"
  display_name = "The CTS important notification"
}


resource "huaweicloud_smn_subscription" "cts_imp_notices_email_subcription" {
  count =  length(var.cts_important_notify_email) > 0  ? 1 : 0    
  topic_urn = huaweicloud_smn_topic.cts_important_notices.id
  endpoint  =  var.cts_important_notify_email
  protocol  = "email"
}

resource "huaweicloud_smn_subscription" "cts_imp_notices_sms_subcription" {
  count =  length(var.cts_important_notify_phone) > 0  ? 1 : 0     
  topic_urn = huaweicloud_smn_topic.cts_important_notices.id
  endpoint  =  var.cts_important_notify_phone
  protocol  = "sms"
}



resource "huaweicloud_cts_notification" "cts_notify" {
  name           = "cts_important_nofity"
  operation_type = "customized"
  smn_topic      = huaweicloud_smn_topic.cts_important_notices.topic_urn

  operations {
        service     = "KMS"
        resource    = "cmk"
        trace_names = ["disableKey", "deleteKeyRiskTips"]
    }
  operations { 
        service     = "OBS"
        resource    = "bucket"
        trace_names = ["deleteBucketPolicy", "setBucketPolicy"]
    }
  operations { 
        service     = "VPC"
        resource    = "vpc"
        trace_names = ["createVpc", "deleteVpc", "modifyVpc"]
    }
   operations { 
        service     = "VPC"
        resource    = "vpn"
        trace_names = ["deleteVpn", "modifyVpn"]
    }   
  operations { 
        service     = "IAM"
        resource    = "SecurityPolicy"
        trace_names = ["modifySecurityPolicy"]
    }
  operations { 
        service     = "CTS"
        resource    = "tracker"
        trace_names = ["updateTracker", "deleteTracker"]
    }           
}



resource "huaweicloud_cts_notification" "cts_root_account_notify" {
  name           = "cts_root_account_login_nofity"
  operation_type = "customized"
  smn_topic      = huaweicloud_smn_topic.cts_important_notices.topic_urn

  operations { 
        service     = "IAM"
        resource    = "user"
        trace_names = ["login", "loginFailed"]
    }   
  operation_users { 
        group = "admin"
        users = [var.root_account_name]
    } 
}