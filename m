Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 830BE7C425B
	for <lists+linux-stm32@lfdr.de>; Tue, 10 Oct 2023 23:23:08 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 38651C6B442;
	Tue, 10 Oct 2023 21:23:08 +0000 (UTC)
Received: from smtp-relay-internal-1.canonical.com
 (smtp-relay-internal-1.canonical.com [185.125.188.123])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 51B90C65E4C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Oct 2023 21:23:07 +0000 (UTC)
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 718213F63D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Oct 2023 21:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1696972985;
 bh=dt6CcgwPKCSIkpNUiMjupKuZt3x+WJihxFdlJEsepTg=;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
 b=f66AJUdGHC6mrAbNf/n57wEPdBi8wHDLXxy0Rx3JL5bVOV7VW+bIe7WqSP+zq1AkU
 wl9jo4GBJEBLWMFa6XN/Pws9nKe05Te5NwAshwj9hjHOL5ysM1O9cJnOVnaK3eRiDo
 W3YAZy7mnmpKAwdAMBERwhsGuZCNdFEpYbiqtO7OL1bDj6xTqTRjPpYhapSuW21s3Q
 qU0raqWTOXzeDB6cbU+q3fI1XQ9+FsUHpqeTqcFmmeC3WkRfOChZyjr2C0NeZyjjlA
 Z75ZsJKW8xdKIZ4Iy489c1Xg2d1FGoe9DVAI/i0rkK8Lm0QfE8GB1FCcRXTC/IJJ3l
 1mrSnG7w30Uvw==
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-1c9b15b2481so11709615ad.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Oct 2023 14:23:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696972984; x=1697577784;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dt6CcgwPKCSIkpNUiMjupKuZt3x+WJihxFdlJEsepTg=;
 b=GDjp1SZEDoh2/VY923EWlmmPGIEgSeEkRkF+/8Zj9vep05OzPrW/dRfD47Y9DCiO4y
 FABE7XUr8MS9DQ21Jz43Dla5tINGJtE9jiI1SPIMbnPbO+Pt9AeJ4k3uybQ1ZtdmGf7G
 ercGZ8E7Q4ogRh+G6j/Yp5Va5SpYxWp9cO7S4+6LB3Yvk7PjrauvtAF1hsRYouY9qmMF
 0KJ6z+RMLxwPl7bk+xcGXx5ymsMh6waYByaI/jtJ6gsh4CcP095Je0xD9UOwZ7RFrc0l
 cSKx84fNMOvTxEDVihld+NJsqAMshsOhYT98QwRpgu/z2m1K3bcLcVTKnuaWtJvVz2bG
 llfQ==
X-Gm-Message-State: AOJu0YyMg3l0vim+EELqgwBr6y6mOeiBWnYmF/TDimrsSd6VPxrLbqAP
 2UqCdEvgYjGcgssliYNZJjF3v+CO9oDmc9QBa7tHMLFBl09lL8ftQrSTbomZPn2h9a8go42ZjcF
 aOfglc7Nz46ekhI/eLkLK3ftNPOArUsBfRd5GQ7hkN+UAWoTB2OpOo6PexA==
X-Received: by 2002:a17:903:2307:b0:1c6:21b4:30bb with SMTP id
 d7-20020a170903230700b001c621b430bbmr21303345plh.15.1696972983573; 
 Tue, 10 Oct 2023 14:23:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGiwyknU53ojn8a4oUiYoLhkOlE4XAyEIp8hrkD35e7rfCj2gBH09CDF2PKa2CnilwyFDQlBQ==
X-Received: by 2002:a17:903:2307:b0:1c6:21b4:30bb with SMTP id
 d7-20020a170903230700b001c621b430bbmr21303327plh.15.1696972983003; 
 Tue, 10 Oct 2023 14:23:03 -0700 (PDT)
Received: from localhost ([2001:67c:1560:8007::aac:c15c])
 by smtp.gmail.com with ESMTPSA id
 h3-20020a170902b94300b001c5c370d4desm12277833pls.246.2023.10.10.14.23.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Oct 2023 14:23:02 -0700 (PDT)
From: Dimitri John Ledkov <dimitri.ledkov@canonical.com>
To: David Howells <dhowells@redhat.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Luis Chamberlain <mcgrof@kernel.org>
Date: Tue, 10 Oct 2023 22:22:38 +0100
Message-Id: <20231010212240.61637-1-dimitri.ledkov@canonical.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 keyrings@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-modules@vger.kernel.org
Subject: [Linux-stm32] [PATCH] crypto: pkcs7: remove sha1 support
X-BeenThere: linux-stm32@st-md-mailman.stormreply.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-stm32.st-md-mailman.stormreply.com>
List-Unsubscribe: <https://st-md-mailman.stormreply.com/mailman/options/linux-stm32>, 
 <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=unsubscribe>
List-Archive: <http://st-md-mailman.stormreply.com/pipermail/linux-stm32/>
List-Post: <mailto:linux-stm32@st-md-mailman.stormreply.com>
List-Help: <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=help>
List-Subscribe: <https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32>, 
 <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Removes support for sha1 signed kernel modules, importing sha1 signed
x.509 certificates.

rsa-pkcs1pad keeps sha1 padding support, which seems to be used by
virtio driver.

sha1 remains available as there are many drivers and subsystems using
it. Note only hmac(sha1) with secret keys remains cryptographically
secure.

In the kernel there are filesystems, IMA, tpm/pcr that appear to be
using sha1. Maybe they can all start to be slowly upgraded to
something else i.e. blake3, ParallelHash, SHAKE256 as needed.

Signed-off-by: Dimitri John Ledkov <dimitri.ledkov@canonical.com>
---
 crypto/asymmetric_keys/mscode_parser.c    |  3 -
 crypto/asymmetric_keys/pkcs7_parser.c     |  4 --
 crypto/asymmetric_keys/public_key.c       |  3 +-
 crypto/asymmetric_keys/signature.c        |  2 +-
 crypto/asymmetric_keys/x509_cert_parser.c |  8 ---
 crypto/testmgr.h                          | 80 -----------------------
 include/linux/oid_registry.h              |  4 --
 kernel/module/Kconfig                     |  5 --
 8 files changed, 2 insertions(+), 107 deletions(-)

diff --git a/crypto/asymmetric_keys/mscode_parser.c b/crypto/asymmetric_keys/mscode_parser.c
index 690405ebe7..6416bded0e 100644
--- a/crypto/asymmetric_keys/mscode_parser.c
+++ b/crypto/asymmetric_keys/mscode_parser.c
@@ -75,9 +75,6 @@ int mscode_note_digest_algo(void *context, size_t hdrlen,
 
 	oid = look_up_OID(value, vlen);
 	switch (oid) {
-	case OID_sha1:
-		ctx->digest_algo = "sha1";
-		break;
 	case OID_sha256:
 		ctx->digest_algo = "sha256";
 		break;
diff --git a/crypto/asymmetric_keys/pkcs7_parser.c b/crypto/asymmetric_keys/pkcs7_parser.c
index cf4caab962..ab647cb4d7 100644
--- a/crypto/asymmetric_keys/pkcs7_parser.c
+++ b/crypto/asymmetric_keys/pkcs7_parser.c
@@ -227,9 +227,6 @@ int pkcs7_sig_note_digest_algo(void *context, size_t hdrlen,
 	struct pkcs7_parse_context *ctx = context;
 
 	switch (ctx->last_oid) {
-	case OID_sha1:
-		ctx->sinfo->sig->hash_algo = "sha1";
-		break;
 	case OID_sha256:
 		ctx->sinfo->sig->hash_algo = "sha256";
 		break;
@@ -272,7 +269,6 @@ int pkcs7_sig_note_pkey_algo(void *context, size_t hdrlen,
 		ctx->sinfo->sig->pkey_algo = "rsa";
 		ctx->sinfo->sig->encoding = "pkcs1";
 		break;
-	case OID_id_ecdsa_with_sha1:
 	case OID_id_ecdsa_with_sha224:
 	case OID_id_ecdsa_with_sha256:
 	case OID_id_ecdsa_with_sha384:
diff --git a/crypto/asymmetric_keys/public_key.c b/crypto/asymmetric_keys/public_key.c
index abeecb8329..5bf0452c17 100644
--- a/crypto/asymmetric_keys/public_key.c
+++ b/crypto/asymmetric_keys/public_key.c
@@ -116,8 +116,7 @@ software_key_determine_akcipher(const struct public_key *pkey,
 		 */
 		if (!hash_algo)
 			return -EINVAL;
-		if (strcmp(hash_algo, "sha1") != 0 &&
-		    strcmp(hash_algo, "sha224") != 0 &&
+		if (strcmp(hash_algo, "sha224") != 0 &&
 		    strcmp(hash_algo, "sha256") != 0 &&
 		    strcmp(hash_algo, "sha384") != 0 &&
 		    strcmp(hash_algo, "sha512") != 0)
diff --git a/crypto/asymmetric_keys/signature.c b/crypto/asymmetric_keys/signature.c
index 2deff81f8a..398983be77 100644
--- a/crypto/asymmetric_keys/signature.c
+++ b/crypto/asymmetric_keys/signature.c
@@ -115,7 +115,7 @@ EXPORT_SYMBOL_GPL(decrypt_blob);
  * Sign the specified data blob using the private key specified by params->key.
  * The signature is wrapped in an encoding if params->encoding is specified
  * (eg. "pkcs1").  If the encoding needs to know the digest type, this can be
- * passed through params->hash_algo (eg. "sha1").
+ * passed through params->hash_algo (eg. "sha512").
  *
  * Returns the length of the data placed in the signature buffer or an error.
  */
diff --git a/crypto/asymmetric_keys/x509_cert_parser.c b/crypto/asymmetric_keys/x509_cert_parser.c
index 2c30928621..68ef1ffbbe 100644
--- a/crypto/asymmetric_keys/x509_cert_parser.c
+++ b/crypto/asymmetric_keys/x509_cert_parser.c
@@ -198,10 +198,6 @@ int x509_note_sig_algo(void *context, size_t hdrlen, unsigned char tag,
 	default:
 		return -ENOPKG; /* Unsupported combination */
 
-	case OID_sha1WithRSAEncryption:
-		ctx->cert->sig->hash_algo = "sha1";
-		goto rsa_pkcs1;
-
 	case OID_sha256WithRSAEncryption:
 		ctx->cert->sig->hash_algo = "sha256";
 		goto rsa_pkcs1;
@@ -218,10 +214,6 @@ int x509_note_sig_algo(void *context, size_t hdrlen, unsigned char tag,
 		ctx->cert->sig->hash_algo = "sha224";
 		goto rsa_pkcs1;
 
-	case OID_id_ecdsa_with_sha1:
-		ctx->cert->sig->hash_algo = "sha1";
-		goto ecdsa;
-
 	case OID_id_ecdsa_with_sha224:
 		ctx->cert->sig->hash_algo = "sha224";
 		goto ecdsa;
diff --git a/crypto/testmgr.h b/crypto/testmgr.h
index 3cfe91e2d1..98f83c32e0 100644
--- a/crypto/testmgr.h
+++ b/crypto/testmgr.h
@@ -653,30 +653,6 @@ static const struct akcipher_testvec rsa_tv_template[] = {
 static const struct akcipher_testvec ecdsa_nist_p192_tv_template[] = {
 	{
 	.key =
-	"\x04\xf7\x46\xf8\x2f\x15\xf6\x22\x8e\xd7\x57\x4f\xcc\xe7\xbb\xc1"
-	"\xd4\x09\x73\xcf\xea\xd0\x15\x07\x3d\xa5\x8a\x8a\x95\x43\xe4\x68"
-	"\xea\xc6\x25\xc1\xc1\x01\x25\x4c\x7e\xc3\x3c\xa6\x04\x0a\xe7\x08"
-	"\x98",
-	.key_len = 49,
-	.params =
-	"\x30\x13\x06\x07\x2a\x86\x48\xce\x3d\x02\x01\x06\x08\x2a\x86\x48"
-	"\xce\x3d\x03\x01\x01",
-	.param_len = 21,
-	.m =
-	"\xcd\xb9\xd2\x1c\xb7\x6f\xcd\x44\xb3\xfd\x63\xea\xa3\x66\x7f\xae"
-	"\x63\x85\xe7\x82",
-	.m_size = 20,
-	.algo = OID_id_ecdsa_with_sha1,
-	.c =
-	"\x30\x35\x02\x19\x00\xba\xe5\x93\x83\x6e\xb6\x3b\x63\xa0\x27\x91"
-	"\xc6\xf6\x7f\xc3\x09\xad\x59\xad\x88\x27\xd6\x92\x6b\x02\x18\x10"
-	"\x68\x01\x9d\xba\xce\x83\x08\xef\x95\x52\x7b\xa0\x0f\xe4\x18\x86"
-	"\x80\x6f\xa5\x79\x77\xda\xd0",
-	.c_size = 55,
-	.public_key_vec = true,
-	.siggen_sigver_test = true,
-	}, {
-	.key =
 	"\x04\xb6\x4b\xb1\xd1\xac\xba\x24\x8f\x65\xb2\x60\x00\x90\xbf\xbd"
 	"\x78\x05\x73\xe9\x79\x1d\x6f\x7c\x0b\xd2\xc3\x93\xa7\x28\xe1\x75"
 	"\xf7\xd5\x95\x1d\x28\x10\xc0\x75\x50\x5c\x1a\x4f\x3f\x8f\xa5\xee"
@@ -780,32 +756,6 @@ static const struct akcipher_testvec ecdsa_nist_p192_tv_template[] = {
 static const struct akcipher_testvec ecdsa_nist_p256_tv_template[] = {
 	{
 	.key =
-	"\x04\xb9\x7b\xbb\xd7\x17\x64\xd2\x7e\xfc\x81\x5d\x87\x06\x83\x41"
-	"\x22\xd6\x9a\xaa\x87\x17\xec\x4f\x63\x55\x2f\x94\xba\xdd\x83\xe9"
-	"\x34\x4b\xf3\xe9\x91\x13\x50\xb6\xcb\xca\x62\x08\xe7\x3b\x09\xdc"
-	"\xc3\x63\x4b\x2d\xb9\x73\x53\xe4\x45\xe6\x7c\xad\xe7\x6b\xb0\xe8"
-	"\xaf",
-	.key_len = 65,
-	.params =
-	"\x30\x13\x06\x07\x2a\x86\x48\xce\x3d\x02\x01\x06\x08\x2a\x86\x48"
-	"\xce\x3d\x03\x01\x07",
-	.param_len = 21,
-	.m =
-	"\xc2\x2b\x5f\x91\x78\x34\x26\x09\x42\x8d\x6f\x51\xb2\xc5\xaf\x4c"
-	"\x0b\xde\x6a\x42",
-	.m_size = 20,
-	.algo = OID_id_ecdsa_with_sha1,
-	.c =
-	"\x30\x46\x02\x21\x00\xf9\x25\xce\x9f\x3a\xa6\x35\x81\xcf\xd4\xe7"
-	"\xb7\xf0\x82\x56\x41\xf7\xd4\xad\x8d\x94\x5a\x69\x89\xee\xca\x6a"
-	"\x52\x0e\x48\x4d\xcc\x02\x21\x00\xd7\xe4\xef\x52\x66\xd3\x5b\x9d"
-	"\x8a\xfa\x54\x93\x29\xa7\x70\x86\xf1\x03\x03\xf3\x3b\xe2\x73\xf7"
-	"\xfb\x9d\x8b\xde\xd4\x8d\x6f\xad",
-	.c_size = 72,
-	.public_key_vec = true,
-	.siggen_sigver_test = true,
-	}, {
-	.key =
 	"\x04\x8b\x6d\xc0\x33\x8e\x2d\x8b\x67\xf5\xeb\xc4\x7f\xa0\xf5\xd9"
 	"\x7b\x03\xa5\x78\x9a\xb5\xea\x14\xe4\x23\xd0\xaf\xd7\x0e\x2e\xa0"
 	"\xc9\x8b\xdb\x95\xf8\xb3\xaf\xac\x00\x2c\x2c\x1f\x7a\xfd\x95\x88"
@@ -916,36 +866,6 @@ static const struct akcipher_testvec ecdsa_nist_p256_tv_template[] = {
 
 static const struct akcipher_testvec ecdsa_nist_p384_tv_template[] = {
 	{
-	.key = /* secp384r1(sha1) */
-	"\x04\x89\x25\xf3\x97\x88\xcb\xb0\x78\xc5\x72\x9a\x14\x6e\x7a\xb1"
-	"\x5a\xa5\x24\xf1\x95\x06\x9e\x28\xfb\xc4\xb9\xbe\x5a\x0d\xd9\x9f"
-	"\xf3\xd1\x4d\x2d\x07\x99\xbd\xda\xa7\x66\xec\xbb\xea\xba\x79\x42"
-	"\xc9\x34\x89\x6a\xe7\x0b\xc3\xf2\xfe\x32\x30\xbe\xba\xf9\xdf\x7e"
-	"\x4b\x6a\x07\x8e\x26\x66\x3f\x1d\xec\xa2\x57\x91\x51\xdd\x17\x0e"
-	"\x0b\x25\xd6\x80\x5c\x3b\xe6\x1a\x98\x48\x91\x45\x7a\x73\xb0\xc3"
-	"\xf1",
-	.key_len = 97,
-	.params =
-	"\x30\x10\x06\x07\x2a\x86\x48\xce\x3d\x02\x01\x06\x05\x2b\x81\x04"
-	"\x00\x22",
-	.param_len = 18,
-	.m =
-	"\x12\x55\x28\xf0\x77\xd5\xb6\x21\x71\x32\x48\xcd\x28\xa8\x25\x22"
-	"\x3a\x69\xc1\x93",
-	.m_size = 20,
-	.algo = OID_id_ecdsa_with_sha1,
-	.c =
-	"\x30\x66\x02\x31\x00\xf5\x0f\x24\x4c\x07\x93\x6f\x21\x57\x55\x07"
-	"\x20\x43\x30\xde\xa0\x8d\x26\x8e\xae\x63\x3f\xbc\x20\x3a\xc6\xf1"
-	"\x32\x3c\xce\x70\x2b\x78\xf1\x4c\x26\xe6\x5b\x86\xcf\xec\x7c\x7e"
-	"\xd0\x87\xd7\xd7\x6e\x02\x31\x00\xcd\xbb\x7e\x81\x5d\x8f\x63\xc0"
-	"\x5f\x63\xb1\xbe\x5e\x4c\x0e\xa1\xdf\x28\x8c\x1b\xfa\xf9\x95\x88"
-	"\x74\xa0\x0f\xbf\xaf\xc3\x36\x76\x4a\xa1\x59\xf1\x1c\xa4\x58\x26"
-	"\x79\x12\x2a\xb7\xc5\x15\x92\xc5",
-	.c_size = 104,
-	.public_key_vec = true,
-	.siggen_sigver_test = true,
-	}, {
 	.key = /* secp384r1(sha224) */
 	"\x04\x69\x6c\xcf\x62\xee\xd0\x0d\xe5\xb5\x2f\x70\x54\xcf\x26\xa0"
 	"\xd9\x98\x8d\x92\x2a\xab\x9b\x11\xcb\x48\x18\xa1\xa9\x0d\xd5\x18"
diff --git a/include/linux/oid_registry.h b/include/linux/oid_registry.h
index 4d04fa5d1e..8b79e55cfc 100644
--- a/include/linux/oid_registry.h
+++ b/include/linux/oid_registry.h
@@ -17,12 +17,10 @@
  *	  build_OID_registry.pl to generate the data for look_up_OID().
  */
 enum OID {
-	OID_id_dsa_with_sha1,		/* 1.2.840.10030.4.3 */
 	OID_id_dsa,			/* 1.2.840.10040.4.1 */
 	OID_id_ecPublicKey,		/* 1.2.840.10045.2.1 */
 	OID_id_prime192v1,		/* 1.2.840.10045.3.1.1 */
 	OID_id_prime256v1,		/* 1.2.840.10045.3.1.7 */
-	OID_id_ecdsa_with_sha1,		/* 1.2.840.10045.4.1 */
 	OID_id_ecdsa_with_sha224,	/* 1.2.840.10045.4.3.1 */
 	OID_id_ecdsa_with_sha256,	/* 1.2.840.10045.4.3.2 */
 	OID_id_ecdsa_with_sha384,	/* 1.2.840.10045.4.3.3 */
@@ -30,7 +28,6 @@ enum OID {
 
 	/* PKCS#1 {iso(1) member-body(2) us(840) rsadsi(113549) pkcs(1) pkcs-1(1)} */
 	OID_rsaEncryption,		/* 1.2.840.113549.1.1.1 */
-	OID_sha1WithRSAEncryption,	/* 1.2.840.113549.1.1.5 */
 	OID_sha256WithRSAEncryption,	/* 1.2.840.113549.1.1.11 */
 	OID_sha384WithRSAEncryption,	/* 1.2.840.113549.1.1.12 */
 	OID_sha512WithRSAEncryption,	/* 1.2.840.113549.1.1.13 */
@@ -67,7 +64,6 @@ enum OID {
 	OID_PKU2U,			/* 1.3.5.1.5.2.7 */
 	OID_Scram,			/* 1.3.6.1.5.5.14 */
 	OID_certAuthInfoAccess,		/* 1.3.6.1.5.5.7.1.1 */
-	OID_sha1,			/* 1.3.14.3.2.26 */
 	OID_id_ansip384r1,		/* 1.3.132.0.34 */
 	OID_sha256,			/* 2.16.840.1.101.3.4.2.1 */
 	OID_sha384,			/* 2.16.840.1.101.3.4.2.2 */
diff --git a/kernel/module/Kconfig b/kernel/module/Kconfig
index 33a2e991f6..19a53d5e77 100644
--- a/kernel/module/Kconfig
+++ b/kernel/module/Kconfig
@@ -236,10 +236,6 @@ choice
 	  possible to load a signed module containing the algorithm to check
 	  the signature on that module.
 
-config MODULE_SIG_SHA1
-	bool "Sign modules with SHA-1"
-	select CRYPTO_SHA1
-
 config MODULE_SIG_SHA224
 	bool "Sign modules with SHA-224"
 	select CRYPTO_SHA256
@@ -261,7 +257,6 @@ endchoice
 config MODULE_SIG_HASH
 	string
 	depends on MODULE_SIG || IMA_APPRAISE_MODSIG
-	default "sha1" if MODULE_SIG_SHA1
 	default "sha224" if MODULE_SIG_SHA224
 	default "sha256" if MODULE_SIG_SHA256
 	default "sha384" if MODULE_SIG_SHA384
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
