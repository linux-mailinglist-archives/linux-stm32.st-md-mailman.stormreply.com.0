Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BBA2D1112D
	for <lists+linux-stm32@lfdr.de>; Thu,  2 May 2019 04:19:09 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 872DCC597B9
	for <lists+linux-stm32@lfdr.de>; Thu,  2 May 2019 02:19:09 +0000 (UTC)
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8534CC597B9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  2 May 2019 02:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=kubXXWC5hG9Tf1ZSHpSxNXJFgzmFjFMboy4IdHsOOYE=; b=Eu4Z2dQK2d5s
 7+OPZea8vdm5txFIQ3PXmk2cFESM+o/bLD/y0Y2GZ4yWVnh+BCMG2J8wGq1+nK+v81wtpJ3It4n2g
 ZU8rdxq++CEIysOxPTqpcdvevSj9kMWV8xpzeW2IGFs6OzMwMpzesxpa9y9EqvusxgkcJEIaIwVa/
 jR7wU=;
Received: from [211.55.52.15] (helo=finisterre.ee.mobilebroadband)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hM1JQ-0005va-TA; Thu, 02 May 2019 02:19:05 +0000
Received: by finisterre.ee.mobilebroadband (Postfix, from userid 1000)
 id 7345A441D56; Thu,  2 May 2019 03:19:01 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Fabien Dessenne <fabien.dessenne@st.com>
In-Reply-To: <1556119140-3319-1-git-send-email-fabien.dessenne@st.com>
X-Patchwork-Hint: ignore
Message-Id: <20190502021901.7345A441D56@finisterre.ee.mobilebroadband>
Date: Thu,  2 May 2019 03:19:01 +0100 (BST)
Cc: linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] Applied "spi: stm32-qspi: manage the get_irq error
	case" to the spi tree
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

The patch

   spi: stm32-qspi: manage the get_irq error case

has been applied to the spi tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-5.2

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From 4b562de4e227dbc2267c367b0a1ec83051c364f6 Mon Sep 17 00:00:00 2001
From: Fabien Dessenne <fabien.dessenne@st.com>
Date: Wed, 24 Apr 2019 17:19:00 +0200
Subject: [PATCH] spi: stm32-qspi: manage the get_irq error case

During probe, check the "get_irq" error value.

Signed-off-by: Fabien Dessenne <fabien.dessenne@st.com>
Acked-by: Ludovic Barre <ludovic.barre@st.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/spi/spi-stm32-qspi.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/spi/spi-stm32-qspi.c b/drivers/spi/spi-stm32-qspi.c
index 11a89aa15d56..42f8e3c6aa1f 100644
--- a/drivers/spi/spi-stm32-qspi.c
+++ b/drivers/spi/spi-stm32-qspi.c
@@ -574,6 +574,12 @@ static int stm32_qspi_probe(struct platform_device *pdev)
 	}
 
 	irq = platform_get_irq(pdev, 0);
+	if (irq < 0) {
+		if (irq != -EPROBE_DEFER)
+			dev_err(dev, "IRQ error missing or invalid\n");
+		return irq;
+	}
+
 	ret = devm_request_irq(dev, irq, stm32_qspi_irq, 0,
 			       dev_name(dev), qspi);
 	if (ret) {
-- 
2.20.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
