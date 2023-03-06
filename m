Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 041646AB5B5
	for <lists+linux-stm32@lfdr.de>; Mon,  6 Mar 2023 05:42:36 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B9685C6A5F6;
	Mon,  6 Mar 2023 04:42:35 +0000 (UTC)
Received: from 167-179-156-38.a7b39c.syd.nbn.aussiebb.net
 (167-179-156-38.a7b39c.syd.nbn.aussiebb.net [167.179.156.38])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7A96BC6A5EB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  6 Mar 2023 04:42:33 +0000 (UTC)
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
 by formenos.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
 id 1pZ2fs-000e27-4H; Mon, 06 Mar 2023 12:42:13 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation);
 Mon, 06 Mar 2023 12:42:12 +0800
From: "Herbert Xu" <herbert@gondor.apana.org.au>
Date: Mon, 06 Mar 2023 12:42:12 +0800
References: <ZAVu/XHbL9IR5D3h@gondor.apana.org.au>
To: Linus Walleij <linus.walleij@linaro.org>,
 Lionel Debieve <lionel.debieve@foss.st.com>, Li kunyu <kunyu@nfschina.com>,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org,
 linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, mcoquelin.stm32@gmail.com
Message-Id: <E1pZ2fs-000e27-4H@formenos.hmeau.com>
Subject: [Linux-stm32] [v5 PATCH 7/7] crypto: stm32 - Save and restore
	between each request
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

The Crypto API hashing paradigm requires the hardware state to
be exported between *each* request because multiple unrelated
hashes may be processed concurrently.

The stm32 hardware is capable of producing the hardware hashing
state but it was only doing it in the export function.  This is
not only broken for export as you can't export a kernel pointer
and reimport it, but it also means that concurrent hashing was
fundamentally broken.

Fix this by moving the saving and restoring of hardware hash
state between each and every hashing request.

Also change the emptymsg check in stm32_hash_copy_hash to rely
on whether we have any existing hash state, rather than whether
this particular update request is empty.  

Fixes: 8a1012d3f2ab ("crypto: stm32 - Support for STM32 HASH module")
Reported-by: Li kunyu <kunyu@nfschina.com>
Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>
---

 drivers/crypto/stm32/stm32-hash.c |  172 +++++++++++++-------------------------
 1 file changed, 62 insertions(+), 110 deletions(-)

diff --git a/drivers/crypto/stm32/stm32-hash.c b/drivers/crypto/stm32/stm32-hash.c
index 95cd8876689b..e87a909dd97e 100644
--- a/drivers/crypto/stm32/stm32-hash.c
+++ b/drivers/crypto/stm32/stm32-hash.c
@@ -95,6 +95,7 @@
 #define HASH_FLAGS_SHA1			BIT(19)
 #define HASH_FLAGS_SHA224		BIT(20)
 #define HASH_FLAGS_SHA256		BIT(21)
+#define HASH_FLAGS_EMPTY		BIT(22)
 #define HASH_FLAGS_HMAC			BIT(23)
 
 #define HASH_OP_UPDATE			1
@@ -134,7 +135,7 @@ struct stm32_hash_state {
 	u8 buffer[HASH_BUFLEN] __aligned(4);
 
 	/* hash state */
-	u32			*hw_context;
+	u32			hw_context[3 + HASH_CSR_REGISTER_NUMBER];
 };
 
 struct stm32_hash_request_ctx {
@@ -314,8 +315,11 @@ static void stm32_hash_write_ctrl(struct stm32_hash_dev *hdev, int bufcnt)
 		 * On the Ux500 we need to set a special flag to indicate that
 		 * the message is zero length.
 		 */
-		if (hdev->pdata->ux500 && bufcnt == 0)
+		if (hdev->pdata->ux500 && bufcnt == 0 &&
+		    (state->flags & HASH_FLAGS_FINAL)) {
 			reg |= HASH_CR_UX500_EMPTYMSG;
+			state->flags |= HASH_FLAGS_EMPTY;
+		}
 
 		if (!hdev->polled)
 			stm32_hash_write(hdev, HASH_IMR, HASH_DCIE);
@@ -419,7 +423,9 @@ static int stm32_hash_update_cpu(struct stm32_hash_dev *hdev)
 {
 	struct stm32_hash_request_ctx *rctx = ahash_request_ctx(hdev->req);
 	struct stm32_hash_state *state = &rctx->state;
+	u32 *preg = state->hw_context;
 	int bufcnt, err = 0, final;
+	int i;
 
 	dev_dbg(hdev->dev, "%s flags %x\n", __func__, state->flags);
 
@@ -440,9 +446,24 @@ static int stm32_hash_update_cpu(struct stm32_hash_dev *hdev)
 	if (final) {
 		bufcnt = state->bufcnt;
 		state->bufcnt = 0;
-		err = stm32_hash_xmit_cpu(hdev, state->buffer, bufcnt, 1);
+		return stm32_hash_xmit_cpu(hdev, state->buffer, bufcnt, 1);
 	}
 
+	if (!(hdev->flags & HASH_FLAGS_INIT))
+		return 0;
+
+	if (stm32_hash_wait_busy(hdev))
+		return -ETIMEDOUT;
+
+	if (!hdev->pdata->ux500)
+		*preg++ = stm32_hash_read(hdev, HASH_IMR);
+	*preg++ = stm32_hash_read(hdev, HASH_STR);
+	*preg++ = stm32_hash_read(hdev, HASH_CR);
+	for (i = 0; i < HASH_CSR_REGISTER_NUMBER; i++)
+		*preg++ = stm32_hash_read(hdev, HASH_CSR(i));
+
+	state->flags |= HASH_FLAGS_INIT;
+
 	return err;
 }
 
@@ -824,7 +845,7 @@ static void stm32_hash_copy_hash(struct ahash_request *req)
 	__be32 *hash = (void *)rctx->digest;
 	unsigned int i, hashsize;
 
-	if (hdev->pdata->broken_emptymsg && !req->nbytes)
+	if (hdev->pdata->broken_emptymsg && (state->flags & HASH_FLAGS_EMPTY))
 		return stm32_hash_emptymsg_fallback(req);
 
 	switch (state->flags & HASH_FLAGS_ALGO_MASK) {
@@ -874,11 +895,6 @@ static void stm32_hash_finish_req(struct ahash_request *req, int err)
 	if (!err && (HASH_FLAGS_FINAL & hdev->flags)) {
 		stm32_hash_copy_hash(req);
 		err = stm32_hash_finish(req);
-		hdev->flags &= ~(HASH_FLAGS_FINAL | HASH_FLAGS_CPU |
-				 HASH_FLAGS_INIT | HASH_FLAGS_DMA_READY |
-				 HASH_FLAGS_OUTPUT_READY | HASH_FLAGS_HMAC |
-				 HASH_FLAGS_HMAC_INIT | HASH_FLAGS_HMAC_FINAL |
-				 HASH_FLAGS_HMAC_KEY);
 	}
 
 	pm_runtime_mark_last_busy(hdev->dev);
@@ -887,66 +903,54 @@ static void stm32_hash_finish_req(struct ahash_request *req, int err)
 	crypto_finalize_hash_request(hdev->engine, req, err);
 }
 
-static int stm32_hash_hw_init(struct stm32_hash_dev *hdev,
-			      struct stm32_hash_request_ctx *rctx)
-{
-	pm_runtime_get_sync(hdev->dev);
-
-	if (!(HASH_FLAGS_INIT & hdev->flags)) {
-		stm32_hash_write(hdev, HASH_CR, HASH_CR_INIT);
-		stm32_hash_write(hdev, HASH_STR, 0);
-		stm32_hash_write(hdev, HASH_DIN, 0);
-		stm32_hash_write(hdev, HASH_IMR, 0);
-	}
-
-	return 0;
-}
-
-static int stm32_hash_one_request(struct crypto_engine *engine, void *areq);
-static int stm32_hash_prepare_req(struct crypto_engine *engine, void *areq);
-
 static int stm32_hash_handle_queue(struct stm32_hash_dev *hdev,
 				   struct ahash_request *req)
 {
 	return crypto_transfer_hash_request_to_engine(hdev->engine, req);
 }
 
-static int stm32_hash_prepare_req(struct crypto_engine *engine, void *areq)
+static int stm32_hash_one_request(struct crypto_engine *engine, void *areq)
 {
 	struct ahash_request *req = container_of(areq, struct ahash_request,
 						 base);
 	struct stm32_hash_ctx *ctx = crypto_ahash_ctx(crypto_ahash_reqtfm(req));
+	struct stm32_hash_request_ctx *rctx = ahash_request_ctx(req);
 	struct stm32_hash_dev *hdev = stm32_hash_find_dev(ctx);
-	struct stm32_hash_request_ctx *rctx;
+	struct stm32_hash_state *state = &rctx->state;
+	int err = 0;
 
 	if (!hdev)
 		return -ENODEV;
 
-	hdev->req = req;
-
-	rctx = ahash_request_ctx(req);
-
 	dev_dbg(hdev->dev, "processing new req, op: %lu, nbytes %d\n",
 		rctx->op, req->nbytes);
 
-	return stm32_hash_hw_init(hdev, rctx);
-}
+	pm_runtime_get_sync(hdev->dev);
 
-static int stm32_hash_one_request(struct crypto_engine *engine, void *areq)
-{
-	struct ahash_request *req = container_of(areq, struct ahash_request,
-						 base);
-	struct stm32_hash_ctx *ctx = crypto_ahash_ctx(crypto_ahash_reqtfm(req));
-	struct stm32_hash_dev *hdev = stm32_hash_find_dev(ctx);
-	struct stm32_hash_request_ctx *rctx;
-	int err = 0;
+	hdev->req = req;
+	hdev->flags = 0;
+
+	if (state->flags & HASH_FLAGS_INIT) {
+		u32 *preg = rctx->state.hw_context;
+		u32 reg;
+		int i;
+
+		if (!hdev->pdata->ux500)
+			stm32_hash_write(hdev, HASH_IMR, *preg++);
+		stm32_hash_write(hdev, HASH_STR, *preg++);
+		stm32_hash_write(hdev, HASH_CR, *preg);
+		reg = *preg++ | HASH_CR_INIT;
+		stm32_hash_write(hdev, HASH_CR, reg);
 
-	if (!hdev)
-		return -ENODEV;
+		for (i = 0; i < HASH_CSR_REGISTER_NUMBER; i++)
+			stm32_hash_write(hdev, HASH_CSR(i), *preg++);
 
-	hdev->req = req;
+		hdev->flags |= HASH_FLAGS_INIT;
 
-	rctx = ahash_request_ctx(req);
+		if (state->flags & HASH_FLAGS_HMAC)
+			hdev->flags |= HASH_FLAGS_HMAC |
+				       HASH_FLAGS_HMAC_KEY;
+	}
 
 	if (rctx->op == HASH_OP_UPDATE)
 		err = stm32_hash_update_req(hdev);
@@ -1041,34 +1045,8 @@ static int stm32_hash_digest(struct ahash_request *req)
 static int stm32_hash_export(struct ahash_request *req, void *out)
 {
 	struct stm32_hash_request_ctx *rctx = ahash_request_ctx(req);
-	struct stm32_hash_ctx *ctx = crypto_ahash_ctx(crypto_ahash_reqtfm(req));
-	struct stm32_hash_dev *hdev = stm32_hash_find_dev(ctx);
-	struct stm32_hash_state *state = &rctx->state;
-	u32 *preg;
-	unsigned int i;
-	int ret;
-
-	pm_runtime_get_sync(hdev->dev);
-
-	ret = stm32_hash_wait_busy(hdev);
-	if (ret)
-		return ret;
-
-	state->hw_context = kmalloc_array(3 + HASH_CSR_REGISTER_NUMBER,
-					  sizeof(u32), GFP_KERNEL);
-	preg = state->hw_context;
 
-	if (!hdev->pdata->ux500)
-		*preg++ = stm32_hash_read(hdev, HASH_IMR);
-	*preg++ = stm32_hash_read(hdev, HASH_STR);
-	*preg++ = stm32_hash_read(hdev, HASH_CR);
-	for (i = 0; i < HASH_CSR_REGISTER_NUMBER; i++)
-		*preg++ = stm32_hash_read(hdev, HASH_CSR(i));
-
-	pm_runtime_mark_last_busy(hdev->dev);
-	pm_runtime_put_autosuspend(hdev->dev);
-
-	memcpy(out, rctx, sizeof(*rctx));
+	memcpy(out, &rctx->state, sizeof(rctx->state));
 
 	return 0;
 }
@@ -1076,33 +1054,9 @@ static int stm32_hash_export(struct ahash_request *req, void *out)
 static int stm32_hash_import(struct ahash_request *req, const void *in)
 {
 	struct stm32_hash_request_ctx *rctx = ahash_request_ctx(req);
-	struct stm32_hash_ctx *ctx = crypto_ahash_ctx(crypto_ahash_reqtfm(req));
-	struct stm32_hash_dev *hdev = stm32_hash_find_dev(ctx);
-	struct stm32_hash_state *state = &rctx->state;
-	const u32 *preg = in;
-	u32 reg;
-	unsigned int i;
-
-	memcpy(rctx, in, sizeof(*rctx));
-
-	preg = state->hw_context;
-
-	pm_runtime_get_sync(hdev->dev);
-
-	if (!hdev->pdata->ux500)
-		stm32_hash_write(hdev, HASH_IMR, *preg++);
-	stm32_hash_write(hdev, HASH_STR, *preg++);
-	stm32_hash_write(hdev, HASH_CR, *preg);
-	reg = *preg++ | HASH_CR_INIT;
-	stm32_hash_write(hdev, HASH_CR, reg);
-
-	for (i = 0; i < HASH_CSR_REGISTER_NUMBER; i++)
-		stm32_hash_write(hdev, HASH_CSR(i), *preg++);
-
-	pm_runtime_mark_last_busy(hdev->dev);
-	pm_runtime_put_autosuspend(hdev->dev);
 
-	kfree(state->hw_context);
+	stm32_hash_init(req);
+	memcpy(&rctx->state, in, sizeof(rctx->state));
 
 	return 0;
 }
@@ -1159,8 +1113,6 @@ static int stm32_hash_cra_init_algs(struct crypto_tfm *tfm,
 		ctx->flags |= HASH_FLAGS_HMAC;
 
 	ctx->enginectx.op.do_one_request = stm32_hash_one_request;
-	ctx->enginectx.op.prepare_request = stm32_hash_prepare_req;
-	ctx->enginectx.op.unprepare_request = NULL;
 
 	return stm32_hash_init_fallback(tfm);
 }
@@ -1252,7 +1204,7 @@ static struct ahash_alg algs_md5[] = {
 		.import = stm32_hash_import,
 		.halg = {
 			.digestsize = MD5_DIGEST_SIZE,
-			.statesize = sizeof(struct stm32_hash_request_ctx),
+			.statesize = sizeof(struct stm32_hash_state),
 			.base = {
 				.cra_name = "md5",
 				.cra_driver_name = "stm32-md5",
@@ -1279,7 +1231,7 @@ static struct ahash_alg algs_md5[] = {
 		.setkey = stm32_hash_setkey,
 		.halg = {
 			.digestsize = MD5_DIGEST_SIZE,
-			.statesize = sizeof(struct stm32_hash_request_ctx),
+			.statesize = sizeof(struct stm32_hash_state),
 			.base = {
 				.cra_name = "hmac(md5)",
 				.cra_driver_name = "stm32-hmac-md5",
@@ -1308,7 +1260,7 @@ static struct ahash_alg algs_sha1[] = {
 		.import = stm32_hash_import,
 		.halg = {
 			.digestsize = SHA1_DIGEST_SIZE,
-			.statesize = sizeof(struct stm32_hash_request_ctx),
+			.statesize = sizeof(struct stm32_hash_state),
 			.base = {
 				.cra_name = "sha1",
 				.cra_driver_name = "stm32-sha1",
@@ -1335,7 +1287,7 @@ static struct ahash_alg algs_sha1[] = {
 		.setkey = stm32_hash_setkey,
 		.halg = {
 			.digestsize = SHA1_DIGEST_SIZE,
-			.statesize = sizeof(struct stm32_hash_request_ctx),
+			.statesize = sizeof(struct stm32_hash_state),
 			.base = {
 				.cra_name = "hmac(sha1)",
 				.cra_driver_name = "stm32-hmac-sha1",
@@ -1364,7 +1316,7 @@ static struct ahash_alg algs_sha224[] = {
 		.import = stm32_hash_import,
 		.halg = {
 			.digestsize = SHA224_DIGEST_SIZE,
-			.statesize = sizeof(struct stm32_hash_request_ctx),
+			.statesize = sizeof(struct stm32_hash_state),
 			.base = {
 				.cra_name = "sha224",
 				.cra_driver_name = "stm32-sha224",
@@ -1391,7 +1343,7 @@ static struct ahash_alg algs_sha224[] = {
 		.import = stm32_hash_import,
 		.halg = {
 			.digestsize = SHA224_DIGEST_SIZE,
-			.statesize = sizeof(struct stm32_hash_request_ctx),
+			.statesize = sizeof(struct stm32_hash_state),
 			.base = {
 				.cra_name = "hmac(sha224)",
 				.cra_driver_name = "stm32-hmac-sha224",
@@ -1420,7 +1372,7 @@ static struct ahash_alg algs_sha256[] = {
 		.import = stm32_hash_import,
 		.halg = {
 			.digestsize = SHA256_DIGEST_SIZE,
-			.statesize = sizeof(struct stm32_hash_request_ctx),
+			.statesize = sizeof(struct stm32_hash_state),
 			.base = {
 				.cra_name = "sha256",
 				.cra_driver_name = "stm32-sha256",
@@ -1447,7 +1399,7 @@ static struct ahash_alg algs_sha256[] = {
 		.setkey = stm32_hash_setkey,
 		.halg = {
 			.digestsize = SHA256_DIGEST_SIZE,
-			.statesize = sizeof(struct stm32_hash_request_ctx),
+			.statesize = sizeof(struct stm32_hash_state),
 			.base = {
 				.cra_name = "hmac(sha256)",
 				.cra_driver_name = "stm32-hmac-sha256",
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
