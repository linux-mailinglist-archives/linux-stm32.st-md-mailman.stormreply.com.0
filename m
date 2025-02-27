Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 69EFDA48197
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Feb 2025 15:38:21 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 325DBC7A849;
	Thu, 27 Feb 2025 14:38:21 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 68651C01E99
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Feb 2025 14:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4I0f1PHQaAjjm2hMikqLDrqSEQ1EPe1JRRvpJJihO7c=; b=RbDq/Og3xnnNmeI8ijSBQHIQDv
 zfpsWLuMyPmLKtjvbDxrRweXy6wXBx9ZAUAYmSEs3yZegSq7RNrxj748BMMFVVGmuII113WURS30/
 l8OvSXyl/KpBj8A9wWBH18ZFyMS794Zus7mSLsToCCGjN9BGfuUWDp94vEhevuxExLNHWIFj8+dn+
 /VSiRC3wv/6qENtfFRj70Q75QQghb0+S293qbUg4qWCm+8GKFRxjgabHHPc+dXBz3EWHsoHH9Dr/v
 Z5m2yGFqzdb251CWXonPxh398UB2+FMokmrwRbozZLct70qlRsa+cKf10YuIRFFQhkQjSr9BjGZcT
 BQpmhzbw==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:40470 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rmk@armlinux.org.uk>) id 1tnf1h-0007QM-04;
 Thu, 27 Feb 2025 14:38:13 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1tnf1N-0056L5-2X; Thu, 27 Feb 2025 14:37:53 +0000
In-Reply-To: <Z8B4tVd4nLUKXdQ4@shell.armlinux.org.uk>
References: <Z8B4tVd4nLUKXdQ4@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1tnf1N-0056L5-2X@rmk-PC.armlinux.org.uk>
Date: Thu, 27 Feb 2025 14:37:53 +0000
Cc: Thierry Reding <treding@nvidia.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Jon Hunter <jonathanh@nvidia.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH RFC net-next 2/5] net: phylink: add
	phylink_prepare_resume()
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

Add a resume preparation function, which will ensure that the receive
clock from the PHY is appropriately configured while resuming.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/phy/phylink.c | 24 ++++++++++++++++++++++++
 include/linux/phylink.h   |  1 +
 2 files changed, 25 insertions(+)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index 0aae0bb2a254..976e569feb70 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -2636,6 +2636,30 @@ void phylink_suspend(struct phylink *pl, bool mac_wol)
 }
 EXPORT_SYMBOL_GPL(phylink_suspend);
 
+/**
+ * phylink_prepare_resume() - prepare to resume a network device
+ * @pl: a pointer to a &struct phylink returned from phylink_create()
+ *
+ * Optional, thus must be called prior to phylink_resume().
+ *
+ * Prepare to resume a network device, preparing the PHY as necessary.
+ */
+void phylink_prepare_resume(struct phylink *pl)
+{
+	ASSERT_RTNL();
+
+	/* If the MAC requires the receive clock, but receive clock
+	 * stop was enabled at the PHY, we need to ensure that the
+	 * receive clock is running. Disable receive clock stop.
+	 * phylink_resume() will re-enable it if necessary.
+	 */
+	if (pl->mac_supports_eee_ops && pl->phydev &&
+	    pl->config->mac_requires_rxc &&
+	    pl->config->eee_rx_clk_stop_enable)
+		phy_eee_rx_clock_stop(pl->phydev, false);
+}
+EXPORT_SYMBOL_GPL(phylink_prepare_resume);
+
 /**
  * phylink_resume() - handle a network device resume event
  * @pl: a pointer to a &struct phylink returned from phylink_create()
diff --git a/include/linux/phylink.h b/include/linux/phylink.h
index 08df65f6867a..071ed4683c8c 100644
--- a/include/linux/phylink.h
+++ b/include/linux/phylink.h
@@ -699,6 +699,7 @@ void phylink_start(struct phylink *);
 void phylink_stop(struct phylink *);
 
 void phylink_suspend(struct phylink *pl, bool mac_wol);
+void phylink_prepare_resume(struct phylink *pl);
 void phylink_resume(struct phylink *pl);
 
 void phylink_ethtool_get_wol(struct phylink *, struct ethtool_wolinfo *);
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
