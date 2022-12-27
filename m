Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A94276570AE
	for <lists+linux-stm32@lfdr.de>; Wed, 28 Dec 2022 00:04:29 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6CDB1C65E6A;
	Tue, 27 Dec 2022 23:04:29 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1F0B4C65E60
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Dec 2022 23:04:28 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id z7so9400425ljq.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Dec 2022 15:04:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=OxwLhFhfNIuz+1mR/Kv4hIwnD/2AOjgv0h1XByo/1HU=;
 b=LPoxGD/ohOEBIE4o3f04Mih6UuSnTcS3lnU29OTB6KJjNVsPIYG1+rqASBkh62dhkK
 BvFCdkfL0/xGzvtpBZhAHgpZHqc5eGCzeEd4nLau8G6UlSFcxnnJCar6e3fAY7oBND9A
 NM87bMO5x/x1FaykeLyzY/6f7W+PQKTYeTUnKCpRK8JgrnAJ/AnydWYoW2HYWFB41OG1
 1RDNAdt9DhW/7fXFLTRnM0CjeHljgxyFCe6bh/5vu+gkRrewok0isuY5ROPYPytkXp8C
 +LIsWIC4cuwkIrFGi3tz5UEy1tRUOkhx2R7bodAALiUUz+okkJpXhwk4+3WgfN74yKey
 80wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OxwLhFhfNIuz+1mR/Kv4hIwnD/2AOjgv0h1XByo/1HU=;
 b=d4D1gRoMoAeY7PPE03dLmBqqSCxbeqqmBHxyXcb37GDDzGg5WTFs/QNzIBgr9BXeXn
 U5hwWGRTfPC9AbrO4b/5PGD0awDN1y7pm8IT7GyzrTmxQEgM05d0cdW+riH0Dgx3/kHb
 7ZSVfG25nMTaeuuzZje9yGh8E3mzdUDiI4/0KmNlEo8uh6l4Yr2cUi2LYZUTjMFk5sY+
 91Oj3ODhPE8Bzin1lXkUTBVPRWSxHbldVwzlAnw0Ihvwy5Dv+/+Ox+vyH3T9gXSCS1mg
 643ROhalTWmmZbgOJDlVoAvaQlrYgU/liOwy0EJuLCQ/ptLsxvtp6aRnjNGZEViWAvjZ
 x/QA==
X-Gm-Message-State: AFqh2kpA9d6olBphlMZWvMD/UXfYMLxQOeZ7G3bdDNwRpaQMn3ZBBZyd
 Td9VLqqv17ABwGqDNk1ftlxHJA==
X-Google-Smtp-Source: AMrXdXtCEG6yWcX83rWb8m7Gbv+Jtn1fdc4w9dirDZ2W9mouTUOkFVnxeHLovXDheP8TjlWgdARmkA==
X-Received: by 2002:a05:651c:2321:b0:279:c27a:1335 with SMTP id
 bi33-20020a05651c232100b00279c27a1335mr6173335ljb.33.1672182267484; 
 Tue, 27 Dec 2022 15:04:27 -0800 (PST)
Received: from Fecusia.local (c-05d8225c.014-348-6c756e10.bbcust.telenor.se.
 [92.34.216.5]) by smtp.gmail.com with ESMTPSA id
 bg25-20020a05651c0b9900b0027fbd4ee003sm876925ljb.124.2022.12.27.15.04.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Dec 2022 15:04:21 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 28 Dec 2022 00:03:38 +0100
MIME-Version: 1.0
Message-Id: <20221227-ux500-stm32-hash-v1-6-b637ac4cda01@linaro.org>
References: <20221227-ux500-stm32-hash-v1-0-b637ac4cda01@linaro.org>
In-Reply-To: <20221227-ux500-stm32-hash-v1-0-b637ac4cda01@linaro.org>
To: Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Lionel Debieve <lionel.debieve@foss.st.com>
X-Mailer: b4 0.11.1
Cc: devicetree@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>,
 linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 6/7] crypto: stm32/hash: Support Ux500 hash
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

The Ux500 has a hash block which is an ancestor to the STM32
hash block. With some minor code path additions we can
support also this variant in the STM32 driver. Differences:

- Ux500 only supports SHA1 and SHA256 (+/- MAC) so we split
  up the algorithm registration per-algorithm and register
  each algorithm along with its MAC variant separately.

- Ux500 does not have an interrupt to indicate that hash
  calculation is complete, so we add code paths to handle
  polling for completion if the interrupt is missing in the
  device tree.

- Ux500 is lacking the SR status register, to check if an
  operating is complete, we need to poll the HASH_STR_DCAL
  bit in the HASH_STR register instead.

- Ux500 had the resulting has at address offset 0x0c and
  8 32bit registers ahead. We account for this with a special
  code path when reading out the hash digest.

- Ux500 need a special bit set in the control register before
  performing the final hash calculation on an empty message.

- Ux500 hashes on empty messages will be performed if the
  above bit is set, but are incorrect. For this reason we
  just make an inline synchronous hash using a fallback
  hash.

Tested on the Ux500 Golden device with the extended tests.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/crypto/stm32/stm32-hash.c | 231 ++++++++++++++++++++++++++++++++------
 1 file changed, 197 insertions(+), 34 deletions(-)

diff --git a/drivers/crypto/stm32/stm32-hash.c b/drivers/crypto/stm32/stm32-hash.c
index 92b2d55d6e93..5dd7308f8adb 100644
--- a/drivers/crypto/stm32/stm32-hash.c
+++ b/drivers/crypto/stm32/stm32-hash.c
@@ -32,9 +32,11 @@
 #define HASH_CR				0x00
 #define HASH_DIN			0x04
 #define HASH_STR			0x08
+#define HASH_UX500_HREG(x)		(0x0c + ((x) * 0x04))
 #define HASH_IMR			0x20
 #define HASH_SR				0x24
 #define HASH_CSR(x)			(0x0F8 + ((x) * 0x04))
+
 #define HASH_HREG(x)			(0x310 + ((x) * 0x04))
 #define HASH_HWCFGR			0x3F0
 #define HASH_VER			0x3F4
@@ -54,6 +56,10 @@
 #define HASH_CR_ALGO_SHA224		0x40000
 #define HASH_CR_ALGO_SHA256		0x40080
 
+#define HASH_CR_UX500_EMPTYMSG		BIT(20)
+#define HASH_CR_UX500_ALGO_SHA1		BIT(7)
+#define HASH_CR_UX500_ALGO_SHA256	0x0
+
 /* Interrupt */
 #define HASH_DINIE			BIT(0)
 #define HASH_DCIE			BIT(1)
@@ -157,6 +163,10 @@ struct stm32_hash_algs_info {
 struct stm32_hash_pdata {
 	struct stm32_hash_algs_info	*algs_info;
 	size_t				algs_info_size;
+	bool				has_sr;
+	bool				has_mdma;
+	bool				broken_emptymsg;
+	bool				ux500;
 };
 
 struct stm32_hash_dev {
@@ -168,6 +178,7 @@ struct stm32_hash_dev {
 	phys_addr_t		phys_base;
 	bool			dma_mode;
 	u32			dma_maxburst;
+	bool			polled;
 
 	struct ahash_request	*req;
 	struct crypto_engine	*engine;
@@ -208,6 +219,11 @@ static inline int stm32_hash_wait_busy(struct stm32_hash_dev *hdev)
 {
 	u32 status;
 
+	/* The Ux500 lacks the special status register, we poll the DCAL bit instead */
+	if (!hdev->pdata->has_sr)
+		return readl_relaxed_poll_timeout(hdev->io_base + HASH_STR, status,
+						  !(status & HASH_STR_DCAL), 10, 10000);
+
 	return readl_relaxed_poll_timeout(hdev->io_base + HASH_SR, status,
 				   !(status & HASH_SR_BUSY), 10, 10000);
 }
@@ -249,7 +265,7 @@ static int stm32_hash_write_key(struct stm32_hash_dev *hdev)
 	return 0;
 }
 
-static void stm32_hash_write_ctrl(struct stm32_hash_dev *hdev)
+static void stm32_hash_write_ctrl(struct stm32_hash_dev *hdev, int bufcnt)
 {
 	struct stm32_hash_request_ctx *rctx = ahash_request_ctx(hdev->req);
 	struct crypto_ahash *tfm = crypto_ahash_reqtfm(hdev->req);
@@ -263,13 +279,19 @@ static void stm32_hash_write_ctrl(struct stm32_hash_dev *hdev)
 			reg |= HASH_CR_ALGO_MD5;
 			break;
 		case HASH_FLAGS_SHA1:
-			reg |= HASH_CR_ALGO_SHA1;
+			if (hdev->pdata->ux500)
+				reg |= HASH_CR_UX500_ALGO_SHA1;
+			else
+				reg |= HASH_CR_ALGO_SHA1;
 			break;
 		case HASH_FLAGS_SHA224:
 			reg |= HASH_CR_ALGO_SHA224;
 			break;
 		case HASH_FLAGS_SHA256:
-			reg |= HASH_CR_ALGO_SHA256;
+			if (hdev->pdata->ux500)
+				reg |= HASH_CR_UX500_ALGO_SHA256;
+			else
+				reg |= HASH_CR_ALGO_SHA256;
 			break;
 		default:
 			reg |= HASH_CR_ALGO_MD5;
@@ -284,7 +306,15 @@ static void stm32_hash_write_ctrl(struct stm32_hash_dev *hdev)
 				reg |= HASH_CR_LKEY;
 		}
 
-		stm32_hash_write(hdev, HASH_IMR, HASH_DCIE);
+		/*
+		 * On the Ux500 we need to set a special flag to indicate that
+		 * the message is zero length.
+		 */
+		if (hdev->pdata->ux500 && bufcnt == 0)
+			reg |= HASH_CR_UX500_EMPTYMSG;
+
+		if (!hdev->polled)
+			stm32_hash_write(hdev, HASH_IMR, HASH_DCIE);
 
 		stm32_hash_write(hdev, HASH_CR, reg);
 
@@ -345,7 +375,7 @@ static int stm32_hash_xmit_cpu(struct stm32_hash_dev *hdev,
 
 	hdev->flags |= HASH_FLAGS_CPU;
 
-	stm32_hash_write_ctrl(hdev);
+	stm32_hash_write_ctrl(hdev, length);
 
 	if (stm32_hash_wait_busy(hdev))
 		return -ETIMEDOUT;
@@ -366,6 +396,7 @@ static int stm32_hash_xmit_cpu(struct stm32_hash_dev *hdev,
 			return -ETIMEDOUT;
 
 		stm32_hash_set_nblw(hdev, length);
+
 		reg = stm32_hash_read(hdev, HASH_STR);
 		reg |= HASH_STR_DCAL;
 		stm32_hash_write(hdev, HASH_STR, reg);
@@ -403,6 +434,14 @@ static int stm32_hash_update_cpu(struct stm32_hash_dev *hdev)
 		bufcnt = rctx->bufcnt;
 		rctx->bufcnt = 0;
 		err = stm32_hash_xmit_cpu(hdev, rctx->buffer, bufcnt, 1);
+
+		/* If we have an IRQ, wait for that, else poll for completion */
+		if (hdev->polled) {
+			if (stm32_hash_wait_busy(hdev))
+				return -ETIMEDOUT;
+			hdev->flags |= HASH_FLAGS_OUTPUT_READY;
+			err = 0;
+		}
 	}
 
 	return err;
@@ -433,11 +472,12 @@ static int stm32_hash_xmit_dma(struct stm32_hash_dev *hdev,
 
 	reg = stm32_hash_read(hdev, HASH_CR);
 
-	if (mdma)
-		reg |= HASH_CR_MDMAT;
-	else
-		reg &= ~HASH_CR_MDMAT;
-
+	if (!hdev->pdata->has_mdma) {
+		if (mdma)
+			reg |= HASH_CR_MDMAT;
+		else
+			reg &= ~HASH_CR_MDMAT;
+	}
 	reg |= HASH_CR_DMAE;
 
 	stm32_hash_write(hdev, HASH_CR, reg);
@@ -558,7 +598,7 @@ static int stm32_hash_dma_send(struct stm32_hash_dev *hdev)
 	if (rctx->nents < 0)
 		return -EINVAL;
 
-	stm32_hash_write_ctrl(hdev);
+	stm32_hash_write_ctrl(hdev, rctx->total);
 
 	if (hdev->flags & HASH_FLAGS_HMAC) {
 		err = stm32_hash_hmac_dma_send(hdev);
@@ -745,16 +785,75 @@ static int stm32_hash_final_req(struct stm32_hash_dev *hdev)
 	else
 		err = stm32_hash_xmit_cpu(hdev, rctx->buffer, buflen, 1);
 
+	/* If we have an IRQ, wait for that, else poll for completion */
+	if (hdev->polled) {
+		if (stm32_hash_wait_busy(hdev))
+			return -ETIMEDOUT;
+		hdev->flags |= HASH_FLAGS_OUTPUT_READY;
+		/* Caller will call stm32_hash_finish_req() */
+		err = 0;
+	}
 
 	return err;
 }
 
+static void stm32_hash_emptymsg_fallback(struct ahash_request *req)
+{
+	struct crypto_ahash *ahash = crypto_ahash_reqtfm(req);
+	struct stm32_hash_ctx *ctx = crypto_ahash_ctx(ahash);
+	struct stm32_hash_request_ctx *rctx = ahash_request_ctx(req);
+	struct stm32_hash_dev *hdev = rctx->hdev;
+	struct crypto_shash *xtfm;
+	struct shash_desc *sdesc;
+	size_t len;
+	int ret;
+
+	dev_dbg(hdev->dev, "use fallback message size 0 key size %d\n", ctx->keylen);
+	xtfm = crypto_alloc_shash(crypto_ahash_alg_name(ahash),
+				  0, CRYPTO_ALG_NEED_FALLBACK);
+	if (IS_ERR(xtfm)) {
+		dev_err(hdev->dev, "failed to allocate syncronous fallback\n");
+		return;
+	}
+
+	len = sizeof(*sdesc) + crypto_shash_descsize(xtfm);
+	sdesc = kmalloc(len, GFP_KERNEL);
+	if (!sdesc)
+		goto err_hashkey_sdesc;
+	sdesc->tfm = xtfm;
+
+	if (ctx->keylen) {
+		ret = crypto_shash_setkey(xtfm, ctx->key, ctx->keylen);
+		if (ret) {
+			dev_err(hdev->dev, "failed to set key ret=%d\n", ret);
+			goto err_hashkey_sdesc;
+		}
+	}
+
+	ret = crypto_shash_init(sdesc);
+	if (ret) {
+		dev_err(hdev->dev, "shash init error ret=%d\n", ret);
+		goto err_hashkey;
+	}
+	ret = crypto_shash_finup(sdesc, NULL, 0, rctx->digest);
+	if (ret)
+		dev_err(hdev->dev, "shash finup error\n");
+err_hashkey:
+	kfree(sdesc);
+err_hashkey_sdesc:
+	crypto_free_shash(xtfm);
+}
+
 static void stm32_hash_copy_hash(struct ahash_request *req)
 {
 	struct stm32_hash_request_ctx *rctx = ahash_request_ctx(req);
+	struct stm32_hash_dev *hdev = rctx->hdev;
 	__be32 *hash = (void *)rctx->digest;
 	unsigned int i, hashsize;
 
+	if (hdev->pdata->broken_emptymsg && !req->nbytes)
+		return stm32_hash_emptymsg_fallback(req);
+
 	switch (rctx->flags & HASH_FLAGS_ALGO_MASK) {
 	case HASH_FLAGS_MD5:
 		hashsize = MD5_DIGEST_SIZE;
@@ -772,9 +871,14 @@ static void stm32_hash_copy_hash(struct ahash_request *req)
 		return;
 	}
 
-	for (i = 0; i < hashsize / sizeof(u32); i++)
-		hash[i] = cpu_to_be32(stm32_hash_read(rctx->hdev,
-						      HASH_HREG(i)));
+	for (i = 0; i < hashsize / sizeof(u32); i++) {
+		if (hdev->pdata->ux500)
+			hash[i] = cpu_to_be32(stm32_hash_read(hdev,
+					      HASH_UX500_HREG(i)));
+		else
+			hash[i] = cpu_to_be32(stm32_hash_read(hdev,
+					      HASH_HREG(i)));
+	}
 }
 
 static int stm32_hash_finish(struct ahash_request *req)
@@ -977,7 +1081,8 @@ static int stm32_hash_export(struct ahash_request *req, void *out)
 
 	preg = rctx->hw_context;
 
-	*preg++ = stm32_hash_read(hdev, HASH_IMR);
+	if (!hdev->pdata->ux500)
+		*preg++ = stm32_hash_read(hdev, HASH_IMR);
 	*preg++ = stm32_hash_read(hdev, HASH_STR);
 	*preg++ = stm32_hash_read(hdev, HASH_CR);
 	for (i = 0; i < HASH_CSR_REGISTER_NUMBER; i++)
@@ -1006,7 +1111,8 @@ static int stm32_hash_import(struct ahash_request *req, const void *in)
 
 	pm_runtime_get_sync(hdev->dev);
 
-	stm32_hash_write(hdev, HASH_IMR, *preg++);
+	if (!hdev->pdata->ux500)
+		stm32_hash_write(hdev, HASH_IMR, *preg++);
 	stm32_hash_write(hdev, HASH_STR, *preg++);
 	stm32_hash_write(hdev, HASH_CR, *preg);
 	reg = *preg++ | HASH_CR_INIT;
@@ -1125,7 +1231,7 @@ static irqreturn_t stm32_hash_irq_handler(int irq, void *dev_id)
 	return IRQ_NONE;
 }
 
-static struct ahash_alg algs_md5_sha1[] = {
+static struct ahash_alg algs_md5[] = {
 	{
 		.init = stm32_hash_init,
 		.update = stm32_hash_update,
@@ -1177,6 +1283,9 @@ static struct ahash_alg algs_md5_sha1[] = {
 			}
 		}
 	},
+};
+
+static struct ahash_alg algs_sha1[] = {
 	{
 		.init = stm32_hash_init,
 		.update = stm32_hash_update,
@@ -1230,7 +1339,7 @@ static struct ahash_alg algs_md5_sha1[] = {
 	},
 };
 
-static struct ahash_alg algs_sha224_sha256[] = {
+static struct ahash_alg algs_sha224[] = {
 	{
 		.init = stm32_hash_init,
 		.update = stm32_hash_update,
@@ -1282,6 +1391,9 @@ static struct ahash_alg algs_sha224_sha256[] = {
 			}
 		}
 	},
+};
+
+static struct ahash_alg algs_sha256[] = {
 	{
 		.init = stm32_hash_init,
 		.update = stm32_hash_update,
@@ -1374,35 +1486,73 @@ static int stm32_hash_unregister_algs(struct stm32_hash_dev *hdev)
 	return 0;
 }
 
+static struct stm32_hash_algs_info stm32_hash_algs_info_ux500[] = {
+	{
+		.algs_list	= algs_sha1,
+		.size		= ARRAY_SIZE(algs_sha1),
+	},
+	{
+		.algs_list	= algs_sha256,
+		.size		= ARRAY_SIZE(algs_sha256),
+	},
+};
+
+static const struct stm32_hash_pdata stm32_hash_pdata_ux500 = {
+	.algs_info	= stm32_hash_algs_info_ux500,
+	.algs_info_size	= ARRAY_SIZE(stm32_hash_algs_info_ux500),
+	.broken_emptymsg = true,
+	.ux500		= true,
+};
+
 static struct stm32_hash_algs_info stm32_hash_algs_info_stm32f4[] = {
 	{
-		.algs_list	= algs_md5_sha1,
-		.size		= ARRAY_SIZE(algs_md5_sha1),
+		.algs_list	= algs_md5,
+		.size		= ARRAY_SIZE(algs_md5),
+	},
+	{
+		.algs_list	= algs_sha1,
+		.size		= ARRAY_SIZE(algs_sha1),
 	},
 };
 
 static const struct stm32_hash_pdata stm32_hash_pdata_stm32f4 = {
 	.algs_info	= stm32_hash_algs_info_stm32f4,
 	.algs_info_size	= ARRAY_SIZE(stm32_hash_algs_info_stm32f4),
+	.has_sr		= true,
+	.has_mdma	= true,
 };
 
 static struct stm32_hash_algs_info stm32_hash_algs_info_stm32f7[] = {
 	{
-		.algs_list	= algs_md5_sha1,
-		.size		= ARRAY_SIZE(algs_md5_sha1),
+		.algs_list	= algs_md5,
+		.size		= ARRAY_SIZE(algs_md5),
+	},
+	{
+		.algs_list	= algs_sha1,
+		.size		= ARRAY_SIZE(algs_sha1),
+	},
+	{
+		.algs_list	= algs_sha224,
+		.size		= ARRAY_SIZE(algs_sha224),
 	},
 	{
-		.algs_list	= algs_sha224_sha256,
-		.size		= ARRAY_SIZE(algs_sha224_sha256),
+		.algs_list	= algs_sha256,
+		.size		= ARRAY_SIZE(algs_sha256),
 	},
 };
 
 static const struct stm32_hash_pdata stm32_hash_pdata_stm32f7 = {
 	.algs_info	= stm32_hash_algs_info_stm32f7,
 	.algs_info_size	= ARRAY_SIZE(stm32_hash_algs_info_stm32f7),
+	.has_sr		= true,
+	.has_mdma	= true,
 };
 
 static const struct of_device_id stm32_hash_of_match[] = {
+	{
+		.compatible = "stericsson,ux500-hash",
+		.data = &stm32_hash_pdata_ux500,
+	},
 	{
 		.compatible = "st,stm32f456-hash",
 		.data = &stm32_hash_pdata_stm32f4,
@@ -1456,16 +1606,23 @@ static int stm32_hash_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	irq = platform_get_irq(pdev, 0);
-	if (irq < 0)
+	irq = platform_get_irq_optional(pdev, 0);
+	if (irq < 0 && irq != -ENXIO)
 		return irq;
 
-	ret = devm_request_threaded_irq(dev, irq, stm32_hash_irq_handler,
-					stm32_hash_irq_thread, IRQF_ONESHOT,
-					dev_name(dev), hdev);
-	if (ret) {
-		dev_err(dev, "Cannot grab IRQ\n");
-		return ret;
+	if (irq > 0) {
+		ret = devm_request_threaded_irq(dev, irq,
+						stm32_hash_irq_handler,
+						stm32_hash_irq_thread,
+						IRQF_ONESHOT,
+						dev_name(dev), hdev);
+		if (ret) {
+			dev_err(dev, "Cannot grab IRQ\n");
+			return ret;
+		}
+	} else {
+		dev_info(dev, "No IRQ, use polling mode\n");
+		hdev->polled = true;
 	}
 
 	hdev->clk = devm_clk_get(&pdev->dev, NULL);
@@ -1507,9 +1664,11 @@ static int stm32_hash_probe(struct platform_device *pdev)
 	case 0:
 		break;
 	case -ENOENT:
-		dev_dbg(dev, "DMA mode not available\n");
+	case -ENODEV:
+		dev_info(dev, "DMA mode not available\n");
 		break;
 	default:
+		dev_err(dev, "DMA init error %d\n", ret);
 		goto err_dma;
 	}
 
@@ -1528,7 +1687,11 @@ static int stm32_hash_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_engine_start;
 
-	hdev->dma_mode = !!stm32_hash_read(hdev, HASH_HWCFGR);
+	if (hdev->pdata->ux500)
+		/* FIXME: implement DMA mode for Ux500 */
+		hdev->dma_mode = false;
+	else
+		hdev->dma_mode = !!stm32_hash_read(hdev, HASH_HWCFGR);
 
 	/* Register algos */
 	ret = stm32_hash_register_algs(hdev);

-- 
2.38.1
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
