Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F8B76DBD7F
	for <lists+linux-stm32@lfdr.de>; Sun,  9 Apr 2023 00:00:56 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CB1D2C6B463;
	Sat,  8 Apr 2023 22:00:46 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E686DC6B461
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  8 Apr 2023 22:00:45 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id e11so2232073lfc.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 08 Apr 2023 15:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680991245;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=NK/Fry9T9gbXULkf+X1lnmSQBtAcyXPtx15VS/8mjZQ=;
 b=uVqJUmRLIEBX067m4GrdxYkkBbmoL93WK/V0QPpzSlQlHjdHL+TM+3p45evtn9jw7z
 dKkfjIznLuceUL2QMGjpI0QBWpodTQV0SSe9n9Ii8QV1ohGQ0UPAWYrTIDIBDZFTIMRK
 4KK3PN+iwo3zQQNIgECnTlcCznJ6uY7XhYcepsHb7fcwBRNyBgfG8/Jxk9qdO21+Ykf2
 nybbBMbd+2kIfXQjlmO9crx0B8br2DkWemP4X+BcoJkw+g3dRh5RiuHNsPoAS5oxOWIe
 5kHRjjNa4zUMJFE8fYl/Jg2DDaunp6jph7EdJxxTNuLyYs8PnPTvZP+VdVFu1uRt2/nF
 Z5RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680991245;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NK/Fry9T9gbXULkf+X1lnmSQBtAcyXPtx15VS/8mjZQ=;
 b=mSCCnwqK+9GHuoNw7u0PBA5pMB00h4jRbB8NdD84cDHU+RFUqVgV8HVymcKBDkabHR
 2b7QJTlUUvhUBj1EzSxAUTsAC8hBaeMwZj8aBEoFnIkaH/est6w/Vnj+trH8sX+nKsrV
 1N6/Pmm4PqhRDm0j1NdBvUGX+JuVhl50Rc9j/BFUDAZTaNAv/D/0nHLqN8c8P734KMV8
 Pbfyskz8XMsK6du5X89+h7jc1yGm6l5krg/A4nR6EZ7AXKlGWvMm6g0RvvgRVMMrdkCX
 jqloXDBrvAIt7EYQAbJnOmpNK4gnKiwi9VJPJcMdlxXcVL16MkS2zsl9g/A/ErfPa5Ue
 fClg==
X-Gm-Message-State: AAQBX9dVxeIdZN68MWFgUtmTcrdtg8++DLpsVr7aIBxmWqY6IOa+xbz5
 KldMycmN60xWLopd1koJdAXA1w==
X-Google-Smtp-Source: AKy350an2GH9i7wmQ/+Ebm1829Zb1RXtBYT4meUnPlrJWgb7glP+JurXh9Xwhe9//nJscwBjStDNtg==
X-Received: by 2002:ac2:4477:0:b0:4eb:2ac1:52a6 with SMTP id
 y23-20020ac24477000000b004eb2ac152a6mr1839681lfl.36.1680991245335; 
 Sat, 08 Apr 2023 15:00:45 -0700 (PDT)
Received: from [192.168.1.2] (c-05d8225c.014-348-6c756e10.bbcust.telenor.se.
 [92.34.216.5]) by smtp.gmail.com with ESMTPSA id
 v9-20020a056512048900b004e9cad1cd7csm1328904lfq.229.2023.04.08.15.00.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Apr 2023 15:00:44 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 09 Apr 2023 00:00:33 +0200
MIME-Version: 1.0
Message-Id: <20230405-pl180-busydetect-fix-v2-12-eeb10323b546@linaro.org>
References: <20230405-pl180-busydetect-fix-v2-0-eeb10323b546@linaro.org>
In-Reply-To: <20230405-pl180-busydetect-fix-v2-0-eeb10323b546@linaro.org>
To: Yann Gautier <yann.gautier@foss.st.com>, 
 Stefan Hansson <newbyte@disroot.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.12.0
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-mmc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v2 12/12] mmc: mmci: Add busydetect timeout
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

Add a timeout for busydetect IRQs using a delayed work.
It might happen (and does happen) on Ux500 that the first
busy detect IRQ appears and not the second one. This will
make the host hang indefinitely waiting for the second
IRQ to appear.

Fire a delayed work after 10ms and re-engage the command
IRQ so the transaction finishes: we are certainly done
at this point, or we will catch an error in the status
register.

This makes the eMMC work again on Skomer.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v1->v2:
- No changes
---
 drivers/mmc/host/mmci.c | 23 +++++++++++++++++++++++
 drivers/mmc/host/mmci.h |  1 +
 2 files changed, 24 insertions(+)

diff --git a/drivers/mmc/host/mmci.c b/drivers/mmc/host/mmci.c
index 17233702e7fb..1af129fba0ed 100644
--- a/drivers/mmc/host/mmci.c
+++ b/drivers/mmc/host/mmci.c
@@ -37,6 +37,7 @@
 #include <linux/pinctrl/consumer.h>
 #include <linux/reset.h>
 #include <linux/gpio/consumer.h>
+#include <linux/workqueue.h>
 
 #include <asm/div64.h>
 #include <asm/io.h>
@@ -747,6 +748,8 @@ static bool ux500_busy_complete(struct mmci_host *host, u32 status, u32 err_msk)
 			host->busy_status |= status & (MCI_CMDSENT | MCI_CMDRESPEND);
 			writel(host->variant->busy_detect_mask, base + MMCICLEAR);
 			host->busy_state = MMCI_BUSY_START_IRQ;
+			schedule_delayed_work(&host->busy_timeout_work,
+					      msecs_to_jiffies(10));
 		} else {
 			dev_dbg(mmc_dev(host->mmc),
 				"lost busy status when waiting for busy start IRQ\n");
@@ -758,6 +761,7 @@ static bool ux500_busy_complete(struct mmci_host *host, u32 status, u32 err_msk)
 		if (status & host->variant->busy_detect_flag) {
 			host->busy_status |= status & (MCI_CMDSENT | MCI_CMDRESPEND);
 			writel(host->variant->busy_detect_mask, base + MMCICLEAR);
+			cancel_delayed_work_sync(&host->busy_timeout_work);
 			ux500_busy_clear_mask_done(host);
 		} else {
 			dev_dbg(mmc_dev(host->mmc),
@@ -1498,6 +1502,22 @@ mmci_cmd_irq(struct mmci_host *host, struct mmc_command *cmd,
 	}
 }
 
+/*
+ * This busy timeout worker is used to "kick" the command IRQ if a
+ * busy detect IRQ fails to appear in reasonable time. Only used on
+ * variants with busy detection IRQ delivery.
+ */
+static void busy_timeout_work(struct work_struct *work)
+{
+	struct mmci_host *host =
+		container_of(work, struct mmci_host, busy_timeout_work.work);
+	u32 status;
+
+	dev_dbg(mmc_dev(host->mmc), "timeout waiting for busy IRQ\n");
+	status = readl(host->base + MMCISTATUS);
+	mmci_cmd_irq(host, host->cmd, status);
+}
+
 static int mmci_get_rx_fifocnt(struct mmci_host *host, u32 status, int remain)
 {
 	return remain - (readl(host->base + MMCIFIFOCNT) << 2);
@@ -2311,6 +2331,9 @@ static int mmci_probe(struct amba_device *dev,
 			goto clk_disable;
 	}
 
+	if (host->variant->busy_detect && host->ops->busy_complete)
+		INIT_DELAYED_WORK(&host->busy_timeout_work, busy_timeout_work);
+
 	writel(MCI_IRQENABLE | variant->start_err, host->base + MMCIMASK0);
 
 	amba_set_drvdata(dev, mmc);
diff --git a/drivers/mmc/host/mmci.h b/drivers/mmc/host/mmci.h
index 82f3850325c8..68ce7ea4d3b2 100644
--- a/drivers/mmc/host/mmci.h
+++ b/drivers/mmc/host/mmci.h
@@ -453,6 +453,7 @@ struct mmci_host {
 	void			*dma_priv;
 
 	s32			next_cookie;
+	struct delayed_work	busy_timeout_work;
 };
 
 #define dma_inprogress(host)	((host)->dma_in_progress)

-- 
2.39.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
