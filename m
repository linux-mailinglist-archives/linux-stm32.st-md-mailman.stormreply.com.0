Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C254672ED02
	for <lists+linux-stm32@lfdr.de>; Tue, 13 Jun 2023 22:34:32 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8A972C6B459;
	Tue, 13 Jun 2023 20:34:32 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A5620C6B454
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Jun 2023 20:34:29 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-4f611ac39c5so7788953e87.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Jun 2023 13:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686688469; x=1689280469;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Y2Xs3XgGJttCT2952b8M8V6pJJgNj+V+JW7LJwfPkUM=;
 b=YZZUMljVoLCRehekqNwUr42thbxpLbBIH/2jnNJqY5Y7DE0SwxpGZACVeYsMb8oqOV
 lQsLn4YYLs2fEREGsIw0gUkUMwxAenDkeFX4PGlNSCA4n4y6x8hiJ8Y+jP/KxH1lE6fX
 wa591VIA/MtLG9q3olyAeD4ZxMCROoMKrH8MCUdSAU0vByfD3FO74QMSQ+PCkNih26bq
 7bR1ThZ5hJdF6gkb3Q6HL4kH1NCwg+yW60pW7PKoGVWSAzGvNu6aAkQsCxMBTVQkQLeT
 z4J0Xshd9xMPVuJZi2O26CMTArz0PI709LYWoU8qqPIuGHBEZ14c3fGb3KTT0oDWutVK
 LONQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686688469; x=1689280469;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Y2Xs3XgGJttCT2952b8M8V6pJJgNj+V+JW7LJwfPkUM=;
 b=SBJ+wU30ZrwRXpjV5hx9QwJAgibDDgpA0JcOZK/2wjD2m+1dPUDikuxiCROKmWjpqG
 8b5JLl3ByUShoVW1gKI9TMUWjo3VdxgVlx1J3QGcMvDv9euwfzqnDMDUVLCOzF7+I6wg
 XIpRHdgk2/9H5B5bajtWSINwxH/g+NgL7bvVhPznL7h5M2HiVMFn09nDNanCg3TEExZ1
 8OfX6ScQ2OIbCHQR2GJ1U5snAJAzYPL8g5ERBp6yDnfMIrp6IwK+tn0+WsAJ5EwVbka2
 EQiQVHx3ZHHBZ/sFH7tvI2TcI+/rz4llv1VRkasPyxEnOyRLiKbnQ/43UjrzgmmRTa/4
 iFaQ==
X-Gm-Message-State: AC+VfDwW4CeWjhRYLpZWa8+pAtsDr6NLIpAx6YqKoMHydGnlJgqouIVE
 +dYDBC6M88JfnUYWfvVZxkRDdQ==
X-Google-Smtp-Source: ACHHUZ6fZm7YQd7MlaNDN8uljS3Hdj3RBXwGZEnl6OMQ0T50GRRu2flWt5GAGuE0HYaEU9gJ6Q7y9Q==
X-Received: by 2002:a19:8c0d:0:b0:4f4:c973:c97f with SMTP id
 o13-20020a198c0d000000b004f4c973c97fmr5921646lfd.49.1686688469107; 
 Tue, 13 Jun 2023 13:34:29 -0700 (PDT)
Received: from [192.168.1.2] (c-05d8225c.014-348-6c756e10.bbcust.telenor.se.
 [92.34.216.5]) by smtp.gmail.com with ESMTPSA id
 l12-20020a19c20c000000b004f26f699e9dsm1897813lfc.184.2023.06.13.13.34.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jun 2023 13:34:28 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 13 Jun 2023 22:34:20 +0200
MIME-Version: 1.0
Message-Id: <20230405-pl180-busydetect-fix-v4-4-df9c8c504353@linaro.org>
References: <20230405-pl180-busydetect-fix-v4-0-df9c8c504353@linaro.org>
In-Reply-To: <20230405-pl180-busydetect-fix-v4-0-df9c8c504353@linaro.org>
To: Yann Gautier <yann.gautier@foss.st.com>, 
 Stefan Hansson <newbyte@disroot.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.12.2
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-mmc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v4 04/10] mmc: mmci: Break out error check in
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
