Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 220719E1474
	for <lists+linux-stm32@lfdr.de>; Tue,  3 Dec 2024 08:41:26 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9479FC7801F;
	Tue,  3 Dec 2024 07:41:25 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5ECC6C6B45B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  2 Dec 2024 22:03:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 39135A41329;
 Mon,  2 Dec 2024 22:01:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CCF87C4CEED;
 Mon,  2 Dec 2024 22:03:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1733177024;
 bh=MdqsHWxoEbswm9BrGX6SpwNbcHkCUMsgVrFUDFuO4JM=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=aZEu1Zsz8eCmY9cBFgCU57SdKOad9AbLBl0RiEhuMWQ/yude6wAHnAv7Rs/yDmP0T
 xtaV3N6nctN08hkpvRxZl7EtOv2vQAFXYPxF3XG3Qr1il3qdg5uMPB7JY28m2oONM7
 ing3AVOwF9SAY9ZNyqqKXfckphi3Q2qoqYyhJqHohO2+Su4vf/YYuV9gpR2UuTSO+Q
 PMo2UFj5ekp9aoa0Pa82NxpdzVKrMEfhg09C8T3SqfUGPoIGyEvjgh+yV5ztcZwLIV
 JgSpZ9iOXYfEu+qaSg6Y7/PApQ6MbSbIuLfQb+/VO93JLPfOvsbWn9QH5HoyazzVJw
 VcIdEQEV5QazQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id BB6C8E69E98;
 Mon,  2 Dec 2024 22:03:44 +0000 (UTC)
From: Jan Petrous via B4 Relay <devnull+jan.petrous.oss.nxp.com@kernel.org>
Date: Mon, 02 Dec 2024 23:03:46 +0100
MIME-Version: 1.0
Message-Id: <20241202-upstream_s32cc_gmac-v7-7-bc3e1f9f656e@oss.nxp.com>
References: <20241202-upstream_s32cc_gmac-v7-0-bc3e1f9f656e@oss.nxp.com>
In-Reply-To: <20241202-upstream_s32cc_gmac-v7-0-bc3e1f9f656e@oss.nxp.com>
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
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733177022; l=1284;
 i=jan.petrous@oss.nxp.com; s=20240922; h=from:subject:message-id;
 bh=Ku8xMy0eJs5aGJR44zqrL9wRlkD9lntzlgmaMXGJpvg=;
 b=2U1B84zNI+h53ExIN6aeEX6Tre/is8ckFDswPulOpJ5/biVW0pNGxVGH2d065bRWqNMwX6Jtm
 SJ5TQHoJyPbBLV6EConUgQI0xWPW+8dUiOa9c3542MDtOBOHH/wLazN
X-Developer-Key: i=jan.petrous@oss.nxp.com; a=ed25519;
 pk=Ke3wwK7rb2Me9UQRf6vR8AsfJZfhTyoDaxkUCqmSWYY=
X-Endpoint-Received: by B4 Relay for jan.petrous@oss.nxp.com/20240922 with
 auth_id=217
X-Original-From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
X-Mailman-Approved-At: Tue, 03 Dec 2024 07:41:23 +0000
Cc: imx@lists.linux.dev, NXP S32 Linux Team <s32@nxp.com>,
 devicetree@vger.kernel.org, netdev@vger.kernel.org,
 "Jan Petrous \(OSS\)" <jan.petrous@oss.nxp.com>, linux-kernel@vger.kernel.org,
 fancer.lancer@gmail.com, 0x1207@gmail.com, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v7 07/15] net: dwmac-intel-plat: Use
 helper rgmii_clock
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

When in, remove dead code in kmb_eth_fix_mac_speed().

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
---
 .../net/ethernet/stmicro/stmmac/dwmac-intel-plat.c | 22 ++++------------------
 1 file changed, 4 insertions(+), 18 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel-plat.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel-plat.c
index d94f0a150e93..ddee6154d40b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel-plat.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel-plat.c
@@ -31,27 +31,13 @@ struct intel_dwmac_data {
 static void kmb_eth_fix_mac_speed(void *priv, unsigned int speed, unsigned int mode)
 {
 	struct intel_dwmac *dwmac = priv;
-	unsigned long rate;
+	long rate;
 	int ret;
 
-	rate = clk_get_rate(dwmac->tx_clk);
-
-	switch (speed) {
-	case SPEED_1000:
-		rate = 125000000;
-		break;
-
-	case SPEED_100:
-		rate = 25000000;
-		break;
-
-	case SPEED_10:
-		rate = 2500000;
-		break;
-
-	default:
+	rate = rgmii_clock(speed);
+	if (rate < 0) {
 		dev_err(dwmac->dev, "Invalid speed\n");
-		break;
+		return;
 	}
 
 	ret = clk_set_rate(dwmac->tx_clk, rate);

-- 
2.47.0


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
