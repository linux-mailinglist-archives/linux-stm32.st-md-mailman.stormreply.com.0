Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A14026D74B7
	for <lists+linux-stm32@lfdr.de>; Wed,  5 Apr 2023 08:50:46 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6D809C6A614;
	Wed,  5 Apr 2023 06:50:46 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E229FC6A606
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  5 Apr 2023 06:50:44 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id x17so45372359lfu.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 04 Apr 2023 23:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680677444;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=CZrJBp7bxoAmhQOHIoV/FMgL+sx0Mt/COQx900KM35s=;
 b=D835TBlnPHXFapIYypyvesZyxDll44ncpPJGjZwsseIA5xWhnue7u2ULafh1Mgvlyl
 YjOJnM9b1HvRutgUyTLMGE9WGf6JrOU5dCfzBHzSR9Xe9WsLTG3P0nk32KZLeApRbArW
 1aTojXFiLyOZCOrmdOWZ8Obte3mGx9cOW+LFjTie0AJ7BkkteCuMtcrbwogRUbV492yD
 I0qerXkzk2jh31o7/Nblf4zTN2ZfqNrPnAu8LPYXmQAM6ryqEwQfXThVxA1ToSpqiKtA
 8PtVjFrfVLTf6xoCgJ3R/pKXWYQgACPT4TkZStnVJRUDf/DnbGV8LKHsQ32rl+0cGHTQ
 jF9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680677444;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CZrJBp7bxoAmhQOHIoV/FMgL+sx0Mt/COQx900KM35s=;
 b=Dyn7yhVoRFZeXKMPIXC7jV9q5K+rexi6AqL6iQx1JEnXoDJLBLSh3teHrb7vQrVXfC
 OS+G9QbLbS+AbOmOm7CAkEcaJ9md/unmJQwffivWdtqQTmOhPogVdSliYF7IzOjSvVZW
 VZWQSmmATiRtfCQ/pcI6GESYYMNRXCxpn5Ab8cWRRquTfIuBg27iZTczSdP/k5Ol+dar
 HahTtuso+h3JBjmsQGekIqfFW4vJfE3EBbVQLNDXsd/sZadCjA137lbhWkaqzuDmT0y2
 MWINS2CM2X0FBvvkFHPQcGkPvr7aFyIixZMuCnj5rZySiMQ0xSjhHwqUI/MdqwsV26zx
 itNw==
X-Gm-Message-State: AAQBX9exHoC8qL9v4EJB9a+N83b/zBegPypEZPnTxTKI14ellHhWavS6
 jVUosxBLfyOdGbEWioXbVMJUgbL1iLQ4wbcUSA4=
X-Google-Smtp-Source: AKy350Zfmmhvue8OWU2JCIJTabcCiWBx+GsA92bBBeT4onZu0NRIuw9PoqPJ9+MUp9fIf0TV7V/lsw==
X-Received: by 2002:a19:750b:0:b0:4dc:82b0:4c68 with SMTP id
 y11-20020a19750b000000b004dc82b04c68mr1159856lfe.50.1680677444364; 
 Tue, 04 Apr 2023 23:50:44 -0700 (PDT)
Received: from [192.168.1.2] (c-05d8225c.014-348-6c756e10.bbcust.telenor.se.
 [92.34.216.5]) by smtp.gmail.com with ESMTPSA id
 z19-20020ac25df3000000b004eb274b3a43sm2683086lfq.134.2023.04.04.23.50.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Apr 2023 23:50:43 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 05 Apr 2023 08:50:38 +0200
MIME-Version: 1.0
Message-Id: <20230405-pl180-busydetect-fix-v1-12-28ac19a74e5e@linaro.org>
References: <20230405-pl180-busydetect-fix-v1-0-28ac19a74e5e@linaro.org>
In-Reply-To: <20230405-pl180-busydetect-fix-v1-0-28ac19a74e5e@linaro.org>
To: Stefan Hansson <newbyte@disroot.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.12.0
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-mmc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 12/13] mmc: mmci: Drop end IRQ from Ux500
	busydetect
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

The Ux500 has these state transition edges:

IDLE -> WAITING_FOR_IRQS -> START_IRQ -> DONE

The first IRQ move us from WAITING_FOR_IRQS to START_IRQ
and the second IRQ moves us from START_IRQ to DONE.

This didn't come out until after all refactoring.

For STM32 we keep the END_IRQ state around, because that
is indeed what we are waiting for in that case.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/mmc/host/mmci.c | 16 +---------------
 1 file changed, 1 insertion(+), 15 deletions(-)

diff --git a/drivers/mmc/host/mmci.c b/drivers/mmc/host/mmci.c
index 2779d4985b63..a4c9a3a9b037 100644
--- a/drivers/mmc/host/mmci.c
+++ b/drivers/mmc/host/mmci.c
@@ -753,7 +753,7 @@ static bool ux500_busy_complete(struct mmci_host *host, u32 status, u32 err_msk)
 		if (status & host->variant->busy_detect_flag) {
 			host->busy_status |= status & (MCI_CMDSENT | MCI_CMDRESPEND);
 			writel(host->variant->busy_detect_mask, base + MMCICLEAR);
-			host->busy_state = MMCI_BUSY_END_IRQ;
+			ux500_busy_clear_mask_done(host);
 		} else {
 			dev_dbg(mmc_dev(host->mmc),
 				"lost busy status when waiting for busy end IRQ\n");
@@ -761,20 +761,6 @@ static bool ux500_busy_complete(struct mmci_host *host, u32 status, u32 err_msk)
 		}
 		break;
 
-	/*
-	 * If there is a command in-progress that has been successfully
-	 * sent and the busy bit isn't set, it means we have received
-	 * the busy end IRQ. Clear and mask the IRQ, then continue to
-	 * process the command.
-	 */
-	case MMCI_BUSY_END_IRQ:
-		if (status & host->variant->busy_detect_flag) {
-			/* We should just get two IRQs for busy detect */
-			dev_err(mmc_dev(host->mmc), "spurious busy detect IRQ\n");
-		}
-		ux500_busy_clear_mask_done(host);
-		break;
-
 	case MMCI_BUSY_DONE:
 		break;
 

-- 
2.39.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
