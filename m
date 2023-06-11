Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E67972B3BE
	for <lists+linux-stm32@lfdr.de>; Sun, 11 Jun 2023 21:41:44 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C0EC2C6B443;
	Sun, 11 Jun 2023 19:41:43 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 488EAC6A61E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 11 Jun 2023 19:41:43 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-4f004cc54f4so4211494e87.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 11 Jun 2023 12:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686512502; x=1689104502;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=97fyKcVEFuh2Yeg9Iaqs54dTpBgorwtoQwgxut62TCg=;
 b=yA0SGohAqbPT7T7z8/1vC7qEJb2uBbpUCq00HUlyQl6KSBH0cIZsKbggzUaaJbbX8w
 6xMiluvmqvyH3+2mi8cUQ+qY/dwp1NSL1LWZ+14JP2bxQOG/mTkpFZb7+R9ikSrXADyL
 +n5/kxPUUjXHLOIQWVoM/GFoVnGCu5kTQ/fGQjAbb+K84mDr1TmWYcFeAXgVh/Ctp0G8
 k4ox7k2GhzU1TrZi704Bh07grXgTOg9jFKpt4iwVa7Lz0tE/HOmUTy5D+yYELdH/+dT9
 3+AkwAcnmlD1/Ip+LbADMTInfuN7Z7Dw/FFyurY8yPB8Ndw77h0Jpc/3jVlDYVObzxLZ
 zgGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686512502; x=1689104502;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=97fyKcVEFuh2Yeg9Iaqs54dTpBgorwtoQwgxut62TCg=;
 b=kMCaFOS62SSgkNVZJ7v1M0Q86yGMHV5hBuoQ9vDjyo6JnWDB/uVbb5jC79xw770+8E
 4hddy/AQqrM8XvF1M1LYwg5mL9j+AhXM/FpiP2wMaFTj6y98TbpHrVGd7K3tSuS5xfDW
 Y0e0XGeyn2/gSRYVU0c/Fueihy0LQNXeB+rn+vyBDPq/5dlZAyieyoqCn7g+hEtL7NnI
 n6n4sFyG51+wofQ60PP3GBG7qmAk5lK9tXozgximUUZgKiklAARRPFSRmv+t8wzbBn/J
 R/hZAdk8VFCYkxFvrnrrbn4AHYpzZqlaoDJtC2Re06GCfvyf68J4EOp7J4mNkVlApyAw
 5OoQ==
X-Gm-Message-State: AC+VfDxSmtmZ8lRSHjOIGrIv7DlB+xgliRct760OSqcxhPf9MFzmLgDa
 AqrD4GbLUDNn6o96M1D4SLzctA==
X-Google-Smtp-Source: ACHHUZ4FPt8+JEfGlHmbu5/k2niTR5QSnYLJBX0CszSWlXLxjQ6sdECjmra5ebSwlCr6RPqBbhbpZQ==
X-Received: by 2002:ac2:498f:0:b0:4f4:b378:469d with SMTP id
 f15-20020ac2498f000000b004f4b378469dmr3280704lfl.41.1686512502572; 
 Sun, 11 Jun 2023 12:41:42 -0700 (PDT)
Received: from [192.168.1.2] (c-05d8225c.014-348-6c756e10.bbcust.telenor.se.
 [92.34.216.5]) by smtp.gmail.com with ESMTPSA id
 u24-20020ac243d8000000b004f14ae5ded8sm1246960lfl.28.2023.06.11.12.41.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Jun 2023 12:41:41 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 11 Jun 2023 21:41:28 +0200
MIME-Version: 1.0
Message-Id: <20230405-pl180-busydetect-fix-v3-2-cd3d5925ae64@linaro.org>
References: <20230405-pl180-busydetect-fix-v3-0-cd3d5925ae64@linaro.org>
In-Reply-To: <20230405-pl180-busydetect-fix-v3-0-cd3d5925ae64@linaro.org>
To: Yann Gautier <yann.gautier@foss.st.com>, 
 Stefan Hansson <newbyte@disroot.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.12.2
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-mmc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v3 02/10] mmc: mmci: Unwind big if() clause
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

This does two things: firsr replace the hard-to-read long
if-expression:

  if (!host->busy_status && !(status & err_msk) &&
      (readl(base + MMCISTATUS) & host->variant->busy_detect_flag)) {

With the more readable:

  if (!host->busy_status && !(status & err_msk)) {
     status = readl(base + MMCISTATUS);
     if (status & host->variant->busy_detect_flag) {

Second notice that the re-read MMCISTATUS register is now
stored into the status variable, using logic OR because what
if something else changed too?

While we are at it, explain what the function is doing.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v2->v3:
- Rebased.
ChangeLog v1->v2:
- Only assign the cached status in host->busy_status if
  we have busy detect signalling going on.
---
 drivers/mmc/host/mmci.c | 23 ++++++++++++++++-------
 1 file changed, 16 insertions(+), 7 deletions(-)

diff --git a/drivers/mmc/host/mmci.c b/drivers/mmc/host/mmci.c
index 14d639872952..d8e7b17adaee 100644
--- a/drivers/mmc/host/mmci.c
+++ b/drivers/mmc/host/mmci.c
@@ -654,6 +654,13 @@ static u32 ux500v2_get_dctrl_cfg(struct mmci_host *host)
 	return MCI_DPSM_ENABLE | (host->data->blksz << 16);
 }
 
+/*
+ * ux500_busy_complete() - this will wait until the busy status
+ * goes off, saving any status that occur in the meantime into
+ * host->busy_status until we know the card is not busy any more.
+ * The function returns true when the busy detection is ended
+ * and we should continue processing the command.
+ */
 static bool ux500_busy_complete(struct mmci_host *host, u32 status, u32 err_msk)
 {
 	void __iomem *base = host->base;
@@ -671,14 +678,16 @@ static bool ux500_busy_complete(struct mmci_host *host, u32 status, u32 err_msk)
 	 * while, to allow it to be set, but tests indicates that it
 	 * isn't needed.
 	 */
-	if (!host->busy_status && !(status & err_msk) &&
-	    (readl(base + MMCISTATUS) & host->variant->busy_detect_flag)) {
-		writel(readl(base + MMCIMASK0) |
-		       host->variant->busy_detect_mask,
-		       base + MMCIMASK0);
+	if (!host->busy_status && !(status & err_msk)) {
+		status = readl(base + MMCISTATUS);
+		if (status & host->variant->busy_detect_flag) {
+			writel(readl(base + MMCIMASK0) |
+			       host->variant->busy_detect_mask,
+			       base + MMCIMASK0);
 
-		host->busy_status = status & (MCI_CMDSENT | MCI_CMDRESPEND);
-		return false;
+			host->busy_status = status & (MCI_CMDSENT | MCI_CMDRESPEND);
+			return false;
+		}
 	}
 
 	/*

-- 
2.40.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
