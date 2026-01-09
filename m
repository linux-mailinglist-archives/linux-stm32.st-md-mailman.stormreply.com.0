Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 40810D0A99C
	for <lists+linux-stm32@lfdr.de>; Fri, 09 Jan 2026 15:22:56 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C19D2C8F286;
	Fri,  9 Jan 2026 14:22:55 +0000 (UTC)
Received: from out-180.mta1.migadu.com (out-180.mta1.migadu.com
 [95.215.58.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D6B67C1A97C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  9 Jan 2026 14:22:53 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1767968573;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=jPCJvVh7QKX2iSMtWwv7GRsl36Brtuua2rgRr5lzIng=;
 b=SvjBQCu6HinEYypeIlRCycdHJPXWxUEM9YhGoWwPsDqgIQIyPIOkVozJQWtRaDb7pJ2IyQ
 Z+F3Xr7/AuwBsEjdt7I6UhgkYoj+f7MW5/kxaS7GFypiyqbDYvNvBmtK6fTCCH0u37c8rc
 FVISSmfcWOZE21+gm6wl1tNTf5zaRBo=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Date: Fri,  9 Jan 2026 15:20:36 +0100
Message-ID: <20260109142039.220729-2-thorsten.blum@linux.dev>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
Cc: linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Thorsten Blum <thorsten.blum@linux.dev>, linux-arm-kernel@lists.infradead.org,
 linux-crypto@vger.kernel.org
Subject: [Linux-stm32] [PATCH] crypto: stm32 - Remove unnecessary checks
	before calling memcpy
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

memcpy() can be safely called with size 0, which is a no-op. Remove the
unnecessary checks before calling memcpy().

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 drivers/crypto/stm32/stm32-hash.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/crypto/stm32/stm32-hash.c b/drivers/crypto/stm32/stm32-hash.c
index a4436728b0db..d60147a7594e 100644
--- a/drivers/crypto/stm32/stm32-hash.c
+++ b/drivers/crypto/stm32/stm32-hash.c
@@ -1115,8 +1115,7 @@ static int stm32_hash_copy_sgs(struct stm32_hash_request_ctx *rctx,
 		return -ENOMEM;
 	}
 
-	if (state->bufcnt)
-		memcpy(buf, rctx->hdev->xmit_buf, state->bufcnt);
+	memcpy(buf, rctx->hdev->xmit_buf, state->bufcnt);
 
 	scatterwalk_map_and_copy(buf + state->bufcnt, sg, rctx->offset,
 				 min(new_len, rctx->total) - state->bufcnt, 0);
@@ -1300,8 +1299,7 @@ static int stm32_hash_prepare_request(struct ahash_request *req)
 	}
 
 	/* copy buffer in a temporary one that is used for sg alignment */
-	if (state->bufcnt)
-		memcpy(hdev->xmit_buf, state->buffer, state->bufcnt);
+	memcpy(hdev->xmit_buf, state->buffer, state->bufcnt);
 
 	ret = stm32_hash_align_sgs(req->src, nbytes, bs, init, final, rctx);
 	if (ret)
-- 
Thorsten Blum <thorsten.blum@linux.dev>
GPG: 1D60 735E 8AEF 3BE4 73B6  9D84 7336 78FD 8DFE EAD4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
