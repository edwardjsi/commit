# 🪣 Day 10: AWS S3 Bucket Creation and Access Control

## 🎯 Objective
Manually create an S3 bucket via the AWS Console, upload an object, and configure access control (public vs. private).

---

## 🛠️ Steps

### 1. Create Bucket
- Go to AWS Console → S3
- Click **Create bucket**
- Name: `day10-s3-bucket-<your-id>`
- Region: `eu-north-1`
- Leave **Block Public Access** enabled
- Click **Create**

### 2. Upload Object
- Open the bucket
- Click **Upload**
- Choose a file (e.g., `hello.txt`)
- Click **Upload**

### 3. Make Public (Optional)
- Select object → Actions → Make public
- Copy **Object URL**

### 4. Verify Access
```bash
curl https://day10b.s3.eu-north-1.amazonaws.com/helloworld.txt
