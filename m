Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E8C3972ED03
	for <lists+linux-stm32@lfdr.de>; Tue, 13 Jun 2023 22:34:32 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 98567C6B45C;
	Tue, 13 Jun 2023 20:34:32 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C32C7C6B457
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Jun 2023 20:34:30 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-4f644dffd71so7542691e87.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Jun 2023 13:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686688470; x=1689280470;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=UdAVTh09lAy/OHXiQCijK6TEu6mm4fi+59Msl6eq5C0=;
 b=nCT8P6i7F/Ve7lyjs0+Tuq1RYpdwJVpglRlNRcB7iQWZcjg8iiOhIZQIFmfRq9z2ZQ
 lVY2nkK5J/dmvoYJ3V1b533yTJjBIVfTv3W/1w+MNe37IL8VthHbh2N49R/SJIiVHEyY
 Fp/jcMXJGGjt/VFUTG8l/VDK7dFsdnDRaGyYrEBAS3MH0pBIrTAyEg/Nh7gx9I4lnQuU
 /Ic7697q3o84X4ex4i7o4k0aTF5R0q+meZgoqY0bjZYN9buCkN4T0sxC05tFGAh7Mmi3
 IVQ1+0yuGXREfuEUUfTq+cZVXShXnhlNqAGwsDmVzSeyO1eEBnn857I1VOb90hHFdZoa
 g1wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686688470; x=1689280470;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UdAVTh09lAy/OHXiQCijK6TEu6mm4fi+59Msl6eq5C0=;
 b=G+MYypVDH7CDrbTQo6CKR/AXiiOSlBGzkqEDLjjsUfQpUHXtwKXwXbEKeYNr3JbpFx
 vSnASt0X2tgndu3l7tDxAkArUTQTcoGvqjgqHIzWcKfzzwwCKLwwpYpGIw2fbbU6bpEy
 OoVjYfK4uaoUuOkrQH7YJIsYyppjNO6cdUqPsq8cmmrmRU47A+JHcsEQlA8GcFLXZATn
 1jQn6Roi0zFL0/mWdtRtYv59AXsJPQT+MfjGAkSZtleANUvnm5EJv9pMucCGw4Ck5Qa6
 gh3X17La8W1WLAuhVQJvsDXRq7qXFgpBe4gGyw6aV4dkrSVO8sbm4S0bGn8uQxfACcf8
 GePA==
X-Gm-Message-State: AC+VfDxqBenFAd927if5WY8A+cQX/8Cbvc4CvwIZK8/K8H68HaUqGT0T
 bYT2s5njoJo9phjjlqkdP1tCTQ==
X-Google-Smtp-Source: ACHHUZ7pVrL9wCigCd2X2+n7AcKK7OjRXgFApwazZIlZs+P+w+KKCtoh6hsQN0XiViuf8Qs2JOpfZg==
X-Received: by 2002:ac2:5b87:0:b0:4f3:b708:f554 with SMTP id
 o7-20020ac25b87000000b004f3b708f554mr8051429lfn.47.1686688470168; 
 Tue, 13 Jun 2023 13:34:30 -0700 (PDT)
Received: from [192.168.1.2] (c-05d8225c.014-348-6c756e10.bbcust.telenor.se.
 [92.34.216.5]) by smtp.gmail.com with ESMTPSA id
 l12-20020a19c20c000000b004f26f699e9dsm1897813lfc.184.2023.06.13.13.34.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jun 2023 13:34:29 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 13 Jun 2023 22:34:21 +0200
MIME-Version: 1.0
Message-Id: <20230405-pl180-busydetect-fix-v4-5-df9c8c504353@linaro.org>
References: <20230405-pl180-busydetect-fix-v4-0-df9c8c504353@linaro.org>
In-Reply-To: <20230405-pl180-busydetect-fix-v4-0-df9c8c504353@linaro.org>
To: Yann Gautier <yann.gautier@foss.st.com>, 
 Stefan Hansson <newbyte@disroot.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.12.2
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-mmc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v4 05/10] mmc: mmci: Make busy complete state
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
only used by Ux500 and STM32 to handle busy detection on
hardware where one and the same IRQ is fired whether we get
a start or an end signal on busy detect.

The code is currently using the cached status from the
command IRQ in ->busy_status as a state to select what to
do next: if this state is non-zero we are waiting for
IRQs and if it is zero we treat the state as the starting
point for a busy detect wait cycle.

Make this explicit by creating a state machine where the
->busy_complete callback moves between three states.

The Ux500 busy detect code currently assumes this order:
we enable the busy detect IRQ, get a busy start IRQ, then a
busy end IRQ, and then we clear and mask this IRQ and
proceed.

We insert debug prints for unexpected states.

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
ChangeLog v3->v4:
- Assign state MMCI_BUSY_DONE outside the if()-clause for
  the busy detect initialization.
ChangeLog v2->v3:
- Drop surplus states and merge IDLE and DONE states into one,
  we start out DONE. Name states *_WAITING_FOR_* so it is clear
  what is going on.
- Rebase on other changes.
- Reword commit message.
ChangeLog v1->v2:
- No changes
---
 drivers/mmc/host/mmci.c             | 55 +++++++++++++++++++++++++------------
 drivers/mmc/host/mmci.h             | 14 ++++++++++
 drivers/mmc/host/mmci_stm32_sdmmc.c |  6 +++-
 3 files changed, 56 insertions(+), 19 deletions(-)

diff --git a/drivers/mmc/host/mmci.c b/drivers/mmc/host/mmci.c
index d632658d9d20..3b1a23e4ec1c 100644
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
+	if (host->busy_state == MMCI_BUSY_DONE) {
 		status = readl(base + MMCISTATUS);
 		if (status & host->variant->busy_detect_flag) {
 			writel(readl(base + MMCIMASK0) |
@@ -695,6 +696,7 @@ static bool ux500_busy_complete(struct mmci_host *host, u32 status, u32 err_msk)
 			       base + MMCIMASK0);
 
 			host->busy_status = status & (MCI_CMDSENT | MCI_CMDRESPEND);
+			host->busy_state = MMCI_BUSY_WAITING_FOR_START_IRQ;
 			return false;
 		}
 	}
@@ -710,25 +712,40 @@ static bool ux500_busy_complete(struct mmci_host *host, u32 status, u32 err_msk)
 	 * both the start and the end interrupts needs to be cleared,
 	 * one after the other. So, clear the busy start IRQ here.
 	 */
-	if (host->busy_status &&
-	    (status & host->variant->busy_detect_flag)) {
-		host->busy_status |= status & (MCI_CMDSENT | MCI_CMDRESPEND);
-		writel(host->variant->busy_detect_mask, base + MMCICLEAR);
-		return false;
+	if (host->busy_state == MMCI_BUSY_WAITING_FOR_START_IRQ) {
+		if (status & host->variant->busy_detect_flag) {
+			host->busy_status |= status & (MCI_CMDSENT | MCI_CMDRESPEND);
+			writel(host->variant->busy_detect_mask, base + MMCICLEAR);
+			host->busy_state = MMCI_BUSY_WAITING_FOR_END_IRQ;
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
 	}
 
-	/*
-	 * If there is a command in-progress that has been successfully
-	 * sent and the busy bit isn't set, it means we have received
-	 * the busy end IRQ. Clear and mask the IRQ, then continue to
-	 * process the command.
-	 */
-	if (host->busy_status) {
-		writel(host->variant->busy_detect_mask, base + MMCICLEAR);
-
-		writel(readl(base + MMCIMASK0) &
-		       ~host->variant->busy_detect_mask, base + MMCIMASK0);
-		host->busy_status = 0;
+	if (host->busy_state == MMCI_BUSY_WAITING_FOR_END_IRQ) {
+		if (status & host->variant->busy_detect_flag) {
+			host->busy_status |= status & (MCI_CMDSENT | MCI_CMDRESPEND);
+			writel(host->variant->busy_detect_mask, base + MMCICLEAR);
+			host->busy_state = MMCI_BUSY_DONE;
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
 
 	return true;
@@ -1258,6 +1275,8 @@ mmci_start_command(struct mmci_host *host, struct mmc_command *cmd, u32 c)
 	}
 
 	host->busy_status = 0;
+	host->busy_state = MMCI_BUSY_DONE;
+
 	if (host->variant->busy_timeout && cmd->flags & MMC_RSP_BUSY) {
 		if (!cmd->busy_timeout)
 			cmd->busy_timeout = 10 * MSEC_PER_SEC;
diff --git a/drivers/mmc/host/mmci.h b/drivers/mmc/host/mmci.h
index e1a9b96a3396..12a7bbd3ce26 100644
--- a/drivers/mmc/host/mmci.h
+++ b/drivers/mmc/host/mmci.h
@@ -261,6 +261,19 @@ struct clk;
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
+	MMCI_BUSY_WAITING_FOR_START_IRQ,
+	MMCI_BUSY_WAITING_FOR_END_IRQ,
+	MMCI_BUSY_DONE,
+};
+
 /**
  * struct variant_data - MMCI variant-specific quirks
  * @clkreg: default value for MCICLOCK register
@@ -409,6 +422,7 @@ struct mmci_host {
 	u32			clk_reg;
 	u32			clk_reg_add;
 	u32			datactrl_reg;
+	enum mmci_busy_state	busy_state;
 	u32			busy_status;
 	u32			mask1_reg;
 	u8			vqmmc_enabled:1;
diff --git a/drivers/mmc/host/mmci_stm32_sdmmc.c b/drivers/mmc/host/mmci_stm32_sdmmc.c
index 60bca78a72b1..a805647b6664 100644
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
+		host->busy_state = MMCI_BUSY_WAITING_FOR_END_IRQ;
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
2.40.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
