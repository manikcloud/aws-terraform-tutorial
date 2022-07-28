resource "local_file" "foo" {
    content  = "foo!"
    filename = "${path.module}/demo.txt"
}


output "file_name" {
	
value = local_file.foo.id
	description = "Id of the file"
}
