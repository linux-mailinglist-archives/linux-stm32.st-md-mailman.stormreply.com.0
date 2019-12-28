Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 724F912BE57
	for <lists+linux-stm32@lfdr.de>; Sat, 28 Dec 2019 19:36:04 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3A42CC36B0B;
	Sat, 28 Dec 2019 18:36:04 +0000 (UTC)
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
 [209.85.214.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C1DDFC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 28 Dec 2019 18:36:01 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id a6so12297843plm.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 28 Dec 2019 10:36:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=ADqPq+9Qjf/3isyeDy4/Z1hzrmcF+XODskWY/MSDCzg=;
 b=pUXBq1ZSttMQqrQedS6P3sf1POS/rPvRylB5k3jq1APu8c7p2pyt0Bi04CAVKALzjF
 mPkoRNynqJkKKKbubehHQ3+9IO5OqtImXGsEmJpiIFuAWI+EiXbIvwd9UQW4ZMC6M68s
 ed/W0lBfQ6ox96LOSikKs5fzgb/eLXOyhFgvFViHP8w7Aa50/yH69Z6WSlEjPBQ5YagM
 w/LDGD63x99SDV9D6NspjiK/aq60dQIlAfRolapH8LpMppixENiGo10ax6WBq8YV7SNS
 i7kgAhJgTiEjKLctxdjFNGrsF/q0hObxNFxPMyNymGY1GUapBkfBfb8Hl4CV2cGuUYwX
 45JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=ADqPq+9Qjf/3isyeDy4/Z1hzrmcF+XODskWY/MSDCzg=;
 b=fUwZer1mpjF2JbbVle5XwDuckz2zHG3tgrbgfU9ikvDcfx2CJJR9EowL+7H2w7iDMy
 gq8FjxMuJEv/rJCnjCTiJcb0smmD96K1rDznd6eC6anBSp6GhmrOnBVWNkUTyOiANzxM
 nApXGQadmRbPqCKPgqZD/Yj9ISFm6JdVeG2KFKKTgAZ8kpfRibKEw5NaN7OjOWstRcfT
 aUPxVdF+o6/94oBR8jUSrasEjjmv55yzolTCxJ+20E/0N+5VHWshXOWyJ+HDG0TAZhrN
 Z64UFmb6FdbOC3swVGTTmv4NMd2iyrpLMAR3G5HysMV+1HtzEIhUhKrVZXa0O4FWtgxf
 Ooig==
X-Gm-Message-State: APjAAAV6XFtKEcCQsnvycJ/90oruXlZMtNpGtx1XsV0+14z21fFNV1bp
 sMkn9SQ+NYYuReo7Fp5g7V0=
X-Google-Smtp-Source: APXvYqwLD6B860LYYvLn0ujeh8QzH5CpAMQoA7FqjdVBqgwpvrGi+q9HmCi2Rey62ZR7dzLVq7TOLA==
X-Received: by 2002:a17:90a:db0f:: with SMTP id
 g15mr33432010pjv.40.1577558160406; 
 Sat, 28 Dec 2019 10:36:00 -0800 (PST)
Received: from localhost ([2001:19f0:6001:12c8:5400:2ff:fe72:6403])
 by smtp.gmail.com with ESMTPSA id c26sm40294665pfj.101.2019.12.28.10.35.59
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 28 Dec 2019 10:36:00 -0800 (PST)
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
Date: Sat, 28 Dec 2019 18:35:38 +0000
Message-Id: <20191228183538.26189-13-tiny.windzz@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191228183538.26189-1-tiny.windzz@gmail.com>
References: <20191228183538.26189-1-tiny.windzz@gmail.com>
Cc: Yangtao Li <tiny.windzz@gmail.com>
Subject: [Linux-stm32] [PATCH 13/13] mailbox: armada-37xx-rwtm: convert to
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
 drivers/mailbox/armada-37xx-rwtm-mailbox.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/mailbox/armada-37xx-rwtm-mailbox.c b/drivers/mailbox/armada-37xx-rwtm-mailbox.c
index 19f086716dc5..02b7b28e6969 100644
--- a/drivers/mailbox/armada-37xx-rwtm-mailbox.c
+++ b/drivers/mailbox/armada-37xx-rwtm-mailbox.c
@@ -143,7 +143,6 @@ static const struct mbox_chan_ops a37xx_mbox_ops = {
 static int armada_37xx_mbox_probe(struct platform_device *pdev)
 {
 	struct a37xx_mbox *mbox;
-	struct resource *regs;
 	struct mbox_chan *chans;
 	int ret;
 
@@ -156,9 +155,7 @@ static int armada_37xx_mbox_probe(struct platform_device *pdev)
 	if (!chans)
 		return -ENOMEM;
 
-	regs = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-
-	mbox->base = devm_ioremap_resource(&pdev->dev, regs);
+	mbox->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(mbox->base)) {
 		dev_err(&pdev->dev, "ioremap failed\n");
 		return PTR_ERR(mbox->base);
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
