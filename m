Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 105E172ED04
	for <lists+linux-stm32@lfdr.de>; Tue, 13 Jun 2023 22:34:33 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AA1ECC6B460;
	Tue, 13 Jun 2023 20:34:32 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 90855C6B454
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Jun 2023 20:34:31 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-4f62cf9755eso7416099e87.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Jun 2023 13:34:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686688471; x=1689280471;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=LrZysrHENuW7Go4ISnRgrIAfcenSBPlLC8M9RsAwT2M=;
 b=xPagHHSysBnXwwl7UbNSgtYhf7WnjXzwEItZgkcsvapQyoFhrh2IWdQvXlH1ndEsQP
 QefpdQZZhgHRvwJS9KmdbYP9noACVipd2lqaqy9VShtStbK56yoL5dmgYO0GhZYKSotN
 aAK8q0Fq3d0mCNdzJHD2uqFZBaVS4z0UW+QfQOQuFuJ/czUWQKxLBfsXh8GcGXSJMMfG
 GEdHJk5VaC7+VL6xJuN3HU61zPy16zv1pL0jNSYtfM5nsY2qC5RyjAHAhNsNbWrHZAWk
 QNkpFJLW4ogesncx4t0gLoyPptlyfucxpHxUmkaWI7ZFhnPUeZdd3o1N+eOdXF66x4Lz
 qy0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686688471; x=1689280471;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LrZysrHENuW7Go4ISnRgrIAfcenSBPlLC8M9RsAwT2M=;
 b=B+Lp6aLIeEgHgU4sH6Qq/5BEKEM8+2gugKIbaKnVlcEQJ+FHvKO2WKZ3wdBHx9HCke
 yYVtLrezmH+b1DOzgXW83Uw3jrOzgc+lZssERGU7GRonw9c7YR4fezDMNYm6x7F2gLBl
 E7x65MVWpUVY5K/tfDVig/jL9r+cisewTkgVX0tKWrroqgu6h+O9NxjcE38KMrb7MaGn
 LXv1cquqOhUVHCt+HvOLiq4Z8z6dnxCDUwiO0QK9TlBIgqyhB6fKifdcYt279fE6J8jI
 BsXIZIl2gDqkPEBpAeX0MwvQeXb3+SoGopkB3+Gpn8oojVmM/EPAAvSgZA4aJpMT6HV7
 1ndA==
X-Gm-Message-State: AC+VfDwwd3iQ2yyBfl+u16Jx6AjBWBrCTqlONjJhsHn99IsflmaG3Agz
 +GldynSkfQw/4Xq24+WnkdAvGw==
X-Google-Smtp-Source: ACHHUZ5LaeGTyGWYf/6jYG5YnmIHRVeFpdY5z5E1lQsdVjyrL/Fba0h8+LYGk56qpQsSe1vHkghBTQ==
X-Received: by 2002:a05:6512:457:b0:4f3:a91c:23d0 with SMTP id
 y23-20020a056512045700b004f3a91c23d0mr7147416lfk.31.1686688471016; 
 Tue, 13 Jun 2023 13:34:31 -0700 (PDT)
Received: from [192.168.1.2] (c-05d8225c.014-348-6c756e10.bbcust.telenor.se.
 [92.34.216.5]) by smtp.gmail.com with ESMTPSA id
 l12-20020a19c20c000000b004f26f699e9dsm1897813lfc.184.2023.06.13.13.34.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jun 2023 13:34:30 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 13 Jun 2023 22:34:22 +0200
MIME-Version: 1.0
Message-Id: <20230405-pl180-busydetect-fix-v4-6-df9c8c504353@linaro.org>
References: <20230405-pl180-busydetect-fix-v4-0-df9c8c504353@linaro.org>
In-Reply-To: <20230405-pl180-busydetect-fix-v4-0-df9c8c504353@linaro.org>
To: Yann Gautier <yann.gautier@foss.st.com>, 
 Stefan Hansson <newbyte@disroot.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.12.2
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-mmc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v4 06/10] mmc: mmci: Retry the busy start
	condition
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

This makes the ux500 ->busy_complete() callback re-read
the status register 10 times while waiting for the busy
signal to assert in the status register.

If this does not happen, we bail out regarding the
command completed already, i.e. before we managed to
start to check the busy status.

There is a comment in the code about this, let's just
implement it to be certain that we can catch this glitch
if it happens.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v3->v4:
- Accumulate status flags outside the if()-clause in the
  busy detect retry loop.
ChangeLog v2->v3:
- Rebased.
ChangeLog v1->v2:
- Move over the initial saving of host->busy_status from
  an unrelated patch to this one: it is clear what we are
  doing: we don't want to miss any transient
  (MCI_CMDSENT | MCI_CMDRESPEND) in the status register.
---
 drivers/mmc/host/mmci.c | 39 +++++++++++++++++++++++++++------------
 1 file changed, 27 insertions(+), 12 deletions(-)

diff --git a/drivers/mmc/host/mmci.c b/drivers/mmc/host/mmci.c
index 3b1a23e4ec1c..a412ecdee63a 100644
--- a/drivers/mmc/host/mmci.c
+++ b/drivers/mmc/host/mmci.c
@@ -664,6 +664,7 @@ static u32 ux500v2_get_dctrl_cfg(struct mmci_host *host)
 static bool ux500_busy_complete(struct mmci_host *host, u32 status, u32 err_msk)
 {
 	void __iomem *base = host->base;
+	int retries = 10;
 
 	if (status & err_msk) {
 		/* Stop any ongoing busy detection if an error occurs */
@@ -684,21 +685,35 @@ static bool ux500_busy_complete(struct mmci_host *host, u32 status, u32 err_msk)
 	 * Note that, the card may need a couple of clock cycles before
 	 * it starts signaling busy on DAT0, hence re-read the
 	 * MMCISTATUS register here, to allow the busy bit to be set.
-	 * Potentially we may even need to poll the register for a
-	 * while, to allow it to be set, but tests indicates that it
-	 * isn't needed.
 	 */
 	if (host->busy_state == MMCI_BUSY_DONE) {
-		status = readl(base + MMCISTATUS);
-		if (status & host->variant->busy_detect_flag) {
-			writel(readl(base + MMCIMASK0) |
-			       host->variant->busy_detect_mask,
-			       base + MMCIMASK0);
-
-			host->busy_status = status & (MCI_CMDSENT | MCI_CMDRESPEND);
-			host->busy_state = MMCI_BUSY_WAITING_FOR_START_IRQ;
-			return false;
+		/*
+		 * Save the first status register read to be sure to catch
+		 * all bits that may be lost will retrying. If the command
+		 * is still busy this will result in assigning 0 to
+		 * host->busy_status, which is what it should be in IDLE.
+		 */
+		host->busy_status = status & (MCI_CMDSENT | MCI_CMDRESPEND);
+		while (retries) {
+			status = readl(base + MMCISTATUS);
+			/* Keep accumulating status bits */
+			host->busy_status |= status & (MCI_CMDSENT | MCI_CMDRESPEND);
+			if (status & host->variant->busy_detect_flag) {
+				writel(readl(base + MMCIMASK0) |
+				       host->variant->busy_detect_mask,
+				       base + MMCIMASK0);
+				host->busy_state = MMCI_BUSY_WAITING_FOR_START_IRQ;
+				return false;
+			}
+			retries--;
 		}
+		dev_dbg(mmc_dev(host->mmc), "no busy signalling in time\n");
+		writel(host->variant->busy_detect_mask, base + MMCICLEAR);
+		writel(readl(base + MMCIMASK0) &
+		       ~host->variant->busy_detect_mask, base + MMCIMASK0);
+		host->busy_state = MMCI_BUSY_DONE;
+		host->busy_status = 0;
+		return true;
 	}
 
 	/*

-- 
2.40.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
