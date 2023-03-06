Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 164A86AB5B6
	for <lists+linux-stm32@lfdr.de>; Mon,  6 Mar 2023 05:42:45 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CFBEEC6A5F6;
	Mon,  6 Mar 2023 04:42:44 +0000 (UTC)
Received: from 167-179-156-38.a7b39c.syd.nbn.aussiebb.net
 (167-179-156-38.a7b39c.syd.nbn.aussiebb.net [167.179.156.38])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E6194C6A5E8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  6 Mar 2023 04:42:42 +0000 (UTC)
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
 by formenos.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
 id 1pZ2fj-000e1B-Kg; Mon, 06 Mar 2023 12:42:04 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation);
 Mon, 06 Mar 2023 12:42:03 +0800
From: "Herbert Xu" <herbert@gondor.apana.org.au>
Date: Mon, 06 Mar 2023 12:42:03 +0800
References: <ZAVu/XHbL9IR5D3h@gondor.apana.org.au>
To: Linus Walleij <linus.walleij@linaro.org>,
 Lionel Debieve <lionel.debieve@foss.st.com>, Li kunyu <kunyu@nfschina.com>,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org,
 linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, mcoquelin.stm32@gmail.com
Message-Id: <E1pZ2fj-000e1B-Kg@formenos.hmeau.com>
Subject: [Linux-stm32] [v5 PATCH 3/7] crypto: stm32 - Simplify finup
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

The current finup code is unnecessarily convoluted.  There is no
need to call update and final separately as update already does
all the necessary work on its own.

Simplify this by utilising the HASH_FLAGS_FINUP bit in rctx to
indicate only finup and use the HASH_FLAGS_FINAL bit instead to
signify processing common to both final and finup.

Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>
---

 drivers/crypto/stm32/stm32-hash.c |   41 +++++++++++++++++---------------------
 1 file changed, 19 insertions(+), 22 deletions(-)

diff --git a/drivers/crypto/stm32/stm32-hash.c b/drivers/crypto/stm32/stm32-hash.c
index 298cabd29e36..e16f9aaec6bf 100644
--- a/drivers/crypto/stm32/stm32-hash.c
+++ b/drivers/crypto/stm32/stm32-hash.c
@@ -417,7 +417,7 @@ static int stm32_hash_update_cpu(struct stm32_hash_dev *hdev)
 
 	dev_dbg(hdev->dev, "%s flags %lx\n", __func__, rctx->flags);
 
-	final = (rctx->flags & HASH_FLAGS_FINUP);
+	final = rctx->flags & HASH_FLAGS_FINAL;
 
 	while ((rctx->total >= rctx->buflen) ||
 	       (rctx->bufcnt + rctx->total >= rctx->buflen)) {
@@ -761,6 +761,11 @@ static int stm32_hash_init(struct ahash_request *req)
 
 static int stm32_hash_update_req(struct stm32_hash_dev *hdev)
 {
+	struct stm32_hash_request_ctx *rctx = ahash_request_ctx(hdev->req);
+
+	if (!(rctx->flags & HASH_FLAGS_CPU))
+		return stm32_hash_dma_send(hdev);
+
 	return stm32_hash_update_cpu(hdev);
 }
 
@@ -768,17 +773,14 @@ static int stm32_hash_final_req(struct stm32_hash_dev *hdev)
 {
 	struct ahash_request *req = hdev->req;
 	struct stm32_hash_request_ctx *rctx = ahash_request_ctx(req);
-	int err;
 	int buflen = rctx->bufcnt;
 
-	rctx->bufcnt = 0;
+	if (rctx->flags & HASH_FLAGS_FINUP)
+		return stm32_hash_update_req(hdev);
 
-	if (!(rctx->flags & HASH_FLAGS_CPU))
-		err = stm32_hash_dma_send(hdev);
-	else
-		err = stm32_hash_xmit_cpu(hdev, rctx->buffer, buflen, 1);
+	rctx->bufcnt = 0;
 
-	return err;
+	return stm32_hash_xmit_cpu(hdev, rctx->buffer, buflen, 1);
 }
 
 static void stm32_hash_emptymsg_fallback(struct ahash_request *req)
@@ -1000,7 +1002,7 @@ static int stm32_hash_final(struct ahash_request *req)
 {
 	struct stm32_hash_request_ctx *rctx = ahash_request_ctx(req);
 
-	rctx->flags |= HASH_FLAGS_FINUP;
+	rctx->flags |= HASH_FLAGS_FINAL;
 
 	return stm32_hash_enqueue(req, HASH_OP_FINAL);
 }
@@ -1010,25 +1012,20 @@ static int stm32_hash_finup(struct ahash_request *req)
 	struct stm32_hash_request_ctx *rctx = ahash_request_ctx(req);
 	struct stm32_hash_ctx *ctx = crypto_ahash_ctx(crypto_ahash_reqtfm(req));
 	struct stm32_hash_dev *hdev = stm32_hash_find_dev(ctx);
-	int err1, err2;
+
+	if (!req->nbytes)
+		goto out;
 
 	rctx->flags |= HASH_FLAGS_FINUP;
+	rctx->total = req->nbytes;
+	rctx->sg = req->src;
+	rctx->offset = 0;
 
 	if (hdev->dma_lch && stm32_hash_dma_aligned_data(req))
 		rctx->flags &= ~HASH_FLAGS_CPU;
 
-	err1 = stm32_hash_update(req);
-
-	if (err1 == -EINPROGRESS || err1 == -EBUSY)
-		return err1;
-
-	/*
-	 * final() has to be always called to cleanup resources
-	 * even if update() failed, except EINPROGRESS
-	 */
-	err2 = stm32_hash_final(req);
-
-	return err1 ?: err2;
+out:
+	return stm32_hash_final(req);
 }
 
 static int stm32_hash_digest(struct ahash_request *req)
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
