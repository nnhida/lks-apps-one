#!/bin/bash
sudo -u ec2-user -i <<'EOF'
sudo yum update -y
sudo yum install -y gcc-c++ make
curl -sL https://rpm.nodesource.com/setup_18.x | sudo -E bash -
sudo yum install nodejs git -y
git clone https://github.com/betuah/lks-apps-one.git
wget https://truststore.pki.rds.amazonaws.com/global/global-bundle.pem -O /home/ec2-user/lks-apps-one/exam/ssl/cert.pem
cd lks-apps-one
cd exam
touch .env
echo "NODE_ENV=production" >> .env
echo "PORT=9000" >> .env
echo "DB_TYPE=mongodb_aws" >> .env
echo "MONGO_DB=lks21-doc" >> .env
echo "MONGO_USERNAME=inidocuser" >> .env
echo "MONGO_PASSWORD=inikatasandi" >> .env
echo "MONGO_HOST=lks21-doc.cluster-czskw6ke0uge.us-east-1.docdb.amazonaws.com" >> .env
echo "MONGO_PORT=27017" >> .env
echo "MONGO_CERT=cert.pem" >> .env
echo "CLIENT_HOST=lks21-lb-1864485208.us-east-1.elb.amazonaws.com" >> .env
echo "AWS_ACCESS_KEY=AKIA5JMSUAI6ZKUOPYIZ" >> .env
echo "AWS_SECRET_ACCESS_KEY=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" >> .env
echo "AWS_BUCKET_NAME=lks21-hida-jawa-timur" >> .env
echo "MYSQL_DB=db_campus" >> .env
echo "MYSQL_USERNAME=admin" >> .env
echo "MYSQL_PASSWORD=inikatasandi" >> .env
echo "MYSQL_HOST=lks21-db.cluster-czskw6ke0uge.us-east-1.rds.amazonaws.com" >> .env
echo "MYSQL_PORT=3306" >> .env
echo "REDIS_HOST=clustercfg.lks21-redis.pcstwb.use1.cache.amazonaws.com:6379" >> .env
echo "REDIS_PORT=6379" >> .env
echo "REDIS_PASSWORD=iniauthtokensaya" >> .env
npm install
sudo npm install pm2 -g
npm run start-prod
EOF

///

#!/bin/bash
sudo -u ec2-user -i <<'EOF'
sudo yum update -y
sudo yum install -y gcc-c++ make
curl -sL https://rpm.nodesource.com/setup_18.x | sudo -E bash -
sudo yum install nodejs git -y
git clone https://github.com/betuah/lks-apps-one.git
wget https://truststore.pki.rds.amazonaws.com/global/global-bundle.pem -O /home/ec2-user/lks-apps-one/exam/ssl/cert.pem
cd lks-apps-one
cd exam
touch .env
echo "NODE_ENV=production" >> .env
echo "PORT=9000" >> .env
echo "DB_TYPE=mongodb_aws" >> .env
echo "MONGO_DB=lks21-docdb" >> .env
echo "MONGO_USERNAME=lks21user" >> .env
echo "MONGO_PASSWORD=inikatasandi" >> .env
echo "MONGO_HOST=lks21-doc.cluster-czskw6ke0uge.us-east-1.docdb.amazonaws.com" >> .env 
echo "MONGO_PORT=27017" >> .env
echo "MONGO_CERT=cert.pem" >> .env
npm install
sudo npm install pm2 -g
npm run start-pod
EOF