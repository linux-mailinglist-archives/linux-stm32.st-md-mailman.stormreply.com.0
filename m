Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 390FAA5616C
	for <lists+linux-stm32@lfdr.de>; Fri,  7 Mar 2025 08:05:09 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DCCA4C78F96;
	Fri,  7 Mar 2025 07:05:08 +0000 (UTC)
Received: from smtp.forwardemail.net (smtp.forwardemail.net [121.127.44.59])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C8D62C78F6D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  6 Mar 2025 20:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1741293552; bh=7JyxP8FBRDIO7vgzFTNLCIrseIO0xPkXO1N8Yvb5Wzo=;
 b=GtgTQN2oDlV0PMA/FiADS5r9Q2gEr6hWpP+OdXOaUZLuBR79H3K67A+7eyf0MJ2rV6Im3eNf1
 lQyHBYpYetibF7aeXiONg7N2mQrNVKlkyIeqx+qPgn2RvH9x4Tz02Fp4YZz8TszDgup3wJVjgze
 0SRTH6LeFliQqP2tORTBO5LizKEQHUtnsoQCwJvoxqu5BF9mWZYCsrwEdXa86PFsOXt6gJ5YEMB
 UgVM/ZWmAGwAlKVCZk5nMcjHidrcB55d60nHk6kXhjLSBAE47loTpRl3FUl9uIcheBCeIxjQf8c
 Hi/XIb71882bOGkUkAgwfzQGmuFAXG+RiX5XHT1+OwRw==
X-Forward-Email-ID: 67ca07ecdeafcb1458af9261
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.59
X-Forward-Email-Version: 0.4.40
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Jonas Karlman <jonas@kwiboo.se>
To: Heiko Stuebner <heiko@sntech.de>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Wadim Egorov <w.egorov@phytec.de>
Date: Thu,  6 Mar 2025 20:38:52 +0000
Message-ID: <20250306203858.1677595-2-jonas@kwiboo.se>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250306203858.1677595-1-jonas@kwiboo.se>
References: <20250306203858.1677595-1-jonas@kwiboo.se>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 07 Mar 2025 07:05:06 +0000
Cc: Jonas Karlman <jonas@kwiboo.se>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 1/3] net: stmmac: dwmac-rk: Use DELAY_ENABLE
	macro for RK3328
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

Support for Rockchip RK3328 GMAC and addition of the DELAY_ENABLE macro
was merged in the same merge window. This resulted in RK3328 not being
converted to use the new DELAY_ENABLE macro.

Change to use the DELAY_ENABLE macro to help disable MAC delay when
RGMII_ID/RXID/TXID is used.

Fixes: eaf70ad14cbb ("net: stmmac: dwmac-rk: Add handling for RGMII_ID/RXID/TXID")
Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
index 003fa5cf42c3..297fa93e4a39 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
@@ -593,8 +593,7 @@ static void rk3328_set_to_rgmii(struct rk_priv_data *bsp_priv,
 	regmap_write(bsp_priv->grf, RK3328_GRF_MAC_CON1,
 		     RK3328_GMAC_PHY_INTF_SEL_RGMII |
 		     RK3328_GMAC_RMII_MODE_CLR |
-		     RK3328_GMAC_RXCLK_DLY_ENABLE |
-		     RK3328_GMAC_TXCLK_DLY_ENABLE);
+		     DELAY_ENABLE(RK3328, tx_delay, rx_delay));
 
 	regmap_write(bsp_priv->grf, RK3328_GRF_MAC_CON0,
 		     RK3328_GMAC_CLK_RX_DL_CFG(rx_delay) |
-- 
2.48.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
