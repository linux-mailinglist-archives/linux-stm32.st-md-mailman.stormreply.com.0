Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E79CF609CDC
	for <lists+linux-stm32@lfdr.de>; Mon, 24 Oct 2022 10:36:33 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AA7B3C03FC9;
	Mon, 24 Oct 2022 08:36:33 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2E1EBC03FC4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 24 Oct 2022 08:36:30 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29O6kuPT019014;
 Mon, 24 Oct 2022 10:36:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=hjE8e/e8vt5lFLFZZcNa3D98nO+5lJyHBO3xGTZhfLE=;
 b=VR9qan/lYTl1+Hk7VmjXfbdwaN/nhYrQpOHgBIX5QYJA1B1jVXJL8+8QXpuQPZH1D7UA
 2aBlA7Z3F5Uy0Fh8m5wOdDRSZXbftP779KBI2My9BgiHkp7UBN+EP3J3iVwyE+EaJGi+
 lTWXzxEz/wX1YtqN+xNbfL+vnVdh+NHp1KBC6Ui3ndO5akDEfH7O3ewx3Y0FBUMJqTva
 F0g5Im5FY//1g3InGIu0MOfZx9HoghUryBWRmnqM0dLTomLdXYaFdbixFlnYDm6wOrvU
 /PFRkwN2JRI3wknW80CS0HCi9JJH3MsyoEVeIT9/5tnR0xxZyk7BvtDFeNZGK81+DLMG Ig== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3kc7v29fyn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Oct 2022 10:36:17 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7D3D310002A;
 Mon, 24 Oct 2022 10:36:13 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 795E0216ECE;
 Mon, 24 Oct 2022 10:36:13 +0200 (CEST)
Received: from localhost (10.201.20.208) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Mon, 24 Oct
 2022 10:36:13 +0200
From: Amelie Delaunay <amelie.delaunay@foss.st.com>
To: Vinod Koul <vkoul@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Amelie Delaunay <amelie.delaunay@foss.st.com>
Date: Mon, 24 Oct 2022 10:36:11 +0200
Message-ID: <20221024083611.132588-1-amelie.delaunay@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.201.20.208]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-24_02,2022-10-21_01,2022-06-22_01
Cc: dmaengine@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH] dmaengine: stm32-dma: fix potential race
	between pause and resume
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

When disabling dma channel, a TCF flag is set and as TCIE is enabled, an
interrupt is raised.
On a busy system, the interrupt may have latency and the user can ask for
dmaengine_resume while stm32-dma driver has not yet managed the complete
pause (backup of registers to restore state in resume).
To avoid such a case, instead of waiting the interrupt to backup the
registers, do it just after disabling the channel and discard Transfer
Complete interrupt in case the channel is paused.

Fixes: 099a9a94be0e ("dmaengine: stm32-dma: add device_pause/device_resume support")
Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
---
 drivers/dma/stm32-dma.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/dma/stm32-dma.c b/drivers/dma/stm32-dma.c
index 4891a1767e5a..37674029cb42 100644
--- a/drivers/dma/stm32-dma.c
+++ b/drivers/dma/stm32-dma.c
@@ -675,6 +675,8 @@ static void stm32_dma_handle_chan_paused(struct stm32_dma_chan *chan)
 
 	chan->chan_reg.dma_sndtr = stm32_dma_read(dmadev, STM32_DMA_SNDTR(chan->id));
 
+	chan->status = DMA_PAUSED;
+
 	dev_dbg(chan2dev(chan), "vchan %pK: paused\n", &chan->vchan);
 }
 
@@ -789,9 +791,7 @@ static irqreturn_t stm32_dma_chan_irq(int irq, void *devid)
 	if (status & STM32_DMA_TCI) {
 		stm32_dma_irq_clear(chan, STM32_DMA_TCI);
 		if (scr & STM32_DMA_SCR_TCIE) {
-			if (chan->status == DMA_PAUSED && !(scr & STM32_DMA_SCR_EN))
-				stm32_dma_handle_chan_paused(chan);
-			else
+			if (chan->status != DMA_PAUSED)
 				stm32_dma_handle_chan_done(chan, scr);
 		}
 		status &= ~STM32_DMA_TCI;
@@ -838,13 +838,11 @@ static int stm32_dma_pause(struct dma_chan *c)
 		return -EPERM;
 
 	spin_lock_irqsave(&chan->vchan.lock, flags);
+
 	ret = stm32_dma_disable_chan(chan);
-	/*
-	 * A transfer complete flag is set to indicate the end of transfer due to the stream
-	 * interruption, so wait for interrupt
-	 */
 	if (!ret)
-		chan->status = DMA_PAUSED;
+		stm32_dma_handle_chan_paused(chan);
+
 	spin_unlock_irqrestore(&chan->vchan.lock, flags);
 
 	return ret;
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
