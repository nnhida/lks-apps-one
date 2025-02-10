#!/bin/bash
sudo -u ec2-user bash <<'EOF'
sudo yum update -y
sudo yum install -y gcc-c++ make
sudo yum install nodejs git amazon-efs-utils -y
git clone https://github.com/betuah/lks-apps-one.git
cd lks-apps-one/server
touch .env
echo "NODE_ENV=production" >> .env
echo "PORT=8000" >> .env
echo "DB_TYPE=mysql" >> .env
echo "MYSQL_DB=db_campus" >> .env
echo "MYSQL_USERNAME=admin" >> .env
echo "MYSQL_PASSWORD=inikatasandi" >> .env
echo "MYSQL_HOST=lks21-db.cluster-czskw6ke0uge.us-east-1.rds.amazonaws.com" >> .env
echo "MYSQL_PORT=3306" >> .env
echo "REDIS_HOST=master.lks-redis3.pcstwb.use1.cache.amazonaws.com" >> .env
echo "REDIS_PORT=6379" >> .env
echo "REDIS_PASSWORD=inikatasandisaya" >> .env
echo "AWS_ACCESS_KEY=AKIA5JMSUAI6ZKUOPYIZ" >> .env
echo "AWS_SECRET_ACCESS_KEY=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" >> .env
echo "AWS_BUCKET_NAME=lks21-hida-jawa-timur" >> .env
echo "LOG_PATH=/home/ec2-user/efs/logs" >> .env
echo "CACHE_PATH=/home/ec2-user/efs/cache" >> .env
mkdir /home/ec2-user/efs
sudo mount -t nfs4 -o nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2,noresvport 172.16.2.14:/ /home/ec2-user/efs/
sudo chown ec2-user:ec2-user /home/ec2-user/efs
mkdir -p /home/ec2-user/efs/logs /home/ec2-user/efs/cache
npm install
npm install pm2 -g
npm run start-prod
EOF