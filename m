Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 39E2D6D74AE
	for <lists+linux-stm32@lfdr.de>; Wed,  5 Apr 2023 08:50:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F41E6C6A616;
	Wed,  5 Apr 2023 06:50:40 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7AF51C6A610
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  5 Apr 2023 06:50:40 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id k37so45379280lfv.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 04 Apr 2023 23:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680677440;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=h7+5pU+r96Qz2w0wNTiDpH3eRUOcskPk55XY3zWiSmk=;
 b=zgWbUgX/XfiSWni75W9Bj0RZ1KnO1TF7F0GaVsByzr2hWpatcrvkwvEY9UQD3VKBuE
 1q0xiP3XRDRrEmuHfNtCITo+UFbTrxvQISanWWfFooW7rA56xHFsfNlJmo58pwU4zWyz
 1SPMxoD1RgrXN3+8OZaX1ZSgu/KjL+oiyRuaXkWZLbGhrbHYdpQI+k5eC497CJ2Hashr
 +LgFfHHaGUY8lBoZUKeRv20slfoKQak3McmU52ROLAhoJlfe9dNWyztgLPIxzTDkPFAK
 PItfnSfCC3EhAdgIh8Dw0sL3FqRP5fuYJmbLKJWdo5AMordUGt+bOenQlbCi5s7MhAbA
 Vfig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680677440;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=h7+5pU+r96Qz2w0wNTiDpH3eRUOcskPk55XY3zWiSmk=;
 b=zJ/oXuo0mo6iq9Xf4k0NLgU2OuRKKhT8odevgU2rdud0jTDXClGo5VsDYEbhcfObDx
 okKr/RceSs/K/c91U2SGaLNC/g6FEYh4K49la02zPe52u23WSDqgD5aiCIOMoXY0UErn
 W8aFutdlKq6G2uf7iR27YqaDM949EPIDCE/gFeXJPj/Qa2R9YpFXdQfwiqkcyyxxg+0z
 bIZR2XGCLVJya+yqQEMqrwA7Nmq+xTNMKwCH5fK9Fezfj7G87Ors9COSHaRhhZXiGO3G
 F+oz/TLJFx9bIipX28oVidnJTzbxV9VveIy1bkqJz/R2NMfvfemCgV19AyFDD2v9Q0HH
 Nfjw==
X-Gm-Message-State: AAQBX9cRb+q66R93BscbkDMGXZ8+niK6/Yx5GcdLH7uDG3mj1bprmQXb
 Maa83fEveQS1ZMX4MvoR+s4KSQ==
X-Google-Smtp-Source: AKy350Y9Ih333G9FNO5tvFGMZKM2N4TIypLFGpKiUu5kNp4TOyhAj5kFHyeL59gAQNbpRzZR1MD6aw==
X-Received: by 2002:a19:7506:0:b0:4e8:5392:492c with SMTP id
 y6-20020a197506000000b004e85392492cmr1275150lfe.43.1680677439946; 
 Tue, 04 Apr 2023 23:50:39 -0700 (PDT)
Received: from [192.168.1.2] (c-05d8225c.014-348-6c756e10.bbcust.telenor.se.
 [92.34.216.5]) by smtp.gmail.com with ESMTPSA id
 z19-20020ac25df3000000b004eb274b3a43sm2683086lfq.134.2023.04.04.23.50.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Apr 2023 23:50:39 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 05 Apr 2023 08:50:33 +0200
MIME-Version: 1.0
Message-Id: <20230405-pl180-busydetect-fix-v1-7-28ac19a74e5e@linaro.org>
References: <20230405-pl180-busydetect-fix-v1-0-28ac19a74e5e@linaro.org>
In-Reply-To: <20230405-pl180-busydetect-fix-v1-0-28ac19a74e5e@linaro.org>
To: Stefan Hansson <newbyte@disroot.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.12.0
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-mmc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 07/13] mmc: mmci: Retry the busy start
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
implementit to be certain that we can catch this glitch
if it happens.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/mmc/host/mmci.c | 32 ++++++++++++++++++++------------
 1 file changed, 20 insertions(+), 12 deletions(-)

diff --git a/drivers/mmc/host/mmci.c b/drivers/mmc/host/mmci.c
index c14a7732386e..670b1622d282 100644
--- a/drivers/mmc/host/mmci.c
+++ b/drivers/mmc/host/mmci.c
@@ -664,6 +664,7 @@ static u32 ux500v2_get_dctrl_cfg(struct mmci_host *host)
 static bool ux500_busy_complete(struct mmci_host *host, u32 status, u32 err_msk)
 {
 	void __iomem *base = host->base;
+	int retries = 10;
 
 	if (status & err_msk) {
 		/* Stop any ongoing busy detection if an error occurs */
@@ -684,22 +685,29 @@ static bool ux500_busy_complete(struct mmci_host *host, u32 status, u32 err_msk)
 	 * Note that, the card may need a couple of clock cycles before
 	 * it starts signaling busy on DAT0, hence re-read the
 	 * MMCISTATUS register here, to allow the busy bit to be set.
-	 * Potentially we may even need to poll the register for a
-	 * while, to allow it to be set, but tests indicates that it
-	 * isn't needed.
 	 */
 	if (host->busy_state == MMCI_BUSY_IDLE) {
 		host->busy_status = status & (MCI_CMDSENT | MCI_CMDRESPEND);
-		status = readl(base + MMCISTATUS);
-		if (status & host->variant->busy_detect_flag) {
-			writel(readl(base + MMCIMASK0) |
-			       host->variant->busy_detect_mask,
-			       base + MMCIMASK0);
-
-			host->busy_status |= status & (MCI_CMDSENT | MCI_CMDRESPEND);
-			host->busy_state = MMCI_BUSY_WAITING_FOR_IRQS;
-			return false;
+		while (retries) {
+			status = readl(base + MMCISTATUS);
+			if (status & host->variant->busy_detect_flag) {
+				writel(readl(base + MMCIMASK0) |
+				       host->variant->busy_detect_mask,
+				       base + MMCIMASK0);
+
+				host->busy_status |= status & (MCI_CMDSENT | MCI_CMDRESPEND);
+				host->busy_state = MMCI_BUSY_WAITING_FOR_IRQS;
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
2.39.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
