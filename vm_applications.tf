terraform {
  required_providers {
  
    azapi = {
      source  = "azure/azapi"
      version = "~>0.1"
    }
  }
}


resource "azapi_update_resource" "vm_applications_sccm" {
  count     = var.MD_RUN
  type      = "Microsoft.Compute/virtualMachines@2021-11-01"   //API version to use
  name      = var.MD_VIRTUAL_MACHINE_NAME // virtual machine name 
  parent_id = var.MD_RG_NAME // Resourse Group Name

  body = jsonencode({
    
  "properties": {
    "applicationProfile": {
      "galleryApplications": [
        {
          "order": 1,
          "packageReferenceId": "${var.MD_VM_APP_ID}" ,  // ID of VM Applications
         
        }
      ]
    }
  }
  }
  )
}
      
