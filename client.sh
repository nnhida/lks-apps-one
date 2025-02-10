#!bin/bash
sudo -u ec2-user -i <<'EOF'
sudo yum update -y
sudo yum install -y gcc-c++ make
curl -sL https://rpm.nodesource.com/setup_18.x | sudo -E bash -
sudo yum install nodejs httpd git -y
sudo systemctl enable httpd
sudo systemctl start httpd
git clone https://github.com/betuah/lks-apps-one.git
cd lks-apps-one/client
npm install
touch .env
echo "API_URL=" >> .env
echo "API_EXAM_URL=" >> .env
npm run generate
sudo cp -r dist/* /var/www/html
sudo chmod -R 755 /var/www/html
EOF