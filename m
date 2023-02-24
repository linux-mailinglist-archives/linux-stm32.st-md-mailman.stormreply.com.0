Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 87ED36A161E
	for <lists+linux-stm32@lfdr.de>; Fri, 24 Feb 2023 06:08:53 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 228C0C6904B;
	Fri, 24 Feb 2023 05:08:53 +0000 (UTC)
Received: from 167-179-156-38.a7b39c.syd.nbn.aussiebb.net
 (167-179-156-38.a7b39c.syd.nbn.aussiebb.net [167.179.156.38])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DB22DC65E70
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Feb 2023 05:08:50 +0000 (UTC)
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
 by formenos.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
 id 1pVQJv-00F7Zc-9h; Fri, 24 Feb 2023 13:08:36 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation);
 Fri, 24 Feb 2023 13:08:35 +0800
Date: Fri, 24 Feb 2023 13:08:35 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Lionel Debieve <lionel.debieve@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com, mcoquelin.stm32@gmail.com
Message-ID: <Y/hGU7r56Phsz3wN@gondor.apana.org.au>
MIME-Version: 1.0
Content-Disposition: inline
Subject: [Linux-stm32] [PATCH] crypto: stm32 - Fix empty message checks
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

The empty message checks may trigger on non-empty messages split
over an update operation followed by a final operation (where
req->nbytes can/should be set to zero).

Fixes: b56403a25af7 ("crypto: stm32/hash - Support Ux500 hash")
Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>

diff --git a/drivers/crypto/stm32/stm32-hash.c b/drivers/crypto/stm32/stm32-hash.c
index 7bf805563ac2..acf8bfc8de4b 100644
--- a/drivers/crypto/stm32/stm32-hash.c
+++ b/drivers/crypto/stm32/stm32-hash.c
@@ -148,6 +148,7 @@ struct stm32_hash_request_ctx {
 	int			nents;
 
 	u8			data_type;
+	bool			nonempty;
 
 	u8 buffer[HASH_BUFLEN] __aligned(sizeof(u32));
 
@@ -310,7 +311,7 @@ static void stm32_hash_write_ctrl(struct stm32_hash_dev *hdev, int bufcnt)
 		 * On the Ux500 we need to set a special flag to indicate that
 		 * the message is zero length.
 		 */
-		if (hdev->pdata->ux500 && bufcnt == 0)
+		if (hdev->pdata->ux500 && !rctx->nonempty)
 			reg |= HASH_CR_UX500_EMPTYMSG;
 
 		if (!hdev->polled)
@@ -754,6 +755,7 @@ static int stm32_hash_init(struct ahash_request *req)
 	rctx->total = 0;
 	rctx->offset = 0;
 	rctx->data_type = HASH_DATA_8_BITS;
+	rctx->nonempty = false;
 
 	memset(rctx->buffer, 0, HASH_BUFLEN);
 
@@ -832,7 +834,7 @@ static void stm32_hash_copy_hash(struct ahash_request *req)
 	__be32 *hash = (void *)rctx->digest;
 	unsigned int i, hashsize;
 
-	if (hdev->pdata->broken_emptymsg && !req->nbytes)
+	if (hdev->pdata->broken_emptymsg && !rctx->nonempty)
 		return stm32_hash_emptymsg_fallback(req);
 
 	switch (rctx->flags & HASH_FLAGS_ALGO_MASK) {
@@ -986,6 +988,8 @@ static int stm32_hash_update(struct ahash_request *req)
 {
 	struct stm32_hash_request_ctx *rctx = ahash_request_ctx(req);
 
+	rctx->nonempty = !!req->nbytes;
+
 	if (!req->nbytes || !(rctx->flags & HASH_FLAGS_CPU))
 		return 0;
 
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
