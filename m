Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 939B525C18B
	for <lists+linux-stm32@lfdr.de>; Thu,  3 Sep 2020 15:13:03 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4B8BCC3FAE0;
	Thu,  3 Sep 2020 13:13:03 +0000 (UTC)
Received: from out4436.biz.mail.alibaba.com (out4436.biz.mail.alibaba.com
 [47.88.44.36])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B6213C3FADA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  3 Sep 2020 13:12:57 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R131e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01f04392;
 MF=tianjia.zhang@linux.alibaba.com; NM=1; PH=DS; RN=31; SR=0;
 TI=SMTPD_---0U7ok5IF_1599138766; 
Received: from localhost(mailfrom:tianjia.zhang@linux.alibaba.com
 fp:SMTPD_---0U7ok5IF_1599138766) by smtp.aliyun-inc.com(127.0.0.1);
 Thu, 03 Sep 2020 21:12:47 +0800
From: Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>,
 David Howells <dhowells@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>,
 Stephan Mueller <smueller@chronox.de>,
 Marcelo Henrique Cerri <marcelo.cerri@canonical.com>,
 "Steven Rostedt (VMware)" <rostedt@goodmis.org>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Brendan Higgins <brendanhiggins@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Johannes Weiner <hannes@cmpxchg.org>, Waiman Long <longman@redhat.com>,
 Mimi Zohar <zohar@linux.ibm.com>,
 Lakshmi Ramasubramanian <nramas@linux.microsoft.com>,
 Colin Ian King <colin.king@canonical.com>,
 Tushar Sugandhi <tusharsu@linux.microsoft.com>,
 Vitaly Chikunov <vt@altlinux.org>,
 "Gilad Ben-Yossef" <gilad@benyossef.com>,
 Pascal van Leeuwen <pvanleeuwen@rambus.com>, linux-crypto@vger.kernel.org,
 linux-kernel@vger.kernel.org, keyrings@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-security-module@vger.kernel.org
Date: Thu,  3 Sep 2020 21:12:41 +0800
Message-Id: <20200903131242.128665-8-tianjia.zhang@linux.alibaba.com>
X-Mailer: git-send-email 2.19.1.3.ge56e4f7
In-Reply-To: <20200903131242.128665-1-tianjia.zhang@linux.alibaba.com>
References: <20200903131242.128665-1-tianjia.zhang@linux.alibaba.com>
MIME-Version: 1.0
Cc: Xufeng Zhang <yunbo.xufeng@linux.alibaba.com>,
 Tianjia Zhang <tianjia.zhang@linux.alibaba.com>,
 Jia Zhang <zhang.jia@linux.alibaba.com>
Subject: [Linux-stm32] [PATCH v6 7/8] X.509: support OSCCA sm2-with-sm3
	certificate verification
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

The digital certificate format based on SM2 crypto algorithm as
specified in GM/T 0015-2012. It was published by State Encryption
Management Bureau, China.

The method of generating Other User Information is defined as
ZA=H256(ENTLA || IDA || a || b || xG || yG || xA || yA), it also
specified in https://tools.ietf.org/html/draft-shen-sm2-ecdsa-02.

The x509 certificate supports sm2-with-sm3 type certificate
verification.  Because certificate verification requires ZA
in addition to tbs data, ZA also depends on elliptic curve
parameters and public key data, so you need to access tbs in sig
and calculate ZA. Finally calculate the digest of the
signature and complete the verification work. The calculation
process of ZA is declared in specifications GM/T 0009-2012
and GM/T 0003.2-2012.

Signed-off-by: Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
Tested-by: Xufeng Zhang <yunbo.xufeng@linux.alibaba.com>
---
 crypto/asymmetric_keys/Makefile          |  1 +
 crypto/asymmetric_keys/public_key.c      |  6 +++
 crypto/asymmetric_keys/public_key_sm2.c  | 61 ++++++++++++++++++++++++
 crypto/asymmetric_keys/x509_public_key.c |  3 ++
 include/crypto/public_key.h              | 15 ++++++
 5 files changed, 86 insertions(+)
 create mode 100644 crypto/asymmetric_keys/public_key_sm2.c

diff --git a/crypto/asymmetric_keys/Makefile b/crypto/asymmetric_keys/Makefile
index 28b91adba2ae..1a99ea5acb6b 100644
--- a/crypto/asymmetric_keys/Makefile
+++ b/crypto/asymmetric_keys/Makefile
@@ -11,6 +11,7 @@ asymmetric_keys-y := \
 	signature.o
 
 obj-$(CONFIG_ASYMMETRIC_PUBLIC_KEY_SUBTYPE) += public_key.o
+obj-$(CONFIG_ASYMMETRIC_PUBLIC_KEY_SUBTYPE) += public_key_sm2.o
 obj-$(CONFIG_ASYMMETRIC_TPM_KEY_SUBTYPE) += asym_tpm.o
 
 #
diff --git a/crypto/asymmetric_keys/public_key.c b/crypto/asymmetric_keys/public_key.c
index d8410ffd7f12..1d0492098bbd 100644
--- a/crypto/asymmetric_keys/public_key.c
+++ b/crypto/asymmetric_keys/public_key.c
@@ -299,6 +299,12 @@ int public_key_verify_signature(const struct public_key *pkey,
 	if (ret)
 		goto error_free_key;
 
+	if (strcmp(sig->pkey_algo, "sm2") == 0 && sig->data_size) {
+		ret = cert_sig_digest_update(sig, tfm);
+		if (ret)
+			goto error_free_key;
+	}
+
 	sg_init_table(src_sg, 2);
 	sg_set_buf(&src_sg[0], sig->s, sig->s_size);
 	sg_set_buf(&src_sg[1], sig->digest, sig->digest_size);
diff --git a/crypto/asymmetric_keys/public_key_sm2.c b/crypto/asymmetric_keys/public_key_sm2.c
new file mode 100644
index 000000000000..7325cf21dbb4
--- /dev/null
+++ b/crypto/asymmetric_keys/public_key_sm2.c
@@ -0,0 +1,61 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * asymmetric public-key algorithm for SM2-with-SM3 certificate
+ * as specified by OSCCA GM/T 0003.1-2012 -- 0003.5-2012 SM2 and
+ * described at https://tools.ietf.org/html/draft-shen-sm2-ecdsa-02
+ *
+ * Copyright (c) 2020, Alibaba Group.
+ * Authors: Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
+ */
+
+#include <crypto/sm3_base.h>
+#include <crypto/sm2.h>
+#include <crypto/public_key.h>
+
+#if IS_REACHABLE(CONFIG_CRYPTO_SM2)
+
+int cert_sig_digest_update(const struct public_key_signature *sig,
+				struct crypto_akcipher *tfm_pkey)
+{
+	struct crypto_shash *tfm;
+	struct shash_desc *desc;
+	size_t desc_size;
+	unsigned char dgst[SM3_DIGEST_SIZE];
+	int ret;
+
+	BUG_ON(!sig->data);
+
+	ret = sm2_compute_z_digest(tfm_pkey, SM2_DEFAULT_USERID,
+					SM2_DEFAULT_USERID_LEN, dgst);
+	if (ret)
+		return ret;
+
+	tfm = crypto_alloc_shash(sig->hash_algo, 0, 0);
+	if (IS_ERR(tfm))
+		return PTR_ERR(tfm);
+
+	desc_size = crypto_shash_descsize(tfm) + sizeof(*desc);
+	desc = kzalloc(desc_size, GFP_KERNEL);
+	if (!desc)
+		goto error_free_tfm;
+
+	desc->tfm = tfm;
+
+	ret = crypto_shash_init(desc);
+	if (ret < 0)
+		goto error_free_desc;
+
+	ret = crypto_shash_update(desc, dgst, SM3_DIGEST_SIZE);
+	if (ret < 0)
+		goto error_free_desc;
+
+	ret = crypto_shash_finup(desc, sig->data, sig->data_size, sig->digest);
+
+error_free_desc:
+	kfree(desc);
+error_free_tfm:
+	crypto_free_shash(tfm);
+	return ret;
+}
+
+#endif /* ! IS_REACHABLE(CONFIG_CRYPTO_SM2) */
diff --git a/crypto/asymmetric_keys/x509_public_key.c b/crypto/asymmetric_keys/x509_public_key.c
index d964cc82b69c..ae450eb8be14 100644
--- a/crypto/asymmetric_keys/x509_public_key.c
+++ b/crypto/asymmetric_keys/x509_public_key.c
@@ -30,6 +30,9 @@ int x509_get_sig_params(struct x509_certificate *cert)
 
 	pr_devel("==>%s()\n", __func__);
 
+	sig->data = cert->tbs;
+	sig->data_size = cert->tbs_size;
+
 	if (!cert->pub->pkey_algo)
 		cert->unsupported_key = true;
 
diff --git a/include/crypto/public_key.h b/include/crypto/public_key.h
index 11f535cfb810..02a6dbe5c366 100644
--- a/include/crypto/public_key.h
+++ b/include/crypto/public_key.h
@@ -12,6 +12,7 @@
 
 #include <linux/keyctl.h>
 #include <linux/oid_registry.h>
+#include <crypto/akcipher.h>
 
 /*
  * Cryptographic data for the public-key subtype of the asymmetric key type.
@@ -44,6 +45,8 @@ struct public_key_signature {
 	const char *pkey_algo;
 	const char *hash_algo;
 	const char *encoding;
+	const void *data;
+	unsigned int data_size;
 };
 
 extern void public_key_signature_free(struct public_key_signature *sig);
@@ -81,4 +84,16 @@ extern int verify_signature(const struct key *,
 int public_key_verify_signature(const struct public_key *pkey,
 				const struct public_key_signature *sig);
 
+#if IS_REACHABLE(CONFIG_CRYPTO_SM2)
+int cert_sig_digest_update(const struct public_key_signature *sig,
+				struct crypto_akcipher *tfm_pkey);
+#else
+static inline
+int cert_sig_digest_update(const struct public_key_signature *sig,
+				struct crypto_akcipher *tfm_pkey)
+{
+	return -ENOTSUPP;
+}
+#endif
+
 #endif /* _LINUX_PUBLIC_KEY_H */
-- 
2.19.1.3.ge56e4f7

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
