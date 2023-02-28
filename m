Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 648936A561F
	for <lists+linux-stm32@lfdr.de>; Tue, 28 Feb 2023 10:48:54 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0D9D8C6A5EA;
	Tue, 28 Feb 2023 09:48:54 +0000 (UTC)
Received: from 167-179-156-38.a7b39c.syd.nbn.aussiebb.net
 (167-179-156-38.a7b39c.syd.nbn.aussiebb.net [167.179.156.38])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9D126C6410A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Feb 2023 09:48:51 +0000 (UTC)
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
 by formenos.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
 id 1pWwax-00GMwx-Lx; Tue, 28 Feb 2023 17:48:28 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation);
 Tue, 28 Feb 2023 17:48:27 +0800
Date: Tue, 28 Feb 2023 17:48:27 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Linus Walleij <linus.walleij@linaro.org>
Message-ID: <Y/3N6zFOZeehJQ/p@gondor.apana.org.au>
References: <Y/cBB+q0Ono9j2Jy@gondor.apana.org.au>
 <20230224231430.2948-1-kunyu@nfschina.com>
 <Y/cy5wUtk10OahpO@gondor.apana.org.au>
 <CACRpkdYyB=-UnE1bmdVszSSB5ReECZ0fUoWJX6XtYbKHEe52tA@mail.gmail.com>
 <Y/c7iVW67Xhhdu8e@gondor.apana.org.au>
 <Y/hQdzsKMYgkIfMY@gondor.apana.org.au>
 <Y/yIbPBVCPx9K/0s@gondor.apana.org.au>
 <CACRpkdZC4z2Xng4=k94rmM=AFzNzTdXkvtkArMnK7afouz=7VA@mail.gmail.com>
 <Y/3FYZJeLE7DVPBf@gondor.apana.org.au>
 <Y/3IA4OjmUmjMgh1@gondor.apana.org.au>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y/3IA4OjmUmjMgh1@gondor.apana.org.au>
Cc: Li kunyu <kunyu@nfschina.com>, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-crypto@vger.kernel.org,
 mcoquelin.stm32@gmail.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [v4 PATCH] crypto: stm32 - Save and restore between
	each request
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

v4 fixes hmac to not reload the key over and over again causing
the hash state to be corrupted.

---8<---
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

diff --git a/drivers/crypto/stm32/stm32-hash.c b/drivers/crypto/stm32/stm32-hash.c
index 7bf805563ac2..a4c4cb1735d4 100644
--- a/drivers/crypto/stm32/stm32-hash.c
+++ b/drivers/crypto/stm32/stm32-hash.c
@@ -7,7 +7,6 @@
  */
 
 #include <linux/clk.h>
-#include <linux/crypto.h>
 #include <linux/delay.h>
 #include <linux/dma-mapping.h>
 #include <linux/dmaengine.h>
@@ -127,6 +126,16 @@ struct stm32_hash_ctx {
 	int			keylen;
 };
 
+struct stm32_hash_state {
+	u16			bufcnt;
+	u16			buflen;
+
+	u8 buffer[HASH_BUFLEN] __aligned(4);
+
+	/* hash state */
+	u32			hw_context[3 + HASH_CSR_REGISTER_NUMBER];
+};
+
 struct stm32_hash_request_ctx {
 	struct stm32_hash_dev	*hdev;
 	unsigned long		flags;
@@ -134,8 +143,6 @@ struct stm32_hash_request_ctx {
 
 	u8 digest[SHA256_DIGEST_SIZE] __aligned(sizeof(u32));
 	size_t			digcnt;
-	size_t			bufcnt;
-	size_t			buflen;
 
 	/* DMA */
 	struct scatterlist	*sg;
@@ -149,10 +156,7 @@ struct stm32_hash_request_ctx {
 
 	u8			data_type;
 
-	u8 buffer[HASH_BUFLEN] __aligned(sizeof(u32));
-
-	/* Export Context */
-	u32			*hw_context;
+	struct stm32_hash_state state;
 };
 
 struct stm32_hash_algs_info {
@@ -183,7 +187,6 @@ struct stm32_hash_dev {
 	struct ahash_request	*req;
 	struct crypto_engine	*engine;
 
-	int			err;
 	unsigned long		flags;
 
 	struct dma_chan		*dma_lch;
@@ -326,11 +329,12 @@ static void stm32_hash_write_ctrl(struct stm32_hash_dev *hdev, int bufcnt)
 
 static void stm32_hash_append_sg(struct stm32_hash_request_ctx *rctx)
 {
+	struct stm32_hash_state *state = &rctx->state;
 	size_t count;
 
-	while ((rctx->bufcnt < rctx->buflen) && rctx->total) {
+	while ((state->bufcnt < state->buflen) && rctx->total) {
 		count = min(rctx->sg->length - rctx->offset, rctx->total);
-		count = min(count, rctx->buflen - rctx->bufcnt);
+		count = min_t(size_t, count, state->buflen - state->bufcnt);
 
 		if (count <= 0) {
 			if ((rctx->sg->length == 0) && !sg_is_last(rctx->sg)) {
@@ -341,10 +345,10 @@ static void stm32_hash_append_sg(struct stm32_hash_request_ctx *rctx)
 			}
 		}
 
-		scatterwalk_map_and_copy(rctx->buffer + rctx->bufcnt, rctx->sg,
-					 rctx->offset, count, 0);
+		scatterwalk_map_and_copy(state->buffer + state->bufcnt,
+					 rctx->sg, rctx->offset, count, 0);
 
-		rctx->bufcnt += count;
+		state->bufcnt += count;
 		rctx->offset += count;
 		rctx->total -= count;
 
@@ -413,26 +417,27 @@ static int stm32_hash_xmit_cpu(struct stm32_hash_dev *hdev,
 static int stm32_hash_update_cpu(struct stm32_hash_dev *hdev)
 {
 	struct stm32_hash_request_ctx *rctx = ahash_request_ctx(hdev->req);
+	struct stm32_hash_state *state = &rctx->state;
 	int bufcnt, err = 0, final;
 
 	dev_dbg(hdev->dev, "%s flags %lx\n", __func__, rctx->flags);
 
 	final = (rctx->flags & HASH_FLAGS_FINUP);
 
-	while ((rctx->total >= rctx->buflen) ||
-	       (rctx->bufcnt + rctx->total >= rctx->buflen)) {
+	while ((rctx->total >= state->buflen) ||
+	       (state->bufcnt + rctx->total >= state->buflen)) {
 		stm32_hash_append_sg(rctx);
-		bufcnt = rctx->bufcnt;
-		rctx->bufcnt = 0;
-		err = stm32_hash_xmit_cpu(hdev, rctx->buffer, bufcnt, 0);
+		bufcnt = state->bufcnt;
+		state->bufcnt = 0;
+		err = stm32_hash_xmit_cpu(hdev, state->buffer, bufcnt, 0);
 	}
 
 	stm32_hash_append_sg(rctx);
 
 	if (final) {
-		bufcnt = rctx->bufcnt;
-		rctx->bufcnt = 0;
-		err = stm32_hash_xmit_cpu(hdev, rctx->buffer, bufcnt, 1);
+		bufcnt = state->bufcnt;
+		state->bufcnt = 0;
+		err = stm32_hash_xmit_cpu(hdev, state->buffer, bufcnt, 1);
 
 		/* If we have an IRQ, wait for that, else poll for completion */
 		if (hdev->polled) {
@@ -441,8 +446,20 @@ static int stm32_hash_update_cpu(struct stm32_hash_dev *hdev)
 			hdev->flags |= HASH_FLAGS_OUTPUT_READY;
 			err = 0;
 		}
+	} else {
+		u32 *preg = state->hw_context;
+		int i;
+
+		if (!hdev->pdata->ux500)
+			*preg++ = stm32_hash_read(hdev, HASH_IMR);
+		*preg++ = stm32_hash_read(hdev, HASH_STR);
+		*preg++ = stm32_hash_read(hdev, HASH_CR);
+		for (i = 0; i < HASH_CSR_REGISTER_NUMBER; i++)
+			*preg++ = stm32_hash_read(hdev, HASH_CSR(i));
 	}
 
+	rctx->flags |= HASH_FLAGS_INIT;
+
 	return err;
 }
 
@@ -584,10 +601,10 @@ static int stm32_hash_dma_init(struct stm32_hash_dev *hdev)
 static int stm32_hash_dma_send(struct stm32_hash_dev *hdev)
 {
 	struct stm32_hash_request_ctx *rctx = ahash_request_ctx(hdev->req);
+	u32 *buffer = (void *)rctx->state.buffer;
 	struct scatterlist sg[1], *tsg;
 	int err = 0, len = 0, reg, ncp = 0;
 	unsigned int i;
-	u32 *buffer = (void *)rctx->buffer;
 
 	rctx->sg = hdev->req->src;
 	rctx->total = hdev->req->nbytes;
@@ -615,7 +632,7 @@ static int stm32_hash_dma_send(struct stm32_hash_dev *hdev)
 
 				ncp = sg_pcopy_to_buffer(
 					rctx->sg, rctx->nents,
-					rctx->buffer, sg->length - len,
+					rctx->state.buffer, sg->length - len,
 					rctx->total - sg->length + len);
 
 				sg->length = len;
@@ -671,6 +688,8 @@ static int stm32_hash_dma_send(struct stm32_hash_dev *hdev)
 		err = stm32_hash_hmac_dma_send(hdev);
 	}
 
+	rctx->flags |= HASH_FLAGS_INIT;
+
 	return err;
 }
 
@@ -749,14 +768,12 @@ static int stm32_hash_init(struct ahash_request *req)
 		return -EINVAL;
 	}
 
-	rctx->bufcnt = 0;
-	rctx->buflen = HASH_BUFLEN;
+	rctx->state.bufcnt = 0;
+	rctx->state.buflen = HASH_BUFLEN;
 	rctx->total = 0;
 	rctx->offset = 0;
 	rctx->data_type = HASH_DATA_8_BITS;
 
-	memset(rctx->buffer, 0, HASH_BUFLEN);
-
 	if (ctx->flags & HASH_FLAGS_HMAC)
 		rctx->flags |= HASH_FLAGS_HMAC;
 
@@ -774,15 +791,16 @@ static int stm32_hash_final_req(struct stm32_hash_dev *hdev)
 {
 	struct ahash_request *req = hdev->req;
 	struct stm32_hash_request_ctx *rctx = ahash_request_ctx(req);
+	struct stm32_hash_state *state = &rctx->state;
+	int buflen = state->bufcnt;
 	int err;
-	int buflen = rctx->bufcnt;
 
-	rctx->bufcnt = 0;
+	state->bufcnt = 0;
 
 	if (!(rctx->flags & HASH_FLAGS_CPU))
 		err = stm32_hash_dma_send(hdev);
 	else
-		err = stm32_hash_xmit_cpu(hdev, rctx->buffer, buflen, 1);
+		err = stm32_hash_xmit_cpu(hdev, state->buffer, buflen, 1);
 
 	/* If we have an IRQ, wait for that, else poll for completion */
 	if (hdev->polled) {
@@ -832,7 +850,7 @@ static void stm32_hash_copy_hash(struct ahash_request *req)
 	__be32 *hash = (void *)rctx->digest;
 	unsigned int i, hashsize;
 
-	if (hdev->pdata->broken_emptymsg && !req->nbytes)
+	if (hdev->pdata->broken_emptymsg && !(rctx->flags & HASH_FLAGS_INIT))
 		return stm32_hash_emptymsg_fallback(req);
 
 	switch (rctx->flags & HASH_FLAGS_ALGO_MASK) {
@@ -882,11 +900,6 @@ static void stm32_hash_finish_req(struct ahash_request *req, int err)
 	if (!err && (HASH_FLAGS_FINAL & hdev->flags)) {
 		stm32_hash_copy_hash(req);
 		err = stm32_hash_finish(req);
-		hdev->flags &= ~(HASH_FLAGS_FINAL | HASH_FLAGS_CPU |
-				 HASH_FLAGS_INIT | HASH_FLAGS_DMA_READY |
-				 HASH_FLAGS_OUTPUT_READY | HASH_FLAGS_HMAC |
-				 HASH_FLAGS_HMAC_INIT | HASH_FLAGS_HMAC_FINAL |
-				 HASH_FLAGS_HMAC_KEY);
 	} else {
 		rctx->flags |= HASH_FLAGS_ERRORS;
 	}
@@ -897,67 +910,61 @@ static void stm32_hash_finish_req(struct ahash_request *req, int err)
 	crypto_finalize_hash_request(hdev->engine, req, err);
 }
 
-static int stm32_hash_hw_init(struct stm32_hash_dev *hdev,
+static void stm32_hash_hw_init(struct stm32_hash_dev *hdev,
 			      struct stm32_hash_request_ctx *rctx)
 {
 	pm_runtime_get_sync(hdev->dev);
-
-	if (!(HASH_FLAGS_INIT & hdev->flags)) {
-		stm32_hash_write(hdev, HASH_CR, HASH_CR_INIT);
-		stm32_hash_write(hdev, HASH_STR, 0);
-		stm32_hash_write(hdev, HASH_DIN, 0);
-		stm32_hash_write(hdev, HASH_IMR, 0);
-		hdev->err = 0;
-	}
-
-	return 0;
 }
 
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
 	struct stm32_hash_dev *hdev = stm32_hash_find_dev(ctx);
 	struct stm32_hash_request_ctx *rctx;
+	int err = 0;
 
 	if (!hdev)
 		return -ENODEV;
 
+	dev_dbg(hdev->dev, "processing new req, op: %lu, nbytes %d\n",
+		rctx->op, req->nbytes);
+
+	stm32_hash_hw_init(hdev, rctx);
+
 	hdev->req = req;
+	hdev->flags = 0;
 
 	rctx = ahash_request_ctx(req);
 
-	dev_dbg(hdev->dev, "processing new req, op: %lu, nbytes %d\n",
-		rctx->op, req->nbytes);
+	if (rctx->flags & HASH_FLAGS_INIT) {
+		u32 *preg = rctx->state.hw_context;
+		u32 reg;
+		int i;
 
-	return stm32_hash_hw_init(hdev, rctx);
-}
-
-static int stm32_hash_one_request(struct crypto_engine *engine, void *areq)
-{
-	struct ahash_request *req = container_of(areq, struct ahash_request,
-						 base);
-	struct stm32_hash_ctx *ctx = crypto_ahash_ctx(crypto_ahash_reqtfm(req));
-	struct stm32_hash_dev *hdev = stm32_hash_find_dev(ctx);
-	struct stm32_hash_request_ctx *rctx;
-	int err = 0;
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
+		if (rctx->flags & HASH_FLAGS_HMAC)
+			hdev->flags |= HASH_FLAGS_HMAC |
+				       HASH_FLAGS_HMAC_KEY;
+	}
 
 	if (rctx->op == HASH_OP_UPDATE)
 		err = stm32_hash_update_req(hdev);
@@ -985,6 +992,7 @@ static int stm32_hash_enqueue(struct ahash_request *req, unsigned int op)
 static int stm32_hash_update(struct ahash_request *req)
 {
 	struct stm32_hash_request_ctx *rctx = ahash_request_ctx(req);
+	struct stm32_hash_state *state = &rctx->state;
 
 	if (!req->nbytes || !(rctx->flags & HASH_FLAGS_CPU))
 		return 0;
@@ -993,7 +1001,7 @@ static int stm32_hash_update(struct ahash_request *req)
 	rctx->sg = req->src;
 	rctx->offset = 0;
 
-	if ((rctx->bufcnt + rctx->total < rctx->buflen)) {
+	if ((state->bufcnt + rctx->total < state->buflen)) {
 		stm32_hash_append_sg(rctx);
 		return 0;
 	}
@@ -1044,35 +1052,13 @@ static int stm32_hash_digest(struct ahash_request *req)
 static int stm32_hash_export(struct ahash_request *req, void *out)
 {
 	struct stm32_hash_request_ctx *rctx = ahash_request_ctx(req);
-	struct stm32_hash_ctx *ctx = crypto_ahash_ctx(crypto_ahash_reqtfm(req));
-	struct stm32_hash_dev *hdev = stm32_hash_find_dev(ctx);
-	u32 *preg;
-	unsigned int i;
-	int ret;
+	bool empty = !(rctx->flags & HASH_FLAGS_INIT);
+	u8 *p = out;
 
-	pm_runtime_get_sync(hdev->dev);
-
-	ret = stm32_hash_wait_busy(hdev);
-	if (ret)
-		return ret;
-
-	rctx->hw_context = kmalloc_array(3 + HASH_CSR_REGISTER_NUMBER,
-					 sizeof(u32),
-					 GFP_KERNEL);
+	*(u8 *)p = empty;
 
-	preg = rctx->hw_context;
-
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
+	if (!empty)
+		memcpy(p + 1, &rctx->state, sizeof(rctx->state));
 
 	return 0;
 }
@@ -1080,32 +1066,14 @@ static int stm32_hash_export(struct ahash_request *req, void *out)
 static int stm32_hash_import(struct ahash_request *req, const void *in)
 {
 	struct stm32_hash_request_ctx *rctx = ahash_request_ctx(req);
-	struct stm32_hash_ctx *ctx = crypto_ahash_ctx(crypto_ahash_reqtfm(req));
-	struct stm32_hash_dev *hdev = stm32_hash_find_dev(ctx);
-	const u32 *preg = in;
-	u32 reg;
-	unsigned int i;
-
-	memcpy(rctx, in, sizeof(*rctx));
+	const u8 *p = in;
 
-	preg = rctx->hw_context;
-
-	pm_runtime_get_sync(hdev->dev);
+	stm32_hash_init(req);
 
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
-
-	kfree(rctx->hw_context);
+	if (!*(u8 *)p) {
+		rctx->flags |= HASH_FLAGS_INIT;
+		memcpy(&rctx->state, p + 1, sizeof(rctx->state));
+	}
 
 	return 0;
 }
@@ -1162,8 +1130,6 @@ static int stm32_hash_cra_init_algs(struct crypto_tfm *tfm,
 		ctx->flags |= HASH_FLAGS_HMAC;
 
 	ctx->enginectx.op.do_one_request = stm32_hash_one_request;
-	ctx->enginectx.op.prepare_request = stm32_hash_prepare_req;
-	ctx->enginectx.op.unprepare_request = NULL;
 
 	return stm32_hash_init_fallback(tfm);
 }
@@ -1255,7 +1221,7 @@ static struct ahash_alg algs_md5[] = {
 		.import = stm32_hash_import,
 		.halg = {
 			.digestsize = MD5_DIGEST_SIZE,
-			.statesize = sizeof(struct stm32_hash_request_ctx),
+			.statesize = sizeof(struct stm32_hash_state) + 1,
 			.base = {
 				.cra_name = "md5",
 				.cra_driver_name = "stm32-md5",
@@ -1282,7 +1248,7 @@ static struct ahash_alg algs_md5[] = {
 		.setkey = stm32_hash_setkey,
 		.halg = {
 			.digestsize = MD5_DIGEST_SIZE,
-			.statesize = sizeof(struct stm32_hash_request_ctx),
+			.statesize = sizeof(struct stm32_hash_state) + 1,
 			.base = {
 				.cra_name = "hmac(md5)",
 				.cra_driver_name = "stm32-hmac-md5",
@@ -1311,7 +1277,7 @@ static struct ahash_alg algs_sha1[] = {
 		.import = stm32_hash_import,
 		.halg = {
 			.digestsize = SHA1_DIGEST_SIZE,
-			.statesize = sizeof(struct stm32_hash_request_ctx),
+			.statesize = sizeof(struct stm32_hash_state) + 1,
 			.base = {
 				.cra_name = "sha1",
 				.cra_driver_name = "stm32-sha1",
@@ -1338,7 +1304,7 @@ static struct ahash_alg algs_sha1[] = {
 		.setkey = stm32_hash_setkey,
 		.halg = {
 			.digestsize = SHA1_DIGEST_SIZE,
-			.statesize = sizeof(struct stm32_hash_request_ctx),
+			.statesize = sizeof(struct stm32_hash_state) + 1,
 			.base = {
 				.cra_name = "hmac(sha1)",
 				.cra_driver_name = "stm32-hmac-sha1",
@@ -1367,7 +1333,7 @@ static struct ahash_alg algs_sha224[] = {
 		.import = stm32_hash_import,
 		.halg = {
 			.digestsize = SHA224_DIGEST_SIZE,
-			.statesize = sizeof(struct stm32_hash_request_ctx),
+			.statesize = sizeof(struct stm32_hash_state) + 1,
 			.base = {
 				.cra_name = "sha224",
 				.cra_driver_name = "stm32-sha224",
@@ -1394,7 +1360,7 @@ static struct ahash_alg algs_sha224[] = {
 		.import = stm32_hash_import,
 		.halg = {
 			.digestsize = SHA224_DIGEST_SIZE,
-			.statesize = sizeof(struct stm32_hash_request_ctx),
+			.statesize = sizeof(struct stm32_hash_state) + 1,
 			.base = {
 				.cra_name = "hmac(sha224)",
 				.cra_driver_name = "stm32-hmac-sha224",
@@ -1423,7 +1389,7 @@ static struct ahash_alg algs_sha256[] = {
 		.import = stm32_hash_import,
 		.halg = {
 			.digestsize = SHA256_DIGEST_SIZE,
-			.statesize = sizeof(struct stm32_hash_request_ctx),
+			.statesize = sizeof(struct stm32_hash_state) + 1,
 			.base = {
 				.cra_name = "sha256",
 				.cra_driver_name = "stm32-sha256",
@@ -1450,7 +1416,7 @@ static struct ahash_alg algs_sha256[] = {
 		.setkey = stm32_hash_setkey,
 		.halg = {
 			.digestsize = SHA256_DIGEST_SIZE,
-			.statesize = sizeof(struct stm32_hash_request_ctx),
+			.statesize = sizeof(struct stm32_hash_state) + 1,
 			.base = {
 				.cra_name = "hmac(sha256)",
 				.cra_driver_name = "stm32-hmac-sha256",
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
