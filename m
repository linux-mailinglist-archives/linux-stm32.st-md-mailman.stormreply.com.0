Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FD5E7308A1
	for <lists+linux-stm32@lfdr.de>; Wed, 14 Jun 2023 21:43:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0E8FEC6A61A;
	Wed, 14 Jun 2023 19:43:25 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CD830C6904B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Jun 2023 19:43:23 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-4f004cc54f4so9278280e87.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Jun 2023 12:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686771803; x=1689363803;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=TtpAHQtwK95l2d/+LPXFFhoThhZ2n4QmGX1pudO4cjA=;
 b=k51FnUGbQWnvVwpm9g5nbQJnWs3xVMt8LHFfJKuAB8IorNftlFOeTxpc72kwUVWyEf
 +6Dov1YrGBGG4sQMBVi642Dmva+f2Z7rrjlpH9aFwaXhfm6bXecLgyFxsmPba4KlNHzd
 NYryupJVS0onTuFYw+AoApIbkrkFskS3xsnu8ERUUpqN8d5BwUEeyy3wpMT9OGcGuyYV
 9mdCIHcGfmV1n8OKkPnkUo4SZbLG3uCaiyhtpDT/AhFIReLGQcP0AC7/kMUD0d5J61B5
 8TfZYU3j3Pjasq1DYNUKezkCPwTLMtK4BMb0lCHiBUoqY23UABJJY7rxqsMU97BphVif
 URkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686771803; x=1689363803;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TtpAHQtwK95l2d/+LPXFFhoThhZ2n4QmGX1pudO4cjA=;
 b=UmKUzxW+HSOVcH7PTVcIWo54gizCs/WKec3tpGRb3S6VBh0aVVcAzBQY4h+GlsbzOx
 TkUooJ/P9npD312d8ce+3XmpBF6UVfJ4J2sNZuPfOC5SCLMEXDgeCgUpMA53UVPMNuAg
 qnPv+vKDfSQhag/ROJ7SvgmrYnzetOYORSeWhOgBbvwObDzTDKjAThRkj5uPFe2hVA+0
 GRMs5nR24vgSrFMS51iI3PtlUEgFkf8O2GucLxXwyH8IxMLq3GLuKKEiKWseE2v/I6b7
 xvYzp/4SL792owVV6lvUTpr6nlq45yUd0Hxe4so/TX09G+mezxUmcS2wNFKWP4lKZ0Zw
 uIAg==
X-Gm-Message-State: AC+VfDxkGKSFWWjgoGXeOQIswHoy+uX9mOe8DcUl8ZAh1qBrUklk3Iqt
 WAuTyR7lZuIG027k08iZirc0cg==
X-Google-Smtp-Source: ACHHUZ45cZmBRftZWAj+giX6Rh8Y6Yigc0se4wGWeO0bXoSXzNAvqnfVOFhgaxwcFixV5AGl714fbA==
X-Received: by 2002:a19:5f45:0:b0:4f7:6238:4e52 with SMTP id
 a5-20020a195f45000000b004f762384e52mr2882981lfj.8.1686771802923; 
 Wed, 14 Jun 2023 12:43:22 -0700 (PDT)
Received: from Fecusia.lan (c-05d8225c.014-348-6c756e10.bbcust.telenor.se.
 [92.34.216.5]) by smtp.gmail.com with ESMTPSA id
 s6-20020a19ad46000000b004efff420b11sm2238005lfd.181.2023.06.14.12.43.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jun 2023 12:43:22 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	linux-mmc@vger.kernel.org
Date: Wed, 14 Jun 2023 21:43:12 +0200
Message-Id: <20230614194312.1158498-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Russell King <linux@armlinux.org.uk>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Stefan Hansson <newbyte@disroot.org>, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v5] mmc: mmci: Add busydetect timeout
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

Calculate the busy timeout unconditionally in
mmci_start_command() using the code developed for STM32
and use this as a timeout for the command.

This makes the eMMC work again on Skomer.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v4->v5:
- Augment the prototype and calls to ->busy_complete() to pass
  the command along, as the caller knows which command we are
  working on.
- Use the passed cmd when scheduling the timeout.
- Schedule the timeout work when we start waiting for the first
  (start) IRQ instead of when waiting for the end IRQ.
- We only need to check host->variant->busy_detect() to know
  that we should initialize the delayed work.
- Rename all timeout variables and functions prefixed ux500_* as
  it is for this variant currently.
ChangeLog v3->v4:
- Use the calculated command busy timeout from the core
  or the same calculated default as for STM32.
ChangeLog v2->v3:
- Rebased.
ChangeLog v1->v2:
- No changes
---
 drivers/mmc/host/mmci.c             | 36 +++++++++++++++++++++++++----
 drivers/mmc/host/mmci.h             |  3 ++-
 drivers/mmc/host/mmci_stm32_sdmmc.c |  3 ++-
 3 files changed, 35 insertions(+), 7 deletions(-)

diff --git a/drivers/mmc/host/mmci.c b/drivers/mmc/host/mmci.c
index 478f71dc7f34..44f79b175b66 100644
--- a/drivers/mmc/host/mmci.c
+++ b/drivers/mmc/host/mmci.c
@@ -37,6 +37,7 @@
 #include <linux/pinctrl/consumer.h>
 #include <linux/reset.h>
 #include <linux/gpio/consumer.h>
+#include <linux/workqueue.h>
 
 #include <asm/div64.h>
 #include <asm/io.h>
@@ -672,7 +673,8 @@ static void ux500_busy_clear_mask_done(struct mmci_host *host)
  * The function returns true when the busy detection is ended
  * and we should continue processing the command.
  */
-static bool ux500_busy_complete(struct mmci_host *host, u32 status, u32 err_msk)
+static bool ux500_busy_complete(struct mmci_host *host, struct mmc_command *cmd,
+				u32 status, u32 err_msk)
 {
 	void __iomem *base = host->base;
 	int retries = 10;
@@ -716,6 +718,8 @@ static bool ux500_busy_complete(struct mmci_host *host, u32 status, u32 err_msk)
 				       host->variant->busy_detect_mask,
 				       base + MMCIMASK0);
 				host->busy_state = MMCI_BUSY_WAITING_FOR_START_IRQ;
+				schedule_delayed_work(&host->ux500_busy_timeout_work,
+				      msecs_to_jiffies(cmd->busy_timeout));
 				goto out_ret_state;
 			}
 			retries--;
@@ -751,6 +755,7 @@ static bool ux500_busy_complete(struct mmci_host *host, u32 status, u32 err_msk)
 		if (status & host->variant->busy_detect_flag) {
 			host->busy_status |= status & (MCI_CMDSENT | MCI_CMDRESPEND);
 			writel(host->variant->busy_detect_mask, base + MMCICLEAR);
+			cancel_delayed_work_sync(&host->ux500_busy_timeout_work);
 			ux500_busy_clear_mask_done(host);
 		} else {
 			dev_dbg(mmc_dev(host->mmc),
@@ -1295,10 +1300,11 @@ mmci_start_command(struct mmci_host *host, struct mmc_command *cmd, u32 c)
 	host->busy_status = 0;
 	host->busy_state = MMCI_BUSY_DONE;
 
-	if (host->variant->busy_timeout && cmd->flags & MMC_RSP_BUSY) {
-		if (!cmd->busy_timeout)
-			cmd->busy_timeout = 10 * MSEC_PER_SEC;
+	/* Assign a default timeout if the core does not provide one */
+	if (!cmd->busy_timeout)
+		cmd->busy_timeout = 10 * MSEC_PER_SEC;
 
+	if (host->variant->busy_timeout && cmd->flags & MMC_RSP_BUSY) {
 		if (cmd->busy_timeout > host->mmc->max_busy_timeout)
 			clks = (unsigned long long)host->mmc->max_busy_timeout * host->cclk;
 		else
@@ -1439,7 +1445,7 @@ mmci_cmd_irq(struct mmci_host *host, struct mmc_command *cmd,
 
 	/* Handle busy detection on DAT0 if the variant supports it. */
 	if (busy_resp && host->variant->busy_detect)
-		if (!host->ops->busy_complete(host, status, err_msk))
+		if (!host->ops->busy_complete(host, cmd, status, err_msk))
 			return;
 
 	host->cmd = NULL;
@@ -1486,6 +1492,22 @@ mmci_cmd_irq(struct mmci_host *host, struct mmc_command *cmd,
 	}
 }
 
+/*
+ * This busy timeout worker is used to "kick" the command IRQ if a
+ * busy detect IRQ fails to appear in reasonable time. Only used on
+ * variants with busy detection IRQ delivery.
+ */
+static void ux500_busy_timeout_work(struct work_struct *work)
+{
+	struct mmci_host *host =
+		container_of(work, struct mmci_host, ux500_busy_timeout_work.work);
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
@@ -2299,6 +2321,10 @@ static int mmci_probe(struct amba_device *dev,
 			goto clk_disable;
 	}
 
+	if (host->variant->busy_detect)
+		INIT_DELAYED_WORK(&host->ux500_busy_timeout_work,
+				  ux500_busy_timeout_work);
+
 	writel(MCI_IRQENABLE | variant->start_err, host->base + MMCIMASK0);
 
 	amba_set_drvdata(dev, mmc);
diff --git a/drivers/mmc/host/mmci.h b/drivers/mmc/host/mmci.h
index 12a7bbd3ce26..69b2439842dd 100644
--- a/drivers/mmc/host/mmci.h
+++ b/drivers/mmc/host/mmci.h
@@ -393,7 +393,7 @@ struct mmci_host_ops {
 	void (*dma_error)(struct mmci_host *host);
 	void (*set_clkreg)(struct mmci_host *host, unsigned int desired);
 	void (*set_pwrreg)(struct mmci_host *host, unsigned int pwr);
-	bool (*busy_complete)(struct mmci_host *host, u32 status, u32 err_msk);
+	bool (*busy_complete)(struct mmci_host *host, struct mmc_command *cmd, u32 status, u32 err_msk);
 	void (*pre_sig_volt_switch)(struct mmci_host *host);
 	int (*post_sig_volt_switch)(struct mmci_host *host, struct mmc_ios *ios);
 };
@@ -451,6 +451,7 @@ struct mmci_host {
 	void			*dma_priv;
 
 	s32			next_cookie;
+	struct delayed_work	ux500_busy_timeout_work;
 };
 
 #define dma_inprogress(host)	((host)->dma_in_progress)
diff --git a/drivers/mmc/host/mmci_stm32_sdmmc.c b/drivers/mmc/host/mmci_stm32_sdmmc.c
index a805647b6664..9ee06e5e60e5 100644
--- a/drivers/mmc/host/mmci_stm32_sdmmc.c
+++ b/drivers/mmc/host/mmci_stm32_sdmmc.c
@@ -382,7 +382,8 @@ static u32 sdmmc_get_dctrl_cfg(struct mmci_host *host)
 	return datactrl;
 }
 
-static bool sdmmc_busy_complete(struct mmci_host *host, u32 status, u32 err_msk)
+static bool sdmmc_busy_complete(struct mmci_host *host, struct mmc_command *cmd,
+				u32 status, u32 err_msk)
 {
 	void __iomem *base = host->base;
 	u32 busy_d0, busy_d0end, mask, sdmmc_status;
-- 
2.40.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
