Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4172CAEE3ED
	for <lists+linux-stm32@lfdr.de>; Mon, 30 Jun 2025 18:14:56 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C4BCAC3089F;
	Mon, 30 Jun 2025 16:14:54 +0000 (UTC)
Received: from szxga07-in.huawei.com (szxga07-in.huawei.com [45.249.212.35])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7288FC32E93
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Jun 2025 13:27:35 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.163.44])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4bW6Nr3lz4z29dyB;
 Mon, 30 Jun 2025 21:25:48 +0800 (CST)
Received: from kwepemh100007.china.huawei.com (unknown [7.202.181.92])
 by mail.maildlp.com (Postfix) with ESMTPS id 1E36F1401E9;
 Mon, 30 Jun 2025 21:27:33 +0800 (CST)
Received: from huawei.com (10.67.174.33) by kwepemh100007.china.huawei.com
 (7.202.181.92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 30 Jun
 2025 21:27:32 +0800
From: Gu Bowen <gubowen5@huawei.com>
To: Herbert Xu <herbert@gondor.apana.org.au>, David Howells
 <dhowells@redhat.com>, David Woodhouse <dwmw2@infradead.org>, Lukas Wunner
 <lukas@wunner.de>, Ignat Korchagin <ignat@cloudflare.com>, "David S . Miller"
 <davem@davemloft.net>, Jarkko Sakkinen <jarkko@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Eric Biggers <ebiggers@kernel.org>, "Jason A . Donenfeld" <Jason@zx2c4.com>,
 Ard Biesheuvel <ardb@kernel.org>, Tianjia Zhang
 <tianjia.zhang@linux.alibaba.com>, Dan Carpenter <dan.carpenter@linaro.org>
Date: Mon, 30 Jun 2025 21:39:34 +0800
Message-ID: <20250630133934.766646-5-gubowen5@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250630133934.766646-1-gubowen5@huawei.com>
References: <20250630133934.766646-1-gubowen5@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.67.174.33]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemh100007.china.huawei.com (7.202.181.92)
X-Mailman-Approved-At: Mon, 30 Jun 2025 16:14:53 +0000
Cc: linux-kernel@vger.kernel.org, Lu Jialin <lujialin4@huawei.com>,
 Gu Bowen <gubowen5@huawei.com>, keyrings@vger.kernel.org,
 linux-crypto@vger.kernel.org, GONG Ruiqi <gongruiqi1@huawei.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH RFC 4/4] crypto/sm2: support SM2-with-SM3
	verification of X.509 certificates
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

The digest is calculated during certificate parsing, but the public key of
the signing certificate need to be obtained before calculating the digest
to correctly calculate the Z value.

By attempting to obtain the public key before computing the digest, the
feasibility of doing so was tested and verified.

Signed-off-by: Gu Bowen <gubowen5@huawei.com>
---
 certs/system_keyring.c                   |  8 +++++++
 crypto/asymmetric_keys/public_key.c      |  7 ++++++
 crypto/asymmetric_keys/x509_public_key.c | 27 +++++++++++++++++++++++-
 include/keys/system_keyring.h            | 13 ++++++++++++
 4 files changed, 54 insertions(+), 1 deletion(-)

diff --git a/certs/system_keyring.c b/certs/system_keyring.c
index 9de610bf1f4b..adceb3f0928c 100644
--- a/certs/system_keyring.c
+++ b/certs/system_keyring.c
@@ -32,6 +32,14 @@ extern __initconst const u8 system_certificate_list[];
 extern __initconst const unsigned long system_certificate_list_size;
 extern __initconst const unsigned long module_cert_size;
 
+struct key *find_asymmetric_pub_key(const struct asymmetric_key_id *id_0,
+				    const struct asymmetric_key_id *id_1,
+				    const struct asymmetric_key_id *id_2)
+{
+	return find_asymmetric_key(builtin_trusted_keys, id_0,
+				   id_1, id_2, false);
+}
+
 /**
  * restrict_link_by_builtin_trusted - Restrict keyring addition by built-in CA
  * @dest_keyring: Keyring being linked to.
diff --git a/crypto/asymmetric_keys/public_key.c b/crypto/asymmetric_keys/public_key.c
index e5b177c8e842..ca0bb32e093a 100644
--- a/crypto/asymmetric_keys/public_key.c
+++ b/crypto/asymmetric_keys/public_key.c
@@ -134,6 +134,13 @@ software_key_determine_akcipher(const struct public_key *pkey,
 		n = snprintf(alg_name, CRYPTO_MAX_ALG_NAME, "%s(%s)",
 			     encoding, pkey->pkey_algo);
 		return n >= CRYPTO_MAX_ALG_NAME ? -EINVAL : 0;
+	} else if (strcmp(pkey->pkey_algo, "sm2") == 0) {
+		if (strcmp(encoding, "raw") != 0)
+			return -EINVAL;
+		if (!hash_algo)
+			return -EINVAL;
+		if (strcmp(hash_algo, "sm3") != 0)
+			return -EINVAL;
 	} else if (strcmp(pkey->pkey_algo, "ecrdsa") == 0) {
 		if (strcmp(encoding, "raw") != 0)
 			return -EINVAL;
diff --git a/crypto/asymmetric_keys/x509_public_key.c b/crypto/asymmetric_keys/x509_public_key.c
index 8409d7d36cb4..62bbc423d632 100644
--- a/crypto/asymmetric_keys/x509_public_key.c
+++ b/crypto/asymmetric_keys/x509_public_key.c
@@ -7,6 +7,7 @@
 
 #define pr_fmt(fmt) "X.509: "fmt
 #include <crypto/hash.h>
+#include <crypto/sm2.h>
 #include <keys/asymmetric-parser.h>
 #include <keys/asymmetric-subtype.h>
 #include <keys/system_keyring.h>
@@ -28,6 +29,8 @@ int x509_get_sig_params(struct x509_certificate *cert)
 	struct shash_desc *desc;
 	size_t desc_size;
 	int ret;
+	struct key *key;
+	struct public_key *pkey;
 
 	pr_devel("==>%s()\n", __func__);
 
@@ -63,8 +66,30 @@ int x509_get_sig_params(struct x509_certificate *cert)
 
 	desc->tfm = tfm;
 
-	ret = crypto_shash_digest(desc, cert->tbs, cert->tbs_size,
+	if (strcmp(cert->pub->pkey_algo, "sm2") == 0) {
+		if (!sig->auth_ids[0] && !sig->auth_ids[1] && !sig->auth_ids[2])
+			return -ENOKEY;
+
+		key = find_asymmetric_pub_key(sig->auth_ids[0], sig->auth_ids[1],
+					      sig->auth_ids[2]);
+		if (IS_ERR(key))
+			pkey = cert->pub;
+		else
+			pkey = key->payload.data[asym_crypto];
+
+		ret = strcmp(sig->hash_algo, "sm3") != 0 ? -EINVAL :
+			crypto_shash_init(desc) ?:
+			sm2_compute_z_digest(desc, pkey->key,
+					     pkey->keylen, sig->digest) ?:
+			crypto_shash_init(desc) ?:
+			crypto_shash_update(desc, sig->digest,
+					    sig->digest_size) ?:
+			crypto_shash_finup(desc, cert->tbs, cert->tbs_size,
+					   sig->digest);
+	} else {
+		ret = crypto_shash_digest(desc, cert->tbs, cert->tbs_size,
 				  sig->digest);
+	}
 
 	if (ret < 0)
 		goto error_2;
diff --git a/include/keys/system_keyring.h b/include/keys/system_keyring.h
index a6c2897bcc63..21b466e5d2f3 100644
--- a/include/keys/system_keyring.h
+++ b/include/keys/system_keyring.h
@@ -10,6 +10,8 @@
 
 #include <linux/key.h>
 
+struct asymmetric_key_id;
+
 enum blacklist_hash_type {
 	/* TBSCertificate hash */
 	BLACKLIST_HASH_X509_TBS = 1,
@@ -19,6 +21,10 @@ enum blacklist_hash_type {
 
 #ifdef CONFIG_SYSTEM_TRUSTED_KEYRING
 
+extern struct key *find_asymmetric_pub_key(const struct asymmetric_key_id *id_0,
+					   const struct asymmetric_key_id *id_1,
+					   const struct asymmetric_key_id *id_2);
+
 extern int restrict_link_by_builtin_trusted(struct key *keyring,
 					    const struct key_type *type,
 					    const union key_payload *payload,
@@ -30,6 +36,13 @@ int restrict_link_by_digsig_builtin(struct key *dest_keyring,
 extern __init int load_module_cert(struct key *keyring);
 
 #else
+static inline struct key *find_asymmetric_pub_key(const struct asymmetric_key_id *id_0,
+						  const struct asymmetric_key_id *id_1,
+						  const struct asymmetric_key_id *id_2)
+{
+	return NULL;
+}
+
 #define restrict_link_by_builtin_trusted restrict_link_reject
 #define restrict_link_by_digsig_builtin restrict_link_reject
 
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
