Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B36012BE45
	for <lists+linux-stm32@lfdr.de>; Sat, 28 Dec 2019 19:35:48 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 273EEC36B0F;
	Sat, 28 Dec 2019 18:35:48 +0000 (UTC)
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
 [209.85.215.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 359B0C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 28 Dec 2019 18:35:46 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id x7so16040529pgl.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 28 Dec 2019 10:35:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=hqSfykticrVROnPZePmOru2pp1VCz0LFD/v0VexrqBA=;
 b=TN5UMyKtGRFA9r24t/ZYgRXLOw/LCoKmhLVbbsgo4/9YAbF01PPDODx3Tg5TIqMice
 9+t2T8Cz0hK+BqG+Xyey3W3XOXnNK/H9hEE7XXjFeftyMBA2os7fKbrgmOF3Uf5qv4wY
 Kad1ZksLn7TWdjNFT78COriJqMCYMQlUSNkosa2FmFDxWXLUSMcitCKdiboBnxd0zQWr
 hi88HS+npw/ogvjqq/+jY0hby/cENDfini7neUTe9xDcEijGSkGIfMgDPXTucJ+luVYd
 g5QYLr1IVKvSeLPoTvbnpyRgJMJu43ss8Kly5/kDA+r+v1DElUws4jNDk1dao/QCykbv
 jxiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=hqSfykticrVROnPZePmOru2pp1VCz0LFD/v0VexrqBA=;
 b=aj6euT/OCS38a0EpI1RIdubi4KQg5qo9YenTc+kZsMLxoRnk2axFvk8pPSP/OPiT7W
 GovnKnk2bL0KFF0fijEakInrhAc9HseBKS2iIoAPKcpt1rKhS0qF0f0u2xhNfZ0n7jhC
 yAKAk46ZhWoheXOLnyaPqplulpd6RVzthPzz5KdKBWxyPMbKQH7DfXbraYOeztH7ibNf
 7yB0HYbUq6Qbpe0+XoNb2/QvYSh7NCRudFxo5PYnPX5C3gNcsIlVYkqhfFxL2qOdYe5R
 WhX+nnDOJ7xUwFPpk9eF4TzKNAxBgU49bK5tq3ewpT1QLMlkvzsg7Jb4vBZJ6L6IJmS5
 VY5A==
X-Gm-Message-State: APjAAAXAMYvoy6GnFJFNK3brMAelo0P1wmudV/DcHOuxzdRahHOB1TSv
 qycil/y9L881ZrqrqQSJ7NI=
X-Google-Smtp-Source: APXvYqxhLmtho2czElmGfzLozaAqFNdvpPt2BmXqglNEJ0AN6V99RjBsDbUR/heJgBjeBiaCFQdPeA==
X-Received: by 2002:a65:621a:: with SMTP id d26mr59969401pgv.151.1577558144795; 
 Sat, 28 Dec 2019 10:35:44 -0800 (PST)
Received: from localhost ([2001:19f0:6001:12c8:5400:2ff:fe72:6403])
 by smtp.gmail.com with ESMTPSA id k190sm42068720pga.73.2019.12.28.10.35.44
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 28 Dec 2019 10:35:44 -0800 (PST)
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
Date: Sat, 28 Dec 2019 18:35:29 +0000
Message-Id: <20191228183538.26189-4-tiny.windzz@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191228183538.26189-1-tiny.windzz@gmail.com>
References: <20191228183538.26189-1-tiny.windzz@gmail.com>
Cc: Yangtao Li <tiny.windzz@gmail.com>
Subject: [Linux-stm32] [PATCH 04/13] mailbox: mediatek: cmdq: convert to
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
 drivers/mailbox/mtk-cmdq-mailbox.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
index 9a6ce9f5a7db..7f9e34b021c8 100644
--- a/drivers/mailbox/mtk-cmdq-mailbox.c
+++ b/drivers/mailbox/mtk-cmdq-mailbox.c
@@ -458,7 +458,6 @@ static struct mbox_chan *cmdq_xlate(struct mbox_controller *mbox,
 static int cmdq_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct resource *res;
 	struct cmdq *cmdq;
 	int err, i;
 
@@ -466,8 +465,7 @@ static int cmdq_probe(struct platform_device *pdev)
 	if (!cmdq)
 		return -ENOMEM;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	cmdq->base = devm_ioremap_resource(dev, res);
+	cmdq->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(cmdq->base)) {
 		dev_err(dev, "failed to ioremap gce\n");
 		return PTR_ERR(cmdq->base);
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
