Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C3B78160C
	for <lists+linux-stm32@lfdr.de>; Mon,  5 Aug 2019 11:57:08 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F23D4C35E07;
	Mon,  5 Aug 2019 09:57:07 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9F2B7C35E01
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 Aug 2019 09:57:07 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x758b0Bf025774; Mon, 5 Aug 2019 11:57:01 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=HhMLvIci0XNKBxu8OuxEsLilXfrP4DiUeaBHrlEWBIA=;
 b=d7FxkcHBasHY2AtACKgcp26n9gNkG21/BXwYnjhEPWD7kxgbUCnY9fuRTyYrCxcoTRkF
 tRe9tL/qgsM/wvt6zARiiteD3d35VOPI5iAdPpONfgmkAemKnww8hMhjjaHrDNqekSM4
 b1KJnP27R8i5jQ5ps27A9bM//bmtYyi8tz0TbMvTvHZAeJlsmpyeylpDbuNNX6M9Oypp
 fTAOW2o+WzFbLuYLOnmIWxuytqDLpyfJ8ibdCbCiYTW4kW6uM1ozIFVs7LwzET9LfYaE
 zr7t+bhOWfg4HWuzpskvUk2zJ9qJ4U/o/LnX+7gPoOJ31xZBEQFcQbdWWXXPDaRSR33B og== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2u515mamue-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Mon, 05 Aug 2019 11:57:01 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id CC59331;
 Mon,  5 Aug 2019 09:57:00 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas21.st.com [10.75.90.44])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B433C3023C1;
 Mon,  5 Aug 2019 11:57:00 +0200 (CEST)
Received: from SAFEX1HUBCAS23.st.com (10.75.90.47) by SAFEX1HUBCAS21.st.com
 (10.75.90.44) with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 5 Aug 2019
 11:57:00 +0200
Received: from lmecxl0923.lme.st.com (10.48.0.237) by webmail-ga.st.com
 (10.75.90.48) with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 5 Aug 2019
 11:57:00 +0200
From: Ludovic Barre <ludovic.Barre@st.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>
Date: Mon, 5 Aug 2019 11:56:25 +0200
Message-ID: <20190805095626.25998-3-ludovic.Barre@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190805095626.25998-1-ludovic.Barre@st.com>
References: <20190805095626.25998-1-ludovic.Barre@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.0.237]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-05_04:, , signatures=0
Cc: devicetree@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, srinivas.kandagatla@linaro.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH V4 2/3] mmc: mmci: add busy_complete callback
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

This patch adds busy_completion callback at mmci_host_ops
to allow to define a specific busy completion by variant.

The legacy code corresponding to busy completion used
by ux500 variants is moved to ux500_busy_complete function.

The busy_detect boolean property is replaced by
busy_complete callback definition.

Signed-off-by: Ludovic Barre <ludovic.barre@st.com>
---
 drivers/mmc/host/mmci.c | 140 +++++++++++++++++++++-------------------
 drivers/mmc/host/mmci.h |   3 +-
 2 files changed, 75 insertions(+), 68 deletions(-)

diff --git a/drivers/mmc/host/mmci.c b/drivers/mmc/host/mmci.c
index e79c9148af84..17948615d4a5 100644
--- a/drivers/mmc/host/mmci.c
+++ b/drivers/mmc/host/mmci.c
@@ -47,6 +47,7 @@
 #define DRIVER_NAME "mmci-pl18x"
 
 static void mmci_variant_init(struct mmci_host *host);
+static void ux500_variant_init(struct mmci_host *host);
 static void ux500v2_variant_init(struct mmci_host *host);
 
 static unsigned int fmax = 515633;
@@ -178,7 +179,6 @@ static struct variant_data variant_ux500 = {
 	.f_max			= 100000000,
 	.signal_direction	= true,
 	.pwrreg_clkgate		= true,
-	.busy_detect		= true,
 	.busy_dpsm_flag		= MCI_DPSM_ST_BUSYMODE,
 	.busy_detect_flag	= MCI_ST_CARDBUSY,
 	.busy_detect_mask	= MCI_ST_BUSYENDMASK,
@@ -187,7 +187,7 @@ static struct variant_data variant_ux500 = {
 	.irq_pio_mask		= MCI_IRQ_PIO_MASK,
 	.start_err		= MCI_STARTBITERR,
 	.opendrain		= MCI_OD,
-	.init			= mmci_variant_init,
+	.init			= ux500_variant_init,
 };
 
 static struct variant_data variant_ux500v2 = {
@@ -211,7 +211,6 @@ static struct variant_data variant_ux500v2 = {
 	.f_max			= 100000000,
 	.signal_direction	= true,
 	.pwrreg_clkgate		= true,
-	.busy_detect		= true,
 	.busy_dpsm_flag		= MCI_DPSM_ST_BUSYMODE,
 	.busy_detect_flag	= MCI_ST_CARDBUSY,
 	.busy_detect_mask	= MCI_ST_BUSYENDMASK,
@@ -613,6 +612,67 @@ static u32 ux500v2_get_dctrl_cfg(struct mmci_host *host)
 	return MCI_DPSM_ENABLE | (host->data->blksz << 16);
 }
 
+static bool ux500_busy_complete(struct mmci_host *host, u32 status, u32 err_msk)
+{
+	void __iomem *base = host->base;
+
+	/*
+	 * Before unmasking for the busy end IRQ, confirm that the
+	 * command was sent successfully. To keep track of having a
+	 * command in-progress, waiting for busy signaling to end,
+	 * store the status in host->busy_status.
+	 *
+	 * Note that, the card may need a couple of clock cycles before
+	 * it starts signaling busy on DAT0, hence re-read the
+	 * MMCISTATUS register here, to allow the busy bit to be set.
+	 * Potentially we may even need to poll the register for a
+	 * while, to allow it to be set, but tests indicates that it
+	 * isn't needed.
+	 */
+	if (!host->busy_status && !(status & err_msk) &&
+	    (readl(base + MMCISTATUS) & host->variant->busy_detect_flag)) {
+		writel(readl(base + MMCIMASK0) |
+		       host->variant->busy_detect_mask,
+		       base + MMCIMASK0);
+
+		host->busy_status = status & (MCI_CMDSENT | MCI_CMDRESPEND);
+		return false;
+	}
+
+	/*
+	 * If there is a command in-progress that has been successfully
+	 * sent, then bail out if busy status is set and wait for the
+	 * busy end IRQ.
+	 *
+	 * Note that, the HW triggers an IRQ on both edges while
+	 * monitoring DAT0 for busy completion, but there is only one
+	 * status bit in MMCISTATUS for the busy state. Therefore
+	 * both the start and the end interrupts needs to be cleared,
+	 * one after the other. So, clear the busy start IRQ here.
+	 */
+	if (host->busy_status &&
+	    (status & host->variant->busy_detect_flag)) {
+		writel(host->variant->busy_detect_mask, base + MMCICLEAR);
+		return false;
+	}
+
+	/*
+	 * If there is a command in-progress that has been successfully
+	 * sent and the busy bit isn't set, it means we have received
+	 * the busy end IRQ. Clear and mask the IRQ, then continue to
+	 * process the command.
+	 */
+	if (host->busy_status) {
+		writel(host->variant->busy_detect_mask, base + MMCICLEAR);
+
+		writel(readl(base + MMCIMASK0) &
+		       ~host->variant->busy_detect_mask, base + MMCIMASK0);
+		host->busy_status = 0;
+	}
+
+	return true;
+}
+
 /*
  * All the DMA operation mode stuff goes inside this ifdef.
  * This assumes that you have a generic DMA device interface,
@@ -956,9 +1016,16 @@ void mmci_variant_init(struct mmci_host *host)
 	host->ops = &mmci_variant_ops;
 }
 
+void ux500_variant_init(struct mmci_host *host)
+{
+	host->ops = &mmci_variant_ops;
+	host->ops->busy_complete = ux500_busy_complete;
+}
+
 void ux500v2_variant_init(struct mmci_host *host)
 {
 	host->ops = &mmci_variant_ops;
+	host->ops->busy_complete = ux500_busy_complete;
 	host->ops->get_datactrl_cfg = ux500v2_get_dctrl_cfg;
 }
 
@@ -1242,68 +1309,9 @@ mmci_cmd_irq(struct mmci_host *host, struct mmc_command *cmd,
 		return;
 
 	/* Handle busy detection on DAT0 if the variant supports it. */
-	if (busy_resp && host->variant->busy_detect) {
-
-		/*
-		 * Before unmasking for the busy end IRQ, confirm that the
-		 * command was sent successfully. To keep track of having a
-		 * command in-progress, waiting for busy signaling to end,
-		 * store the status in host->busy_status.
-		 *
-		 * Note that, the card may need a couple of clock cycles before
-		 * it starts signaling busy on DAT0, hence re-read the
-		 * MMCISTATUS register here, to allow the busy bit to be set.
-		 * Potentially we may even need to poll the register for a
-		 * while, to allow it to be set, but tests indicates that it
-		 * isn't needed.
-		 */
-		if (!host->busy_status && !(status & err_msk) &&
-		    (readl(base + MMCISTATUS) & host->variant->busy_detect_flag)) {
-
-			writel(readl(base + MMCIMASK0) |
-			       host->variant->busy_detect_mask,
-			       base + MMCIMASK0);
-
-			host->busy_status =
-				status & (MCI_CMDSENT|MCI_CMDRESPEND);
-			return;
-		}
-
-		/*
-		 * If there is a command in-progress that has been successfully
-		 * sent, then bail out if busy status is set and wait for the
-		 * busy end IRQ.
-		 *
-		 * Note that, the HW triggers an IRQ on both edges while
-		 * monitoring DAT0 for busy completion, but there is only one
-		 * status bit in MMCISTATUS for the busy state. Therefore
-		 * both the start and the end interrupts needs to be cleared,
-		 * one after the other. So, clear the busy start IRQ here.
-		 */
-		if (host->busy_status &&
-		    (status & host->variant->busy_detect_flag)) {
-			writel(host->variant->busy_detect_mask,
-			       host->base + MMCICLEAR);
+	if (busy_resp && host->ops->busy_complete)
+		if (!host->ops->busy_complete(host, status, err_msk))
 			return;
-		}
-
-		/*
-		 * If there is a command in-progress that has been successfully
-		 * sent and the busy bit isn't set, it means we have received
-		 * the busy end IRQ. Clear and mask the IRQ, then continue to
-		 * process the command.
-		 */
-		if (host->busy_status) {
-
-			writel(host->variant->busy_detect_mask,
-			       host->base + MMCICLEAR);
-
-			writel(readl(base + MMCIMASK0) &
-			       ~host->variant->busy_detect_mask,
-			       base + MMCIMASK0);
-			host->busy_status = 0;
-		}
-	}
 
 	host->cmd = NULL;
 
@@ -1544,7 +1552,7 @@ static irqreturn_t mmci_irq(int irq, void *dev_id)
 		 * clear the corresponding IRQ.
 		 */
 		status &= readl(host->base + MMCIMASK0);
-		if (host->variant->busy_detect)
+		if (host->ops->busy_complete)
 			writel(status & ~host->variant->busy_detect_mask,
 			       host->base + MMCICLEAR);
 		else
@@ -1971,7 +1979,7 @@ static int mmci_probe(struct amba_device *dev,
 	/*
 	 * Enable busy detection.
 	 */
-	if (variant->busy_detect) {
+	if (host->ops->busy_complete) {
 		u32 max_busy_timeout = 0;
 
 		mmci_ops.card_busy = mmci_card_busy;
diff --git a/drivers/mmc/host/mmci.h b/drivers/mmc/host/mmci.h
index 8f86130af566..03eb21f1c258 100644
--- a/drivers/mmc/host/mmci.h
+++ b/drivers/mmc/host/mmci.h
@@ -289,7 +289,6 @@ struct mmci_host;
  * @f_max: maximum clk frequency supported by the controller.
  * @signal_direction: input/out direction of bus signals can be indicated
  * @pwrreg_clkgate: MMCIPOWER register must be used to gate the clock
- * @busy_detect: true if the variant supports busy detection on DAT0.
  * @busy_timeout: true if the variant starts data timer when the DPSM
  *		  enter in Wait_R or Busy state.
  * @busy_dpsm_flag: bitmask enabling busy detection in the DPSM
@@ -337,7 +336,6 @@ struct variant_data {
 	u32			f_max;
 	u8			signal_direction:1;
 	u8			pwrreg_clkgate:1;
-	u8			busy_detect:1;
 	u8			busy_timeout:1;
 	u32			busy_dpsm_flag;
 	u32			busy_detect_flag;
@@ -372,6 +370,7 @@ struct mmci_host_ops {
 	void (*dma_error)(struct mmci_host *host);
 	void (*set_clkreg)(struct mmci_host *host, unsigned int desired);
 	void (*set_pwrreg)(struct mmci_host *host, unsigned int pwr);
+	bool (*busy_complete)(struct mmci_host *host, u32 status, u32 err_msk);
 };
 
 struct mmci_host {
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
