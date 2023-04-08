Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 42C206DBD7B
	for <lists+linux-stm32@lfdr.de>; Sun,  9 Apr 2023 00:00:56 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BACD3C6B460;
	Sat,  8 Apr 2023 22:00:45 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AEADEC6B44F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  8 Apr 2023 22:00:44 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id m4so2112288lfj.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 08 Apr 2023 15:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680991244;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=pkQYbCEjQjRXzRX/K8hF+kF32jmLe8MMLCT5UxEXp3k=;
 b=dN4Sif9FwK2AKgY9RtwUQyZSenp59SlULTS32GEgCCPwGhdP9zo9mT5vL+4GKpGjBg
 F5u2H50Hht1eZT4cFxy9a9KG/tnEL6ZgF+onkvvU/QPp1ohh+vhJPR2ZzsViuR9egCD/
 oM/boKwODw3hkVDxxR5jTqYTZFsXvLMFoW2ETfZFtrM+Y67641QUGXuX+gJYSUDqo9Au
 F9SbyW2mzPW8WRR6eUwyBEdNyX+ZvteZpEgo+kcAo8DZu5mQFU1o0xEypi1stuUoCUKf
 7oodWVX16V125nMJ94Ff8ievHleQ7ronScCTNnjw6bXVVak+MyLmSB1pBZlA0djDYi82
 2dyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680991244;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pkQYbCEjQjRXzRX/K8hF+kF32jmLe8MMLCT5UxEXp3k=;
 b=XNmWrauCq7kXeG4v9cjIwvYhDm74YOfT4N5+VuL8EPCBkGSe4hL5WXgVPyLJqGI9Oa
 A6YPrpReoDtJFrItStWetZ5H6SJdrQuYHI8qaeDj973Akkz5CMm7V/Iar34HeUSNksgq
 VCZm2D204zk2iOMKs2VTPIlilBzBtOrW099y4gRMpP1JqIh/YxGhHdxk+kTRTHbQYiqR
 OkOSuFqJLq9uE8H+rEC4L2negfw7VM5DHaPvR8gvejf5y35esbhEieA4L4kzSwIn0+Qy
 LXp+8XOFxpG4xui/0zbu3KzIZz/M2GDrAiviDhyAfBNDK4CS1cVyQdvuJ4RXpdYSbtUL
 oTCQ==
X-Gm-Message-State: AAQBX9d3B8wmGpVPIN6HpqBgXJugkLzZPlNG4ogZB/atiKc5feVgaq1B
 wZdtrQTbcHmtyB76Fa1I06PsTw==
X-Google-Smtp-Source: AKy350ZQGnM+k/Wd37miZZuhFoTdrColl3OzRBE7aZn2aD+nmoCN3Te3icSUTua7vrHaBYUy9BZjSg==
X-Received: by 2002:ac2:43c3:0:b0:4dc:4b92:dbc4 with SMTP id
 u3-20020ac243c3000000b004dc4b92dbc4mr1301602lfl.14.1680991244466; 
 Sat, 08 Apr 2023 15:00:44 -0700 (PDT)
Received: from [192.168.1.2] (c-05d8225c.014-348-6c756e10.bbcust.telenor.se.
 [92.34.216.5]) by smtp.gmail.com with ESMTPSA id
 v9-20020a056512048900b004e9cad1cd7csm1328904lfq.229.2023.04.08.15.00.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Apr 2023 15:00:44 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 09 Apr 2023 00:00:32 +0200
MIME-Version: 1.0
Message-Id: <20230405-pl180-busydetect-fix-v2-11-eeb10323b546@linaro.org>
References: <20230405-pl180-busydetect-fix-v2-0-eeb10323b546@linaro.org>
In-Reply-To: <20230405-pl180-busydetect-fix-v2-0-eeb10323b546@linaro.org>
To: Yann Gautier <yann.gautier@foss.st.com>, 
 Stefan Hansson <newbyte@disroot.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.12.0
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-mmc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v2 11/12] mmc: mmci: Drop end IRQ from Ux500
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
ChangeLog v1->v2:
- No changes
---
 drivers/mmc/host/mmci.c | 16 +---------------
 1 file changed, 1 insertion(+), 15 deletions(-)

diff --git a/drivers/mmc/host/mmci.c b/drivers/mmc/host/mmci.c
index 180a7b719347..17233702e7fb 100644
--- a/drivers/mmc/host/mmci.c
+++ b/drivers/mmc/host/mmci.c
@@ -758,7 +758,7 @@ static bool ux500_busy_complete(struct mmci_host *host, u32 status, u32 err_msk)
 		if (status & host->variant->busy_detect_flag) {
 			host->busy_status |= status & (MCI_CMDSENT | MCI_CMDRESPEND);
 			writel(host->variant->busy_detect_mask, base + MMCICLEAR);
-			host->busy_state = MMCI_BUSY_END_IRQ;
+			ux500_busy_clear_mask_done(host);
 		} else {
 			dev_dbg(mmc_dev(host->mmc),
 				"lost busy status when waiting for busy end IRQ\n");
@@ -766,20 +766,6 @@ static bool ux500_busy_complete(struct mmci_host *host, u32 status, u32 err_msk)
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
