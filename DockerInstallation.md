# To install docker in Ubuntu under WSL2
1. Use the convinience script to install docker, ignore the warning about being on WSL and using Docker Desktop, we don't have a licence for that. `curl -fsSL https://get.docker.com | sh`
2. Check that the docker group has been added `sudo groupadd docker`
3. Add yourself to the docker group so that you don't have to prefix docker commands with 'sudo' `sudo usermod -aG docker $USER`
4. At this point you should open a new WSL terminal to get the updated group permissions.
5. Do a bit of magic with iptables or docker may not start.
  ```
  sudo update-alternatives --set iptables /usr/sbin/iptables-legacy
  sudo update-alternatives --set ip6tables /usr/sbin/ip6tables-legacy
  ```
5. Start docker. `sudo service docker start`
6. (Optional) Automatically start docker when logging in to WSL by adding commands to your .bashrc.
  ```
  echo $'\n# Start Docker on login.' >> ~/.bashrc
  echo 'wsl.exe -u root -e sh -c "service docker status || service docker start"' >> ~/.bashrc
  ```
