Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4329B6DBD7D
	for <lists+linux-stm32@lfdr.de>; Sun,  9 Apr 2023 00:00:56 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9DF7FC6B454;
	Sat,  8 Apr 2023 22:00:45 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 195E0C6B44E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  8 Apr 2023 22:00:42 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id i26so2652940lfc.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 08 Apr 2023 15:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680991242;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ulSk45VVtkQg/VdJQPl9abn/cnbMSUxtNO73oyBUdnI=;
 b=xNtWRgV51u81o5Ru5snbvFHi2CMdQ/qYrwzEfDnwHb9oacILRfg7jP1XbwIDMLHPsD
 hHEE3aI1uFJqAUzSwReO4uEqZzGvN1AK3xv4heIlTVuaQMIYi6VDesg/oI0g6kWnbKKN
 rK+s2FheyK2Kc0mX6AAXhPv1k3JoL52oiJQD5fKQU8IcuQC0hgMMpgsOIWp0wCyNpsof
 7eBb18o8rLx2rhHyGeipGcCyX8WbUiY/CvS8yf0eA+KWCiV9HfqBSj1xjg8B8/4+xGxr
 mL1RpnMnTWqVdmZJdJMZEbCmwgunkW6P8KswOfIkuoD8wV3WScx+G9BfI5C/5aJqmrA9
 xuOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680991242;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ulSk45VVtkQg/VdJQPl9abn/cnbMSUxtNO73oyBUdnI=;
 b=4NSZiAIbsHAMfvRnOOOoYBDy6wGni/aItdZcNJYin+/yCwdEPG72tQwa/2mQG2YbfC
 tW3RpGIM2Ug6P48zw2i8u51HdUVTvl2LU1kClJBZf247MJdGlY/EcFMRSxTlszIMGiXV
 YavFH+jTXUCcOpsd3k3kvdjthh7iYilTzBFL2QEreKp4DM9k3sT4tDgprQi3sG8Gfv+W
 YDixX+gU+Sc4yJRbIsJC24hIgaqMlGEizYcckRgmUCX29HDnJaHEVYsfu3W7h7sqOaaH
 lTgsXRMFEVeovuB9y00PYfB8oK8xPOb3rl7VmVNCei4t5KyQ/71SZMIT9eJNK0Jf3vA2
 ycfg==
X-Gm-Message-State: AAQBX9c4HirqUtuNxZjUc+OsHqYUztY3WiDyuEo/vA9VVeP95kCjq+jI
 HqxXWNZoVGomB55FDJHZgFhaHA==
X-Google-Smtp-Source: AKy350al+1pRL1fKihF3snfzUxn/XCgYEiLlufMjMilEnI+leSgyi3G5zSBnXdRXnw3k8tn4QYQWZA==
X-Received: by 2002:a05:6512:985:b0:4eb:1e73:d30a with SMTP id
 w5-20020a056512098500b004eb1e73d30amr594315lft.45.1680991241832; 
 Sat, 08 Apr 2023 15:00:41 -0700 (PDT)
Received: from [192.168.1.2] (c-05d8225c.014-348-6c756e10.bbcust.telenor.se.
 [92.34.216.5]) by smtp.gmail.com with ESMTPSA id
 v9-20020a056512048900b004e9cad1cd7csm1328904lfq.229.2023.04.08.15.00.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Apr 2023 15:00:41 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 09 Apr 2023 00:00:29 +0200
MIME-Version: 1.0
Message-Id: <20230405-pl180-busydetect-fix-v2-8-eeb10323b546@linaro.org>
References: <20230405-pl180-busydetect-fix-v2-0-eeb10323b546@linaro.org>
In-Reply-To: <20230405-pl180-busydetect-fix-v2-0-eeb10323b546@linaro.org>
To: Yann Gautier <yann.gautier@foss.st.com>, 
 Stefan Hansson <newbyte@disroot.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.12.0
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-mmc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v2 08/12] mmc: mmci: Use a switch statement
	machine
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

As is custom, use a big switch statement to transition
between the edges of the state machine inside
the ux500 ->busy_complete callback.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v1->v2:
- No changes
---
 drivers/mmc/host/mmci.c | 34 ++++++++++++++++++++--------------
 1 file changed, 20 insertions(+), 14 deletions(-)

diff --git a/drivers/mmc/host/mmci.c b/drivers/mmc/host/mmci.c
index 2689c6bb62d6..76d885d7e49f 100644
--- a/drivers/mmc/host/mmci.c
+++ b/drivers/mmc/host/mmci.c
@@ -676,6 +676,12 @@ static bool ux500_busy_complete(struct mmci_host *host, u32 status, u32 err_msk)
 		goto out_ret_state;
 	}
 
+	/*
+	 * The state transitions are encoded in a state machine crossing
+	 * the edges in this switch statement.
+	 */
+	switch (host->busy_state) {
+
 	/*
 	 * Before unmasking for the busy end IRQ, confirm that the
 	 * command was sent successfully. To keep track of having a
@@ -686,7 +692,7 @@ static bool ux500_busy_complete(struct mmci_host *host, u32 status, u32 err_msk)
 	 * it starts signaling busy on DAT0, hence re-read the
 	 * MMCISTATUS register here, to allow the busy bit to be set.
 	 */
-	if (host->busy_state == MMCI_BUSY_IDLE) {
+	case MMCI_BUSY_IDLE:
 		/*
 		 * Save the first status register read to be sure to catch
 		 * all bits that may be lost will retrying. If the command
@@ -713,8 +719,7 @@ static bool ux500_busy_complete(struct mmci_host *host, u32 status, u32 err_msk)
 		writel(readl(base + MMCIMASK0) &
 		       ~host->variant->busy_detect_mask, base + MMCIMASK0);
 		host->busy_state = MMCI_BUSY_DONE;
-		goto out_ret_state;
-	}
+		break;
 
 	/*
 	 * If there is a command in-progress that has been successfully
@@ -727,12 +732,11 @@ static bool ux500_busy_complete(struct mmci_host *host, u32 status, u32 err_msk)
 	 * both the start and the end interrupts needs to be cleared,
 	 * one after the other. So, clear the busy start IRQ here.
 	 */
-	if (host->busy_state == MMCI_BUSY_WAITING_FOR_IRQS) {
+	case MMCI_BUSY_WAITING_FOR_IRQS:
 		if (status & host->variant->busy_detect_flag) {
 			host->busy_status |= status & (MCI_CMDSENT | MCI_CMDRESPEND);
 			writel(host->variant->busy_detect_mask, base + MMCICLEAR);
 			host->busy_state = MMCI_BUSY_START_IRQ;
-			goto out_ret_state;
 		} else {
 			dev_dbg(mmc_dev(host->mmc),
 				"lost busy status when waiting for busy start IRQ\n");
@@ -741,16 +745,14 @@ static bool ux500_busy_complete(struct mmci_host *host, u32 status, u32 err_msk)
 			       ~host->variant->busy_detect_mask, base + MMCIMASK0);
 			host->busy_state = MMCI_BUSY_DONE;
 			host->busy_status = 0;
-			goto out_ret_state;
 		}
-	}
+		break;
 
-	if (host->busy_state == MMCI_BUSY_START_IRQ) {
+	case MMCI_BUSY_START_IRQ:
 		if (status & host->variant->busy_detect_flag) {
 			host->busy_status |= status & (MCI_CMDSENT | MCI_CMDRESPEND);
 			writel(host->variant->busy_detect_mask, base + MMCICLEAR);
 			host->busy_state = MMCI_BUSY_END_IRQ;
-			goto out_ret_state;
 		} else {
 			dev_dbg(mmc_dev(host->mmc),
 				"lost busy status when waiting for busy end IRQ\n");
@@ -759,9 +761,8 @@ static bool ux500_busy_complete(struct mmci_host *host, u32 status, u32 err_msk)
 			       ~host->variant->busy_detect_mask, base + MMCIMASK0);
 			host->busy_state = MMCI_BUSY_DONE;
 			host->busy_status = 0;
-			goto out_ret_state;
 		}
-	}
+		break;
 
 	/*
 	 * If there is a command in-progress that has been successfully
@@ -769,11 +770,10 @@ static bool ux500_busy_complete(struct mmci_host *host, u32 status, u32 err_msk)
 	 * the busy end IRQ. Clear and mask the IRQ, then continue to
 	 * process the command.
 	 */
-	if (host->busy_state == MMCI_BUSY_END_IRQ) {
+	case MMCI_BUSY_END_IRQ:
 		if (status & host->variant->busy_detect_flag) {
 			/* We should just get two IRQs for busy detect */
 			dev_err(mmc_dev(host->mmc), "spurious busy detect IRQ\n");
-			goto out_ret_state;
 		}
 
 		writel(host->variant->busy_detect_mask, base + MMCICLEAR);
@@ -782,9 +782,15 @@ static bool ux500_busy_complete(struct mmci_host *host, u32 status, u32 err_msk)
 
 		host->busy_state = MMCI_BUSY_DONE;
 		host->busy_status = 0;
-	} else {
+		break;
+
+	case MMCI_BUSY_DONE:
+		break;
+
+	default:
 		dev_dbg(mmc_dev(host->mmc), "fell through on state %d\n",
 			host->busy_state);
+		break;
 	}
 
 out_ret_state:

-- 
2.39.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
