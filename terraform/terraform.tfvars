vm_name = [ 
    "ci1",
    "dev1"
]
region                = "europe-west2" 
zone                  = "europe-west2-a"
machine_type          = "e2-small"
network               = "default"
ssh_user              = "lobofffailodrom"
main_tags             = ["tcp-5000", "tcp-8080"]
registry_tags         = ["tcp-5000"]
registry_hostname     = "registry.dev"


