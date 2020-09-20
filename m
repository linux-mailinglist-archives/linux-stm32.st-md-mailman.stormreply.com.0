Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EC7B32715B3
	for <lists+linux-stm32@lfdr.de>; Sun, 20 Sep 2020 18:21:25 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ABE40C424BD;
	Sun, 20 Sep 2020 16:21:25 +0000 (UTC)
Received: from out30-133.freemail.mail.aliyun.com
 (out30-133.freemail.mail.aliyun.com [115.124.30.133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DF33AC424B0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 20 Sep 2020 16:21:21 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R271e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04357;
 MF=tianjia.zhang@linux.alibaba.com; NM=1; PH=DS; RN=34; SR=0;
 TI=SMTPD_---0U9VME2v_1600618867; 
Received: from localhost(mailfrom:tianjia.zhang@linux.alibaba.com
 fp:SMTPD_---0U9VME2v_1600618867) by smtp.aliyun-inc.com(127.0.0.1);
 Mon, 21 Sep 2020 00:21:08 +0800
From: Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>,
 David Howells <dhowells@redhat.com>, Eric Biggers <ebiggers@google.com>,
 Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
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
 keyrings@vger.kernel.org, linux-integrity@vger.kernel.org,
 linux-security-module@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Mon, 21 Sep 2020 00:21:00 +0800
Message-Id: <20200920162103.83197-8-tianjia.zhang@linux.alibaba.com>
X-Mailer: git-send-email 2.19.1.3.ge56e4f7
In-Reply-To: <20200920162103.83197-1-tianjia.zhang@linux.alibaba.com>
References: <20200920162103.83197-1-tianjia.zhang@linux.alibaba.com>
MIME-Version: 1.0
Cc: Xufeng Zhang <yunbo.xufeng@linux.alibaba.com>,
 Tianjia Zhang <tianjia.zhang@linux.alibaba.com>,
 Jia Zhang <zhang.jia@linux.alibaba.com>
Subject: [Linux-stm32] [PATCH v7 07/10] crypto: sm2 - add SM2 test vectors
	to testmgr
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

Add testmgr test vectors for SM2 algorithm. These vectors come
from `openssl pkeyutl -sign` and libgcrypt.

Signed-off-by: Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
Tested-by: Xufeng Zhang <yunbo.xufeng@linux.alibaba.com>
---
 crypto/testmgr.c |  6 +++++
 crypto/testmgr.h | 59 ++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 65 insertions(+)

diff --git a/crypto/testmgr.c b/crypto/testmgr.c
index ed8e29efe280..1317a63172d0 100644
--- a/crypto/testmgr.c
+++ b/crypto/testmgr.c
@@ -5384,6 +5384,12 @@ static const struct alg_test_desc alg_test_descs[] = {
 		.suite = {
 			.hash = __VECS(sha512_tv_template)
 		}
+	}, {
+		.alg = "sm2",
+		.test = alg_test_akcipher,
+		.suite = {
+			.akcipher = __VECS(sm2_tv_template)
+		}
 	}, {
 		.alg = "sm3",
 		.test = alg_test_hash,
diff --git a/crypto/testmgr.h b/crypto/testmgr.h
index b9a2d73d9f8d..8c83811c0e35 100644
--- a/crypto/testmgr.h
+++ b/crypto/testmgr.h
@@ -3792,6 +3792,65 @@ static const struct hash_testvec hmac_streebog512_tv_template[] = {
 	},
 };
 
+/*
+ * SM2 test vectors.
+ */
+static const struct akcipher_testvec sm2_tv_template[] = {
+	{ /* Generated from openssl */
+	.key =
+	"\x04"
+	"\x8e\xa0\x33\x69\x91\x7e\x3d\xec\xad\x8e\xf0\x45\x5e\x13\x3e\x68"
+	"\x5b\x8c\xab\x5c\xc6\xc8\x50\xdf\x91\x00\xe0\x24\x73\x4d\x31\xf2"
+	"\x2e\xc0\xd5\x6b\xee\xda\x98\x93\xec\xd8\x36\xaa\xb9\xcf\x63\x82"
+	"\xef\xa7\x1a\x03\xed\x16\xba\x74\xb8\x8b\xf9\xe5\x70\x39\xa4\x70",
+	.key_len = 65,
+	.param_len = 0,
+	.c =
+	"\x30\x45"
+	"\x02\x20"
+	"\x70\xab\xb6\x7d\xd6\x54\x80\x64\x42\x7e\x2d\x05\x08\x36\xc9\x96"
+	"\x25\xc2\xbb\xff\x08\xe5\x43\x15\x5e\xf3\x06\xd9\x2b\x2f\x0a\x9f"
+	"\x02\x21"
+	"\x00"
+	"\xbf\x21\x5f\x7e\x5d\x3f\x1a\x4d\x8f\x84\xc2\xe9\xa6\x4c\xa4\x18"
+	"\xb2\xb8\x46\xf4\x32\x96\xfa\x57\xc6\x29\xd4\x89\xae\xcc\xda\xdb",
+	.c_size = 71,
+	.algo = OID_SM2_with_SM3,
+	.m =
+	"\x47\xa7\xbf\xd3\xda\xc4\x79\xee\xda\x8b\x4f\xe8\x40\x94\xd4\x32"
+	"\x8f\xf1\xcd\x68\x4d\xbd\x9b\x1d\xe0\xd8\x9a\x5d\xad\x85\x47\x5c",
+	.m_size = 32,
+	.public_key_vec = true,
+	.siggen_sigver_test = true,
+	},
+	{ /* From libgcrypt */
+	.key =
+	"\x04"
+	"\x87\x59\x38\x9a\x34\xaa\xad\x07\xec\xf4\xe0\xc8\xc2\x65\x0a\x44"
+	"\x59\xc8\xd9\x26\xee\x23\x78\x32\x4e\x02\x61\xc5\x25\x38\xcb\x47"
+	"\x75\x28\x10\x6b\x1e\x0b\x7c\x8d\xd5\xff\x29\xa9\xc8\x6a\x89\x06"
+	"\x56\x56\xeb\x33\x15\x4b\xc0\x55\x60\x91\xef\x8a\xc9\xd1\x7d\x78",
+	.key_len = 65,
+	.param_len = 0,
+	.c =
+	"\x30\x44"
+	"\x02\x20"
+	"\xd9\xec\xef\xe8\x5f\xee\x3c\x59\x57\x8e\x5b\xab\xb3\x02\xe1\x42"
+	"\x4b\x67\x2c\x0b\x26\xb6\x51\x2c\x3e\xfc\xc6\x49\xec\xfe\x89\xe5"
+	"\x02\x20"
+	"\x43\x45\xd0\xa5\xff\xe5\x13\x27\x26\xd0\xec\x37\xad\x24\x1e\x9a"
+	"\x71\x9a\xa4\x89\xb0\x7e\x0f\xc4\xbb\x2d\x50\xd0\xe5\x7f\x7a\x68",
+	.c_size = 70,
+	.algo = OID_SM2_with_SM3,
+	.m =
+	"\x11\x22\x33\x44\x55\x66\x77\x88\x99\xaa\xbb\xcc\xdd\xee\xff\x00"
+	"\x12\x34\x56\x78\x9a\xbc\xde\xf0\x12\x34\x56\x78\x9a\xbc\xde\xf0",
+	.m_size = 32,
+	.public_key_vec = true,
+	.siggen_sigver_test = true,
+	},
+};
+
 /* Example vectors below taken from
  * http://www.oscca.gov.cn/UpFile/20101222141857786.pdf
  *
-- 
2.19.1.3.ge56e4f7

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
