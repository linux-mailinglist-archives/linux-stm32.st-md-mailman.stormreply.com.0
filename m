Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8807D12BE42
	for <lists+linux-stm32@lfdr.de>; Sat, 28 Dec 2019 19:35:44 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 25D1EC36B0C;
	Sat, 28 Dec 2019 18:35:44 +0000 (UTC)
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
 [209.85.214.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2AFC7C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 28 Dec 2019 18:35:42 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id c13so13039386pls.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 28 Dec 2019 10:35:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=HA6ap3YBH12tN/wspc69xBp95EQn1Xx2HPN8PjoD5hA=;
 b=bMNVXsQnfKQRZaTsu5Z4AlXDdYOeCeNqaFJy6GuQn3oLSfJwG9BLmRwdcgIQlFlbNy
 EP9p+FhRGyY5d/kNaZZ/FQh+S8zTAaVojQm0ho0mKz/n7SyWATXKht31JKeKnjFN32Cl
 20d24NLqMfuGPZsWRCGsu8wMeGu885WX5Et9aJxLatjZlj2i2S1qOIbVLOnvxuSk50t3
 znbIrDGBqKfswBC49tmawJBrxKn+XK0NLWKMu+TT/PmB5Nr0nwBo3MeS0bPy5REXS51M
 b6k28+Easl0LQeyRJGDG6CTosoeO1HNpHTHKvl8xHyllA3Pu9GHV6gjRRhPvqFP+CHu+
 BjhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=HA6ap3YBH12tN/wspc69xBp95EQn1Xx2HPN8PjoD5hA=;
 b=nLsnKYCLKcbUqE69MOg4pC0EWukNmhwhLnO8GRE0AHIcubGh3i9T/6Pob0dy42jWvG
 XQ/7YYJKsT1unPhn2HjKBy+mwircfFw6z1QKW5apJCoqiJ700D1hGIROD75LMbASzCTW
 nULAshU+cQwyhSXVTW7+8xU7HwioQSpiQULTC15g1jFUGcgE710kwKRf1H2Z3QVpvtOu
 thVcQx6vlXeJGwWI2yoTNoPazPSJr3ReMUdt+R838v6/LwvTI4TcYAASC1eM2RmJwxID
 iHAG9zi33Qi0iJS5+zi+cCiK0R4q2qMzfVNQu1Uhzusx3tRhg9Y1c3uJYC/NZo/udb35
 VtTQ==
X-Gm-Message-State: APjAAAWZWSq5ipjZ5m89F8SMtvtVhesOc80wZVxZosiDKMY84/j/9DvB
 t7Jx+yrdg/aAf1OLnbW4sQg=
X-Google-Smtp-Source: APXvYqx4E8Eu7c2uGoKiMs4QJKyvTXmA+WIuNXF86bL2KzPp6818QAcgzM+bVVUzJc2A+S93588ywA==
X-Received: by 2002:a17:902:7288:: with SMTP id
 d8mr56643250pll.341.1577558140530; 
 Sat, 28 Dec 2019 10:35:40 -0800 (PST)
Received: from localhost ([2001:19f0:6001:12c8:5400:2ff:fe72:6403])
 by smtp.gmail.com with ESMTPSA id k21sm31679513pfa.63.2019.12.28.10.35.39
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 28 Dec 2019 10:35:39 -0800 (PST)
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
Date: Sat, 28 Dec 2019 18:35:26 +0000
Message-Id: <20191228183538.26189-1-tiny.windzz@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: Yangtao Li <tiny.windzz@gmail.com>
Subject: [Linux-stm32] [PATCH 01/13] mailbox: altera: convert to
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
 drivers/mailbox/mailbox-altera.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/mailbox/mailbox-altera.c b/drivers/mailbox/mailbox-altera.c
index 75282666fb06..afb320e9d69c 100644
--- a/drivers/mailbox/mailbox-altera.c
+++ b/drivers/mailbox/mailbox-altera.c
@@ -285,7 +285,6 @@ static const struct mbox_chan_ops altera_mbox_ops = {
 static int altera_mbox_probe(struct platform_device *pdev)
 {
 	struct altera_mbox *mbox;
-	struct resource	*regs;
 	struct mbox_chan *chans;
 	int ret;
 
@@ -299,9 +298,7 @@ static int altera_mbox_probe(struct platform_device *pdev)
 	if (!chans)
 		return -ENOMEM;
 
-	regs = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-
-	mbox->mbox_base = devm_ioremap_resource(&pdev->dev, regs);
+	mbox->mbox_base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(mbox->mbox_base))
 		return PTR_ERR(mbox->mbox_base);
 
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
