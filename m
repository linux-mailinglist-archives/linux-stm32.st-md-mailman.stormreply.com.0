Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ECE206D74A5
	for <lists+linux-stm32@lfdr.de>; Wed,  5 Apr 2023 08:50:37 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 976B3C6A617;
	Wed,  5 Apr 2023 06:50:37 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 01832C01E98
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  5 Apr 2023 06:50:36 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id h25so45324886lfv.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 04 Apr 2023 23:50:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680677435;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=htFleaT/35Wjah78kezRl5LI+byd+7VcD53GDDOkAxc=;
 b=tuEyDg0Aqj7IhYFmgZGVe9k/t5Xn0hgxfRE4pF5UxJE793NNpx66snKWdLvDVypXdu
 AXT5JmeHVy9nEU4J/963/pJ3HnV4ZYGje5uR4hXtxp6oXyCCuY0u/JiA8RloiYp87WGs
 KBig72/DAEnoIKjZ7peOe8kchx9+5EJCVfgxev15TIV6MQFtGQRscCVsFvrsOuxwMcXw
 fJ734NL6O4rIkBjcqpbnRQB5AtPTjv3RvVR5xe4xVCvlPtXjuu9GOV3qzzc9YZ+0XBNW
 LGInzH33p401dYAEZPnA9fOJdmv344OMoHIoeFHZjFDOIJCMg9yvroeiCV01Vz/yTCXD
 CGGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680677435;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=htFleaT/35Wjah78kezRl5LI+byd+7VcD53GDDOkAxc=;
 b=gO2xTHKS/EmlLOZdV5/dwZBSDuAxB7K7eeNeV5QpIzec5lPTzj1tJY27xUJaKVrJ6D
 86K4rEtLmumEsI1mXzq+lV4g7Rjlk5n7EHQNxTvalN/jTmzHq+QygUzJOzE5+4skZYuB
 2ZEme8oRbLUhfj28N/xkJ5u0gGWU8b4zN+DKJLt0VvRyGz/dRtDHlkPNvMopJ/yejAp4
 NpGJ9WRyQbdRro4l8b9C+AduPEnwhqVJyYKp4vnhYasvskDEIP+WGOgtKMFejVdYNzXM
 p8bhibd+McAtFnzuSax7Lls8v/eKQe4VxzqQRSOvw/W8HyQiZSP6sLBPcRbR/OrSChII
 H0Bg==
X-Gm-Message-State: AAQBX9fSby55jUOyFJZubHB8XBzADYAaMH0xiJTsBpM29ofeP/xL5Zso
 UEfnmBdeXto3OdtvDOA90D6i4g==
X-Google-Smtp-Source: AKy350avGN+mdyKp1Y9p5PspjESseEq6nRVNgL1kpPC1dh54xzy6aldKYul26M2/CP56SKCcB9pX5w==
X-Received: by 2002:ac2:5482:0:b0:4db:3e2d:3efc with SMTP id
 t2-20020ac25482000000b004db3e2d3efcmr1215834lfk.10.1680677435406; 
 Tue, 04 Apr 2023 23:50:35 -0700 (PDT)
Received: from [192.168.1.2] (c-05d8225c.014-348-6c756e10.bbcust.telenor.se.
 [92.34.216.5]) by smtp.gmail.com with ESMTPSA id
 z19-20020ac25df3000000b004eb274b3a43sm2683086lfq.134.2023.04.04.23.50.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Apr 2023 23:50:34 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 05 Apr 2023 08:50:28 +0200
MIME-Version: 1.0
Message-Id: <20230405-pl180-busydetect-fix-v1-2-28ac19a74e5e@linaro.org>
References: <20230405-pl180-busydetect-fix-v1-0-28ac19a74e5e@linaro.org>
In-Reply-To: <20230405-pl180-busydetect-fix-v1-0-28ac19a74e5e@linaro.org>
To: Stefan Hansson <newbyte@disroot.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.12.0
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-mmc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 02/13] mmc: mmci: Clear busy_status when
	starting command
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

If we are starting a command which can generate a busy
response, then clear the variable host->busy_status
if the variant is using a ->busy_complete callback.

We are lucky that the member is zero by default and
hopefully always gets cleared in the ->busy_complete
callback even on errors, but it's just fragile so
make sure it is always initialized to zero.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/mmc/host/mmci.c | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/drivers/mmc/host/mmci.c b/drivers/mmc/host/mmci.c
index bc150c0d5eed..3e08b2e95550 100644
--- a/drivers/mmc/host/mmci.c
+++ b/drivers/mmc/host/mmci.c
@@ -1238,17 +1238,22 @@ mmci_start_command(struct mmci_host *host, struct mmc_command *cmd, u32 c)
 			c |= host->variant->cmdreg_srsp;
 	}
 
-	if (host->variant->busy_timeout && cmd->flags & MMC_RSP_BUSY) {
-		if (!cmd->busy_timeout)
-			cmd->busy_timeout = 10 * MSEC_PER_SEC;
+	if (cmd->flags & MMC_RSP_BUSY) {
+		if (host->ops->busy_complete)
+			host->busy_status = 0;
 
-		if (cmd->busy_timeout > host->mmc->max_busy_timeout)
-			clks = (unsigned long long)host->mmc->max_busy_timeout * host->cclk;
-		else
-			clks = (unsigned long long)cmd->busy_timeout * host->cclk;
+		if (host->variant->busy_timeout) {
+			if (!cmd->busy_timeout)
+				cmd->busy_timeout = 10 * MSEC_PER_SEC;
+
+			if (cmd->busy_timeout > host->mmc->max_busy_timeout)
+				clks = (unsigned long long)host->mmc->max_busy_timeout * host->cclk;
+			else
+				clks = (unsigned long long)cmd->busy_timeout * host->cclk;
 
-		do_div(clks, MSEC_PER_SEC);
-		writel_relaxed(clks, host->base + MMCIDATATIMER);
+			do_div(clks, MSEC_PER_SEC);
+			writel_relaxed(clks, host->base + MMCIDATATIMER);
+		}
 	}
 
 	if (host->ops->pre_sig_volt_switch && cmd->opcode == SD_SWITCH_VOLTAGE)

-- 
2.39.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
