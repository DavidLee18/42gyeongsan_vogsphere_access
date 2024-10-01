#!/bin/bash

### We set up the kerberos config file to access to 42's kerberos server.

cat >> /etc/krb5.conf << EOF
[libdefaults]
	default_realm = 42GYEONGSAN.KR
	forwardable = true
	proxiable = true
    dns_lookup_kdc = no
    dns_lookup_realm = no
	allow_weak_crypto = true
	rdns = false

[realms]
	42GYEONGSAN.KR = {
        kdc = ldap.42gyeongsan.kr
		default_domain = 42gyeongsan.kr
		database_module = openldap_ldapconf
		default_lifetime = 7d
        ticket_lifetime = 7d
	}

[domain_realm]
	.42gyeongsan.kr = 42GYEONGSAN.KR
	42gyeongsan.kr = 42GYEONGSAN.KR
EOF

### We set up the ssh config file to access to 42's git server (vogsphere)
### using your kerberos identification

cat >> /etc/ssh/ssh_config << EOF
Host *.42gyeongsan.kr
     SendEnv LANG LC_*
     StrictHostKeyChecking no
     GSSAPIAuthentication yes
     GSSAPIDelegateCredentials yes
     PasswordAuthentication yes
     HashKnownHosts yes
EOF

echo "root part finished !"
