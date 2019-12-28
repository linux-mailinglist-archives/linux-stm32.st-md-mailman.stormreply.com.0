Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B02412BE43
	for <lists+linux-stm32@lfdr.de>; Sat, 28 Dec 2019 19:35:44 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 33A4BC36B0F;
	Sat, 28 Dec 2019 18:35:44 +0000 (UTC)
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 34292C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 28 Dec 2019 18:35:43 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id 2so16308994pfg.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 28 Dec 2019 10:35:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=ck7TpFNaYsTfHjkSWvol6O0HxhZOnUYsxWnfPAIODG0=;
 b=SEK8+t673PBtRzm98GmczaWYIBSNYcOrsEXBKK6zpG07VibtJQX62dTHYPFL4w+jn8
 J20u/cIUNnFSow7+ZChaXz0UVQuYAZd8oCZy7nnV/qto1fHLZWL/W5re1lp/81kjaOOB
 0XTi/yHyByCZ8cUJeKUMhCHhH5hUe7VYE/9t2Lum5P7P4pY5ew4fu2nA0QzW4bY/jFRE
 g9cF4BVNx3T84j2SNec0geRbXtvFbo+UyEeTSJ54I8iOJF2CSVxIYb2HDbqnWdvaP1H6
 ZTaEXNeqmvV4XlhIL/ZrmGrACVgGlzp8uUPkzAv+dPL/pbV6GLtTuPbwRs8FyhFH8yDq
 pVrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=ck7TpFNaYsTfHjkSWvol6O0HxhZOnUYsxWnfPAIODG0=;
 b=RdE9y9ojB1niqJqW06jNY7z182afjLWM6thJVuxknOeonwjdASYk5KdbU8zvWhq1n8
 I+H+5Rd7nNItbuOsxxySc9yBDFNbv5agyqTk2N5W7A6aG96Bn60EEz3eFEWQIQ4sX8dI
 uReJ4kHS+7tbUJSgRPExs+8cvq2p0oGEJsQ2aW59VVzs9nm0NtdbAmY3JLL0NHGx1GdY
 iCgRi8pyw3KPWaesVBCODCzkBkFk95lk7CZSJY35TPu9vTPEGYjAj0DxZQ4zVI0ZamiC
 fnWQT4tFygEDlfyH8sL1+fANnyxa1TRmnWGLqg4TjQiwOgzAVXUiDpVHtofeECS6wCCE
 rqkQ==
X-Gm-Message-State: APjAAAXf4+dNL0tYQwzxCYVbQk8CwaVAFFqEhNmiW39/QICMvimdPF8V
 AlOtjocY30xHLaLTS0+qBqA=
X-Google-Smtp-Source: APXvYqx5/QP/GNVoyrkVJfv4Aq0NGpfhph/LLs+Iu2oE/kr2AvgV3Rb9EKdPNpuSs0gUI6foQXJ/1A==
X-Received: by 2002:a63:338e:: with SMTP id z136mr62252030pgz.60.1577558141763; 
 Sat, 28 Dec 2019 10:35:41 -0800 (PST)
Received: from localhost ([2001:19f0:6001:12c8:5400:2ff:fe72:6403])
 by smtp.gmail.com with ESMTPSA id o31sm42035078pgb.56.2019.12.28.10.35.41
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 28 Dec 2019 10:35:41 -0800 (PST)
From: Yangtao Li <tiny.windzz@gmail.com>
To: jassisinghbrar@gmail.com, nsaenzjulienne@suse.de, f.fainelli@gmail.com,
 rjui@broadcom.com, sbranden@broadcom.com,
 bcm-kernel-feedback-list@broadcom.com, lftan@altera.com,
 matthias.bgg@gmail.com, agross@kernel.org, bjorn.andersson@linaro.org,
 mcoquelin.stm32@gmail.com, alexandre.torgue@st.com,
 thierry.reding@gmail.com, jonathanh@nvidia.com,
 linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, nios2-dev@lists.rocketboards.org,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-tegra@vger.kernel.org
Date: Sat, 28 Dec 2019 18:35:27 +0000
Message-Id: <20191228183538.26189-2-tiny.windzz@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191228183538.26189-1-tiny.windzz@gmail.com>
References: <20191228183538.26189-1-tiny.windzz@gmail.com>
Cc: Yangtao Li <tiny.windzz@gmail.com>
Subject: [Linux-stm32] [PATCH 02/13] mailbox: xgene-slimpro: do some cleanup
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Use devm_platform_ioremap_resource() to simplify code.
'i' and 'rc' are variables of the same type and there is no
need to use two lines.

Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
---
 drivers/mailbox/mailbox-xgene-slimpro.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/mailbox/mailbox-xgene-slimpro.c b/drivers/mailbox/mailbox-xgene-slimpro.c
index de260799f1b9..908c0eb99b5a 100644
--- a/drivers/mailbox/mailbox-xgene-slimpro.c
+++ b/drivers/mailbox/mailbox-xgene-slimpro.c
@@ -170,10 +170,8 @@ static const struct mbox_chan_ops slimpro_mbox_ops = {
 static int slimpro_mbox_probe(struct platform_device *pdev)
 {
 	struct slimpro_mbox *ctx;
-	struct resource *regs;
 	void __iomem *mb_base;
-	int rc;
-	int i;
+	int rc, i;
 
 	ctx = devm_kzalloc(&pdev->dev, sizeof(struct slimpro_mbox), GFP_KERNEL);
 	if (!ctx)
@@ -181,8 +179,7 @@ static int slimpro_mbox_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, ctx);
 
-	regs = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	mb_base = devm_ioremap_resource(&pdev->dev, regs);
+	mb_base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(mb_base))
 		return PTR_ERR(mb_base);
 
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
