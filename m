Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CD0712BE4A
	for <lists+linux-stm32@lfdr.de>; Sat, 28 Dec 2019 19:35:53 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 478F4C36B0C;
	Sat, 28 Dec 2019 18:35:53 +0000 (UTC)
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
 [209.85.214.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 91173C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 28 Dec 2019 18:35:51 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id f20so13037939plj.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 28 Dec 2019 10:35:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=wHDWNkKUY/7HcK7MqADsWD8av4WLf/lhpq+f70oOVx4=;
 b=Nyg2CImHIlC00wE5qnxxCd4xvhYPSTqURjgeLIlpMMiH+Hv5taQKrd8r720IzIBAGR
 nZRD2oKDccKM/yuGWeJRcmnj2+SYaO0cStDR4fRrmidSo76bcIhoTbCfYR0PlGyb2fFd
 emyVPlFXLJi9tObOLVe+/5iePjUhXIrC39i3wjkLInXeLkqTHHH4cYIueyRGCiqVVpT7
 oqEep1j22vmUS8N8PkBcEdMibggLi1RMRklHW4jnAP49yx6KEcvqsAFIoG939aoRxKDH
 EFq2ycJTA5aeOUf2Y1/Bge3TG8s9hNorF0D2GyfxQRa3Od50CwHYL7+JIMw4qmOOS3xM
 G/MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=wHDWNkKUY/7HcK7MqADsWD8av4WLf/lhpq+f70oOVx4=;
 b=TYzz4dIgjU4304Hl5FtWWWNT7H7ZvOm0Smfc/OMW4yx976aMN3/4mkJ7bOW7onA4/5
 ZooS6RJgSiG5bqG8sDcfZeAsnZVKn/OeHETVV+exPOasy/GFSn1z0oSYEDh0kPSS/8wD
 D8CzTvU8tWd9kGui6+aefpcOfmDkewqCffRwh7lXJ9FMO70Dav28F9GhAxJ5vwRiaH16
 rmlGQwF/4HLPfS9z9U3CUZ63YWHGPJi987pxwsQqKlrLi26OtHHz/y2lYAPSXsExy5WR
 9gZxFOKYo4+buBF34vmF7IR+gehDmyjsRi/A7zirCsH2MESl1KJ0386LxYpY4qHafFym
 ObMQ==
X-Gm-Message-State: APjAAAUAadJPWQam78OXlWNseT1XRGfAcPkOVcL+no554dnJbniGWG6O
 cT2s4GbCupx1Px3SqXmklYA=
X-Google-Smtp-Source: APXvYqzg4HSZcS//Fgz3qJ6tuCit2iLqCHRWiMt5cWev8Yt8+UHZ0o3AuJy9vdLOuNpfASdbLD8YRA==
X-Received: by 2002:a17:902:b187:: with SMTP id
 s7mr59226454plr.104.1577558150166; 
 Sat, 28 Dec 2019 10:35:50 -0800 (PST)
Received: from localhost ([2001:19f0:6001:12c8:5400:2ff:fe72:6403])
 by smtp.gmail.com with ESMTPSA id n7sm18754871pjq.8.2019.12.28.10.35.49
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 28 Dec 2019 10:35:49 -0800 (PST)
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
Date: Sat, 28 Dec 2019 18:35:32 +0000
Message-Id: <20191228183538.26189-7-tiny.windzz@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191228183538.26189-1-tiny.windzz@gmail.com>
References: <20191228183538.26189-1-tiny.windzz@gmail.com>
Cc: Yangtao Li <tiny.windzz@gmail.com>
Subject: [Linux-stm32] [PATCH 07/13] mailbox: platform-mhu: convert to
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
 drivers/mailbox/platform_mhu.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/mailbox/platform_mhu.c b/drivers/mailbox/platform_mhu.c
index b6e34952246b..a5922ac0b0bf 100644
--- a/drivers/mailbox/platform_mhu.c
+++ b/drivers/mailbox/platform_mhu.c
@@ -117,7 +117,6 @@ static int platform_mhu_probe(struct platform_device *pdev)
 	int i, err;
 	struct platform_mhu *mhu;
 	struct device *dev = &pdev->dev;
-	struct resource *res;
 	int platform_mhu_reg[MHU_CHANS] = {
 		MHU_SEC_OFFSET, MHU_LP_OFFSET, MHU_HP_OFFSET
 	};
@@ -127,8 +126,7 @@ static int platform_mhu_probe(struct platform_device *pdev)
 	if (!mhu)
 		return -ENOMEM;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	mhu->base = devm_ioremap_resource(dev, res);
+	mhu->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(mhu->base)) {
 		dev_err(dev, "ioremap failed\n");
 		return PTR_ERR(mhu->base);
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
