Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 30F3F11AC34
	for <lists+linux-stm32@lfdr.de>; Wed, 11 Dec 2019 14:40:21 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8236CC36B0B;
	Wed, 11 Dec 2019 13:40:20 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 70B05C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 Dec 2019 13:40:18 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xBBDb2YD005490; Wed, 11 Dec 2019 14:40:10 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=yAqm9sZp35cLmzHCOHCPDTCRBjuP7SiwSxl28sXlrQg=;
 b=UMp7LFUIJcMpL/ztTzkeuNKPIoW5d2MdO7D/MLpo+4fZDT9Cmc1SpOSuw/HEaQMgQKJo
 EK+l8gh7NZ4ruBUdTHv11v+53EQwTcTh10rqgrckblxKuuNoQh8P0BaRMyVjb9drkOUj
 6OAx/XUm9yn8OQkniTn9nqFn7A3ljOC04dz5GZtlxxG9nJvTtgb8u1JcYS0xgm+sm7HN
 9q6AN822uTyn3MkRPFVHWWINqeq4T9JmDeZeuYeZ7sbng+4n50HqbhZlmi5Q2MvAD/LV
 W7VhrIXpwcVGfzIxguHIrjZpiiFyZOAkMEVxJJYn+O800N1tH5NgZn0DX8wcUljM+H0a pQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2wrbrfjcgn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Dec 2019 14:40:10 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3F3E5100038;
 Wed, 11 Dec 2019 14:40:08 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2C32A2B5440;
 Wed, 11 Dec 2019 14:40:08 +0100 (CET)
Received: from lmecxl0923.lme.st.com (10.75.127.47) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 11 Dec
 2019 14:40:07 +0100
From: Ludovic Barre <ludovic.Barre@st.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>
Date: Wed, 11 Dec 2019 14:39:34 +0100
Message-ID: <20191211133934.16932-1-ludovic.Barre@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG3NODE1.st.com (10.75.127.7) To SFHDAG6NODE1.st.com
 (10.75.127.16)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-11_03:2019-12-11,2019-12-11 signatures=0
Cc: devicetree@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, srinivas.kandagatla@linaro.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH V2] mmc: mmci: add threaded irq to abort DPSM
	of non-functional state
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

From: Ludovic Barre <ludovic.barre@st.com>

If datatimeout occurs on R1B request, the Data Path State Machine stays
in busy and is non-functional. Only a reset aborts the DPSM.

Like a reset must be outside of critical section, this patch adds
threaded irq function to release state machine. In this case,
the mmc_request_done is called at the end of threaded irq and
skipped into irq handler.

Signed-off-by: Ludovic Barre <ludovic.barre@st.com>
---
change V2:
 -check IRQ_WAKE_THREAD only in mmci_cmd_irq error part,
  to avoid this test in mmci_request_end.

---
 drivers/mmc/host/mmci.c | 46 +++++++++++++++++++++++++++++++++++------
 drivers/mmc/host/mmci.h |  1 +
 2 files changed, 41 insertions(+), 6 deletions(-)

diff --git a/drivers/mmc/host/mmci.c b/drivers/mmc/host/mmci.c
index 40e72c30ea84..2b91757e3e84 100644
--- a/drivers/mmc/host/mmci.c
+++ b/drivers/mmc/host/mmci.c
@@ -1321,6 +1321,7 @@ mmci_cmd_irq(struct mmci_host *host, struct mmc_command *cmd,
 	} else if (host->variant->busy_timeout && busy_resp &&
 		   status & MCI_DATATIMEOUT) {
 		cmd->error = -ETIMEDOUT;
+		host->irq_action = IRQ_WAKE_THREAD;
 	} else {
 		cmd->resp[0] = readl(base + MMCIRESPONSE0);
 		cmd->resp[1] = readl(base + MMCIRESPONSE1);
@@ -1339,7 +1340,10 @@ mmci_cmd_irq(struct mmci_host *host, struct mmc_command *cmd,
 				return;
 			}
 		}
-		mmci_request_end(host, host->mrq);
+
+		if (host->irq_action != IRQ_WAKE_THREAD)
+			mmci_request_end(host, host->mrq);
+
 	} else if (sbc) {
 		mmci_start_command(host, host->mrq->cmd, 0);
 	} else if (!host->variant->datactrl_first &&
@@ -1532,9 +1536,9 @@ static irqreturn_t mmci_irq(int irq, void *dev_id)
 {
 	struct mmci_host *host = dev_id;
 	u32 status;
-	int ret = 0;
 
 	spin_lock(&host->lock);
+	host->irq_action = IRQ_HANDLED;
 
 	do {
 		status = readl(host->base + MMCISTATUS);
@@ -1574,12 +1578,41 @@ static irqreturn_t mmci_irq(int irq, void *dev_id)
 		if (host->variant->busy_detect_flag)
 			status &= ~host->variant->busy_detect_flag;
 
-		ret = 1;
 	} while (status);
 
 	spin_unlock(&host->lock);
 
-	return IRQ_RETVAL(ret);
+	return host->irq_action;
+}
+
+/*
+ * mmci_irq_threaded is call if the mmci host need to release state machines
+ * before to terminate the request.
+ * If datatimeout occurs on R1B request, the Data Path State Machine stays
+ * in busy and is non-functional. Only a reset can to abort the DPSM.
+ */
+static irqreturn_t mmci_irq_threaded(int irq, void *dev_id)
+{
+	struct mmci_host *host = dev_id;
+	unsigned long flags;
+
+	if (host->rst) {
+		reset_control_assert(host->rst);
+		udelay(2);
+		reset_control_deassert(host->rst);
+	}
+
+	spin_lock_irqsave(&host->lock, flags);
+	writel(host->clk_reg, host->base + MMCICLOCK);
+	writel(host->pwr_reg, host->base + MMCIPOWER);
+	writel(MCI_IRQENABLE | host->variant->start_err,
+	       host->base + MMCIMASK0);
+
+	host->irq_action = IRQ_HANDLED;
+	mmci_request_end(host, host->mrq);
+	spin_unlock_irqrestore(&host->lock, flags);
+
+	return host->irq_action;
 }
 
 static void mmci_request(struct mmc_host *mmc, struct mmc_request *mrq)
@@ -2071,8 +2104,9 @@ static int mmci_probe(struct amba_device *dev,
 			goto clk_disable;
 	}
 
-	ret = devm_request_irq(&dev->dev, dev->irq[0], mmci_irq, IRQF_SHARED,
-			DRIVER_NAME " (cmd)", host);
+	ret = devm_request_threaded_irq(&dev->dev, dev->irq[0], mmci_irq,
+					mmci_irq_threaded, IRQF_SHARED,
+					DRIVER_NAME " (cmd)", host);
 	if (ret)
 		goto clk_disable;
 
diff --git a/drivers/mmc/host/mmci.h b/drivers/mmc/host/mmci.h
index 158e1231aa23..5e63c0596364 100644
--- a/drivers/mmc/host/mmci.h
+++ b/drivers/mmc/host/mmci.h
@@ -412,6 +412,7 @@ struct mmci_host {
 
 	struct timer_list	timer;
 	unsigned int		oldstat;
+	u32			irq_action;
 
 	/* pio stuff */
 	struct sg_mapping_iter	sg_miter;
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
