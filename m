Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7316C12BE47
	for <lists+linux-stm32@lfdr.de>; Sat, 28 Dec 2019 19:35:51 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3D5E7C36B0D;
	Sat, 28 Dec 2019 18:35:51 +0000 (UTC)
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0D6C5C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 28 Dec 2019 18:35:50 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id x184so16333945pfb.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 28 Dec 2019 10:35:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=y/sE4xh1t2Cj8E77giYRBaNWrpcKyHc3i8dVPSovTK4=;
 b=HggcovvR0ogFzw+dm8PvFlPesZYlhG5KhXgOaKns7flxoEPrBu2JbFjj1rJ6TylBUY
 grdEZJwUdf8Xt8x/KKOFpBrBeOIxlvRIAkzmjrokl6/A1Kum3J51+xwWoZGyZtEnN0M/
 pBWNiO2rVL2Xx7w8NBxv93DExpYLnn02bNA8fy3tGYc6dqqbaD2IQBCzu7pIqqj2z9yP
 ZRgyB7YwrSGb4TzirAWob2TYmGDLSc7FisDS+xCLyDfmK+EyfAvKzSFXJegZnhpYpt0x
 Ghqc2ZFAS9Snl1W4wohZrcH7c7vQ9Mcpq2GI2OByddPXR3b/pAqdlIWJ7vHUFsfgavdk
 P+Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=y/sE4xh1t2Cj8E77giYRBaNWrpcKyHc3i8dVPSovTK4=;
 b=pETHmXIqTep041XcugiM3k9RHyjAy1sopqJyM9Qoy35IGpqws6Nn80rML1AkA891RW
 l0vK9/YzqjCPn8wEKdk/Xtm9uS8+nvPoi9LpMnPLkriP996u6IBQt7NqZa4FERiDuCrN
 uuUlNOlAHHkVdC8Wwo9OaXjbWCdktNf1pHMSHlq8mt2cJYcziiX75E78q1yGkzdyzHaP
 phw32vYmGSMCf0n8zpOqj8ZXtjFt1XZFx98z0tmDl7qaLDnPI9s10Dr7SuTUiTsq6QXv
 eWEPVN0MPWEInWE9KoFLBAoR+p1qGkBwwbp2CVGWtm+Bv1EHxjsxi713MADioYSk3USj
 ODsg==
X-Gm-Message-State: APjAAAW23fQCzNTI2505fNcY7D/r9nOIj6fvtELxrR98CB/+ThOMgnh7
 5BnMVcmDhNRhf6aLs5PjlZk=
X-Google-Smtp-Source: APXvYqy67ub/4Rasa9TpN7ktqWdCOG7h8UEvzxw+QTUrNSPvo1fREyMoMw31xtaDb43AL7S++RClqQ==
X-Received: by 2002:a63:1b49:: with SMTP id b9mr61252160pgm.258.1577558148388; 
 Sat, 28 Dec 2019 10:35:48 -0800 (PST)
Received: from localhost ([2001:19f0:6001:12c8:5400:2ff:fe72:6403])
 by smtp.gmail.com with ESMTPSA id t1sm42242427pgq.23.2019.12.28.10.35.47
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 28 Dec 2019 10:35:47 -0800 (PST)
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
Date: Sat, 28 Dec 2019 18:35:31 +0000
Message-Id: <20191228183538.26189-6-tiny.windzz@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191228183538.26189-1-tiny.windzz@gmail.com>
References: <20191228183538.26189-1-tiny.windzz@gmail.com>
Cc: Yangtao Li <tiny.windzz@gmail.com>
Subject: [Linux-stm32] [PATCH 06/13] mailbox: hi3660: convert to
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
 drivers/mailbox/hi3660-mailbox.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/mailbox/hi3660-mailbox.c b/drivers/mailbox/hi3660-mailbox.c
index 53f4bc2488c5..97e2c4ed807d 100644
--- a/drivers/mailbox/hi3660-mailbox.c
+++ b/drivers/mailbox/hi3660-mailbox.c
@@ -240,7 +240,6 @@ static int hi3660_mbox_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct hi3660_mbox *mbox;
 	struct mbox_chan *chan;
-	struct resource *res;
 	unsigned long ch;
 	int err;
 
@@ -248,8 +247,7 @@ static int hi3660_mbox_probe(struct platform_device *pdev)
 	if (!mbox)
 		return -ENOMEM;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	mbox->base = devm_ioremap_resource(dev, res);
+	mbox->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(mbox->base))
 		return PTR_ERR(mbox->base);
 
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
