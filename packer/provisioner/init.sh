sudo mkdir -p {{user `working_dir`}}/{{user `src_folder`}}
sudo chown ubuntu:ubuntu {{user `working_dir`}}/{{user `src_folder`}}
sudo mkdir -p {{user `working_dir`}}/{{user `deb_pkg_folder`}}/
sudo chown ubuntu:ubuntu {{user `working_dir`}}/{{user `deb_pkg_folder`}}