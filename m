Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C2072715A6
	for <lists+linux-stm32@lfdr.de>; Sun, 20 Sep 2020 18:21:15 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2A4F0C3FAD4;
	Sun, 20 Sep 2020 16:21:15 +0000 (UTC)
Received: from out30-54.freemail.mail.aliyun.com
 (out30-54.freemail.mail.aliyun.com [115.124.30.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 90090C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 20 Sep 2020 16:21:12 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R201e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e01424;
 MF=tianjia.zhang@linux.alibaba.com; NM=1; PH=DS; RN=34; SR=0;
 TI=SMTPD_---0U9VME2i_1600618866; 
Received: from localhost(mailfrom:tianjia.zhang@linux.alibaba.com
 fp:SMTPD_---0U9VME2i_1600618866) by smtp.aliyun-inc.com(127.0.0.1);
 Mon, 21 Sep 2020 00:21:07 +0800
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
Date: Mon, 21 Sep 2020 00:20:58 +0800
Message-Id: <20200920162103.83197-6-tianjia.zhang@linux.alibaba.com>
X-Mailer: git-send-email 2.19.1.3.ge56e4f7
In-Reply-To: <20200920162103.83197-1-tianjia.zhang@linux.alibaba.com>
References: <20200920162103.83197-1-tianjia.zhang@linux.alibaba.com>
MIME-Version: 1.0
Cc: Xufeng Zhang <yunbo.xufeng@linux.alibaba.com>,
 Tianjia Zhang <tianjia.zhang@linux.alibaba.com>,
 Jia Zhang <zhang.jia@linux.alibaba.com>
Subject: [Linux-stm32] [PATCH v7 05/10] crypto: testmgr - support test with
	different ciphertext per encryption
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

Some asymmetric algorithms will get different ciphertext after
each encryption, such as SM2, and let testmgr support the testing
of such algorithms.

In struct akcipher_testvec, set c and c_size to be empty, skip
the comparison of the ciphertext, and compare the decrypted
plaintext with m to achieve the test purpose.

Signed-off-by: Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
Tested-by: Xufeng Zhang <yunbo.xufeng@linux.alibaba.com>
---
 crypto/testmgr.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/crypto/testmgr.c b/crypto/testmgr.c
index 23c27fc96394..cd002a030af5 100644
--- a/crypto/testmgr.c
+++ b/crypto/testmgr.c
@@ -4025,7 +4025,7 @@ static int test_akcipher_one(struct crypto_akcipher *tfm,
 		pr_err("alg: akcipher: %s test failed. err %d\n", op, err);
 		goto free_all;
 	}
-	if (!vecs->siggen_sigver_test) {
+	if (!vecs->siggen_sigver_test && c) {
 		if (req->dst_len != c_size) {
 			pr_err("alg: akcipher: %s test failed. Invalid output len\n",
 			       op);
@@ -4056,6 +4056,11 @@ static int test_akcipher_one(struct crypto_akcipher *tfm,
 		goto free_all;
 	}
 
+	if (!vecs->siggen_sigver_test && !c) {
+		c = outbuf_enc;
+		c_size = req->dst_len;
+	}
+
 	op = vecs->siggen_sigver_test ? "sign" : "decrypt";
 	if (WARN_ON(c_size > PAGE_SIZE))
 		goto free_all;
-- 
2.19.1.3.ge56e4f7

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
