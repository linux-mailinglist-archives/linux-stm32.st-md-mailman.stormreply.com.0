Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D24A6D74AD
	for <lists+linux-stm32@lfdr.de>; Wed,  5 Apr 2023 08:50:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E960EC6A610;
	Wed,  5 Apr 2023 06:50:40 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C3C76C6A610
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  5 Apr 2023 06:50:39 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id g19so32205140lfr.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 04 Apr 2023 23:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680677439;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=y3hEnuBO3Z3EAaHvrNPA+CXdYyDV16bUmPpb/P3uEpM=;
 b=bS8QZTdCDuTDcyJ1AsakjW9MBQVd+JThH0c3L8QajEZRb3zdQFhBx1etjad7PZVtvj
 +pzseQFbF0w5/R4d6EkybhE3nTYEbZMdzuUIX8fnM2vTf+RJXhB6DhBdWU3l8P++mUJj
 DUyjzwJmRT20x2KXUXVI0iCHVNt5wsV4EyscPbX4NHNEZQlov/Cjx4JxUMXeB1arJDSm
 44F1gb3TLqBV7tBpgWyPkVx0ZBkYUsG8bCJ3QZQ/IOhQnTdJVgD+n+8HGatjdmC/Kmf4
 O4kXHDS51KIyLFFtdVvF0U4PMpdBk/sMgldDNYGlKpG8XmgrMjsHqSSrSSNaTcKuizoi
 JHmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680677439;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=y3hEnuBO3Z3EAaHvrNPA+CXdYyDV16bUmPpb/P3uEpM=;
 b=ua9h46JYwuVKp7XwLJ8YJ1hyQZhGI1ZTAfgJhMqxq9old5nfYOy3aQfBnjqL6kE4Ic
 SGSF4y4SB+MkZvGYKLZ8A5kpyxPDFppo+Ml8jlMjgvsCaflbiEgLI4iJy1+hqGcsYWVO
 jDYDaLlHGl+dlJK0fdC7i87XRocD5TXC4QqZjtRhxzoYBFEb8as31cjmhf26aUekhXqa
 R+8MhOLbHb6gluABARkVrR3NSxKr8SLo8nmPo+SHE5erGqAlRB4AzF67lcrSG20eTWqE
 JsjABKKJQgTe3f8LaLb8QoeIzpWFGiRtrAF70TLnDk9we4MqTF2DVm12glczYso2CWUH
 gGFQ==
X-Gm-Message-State: AAQBX9fVr7KpHmnbkEN3QABwxfz1i9Tx7VGFtzeKKBx1NGoic77eSRg7
 EPTHgJOvZI1UgE477P4ABxMRFV47U2GB60fsCQo=
X-Google-Smtp-Source: AKy350YM/jGSXJNB+fwDQ+O120FuphFZJmJ0Zb85Nj+dXjSbxQyyy+LZ5qSOTdQ5Cbn/Os2O0GeS5g==
X-Received: by 2002:ac2:558d:0:b0:4e6:9b01:b92b with SMTP id
 v13-20020ac2558d000000b004e69b01b92bmr1192437lfg.67.1680677439163; 
 Tue, 04 Apr 2023 23:50:39 -0700 (PDT)
Received: from [192.168.1.2] (c-05d8225c.014-348-6c756e10.bbcust.telenor.se.
 [92.34.216.5]) by smtp.gmail.com with ESMTPSA id
 z19-20020ac25df3000000b004eb274b3a43sm2683086lfq.134.2023.04.04.23.50.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Apr 2023 23:50:38 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 05 Apr 2023 08:50:32 +0200
MIME-Version: 1.0
Message-Id: <20230405-pl180-busydetect-fix-v1-6-28ac19a74e5e@linaro.org>
References: <20230405-pl180-busydetect-fix-v1-0-28ac19a74e5e@linaro.org>
In-Reply-To: <20230405-pl180-busydetect-fix-v1-0-28ac19a74e5e@linaro.org>
To: Stefan Hansson <newbyte@disroot.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.12.0
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-mmc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 06/13] mmc: mmci: Make busy complete state
	machine explicit
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

This refactors the ->busy_complete() callback currently
only used by Ux500 to handle busy detection on hardware
where one and the same IRQ is fired whether we get a
start or an end signal on busy detect.

The code is currently using the cached status from the
command IRQ in ->busy_status as a state to select what to
do next: if this state is non-zero we are waiting for
IRQs and if it is zero we treat the state as the starting
point for a busy detect wait cycle.

Make this explicit by creating a state machine where the
->busy_complete callback moves between four states:
MMCI_BUSY_NOT_STARTED, MMCI_BUSY_WAITING_FOR_IRQS,
MMCI_BUSY_START_IRQ and MMCI_BUSY_END_IRQ.

The code currently assumes this order: we enable the busy
detect IRQ, get a busy start IRQ, then a busy end IRQ, and
then we clear and mask this IRQ and proceed.

We insert dev_err() prints for unexpected states.

Augment the STM32 driver with similar states for
completeness.

This works as before on most cards, however on a
problematic card that is not working with busy detect, and
which I have been debugging, this happens:

[127220.662719] mmci-pl18x 80005000.mmc: lost busy status
		when waiting for busy end IRQ

This probably means that the busy detect start IRQ has
already occurred when we start executing the
->busy_complete() callbacks, and the busy detect end IRQ
is counted as the start IRQ, and this is what is causing
the card to not be detected properly.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/mmc/host/mmci.c             | 58 +++++++++++++++++++++++++++++++------
 drivers/mmc/host/mmci.h             | 16 ++++++++++
 drivers/mmc/host/mmci_stm32_sdmmc.c |  6 +++-
 3 files changed, 70 insertions(+), 10 deletions(-)

diff --git a/drivers/mmc/host/mmci.c b/drivers/mmc/host/mmci.c
index 13dec2e09164..c14a7732386e 100644
--- a/drivers/mmc/host/mmci.c
+++ b/drivers/mmc/host/mmci.c
@@ -670,6 +670,7 @@ static bool ux500_busy_complete(struct mmci_host *host, u32 status, u32 err_msk)
 		writel(host->variant->busy_detect_mask, base + MMCICLEAR);
 		writel(readl(base + MMCIMASK0) &
 		       ~host->variant->busy_detect_mask, base + MMCIMASK0);
+		host->busy_state = MMCI_BUSY_DONE;
 		host->busy_status = 0;
 		return true;
 	}
@@ -687,7 +688,7 @@ static bool ux500_busy_complete(struct mmci_host *host, u32 status, u32 err_msk)
 	 * while, to allow it to be set, but tests indicates that it
 	 * isn't needed.
 	 */
-	if (!host->busy_status) {
+	if (host->busy_state == MMCI_BUSY_IDLE) {
 		host->busy_status = status & (MCI_CMDSENT | MCI_CMDRESPEND);
 		status = readl(base + MMCISTATUS);
 		if (status & host->variant->busy_detect_flag) {
@@ -696,6 +697,7 @@ static bool ux500_busy_complete(struct mmci_host *host, u32 status, u32 err_msk)
 			       base + MMCIMASK0);
 
 			host->busy_status |= status & (MCI_CMDSENT | MCI_CMDRESPEND);
+			host->busy_state = MMCI_BUSY_WAITING_FOR_IRQS;
 			return false;
 		}
 	}
@@ -711,11 +713,40 @@ static bool ux500_busy_complete(struct mmci_host *host, u32 status, u32 err_msk)
 	 * both the start and the end interrupts needs to be cleared,
 	 * one after the other. So, clear the busy start IRQ here.
 	 */
-	if (host->busy_status &&
-	    (status & host->variant->busy_detect_flag)) {
-		host->busy_status |= status & (MCI_CMDSENT | MCI_CMDRESPEND);
-		writel(host->variant->busy_detect_mask, base + MMCICLEAR);
-		return false;
+	if (host->busy_state == MMCI_BUSY_WAITING_FOR_IRQS) {
+		if (status & host->variant->busy_detect_flag) {
+			host->busy_status |= status & (MCI_CMDSENT | MCI_CMDRESPEND);
+			writel(host->variant->busy_detect_mask, base + MMCICLEAR);
+			host->busy_state = MMCI_BUSY_START_IRQ;
+			return false;
+		} else {
+			dev_dbg(mmc_dev(host->mmc),
+				"lost busy status when waiting for busy start IRQ\n");
+			writel(host->variant->busy_detect_mask, base + MMCICLEAR);
+			writel(readl(base + MMCIMASK0) &
+			       ~host->variant->busy_detect_mask, base + MMCIMASK0);
+			host->busy_state = MMCI_BUSY_DONE;
+			host->busy_status = 0;
+			return true;
+		}
+	}
+
+	if (host->busy_state == MMCI_BUSY_START_IRQ) {
+		if (status & host->variant->busy_detect_flag) {
+			host->busy_status |= status & (MCI_CMDSENT | MCI_CMDRESPEND);
+			writel(host->variant->busy_detect_mask, base + MMCICLEAR);
+			host->busy_state = MMCI_BUSY_END_IRQ;
+			return false;
+		} else {
+			dev_dbg(mmc_dev(host->mmc),
+				"lost busy status when waiting for busy end IRQ\n");
+			writel(host->variant->busy_detect_mask, base + MMCICLEAR);
+			writel(readl(base + MMCIMASK0) &
+			       ~host->variant->busy_detect_mask, base + MMCIMASK0);
+			host->busy_state = MMCI_BUSY_DONE;
+			host->busy_status = 0;
+			return true;
+		}
 	}
 
 	/*
@@ -724,11 +755,18 @@ static bool ux500_busy_complete(struct mmci_host *host, u32 status, u32 err_msk)
 	 * the busy end IRQ. Clear and mask the IRQ, then continue to
 	 * process the command.
 	 */
-	if (host->busy_status) {
-		writel(host->variant->busy_detect_mask, base + MMCICLEAR);
+	if (host->busy_state == MMCI_BUSY_END_IRQ) {
+		if (status & host->variant->busy_detect_flag) {
+			/* We should just get two IRQs for busy detect */
+			dev_err(mmc_dev(host->mmc), "spurious busy detect IRQ\n");
+			return false;
+		}
 
+		writel(host->variant->busy_detect_mask, base + MMCICLEAR);
 		writel(readl(base + MMCIMASK0) &
 		       ~host->variant->busy_detect_mask, base + MMCIMASK0);
+
+		host->busy_state = MMCI_BUSY_DONE;
 		host->busy_status = 0;
 	}
 
@@ -1259,8 +1297,10 @@ mmci_start_command(struct mmci_host *host, struct mmc_command *cmd, u32 c)
 	}
 
 	if (cmd->flags & MMC_RSP_BUSY) {
-		if (host->ops->busy_complete)
+		if (host->ops->busy_complete) {
+			host->busy_state = MMCI_BUSY_IDLE;
 			host->busy_status = 0;
+		}
 
 		if (host->variant->busy_timeout) {
 			if (!cmd->busy_timeout)
diff --git a/drivers/mmc/host/mmci.h b/drivers/mmc/host/mmci.h
index e1a9b96a3396..82f3850325c8 100644
--- a/drivers/mmc/host/mmci.h
+++ b/drivers/mmc/host/mmci.h
@@ -261,6 +261,21 @@ struct clk;
 struct dma_chan;
 struct mmci_host;
 
+/**
+ * enum mmci_busy_state - enumerate the busy detect wait states
+ *
+ * This is used for the state machine waiting for different busy detect
+ * interrupts on hardware that fire a single IRQ for start and end of
+ * the busy detect phase on DAT0.
+ */
+enum mmci_busy_state {
+	MMCI_BUSY_IDLE,
+	MMCI_BUSY_WAITING_FOR_IRQS,
+	MMCI_BUSY_START_IRQ,
+	MMCI_BUSY_END_IRQ,
+	MMCI_BUSY_DONE,
+};
+
 /**
  * struct variant_data - MMCI variant-specific quirks
  * @clkreg: default value for MCICLOCK register
@@ -409,6 +424,7 @@ struct mmci_host {
 	u32			clk_reg;
 	u32			clk_reg_add;
 	u32			datactrl_reg;
+	enum mmci_busy_state	busy_state;
 	u32			busy_status;
 	u32			mask1_reg;
 	u8			vqmmc_enabled:1;
diff --git a/drivers/mmc/host/mmci_stm32_sdmmc.c b/drivers/mmc/host/mmci_stm32_sdmmc.c
index 60bca78a72b1..24831a1092b2 100644
--- a/drivers/mmc/host/mmci_stm32_sdmmc.c
+++ b/drivers/mmc/host/mmci_stm32_sdmmc.c
@@ -393,8 +393,10 @@ static bool sdmmc_busy_complete(struct mmci_host *host, u32 status, u32 err_msk)
 	busy_d0 = sdmmc_status & MCI_STM32_BUSYD0;
 
 	/* complete if there is an error or busy_d0end */
-	if ((status & err_msk) || busy_d0end)
+	if ((status & err_msk) || busy_d0end) {
+		host->busy_state = MMCI_BUSY_DONE;
 		goto complete;
+	}
 
 	/*
 	 * On response the busy signaling is reflected in the BUSYD0 flag.
@@ -408,6 +410,7 @@ static bool sdmmc_busy_complete(struct mmci_host *host, u32 status, u32 err_msk)
 			host->busy_status = status &
 				(MCI_CMDSENT | MCI_CMDRESPEND);
 		}
+		host->busy_state = MMCI_BUSY_END_IRQ;
 		return false;
 	}
 
@@ -416,6 +419,7 @@ static bool sdmmc_busy_complete(struct mmci_host *host, u32 status, u32 err_msk)
 		writel_relaxed(mask & ~host->variant->busy_detect_mask,
 			       base + MMCIMASK0);
 		host->busy_status = 0;
+		host->busy_state = MMCI_BUSY_DONE;
 	}
 
 	writel_relaxed(host->variant->busy_detect_mask, base + MMCICLEAR);

-- 
2.39.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
