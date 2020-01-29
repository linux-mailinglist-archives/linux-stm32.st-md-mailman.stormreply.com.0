Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DE91D14CD81
	for <lists+linux-stm32@lfdr.de>; Wed, 29 Jan 2020 16:36:55 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A615CC36B0E;
	Wed, 29 Jan 2020 15:36:55 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 47B8FC36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Jan 2020 15:36:52 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00TFNdPW030994; Wed, 29 Jan 2020 16:36:39 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=fNTUXAf+YlisbazBqB3yomSG66KZ61nDeHHXPvZUmB0=;
 b=VKAuCipx3bFKSSGXXWVDJuLxcNNSl9Rfa+ZSyFdvEi9ZoEJLKa8rngoQLq6VCq431w4E
 TZ9uOx5nx5W6+sISmZZO9zR57ATVy0M6hnJZHnv0gUMsKhyLLuJmKmeiEIVzc9gl50Ie
 sXX6TYJYeTkwlDfiWcW6Sqj6Q4O2xTJKkqg0qOh/SQcxyiQ1zHPLPL7I6BUbdNkN4KJs
 OoIGQk7aCVRpH985TybpinzkFXcuCAOwwSgiSI45iUWRa20unJoVu0Wc6lOggXjpRAo2
 sfxnxjcUcAgFMS6tEEsKH+PD4AcY1yjrTk7DjxVZW7iErP64/9bYPRBPjLOB2Q5DCJ/P nQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2xrbpb45ee-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Jan 2020 16:36:39 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E2FE7100039;
 Wed, 29 Jan 2020 16:36:38 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D1E002BC7C2;
 Wed, 29 Jan 2020 16:36:38 +0100 (CET)
Received: from localhost (10.75.127.46) by SFHDAG3NODE2.st.com (10.75.127.8)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Wed, 29 Jan 2020 16:36:38
 +0100
From: Amelie Delaunay <amelie.delaunay@st.com>
To: Vinod Koul <vkoul@kernel.org>, Dan Williams <dan.j.williams@intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@st.com>
Date: Wed, 29 Jan 2020 16:36:27 +0100
Message-ID: <20200129153628.29329-8-amelie.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200129153628.29329-1-amelie.delaunay@st.com>
References: <20200129153628.29329-1-amelie.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG8NODE2.st.com (10.75.127.23) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-29_03:2020-01-28,
 2020-01-29 signatures=0
Cc: linux-kernel@vger.kernel.org,
 Pierre-Yves MORDRET <pierre-yves.mordret@st.com>, dmaengine@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 7/8] dmaengine: stm32-dma: fix sleeping
	function called from invalid context
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

This patch fixes BUG: sleeping function called from invalid context in
stm32_dma_disable_chan function.

The goal of this function is to force channel disable if it has not been
disabled by hardware. This consists in clearing STM32_DMA_SCR_EN bit and
read it as 0 to ensure the channel is well disabled and the last transfer
is over.

In previous implementation, the waiting loop was based on a do...while (1)
with a call to cond_resched to give the scheduler a chance to run a higher
priority process.

But in some conditions, stm32_dma_disable_chan can be called while
preemption is disabled, on a stm32_dma_stop call for example. So
cond_resched must not be used.

To avoid this, use readl_relaxed_poll_timeout_atomic to poll
STM32_DMA_SCR_EN bit cleared.

Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>
---
 drivers/dma/stm32-dma.c | 27 +++++++++------------------
 1 file changed, 9 insertions(+), 18 deletions(-)

diff --git a/drivers/dma/stm32-dma.c b/drivers/dma/stm32-dma.c
index 01a2374ae03a..b585e11c2168 100644
--- a/drivers/dma/stm32-dma.c
+++ b/drivers/dma/stm32-dma.c
@@ -15,6 +15,7 @@
 #include <linux/dma-mapping.h>
 #include <linux/err.h>
 #include <linux/init.h>
+#include <linux/iopoll.h>
 #include <linux/jiffies.h>
 #include <linux/list.h>
 #include <linux/module.h>
@@ -421,29 +422,19 @@ static void stm32_dma_irq_clear(struct stm32_dma_chan *chan, u32 flags)
 static int stm32_dma_disable_chan(struct stm32_dma_chan *chan)
 {
 	struct stm32_dma_device *dmadev = stm32_dma_get_dev(chan);
-	unsigned long timeout = jiffies + msecs_to_jiffies(5000);
-	u32 dma_scr, id;
+	u32 dma_scr, id, reg;
 
 	id = chan->id;
-	dma_scr = stm32_dma_read(dmadev, STM32_DMA_SCR(id));
+	reg = STM32_DMA_SCR(id);
+	dma_scr = stm32_dma_read(dmadev, reg);
 
 	if (dma_scr & STM32_DMA_SCR_EN) {
 		dma_scr &= ~STM32_DMA_SCR_EN;
-		stm32_dma_write(dmadev, STM32_DMA_SCR(id), dma_scr);
-
-		do {
-			dma_scr = stm32_dma_read(dmadev, STM32_DMA_SCR(id));
-			dma_scr &= STM32_DMA_SCR_EN;
-			if (!dma_scr)
-				break;
-
-			if (time_after_eq(jiffies, timeout)) {
-				dev_err(chan2dev(chan), "%s: timeout!\n",
-					__func__);
-				return -EBUSY;
-			}
-			cond_resched();
-		} while (1);
+		stm32_dma_write(dmadev, reg, dma_scr);
+
+		return readl_relaxed_poll_timeout_atomic(dmadev->base + reg,
+					dma_scr, !(dma_scr & STM32_DMA_SCR_EN),
+					10, 1000000);
 	}
 
 	return 0;
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
