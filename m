Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B13757329C9
	for <lists+linux-stm32@lfdr.de>; Fri, 16 Jun 2023 10:30:39 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 73A08C6B457;
	Fri, 16 Jun 2023 08:30:39 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EDB1DC64110
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 16 Jun 2023 08:30:37 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-4f7deee339dso485482e87.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 16 Jun 2023 01:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686904237; x=1689496237;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=6ghF3xs3yQs3rXYpWsa33Muru521Sx+tCdBOCvTmZKM=;
 b=Y72Kg6S+HS9H/kKU98N2aG7RMxLkI5SqQER+/1E7WxjgHQQZJGIZlUiC5I1sdMNvJ0
 LvVvYKGl5hvJvZ8rHILjpp/9C061rWu1HjH0QOUEEhCL664Qagll5+R8ZbraXz4L5OYB
 JJa9McOUT72+9ierH5xTtYa9EDpfeWDsWl3r2u/BON6KPVM7FtjZ8WqNZuofd6z3wEtA
 uZNFLCqKy54/0NJwHJ2M/WOWn7g9naoBh8rtOZ82AgBBQ/sqiVhoChgHTQXnGE1l+x91
 FfVZH5UowipJBt9uw+CCMIy2MIu94JP07nsRM1v1qggJV/MzlsNo/37rvjDC/Ptv8NRy
 VCoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686904237; x=1689496237;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6ghF3xs3yQs3rXYpWsa33Muru521Sx+tCdBOCvTmZKM=;
 b=Kp0sYmgTLmyAlW/LEqf9IieMKCH9EWSte2OQwiq6cNeXr0Hts6zdREjlXnXBPx0YtW
 MRt51NN0IGSVsM3OYT5Q2TpDS/KnY+a0oaMjh9o3FJJY7yHEwU9lixrKvwJSAKrwwOlk
 0cTm+LwisJ6hjhUkqJ4sNlatwiVBFhzgw7549PbYNUyN5ImafLZu+CL4KJohMpt8nFt5
 t+UPeuYGfAWD0pIkdcyYFHvjdmVvnJFfwdvB/nLVdqA93M3pNeljxpcP2IN17pIl9ruo
 nHYGBPJ0CfUm+62+uwB0UZjgtrgXWeRNb9tks4ZuOM69WhmIutU6Urz9k7BC18fyPxq8
 n8Zg==
X-Gm-Message-State: AC+VfDyuenrfX1hyecm3gI7MhiUgza5r1EKePIXex4fmNSeD2edFPjG2
 4YnSrrhJ3usqQNaZt8dXsZaBDw==
X-Google-Smtp-Source: ACHHUZ62k2noxCvM8fqALPVmY/PVnzzSyFYRFFqiq3iaxrSKtVg/R2icMjX1lNvG3js9VO32t+lVuQ==
X-Received: by 2002:a05:6512:2f4:b0:4f8:582e:f4f2 with SMTP id
 m20-20020a05651202f400b004f8582ef4f2mr369827lfq.47.1686904237351; 
 Fri, 16 Jun 2023 01:30:37 -0700 (PDT)
Received: from [192.168.1.2] (c-05d8225c.014-348-6c756e10.bbcust.telenor.se.
 [92.34.216.5]) by smtp.gmail.com with ESMTPSA id
 j8-20020ac25508000000b004eb44c2ab6bsm2918106lfk.294.2023.06.16.01.30.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Jun 2023 01:30:36 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 16 Jun 2023 10:30:34 +0200
MIME-Version: 1.0
Message-Id: <20230405-pl180-busydetect-fix-v6-2-b850ec8019f3@linaro.org>
References: <20230405-pl180-busydetect-fix-v6-0-b850ec8019f3@linaro.org>
In-Reply-To: <20230405-pl180-busydetect-fix-v6-0-b850ec8019f3@linaro.org>
To: Yann Gautier <yann.gautier@foss.st.com>, 
 Stefan Hansson <newbyte@disroot.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.12.2
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-mmc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v6 2/9] mmc: mmci: Unwind big if() clause
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
ChangeLog v4->v6:
- No changes.
ChangeLog v3->v4:
- No changes.
ChangeLog v2->v3:
- Rebased.
ChangeLog v1->v2:
- Only assign the cached status in host->busy_status if
  we have busy detect signalling going on.
---
 drivers/mmc/host/mmci.c | 23 ++++++++++++++++-------
 1 file changed, 16 insertions(+), 7 deletions(-)

diff --git a/drivers/mmc/host/mmci.c b/drivers/mmc/host/mmci.c
index 0a4b6b6e0f03..eee449f90915 100644
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
