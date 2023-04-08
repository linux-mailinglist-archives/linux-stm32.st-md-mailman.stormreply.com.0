Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 99E436DBD75
	for <lists+linux-stm32@lfdr.de>; Sun,  9 Apr 2023 00:00:39 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 54144C6B455;
	Sat,  8 Apr 2023 22:00:39 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7FA10C6B453
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  8 Apr 2023 22:00:38 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id z8so4100941lfb.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 08 Apr 2023 15:00:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680991238;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=YJsyZE/JIyPbZVqKw0X4sKoqKT/D+w7MAVDudQ5nzcs=;
 b=hOD1t4Lo/31LCyAASej5HsSHFq5ckS+258NNJXMKYW9d+QzQjQvV3aPXTRKouyskLY
 VQgG3wAecuPmi+67x0BD74KJ0vUgYxxH29VF7ThpXa+g+vmXeHjAhNkAGtqFZG0GRuQV
 UwVW1uOhmFGjW5ZVHN1cGa4ZJdqqEgtelsmjFswgrJGCVnCMop+9y098ldYJnRaWxiwP
 zm8Uht9BlE+UGtSRl3S0DCXkB91vd6hW3ygwn3Hlu6r4eO0wlKl4MQEJeTbjwz5IA8do
 OliUFw1NyV6fxIO7tj4kae7dQRTX47Pa+j1CagRASLmWAPRiZq2CueIXNHaNa4jJGo3M
 75Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680991238;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YJsyZE/JIyPbZVqKw0X4sKoqKT/D+w7MAVDudQ5nzcs=;
 b=KBM+u7YTmB6HbKrdM+uhqdl+kzjAG4xjRYQGMEH3mDUfRxNKf6wm/fCWyvYAdyQR/d
 V27B9acpcc6NN+/uK7vp+p4IEbwAtQmB8GW3OgZoOYrpuwJeZAV6z242HOeLYlnXd2CF
 C8uAC9L+79bdX7hhQDaaLCdnQPAm38Vf0lUNnGCEqAddufIGoFWQBn9VQTiu+1XT9QbZ
 iqqy0fF+uYfEsYOKb8m6KqsYFW5x1Y5HhqiFfgqMDSXgE+XLiFYD6/5LeV+3Ba3pyFJt
 GiaeE811kCKYyJp6Q/x93BELwgCcjHq9W9SVKBKgmeYTpt2VxgSuhf/2ZRjU9n6uOUJ4
 hDJg==
X-Gm-Message-State: AAQBX9d4hJyWGWUm61U+3CN1d7PQgAwRcMsGhCCNIGUGwf1KVd6p9Bbn
 Q8sAgsta9ZCMe64eRRD43Jwcig==
X-Google-Smtp-Source: AKy350andnvVy70t9th/ugLsnTSHw/vQxQcHGqsjcQA8CqI4Gx/+OfteSZvp1zDW482e39XJrjpTtg==
X-Received: by 2002:a05:6512:986:b0:4ea:f7af:7ee with SMTP id
 w6-20020a056512098600b004eaf7af07eemr1386157lft.45.1680991237948; 
 Sat, 08 Apr 2023 15:00:37 -0700 (PDT)
Received: from [192.168.1.2] (c-05d8225c.014-348-6c756e10.bbcust.telenor.se.
 [92.34.216.5]) by smtp.gmail.com with ESMTPSA id
 v9-20020a056512048900b004e9cad1cd7csm1328904lfq.229.2023.04.08.15.00.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Apr 2023 15:00:37 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 09 Apr 2023 00:00:25 +0200
MIME-Version: 1.0
Message-Id: <20230405-pl180-busydetect-fix-v2-4-eeb10323b546@linaro.org>
References: <20230405-pl180-busydetect-fix-v2-0-eeb10323b546@linaro.org>
In-Reply-To: <20230405-pl180-busydetect-fix-v2-0-eeb10323b546@linaro.org>
To: Yann Gautier <yann.gautier@foss.st.com>, 
 Stefan Hansson <newbyte@disroot.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.12.0
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-mmc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v2 04/12] mmc: mmci: Break out error check in
	busy detect
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

The busy detect callback for Ux500 checks for an error
in the status in the first if() clause. The only practical
reason is that if an error occurs, the if()-clause is not
executed, and the code falls through to the last
if()-clause if (host->busy_status) which will clear and
disable the irq. Make this explicit instead: it is easier
to read.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v1->v2:
- No changes
---
 drivers/mmc/host/mmci.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/mmc/host/mmci.c b/drivers/mmc/host/mmci.c
index e742dedaca1a..7d42625f2356 100644
--- a/drivers/mmc/host/mmci.c
+++ b/drivers/mmc/host/mmci.c
@@ -665,6 +665,15 @@ static bool ux500_busy_complete(struct mmci_host *host, u32 status, u32 err_msk)
 {
 	void __iomem *base = host->base;
 
+	if (status & err_msk) {
+		/* Stop any ongoing busy detection if an error occurs */
+		writel(host->variant->busy_detect_mask, base + MMCICLEAR);
+		writel(readl(base + MMCIMASK0) &
+		       ~host->variant->busy_detect_mask, base + MMCIMASK0);
+		host->busy_status = 0;
+		return true;
+	}
+
 	/*
 	 * Before unmasking for the busy end IRQ, confirm that the
 	 * command was sent successfully. To keep track of having a
@@ -678,7 +687,7 @@ static bool ux500_busy_complete(struct mmci_host *host, u32 status, u32 err_msk)
 	 * while, to allow it to be set, but tests indicates that it
 	 * isn't needed.
 	 */
-	if (!host->busy_status && !(status & err_msk)) {
+	if (!host->busy_status) {
 		status = readl(base + MMCISTATUS);
 		if (status & host->variant->busy_detect_flag) {
 			writel(readl(base + MMCIMASK0) |

-- 
2.39.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
