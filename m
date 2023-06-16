Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CCC117329CB
	for <lists+linux-stm32@lfdr.de>; Fri, 16 Jun 2023 10:30:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 929A4C6B457;
	Fri, 16 Jun 2023 08:30:41 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 98E81C6B45B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 16 Jun 2023 08:30:39 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-4f74cda5f1dso486372e87.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 16 Jun 2023 01:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686904239; x=1689496239;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Uv8R+uMF6WnTLu76PBd8GfNWo7ysNcJe7YfGwPaXEWU=;
 b=QoYP48KAf3RwPJaEbejINyEVXQe7cKnpoIbr3A/hnMCCMoYsiPPzr34sjjP0neYCwH
 yztC+OkJcv7XglNtZ3vuKiPF4UgP8lDqbkbXK4ZXJPfp8QobefMk88MHkDnYJ+kfhULA
 SildRRCvlMmq57C/kKm5soyFYzcy8M6kBIe5AO0JOZo0+JHncK+y0Y2l7qr3Cd+cfyEg
 cJdWwxPxeqMiee1sK7nX1Dte8f7s+cF2zLr9uCDTVQRpquRBiUJ72/1czfr7Qenjylhs
 ommaDHYiNQRb/GBQ4m2llhGrveYQJebrKctJcgQAr1TJsNBvW1HN536U81CvPH9D0FSr
 mBDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686904239; x=1689496239;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Uv8R+uMF6WnTLu76PBd8GfNWo7ysNcJe7YfGwPaXEWU=;
 b=hQ4NP9eEZ3z5e4+Jdqy9P29l9Wvwb4/tLNr8NbtEmlLTqpoaPNj5RwAF2oFlOZZMpV
 zrQV5B0okCT3eVmhGqapwgZjp+RKFNw2nDI+MKGhQwle+XSrvnhdfXG7iGQ5ifPJ+V8d
 mtA54/jcMR7cAnoF+89nvo9xvIQ5PcZ5mMPqVWnzMBrJp/twodm4jeablRiwkG1AjR3/
 QsYtgg8GgtZO+AN4GaRZvVCF3kPxowJhFrfuPd6ltyIYFPI5fLg5KnkIPfOC9o3Y3cRy
 9l4hzyTweARJnNgZuQC3QM+5AS1GZj22ghmMJcxm6thUGm2NCEm/iat+SgiKuLymOO74
 Xs8A==
X-Gm-Message-State: AC+VfDyZniQuCiwz65ucmUUcdq7rMPnTdzDnyjnH59yyYNKusKWprLSW
 kuB/KTTxIQgphuRT28IGgLfZ0w==
X-Google-Smtp-Source: ACHHUZ5WHQjxkZY8dwst0quP+F94G7KA9eK2YAo0+wbrOxLBa2XdWWcG+cXXHZRKkCqcPoOzO+fZXg==
X-Received: by 2002:a19:4f1c:0:b0:4f7:6454:655d with SMTP id
 d28-20020a194f1c000000b004f76454655dmr690211lfb.0.1686904239036; 
 Fri, 16 Jun 2023 01:30:39 -0700 (PDT)
Received: from [192.168.1.2] (c-05d8225c.014-348-6c756e10.bbcust.telenor.se.
 [92.34.216.5]) by smtp.gmail.com with ESMTPSA id
 j8-20020ac25508000000b004eb44c2ab6bsm2918106lfk.294.2023.06.16.01.30.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Jun 2023 01:30:38 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 16 Jun 2023 10:30:36 +0200
MIME-Version: 1.0
Message-Id: <20230405-pl180-busydetect-fix-v6-4-b850ec8019f3@linaro.org>
References: <20230405-pl180-busydetect-fix-v6-0-b850ec8019f3@linaro.org>
In-Reply-To: <20230405-pl180-busydetect-fix-v6-0-b850ec8019f3@linaro.org>
To: Yann Gautier <yann.gautier@foss.st.com>, 
 Stefan Hansson <newbyte@disroot.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.12.2
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-mmc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v6 4/9] mmc: mmci: Break out error check in
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
ChangeLog v4->v6:
- No changes.
ChangeLog v3->v4:
- No changes.
ChangeLog v2->v3:
- Rebased.
ChangeLog v1->v2:
- No changes
---
 drivers/mmc/host/mmci.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/mmc/host/mmci.c b/drivers/mmc/host/mmci.c
index 47b306e45f78..d632658d9d20 100644
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
2.40.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
