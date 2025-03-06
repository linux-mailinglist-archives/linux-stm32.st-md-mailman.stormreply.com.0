Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 67F3FA5616E
	for <lists+linux-stm32@lfdr.de>; Fri,  7 Mar 2025 08:05:09 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 02539C78F9B;
	Fri,  7 Mar 2025 07:05:09 +0000 (UTC)
Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128
 bits)) (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5360FC78F6D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  6 Mar 2025 20:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1741293565; bh=qK3GcAy1T7b7ZQP5vAw6ojWgGkMIfURsR+RxPTcGPYs=;
 b=dOpCFaE/HW4BZDw1+wRTcslAyYkItZ2SiABmkq8gQbdq+TMawFaQQa9N76Q8RKxp5el2gVQcm
 vgsJzIguqLC0TRhVkTrrHvRlyzblsIXDt9+F2WRLS29wCzxMk66qRXhhHMJgcSoZgGRDllAxK01
 lBiq6OqGhiOH+Jw0D+unYM4PdopI068488wvm8kUBWTKsEUGc8fViVGtTDKKC11YIeoW6Hufbfq
 fvArE+nVDTno8YrngLTfe2S5G8Wetg9pn0kq4P0rwix6eyqK5sTAWUe7UyUB4dT0Y6CuFj0YP+/
 dBx6FW+C8nIRbMncmEqmdqm/b4MzTQ/XUIMioChSD5Ww==
X-Forward-Email-ID: 67ca07f4deafcb1458af928b
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
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
 David Wu <david.wu@rock-chips.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu,  6 Mar 2025 20:38:54 +0000
Message-ID: <20250306203858.1677595-4-jonas@kwiboo.se>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250306203858.1677595-1-jonas@kwiboo.se>
References: <20250306203858.1677595-1-jonas@kwiboo.se>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 07 Mar 2025 07:05:06 +0000
Cc: Jonas Karlman <jonas@kwiboo.se>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 3/3] net: stmmac: dwmac-rk: Use DELAY_ENABLE
	macro for RK3588
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

Support for Rockchip RK3588 GMAC was added without use of the
DELAY_ENABLE macro to assist with enable/disable use of MAC rx/tx delay.

Change to use a variant of the DELAY_ENABLE macro to help disable MAC
delay when RGMII_ID/RXID/TXID is used.

Fixes: 2f2b60a0ec28 ("net: ethernet: stmmac: dwmac-rk: Add gmac support for rk3588")
Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
index 37eb86e4e325..79db81d68afd 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
@@ -91,6 +91,10 @@ struct rk_priv_data {
 	(((tx) ? soc##_GMAC_TXCLK_DLY_ENABLE : soc##_GMAC_TXCLK_DLY_DISABLE) | \
 	 ((rx) ? soc##_GMAC_RXCLK_DLY_ENABLE : soc##_GMAC_RXCLK_DLY_DISABLE))
 
+#define DELAY_ENABLE_BY_ID(soc, tx, rx, id) \
+	(((tx) ? soc##_GMAC_TXCLK_DLY_ENABLE(id) : soc##_GMAC_TXCLK_DLY_DISABLE(id)) | \
+	 ((rx) ? soc##_GMAC_RXCLK_DLY_ENABLE(id) : soc##_GMAC_RXCLK_DLY_DISABLE(id)))
+
 #define PX30_GRF_GMAC_CON1		0x0904
 
 /* PX30_GRF_GMAC_CON1 */
@@ -1322,8 +1326,7 @@ static void rk3588_set_to_rgmii(struct rk_priv_data *bsp_priv,
 		     RK3588_GMAC_CLK_RGMII_MODE(id));
 
 	regmap_write(bsp_priv->grf, RK3588_GRF_GMAC_CON7,
-		     RK3588_GMAC_RXCLK_DLY_ENABLE(id) |
-		     RK3588_GMAC_TXCLK_DLY_ENABLE(id));
+		     DELAY_ENABLE_BY_ID(RK3588, tx_delay, rx_delay, id));
 
 	regmap_write(bsp_priv->grf, offset_con,
 		     RK3588_GMAC_CLK_RX_DL_CFG(rx_delay) |
-- 
2.48.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
