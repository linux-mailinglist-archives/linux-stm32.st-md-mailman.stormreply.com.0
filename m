Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 20E8F72ED0A
	for <lists+linux-stm32@lfdr.de>; Tue, 13 Jun 2023 22:34:35 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D66C9C6B459;
	Tue, 13 Jun 2023 20:34:34 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 975A3C6B456
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Jun 2023 20:34:33 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-4f624daccd1so7144485e87.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Jun 2023 13:34:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686688473; x=1689280473;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=JE66c0ktyvQx6kWI5NItLAz064PDkHXvXmuP+9scr2c=;
 b=bxsgHbO44p214U+802iMIXHWym+XLhFjEkkLg7UGgTF1wcSkxCPGWMvoweXCkMQ6bl
 xD7caYOksWThGvMKGZ7VTM5z+1VD/aJzuRD0PIafxoUPPlbVhaNQ3GLkEENin+bMtH5L
 +/wqnumydUKsk9iJ+hm0prpnv1vzIWoNEsT4KwKDu7vP7jHgTzoxwwgJTMi9HgTN31iI
 SFT+j1Pb5wkVNARLBTTOZbE1ChcqiA33bj5admkhDnLeh+4n+XQY+Phqji0LtD3QgeOX
 eZcnN/WJbwMlA5wzercPLKZgOx8kqoD/X/iTV04xUuA+TFvNB9nbVFuURcgqcYn+FNp0
 RWEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686688473; x=1689280473;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JE66c0ktyvQx6kWI5NItLAz064PDkHXvXmuP+9scr2c=;
 b=djiszZAsx4wYVLrNLd9wj35OmPjn56giY4dBwdsFD2nxuUVRETGiMfCLauILL4kciq
 pkHyi4/3J+ZBn+tTGJ3CRB8pBxiIR/WntGggHr2tPU4EmvxtqIDDGcyaO5h7egEXaFyI
 xBgw4c/pGbHKprKUfA0oBv5qQLT1RujTayPHXWAx9wfLqBKUqaVV5k6HAmMk06xTGR/k
 fpAAkGGpP9o1A7leUW7e8e6xPnWBHGPvJvF0SHRdWVCeOEvBsySBYaAxo/Ba0WyGI5NG
 W3RJIKTBUVS1F9qYwkVJQcZ9xEPCRw0DYRSAEdzPbgXsobAgoZYmuOf4QxUtlYH+8gxC
 AIbg==
X-Gm-Message-State: AC+VfDyVcyKFv3tS0veK6T4vSrfsECmenSnuxESScz0LLasOI+0pu4s6
 Jso0XegtEDSZFuhBI4fOKdBzeg==
X-Google-Smtp-Source: ACHHUZ4g5V/S4mNpuHFoty2XirnD9QeYi5zuSZOi4dtpWJjMEcYhCAOj4HaKbTiQ2OLH0thHxm4yPg==
X-Received: by 2002:a19:2d17:0:b0:4ef:f1f4:14db with SMTP id
 k23-20020a192d17000000b004eff1f414dbmr6092205lfj.16.1686688473049; 
 Tue, 13 Jun 2023 13:34:33 -0700 (PDT)
Received: from [192.168.1.2] (c-05d8225c.014-348-6c756e10.bbcust.telenor.se.
 [92.34.216.5]) by smtp.gmail.com with ESMTPSA id
 l12-20020a19c20c000000b004f26f699e9dsm1897813lfc.184.2023.06.13.13.34.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jun 2023 13:34:32 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 13 Jun 2023 22:34:24 +0200
MIME-Version: 1.0
Message-Id: <20230405-pl180-busydetect-fix-v4-8-df9c8c504353@linaro.org>
References: <20230405-pl180-busydetect-fix-v4-0-df9c8c504353@linaro.org>
In-Reply-To: <20230405-pl180-busydetect-fix-v4-0-df9c8c504353@linaro.org>
To: Yann Gautier <yann.gautier@foss.st.com>, 
 Stefan Hansson <newbyte@disroot.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.12.2
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-mmc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v4 08/10] mmc: mmci: Use a switch statement
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
ChangeLog v3->v4:
- No changes.
ChangeLog v2->v3:
- Rebased.
ChangeLog v1->v2:
- No changes
---
 drivers/mmc/host/mmci.c | 29 +++++++++++++++++------------
 1 file changed, 17 insertions(+), 12 deletions(-)

diff --git a/drivers/mmc/host/mmci.c b/drivers/mmc/host/mmci.c
index 48714e570116..cb766b8d419d 100644
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
-	if (host->busy_state == MMCI_BUSY_DONE) {
+	case MMCI_BUSY_DONE:
 		/*
 		 * Save the first status register read to be sure to catch
 		 * all bits that may be lost will retrying. If the command
@@ -712,8 +718,7 @@ static bool ux500_busy_complete(struct mmci_host *host, u32 status, u32 err_msk)
 		writel(readl(base + MMCIMASK0) &
 		       ~host->variant->busy_detect_mask, base + MMCIMASK0);
 		host->busy_state = MMCI_BUSY_DONE;
-		goto out_ret_state;
-	}
+		break;
 
 	/*
 	 * If there is a command in-progress that has been successfully
@@ -726,12 +731,11 @@ static bool ux500_busy_complete(struct mmci_host *host, u32 status, u32 err_msk)
 	 * both the start and the end interrupts needs to be cleared,
 	 * one after the other. So, clear the busy start IRQ here.
 	 */
-	if (host->busy_state == MMCI_BUSY_WAITING_FOR_START_IRQ) {
+	case MMCI_BUSY_WAITING_FOR_START_IRQ:
 		if (status & host->variant->busy_detect_flag) {
 			host->busy_status |= status & (MCI_CMDSENT | MCI_CMDRESPEND);
 			writel(host->variant->busy_detect_mask, base + MMCICLEAR);
 			host->busy_state = MMCI_BUSY_WAITING_FOR_END_IRQ;
-			goto out_ret_state;
 		} else {
 			dev_dbg(mmc_dev(host->mmc),
 				"lost busy status when waiting for busy start IRQ\n");
@@ -740,16 +744,14 @@ static bool ux500_busy_complete(struct mmci_host *host, u32 status, u32 err_msk)
 			       ~host->variant->busy_detect_mask, base + MMCIMASK0);
 			host->busy_state = MMCI_BUSY_DONE;
 			host->busy_status = 0;
-			goto out_ret_state;
 		}
-	}
+		break;
 
-	if (host->busy_state == MMCI_BUSY_WAITING_FOR_END_IRQ) {
+	case MMCI_BUSY_WAITING_FOR_END_IRQ:
 		if (status & host->variant->busy_detect_flag) {
 			host->busy_status |= status & (MCI_CMDSENT | MCI_CMDRESPEND);
 			writel(host->variant->busy_detect_mask, base + MMCICLEAR);
 			host->busy_state = MMCI_BUSY_DONE;
-			goto out_ret_state;
 		} else {
 			dev_dbg(mmc_dev(host->mmc),
 				"lost busy status when waiting for busy end IRQ\n");
@@ -758,11 +760,14 @@ static bool ux500_busy_complete(struct mmci_host *host, u32 status, u32 err_msk)
 			       ~host->variant->busy_detect_mask, base + MMCIMASK0);
 			host->busy_state = MMCI_BUSY_DONE;
 			host->busy_status = 0;
-			goto out_ret_state;
 		}
-	}
+		break;
 
-	return true;
+	default:
+		dev_dbg(mmc_dev(host->mmc), "fell through on state %d\n",
+			host->busy_state);
+		break;
+	}
 
 out_ret_state:
 	return (host->busy_state == MMCI_BUSY_DONE);

-- 
2.40.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
