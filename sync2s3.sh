#!/bin/sh

DEPLOY_DIR=dist
S3BUCKET=s3://YOUR_BUCKET_NAME

rm -rf $DEPLOY_DIR

grunt

# echo ''
# echo "gzip html, js, css files..."
# \find $DEPLOY_DIR -regex '.*\.\(html\|js\|css\)' -exec gzip -n -9 {} \; -exec mv {}.gz {} \;

echo ''
echo "synchronizing to s3..."
s3cmd sync -v --acl-public --add-header "Cache-Control: public, must-revalidate, proxy-revalidate, max-age 86400" --mime-type="text/css; charset=utf-8" --exclude='*' --rinclude='.*\.css' $DEPLOY_DIR/* $S3BUCKET
echo
s3cmd sync -v --acl-public --add-header "Cache-Control: public, must-revalidate, proxy-revalidate, max-age 86400" --mime-type="application/javascript; charset=utf-8" --exclude='*' --rinclude='.*\.js' $DEPLOY_DIR/* $S3BUCKET
echo
echo
s3cmd sync -v --acl-public --add-header "Cache-Control: public, must-revalidate, max-age=0" --mime-type="text/html; charset=utf-8" --exclude='*' --rinclude='.*\.html' $DEPLOY_DIR/* $S3BUCKET
echo
echo
s3cmd sync -v --acl-public --add-header "Cache-Control: max-age 86400" --guess-mime-type $DEPLOY_DIR/* $S3BUCKET
echo
echo
s3cmd sync -v --delete-removed --acl-public $DEPLOY_DIR/* $S3BUCKET

