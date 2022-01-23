Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 677DA497998
	for <lists+linux-stm32@lfdr.de>; Mon, 24 Jan 2022 08:40:44 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 05A5AC6046D;
	Mon, 24 Jan 2022 07:40:44 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 48085C5AB61
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 23 Jan 2022 14:20:23 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 7CDB9B80B28;
 Sun, 23 Jan 2022 14:20:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 987CDC340E2;
 Sun, 23 Jan 2022 14:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642947621;
 bh=sPP73J14sFJ1BrFw8EftFhDZ6LJsU6ER5loSACvyBtQ=;
 h=From:To:Cc:Subject:Date:From;
 b=jCbKhn6d320AUbUEPCXhhjj8Z3b3TV9nET3CToXH9Tbja6BPdXmzbEca+a1yWx5po
 b2J2LfWrTphyL5/zBQ01js7LOnbgABtvmjPddfvDHj1D7lGUw1v5Ca5xLfIEn6fkeb
 eSn2nYVRvIhB00/5guw866QakBpzFXczU5HIQCjWxN8VV4MT4IIXgIgAEcfIJHOyfO
 ixCtFTh0ir2onzZN7i/UsGpp/Vq21VXjE09/Q/KN3d64aVIQiIQek05+xZk1OjZcK2
 Ly9+8so5Y2WSAZaq+aMUhqYB/LrX2/4lCdEpfliXxjKLdRNz5XRZ2GcoHdYX/jfh/z
 PJ5Wi8Sj7/3ZQ==
From: Jisheng Zhang <jszhang@kernel.org>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Date: Sun, 23 Jan 2022 22:12:45 +0800
Message-Id: <20220123141245.1060-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 24 Jan 2022 07:40:41 +0000
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH] net: stmmac: don't stop RXC during LPI
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

I met can't receive rx pkt issue with below steps:
0.plug in ethernet cable then boot normal and get ip from dhcp server
1.quickly hotplug out then hotplug in the ethernet cable
2.trigger the dhcp client to renew lease

tcpdump shows that the request tx pkt is sent out successfully,
but the mac can't receive the rx pkt.

The issue can easily be reproduced on platforms with PHY_POLL external
phy. If we don't allow the phy to stop the RXC during LPI, the issue
is gone. I think it's unsafe to stop the RXC during LPI because the mac
needs RXC clock to support RX logic.

And the 2nd param clk_stop_enable of phy_init_eee() is a bool, so use
false instead of 0.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 6708ca2aa4f7..92a9b0b226b1 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1162,7 +1162,7 @@ static void stmmac_mac_link_up(struct phylink_config *config,
 
 	stmmac_mac_set(priv, priv->ioaddr, true);
 	if (phy && priv->dma_cap.eee) {
-		priv->eee_active = phy_init_eee(phy, 1) >= 0;
+		priv->eee_active = phy_init_eee(phy, false) >= 0;
 		priv->eee_enabled = stmmac_eee_init(priv);
 		priv->tx_lpi_enabled = priv->eee_enabled;
 		stmmac_set_eee_pls(priv, priv->hw, true);
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
