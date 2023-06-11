Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F44372B82C
	for <lists+linux-stm32@lfdr.de>; Mon, 12 Jun 2023 08:42:40 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EFD49C6A60F;
	Mon, 12 Jun 2023 06:42:39 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E4CD0C6B443
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 11 Jun 2023 19:41:49 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-4f6195d2b3fso4240490e87.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 11 Jun 2023 12:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686512509; x=1689104509;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=DOREVZA+zERMYs+RJDBSFYM3ALswR/wHOUbJG0YlIJE=;
 b=mKf5kxK4RJQHf+3S71k1y9a4LnmDcogYClmmdgwmFExBsXVpkFOik+LdjfXB8FHtkU
 wpFOnYxjjslfR5c4FC37/PjGgUSW3DEk601aEs6E1Iwp1MiQTv9gI/XFoZzDHMBsMcx+
 LSS9RpZLWQ1HWSD6K2P1BoqrRS39+GWE6MNiMy8Q5RQuvsVO2MQnK7522ELl+iKoSyrU
 Q7xVehFcIu3eh1QkvHea5oaSQaBCKgL/5QLvpSEmCtz7nlmEEdd01i9q+HNLO9+MMYfN
 grTQl3u+m+hHSwyryF+ZmmIOpJ094cbNmiXs+VoSU0O78G1z4+kbqN/gH3A0vUQ+P15R
 2owg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686512509; x=1689104509;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DOREVZA+zERMYs+RJDBSFYM3ALswR/wHOUbJG0YlIJE=;
 b=j27rOUy/8DcppXR+OJp2AjdOrUH/ySSCRuANfDxUUl+27DpwtxUz+Q7ePzm0p//ICw
 SQ5RyiMzJzlIFRRKoguLq7wOklgyQmWWGJ5nyFk7O28/Uc1RNaBW0VxThXWbmTaewYHz
 DZeAFkki7QvCXkUnsSO9doxKFeMSgBYIo4m+xEaNq4dntOPoppbYdmDwI2s+41b+IcF0
 JULZ/Z05ATf7/zc/g3+F9mGdT5enwGckLquX74iCtkfpNOCD4zzl0HQvF11nwj46IiqH
 bd9hgOURSNQgZrT8ILu3+k/DsRbOFrbrxpWANXocUisUjmM3uADJ+UNNyAZHNnMuIRP3
 lBQw==
X-Gm-Message-State: AC+VfDy2ImOm2RExOg7Y2L4oZ8rXLbTsTBWFomrKV7wDPSpX4wVnBSkF
 owWK6AMVYdWtME1jZpmzszjKvQ==
X-Google-Smtp-Source: ACHHUZ5Pm/aLx2cAktRf/CkifxFJKVMQo87Q+ScHJU8mgadflGv+kwdWQVDRjhEaLLGoWQj2hysh9Q==
X-Received: by 2002:ac2:5928:0:b0:4f4:c909:cddf with SMTP id
 v8-20020ac25928000000b004f4c909cddfmr3097520lfi.44.1686512509382; 
 Sun, 11 Jun 2023 12:41:49 -0700 (PDT)
Received: from [192.168.1.2] (c-05d8225c.014-348-6c756e10.bbcust.telenor.se.
 [92.34.216.5]) by smtp.gmail.com with ESMTPSA id
 u24-20020ac243d8000000b004f14ae5ded8sm1246960lfl.28.2023.06.11.12.41.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Jun 2023 12:41:48 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 11 Jun 2023 21:41:35 +0200
MIME-Version: 1.0
Message-Id: <20230405-pl180-busydetect-fix-v3-9-cd3d5925ae64@linaro.org>
References: <20230405-pl180-busydetect-fix-v3-0-cd3d5925ae64@linaro.org>
In-Reply-To: <20230405-pl180-busydetect-fix-v3-0-cd3d5925ae64@linaro.org>
To: Yann Gautier <yann.gautier@foss.st.com>, 
 Stefan Hansson <newbyte@disroot.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.12.2
X-Mailman-Approved-At: Mon, 12 Jun 2023 06:42:38 +0000
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-mmc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v3 09/10] mmc: mmci: Break out a helper
	function
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

These four lines clearing, masking and resetting the state
of the busy detect state machine is repeated five times in
the code so break this out to a small helper so things are
easier to read.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v2->v3:
- Rebased.
ChangeLog v1->v2:
- No changes
---
 drivers/mmc/host/mmci.c | 36 ++++++++++++++++--------------------
 1 file changed, 16 insertions(+), 20 deletions(-)

diff --git a/drivers/mmc/host/mmci.c b/drivers/mmc/host/mmci.c
index e80dd7e7a001..05b8fad26c10 100644
--- a/drivers/mmc/host/mmci.c
+++ b/drivers/mmc/host/mmci.c
@@ -654,6 +654,17 @@ static u32 ux500v2_get_dctrl_cfg(struct mmci_host *host)
 	return MCI_DPSM_ENABLE | (host->data->blksz << 16);
 }
 
+static void ux500_busy_clear_mask_done(struct mmci_host *host)
+{
+	void __iomem *base = host->base;
+
+	writel(host->variant->busy_detect_mask, base + MMCICLEAR);
+	writel(readl(base + MMCIMASK0) &
+	       ~host->variant->busy_detect_mask, base + MMCIMASK0);
+	host->busy_state = MMCI_BUSY_DONE;
+	host->busy_status = 0;
+}
+
 /*
  * ux500_busy_complete() - this will wait until the busy status
  * goes off, saving any status that occur in the meantime into
@@ -668,11 +679,7 @@ static bool ux500_busy_complete(struct mmci_host *host, u32 status, u32 err_msk)
 
 	if (status & err_msk) {
 		/* Stop any ongoing busy detection if an error occurs */
-		writel(host->variant->busy_detect_mask, base + MMCICLEAR);
-		writel(readl(base + MMCIMASK0) &
-		       ~host->variant->busy_detect_mask, base + MMCIMASK0);
-		host->busy_state = MMCI_BUSY_DONE;
-		host->busy_status = 0;
+		ux500_busy_clear_mask_done(host);
 		goto out_ret_state;
 	}
 
@@ -715,10 +722,7 @@ static bool ux500_busy_complete(struct mmci_host *host, u32 status, u32 err_msk)
 			retries--;
 		}
 		dev_dbg(mmc_dev(host->mmc), "no busy signalling in time\n");
-		writel(host->variant->busy_detect_mask, base + MMCICLEAR);
-		writel(readl(base + MMCIMASK0) &
-		       ~host->variant->busy_detect_mask, base + MMCIMASK0);
-		host->busy_state = MMCI_BUSY_DONE;
+		ux500_busy_clear_mask_done(host);
 		break;
 
 	/*
@@ -740,11 +744,7 @@ static bool ux500_busy_complete(struct mmci_host *host, u32 status, u32 err_msk)
 		} else {
 			dev_dbg(mmc_dev(host->mmc),
 				"lost busy status when waiting for busy start IRQ\n");
-			writel(host->variant->busy_detect_mask, base + MMCICLEAR);
-			writel(readl(base + MMCIMASK0) &
-			       ~host->variant->busy_detect_mask, base + MMCIMASK0);
-			host->busy_state = MMCI_BUSY_DONE;
-			host->busy_status = 0;
+			ux500_busy_clear_mask_done(host);
 		}
 		break;
 
@@ -752,15 +752,11 @@ static bool ux500_busy_complete(struct mmci_host *host, u32 status, u32 err_msk)
 		if (status & host->variant->busy_detect_flag) {
 			host->busy_status |= status & (MCI_CMDSENT | MCI_CMDRESPEND);
 			writel(host->variant->busy_detect_mask, base + MMCICLEAR);
-			host->busy_state = MMCI_BUSY_DONE;
+			ux500_busy_clear_mask_done(host);
 		} else {
 			dev_dbg(mmc_dev(host->mmc),
 				"lost busy status when waiting for busy end IRQ\n");
-			writel(host->variant->busy_detect_mask, base + MMCICLEAR);
-			writel(readl(base + MMCIMASK0) &
-			       ~host->variant->busy_detect_mask, base + MMCIMASK0);
-			host->busy_state = MMCI_BUSY_DONE;
-			host->busy_status = 0;
+			ux500_busy_clear_mask_done(host);
 		}
 		break;
 

-- 
2.40.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
