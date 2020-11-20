Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E99F2BAC11
	for <lists+linux-stm32@lfdr.de>; Fri, 20 Nov 2020 15:42:49 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 473D8C56638;
	Fri, 20 Nov 2020 14:42:49 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 233E3C56632
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 20 Nov 2020 14:33:42 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AKEXHHZ018448; Fri, 20 Nov 2020 15:33:31 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=E9kJGNt1mLYDS6pj2G2ES1qpvtEVVewRXb6bBj3rbxA=;
 b=syq32dy8KOR8+W6S9XbTrUN8OtoTFu9XbAt95eZKm3nxu/LOC7xqleI7LiEsnxZZJoOD
 E74I2UcMKSEUNe43XwKH+5eOb6K/AJ/mZsMoZt/7FJcvkxRV4OXoG4OIa22pnQ6WsEbt
 WCuiZjFeIip7oFAsDBVgCYvvPeqQpJKZC5PLc+xpUCXK9o4dtM5tpRM7/RCkbZzEjP2u
 /5/ec6CeI6bACw5ZihM5rOvoEauDAvshtks78TCC/oMQMa3i14ueNHWTi9bdni7IcKjn
 O40bhlxxX3d4H5UGbuUBkGJ5mUcORIogyvm9N5HPMeoRo6xy5cFDlft4yD/GKfUyBZjH WQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34t58d7ufa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 Nov 2020 15:33:31 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id EEDB910002A;
 Fri, 20 Nov 2020 15:33:30 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E31FE2777DE;
 Fri, 20 Nov 2020 15:33:30 +0100 (CET)
Received: from localhost (10.75.127.45) by SFHDAG3NODE2.st.com (10.75.127.8)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 20 Nov 2020 15:33:30
 +0100
From: Amelie Delaunay <amelie.delaunay@st.com>
To: Vinod Koul <vkoul@kernel.org>, Dan Williams <dan.j.williams@intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@st.com>
Date: Fri, 20 Nov 2020 15:33:20 +0100
Message-ID: <20201120143320.30367-5-amelie.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201120143320.30367-1-amelie.delaunay@st.com>
References: <20201120143320.30367-1-amelie.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG1NODE1.st.com (10.75.127.1) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-20_07:2020-11-20,
 2020-11-20 signatures=0
X-Mailman-Approved-At: Fri, 20 Nov 2020 14:42:45 +0000
Cc: Amelie Delaunay <amelie.delaunay@st.com>, linux-kernel@vger.kernel.org,
 Pierre-Yves MORDRET <pierre-yves.mordret@st.com>, dmaengine@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 4/4] dmaengine: stm32-mdma: rework interrupt
	handler
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

To avoid multiple entries in MDMA interrupt handler for each flag&interrupt
enable, manage all flags set at once.

Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>
---
 drivers/dma/stm32-mdma.c | 64 +++++++++++++++++++++-------------------
 1 file changed, 34 insertions(+), 30 deletions(-)

diff --git a/drivers/dma/stm32-mdma.c b/drivers/dma/stm32-mdma.c
index 29e5e30524bb..e4637ec786d3 100644
--- a/drivers/dma/stm32-mdma.c
+++ b/drivers/dma/stm32-mdma.c
@@ -1346,7 +1346,7 @@ static irqreturn_t stm32_mdma_irq_handler(int irq, void *devid)
 {
 	struct stm32_mdma_device *dmadev = devid;
 	struct stm32_mdma_chan *chan = devid;
-	u32 reg, id, ien, status, flag;
+	u32 reg, id, ccr, ien, status;
 
 	/* Find out which channel generates the interrupt */
 	status = readl_relaxed(dmadev->base + STM32_MDMA_GISR0);
@@ -1368,67 +1368,71 @@ static irqreturn_t stm32_mdma_irq_handler(int irq, void *devid)
 
 	chan = &dmadev->chan[id];
 	if (!chan) {
-		dev_dbg(mdma2dev(dmadev), "MDMA channel not initialized\n");
-		goto exit;
+		dev_warn(mdma2dev(dmadev), "MDMA channel not initialized\n");
+		return IRQ_NONE;
 	}
 
 	/* Handle interrupt for the channel */
 	spin_lock(&chan->vchan.lock);
-	status = stm32_mdma_read(dmadev, STM32_MDMA_CISR(chan->id));
-	ien = stm32_mdma_read(dmadev, STM32_MDMA_CCR(chan->id));
-	ien &= STM32_MDMA_CCR_IRQ_MASK;
-	ien >>= 1;
+	status = stm32_mdma_read(dmadev, STM32_MDMA_CISR(id));
+	/* Mask Channel ReQuest Active bit which can be set in case of MEM2MEM */
+	status &= ~STM32_MDMA_CISR_CRQA;
+	ccr = stm32_mdma_read(dmadev, STM32_MDMA_CCR(id));
+	ien = (ccr & STM32_MDMA_CCR_IRQ_MASK) >> 1;
 
 	if (!(status & ien)) {
 		spin_unlock(&chan->vchan.lock);
-		dev_dbg(chan2dev(chan),
-			"spurious it (status=0x%04x, ien=0x%04x)\n",
-			status, ien);
+		dev_warn(chan2dev(chan),
+			 "spurious it (status=0x%04x, ien=0x%04x)\n",
+			 status, ien);
 		return IRQ_NONE;
 	}
 
-	flag = __ffs(status & ien);
-	reg = STM32_MDMA_CIFCR(chan->id);
+	reg = STM32_MDMA_CIFCR(id);
 
-	switch (1 << flag) {
-	case STM32_MDMA_CISR_TEIF:
-		id = chan->id;
-		status = readl_relaxed(dmadev->base + STM32_MDMA_CESR(id));
-		dev_err(chan2dev(chan), "Transfer Err: stat=0x%08x\n", status);
+	if (status & STM32_MDMA_CISR_TEIF) {
+		dev_err(chan2dev(chan), "Transfer Err: stat=0x%08x\n",
+			readl_relaxed(dmadev->base + STM32_MDMA_CESR(id)));
 		stm32_mdma_set_bits(dmadev, reg, STM32_MDMA_CIFCR_CTEIF);
-		break;
+		status &= ~STM32_MDMA_CISR_TEIF;
+	}
 
-	case STM32_MDMA_CISR_CTCIF:
+	if (status & STM32_MDMA_CISR_CTCIF) {
 		stm32_mdma_set_bits(dmadev, reg, STM32_MDMA_CIFCR_CCTCIF);
+		status &= ~STM32_MDMA_CISR_CTCIF;
 		stm32_mdma_xfer_end(chan);
-		break;
+	}
 
-	case STM32_MDMA_CISR_BRTIF:
+	if (status & STM32_MDMA_CISR_BRTIF) {
 		stm32_mdma_set_bits(dmadev, reg, STM32_MDMA_CIFCR_CBRTIF);
-		break;
+		status &= ~STM32_MDMA_CISR_BRTIF;
+	}
 
-	case STM32_MDMA_CISR_BTIF:
+	if (status & STM32_MDMA_CISR_BTIF) {
 		stm32_mdma_set_bits(dmadev, reg, STM32_MDMA_CIFCR_CBTIF);
+		status &= ~STM32_MDMA_CISR_BTIF;
 		chan->curr_hwdesc++;
 		if (chan->desc && chan->desc->cyclic) {
 			if (chan->curr_hwdesc == chan->desc->count)
 				chan->curr_hwdesc = 0;
 			vchan_cyclic_callback(&chan->desc->vdesc);
 		}
-		break;
+	}
 
-	case STM32_MDMA_CISR_TCIF:
+	if (status & STM32_MDMA_CISR_TCIF) {
 		stm32_mdma_set_bits(dmadev, reg, STM32_MDMA_CIFCR_CLTCIF);
-		break;
+		status &= ~STM32_MDMA_CISR_TCIF;
+	}
 
-	default:
-		dev_err(chan2dev(chan), "it %d unhandled (status=0x%04x)\n",
-			1 << flag, status);
+	if (status) {
+		stm32_mdma_set_bits(dmadev, reg, status);
+		dev_err(chan2dev(chan), "DMA error: status=0x%08x\n", status);
+		if (!(ccr & STM32_MDMA_CCR_EN))
+			dev_err(chan2dev(chan), "chan disabled by HW\n");
 	}
 
 	spin_unlock(&chan->vchan.lock);
 
-exit:
 	return IRQ_HANDLED;
 }
 
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
