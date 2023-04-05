Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 75DE06D74B2
	for <lists+linux-stm32@lfdr.de>; Wed,  5 Apr 2023 08:50:43 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 31AEEC6A606;
	Wed,  5 Apr 2023 06:50:43 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 34BF7C6A610
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  5 Apr 2023 06:50:42 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id q16so45303950lfe.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 04 Apr 2023 23:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680677441;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=L/SmBW/GkWFXqDOQZgjdK6e878vcBSCxZ/ZaM+lu/CM=;
 b=CXUCGJB4hYnoAKHMAECayVXuAgAvyVtfc23qS+2hMtlWTROX2TKQJqETvCTUjeSa3s
 lCo+VCUDw+LlxqKqtPHddrVfeLPSbE5EIuGaH8YsglzkAOLVyjbOsoFrQnez/egAI3GX
 1+nujNi5QGVuqlEL9VwCUYtria6NBbyzd7efucK6nm9A9A5jm4hfcgRvMkLFtE/aJVMt
 JpDgxt10H2d8buIX2x8L6uWzJwQRYzMIYwMEYoIok1w4x+Np87IbGyBnAKPtZaRD3rmb
 y4D1r5x8NPkMOXhnYNQbymTwA7Z2lHQXTiZymdR1KPHWam0lxRKZ64Q++zYP/SUj63Ca
 dXIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680677441;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=L/SmBW/GkWFXqDOQZgjdK6e878vcBSCxZ/ZaM+lu/CM=;
 b=lMDrmKbGjH56MOjYkVx0ZPn7uF7O6H/ZqQfDh6mJALQl+1oWDISWwCSQnluk8skWLw
 ULRL0bUCsAb4wGZByZvEeLvM1N5gCCYXJuRlUpUMRq3kx4oDgg4y+RyvvM1X9RAYrdz2
 exxZbTIhJE/Ltd38xkpuQxZthON8x+Iczz2zVi8Lgw22HPngBaUca4zyDFwlKpUOfULB
 +zCShW6dUQetva6/9l3l8XHpqhJHNbj+4y2sYA/RZKnjoxixW2guXqHfqQxqXNRdNahK
 antc5QxYZcycPGIPbWU/TmnO9JCv+3la3HpQvn1G+92gYLakH/oPd929VuPrl9K6+Y7k
 tKIA==
X-Gm-Message-State: AAQBX9ef6BTCaqH2udWnqdeQxHBVNsv0uau1AA+k8IlFaQfPVfk4tm5D
 E+nqL+JZegsh6jYb99Vv4gH74Q==
X-Google-Smtp-Source: AKy350a3RuFZiKyjRYefevxxRtGIx0ndWexlaTbianqmBPW+3FVCUBdrLSmoVGHHODX/1i06RCnk+g==
X-Received: by 2002:ac2:42d7:0:b0:4bb:9415:38a2 with SMTP id
 n23-20020ac242d7000000b004bb941538a2mr1154549lfl.51.1680677441634; 
 Tue, 04 Apr 2023 23:50:41 -0700 (PDT)
Received: from [192.168.1.2] (c-05d8225c.014-348-6c756e10.bbcust.telenor.se.
 [92.34.216.5]) by smtp.gmail.com with ESMTPSA id
 z19-20020ac25df3000000b004eb274b3a43sm2683086lfq.134.2023.04.04.23.50.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Apr 2023 23:50:41 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 05 Apr 2023 08:50:35 +0200
MIME-Version: 1.0
Message-Id: <20230405-pl180-busydetect-fix-v1-9-28ac19a74e5e@linaro.org>
References: <20230405-pl180-busydetect-fix-v1-0-28ac19a74e5e@linaro.org>
In-Reply-To: <20230405-pl180-busydetect-fix-v1-0-28ac19a74e5e@linaro.org>
To: Stefan Hansson <newbyte@disroot.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.12.0
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-mmc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 09/13] mmc: mmci: Use a switch statement
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
 drivers/mmc/host/mmci.c | 34 ++++++++++++++++++++--------------
 1 file changed, 20 insertions(+), 14 deletions(-)

diff --git a/drivers/mmc/host/mmci.c b/drivers/mmc/host/mmci.c
index 734e8364b2f6..626467c212d6 100644
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
 		host->busy_status = status & (MCI_CMDSENT | MCI_CMDRESPEND);
 		while (retries) {
 			status = readl(base + MMCISTATUS);
@@ -706,8 +712,7 @@ static bool ux500_busy_complete(struct mmci_host *host, u32 status, u32 err_msk)
 		writel(readl(base + MMCIMASK0) &
 		       ~host->variant->busy_detect_mask, base + MMCIMASK0);
 		host->busy_state = MMCI_BUSY_DONE;
-		goto out_ret_state;
-	}
+		break;
 
 	/*
 	 * If there is a command in-progress that has been successfully
@@ -720,12 +725,11 @@ static bool ux500_busy_complete(struct mmci_host *host, u32 status, u32 err_msk)
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
@@ -734,16 +738,14 @@ static bool ux500_busy_complete(struct mmci_host *host, u32 status, u32 err_msk)
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
@@ -752,9 +754,8 @@ static bool ux500_busy_complete(struct mmci_host *host, u32 status, u32 err_msk)
 			       ~host->variant->busy_detect_mask, base + MMCIMASK0);
 			host->busy_state = MMCI_BUSY_DONE;
 			host->busy_status = 0;
-			goto out_ret_state;
 		}
-	}
+		break;
 
 	/*
 	 * If there is a command in-progress that has been successfully
@@ -762,11 +763,10 @@ static bool ux500_busy_complete(struct mmci_host *host, u32 status, u32 err_msk)
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
@@ -775,9 +775,15 @@ static bool ux500_busy_complete(struct mmci_host *host, u32 status, u32 err_msk)
 
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
