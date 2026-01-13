Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 78362D174BC
	for <lists+linux-stm32@lfdr.de>; Tue, 13 Jan 2026 09:31:50 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 21448C87ED6;
	Tue, 13 Jan 2026 08:31:50 +0000 (UTC)
Received: from out-180.mta0.migadu.com (out-180.mta0.migadu.com
 [91.218.175.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A78F9C0693D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Jan 2026 08:31:48 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1768293107;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=5s+0rDdp0xucx1mfaPO37Eu5HjJOMe4rckgTaeXS34k=;
 b=iEdkK8qBk9VWUL0M3zQikilw1NJeTx6un8VSq0b+VCtVm3MvKEX5LIcodzALPIFuXLDv+2
 epebbRxlV9Dm209cjSzVpO2vmX4U0cu+FTTMbarWYrxPKv+MnImQJ/XhUBxOAzvRWMCnYm
 b5e4YqOXYz3iswna0CMjRc475tuyAP0=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 =?UTF-8?q?Maxime=20M=C3=A9r=C3=A9?= <maxime.mere@foss.st.com>,
 Eric Biggers <ebiggers@google.com>, Colin Ian King <colin.i.king@gmail.com>
Date: Tue, 13 Jan 2026 09:31:28 +0100
Message-ID: <20260113083130.790316-2-thorsten.blum@linux.dev>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
Cc: linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Thorsten Blum <thorsten.blum@linux.dev>, linux-arm-kernel@lists.infradead.org,
 linux-crypto@vger.kernel.org
Subject: [Linux-stm32] [PATCH] crypto: stm32 - Replace min_t(size_t) with
	just min()
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

In most cases, min_t(size_t) and explicit casting are unnecessary
because the values ->hw_blocksize, ->payload_{in,out}, and ->header_in
are already of type 'size_t'. Use the simpler min() macro instead.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 drivers/crypto/stm32/stm32-cryp.c | 29 ++++++++++++++---------------
 1 file changed, 14 insertions(+), 15 deletions(-)

diff --git a/drivers/crypto/stm32/stm32-cryp.c b/drivers/crypto/stm32/stm32-cryp.c
index 5e82e8a1f71a..d206eddb67bf 100644
--- a/drivers/crypto/stm32/stm32-cryp.c
+++ b/drivers/crypto/stm32/stm32-cryp.c
@@ -21,6 +21,7 @@
 #include <linux/interrupt.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/minmax.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
@@ -1922,20 +1923,19 @@ static void stm32_cryp_irq_read_data(struct stm32_cryp *cryp)
 	u32 block[AES_BLOCK_32];
 
 	readsl(cryp->regs + cryp->caps->dout, block, cryp->hw_blocksize / sizeof(u32));
-	memcpy_to_scatterwalk(&cryp->out_walk, block, min_t(size_t, cryp->hw_blocksize,
-							    cryp->payload_out));
-	cryp->payload_out -= min_t(size_t, cryp->hw_blocksize,
-				   cryp->payload_out);
+	memcpy_to_scatterwalk(&cryp->out_walk, block, min(cryp->hw_blocksize,
+							  cryp->payload_out));
+	cryp->payload_out -= min(cryp->hw_blocksize, cryp->payload_out);
 }
 
 static void stm32_cryp_irq_write_block(struct stm32_cryp *cryp)
 {
 	u32 block[AES_BLOCK_32] = {0};
 
-	memcpy_from_scatterwalk(block, &cryp->in_walk, min_t(size_t, cryp->hw_blocksize,
-							     cryp->payload_in));
+	memcpy_from_scatterwalk(block, &cryp->in_walk, min(cryp->hw_blocksize,
+							   cryp->payload_in));
 	writesl(cryp->regs + cryp->caps->din, block, cryp->hw_blocksize / sizeof(u32));
-	cryp->payload_in -= min_t(size_t, cryp->hw_blocksize, cryp->payload_in);
+	cryp->payload_in -= min(cryp->hw_blocksize, cryp->payload_in);
 }
 
 static void stm32_cryp_irq_write_gcm_padded_data(struct stm32_cryp *cryp)
@@ -1980,10 +1980,9 @@ static void stm32_cryp_irq_write_gcm_padded_data(struct stm32_cryp *cryp)
 	 */
 	readsl(cryp->regs + cryp->caps->dout, block, cryp->hw_blocksize / sizeof(u32));
 
-	memcpy_to_scatterwalk(&cryp->out_walk, block, min_t(size_t, cryp->hw_blocksize,
-							    cryp->payload_out));
-	cryp->payload_out -= min_t(size_t, cryp->hw_blocksize,
-				   cryp->payload_out);
+	memcpy_to_scatterwalk(&cryp->out_walk, block, min(cryp->hw_blocksize,
+							  cryp->payload_out));
+	cryp->payload_out -= min(cryp->hw_blocksize, cryp->payload_out);
 
 	/* d) change mode back to AES GCM */
 	cfg &= ~CR_ALGO_MASK;
@@ -2078,9 +2077,9 @@ static void stm32_cryp_irq_write_ccm_padded_data(struct stm32_cryp *cryp)
 	 */
 	readsl(cryp->regs + cryp->caps->dout, block, cryp->hw_blocksize / sizeof(u32));
 
-	memcpy_to_scatterwalk(&cryp->out_walk, block, min_t(size_t, cryp->hw_blocksize,
-							    cryp->payload_out));
-	cryp->payload_out -= min_t(size_t, cryp->hw_blocksize, cryp->payload_out);
+	memcpy_to_scatterwalk(&cryp->out_walk, block, min(cryp->hw_blocksize,
+							  cryp->payload_out));
+	cryp->payload_out -= min(cryp->hw_blocksize, cryp->payload_out);
 
 	/* d) Load again CRYP_CSGCMCCMxR */
 	for (i = 0; i < ARRAY_SIZE(cstmp2); i++)
@@ -2158,7 +2157,7 @@ static void stm32_cryp_irq_write_gcmccm_header(struct stm32_cryp *cryp)
 	u32 block[AES_BLOCK_32] = {0};
 	size_t written;
 
-	written = min_t(size_t, AES_BLOCK_SIZE, cryp->header_in);
+	written = min(AES_BLOCK_SIZE, cryp->header_in);
 
 	memcpy_from_scatterwalk(block, &cryp->in_walk, written);
 
-- 
Thorsten Blum <thorsten.blum@linux.dev>
GPG: 1D60 735E 8AEF 3BE4 73B6  9D84 7336 78FD 8DFE EAD4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
