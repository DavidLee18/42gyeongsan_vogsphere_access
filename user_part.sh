#!/bin/bash

### We set up the user used to access to the vogsphere

mkdir -p ~/.ssh &&
cat >> ~/.ssh/config << EOF
Host vogsphere vogsphere.42gyeongsan.kr
	User vogsphere
EOF

echo "user part finished, welcome in the freedom !"
