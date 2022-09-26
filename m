Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 45DF85E9DDA
	for <lists+linux-stm32@lfdr.de>; Mon, 26 Sep 2022 11:36:52 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F129DC640FD;
	Mon, 26 Sep 2022 09:36:51 +0000 (UTC)
Received: from out30-56.freemail.mail.aliyun.com
 (out30-56.freemail.mail.aliyun.com [115.124.30.56])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DD8E2C640FD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 Sep 2022 09:36:50 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R161e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046050;
 MF=tianjia.zhang@linux.alibaba.com; NM=1; PH=DS; RN=13; SR=0;
 TI=SMTPD_---0VQkJzHu_1664185006; 
Received: from localhost(mailfrom:tianjia.zhang@linux.alibaba.com
 fp:SMTPD_---0VQkJzHu_1664185006) by smtp.aliyun-inc.com;
 Mon, 26 Sep 2022 17:36:47 +0800
From: Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>,
 Jussi Kivilinna <jussi.kivilinna@iki.fi>, Ard Biesheuvel <ardb@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Eric Biggers <ebiggers@kernel.org>, linux-crypto@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Date: Mon, 26 Sep 2022 17:36:16 +0800
Message-Id: <20220926093620.99898-13-tianjia.zhang@linux.alibaba.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20220926093620.99898-1-tianjia.zhang@linux.alibaba.com>
References: <20220926093620.99898-1-tianjia.zhang@linux.alibaba.com>
MIME-Version: 1.0
Subject: [Linux-stm32] [PATCH 12/16] crypto: arm64/sm4 - add CE
	implementation for ESSIV mode
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

This patch is a CE-optimized assembly implementation for ESSIV mode.
The assembly part is realized by reusing the CBC mode.

Signed-off-by: Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
---
 arch/arm64/crypto/sm4-ce-core.S |  42 +++++++++++
 arch/arm64/crypto/sm4-ce-glue.c | 128 ++++++++++++++++++++++++++++++++
 2 files changed, 170 insertions(+)

diff --git a/arch/arm64/crypto/sm4-ce-core.S b/arch/arm64/crypto/sm4-ce-core.S
index ddd15ec09d38..6b923c3209a0 100644
--- a/arch/arm64/crypto/sm4-ce-core.S
+++ b/arch/arm64/crypto/sm4-ce-core.S
@@ -154,6 +154,26 @@ SYM_FUNC_START(sm4_ce_crypt)
 	ret;
 SYM_FUNC_END(sm4_ce_crypt)
 
+.align 3
+SYM_FUNC_START(sm4_ce_essiv_cbc_enc)
+	/* input:
+	 *   x0: round key array, CTX
+	 *   x1: dst
+	 *   x2: src
+	 *   x3: iv (big endian, 128 bit)
+	 *   w4: nblocks
+	 *   x5: round key array for IV
+	 */
+	ld1		{RIV.16b}, [x3]
+
+	SM4_PREPARE(x5)
+
+	SM4_CRYPT_BLK(RIV)
+
+	SM4_PREPARE(x0)
+
+	b		.Lcbc_enc_loop_4x
+
 .align 3
 SYM_FUNC_START(sm4_ce_cbc_enc)
 	/* input:
@@ -208,6 +228,27 @@ SYM_FUNC_START(sm4_ce_cbc_enc)
 
 	ret
 SYM_FUNC_END(sm4_ce_cbc_enc)
+SYM_FUNC_END(sm4_ce_essiv_cbc_enc)
+
+.align 3
+SYM_FUNC_START(sm4_ce_essiv_cbc_dec)
+	/* input:
+	 *   x0: round key array, CTX
+	 *   x1: dst
+	 *   x2: src
+	 *   x3: iv (big endian, 128 bit)
+	 *   w4: nblocks
+	 *   x5: round key array for IV
+	 */
+	ld1		{RIV.16b}, [x3]
+
+	SM4_PREPARE(x5)
+
+	SM4_CRYPT_BLK(RIV)
+
+	SM4_PREPARE(x0)
+
+	b		.Lcbc_dec_loop_8x
 
 .align 3
 SYM_FUNC_START(sm4_ce_cbc_dec)
@@ -306,6 +347,7 @@ SYM_FUNC_START(sm4_ce_cbc_dec)
 
 	ret
 SYM_FUNC_END(sm4_ce_cbc_dec)
+SYM_FUNC_END(sm4_ce_essiv_cbc_dec)
 
 .align 3
 SYM_FUNC_START(sm4_ce_cbc_cts_enc)
diff --git a/arch/arm64/crypto/sm4-ce-glue.c b/arch/arm64/crypto/sm4-ce-glue.c
index 8222766f712a..6267ec1cfac0 100644
--- a/arch/arm64/crypto/sm4-ce-glue.c
+++ b/arch/arm64/crypto/sm4-ce-glue.c
@@ -19,6 +19,8 @@
 #include <crypto/scatterwalk.h>
 #include <crypto/xts.h>
 #include <crypto/sm4.h>
+#include <crypto/sm3.h>
+#include <crypto/hash.h>
 
 #define BYTES2BLKS(nbytes)	((nbytes) >> 4)
 
@@ -35,6 +37,12 @@ asmlinkage void sm4_ce_cbc_cts_enc(const u32 *rkey, u8 *dst, const u8 *src,
 				   u8 *iv, unsigned int nbytes);
 asmlinkage void sm4_ce_cbc_cts_dec(const u32 *rkey, u8 *dst, const u8 *src,
 				   u8 *iv, unsigned int nbytes);
+asmlinkage void sm4_ce_essiv_cbc_enc(const u32 *rkey1, u8 *dst, const u8 *src,
+				     u8 *iv, unsigned int nblocks,
+				     const u32 *rkey2_enc);
+asmlinkage void sm4_ce_essiv_cbc_dec(const u32 *rkey1, u8 *dst, const u8 *src,
+				     u8 *iv, unsigned int nblocks,
+				     const u32 *rkey2_enc);
 asmlinkage void sm4_ce_cfb_enc(const u32 *rkey, u8 *dst, const u8 *src,
 			       u8 *iv, unsigned int nblks);
 asmlinkage void sm4_ce_cfb_dec(const u32 *rkey, u8 *dst, const u8 *src,
@@ -58,6 +66,12 @@ struct sm4_xts_ctx {
 	struct sm4_ctx key2;
 };
 
+struct sm4_essiv_cbc_ctx {
+	struct sm4_ctx key1;
+	struct sm4_ctx key2;
+	struct crypto_shash *hash;
+};
+
 static int sm4_setkey(struct crypto_skcipher *tfm, const u8 *key,
 		      unsigned int key_len)
 {
@@ -96,6 +110,27 @@ static int sm4_xts_setkey(struct crypto_skcipher *tfm, const u8 *key,
 	return 0;
 }
 
+static int sm4_essiv_cbc_setkey(struct crypto_skcipher *tfm, const u8 *key,
+				unsigned int key_len)
+{
+	struct sm4_essiv_cbc_ctx *ctx = crypto_skcipher_ctx(tfm);
+	u8 __aligned(8) digest[SM3_DIGEST_SIZE];
+
+	if (key_len != SM4_KEY_SIZE)
+		return -EINVAL;
+
+	crypto_shash_tfm_digest(ctx->hash, key, key_len, digest);
+
+	kernel_neon_begin();
+	sm4_ce_expand_key(key, ctx->key1.rkey_enc,
+			  ctx->key1.rkey_dec, crypto_sm4_fk, crypto_sm4_ck);
+	sm4_ce_expand_key(digest, ctx->key2.rkey_enc,
+			  ctx->key2.rkey_dec, crypto_sm4_fk, crypto_sm4_ck);
+	kernel_neon_end();
+
+	return 0;
+}
+
 static int sm4_ecb_do_crypt(struct skcipher_request *req, const u32 *rkey)
 {
 	struct skcipher_walk walk;
@@ -497,6 +532,81 @@ static int sm4_xts_decrypt(struct skcipher_request *req)
 	return sm4_xts_crypt(req, false);
 }
 
+static int sm4_essiv_cbc_init_tfm(struct crypto_skcipher *tfm)
+{
+	struct sm4_essiv_cbc_ctx *ctx = crypto_skcipher_ctx(tfm);
+
+	ctx->hash = crypto_alloc_shash("sm3", 0, 0);
+
+	return PTR_ERR_OR_ZERO(ctx->hash);
+}
+
+static void sm4_essiv_cbc_exit_tfm(struct crypto_skcipher *tfm)
+{
+	struct sm4_essiv_cbc_ctx *ctx = crypto_skcipher_ctx(tfm);
+
+	crypto_free_shash(ctx->hash);
+}
+
+static int sm4_essiv_cbc_crypt(struct skcipher_request *req, bool encrypt)
+{
+	struct crypto_skcipher *tfm = crypto_skcipher_reqtfm(req);
+	struct sm4_essiv_cbc_ctx *ctx = crypto_skcipher_ctx(tfm);
+	struct skcipher_walk walk;
+	unsigned int nblocks;
+	int err;
+
+	err = skcipher_walk_virt(&walk, req, false);
+
+	if ((nblocks = walk.nbytes / SM4_BLOCK_SIZE) > 0) {
+		kernel_neon_begin();
+
+		if (encrypt)
+			sm4_ce_essiv_cbc_enc(ctx->key1.rkey_enc,
+					     walk.dst.virt.addr,
+					     walk.src.virt.addr, walk.iv,
+					     nblocks, ctx->key2.rkey_enc);
+		else
+			sm4_ce_essiv_cbc_dec(ctx->key1.rkey_dec,
+					     walk.dst.virt.addr,
+					     walk.src.virt.addr, walk.iv,
+					     nblocks, ctx->key2.rkey_enc);
+
+		kernel_neon_end();
+
+		err = skcipher_walk_done(&walk, walk.nbytes % SM4_BLOCK_SIZE);
+		if (err)
+			return err;
+	}
+
+	while ((nblocks = walk.nbytes / SM4_BLOCK_SIZE) > 0) {
+		kernel_neon_begin();
+
+		if (encrypt)
+			sm4_ce_cbc_enc(ctx->key1.rkey_enc, walk.dst.virt.addr,
+				       walk.src.virt.addr, walk.iv, nblocks);
+		else
+			sm4_ce_cbc_dec(ctx->key1.rkey_dec, walk.dst.virt.addr,
+				       walk.src.virt.addr, walk.iv, nblocks);
+
+		kernel_neon_end();
+
+		err = skcipher_walk_done(&walk, walk.nbytes % SM4_BLOCK_SIZE);
+	}
+
+	return err;
+}
+
+static int sm4_essiv_cbc_encrypt(struct skcipher_request *req)
+{
+	return sm4_essiv_cbc_crypt(req, true);
+}
+
+static int sm4_essiv_cbc_decrypt(struct skcipher_request *req)
+{
+	return sm4_essiv_cbc_crypt(req, false);
+}
+
 static struct skcipher_alg sm4_algs[] = {
 	{
 		.base = {
@@ -591,6 +701,23 @@ static struct skcipher_alg sm4_algs[] = {
 		.setkey		= sm4_xts_setkey,
 		.encrypt	= sm4_xts_encrypt,
 		.decrypt	= sm4_xts_decrypt,
+	}, {
+		.base = {
+			.cra_name		= "essiv(cbc(sm4),sm3)",
+			.cra_driver_name	= "essiv-cbc-sm4-sm3-ce",
+			.cra_priority		= 400 + 1,
+			.cra_blocksize		= SM4_BLOCK_SIZE,
+			.cra_ctxsize		= sizeof(struct sm4_essiv_cbc_ctx),
+			.cra_module		= THIS_MODULE,
+		},
+		.min_keysize	= SM4_KEY_SIZE,
+		.max_keysize	= SM4_KEY_SIZE,
+		.ivsize		= SM4_BLOCK_SIZE,
+		.setkey		= sm4_essiv_cbc_setkey,
+		.encrypt	= sm4_essiv_cbc_encrypt,
+		.decrypt	= sm4_essiv_cbc_decrypt,
+		.init		= sm4_essiv_cbc_init_tfm,
+		.exit		= sm4_essiv_cbc_exit_tfm,
 	}
 };
 
@@ -616,5 +743,6 @@ MODULE_ALIAS_CRYPTO("cfb(sm4)");
 MODULE_ALIAS_CRYPTO("ctr(sm4)");
 MODULE_ALIAS_CRYPTO("cts(cbc(sm4))");
 MODULE_ALIAS_CRYPTO("xts(sm4)");
+MODULE_ALIAS_CRYPTO("essiv(cbc(sm4),sm3)");
 MODULE_AUTHOR("Tianjia Zhang <tianjia.zhang@linux.alibaba.com>");
 MODULE_LICENSE("GPL v2");
-- 
2.24.3 (Apple Git-128)

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
