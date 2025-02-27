Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 62451A48195
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Feb 2025 15:38:14 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 23299C7A849;
	Thu, 27 Feb 2025 14:38:14 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AA46FC01E99
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Feb 2025 14:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=p1D8n6sAJQ7YC/Q50BthGw8wcmOYNk6MxTkRcRqV4ZM=; b=rtYJnuXrIe0AQCnCJTGaP+rbsD
 2pSTyrwH8a81FCamY6OfDZeHuTfe/4E0UBMj/qAeg9m6r00Q0hkXDhkAdwPIRVNUU/47h8G62AS/G
 FLJ9w/VPZ9XE336PNBWVn28tbetb6QvKIn/AJPnH8MmWOOpPy/snEUrpB/e0vvCicRsay2AxTI/eF
 ql1EcppUEMU+IStB7BNwPmEZ1fRkCVyqLK092zIkHVi7UYFagnsIQ8DDeGVk1xto4Ibm0G1FLBCyB
 4fhGDbCQ7ghIRdlfM5wCubpDrcuU+JnNLojCX0HGeU5V9/Hzrx9a7/sdSYEiLRsaTCd2bVcXEkCWh
 acPTN1Kw==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:36794 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rmk@armlinux.org.uk>) id 1tnf1b-0007QA-2x;
 Thu, 27 Feb 2025 14:38:07 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1tnf1H-0056Kz-To; Thu, 27 Feb 2025 14:37:47 +0000
In-Reply-To: <Z8B4tVd4nLUKXdQ4@shell.armlinux.org.uk>
References: <Z8B4tVd4nLUKXdQ4@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1tnf1H-0056Kz-To@rmk-PC.armlinux.org.uk>
Date: Thu, 27 Feb 2025 14:37:47 +0000
Cc: Thierry Reding <treding@nvidia.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Jon Hunter <jonathanh@nvidia.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH RFC net-next 1/5] net: phylink: add config of
 PHY receive clock-stop in phylink_resume()
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

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/phy/phylink.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index a3b186ab3854..0aae0bb2a254 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -2264,7 +2264,7 @@ static int phylink_bringup_phy(struct phylink *pl, struct phy_device *phy,
 	pl->mac_tx_clk_stop = phy_eee_tx_clock_stop_capable(phy) > 0;
 
 	if (pl->mac_supports_eee_ops) {
-		/* Explicitly configure whether the PHY is allowed to stop it's
+		/* Explicitly configure whether the PHY is allowed to stop its
 		 * receive clock.
 		 */
 		ret = phy_eee_rx_clock_stop(phy,
@@ -2645,8 +2645,22 @@ EXPORT_SYMBOL_GPL(phylink_suspend);
  */
 void phylink_resume(struct phylink *pl)
 {
+	int ret;
+
 	ASSERT_RTNL();
 
+	if (pl->mac_supports_eee_ops && pl->phydev) {
+		/* Explicitly configure whether the PHY is allowed to stop its
+		 * receive clock on resume to ensure that it is correctly
+		 * configured.
+		 */
+		ret = phy_eee_rx_clock_stop(pl->phydev,
+					    pl->config->eee_rx_clk_stop_enable);
+		if (ret == -EOPNOTSUPP)
+			phylink_warn(pl, "failed to set rx clock stop: %pe\n",
+				     ERR_PTR(ret));
+	}
+
 	if (test_bit(PHYLINK_DISABLE_MAC_WOL, &pl->phylink_disable_state)) {
 		/* Wake-on-Lan enabled, MAC handling */
 
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
