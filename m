Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B58A86D74B9
	for <lists+linux-stm32@lfdr.de>; Wed,  5 Apr 2023 08:50:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 798EBC6A612;
	Wed,  5 Apr 2023 06:50:47 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AFBE7C6A613
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  5 Apr 2023 06:50:45 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id j11so45276920lfg.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 04 Apr 2023 23:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680677445;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=zcZ9y9W+kNr4GBYOAR4xnjODyPefHWCpFtqS37+iUts=;
 b=gMLto1DLl/Sx9jxGvY87jOLVl+RaMCy6/eY6Vd1oc0NXA/fkhQi7mdiJVPf/4uUw4w
 epGyNKWarhygTVgdGdFd2F0HydW+/wM7ucdD4afTj/ZzkZlqEsPfsFxzxx1jZLi0FjbT
 ctfHRk6wMDCMC/wgAx+am68tjp5gBUTJdtXqp/ALH6TR6E+43nDwpzoQIPFThat5aOFf
 YB8Qkb37KBFWpH0nzT0gF/sbhGTRdzQLAjBFsu9gSdhLRIfoep9ulxwYy4p5wekqCJuH
 i63Y9k5MK/9AuHyB72sVj+mngQq84RyOp6RUabUvfRIUQlIkpt94jWHdueu272RPy0cu
 Nczw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680677445;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zcZ9y9W+kNr4GBYOAR4xnjODyPefHWCpFtqS37+iUts=;
 b=CoKz4ZeGQ0O5iS/011im+Yu+otNIiSpmb+/m0Qwzu4eNL4Qo0KhlwOvEKhvK2jCGrT
 BStNWEg4GIDJXF54f4MD6T5hE945Fbzn9SuVRS1MBFHs1dvBxhZN9utktba0rV8vmPWx
 WtcW5mui9MdbVKgw5/c3ABZwZu/A4XKdUG072VgmBVVE9Kn7s78r8CyfLVGKhT5veNTG
 lYiYIhJx/ZPTrUoBsIYWGC7IlEhTQdk/v9esqfWgmJ3hifwEuR1MJP3VoiXQV8TkChnP
 cFaNLCfZ82asNs4UP/tS0TjWbcdUY38lNBn1XNHJonC26QVy4zXt9SiBoEAvtln8oHKN
 8Lug==
X-Gm-Message-State: AAQBX9fv94rYZJR7hfBCo3toOeJ2rddXCP0Ytp2QASxjec1KdaxsRnxZ
 Cw2n/W1u23dGICIyWCtOejSvog==
X-Google-Smtp-Source: AKy350bedXi6nON6Hsk4E2elo/aP6kp1nyIyXYsBfNXheLNsp7UfhlR4yXl7PiZOfDd/fXrwywGSOA==
X-Received: by 2002:a05:6512:3912:b0:4e0:2455:3ade with SMTP id
 a18-20020a056512391200b004e024553ademr1278336lfu.60.1680677445163; 
 Tue, 04 Apr 2023 23:50:45 -0700 (PDT)
Received: from [192.168.1.2] (c-05d8225c.014-348-6c756e10.bbcust.telenor.se.
 [92.34.216.5]) by smtp.gmail.com with ESMTPSA id
 z19-20020ac25df3000000b004eb274b3a43sm2683086lfq.134.2023.04.04.23.50.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Apr 2023 23:50:44 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 05 Apr 2023 08:50:39 +0200
MIME-Version: 1.0
Message-Id: <20230405-pl180-busydetect-fix-v1-13-28ac19a74e5e@linaro.org>
References: <20230405-pl180-busydetect-fix-v1-0-28ac19a74e5e@linaro.org>
In-Reply-To: <20230405-pl180-busydetect-fix-v1-0-28ac19a74e5e@linaro.org>
To: Stefan Hansson <newbyte@disroot.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.12.0
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-mmc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 13/13] mmc: mmci: Add busydetect timeout
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
 drivers/mmc/host/mmci.c | 23 +++++++++++++++++++++++
 drivers/mmc/host/mmci.h |  1 +
 2 files changed, 24 insertions(+)

diff --git a/drivers/mmc/host/mmci.c b/drivers/mmc/host/mmci.c
index a4c9a3a9b037..d8abd2cad2af 100644
--- a/drivers/mmc/host/mmci.c
+++ b/drivers/mmc/host/mmci.c
@@ -37,6 +37,7 @@
 #include <linux/pinctrl/consumer.h>
 #include <linux/reset.h>
 #include <linux/gpio/consumer.h>
+#include <linux/workqueue.h>
 
 #include <asm/div64.h>
 #include <asm/io.h>
@@ -742,6 +743,8 @@ static bool ux500_busy_complete(struct mmci_host *host, u32 status, u32 err_msk)
 			host->busy_status |= status & (MCI_CMDSENT | MCI_CMDRESPEND);
 			writel(host->variant->busy_detect_mask, base + MMCICLEAR);
 			host->busy_state = MMCI_BUSY_START_IRQ;
+			schedule_delayed_work(&host->busy_timeout_work,
+					      msecs_to_jiffies(10));
 		} else {
 			dev_dbg(mmc_dev(host->mmc),
 				"lost busy status when waiting for busy start IRQ\n");
@@ -753,6 +756,7 @@ static bool ux500_busy_complete(struct mmci_host *host, u32 status, u32 err_msk)
 		if (status & host->variant->busy_detect_flag) {
 			host->busy_status |= status & (MCI_CMDSENT | MCI_CMDRESPEND);
 			writel(host->variant->busy_detect_mask, base + MMCICLEAR);
+			cancel_delayed_work_sync(&host->busy_timeout_work);
 			ux500_busy_clear_mask_done(host);
 		} else {
 			dev_dbg(mmc_dev(host->mmc),
@@ -1495,6 +1499,22 @@ mmci_cmd_irq(struct mmci_host *host, struct mmc_command *cmd,
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
@@ -2308,6 +2328,9 @@ static int mmci_probe(struct amba_device *dev,
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
