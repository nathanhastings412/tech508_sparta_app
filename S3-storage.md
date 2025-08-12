# AWS S3 storage

### What is S3 storage?
- Simple storage service (S3)
- equivalent on Azure is Azure Blob Storage
- Blobs/files go into buckets (equivalent on Azure - container)
- can be used easily to host a static website on the cloud
- use s3 to:
  - store data on cloud
  - make blobs public, get a URL/endpoint to access them from anywhere
  - provide built-in redundancy
- Access from AWS console and AWS CLI 

### install AWS CLI
- `sudo apt-get install python3-pip -y`
- `sudo pip install awscli`
- `alias python=python3` - means you dont have to run python3 each time
- `aws congigure`
- `clear` - clears screen in case there are credentials or something
- `aws s3 help`
- `aws s3 mb s3://<name of bucket> --region <region>` - makes a bucket
- `aws s3 ls s3://<name of bucket>` - lists files in the bucket
- `aws s3 cp test.txt s3://<name of bucket>` - copies file into the bucket
- `aws s3 sync s3://<name of bucket> <path where you want the files downloaded>` - copies files into a new location
- `aws s3 rm s3://<name of bucket>/<name of file to remove>` - removes file from bucket
- `aws s3 rm s3://<name of bucket> --recursive` - recursively deleting files in bucket (BE VERY CAREFUL WITH RECURSIVE DELETION)
- `aws s3 rb s3://<name of bucket>` - must be empty to delete or use --force (VERY DANGEROUS)
- `aws s3 rb s3://<name of bucket> --force` - force delete bucket and files inside


## cat image task

1. find cat image
   - open image as new tab
   - use that URL
2. install curl
   - `sudo apt-get install -y curl`
3. download image onto vm
   - `curl -o <iamge url>`
4. create bucket
   - `aws s3 mb s3://tech508-nathan-bucket2 --region eu-west-1`
5. move image into bucket (and rename)
   - `aws s3 cp 396df568a4325fe46c4a4801e198e7ef.jpg s3://tech508-nathan-bucket2`
   - `aws s3 cp s3://tech508-nathan-bucket2/396df568a4325fe46c4a4801e198e7ef.jpg s3://tech508-nathan-bucket2/cat.jpg`
6. set permission
   - create bucket policy file to allow public access
     - `cat > policy.json <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "PublicReadGetObject",
      "Effect": "Allow",
      "Principal": "*",
      "Action": "s3:GetObject",
      "Resource": "arn:aws:s3:::tech508-nathan-bucket3/*"
    }
  ]
}
EOF`

   - apply the policy to bucket
     - `aws s3api put-bucket-policy --bucket tech508-nathan-bucket3 --policy file://policy.json`
   - now image is accessible
     - https://tech508-nathan-bucket3.s3.amazonaws.com/cat.jpg  
7. cd into views folder
   - repo in root user directory
   - `cd /repo/app/views`
8. modify image tag
   - `sudo nano index.html`
   - change image source to your url
   - `<img src="https://tech508-nathan-bucket3.s3.amazonaws.com/cat.jpg" alt="Cat Image" />`
     - `alt="Cat Image"` means if image does not show the words cat image will appear instead
     - save and exit
9. pm2 reload app


