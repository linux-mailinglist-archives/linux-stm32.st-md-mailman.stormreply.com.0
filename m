Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E78A945C46
	for <lists+linux-stm32@lfdr.de>; Fri,  2 Aug 2024 12:47:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 43C38C7129D;
	Fri,  2 Aug 2024 10:47:16 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CD6E2C57194
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 Aug 2024 10:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rikXu0t2tLqao+iuwW+8gc88e95JwdCZibSBDQw7Iz4=; b=Rj8goWRMMBHUjN28k4D2RXfQiA
 jVLOnl7V7m2LOcDsMe3ZkCdfJICFeNOR9ahc7UPv71NZqtqAnPbaJ11wIeNEKjysqPhnsH+tIq/BE
 qK658Zp7exY/cWZwTm9Qp+Uazfsx9md6ttWK42LJT4C3FStSusqnxXpjPpq3q+rM0ZtspZ1FUkAsb
 my56WURKbErm5PsN5GRUJWp9w86i0AbSbYWT3jtt1ZZf68n/Gv8eGJ6FJ9/JWfLjkApfiJoYTas3u
 4avIQNgWaQQvg8cvaZ6/cs972+9fTPfOAs494kYs5zsurnLBU5s573X9DyY9TdtEpylmZ02hGmLpO
 6L/SQCnQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:58546 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rmk@armlinux.org.uk>) id 1sZpnl-0006Dp-2w;
 Fri, 02 Aug 2024 11:46:26 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1sZpnq-000eGq-U0; Fri, 02 Aug 2024 11:46:30 +0100
In-Reply-To: <Zqy4wY0Of8noDqxt@shell.armlinux.org.uk>
References: <Zqy4wY0Of8noDqxt@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Serge Semin <fancer.lancer@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1sZpnq-000eGq-U0@rmk-PC.armlinux.org.uk>
Date: Fri, 02 Aug 2024 11:46:30 +0100
Cc: Vinod Koul <vkoul@kernel.org>, Jesper Dangaard Brouer <hawk@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 John Fastabend <john.fastabend@gmail.com>, Alexei Starovoitov <ast@kernel.org>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, bpf@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Andrew Halaney <ahalaney@redhat.com>
Subject: [Linux-stm32] [PATCH net-next 01/14] net: stmmac: qcom-ethqos: add
 ethqos_pcs_set_inband()
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

Add ethqos_pcs_set_inband() to improve readability, and to allow future
changes when phylink PCS support is properly merged.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 901a3c1959fa..092b053dd8da 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -636,6 +636,11 @@ static void ethqos_set_serdes_speed(struct qcom_ethqos *ethqos, int speed)
 	}
 }
 
+static void ethqos_pcs_set_inband(struct stmmac_priv *priv, bool enable)
+{
+	stmmac_pcs_ctrl_ane(priv, priv->ioaddr, enable, 0, 0);
+}
+
 /* On interface toggle MAC registers gets reset.
  * Configure MAC block for SGMII on ethernet phy link up
  */
@@ -654,7 +659,7 @@ static int ethqos_configure_sgmii(struct qcom_ethqos *ethqos)
 			      RGMII_CONFIG2_RGMII_CLK_SEL_CFG,
 			      RGMII_IO_MACRO_CONFIG2);
 		ethqos_set_serdes_speed(ethqos, SPEED_2500);
-		stmmac_pcs_ctrl_ane(priv, priv->ioaddr, 0, 0, 0);
+		ethqos_pcs_set_inband(priv, false);
 		break;
 	case SPEED_1000:
 		val &= ~ETHQOS_MAC_CTRL_PORT_SEL;
@@ -662,12 +667,12 @@ static int ethqos_configure_sgmii(struct qcom_ethqos *ethqos)
 			      RGMII_CONFIG2_RGMII_CLK_SEL_CFG,
 			      RGMII_IO_MACRO_CONFIG2);
 		ethqos_set_serdes_speed(ethqos, SPEED_1000);
-		stmmac_pcs_ctrl_ane(priv, priv->ioaddr, 1, 0, 0);
+		ethqos_pcs_set_inband(priv, true);
 		break;
 	case SPEED_100:
 		val |= ETHQOS_MAC_CTRL_PORT_SEL | ETHQOS_MAC_CTRL_SPEED_MODE;
 		ethqos_set_serdes_speed(ethqos, SPEED_1000);
-		stmmac_pcs_ctrl_ane(priv, priv->ioaddr, 1, 0, 0);
+		ethqos_pcs_set_inband(priv, true);
 		break;
 	case SPEED_10:
 		val |= ETHQOS_MAC_CTRL_PORT_SEL;
@@ -677,7 +682,7 @@ static int ethqos_configure_sgmii(struct qcom_ethqos *ethqos)
 					 SGMII_10M_RX_CLK_DVDR),
 			      RGMII_IO_MACRO_CONFIG);
 		ethqos_set_serdes_speed(ethqos, SPEED_1000);
-		stmmac_pcs_ctrl_ane(priv, priv->ioaddr, 1, 0, 0);
+		ethqos_pcs_set_inband(priv, true);
 		break;
 	}
 
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
