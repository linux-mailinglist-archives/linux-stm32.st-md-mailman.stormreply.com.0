Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9636E444862
	for <lists+linux-stm32@lfdr.de>; Wed,  3 Nov 2021 19:38:52 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 46B99C5E2CA;
	Wed,  3 Nov 2021 18:38:52 +0000 (UTC)
Received: from smtp.smtpout.orange.fr (smtp03.smtpout.orange.fr
 [80.12.242.125])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AE759C5E2C5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 Nov 2021 18:38:50 +0000 (UTC)
Received: from pop-os.home ([86.243.171.122]) by smtp.orange.fr with ESMTPA
 id iL9rmt2JpUGqliL9rmrujg; Wed, 03 Nov 2021 19:38:50 +0100
X-ME-Helo: pop-os.home
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Wed, 03 Nov 2021 19:38:50 +0100
X-ME-IP: 86.243.171.122
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: mathieu.poirier@linaro.org, suzuki.poulose@arm.com, mike.leach@linaro.org,
 leo.yan@linaro.org, alexander.shishkin@linux.intel.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com
Date: Wed,  3 Nov 2021 19:38:45 +0100
Message-Id: <e25aa2a804972c5d4f06c4c4e0511e11ff97a425.1630083668.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1630083668.git.christophe.jaillet@wanadoo.fr>
References: <cover.1630083668.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Cc: coresight@lists.linaro.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v1 1/4] char: xillybus: Remove usage of the
	deprecated 'pci-dma-compat.h' API
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

In [1], Christoph Hellwig has proposed to remove the wrappers in
include/linux/pci-dma-compat.h.

Some reasons why this API should be removed have been given by Julia
Lawall in [2].

A coccinelle script has been used to perform the needed transformation
Only relevant part are given below.

'xilly_pci_direction()' has been hand modified to simplify it slightly.

It has been compile tested.


@@ @@
-    PCI_DMA_BIDIRECTIONAL
+    DMA_BIDIRECTIONAL

@@ @@
-    PCI_DMA_TODEVICE
+    DMA_TO_DEVICE

@@ @@
-    PCI_DMA_FROMDEVICE
+    DMA_FROM_DEVICE

@@
expression e1, e2;
@@
-    pci_set_dma_mask(e1, e2)
+    dma_set_mask(&e1->dev, e2)

[1]: https://lore.kernel.org/kernel-janitors/20200421081257.GA131897@infradead.org/
[2]: https://lore.kernel.org/kernel-janitors/alpine.DEB.2.22.394.2007120902170.2424@hadrien/

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/char/xillybus/xillybus_pcie.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/char/xillybus/xillybus_pcie.c b/drivers/char/xillybus/xillybus_pcie.c
index bdf1c366b4fc..be25bfdb0d9a 100644
--- a/drivers/char/xillybus/xillybus_pcie.c
+++ b/drivers/char/xillybus/xillybus_pcie.c
@@ -36,11 +36,10 @@ static int xilly_pci_direction(int direction)
 {
 	switch (direction) {
 	case DMA_TO_DEVICE:
-		return PCI_DMA_TODEVICE;
 	case DMA_FROM_DEVICE:
-		return PCI_DMA_FROMDEVICE;
+		return direction;
 	default:
-		return PCI_DMA_BIDIRECTIONAL;
+		return DMA_BIDIRECTIONAL;
 	}
 }
 
@@ -185,9 +184,9 @@ static int xilly_probe(struct pci_dev *pdev,
 	 * So go for the 64-bit mask only when failing is the other option.
 	 */
 
-	if (!pci_set_dma_mask(pdev, DMA_BIT_MASK(32))) {
+	if (!dma_set_mask(&pdev->dev, DMA_BIT_MASK(32))) {
 		endpoint->dma_using_dac = 0;
-	} else if (!pci_set_dma_mask(pdev, DMA_BIT_MASK(64))) {
+	} else if (!dma_set_mask(&pdev->dev, DMA_BIT_MASK(64))) {
 		endpoint->dma_using_dac = 1;
 	} else {
 		dev_err(endpoint->dev, "Failed to set DMA mask. Aborting.\n");
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
