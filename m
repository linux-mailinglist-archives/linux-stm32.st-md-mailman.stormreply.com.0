Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B5EF12BE46
	for <lists+linux-stm32@lfdr.de>; Sat, 28 Dec 2019 19:35:50 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 32F6EC36B0C;
	Sat, 28 Dec 2019 18:35:50 +0000 (UTC)
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
 [209.85.215.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 07889C36B0D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 28 Dec 2019 18:35:48 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id q127so16057482pga.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 28 Dec 2019 10:35:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=u+WdsyKuKa5bxoF7O7EsreiiwOikxQI6yqVLLirGymc=;
 b=MOQRbWcFusjgAy4ALA0dRNwculnnf95IqWhwN+bI2m3VphYLVZFzUqdeNUJcfF7thl
 8Oo9SDyajObSomXnWDn4kLV7+lz97x8nR/7HN4y5d/JmKKCsuEl1aQrwGrxxU9hi3YAG
 tjBb4iRdN/pj3HarVM+/KzxZkLjXXEHQI+yH/sRvbCys5nO4SWzv7rqdNHrZiyIl2vxo
 TImjGbjwLoYHAfaIsoFlFP4cRJGFO/7eHgxPe1zcjmgBTBwhWCibX4aYc2ek2vXwbxIE
 TciifP5yqkjOxQ6NYC3r438SclSN9iySvH5xd3vVkdWVNV3WTs5Ssh2mceJPkuJNepf3
 +KUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=u+WdsyKuKa5bxoF7O7EsreiiwOikxQI6yqVLLirGymc=;
 b=ce0roE1/P6s685Xnn1sCtQgSVbYDs7tyXWS3Ja6VCTQNzVWv5VBAyoFR/hKwHUWy8e
 7p6M7s9X64JKEezwn9XYp7ZjSIM+S1zaIBo7k6vwbQMoXORN/2gaEXTO9uQX8ZnuNfLi
 WWAiVnYmUPNG3CjZUPPAduBNdS0KQejTESqEDafjLPjiRmMJ9St2lsUcJ4ZBRKthMXx0
 oeVkxd4ignE21qjgvGyQxZiE0m+ZAh/cPruRV4clNuie3U4XCfaoM0IedTutbMSLBdwR
 xE5VltQUOzvt+PlxETKZBcyre/ypQQv35CMYdufoTh7MIlaFrk531DuK8/BANDX8G88y
 Uy9g==
X-Gm-Message-State: APjAAAXNPfCF5jcLWbhm6wuGGPHeE/Vc2jYggdFJmtevH2RjJyRvkkGq
 ndv9CKNSSoOOc+SadJRdBLs=
X-Google-Smtp-Source: APXvYqz2FR0K8hzJVrRbKbBnQhFSr/aRNMbMRVtI8SoK2qjVYEADTjjwXnt98+L2VAfYvOqI5TwzYQ==
X-Received: by 2002:a63:111e:: with SMTP id g30mr63255423pgl.251.1577558146603; 
 Sat, 28 Dec 2019 10:35:46 -0800 (PST)
Received: from localhost ([2001:19f0:6001:12c8:5400:2ff:fe72:6403])
 by smtp.gmail.com with ESMTPSA id 7sm35621652pfx.52.2019.12.28.10.35.46
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 28 Dec 2019 10:35:46 -0800 (PST)
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
Date: Sat, 28 Dec 2019 18:35:30 +0000
Message-Id: <20191228183538.26189-5-tiny.windzz@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191228183538.26189-1-tiny.windzz@gmail.com>
References: <20191228183538.26189-1-tiny.windzz@gmail.com>
Cc: Yangtao Li <tiny.windzz@gmail.com>
Subject: [Linux-stm32] [PATCH 05/13] mailbox: bcm2835: convert to
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
 drivers/mailbox/bcm2835-mailbox.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/mailbox/bcm2835-mailbox.c b/drivers/mailbox/bcm2835-mailbox.c
index 39761d190545..79f93c9c7682 100644
--- a/drivers/mailbox/bcm2835-mailbox.c
+++ b/drivers/mailbox/bcm2835-mailbox.c
@@ -137,7 +137,6 @@ static int bcm2835_mbox_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	int ret = 0;
-	struct resource *iomem;
 	struct bcm2835_mbox *mbox;
 
 	mbox = devm_kzalloc(dev, sizeof(*mbox), GFP_KERNEL);
@@ -153,8 +152,7 @@ static int bcm2835_mbox_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
-	iomem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	mbox->regs = devm_ioremap_resource(&pdev->dev, iomem);
+	mbox->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(mbox->regs)) {
 		ret = PTR_ERR(mbox->regs);
 		dev_err(&pdev->dev, "Failed to remap mailbox regs: %d\n", ret);
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
