Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F7786DBD72
	for <lists+linux-stm32@lfdr.de>; Sun,  9 Apr 2023 00:00:37 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1F632C6B456;
	Sat,  8 Apr 2023 22:00:37 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AC5B7C6B44E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  8 Apr 2023 22:00:35 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id a23so2819851lfk.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 08 Apr 2023 15:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680991235;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Lw3XG8iQC5gX8Uhau9KwDjMohP4XjFt98wfUm6sYpak=;
 b=Jr+zCxPVmuN7u4WW0VprumqpO+7exh+l2L9UIvs1dUFOOCJKfeDvUS5yAUMg1QEDbb
 /A2iAz3VS+nE9jZSOzuAVl4qLiQfMbIU45pNx3rZ1rqzUPL+z+kNlCfhP8Art1t03UP3
 kaihr2lWbL/SKEyKTDpH7oPkQny6k83Gg/zNocJ1z9gISwHWnfhkuuFV+K2OWq9k1bUq
 n4UjFnrmKdltwmfp6lle9eX/e1NqZZ6dZH/QN1tbeF7LdfrrgiFi5gtPl+t5dEEWYzLJ
 L38TSdLnMAaivCzEz7kRfrsX1rjRNG6n+v+uAJb/UT6uMCKR04dNg8sbzZwZDZuwewo+
 rWGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680991235;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Lw3XG8iQC5gX8Uhau9KwDjMohP4XjFt98wfUm6sYpak=;
 b=fIOyFrKUkPard+ujbe+XEVCtpe95CHnfJWIQ1DWVF30mNSxcOla70RJIFc1yHBho1y
 7kinesACK9i5tke3SJw3S9+cxFdxKi94v65fnRK4gwxhby4yJBx2ptcvwBbmZuXFODGW
 Bdm4BGAi4ZCr69zi+WU1uxhZ9boc7P231Jj2jR6VEISQUk7flVyB7taJdph8ToGDEenz
 z55cshXiotSl5lGq52lYvOCNsK6ZUcnUnSZLiMpooR8WJusCgDXPC6EsKpYk2Wmocwtw
 AqQ/CVGGpy2VcbgtsiG5p0f0iUoCSDcoUbt4NLjiHQUX9Va/tsK/i+qbHkfEmF2QEJoJ
 vkDA==
X-Gm-Message-State: AAQBX9foWUJc2JWY6tcwmu+ROcjHbdvNDtr6TWTdpA8FvE8xY3uSAFtv
 lXd8AgHv5JWrihadMswMlh8lUg==
X-Google-Smtp-Source: AKy350Y9kOlYLM2ZeuRBQ6/s7P5O+DOglnhe/y95JUOU6D8fllrRE/bjLDxQz2noH/HlTJqP2ClHDg==
X-Received: by 2002:ac2:547b:0:b0:4d8:82d5:f5bc with SMTP id
 e27-20020ac2547b000000b004d882d5f5bcmr811710lfn.34.1680991235145; 
 Sat, 08 Apr 2023 15:00:35 -0700 (PDT)
Received: from [192.168.1.2] (c-05d8225c.014-348-6c756e10.bbcust.telenor.se.
 [92.34.216.5]) by smtp.gmail.com with ESMTPSA id
 v9-20020a056512048900b004e9cad1cd7csm1328904lfq.229.2023.04.08.15.00.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Apr 2023 15:00:34 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 09 Apr 2023 00:00:22 +0200
MIME-Version: 1.0
Message-Id: <20230405-pl180-busydetect-fix-v2-1-eeb10323b546@linaro.org>
References: <20230405-pl180-busydetect-fix-v2-0-eeb10323b546@linaro.org>
In-Reply-To: <20230405-pl180-busydetect-fix-v2-0-eeb10323b546@linaro.org>
To: Yann Gautier <yann.gautier@foss.st.com>, 
 Stefan Hansson <newbyte@disroot.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.12.0
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-mmc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v2 01/12] mmc: mmci: Clear busy_status when
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
ChangeLog v1->v2:
- Unconditionally clear host->busy_status if we get a
  busy response.
---
 drivers/mmc/host/mmci.c | 22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

diff --git a/drivers/mmc/host/mmci.c b/drivers/mmc/host/mmci.c
index b9e5dfe74e5c..9b48df842425 100644
--- a/drivers/mmc/host/mmci.c
+++ b/drivers/mmc/host/mmci.c
@@ -1238,17 +1238,21 @@ mmci_start_command(struct mmci_host *host, struct mmc_command *cmd, u32 c)
 			c |= host->variant->cmdreg_srsp;
 	}
 
-	if (host->variant->busy_timeout && cmd->flags & MMC_RSP_BUSY) {
-		if (!cmd->busy_timeout)
-			cmd->busy_timeout = 10 * MSEC_PER_SEC;
+	if (cmd->flags & MMC_RSP_BUSY) {
+		host->busy_status = 0;
 
-		if (cmd->busy_timeout > host->mmc->max_busy_timeout)
-			clks = (unsigned long long)host->mmc->max_busy_timeout * host->cclk;
-		else
-			clks = (unsigned long long)cmd->busy_timeout * host->cclk;
+		if (host->variant->busy_timeout) {
+			if (!cmd->busy_timeout)
+				cmd->busy_timeout = 10 * MSEC_PER_SEC;
 
-		do_div(clks, MSEC_PER_SEC);
-		writel_relaxed(clks, host->base + MMCIDATATIMER);
+			if (cmd->busy_timeout > host->mmc->max_busy_timeout)
+				clks = (unsigned long long)host->mmc->max_busy_timeout * host->cclk;
+			else
+				clks = (unsigned long long)cmd->busy_timeout * host->cclk;
+
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
