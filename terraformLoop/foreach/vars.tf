variable "names" {
  type = set(string)
  default = ["nginx-01", "nginx-02", "nginx-03"]
}

variable "names_list" {
  type = list(string)
  default = ["nginx-01", "nginx-02", "nginx-03"]
}
