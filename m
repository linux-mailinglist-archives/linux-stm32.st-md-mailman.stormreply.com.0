Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 02AE7734E5A
	for <lists+linux-stm32@lfdr.de>; Mon, 19 Jun 2023 10:46:49 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 877DDC6A60D;
	Mon, 19 Jun 2023 08:46:48 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E64AAC6B454
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 16 Jun 2023 08:30:43 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-4f004cc54f4so516208e87.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 16 Jun 2023 01:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686904243; x=1689496243;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=TKSfFjErQqrA4N+AgDBWwU9EqGS/Y9GhjAuAbiYkf/A=;
 b=lJp1deBjvOtAoLHVmyF8tziPljobz5sX4gqcf3XUrQaXYLZ+n+XtL1QeG7OAk7Ay9O
 M9iB6WKFlxeDpwkiRU11vP2bjvU/nSrVziTEBCYVLO3itjrdN5K/aCRO4upNardE2xds
 pm8BWc4LlGPs0O0SavCx9TURPStpvTStdqhrsf7GUFbKppPp/QcUtIryAzrFjdZAiHxv
 FUmPjwwPgKgwL2AaDGNNMstB1QEF58Y/GY8mWd9h13D97hyny1sCKAQvwTVdp1PnOuiv
 WubAXxfGfkdxb2Dd4U82vu+rviH35CUaG6r4kqUkpv6BpeYK5kOe88an/faQSwYy5Vg7
 yCwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686904243; x=1689496243;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TKSfFjErQqrA4N+AgDBWwU9EqGS/Y9GhjAuAbiYkf/A=;
 b=TUggnEe1RL8eP/8pk4C6U9qjUW1FFpojqPmXKYRijU7cy3jJN9cA6MelDzm6zL4TQ/
 c/IEfqmjh79QWaUykUGG85PPnNyvmCtehdf1wqnMBlX24dL0yqdSPj+XSBedpFzFI1kk
 E79cw9vTUN//8fZGH+lWK0m6pMNxaOlAmTSLCneUpDlfbtxk5L39x6ulC6RZ/ZoamphF
 fPsNR+Xt3eWJfciJ1CEfmwSPWL2JoMPJrY2IGiC7kbExHGCwGCCLZuJ+24Qa/d9xkZWR
 GivEfvfvGn7+ecB2LCna1TY1+ryd+XECw39eXIJoeRbshMfQPZdIXdEWk5XTLpfT5vh3
 MXpw==
X-Gm-Message-State: AC+VfDzzWb1BxVwBYecS1t95vcxDggUm0N4RCJgDePkXI3Ial3G9QwNu
 zdPu7CVpvQlLyWLllxz6zLZyQw==
X-Google-Smtp-Source: ACHHUZ78mZiFnu3XwZGmaHeF12C0NqYoXkJ5x9w6amIE0Fv0MQnjxaaBVgSQLpQTBJRfgqzbBd9qzw==
X-Received: by 2002:a19:500d:0:b0:4f6:20b1:ef81 with SMTP id
 e13-20020a19500d000000b004f620b1ef81mr811165lfb.36.1686904243379; 
 Fri, 16 Jun 2023 01:30:43 -0700 (PDT)
Received: from [192.168.1.2] (c-05d8225c.014-348-6c756e10.bbcust.telenor.se.
 [92.34.216.5]) by smtp.gmail.com with ESMTPSA id
 j8-20020ac25508000000b004eb44c2ab6bsm2918106lfk.294.2023.06.16.01.30.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Jun 2023 01:30:42 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 16 Jun 2023 10:30:41 +0200
MIME-Version: 1.0
Message-Id: <20230405-pl180-busydetect-fix-v6-9-b850ec8019f3@linaro.org>
References: <20230405-pl180-busydetect-fix-v6-0-b850ec8019f3@linaro.org>
In-Reply-To: <20230405-pl180-busydetect-fix-v6-0-b850ec8019f3@linaro.org>
To: Yann Gautier <yann.gautier@foss.st.com>, 
 Stefan Hansson <newbyte@disroot.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.12.2
X-Mailman-Approved-At: Mon, 19 Jun 2023 08:46:47 +0000
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-mmc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v6 9/9] mmc: mmci: Break out a helper function
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
ChangeLog v4->v6:
- No changes.
ChangeLog v3->v4:
- No changes.
ChangeLog v2->v3:
- Rebased.
ChangeLog v1->v2:
- No changes
---
 drivers/mmc/host/mmci.c | 37 +++++++++++++++++--------------------
 1 file changed, 17 insertions(+), 20 deletions(-)

diff --git a/drivers/mmc/host/mmci.c b/drivers/mmc/host/mmci.c
index f7522c3fe849..a08d96918cae 100644
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
 
@@ -714,10 +721,7 @@ static bool ux500_busy_complete(struct mmci_host *host, u32 status, u32 err_msk)
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
@@ -739,27 +743,20 @@ static bool ux500_busy_complete(struct mmci_host *host, u32 status, u32 err_msk)
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
 
 	case MMCI_BUSY_WAITING_FOR_END_IRQ:
 		if (!(status & host->variant->busy_detect_flag)) {
 			host->busy_status |= status & (MCI_CMDSENT | MCI_CMDRESPEND);
-			host->busy_state = MMCI_BUSY_DONE;
+			writel(host->variant->busy_detect_mask, base + MMCICLEAR);
+			ux500_busy_clear_mask_done(host);
 		} else {
 			dev_dbg(mmc_dev(host->mmc),
 				"busy status still asserted when handling busy end IRQ\n");
 			/* Force clear the spurious IRQ */
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
