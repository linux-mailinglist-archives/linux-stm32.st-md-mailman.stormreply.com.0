Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 97EB5B58B27
	for <lists+linux-stm32@lfdr.de>; Tue, 16 Sep 2025 03:28:42 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E9C0CC32EB0;
	Tue, 16 Sep 2025 01:28:41 +0000 (UTC)
Received: from smtpbguseast3.qq.com (smtpbguseast3.qq.com [54.243.244.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3A93BC349C6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Sep 2025 01:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
 s=altu2504; t=1757986002;
 bh=r40/9/byFQ5Kdho5bSZgFzvBLnr6GNZb9hi7qVjYjLk=;
 h=From:To:Subject:Date:Message-ID:MIME-Version;
 b=J98MyLcbMRG94NEiVPEjeSXACyzHlGMhioQe+AoZz+U5Pl5VQ3tvrizeCPZchXSH0
 d2rMdEy5H/PcgpFTo13OzEfrZ4GonSnL1tUb0wvZGI64BXUf/kaItCe4zy6dRa1XJM
 oVipO6zCRqLqhivuCR8IJ8o6LMSpaqpg8K/p6Q98=
X-QQ-mid: esmtpgz16t1757985994tb691f01f
X-QQ-Originating-IP: 9WqvNV5m81o9OAQGGCKKLjLtxMwpN1LWrrj43UnBIq8=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Tue, 16 Sep 2025 09:26:31 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 13026834714890684059
From: Chaoyi Chen <kernel@airkyi.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Jonas Karlman <jonas@kwiboo.se>, David Wu <david.wu@rock-chips.com>
Date: Tue, 16 Sep 2025 09:26:28 +0800
Message-ID: <0A3F1D1604FEE424+20250916012628.1819-1-kernel@airkyi.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:airkyi.com:qybglogicsvrsz:qybglogicsvrsz4a-0
X-QQ-XMAILINFO: NpSUeF22LnzDaMKYiEuFqevqeK1MYzf4iSkkCu3fQqOjrNgyfGsywGra
 GMwsWfxhO5M0UlGrG374jH3Xa17Hadfevx69JtfBFyquyr68EHvK2gqjtNyOyGoN5N/9Ypm
 kv2vOCH1CMFRpEpIgjYRQ4sSB5udtTSTunJKOV7T8qxujPtCch7tkg2wkeh3aY97izqA7zs
 fNXf6auP3iTDII0WIJKE9Vltww++i4bLigltiLAncAP7lsgqPay9ChFGa2sxFMpXFSxkRUY
 IwLGia11ARql5Ns2AvaY2uG+nPJpXN/KnzHaVl2+I5OI0r6qtg7kXLjJN1i0dPSHDedKhUd
 T+PdR1TWVAMpVmesdSinSeyyZDWVmffXSDAgV88zwpKYQ8Gq6yuQr+VyVwoSM8+h96Tm+z+
 2KutP7P6l+B5dU/6fULMPT4BnM+MQr7iNsYP19RJm79bjmiepNqfxbjs6b21AsjrcnsLrnJ
 EAKuVCXTj5X7ze5uXsIQBXeYa2SDOSrXiUEFiE50dqj5xOV9znX4FbpLeCNQXvnFBkRelAB
 FsVObfsXPkF0WkkL+619MIYdebgIOFIBx3c2t5Xe2VjtDokOc4Xitf2eprN8YvgcVULfnLa
 OlnhGfIoX2E9URDE+Lrbj7S/f8plgVl/ok2vV/W0LOcD3WCS3S3ez6xM0rfr2A/QCpPuBex
 8XGoTFjaDSUilnJkOizFTOeG2SavuAvNPlzPjAB0DYksyIVmUE9Om69N8nL9S0zyVez7No1
 XQU4G9/uczKgpSlwBVZqiM2LIaucy41R4WKSeefH/4j+mu1JCf+n2horpNVZCsaNmG3QQWC
 zo5Bu9MIFGZxBHe3foojnFqdZ02SDzWGyEdxAcdwwNmhG6SfD5zwaND74VHf5UzjvZpFty+
 AhYAiM9/If3Q55L+HCWcd5BbrrCEb9ZMzW8zlvJ0wcflYp8sT3LiBQwYwAx4fDtI4IdkAys
 xRiJLq952WEZ+uDHpDt5/KlbJma6R/bcVeWasD1XDg7yJeg==
X-QQ-XMRINFO: OWPUhxQsoeAVDbp3OJHYyFg=
X-QQ-RECHKSPAM: 0
Cc: ziyao@disroot.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 sebastian.reichel@collabora.com, linux-rockchip@lists.infradead.org,
 Chaoyi Chen <chaoyi.chen@rock-chips.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next] Revert "net: ethernet: stmmac:
	dwmac-rk: Make the clk_phy could be used for external phy"
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

From: Chaoyi Chen <chaoyi.chen@rock-chips.com>

This reverts commit da114122b83149d1f1db0586b1d67947b651aa20.

As discussed, the PHY clock should be managed by PHY driver instead
of other driver like dwmac-rk.

Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
index 266c53379236..49f92cd79aa8 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
@@ -1410,15 +1410,12 @@ static int rk_gmac_clk_init(struct plat_stmmacenet_data *plat)
 		clk_set_rate(plat->stmmac_clk, 50000000);
 	}
 
-	if (plat->phy_node) {
+	if (plat->phy_node && bsp_priv->integrated_phy) {
 		bsp_priv->clk_phy = of_clk_get(plat->phy_node, 0);
 		ret = PTR_ERR_OR_ZERO(bsp_priv->clk_phy);
-		/* If it is not integrated_phy, clk_phy is optional */
-		if (bsp_priv->integrated_phy) {
-			if (ret)
-				return dev_err_probe(dev, ret, "Cannot get PHY clock\n");
-			clk_set_rate(bsp_priv->clk_phy, 50000000);
-		}
+		if (ret)
+			return dev_err_probe(dev, ret, "Cannot get PHY clock\n");
+		clk_set_rate(bsp_priv->clk_phy, 50000000);
 	}
 
 	return 0;
-- 
2.49.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
