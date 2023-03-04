Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B0DD6AA8EC
	for <lists+linux-stm32@lfdr.de>; Sat,  4 Mar 2023 10:37:33 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 62EDEC6A5FC;
	Sat,  4 Mar 2023 09:37:33 +0000 (UTC)
Received: from 167-179-156-38.a7b39c.syd.nbn.aussiebb.net
 (167-179-156-38.a7b39c.syd.nbn.aussiebb.net [167.179.156.38])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 08144C6A5E8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  4 Mar 2023 09:37:31 +0000 (UTC)
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
 by formenos.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
 id 1pYOKF-000GYm-MW; Sat, 04 Mar 2023 17:37:12 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation);
 Sat, 04 Mar 2023 17:37:11 +0800
From: "Herbert Xu" <herbert@gondor.apana.org.au>
Date: Sat, 04 Mar 2023 17:37:11 +0800
References: <ZAMQjOdi8GfqDUQI@gondor.apana.org.au>
To: Linus Walleij <linus.walleij@linaro.org>,
 Lionel Debieve <lionel.debieve@foss.st.com>, Li kunyu <kunyu@nfschina.com>,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org,
 linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, mcoquelin.stm32@gmail.com
Message-Id: <E1pYOKF-000GYm-MW@formenos.hmeau.com>
Subject: [Linux-stm32] [v5 PATCH 2/7] crypto: stm32 - Move polling into
	do_one_request
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

There is no need to poll separate for update and final.  We could
merge them into do_one_request.

Also fix the error handling so that we don't poll (and overwrite
the error) when an error has already occurred.

Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>
---

 drivers/crypto/stm32/stm32-hash.c |   29 ++++++++++++-----------------
 1 file changed, 12 insertions(+), 17 deletions(-)

diff --git a/drivers/crypto/stm32/stm32-hash.c b/drivers/crypto/stm32/stm32-hash.c
index bde2b40a6a32..298cabd29e36 100644
--- a/drivers/crypto/stm32/stm32-hash.c
+++ b/drivers/crypto/stm32/stm32-hash.c
@@ -425,6 +425,8 @@ static int stm32_hash_update_cpu(struct stm32_hash_dev *hdev)
 		bufcnt = rctx->bufcnt;
 		rctx->bufcnt = 0;
 		err = stm32_hash_xmit_cpu(hdev, rctx->buffer, bufcnt, 0);
+		if (err)
+			return err;
 	}
 
 	stm32_hash_append_sg(rctx);
@@ -433,14 +435,6 @@ static int stm32_hash_update_cpu(struct stm32_hash_dev *hdev)
 		bufcnt = rctx->bufcnt;
 		rctx->bufcnt = 0;
 		err = stm32_hash_xmit_cpu(hdev, rctx->buffer, bufcnt, 1);
-
-		/* If we have an IRQ, wait for that, else poll for completion */
-		if (hdev->polled) {
-			if (stm32_hash_wait_busy(hdev))
-				return -ETIMEDOUT;
-			hdev->flags |= HASH_FLAGS_OUTPUT_READY;
-			err = 0;
-		}
 	}
 
 	return err;
@@ -784,15 +778,6 @@ static int stm32_hash_final_req(struct stm32_hash_dev *hdev)
 	else
 		err = stm32_hash_xmit_cpu(hdev, rctx->buffer, buflen, 1);
 
-	/* If we have an IRQ, wait for that, else poll for completion */
-	if (hdev->polled) {
-		if (stm32_hash_wait_busy(hdev))
-			return -ETIMEDOUT;
-		hdev->flags |= HASH_FLAGS_OUTPUT_READY;
-		/* Caller will call stm32_hash_finish_req() */
-		err = 0;
-	}
-
 	return err;
 }
 
@@ -964,6 +949,16 @@ static int stm32_hash_one_request(struct crypto_engine *engine, void *areq)
 	else if (rctx->op == HASH_OP_FINAL)
 		err = stm32_hash_final_req(hdev);
 
+	/* If we have an IRQ, wait for that, else poll for completion */
+	if (err == -EINPROGRESS && hdev->polled) {
+		if (stm32_hash_wait_busy(hdev))
+			err = -ETIMEDOUT;
+		else {
+			hdev->flags |= HASH_FLAGS_OUTPUT_READY;
+			err = 0;
+		}
+	}
+
 	if (err != -EINPROGRESS)
 	/* done task will not finish it, so do it here */
 		stm32_hash_finish_req(req, err);
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
