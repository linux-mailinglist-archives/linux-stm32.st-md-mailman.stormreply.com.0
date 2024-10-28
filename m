Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 403C39BBB52
	for <lists+linux-stm32@lfdr.de>; Mon,  4 Nov 2024 18:18:37 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D6141C78015;
	Mon,  4 Nov 2024 17:18:36 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F3007C78023
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Oct 2024 20:25:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 3D35C5C586B;
 Mon, 28 Oct 2024 20:24:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 96BEDC4CEF7;
 Mon, 28 Oct 2024 20:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1730147127;
 bh=JRUUT/tVaHw7QrNHAqa5N8/R1Mo2990bjnD9KKasxCA=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=jlxIgtu7V3cPBsySzGHkIQt2Pkpvu7zLFd+Sa//8HjxDN33wfX+tLPfl2Kh3smzyY
 F3gc/xFON//NvqVkzU3rHdwnuHLd8lNTRdHdy37WzKIGIM/L5sJ9YRFQrE6+vcn8c6
 xyq/MG97S5pep1MSvjvyj0UPnQ2K1QzV09fXD/0lDdFr+sKLoh9PXwSN1FNYqdrEo1
 Hy0iG1kPtJPr95Ok0jX21rVclqjlJPZIzGARF4WCXjpka+FQ1q7TNMCTMx2XztO9h6
 a8wQ0+HbXcOwW4dQknRx1hALSYLUsgeEkJ1oah3Q/YPJIPq8kt2zD+16Y1xpBgggov
 djzUH3nAaghOQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 89E78D5B14E;
 Mon, 28 Oct 2024 20:25:27 +0000 (UTC)
From: Jan Petrous via B4 Relay <devnull+jan.petrous.oss.nxp.com@kernel.org>
Date: Mon, 28 Oct 2024 21:24:47 +0100
MIME-Version: 1.0
Message-Id: <20241028-upstream_s32cc_gmac-v4-5-03618f10e3e2@oss.nxp.com>
References: <20241028-upstream_s32cc_gmac-v4-0-03618f10e3e2@oss.nxp.com>
In-Reply-To: <20241028-upstream_s32cc_gmac-v4-0-03618f10e3e2@oss.nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730147124; l=1182;
 i=jan.petrous@oss.nxp.com; s=20240922; h=from:subject:message-id;
 bh=o1k5Wm20ojlSERI184m4AqWRyn2wXW8vdr8AE9UuluE=;
 b=oQtSE7tZW80kMP1GQFVE/VJ3DQXVdxUvernNfz8S7tts1H1pzWxYq+pY4H/6cFR/3t/mgQzwK
 VU83o71HrGlDIwsxQJOrzQktrXXZKJkOmQfQ/PQPEbE1cI0wF88D7Jz
X-Developer-Key: i=jan.petrous@oss.nxp.com; a=ed25519;
 pk=Ke3wwK7rb2Me9UQRf6vR8AsfJZfhTyoDaxkUCqmSWYY=
X-Endpoint-Received: by B4 Relay for jan.petrous@oss.nxp.com/20240922 with
 auth_id=217
X-Original-From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
X-Mailman-Approved-At: Mon, 04 Nov 2024 17:18:35 +0000
Cc: imx@lists.linux.dev, NXP S32 Linux Team <s32@nxp.com>,
 devicetree@vger.kernel.org, netdev@vger.kernel.org,
 "Jan Petrous \(OSS\)" <jan.petrous@oss.nxp.com>, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v4 05/16] net: dwmac-dwc-qos-eth: Use helper
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

Utilize a new helper function rgmii_clock().

Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
index ec924c6c76c6..5080891c33e0 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
@@ -181,24 +181,19 @@ static void dwc_qos_remove(struct platform_device *pdev)
 static void tegra_eqos_fix_speed(void *priv, unsigned int speed, unsigned int mode)
 {
 	struct tegra_eqos *eqos = priv;
-	unsigned long rate = 125000000;
+	long rate = 125000000;
 	bool needs_calibration = false;
 	u32 value;
 	int err;
 
 	switch (speed) {
 	case SPEED_1000:
-		needs_calibration = true;
-		rate = 125000000;
-		break;
-
 	case SPEED_100:
 		needs_calibration = true;
-		rate = 25000000;
-		break;
+		fallthrough;
 
 	case SPEED_10:
-		rate = 2500000;
+		rate = rgmii_clock(speed);
 		break;
 
 	default:

-- 
2.46.0


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
