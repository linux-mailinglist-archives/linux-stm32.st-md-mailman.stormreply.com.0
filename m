Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BE46772BA1
	for <lists+linux-stm32@lfdr.de>; Mon,  7 Aug 2023 18:54:06 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 53CC5C6B469;
	Mon,  7 Aug 2023 16:54:06 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D3308C6B469
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  7 Aug 2023 16:54:04 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BE4A861FA0;
 Mon,  7 Aug 2023 16:54:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60A18C433C8;
 Mon,  7 Aug 2023 16:54:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1691427243;
 bh=2GxVXefyNbdQErExbmg0/pws/HcbyG4JyeKhzXvRnBE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=isNPA8VjsZLDLmk3teiuHGbXo4lE9uRIceVNL+NUBpMZljoqr0M2pYuIKf4nMpvxE
 VAqO3uRfxyTjsDvb6kDq+ERekznq4fiUU6yDdP6is/OzJE/OWat0MKryk0g/rzMh6T
 mZCDRUCKZ/vf62PQu9T+uUEgR7Cq5z2Pbk6quX9fgRzdRYiuTzfugYpM+GW3tL/vQF
 fkjcTJSK/Ar/a/ogARUGLBJUof6J33LRFi8ThH4WTvjnR9/A0rdCD9jxsCqaBF8YGd
 lFfx0H971y3hIDT46KdB/veZgNv4n5M9euSfpeH7a4KC1HpLyJ1+zc3Bw8Ri3Nrl3x
 9XHLXYDZIL/Ig==
From: Jisheng Zhang <jszhang@kernel.org>
To: "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>
Date: Tue,  8 Aug 2023 00:41:49 +0800
Message-Id: <20230807164151.1130-9-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230807164151.1130-1-jszhang@kernel.org>
References: <20230807164151.1130-1-jszhang@kernel.org>
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
Subject: [Linux-stm32] [PATCH net-next v2 08/10] net: stmmac: platform:
	support parsing safety irqs from DT
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

The snps dwmac IP may support safety features, and those Safety
Feature Correctible Error and Uncorrectible Error irqs may be
separate irqs. Add support to parse the safety irqs from DT.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 .../net/ethernet/stmicro/stmmac/stmmac_platform.c    | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
index 23d53ea04b24..29145682b57b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
@@ -738,6 +738,18 @@ int stmmac_get_platform_resources(struct platform_device *pdev,
 		dev_info(&pdev->dev, "IRQ eth_lpi not found\n");
 	}
 
+	stmmac_res->sfty_ce_irq = platform_get_irq_byname_optional(pdev, "sfty_ce");
+	if (stmmac_res->sfty_ce_irq < 0) {
+		if (stmmac_res->sfty_ce_irq == -EPROBE_DEFER)
+			return -EPROBE_DEFER;
+	}
+
+	stmmac_res->sfty_ue_irq = platform_get_irq_byname_optional(pdev, "sfty_ue");
+	if (stmmac_res->sfty_ue_irq < 0) {
+		if (stmmac_res->sfty_ue_irq == -EPROBE_DEFER)
+			return -EPROBE_DEFER;
+	}
+
 	stmmac_res->addr = devm_platform_ioremap_resource(pdev, 0);
 
 	return PTR_ERR_OR_ZERO(stmmac_res->addr);
-- 
2.40.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
