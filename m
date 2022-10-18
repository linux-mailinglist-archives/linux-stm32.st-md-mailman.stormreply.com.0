Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 25568602527
	for <lists+linux-stm32@lfdr.de>; Tue, 18 Oct 2022 09:10:43 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D8606C65048;
	Tue, 18 Oct 2022 07:10:42 +0000 (UTC)
Received: from out30-45.freemail.mail.aliyun.com
 (out30-45.freemail.mail.aliyun.com [115.124.30.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 453C1C65040
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Oct 2022 07:10:41 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R171e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046050;
 MF=tianjia.zhang@linux.alibaba.com; NM=1; PH=DS; RN=15; SR=0;
 TI=SMTPD_---0VSTUHcm_1666077032; 
Received: from localhost(mailfrom:tianjia.zhang@linux.alibaba.com
 fp:SMTPD_---0VSTUHcm_1666077032) by smtp.aliyun-inc.com;
 Tue, 18 Oct 2022 15:10:34 +0800
From: Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>,
 Jussi Kivilinna <jussi.kivilinna@iki.fi>, Ard Biesheuvel <ardb@kernel.org>,
 Mark Brown <broonie@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Eric Biggers <ebiggers@kernel.org>, linux-crypto@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Date: Tue, 18 Oct 2022 15:10:02 +0800
Message-Id: <20221018071006.5717-12-tianjia.zhang@linux.alibaba.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20221018071006.5717-1-tianjia.zhang@linux.alibaba.com>
References: <20221018071006.5717-1-tianjia.zhang@linux.alibaba.com>
MIME-Version: 1.0
Cc: Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
Subject: [Linux-stm32] [PATCH v2 11/15] crypto: essiv - allow digestsize to
	be greater than keysize
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

In essiv mode, the digest of the hash algorithm is used as the key to
encrypt the IV. The current implementation requires that the digest size
of the hash algorithm is equal to the key size, which will exclude
algorithms that do not meet this situation, such as essiv(cbc(sm4),sm3),
the hash result of sm3 is fixed 256 bits, and the key size of sm4
symmetric algorithm is fixed 128 bits, which makes it impossible to use
essiv mode.

This patch allows algorithms whose digest size is greater than key size
to use esssiv mode by truncating the digest.

Signed-off-by: Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
---
 crypto/essiv.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/crypto/essiv.c b/crypto/essiv.c
index e33369df9034..6ee5a61bcae4 100644
--- a/crypto/essiv.c
+++ b/crypto/essiv.c
@@ -68,6 +68,7 @@ static int essiv_skcipher_setkey(struct crypto_skcipher *tfm,
 {
 	struct essiv_tfm_ctx *tctx = crypto_skcipher_ctx(tfm);
 	u8 salt[HASH_MAX_DIGESTSIZE];
+	unsigned int saltlen;
 	int err;
 
 	crypto_skcipher_clear_flags(tctx->u.skcipher, CRYPTO_TFM_REQ_MASK);
@@ -86,8 +87,11 @@ static int essiv_skcipher_setkey(struct crypto_skcipher *tfm,
 	crypto_cipher_set_flags(tctx->essiv_cipher,
 				crypto_skcipher_get_flags(tfm) &
 				CRYPTO_TFM_REQ_MASK);
-	return crypto_cipher_setkey(tctx->essiv_cipher, salt,
-				    crypto_shash_digestsize(tctx->hash));
+
+	saltlen = min(crypto_shash_digestsize(tctx->hash),
+		      crypto_skcipher_max_keysize(tctx->u.skcipher));
+
+	return crypto_cipher_setkey(tctx->essiv_cipher, salt, saltlen);
 }
 
 static int essiv_aead_setkey(struct crypto_aead *tfm, const u8 *key,
@@ -418,8 +422,7 @@ static bool essiv_supported_algorithms(const char *essiv_cipher_name,
 	if (IS_ERR(alg))
 		return false;
 
-	if (hash_alg->digestsize < alg->cra_cipher.cia_min_keysize ||
-	    hash_alg->digestsize > alg->cra_cipher.cia_max_keysize)
+	if (hash_alg->digestsize < alg->cra_cipher.cia_min_keysize)
 		goto out;
 
 	if (ivsize != alg->cra_blocksize)
-- 
2.24.3 (Apple Git-128)

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
