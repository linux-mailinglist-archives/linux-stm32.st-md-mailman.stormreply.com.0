Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E80E187BDE
	for <lists+linux-stm32@lfdr.de>; Tue, 17 Mar 2020 10:19:15 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 62C23C36B14;
	Tue, 17 Mar 2020 09:19:15 +0000 (UTC)
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com
 [149.117.73.133])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A76D5C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Mar 2020 09:19:12 +0000 (UTC)
Received: from mailhost.synopsys.com (mdc-mailhost1.synopsys.com
 [10.225.0.209])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id A92B640213;
 Tue, 17 Mar 2020 09:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1584436750; bh=4DNEwGa8x0Rtm2b3zdl8zHnej+ACHTHcSd04X1562/c=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:In-Reply-To:
 References:From;
 b=lVaBY62iQU0IwKS7oJaxdNs9A92AfJoD3CP62ZYxVx2FhDpwCSMpOk+qUKsWUmHk2
 pgxLDvvM9CB6oKcan5dOTF9H6ZtdxAz5nwCIOTR7VnR3auqIfL7HP0eT7zdTvNZtKN
 IQjGMIyZMN+5RYsr1aINNPnGC4QMgVeAX9Et3cjhDXSSMpmuaKYzlPrvoKzp8XEsnQ
 b5FXbZ0sfjbY8nVlOR+XnW7tGe5DwgNftfijRaO2FjF55sjyIYDh0w7JOxyAra7UjD
 oenwGZ+K/58dqY5fYpAAuSSkwoIjwCxK+sVbyxzx0mh84zWLz4JBC8ua4pTdH0GsFG
 t9zijbTNkt2/g==
Received: from de02dwia024.internal.synopsys.com
 (de02dwia024.internal.synopsys.com [10.225.19.81])
 by mailhost.synopsys.com (Postfix) with ESMTP id 43E79A0063;
 Tue, 17 Mar 2020 09:19:08 +0000 (UTC)
From: Jose Abreu <Jose.Abreu@synopsys.com>
To: netdev@vger.kernel.org
Date: Tue, 17 Mar 2020 10:18:51 +0100
Message-Id: <e15b19c4d91dcf648a0dcd738ebfe1b327f9c617.1584436401.git.Jose.Abreu@synopsys.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1584436401.git.Jose.Abreu@synopsys.com>
References: <cover.1584436401.git.Jose.Abreu@synopsys.com>
In-Reply-To: <cover.1584436401.git.Jose.Abreu@synopsys.com>
References: <cover.1584436401.git.Jose.Abreu@synopsys.com>
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Andrew Lunn <andrew@lunn.ch>,
 Joao Pinto <Joao.Pinto@synopsys.com>, Russell King <linux@armlinux.org.uk>,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Florian Fainelli <f.fainelli@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: [Linux-stm32] [PATCH net-next 2/4] net: stmmac: Add XLGMII support
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Add XLGMII support for stmmac including the list of speeds and defines
for them.

Signed-off-by: Jose Abreu <Jose.Abreu@synopsys.com>

---
Cc: Giuseppe Cavallaro <peppe.cavallaro@st.com>
Cc: Alexandre Torgue <alexandre.torgue@st.com>
Cc: Jose Abreu <joabreu@synopsys.com>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: netdev@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>
Cc: Florian Fainelli <f.fainelli@gmail.com>
Cc: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Russell King <linux@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/common.h      |  6 +++
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 58 +++++++++++++++++++++++
 2 files changed, 64 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/common.h b/drivers/net/ethernet/stmicro/stmmac/common.h
index 9bdbf589d93f..7fd073144bac 100644
--- a/drivers/net/ethernet/stmicro/stmmac/common.h
+++ b/drivers/net/ethernet/stmicro/stmmac/common.h
@@ -426,6 +426,12 @@ struct mac_link {
 		u32 speed5000;
 		u32 speed10000;
 	} xgmii;
+	struct {
+		u32 speed25000;
+		u32 speed40000;
+		u32 speed50000;
+		u32 speed100000;
+	} xlgmii;
 };
 
 struct mii_regs {
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index f26699d9a050..0e8c80f23557 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -849,6 +849,38 @@ static void stmmac_validate(struct phylink_config *config,
 			phylink_set(mac_supported, 10000baseKX4_Full);
 			phylink_set(mac_supported, 10000baseKR_Full);
 		}
+		if (!max_speed || (max_speed >= 25000)) {
+			phylink_set(mac_supported, 25000baseCR_Full);
+			phylink_set(mac_supported, 25000baseKR_Full);
+			phylink_set(mac_supported, 25000baseSR_Full);
+		}
+		if (!max_speed || (max_speed >= 40000)) {
+			phylink_set(mac_supported, 40000baseKR4_Full);
+			phylink_set(mac_supported, 40000baseCR4_Full);
+			phylink_set(mac_supported, 40000baseSR4_Full);
+			phylink_set(mac_supported, 40000baseLR4_Full);
+		}
+		if (!max_speed || (max_speed >= 50000)) {
+			phylink_set(mac_supported, 50000baseCR2_Full);
+			phylink_set(mac_supported, 50000baseKR2_Full);
+			phylink_set(mac_supported, 50000baseSR2_Full);
+			phylink_set(mac_supported, 50000baseKR_Full);
+			phylink_set(mac_supported, 50000baseSR_Full);
+			phylink_set(mac_supported, 50000baseCR_Full);
+			phylink_set(mac_supported, 50000baseLR_ER_FR_Full);
+			phylink_set(mac_supported, 50000baseDR_Full);
+		}
+		if (!max_speed || (max_speed >= 100000)) {
+			phylink_set(mac_supported, 100000baseKR4_Full);
+			phylink_set(mac_supported, 100000baseSR4_Full);
+			phylink_set(mac_supported, 100000baseCR4_Full);
+			phylink_set(mac_supported, 100000baseLR4_ER4_Full);
+			phylink_set(mac_supported, 100000baseKR2_Full);
+			phylink_set(mac_supported, 100000baseSR2_Full);
+			phylink_set(mac_supported, 100000baseCR2_Full);
+			phylink_set(mac_supported, 100000baseLR2_ER2_FR2_Full);
+			phylink_set(mac_supported, 100000baseDR2_Full);
+		}
 	}
 
 	/* Half-Duplex can only work with single queue */
@@ -929,6 +961,32 @@ static void stmmac_mac_link_up(struct phylink_config *config,
 		default:
 			return;
 		}
+	} else if (interface == PHY_INTERFACE_MODE_XLGMII) {
+		switch (speed) {
+		case SPEED_100000:
+			ctrl |= priv->hw->link.xlgmii.speed100000;
+			break;
+		case SPEED_50000:
+			ctrl |= priv->hw->link.xlgmii.speed50000;
+			break;
+		case SPEED_40000:
+			ctrl |= priv->hw->link.xlgmii.speed40000;
+			break;
+		case SPEED_25000:
+			ctrl |= priv->hw->link.xlgmii.speed25000;
+			break;
+		case SPEED_10000:
+			ctrl |= priv->hw->link.xgmii.speed10000;
+			break;
+		case SPEED_2500:
+			ctrl |= priv->hw->link.speed2500;
+			break;
+		case SPEED_1000:
+			ctrl |= priv->hw->link.speed1000;
+			break;
+		default:
+			return;
+		}
 	} else {
 		switch (speed) {
 		case SPEED_2500:
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
