Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 77D7299C3AF
	for <lists+linux-stm32@lfdr.de>; Mon, 14 Oct 2024 10:42:54 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0FD3AC7803B;
	Mon, 14 Oct 2024 08:42:54 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 43576C7801A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 13 Oct 2024 21:28:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 602EBA40F44;
 Sun, 13 Oct 2024 21:27:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3879AC4CEF1;
 Sun, 13 Oct 2024 21:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1728854878;
 bh=Nn+g7eeRUbmuioaQ/PGNqFJ6Ggh6l4nHhAt5g4V3gMg=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=cjEMFAiY7Ilnablxc1XnsahBC13AgXZcGgFq8RZLoZ4gDl0XgkDXXZVSkdNlAws3U
 4sg72gY4L5PczgMuDrhy0orAioLUEnn+ntiBK/lsAM40agn7GBEY2ahfmDG2mjjoYP
 1gjYdFxVs7hedeWk5zegTh0rh60rqz7fl5sGdgmybn4xdTtILM0faSrP5zD5+sf6nk
 wdUuumjt1rYV8KCElth6SD441pfGaiWq0o8/FpMULhXyFmcGN6S4/QDuMuUIEhxVrS
 xrYScGtWYKHSKAmb30AXG5KN/zfA20OSU+SKrcotQAaSYtZagJaKqZx5L/4uAtgQDK
 BO+GxOcej76cQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 2E9D9CF2591;
 Sun, 13 Oct 2024 21:27:58 +0000 (UTC)
From: Jan Petrous via B4 Relay <devnull+jan.petrous.oss.nxp.com@kernel.org>
Date: Sun, 13 Oct 2024 23:27:44 +0200
MIME-Version: 1.0
Message-Id: <20241013-upstream_s32cc_gmac-v3-9-d84b5a67b930@oss.nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728854875; l=1143;
 i=jan.petrous@oss.nxp.com; s=20240922; h=from:subject:message-id;
 bh=izAPXG5Zoogrdq15i39txVo0VJdx5W3UBGLtbZvPlic=;
 b=dWiupgAbQZP27LJq6sBgPF9PByHgqcK5ZAu9fXs+dfegW0+SH1JyL3mFhzPOblsb2pCIf/2Tj
 vlU/UQ34qo+AAeIRoWfzNnyaVAwUzMD0kfANP6BZ6i+X+bcK/nFiB2B
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
Subject: [Linux-stm32] [PATCH v3 09/16] net: dwmac-starfive: Use helper
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
 drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c | 19 ++++---------------
 1 file changed, 4 insertions(+), 15 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
index 4e1076faee0c..d80461a721c1 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
@@ -34,24 +34,13 @@ struct starfive_dwmac {
 static void starfive_dwmac_fix_mac_speed(void *priv, unsigned int speed, unsigned int mode)
 {
 	struct starfive_dwmac *dwmac = priv;
-	unsigned long rate;
+	long rate;
 	int err;
 
-	rate = clk_get_rate(dwmac->clk_tx);
-
-	switch (speed) {
-	case SPEED_1000:
-		rate = 125000000;
-		break;
-	case SPEED_100:
-		rate = 25000000;
-		break;
-	case SPEED_10:
-		rate = 2500000;
-		break;
-	default:
+	rate = rgmii_clock(speed);
+	if (rate < 0) {
 		dev_err(dwmac->dev, "invalid speed %u\n", speed);
-		break;
+		return;
 	}
 
 	err = clk_set_rate(dwmac->clk_tx, rate);

-- 
2.46.0


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
