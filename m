Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0115DA12CD5
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Jan 2025 21:42:58 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C0346C78F74;
	Wed, 15 Jan 2025 20:42:57 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 312A2C6DD6B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Jan 2025 20:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OZcXDFelwtfpcW3nqfH6VfMWYnTJDhzteJIFMDC1ehI=; b=g951auMiFMfH/LnUUNxnYBs3ko
 sofqGj03ShM228yfHBmAUeB0i2qqTcLp4/WARfFdwTR115QZvCjP6iTK/n3QLbPr2lfGZFGlYy5kf
 71sk5AlI4B1MXm/MfPJFJBsmuo8pJXEFiSLxpEjm1GccVHBpAwAOsNtG4xcyM2l3DSmmjH7paieVM
 JrnG1EksUuYSODjivzoeE5ZDVcOE1RIpwp45Crqe6/pWyEgROWXcPDyfYogVgjzHXFPch6rHJcfVM
 SC9SLKmXRcmKtN1tHjI0Gi29yuVD8I935PWWRu1XSdbZuUk492otTuCSHLuhksjaZkW6Z/qHndklp
 7Nwg/qEA==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:54724 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rmk@armlinux.org.uk>) id 1tYADz-0001iQ-1L;
 Wed, 15 Jan 2025 20:42:51 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1tYADg-0014Pb-AJ; Wed, 15 Jan 2025 20:42:32 +0000
In-Reply-To: <Z4gdtOaGsBhQCZXn@shell.armlinux.org.uk>
References: <Z4gdtOaGsBhQCZXn@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1tYADg-0014Pb-AJ@rmk-PC.armlinux.org.uk>
Date: Wed, 15 Jan 2025 20:42:32 +0000
Cc: Marcin Wojtas <marcin.s.wojtas@gmail.com>, UNGLinuxDriver@microchip.com,
 Bryan Whitehead <bryan.whitehead@microchip.com>,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 2/9] net: phy: add support for
 querying PHY clock stop capability
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

Add support for querying whether the PHY allows the transmit xMII clock
to be stopped while in LPI mode. This will be used by phylink to pass
to the MAC driver so it can configure the generation of the xMII clock
appropriately.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/phy/phy.c | 20 ++++++++++++++++++++
 include/linux/phy.h   |  1 +
 2 files changed, 21 insertions(+)

diff --git a/drivers/net/phy/phy.c b/drivers/net/phy/phy.c
index c008fe050245..d0c1718e2b16 100644
--- a/drivers/net/phy/phy.c
+++ b/drivers/net/phy/phy.c
@@ -1703,6 +1703,26 @@ void phy_mac_interrupt(struct phy_device *phydev)
 }
 EXPORT_SYMBOL(phy_mac_interrupt);
 
+/**
+ * phy_eee_tx_clock_stop_capable() - indicate whether the MAC can stop tx clock
+ * @phydev: target phy_device struct
+ *
+ * Indicate whether the MAC can disable the transmit xMII clock while in LPI
+ * state. Returns 1 if the MAC may stop the transmit clock, 0 if the MAC must
+ * not stop the transmit clock, or negative error.
+ */
+int phy_eee_tx_clock_stop_capable(struct phy_device *phydev)
+{
+	int stat1;
+
+	stat1 = phy_read_mmd(phydev, MDIO_MMD_PCS, MDIO_STAT1);
+	if (stat1 < 0)
+		return stat1;
+
+	return !!(stat1 & MDIO_PCS_STAT1_CLKSTOP_CAP);
+}
+EXPORT_SYMBOL_GPL(phy_eee_tx_clock_stop_capable);
+
 /**
  * phy_eee_rx_clock_stop() - configure PHY receive clock in LPI
  * @phydev: target phy_device struct
diff --git a/include/linux/phy.h b/include/linux/phy.h
index afaae74d0949..244f747b3cd9 100644
--- a/include/linux/phy.h
+++ b/include/linux/phy.h
@@ -2146,6 +2146,7 @@ int phy_unregister_fixup(const char *bus_id, u32 phy_uid, u32 phy_uid_mask);
 int phy_unregister_fixup_for_id(const char *bus_id);
 int phy_unregister_fixup_for_uid(u32 phy_uid, u32 phy_uid_mask);
 
+int phy_eee_tx_clock_stop_capable(struct phy_device *phydev);
 int phy_eee_rx_clock_stop(struct phy_device *phydev, bool clk_stop_enable);
 int phy_init_eee(struct phy_device *phydev, bool clk_stop_enable);
 int phy_get_eee_err(struct phy_device *phydev);
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
