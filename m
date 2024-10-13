Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1742A99C3BE
	for <lists+linux-stm32@lfdr.de>; Mon, 14 Oct 2024 10:42:55 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D3DCBC78F7B;
	Mon, 14 Oct 2024 08:42:54 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A63FCC78030
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 13 Oct 2024 21:28:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 156365C5879;
 Sun, 13 Oct 2024 21:27:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 71A53C4CEF9;
 Sun, 13 Oct 2024 21:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1728854878;
 bh=DRbsWg6mtGg5289r3fCGYI0WcBuqo+O5QzBgVr1/WvQ=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=R+0/TgX7Us4RuqLu+ZyhjrRO7x/mDgxb3tv1JWjKg4ozLr6wY5nl1T0YB6A+JPcR6
 d8um6lIyOjkr/jmjAmI/S1R1DmEcPUuC4tG4t1zO051LbmkSbqtpAZoOQQhEstCMB1
 6JGXO9pNfiZ4+l1/zTJaBZqE1kE1upN0Xgk06drdwBP4xcstRuaJ6XNHNyDbH/ARar
 BJvIEsj8VYH7hPXbaoXQKWCF4eWyVMjnG+TmnMkrjJWMiG66DPAeiBrdzxXo+Nx6mI
 Q5/xF1iRUQRgQWvb7l9PUIWsXQwnXGtG38JT5lEdfEH1rG/NWS69u+1HEgVUxzAh9v
 W4DbQDG7F2Hrw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 66B79CF258D;
 Sun, 13 Oct 2024 21:27:58 +0000 (UTC)
From: Jan Petrous via B4 Relay <devnull+jan.petrous.oss.nxp.com@kernel.org>
Date: Sun, 13 Oct 2024 23:27:46 +0200
MIME-Version: 1.0
Message-Id: <20241013-upstream_s32cc_gmac-v3-11-d84b5a67b930@oss.nxp.com>
References: <20241013-upstream_s32cc_gmac-v3-0-d84b5a67b930@oss.nxp.com>
In-Reply-To: <20241013-upstream_s32cc_gmac-v3-0-d84b5a67b930@oss.nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728854875; l=1042;
 i=jan.petrous@oss.nxp.com; s=20240922; h=from:subject:message-id;
 bh=DaBsxGLe+QPFfNqlL0firzZ6hvDDB4Cd5sKjF5BEVMA=;
 b=ozIF2GNrr53C8rxjd2XD5oEL3dafHpIOFC2v7R8d0/7LqNPr7ZJaJ+gnLubDPaEFkfHIfycmo
 6rGVnFJiV6+AfvFAtXXCxbCYMqhx6R4Cd0lruHLZ5sMqJU94LfMVdjN
X-Developer-Key: i=jan.petrous@oss.nxp.com; a=ed25519;
 pk=Ke3wwK7rb2Me9UQRf6vR8AsfJZfhTyoDaxkUCqmSWYY=
X-Endpoint-Received: by B4 Relay for jan.petrous@oss.nxp.com/20240922 with
 auth_id=217
X-Original-From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
X-Mailman-Approved-At: Mon, 14 Oct 2024 08:42:52 +0000
Cc: imx@lists.linux.dev, NXP S32 Linux Team <s32@nxp.com>,
 devicetree@vger.kernel.org, netdev@vger.kernel.org,
 "Jan Petrous \(OSS\)" <jan.petrous@oss.nxp.com>, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3 11/16] net: xgene_enet: Use helper
	rgmii_clock
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

???

Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
---
 drivers/net/ethernet/apm/xgene/xgene_enet_hw.c | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/drivers/net/ethernet/apm/xgene/xgene_enet_hw.c b/drivers/net/ethernet/apm/xgene/xgene_enet_hw.c
index e641dbbea1e2..b854b6b42d77 100644
--- a/drivers/net/ethernet/apm/xgene/xgene_enet_hw.c
+++ b/drivers/net/ethernet/apm/xgene/xgene_enet_hw.c
@@ -421,18 +421,12 @@ static void xgene_enet_configure_clock(struct xgene_enet_pdata *pdata)
 
 	if (dev->of_node) {
 		struct clk *parent = clk_get_parent(pdata->clk);
+		long rate = rgmii_clock(pdata->phy_speed);
 
-		switch (pdata->phy_speed) {
-		case SPEED_10:
-			clk_set_rate(parent, 2500000);
-			break;
-		case SPEED_100:
-			clk_set_rate(parent, 25000000);
-			break;
-		default:
-			clk_set_rate(parent, 125000000);
-			break;
-		}
+		if (rate < 0)
+			rate = 125000000;
+
+		clk_set_rate(parent, rate);
 	}
 #ifdef CONFIG_ACPI
 	else {

-- 
2.46.0


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
