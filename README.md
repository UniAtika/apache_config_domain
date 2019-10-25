# A very easy way to create a working domain configuration including free SSL Certificates under Apache.
This script **configures** a **domain** or subdomain under **Apache**.

An **SSL** certificate with Cerbot will be created and **integrated**.

Ideally, the script will run on a **cleanly installed LAMP server**. Then it does what it's supposed to do.

Tested and developed on an **Ubuntu 18.04** VServer.

## How to install

Dependencies: [Cerbot Homepage](https://certbot.eff.org/)

`sudo apt install -y python-certbot-apache`

### Clone this repository

`git clone https://github.com/UniAtika/apache_config_domain.git`

### Make the script executable
Change to the script directory and execute the following command:

`chmod +x a2_conf_domain.sh`

### Run the script
`./a2_conf_domain.sh`

### Follow the instructions
First, you will be asked for the domain to be configured.

Type in your domain or subdomain **without** `www`,`http` or `https`

You have to accept the conditions of Cerbot twice.

Furthermore, Cerbot needs an email address.

Choose option two: Redirect

The waiting time is under a minute.

Visit your website and enjoy yourself.

### Particularities:
- Simply programmed that beginners like me can read the code well.
- The Apache service is restarted once during the execution of the script.

### Troubleshooting
- Existing Apache configurations (such as reverse proxies or other powered-on php modules) can restrict functionality.
- Ideally, the script will run on a cleanly installed LAMP server. Then it does what it's supposed to do.
