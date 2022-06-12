Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E0D93547F67
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Jun 2022 08:10:56 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A7D43C628A4;
	Mon, 13 Jun 2022 06:10:56 +0000 (UTC)
Received: from mail.ispras.ru (mail.ispras.ru [83.149.199.84])
 (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1C10EC5F1F2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 12 Jun 2022 22:24:23 +0000 (UTC)
Received: from hednb3.intra.ispras.ru (unknown [109.252.137.140])
 by mail.ispras.ru (Postfix) with ESMTPSA id 1E71A40D403E;
 Sun, 12 Jun 2022 22:24:15 +0000 (UTC)
From: Alexey Khoroshilov <khoroshilov@ispras.ru>
To: Vinod Koul <vkoul@kernel.org>,
	Amelie Delaunay <amelie.delaunay@st.com>
Date: Mon, 13 Jun 2022 01:23:58 +0300
Message-Id: <1655072638-9103-1-git-send-email-khoroshilov@ispras.ru>
X-Mailer: git-send-email 2.7.4
X-Mailman-Approved-At: Mon, 13 Jun 2022 06:10:54 +0000
Cc: dmaengine@vger.kernel.org, ldv-project@linuxtesting.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Alexey Khoroshilov <khoroshilov@ispras.ru>, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH] dmaengine: stm32-mdma: Remove dead code in
	stm32_mdma_irq_handler()
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

Local variable chan is initialized by an address of element of chan array
that is part of stm32_mdma_device struct, so it does not make sense to
compare chan with NULL.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Signed-off-by: Alexey Khoroshilov <khoroshilov@ispras.ru>
Fixes: a4ffb13c8946 ("dmaengine: Add STM32 MDMA driver")
---
 drivers/dma/stm32-mdma.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/dma/stm32-mdma.c b/drivers/dma/stm32-mdma.c
index caf0cce8f528..b11927ed4367 100644
--- a/drivers/dma/stm32-mdma.c
+++ b/drivers/dma/stm32-mdma.c
@@ -1328,12 +1328,7 @@ static irqreturn_t stm32_mdma_irq_handler(int irq, void *devid)
 		return IRQ_NONE;
 	}
 	id = __ffs(status);
-
 	chan = &dmadev->chan[id];
-	if (!chan) {
-		dev_warn(mdma2dev(dmadev), "MDMA channel not initialized\n");
-		return IRQ_NONE;
-	}
 
 	/* Handle interrupt for the channel */
 	spin_lock(&chan->vchan.lock);
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
