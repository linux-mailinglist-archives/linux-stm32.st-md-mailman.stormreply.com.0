Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 18EF6B3B699
	for <lists+linux-stm32@lfdr.de>; Fri, 29 Aug 2025 11:02:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7BB26C36B2E;
	Fri, 29 Aug 2025 09:02:40 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D08FCC36B2C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 29 Aug 2025 09:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vy6YAO+9ijcxerFDApcAmJBpLGwTnAOTEL8tEqUKCDY=; b=PcS1jOtT0ZJ4xMvfp+zOSTYqCp
 vXHpAITooj7Uecu9PRmfUiscGy4obgyJDi6Ckjaw9QDqVE3qDTvxx19yyeKKKqVIKkrG80iPNiPxs
 rJs4uqt4gvLlEOf8CST/78rry+iP0JMSqFbwveXH+/eWGNKycl5kLZBlssJeni0rxWCCBI/nOfmZ8
 ivOR0uHoFMGc1MciGs9FhRlGqxFlEj130/WNyJGXDfL59aw/mCDMWMM3bNijRH/IFiodxdLHoxEiI
 a2QTALzZ81kKTtV1HW0hsieE5gfPAJHGzxDabLcQE80qi6nWIPSfP7mzhbO0OToNopp5ZAAupiIz2
 zoaXcwiQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:38032 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <rmk@armlinux.org.uk>) id 1urv0A-000000002Yh-2DaM;
 Fri, 29 Aug 2025 10:02:30 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1urv09-00000000gJ1-3SxO; Fri, 29 Aug 2025 10:02:29 +0100
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1urv09-00000000gJ1-3SxO@rmk-PC.armlinux.org.uk>
Date: Fri, 29 Aug 2025 10:02:29 +0100
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next] net: stmmac: mdio: update runtime PM
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

Commit 3c7826d0b106 ("net: stmmac: Separate C22 and C45 transactions
for xgmac") missed a change that happened in commit e2d0acd40c87
("net: stmmac: using pm_runtime_resume_and_get instead of
pm_runtime_get_sync").

Update the two clause 45 functions that didn't get switched to
pm_runtime_resume_and_get().

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
I don't have any way to test this on real hardware as the Jetson Xavier
NX doesn't have a C45 PHY.

 drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
index da4542be756a..0a302b711bc2 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
@@ -303,11 +303,9 @@ static int stmmac_mdio_read_c45(struct mii_bus *bus, int phyaddr, int devad,
 	u32 value = MII_BUSY;
 	int data = 0;
 
-	data = pm_runtime_get_sync(priv->device);
-	if (data < 0) {
-		pm_runtime_put_noidle(priv->device);
+	data = pm_runtime_resume_and_get(priv->device);
+	if (data < 0)
 		return data;
-	}
 
 	value |= (phyaddr << priv->hw->mii.addr_shift)
 		& priv->hw->mii.addr_mask;
@@ -399,11 +397,9 @@ static int stmmac_mdio_write_c45(struct mii_bus *bus, int phyaddr,
 	int ret, data = phydata;
 	u32 value = MII_BUSY;
 
-	ret = pm_runtime_get_sync(priv->device);
-	if (ret < 0) {
-		pm_runtime_put_noidle(priv->device);
+	ret = pm_runtime_resume_and_get(priv->device);
+	if (ret < 0)
 		return ret;
-	}
 
 	value |= (phyaddr << priv->hw->mii.addr_shift)
 		& priv->hw->mii.addr_mask;
-- 
2.47.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
