Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F0AE12715BC
	for <lists+linux-stm32@lfdr.de>; Sun, 20 Sep 2020 18:21:53 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BD9ACC424B0;
	Sun, 20 Sep 2020 16:21:53 +0000 (UTC)
Received: from out30-130.freemail.mail.aliyun.com
 (out30-130.freemail.mail.aliyun.com [115.124.30.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3FF12C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 20 Sep 2020 16:21:52 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R181e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04423;
 MF=tianjia.zhang@linux.alibaba.com; NM=1; PH=DS; RN=34; SR=0;
 TI=SMTPD_---0U9VME2p_1600618867; 
Received: from localhost(mailfrom:tianjia.zhang@linux.alibaba.com
 fp:SMTPD_---0U9VME2p_1600618867) by smtp.aliyun-inc.com(127.0.0.1);
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
Date: Mon, 21 Sep 2020 00:20:59 +0800
Message-Id: <20200920162103.83197-7-tianjia.zhang@linux.alibaba.com>
X-Mailer: git-send-email 2.19.1.3.ge56e4f7
In-Reply-To: <20200920162103.83197-1-tianjia.zhang@linux.alibaba.com>
References: <20200920162103.83197-1-tianjia.zhang@linux.alibaba.com>
MIME-Version: 1.0
Cc: Xufeng Zhang <yunbo.xufeng@linux.alibaba.com>,
 Tianjia Zhang <tianjia.zhang@linux.alibaba.com>,
 Jia Zhang <zhang.jia@linux.alibaba.com>
Subject: [Linux-stm32] [PATCH v7 06/10] crypto: testmgr - Fix potential
	memory leak in test_akcipher_one()
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

When the 'key' allocation fails, the 'req' will not be released,
which will cause memory leakage on this path. This patch adds a
'free_req' tag used to solve this problem, and two new err values
are added to reflect the real reason of the error.

Signed-off-by: Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
---
 crypto/testmgr.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/crypto/testmgr.c b/crypto/testmgr.c
index cd002a030af5..ed8e29efe280 100644
--- a/crypto/testmgr.c
+++ b/crypto/testmgr.c
@@ -3954,7 +3954,7 @@ static int test_akcipher_one(struct crypto_akcipher *tfm,
 	key = kmalloc(vecs->key_len + sizeof(u32) * 2 + vecs->param_len,
 		      GFP_KERNEL);
 	if (!key)
-		goto free_xbuf;
+		goto free_req;
 	memcpy(key, vecs->key, vecs->key_len);
 	ptr = key + vecs->key_len;
 	ptr = test_pack_u32(ptr, vecs->algo);
@@ -3966,7 +3966,7 @@ static int test_akcipher_one(struct crypto_akcipher *tfm,
 	else
 		err = crypto_akcipher_set_priv_key(tfm, key, vecs->key_len);
 	if (err)
-		goto free_req;
+		goto free_key;
 
 	/*
 	 * First run test which do not require a private key, such as
@@ -3976,7 +3976,7 @@ static int test_akcipher_one(struct crypto_akcipher *tfm,
 	out_len_max = crypto_akcipher_maxsize(tfm);
 	outbuf_enc = kzalloc(out_len_max, GFP_KERNEL);
 	if (!outbuf_enc)
-		goto free_req;
+		goto free_key;
 
 	if (!vecs->siggen_sigver_test) {
 		m = vecs->m;
@@ -3995,6 +3995,7 @@ static int test_akcipher_one(struct crypto_akcipher *tfm,
 		op = "verify";
 	}
 
+	err = -E2BIG;
 	if (WARN_ON(m_size > PAGE_SIZE))
 		goto free_all;
 	memcpy(xbuf[0], m, m_size);
@@ -4061,6 +4062,7 @@ static int test_akcipher_one(struct crypto_akcipher *tfm,
 		c_size = req->dst_len;
 	}
 
+	err = -E2BIG;
 	op = vecs->siggen_sigver_test ? "sign" : "decrypt";
 	if (WARN_ON(c_size > PAGE_SIZE))
 		goto free_all;
@@ -4097,9 +4099,10 @@ static int test_akcipher_one(struct crypto_akcipher *tfm,
 free_all:
 	kfree(outbuf_dec);
 	kfree(outbuf_enc);
+free_key:
+	kfree(key);
 free_req:
 	akcipher_request_free(req);
-	kfree(key);
 free_xbuf:
 	testmgr_free_buf(xbuf);
 	return err;
-- 
2.19.1.3.ge56e4f7

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
