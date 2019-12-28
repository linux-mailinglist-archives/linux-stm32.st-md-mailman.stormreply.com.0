Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 204A912BE55
	for <lists+linux-stm32@lfdr.de>; Sat, 28 Dec 2019 19:36:01 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DF821C36B0C;
	Sat, 28 Dec 2019 18:36:00 +0000 (UTC)
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
 [209.85.215.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 40603C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 28 Dec 2019 18:35:58 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id q127so16057686pga.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 28 Dec 2019 10:35:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=D52kDZpItpEgyWtODzvm9zhNNB9VSkcFYK/HjZsI8Go=;
 b=buKvAITmrchkgml3RJ6rno8p2jfN0GrgBL0OBWLGNScbzpz89Wi31X8nu5grIh2TgZ
 +HeBPzjiNWMSmpky1ys0RIWzNzfxJLuwU2j1XKXIureYlpNYyTZJarlNQPpIRI8CeuaV
 W/0IZLMK43cqLRqwF3LLOSsNZZmiNVCn+uAqIAmbhe1FMs27Qc2orshWchJEj+FMmRG/
 WXNwA+UN+8BKCgsvXgClCPwvuKrNhpd6KzTi7/b2ysycQ/Fh+sYggOJicyXnAVkoQrO6
 rSn4FFH2EFrTKI2MY3LxbeaxoxC927l9BGsCFCHMh0+roRj1Wmjggspkn1KcA80ND6Jp
 TNKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=D52kDZpItpEgyWtODzvm9zhNNB9VSkcFYK/HjZsI8Go=;
 b=Zzg2RFO1zbSCAYyVoRA7wLxICEyj5H09wajXVo5oUz/tHzu8RgPcKW8OJGxq1MxlDa
 1ltemFpERMmz0PYrEwmOXKVh0jnN5JoDsPiZ7XWPNmrRGeWH/gd/W07AgWbJwsbgKBdH
 ORiPs3Su2a48cmvBu2Hh8pHvz6CckPz3j1nc4G77k/HE6Wb8HtEL/tf03y4TZUretLGH
 PDIsmMXkbpfBtQu1RlTgzwGp1XSEpNBXf43H63/GiQBrJxhPLj/VwJwdXNfFd5wxPiho
 UgXoORunhApcQiFkkmfnHYgbc024aPSnJwNNYe09n0W4Jg/0m3oKeFdRsfpYJKalNt3q
 LzaA==
X-Gm-Message-State: APjAAAUu1ZNjFzISnoZHqhuV7MOC1jGUxcUKN54RZdOYsPWc6XmD0Mau
 Y4AJ0qukLSojJV7SwgSKrBA=
X-Google-Smtp-Source: APXvYqxRDjC1yrZLagxhy9lKRDbplLhgf+LIWifgAoLN74eEtUbWySnjvGyIR5MxLdy/F0goyOL2Xw==
X-Received: by 2002:aa7:968d:: with SMTP id f13mr59926148pfk.67.1577558156956; 
 Sat, 28 Dec 2019 10:35:56 -0800 (PST)
Received: from localhost ([2001:19f0:6001:12c8:5400:2ff:fe72:6403])
 by smtp.gmail.com with ESMTPSA id f43sm19419481pje.23.2019.12.28.10.35.56
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 28 Dec 2019 10:35:56 -0800 (PST)
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
Date: Sat, 28 Dec 2019 18:35:36 +0000
Message-Id: <20191228183538.26189-11-tiny.windzz@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191228183538.26189-1-tiny.windzz@gmail.com>
References: <20191228183538.26189-1-tiny.windzz@gmail.com>
Cc: Yangtao Li <tiny.windzz@gmail.com>
Subject: [Linux-stm32] [PATCH 11/13] mailbox: hi6220: convert to
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
 drivers/mailbox/hi6220-mailbox.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/mailbox/hi6220-mailbox.c b/drivers/mailbox/hi6220-mailbox.c
index cc236ac7a0b5..d9140a016170 100644
--- a/drivers/mailbox/hi6220-mailbox.c
+++ b/drivers/mailbox/hi6220-mailbox.c
@@ -264,7 +264,6 @@ static int hi6220_mbox_probe(struct platform_device *pdev)
 	struct device_node *node = pdev->dev.of_node;
 	struct device *dev = &pdev->dev;
 	struct hi6220_mbox *mbox;
-	struct resource *res;
 	int i, err;
 
 	mbox = devm_kzalloc(dev, sizeof(*mbox), GFP_KERNEL);
@@ -287,15 +286,13 @@ static int hi6220_mbox_probe(struct platform_device *pdev)
 	if (mbox->irq < 0)
 		return mbox->irq;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	mbox->ipc = devm_ioremap_resource(dev, res);
+	mbox->ipc = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(mbox->ipc)) {
 		dev_err(dev, "ioremap ipc failed\n");
 		return PTR_ERR(mbox->ipc);
 	}
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
-	mbox->base = devm_ioremap_resource(dev, res);
+	mbox->base = devm_platform_ioremap_resource(pdev, 1);
 	if (IS_ERR(mbox->base)) {
 		dev_err(dev, "ioremap buffer failed\n");
 		return PTR_ERR(mbox->base);
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
