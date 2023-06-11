Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 34B8172B3C0
	for <lists+linux-stm32@lfdr.de>; Sun, 11 Jun 2023 21:41:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E8E64C6A61E;
	Sun, 11 Jun 2023 19:41:46 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3E6DEC6A60E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 11 Jun 2023 19:41:45 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-4f658a17aa4so3213591e87.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 11 Jun 2023 12:41:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686512504; x=1689104504;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=I6Ue4bYrXyR9j80ovW9fc7Vt7MxWUEhRPqPmpf2o0qo=;
 b=zd20DlhR2hxHUuFfATGWD/CU45g0SHtMXtYWmhJmj4p+WAOkPdH13eS5m8WSILbe+R
 FK/JP5aLMN66icLCgm4LYJsMbuM6gxEOYKOhEg74swgtQ7Ihmt34njRw9ZB3C74Fdec/
 NCo+uI5OLk3xPeG+Wz5ULGjKLQQ3l9f8rL2Sw4LNo7v9UK9XudLnVisOIQFY1ezZ2xA0
 t/ijZtDJXvKiGBrNIrNjSFgcmO8YkoWVOSXnOckw/+qDZfdCgGqLRHkZFhoUzX0rWItw
 w2sJgQhZFTcQXIreLySn5GnhwxZk9kVuyptUWokNJH4uu6P5k2cP0WOQ2mVtKlgndqsu
 ew9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686512504; x=1689104504;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=I6Ue4bYrXyR9j80ovW9fc7Vt7MxWUEhRPqPmpf2o0qo=;
 b=V+prutQ/HQQQs8Cn7lqA4DO34zHqCs33V4mvcOsi/TV08CWXXrgkDW2w9gIBKLsMAT
 d8goPm+4jJW/4ep+4sN+fpnoP8P+d2vtZTjuDqEoUp7mFENYE80EKoG/oWNS+XahU8HP
 aRw5vAUqY/kC43l3kf/+WacanxwMKSXA+z09rz7aeoV89dP8OTwjOxL6PN9v9WpcLgGi
 hwIZyw+Ii8/OdNWUZapZuUoDtl3uH+mrLLH+68wkUiLdpsLyMKw/t4NKbd7T1GvmI8eM
 s2ls1W1dAaC86LPQN6cMNuUW+xlkoZ0sXBPoLDlS0E70KJ6IkcUYf8YSDejlmqEIf6kp
 emBQ==
X-Gm-Message-State: AC+VfDx4Uh5ghVNFd+r8EWffkAeWCgLpmc5DojfNWoiCqVKRzrDZyBWV
 hsH07fzXJ0H3+jzqn9MlveFRcg==
X-Google-Smtp-Source: ACHHUZ4rtxZmAAiTtmPxVVXhq3W7BSegGOw3ef9o1EK9vWgXdelDsLn/HHhHvMActgf6HZguAlCmfQ==
X-Received: by 2002:a05:6512:286:b0:4f6:3ab6:3d9e with SMTP id
 j6-20020a056512028600b004f63ab63d9emr3127554lfp.59.1686512504688; 
 Sun, 11 Jun 2023 12:41:44 -0700 (PDT)
Received: from [192.168.1.2] (c-05d8225c.014-348-6c756e10.bbcust.telenor.se.
 [92.34.216.5]) by smtp.gmail.com with ESMTPSA id
 u24-20020ac243d8000000b004f14ae5ded8sm1246960lfl.28.2023.06.11.12.41.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Jun 2023 12:41:44 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 11 Jun 2023 21:41:30 +0200
MIME-Version: 1.0
Message-Id: <20230405-pl180-busydetect-fix-v3-4-cd3d5925ae64@linaro.org>
References: <20230405-pl180-busydetect-fix-v3-0-cd3d5925ae64@linaro.org>
In-Reply-To: <20230405-pl180-busydetect-fix-v3-0-cd3d5925ae64@linaro.org>
To: Yann Gautier <yann.gautier@foss.st.com>, 
 Stefan Hansson <newbyte@disroot.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.12.2
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-mmc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v3 04/10] mmc: mmci: Break out error check in
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
ChangeLog v2->v3:
- Rebased.
ChangeLog v1->v2:
- No changes
---
 drivers/mmc/host/mmci.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/mmc/host/mmci.c b/drivers/mmc/host/mmci.c
index 73b5205592ae..fbc13923f4fe 100644
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
