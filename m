Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9172C72B3CC
	for <lists+linux-stm32@lfdr.de>; Sun, 11 Jun 2023 21:41:52 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 587C6C6B457;
	Sun, 11 Jun 2023 19:41:52 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E5506C6B442
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 11 Jun 2023 19:41:50 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-4f660e57123so2051691e87.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 11 Jun 2023 12:41:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686512510; x=1689104510;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=j+1+S9hp0bTxPBqMP9IlZLkTv4wJCYyQn7oPu0mlDDM=;
 b=wO3ThUt4hp5j3C9HdmnPZMDUtmaKLluhsXOfPKD2WgZtfcDvjFYQLknqeaySvZ2fhq
 kx5lwGmIZo7AnyHS9n0PuHRGILFVDnTI9UdHMru0nSd34YqrwoueZ/0tkYou6iDqBFgu
 vgA1Ss7rqkfhnT9u9H4SDzhOn1LR9L9zAVJB8br5/A3RYbWgCsUw/gYP3sPeHVzq9sua
 vGGDa/GbcL+sBaRDfKIvGS3GZfcaW0NgwpW8EApFZtHc2+G98isB9HVZRb3DhA6TyXAG
 CZzL6j8HyEaD2E3pMPn96of+sbmdzWEfbg4OYBVgvVG6JZIYLoclZDEyk3FhHMkjWMV5
 TdzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686512510; x=1689104510;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=j+1+S9hp0bTxPBqMP9IlZLkTv4wJCYyQn7oPu0mlDDM=;
 b=hT4woJcG+tQbyagH6M+Ez6LKyHhYPAc+/kTcuAYRps3j8LJlX6lSGoLmb0QXP5LmcR
 zYrHJ0DumL4tTxJcPkXPyf0z0+C9JPGSfpIo6GAHjy6sZObFKs39VW27NeS4i8jsCmwM
 P3EmHyGQwcFVa3g2hYonyLe/mLOnY09DDvNjkbWNkEugwubx1J6ezkKj6P9V8i4ipDGl
 4tiNKjkj9+aISzr1sEUuJgTr00Xb3R6EtCOMA7HqFKpd8Pvo/hFdRLoyQVNIx4LCmQ+M
 RwW06y2ApbYeADrVRh23ayj6gkLP9nQJ0g04Yq9gkkS4HclshPNEJnZpyN4rcDHMI0Gs
 1QYw==
X-Gm-Message-State: AC+VfDxl8pPfEsJx4iBCbvaMUnm1wihtdFelMtwqb3PYooFKIH45T/hq
 OT9bG7xKAohsSzoPb5mHOMaBnQ==
X-Google-Smtp-Source: ACHHUZ7gwtSEITF6+GPD71WfSTdThuSmOnOuI2Mb0zrUP0AP15KtxfazuP9qFj/EtAJSsXpvHUUH1Q==
X-Received: by 2002:a19:6550:0:b0:4f4:b218:e85f with SMTP id
 c16-20020a196550000000b004f4b218e85fmr2301600lfj.31.1686512510394; 
 Sun, 11 Jun 2023 12:41:50 -0700 (PDT)
Received: from [192.168.1.2] (c-05d8225c.014-348-6c756e10.bbcust.telenor.se.
 [92.34.216.5]) by smtp.gmail.com with ESMTPSA id
 u24-20020ac243d8000000b004f14ae5ded8sm1246960lfl.28.2023.06.11.12.41.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Jun 2023 12:41:49 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 11 Jun 2023 21:41:36 +0200
MIME-Version: 1.0
Message-Id: <20230405-pl180-busydetect-fix-v3-10-cd3d5925ae64@linaro.org>
References: <20230405-pl180-busydetect-fix-v3-0-cd3d5925ae64@linaro.org>
In-Reply-To: <20230405-pl180-busydetect-fix-v3-0-cd3d5925ae64@linaro.org>
To: Yann Gautier <yann.gautier@foss.st.com>, 
 Stefan Hansson <newbyte@disroot.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.12.2
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-mmc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v3 10/10] mmc: mmci: Add busydetect timeout
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
ChangeLog v2->v3:
- Rebased.
ChangeLog v1->v2:
- No changes
---
 drivers/mmc/host/mmci.c | 23 +++++++++++++++++++++++
 drivers/mmc/host/mmci.h |  1 +
 2 files changed, 24 insertions(+)

diff --git a/drivers/mmc/host/mmci.c b/drivers/mmc/host/mmci.c
index 05b8fad26c10..7e40b8f2dbf3 100644
--- a/drivers/mmc/host/mmci.c
+++ b/drivers/mmc/host/mmci.c
@@ -37,6 +37,7 @@
 #include <linux/pinctrl/consumer.h>
 #include <linux/reset.h>
 #include <linux/gpio/consumer.h>
+#include <linux/workqueue.h>
 
 #include <asm/div64.h>
 #include <asm/io.h>
@@ -741,6 +742,8 @@ static bool ux500_busy_complete(struct mmci_host *host, u32 status, u32 err_msk)
 			host->busy_status |= status & (MCI_CMDSENT | MCI_CMDRESPEND);
 			writel(host->variant->busy_detect_mask, base + MMCICLEAR);
 			host->busy_state = MMCI_BUSY_WAITING_FOR_END_IRQ;
+			schedule_delayed_work(&host->busy_timeout_work,
+					      msecs_to_jiffies(10));
 		} else {
 			dev_dbg(mmc_dev(host->mmc),
 				"lost busy status when waiting for busy start IRQ\n");
@@ -752,6 +755,7 @@ static bool ux500_busy_complete(struct mmci_host *host, u32 status, u32 err_msk)
 		if (status & host->variant->busy_detect_flag) {
 			host->busy_status |= status & (MCI_CMDSENT | MCI_CMDRESPEND);
 			writel(host->variant->busy_detect_mask, base + MMCICLEAR);
+			cancel_delayed_work_sync(&host->busy_timeout_work);
 			ux500_busy_clear_mask_done(host);
 		} else {
 			dev_dbg(mmc_dev(host->mmc),
@@ -1487,6 +1491,22 @@ mmci_cmd_irq(struct mmci_host *host, struct mmc_command *cmd,
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
@@ -2300,6 +2320,9 @@ static int mmci_probe(struct amba_device *dev,
 			goto clk_disable;
 	}
 
+	if (host->variant->busy_detect && host->ops->busy_complete)
+		INIT_DELAYED_WORK(&host->busy_timeout_work, busy_timeout_work);
+
 	writel(MCI_IRQENABLE | variant->start_err, host->base + MMCIMASK0);
 
 	amba_set_drvdata(dev, mmc);
diff --git a/drivers/mmc/host/mmci.h b/drivers/mmc/host/mmci.h
index 12a7bbd3ce26..95d3d0a6049b 100644
--- a/drivers/mmc/host/mmci.h
+++ b/drivers/mmc/host/mmci.h
@@ -451,6 +451,7 @@ struct mmci_host {
 	void			*dma_priv;
 
 	s32			next_cookie;
+	struct delayed_work	busy_timeout_work;
 };
 
 #define dma_inprogress(host)	((host)->dma_in_progress)

-- 
2.40.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
