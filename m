Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A05B912BE54
	for <lists+linux-stm32@lfdr.de>; Sat, 28 Dec 2019 19:35:57 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6AE42C36B0D;
	Sat, 28 Dec 2019 18:35:57 +0000 (UTC)
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
 [209.85.210.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AD564C36B0C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 28 Dec 2019 18:35:56 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id q10so16317145pfs.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 28 Dec 2019 10:35:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=ui3H4sw6TXQZWyHZyumXfMS536ZRAUjdYlFCGuvHxAE=;
 b=QR/5gU3bd29uWtBlob2vq9WqKJ3hQUz+QbCW77CdxMCDaWVnA0C/c5Lx8ui8kEF7E4
 EJow2hD7opQrUZ22y3QHevj4gAvdDrI+hipJ2NNfxEZsOyHb444K1XGg/QZQJkKNH9n6
 hDfRLiS1l0jR5Krj2XWoSBuz5HpaMLXUGGuvcRI/vccwwizylRM35WopdZZg925EqhPy
 n0e08sqtH3zgT/f3gSypGJpdp4GCNnBueiPK26DJIb3wHYNUPrqr+S/8LRhfKekIp3Ev
 qRbJwKA7g1M6NqZUbhNvwoZPWSdTsI5x1Hy7jNncmQnUGUXYbl1tupuGX/2eLm0XD5Ny
 hmZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=ui3H4sw6TXQZWyHZyumXfMS536ZRAUjdYlFCGuvHxAE=;
 b=B0BT41xTdXCZ6Mw0/BqR1/27p/gBEltwKuI2koI/sA1sxgRdN9pmH7SAg2h4sfPU4a
 fe4NOgVr8iORcFZbiA2m4rfPpaMvXhMVYd2ipWldtKo9honMCkVfpuECicEhV9bh6ebz
 3rd9eIAusyoPSJIivJrzOHaTEUTVb9Lms3LXomoD3g7u+7mLB40ArypAizfVE6xD17rH
 9hT9lJqcR+vja/MfzWqbwMKxptn/RIeWKOPUjD5sZ12ER6R298K7QotGurYnxCN4NAw0
 BGrerLarXOaMcgNm2FnWb0jM04rG7uhwDVhWUFSvWwNGArBGddwuru9bZVuJLNrIKKTC
 GhGg==
X-Gm-Message-State: APjAAAXQP4hkQ7qrXtB2QsEVMENSGqXP8DLVKsGcsnrVDcQFASukin4E
 PAjSnBDk7x6KvgoU4nVWcUE=
X-Google-Smtp-Source: APXvYqzHr4KeI0b8gMJWBokRn8PKrEYYqhG+ocElUlfVhzxi6A9/q0OMkXH/noLIQBQBJ/jS6urxWg==
X-Received: by 2002:a62:ed0b:: with SMTP id u11mr60416235pfh.46.1577558155293; 
 Sat, 28 Dec 2019 10:35:55 -0800 (PST)
Received: from localhost ([2001:19f0:6001:12c8:5400:2ff:fe72:6403])
 by smtp.gmail.com with ESMTPSA id w187sm27832830pfw.62.2019.12.28.10.35.54
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 28 Dec 2019 10:35:54 -0800 (PST)
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
Date: Sat, 28 Dec 2019 18:35:35 +0000
Message-Id: <20191228183538.26189-10-tiny.windzz@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191228183538.26189-1-tiny.windzz@gmail.com>
References: <20191228183538.26189-1-tiny.windzz@gmail.com>
Cc: Yangtao Li <tiny.windzz@gmail.com>
Subject: [Linux-stm32] [PATCH 10/13] mailbox: tegra: convert to
	devm_platform_ioremap_resource
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

Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
---
 drivers/mailbox/tegra-hsp.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/mailbox/tegra-hsp.c b/drivers/mailbox/tegra-hsp.c
index 834b35dc3b13..6d16e56942ff 100644
--- a/drivers/mailbox/tegra-hsp.c
+++ b/drivers/mailbox/tegra-hsp.c
@@ -631,7 +631,6 @@ static int tegra_hsp_request_shared_irq(struct tegra_hsp *hsp)
 static int tegra_hsp_probe(struct platform_device *pdev)
 {
 	struct tegra_hsp *hsp;
-	struct resource *res;
 	unsigned int i;
 	u32 value;
 	int err;
@@ -645,8 +644,7 @@ static int tegra_hsp_probe(struct platform_device *pdev)
 	INIT_LIST_HEAD(&hsp->doorbells);
 	spin_lock_init(&hsp->lock);
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	hsp->regs = devm_ioremap_resource(&pdev->dev, res);
+	hsp->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(hsp->regs))
 		return PTR_ERR(hsp->regs);
 
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
