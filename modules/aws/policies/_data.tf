data "template_file" "init" {
  template = "${file("${path.module}/policy.yaml")}"
}

output "test" {
 value = data.template_file.init.rendered 
}

output "test2" {
 value = data.template_file.init.template
}
