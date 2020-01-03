resource"aws_s3_bucket""publics3"{ 
   acl =   "${access_type}"   bucket =   "publics3"   tags{ 
      Environment =      "Public"      Name =      "My bucket"
   }
}
