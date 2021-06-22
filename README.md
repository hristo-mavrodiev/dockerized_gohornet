# dockerized_gohornet
Dockerized implementation of iota gohornet node with reverse proxy based on "Hornet-playbook". Requires a subdomain/domain to have working SSL cerificates. It's good to have also a static IP, so don't need to adjust subdomain settings on every restart. Must have SSD otherwise your node will ne unsynced most of the time.

### Cloning the repository with the submodules:
```sh
git clone --recursive https://github.com/hristo-mavrodiev/dockerized_gohornet.git
```


   
### Deploy the Linux based server and open ports 80;443 and 15600
Port 80 is used by the certbot to renew/confirm SSL certificates  
Port 443 is for the SSL connection (Hornet API traffic from port 14265 is forwarded to port 443)  
Port 15600/tcp is used for peering.


### Create a subdomain/domain for free in http://freedns.afraid.org/subdomain
Create `A` record, specify subdomain name and the external IP address of the server.  
Wait 30-60 min DNS records to be updated.  

<img src =https://github.com/hristo-mavrodiev/dockerized_gohornet/blob/img/subdomain.png  width = 400 height = 200>

You can check the DNS records in https://www.nslookup.io

### Deploy the nginx-reverse proxy
[nginx-README](https://github.com/hristo-mavrodiev/reverse-proxy-hornet/blob/master/README.md)

### Deploy the gohornet node
[gohornet-README](docker-hornet/README.md)

### Find peers manually in discord or with:
 http://nodesharing.wisewolf.de 
 
### Acknowledgements
 * The NGINX config file for gohornet node is based on  **nuriel77 / hornet-playbook**    
https://github.com/nuriel77/hornet-playbook

 * Nginx with Certbot implementation is based on **wmnnd/nginx-certbot**:  
   https://github.com/wmnnd/nginx-certbot 
   
### Donations
iota address: iota1qqmjyu5k0xhd2a5j08vd8esg53esgm2axzza0pleaft9d4emgdja2v5n7yn
