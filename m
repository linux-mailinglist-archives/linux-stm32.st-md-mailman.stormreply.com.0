Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EB8C9D28D1
	for <lists+linux-stm32@lfdr.de>; Tue, 19 Nov 2024 16:01:14 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EFE62C7A836;
	Tue, 19 Nov 2024 15:01:13 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E1EBEC78F9A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Nov 2024 15:01:12 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id BCCAD5C55F3;
 Tue, 19 Nov 2024 15:00:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 712E1C4AF09;
 Tue, 19 Nov 2024 15:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1732028465;
 bh=OHxB9rBJfD9alhtYQwEZOwU5JQFBquZocPkNzhxXMqo=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=VKGrz6wipn/LFmH8fMXXJyLXayMB+Im0igBI4lrMWMm7pR1cBZbT80UjZuAv/xa2u
 ile6rQTSgvXm4ZZhfiYpcmcUmPtvSZUabEMkz5HmmVmaknYqcs8ICsX9CoDOHZmakj
 VFvcmsxIRIRqfheLUNWRDWfFMWFoEDociWQzyWmirCQI16asY8ZkMLkj3GUUaAz9hy
 PePdUFHT8kuvOxazr6Cs7SP9Cwk/J+5lSwzJUFQte76Zn7miBAfPXUlifQJJCeS+Pq
 VsiV9ufJJmcK9BxrEpSMqBQq1JGXeACKMo5GHYRmVR4ncvF38kZWP942lT5gusUurO
 ABtPQ6wQ+tuiw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 64FDAD44167;
 Tue, 19 Nov 2024 15:01:05 +0000 (UTC)
From: Jan Petrous via B4 Relay <devnull+jan.petrous.oss.nxp.com@kernel.org>
Date: Tue, 19 Nov 2024 16:00:22 +0100
MIME-Version: 1.0
Message-Id: <20241119-upstream_s32cc_gmac-v5-16-7dcc90fcffef@oss.nxp.com>
References: <20241119-upstream_s32cc_gmac-v5-0-7dcc90fcffef@oss.nxp.com>
In-Reply-To: <20241119-upstream_s32cc_gmac-v5-0-7dcc90fcffef@oss.nxp.com>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>, 
 Richard Cochran <richardcochran@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Emil Renner Berthing <kernel@esmil.dk>, 
 Minda Chen <minda.chen@starfivetech.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Iyappan Subramanian <iyappan@os.amperecomputing.com>, 
 Keyur Chudgar <keyur@os.amperecomputing.com>, 
 Quan Nguyen <quan@os.amperecomputing.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732028461; l=1264;
 i=jan.petrous@oss.nxp.com; s=20240922; h=from:subject:message-id;
 bh=SPtatx8x0ZkbtjnD8HA6OeWFeo+DZZ7ciHEBKeYJXkM=;
 b=2UaIZd/gCwdI5kIGbU8BJj5qpiNrj2FL1GF/utf3Q9uRD7+lnoiRcKDO9pbhMhMM611X5TL1E
 toRgEv2X5geDhoQ+eHY+2G/4K1Vn3mTfArX/V9Hwli6Rqyvby60GyYU
X-Developer-Key: i=jan.petrous@oss.nxp.com; a=ed25519;
 pk=Ke3wwK7rb2Me9UQRf6vR8AsfJZfhTyoDaxkUCqmSWYY=
X-Endpoint-Received: by B4 Relay for jan.petrous@oss.nxp.com/20240922 with
 auth_id=217
X-Original-From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
Cc: imx@lists.linux.dev, NXP S32 Linux Team <s32@nxp.com>,
 devicetree@vger.kernel.org, netdev@vger.kernel.org,
 "Jan Petrous \(OSS\)" <jan.petrous@oss.nxp.com>, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v5 16/16] net: stmmac: platform: Fix PTP clock
	rate reading
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
Reply-To: jan.petrous@oss.nxp.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>

The stmmac driver supports many vendors SoCs using Synopsys-licensed
Ethernet controller IP. Most of these vendors reuse the stmmac_platform
codebase, which has a potential PTP clock initialization issue.
The PTP clock rate reading might require ungating what is not provided.

Fix the PTP clock initialization by enabling it immediately.

Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
index b1e4df1a86a0..db3e8ef4fc3a 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
@@ -632,7 +632,7 @@ stmmac_probe_config_dt(struct platform_device *pdev, u8 *mac)
 	clk_prepare_enable(plat->pclk);
 
 	/* Fall-back to main clock in case of no PTP ref is passed */
-	plat->clk_ptp_ref = devm_clk_get(&pdev->dev, "ptp_ref");
+	plat->clk_ptp_ref = devm_clk_get_enabled(&pdev->dev, "ptp_ref");
 	if (IS_ERR(plat->clk_ptp_ref)) {
 		plat->clk_ptp_rate = clk_get_rate(plat->stmmac_clk);
 		plat->clk_ptp_ref = NULL;

-- 
2.47.0


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
