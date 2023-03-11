Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A5F06B59E8
	for <lists+linux-stm32@lfdr.de>; Sat, 11 Mar 2023 10:09:43 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 34066C6A60D;
	Sat, 11 Mar 2023 09:09:43 +0000 (UTC)
Received: from 167-179-156-38.a7b39c.syd.nbn.aussiebb.net
 (167-179-156-38.a7b39c.syd.nbn.aussiebb.net [167.179.156.38])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0F4EAC6A603
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 11 Mar 2023 09:09:41 +0000 (UTC)
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
 by formenos.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
 id 1pavE9-002xbB-Cx; Sat, 11 Mar 2023 17:09:22 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation);
 Sat, 11 Mar 2023 17:09:21 +0800
From: "Herbert Xu" <herbert@gondor.apana.org.au>
Date: Sat, 11 Mar 2023 17:09:21 +0800
References: <ZAxFBR3TdA7jUAgJ@gondor.apana.org.au>
To: Linus Walleij <linus.walleij@linaro.org>,
 Lionel Debieve <lionel.debieve@foss.st.com>, Li kunyu <kunyu@nfschina.com>,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org,
 linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, mcoquelin.stm32@gmail.com
Message-Id: <E1pavE9-002xbB-Cx@formenos.hmeau.com>
Subject: [Linux-stm32] [v7 PATCH 6/8] crypto: stm32 - Remove unused
	HASH_FLAGS_ERRORS
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

The bit HASH_FLAGS_ERRORS was never used.  Remove it.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Tested-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>
---

 drivers/crypto/stm32/stm32-hash.c |    4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/crypto/stm32/stm32-hash.c b/drivers/crypto/stm32/stm32-hash.c
index c836163a9fd4..478822fc7a4e 100644
--- a/drivers/crypto/stm32/stm32-hash.c
+++ b/drivers/crypto/stm32/stm32-hash.c
@@ -95,7 +95,6 @@
 #define HASH_FLAGS_SHA1			BIT(19)
 #define HASH_FLAGS_SHA224		BIT(20)
 #define HASH_FLAGS_SHA256		BIT(21)
-#define HASH_FLAGS_ERRORS		BIT(22)
 #define HASH_FLAGS_HMAC			BIT(23)
 
 #define HASH_OP_UPDATE			1
@@ -873,7 +872,6 @@ static int stm32_hash_finish(struct ahash_request *req)
 static void stm32_hash_finish_req(struct ahash_request *req, int err)
 {
 	struct stm32_hash_request_ctx *rctx = ahash_request_ctx(req);
-	struct stm32_hash_state *state = &rctx->state;
 	struct stm32_hash_dev *hdev = rctx->hdev;
 
 	if (!err && (HASH_FLAGS_FINAL & hdev->flags)) {
@@ -884,8 +882,6 @@ static void stm32_hash_finish_req(struct ahash_request *req, int err)
 				 HASH_FLAGS_OUTPUT_READY | HASH_FLAGS_HMAC |
 				 HASH_FLAGS_HMAC_INIT | HASH_FLAGS_HMAC_FINAL |
 				 HASH_FLAGS_HMAC_KEY);
-	} else {
-		state->flags |= HASH_FLAGS_ERRORS;
 	}
 
 	pm_runtime_mark_last_busy(hdev->dev);
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
