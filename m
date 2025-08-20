Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EF0EFB2DF5C
	for <lists+linux-stm32@lfdr.de>; Wed, 20 Aug 2025 16:31:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 75312C349C6;
	Wed, 20 Aug 2025 14:31:36 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EE912C36B2D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 20 Aug 2025 14:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tfEpnPPX806gGAT1vDmLicnTjJZMCA1iEnGz+aQZSNc=; b=gsLXXZKTmzn67jwPEK8Sj0SaAV
 MFte2Pv70kKISWgw+gC5shRJmuqEoheNHGzwps+3LkNUwZe7tUxTyGCWQx483tOkmQvTyZL41NEZY
 jYyQF7bTKypZTIB9aTguBQmXlCdqt7yVqqMcOjqR7PRcMgClxd4ISdsSi0NdAtwqTMG4G65T0C4xD
 YcPoylgT6L6dQdkUuKHdURzNhWXNjWKWXwwSKe2toulViTjxUX4kfWWZtiKVA0bPAt6+S0NhDmFXZ
 YJFPj44hEorc/g3COAkzy4DXIDfmHo7Yj03BkMUQYGDg73bQs2Rd8i+fQdARMb81xRg7bcnHPt1tP
 ZyrlHlgA==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:45032 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rmk@armlinux.org.uk>) id 1uojqW-0004sM-1c;
 Wed, 20 Aug 2025 15:31:25 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1uojpo-00BMoL-4W; Wed, 20 Aug 2025 15:30:40 +0100
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1uojpo-00BMoL-4W@rmk-PC.armlinux.org.uk>
Date: Wed, 20 Aug 2025 15:30:40 +0100
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next] net: stmmac: fix
	stmmac_simple_pm_ops build errors
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

The kernel test robot reports that various drivers have an undefined
reference to stmmac_simple_pm_ops. This is caused by
EXPORT_SYMBOL_GPL_SIMPLE_DEV_PM_OPS() defining the struct as static
and omitting the export when CONFIG_PM=n, unlike DEFINE_SIMPLE_PM_OPS()
which still defines the struct non-static.

Switch to using DEFINE_SIMPLE_PM_OPS() + EXPORT_SYMBOL_GPL(), which
means we always define stmmac_simple_pm_ops, and it will always be
visible for dwmac-* to reference whether modular or built-in.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202508132051.a7hJXkrd-lkp@intel.com/
Closes: https://lore.kernel.org/oe-kbuild-all/202508132158.dEwQdick-lkp@intel.com/
Closes: https://lore.kernel.org/oe-kbuild-all/202508140029.V6tDuUxc-lkp@intel.com/
Closes: https://lore.kernel.org/oe-kbuild-all/202508161406.RwQuZBkA-lkp@intel.com/
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index a55e43804670..fa3d26c28502 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -8024,8 +8024,9 @@ int stmmac_resume(struct device *dev)
 }
 EXPORT_SYMBOL_GPL(stmmac_resume);
 
-EXPORT_GPL_SIMPLE_DEV_PM_OPS(stmmac_simple_pm_ops, stmmac_suspend,
-			     stmmac_resume);
+/* This is not the same as EXPORT_GPL_SIMPLE_DEV_PM_OPS() when CONFIG_PM=n */
+DEFINE_SIMPLE_DEV_PM_OPS(stmmac_simple_pm_ops, stmmac_suspend, stmmac_resume);
+EXPORT_SYMBOL_GPL(stmmac_simple_pm_ops);
 
 #ifndef MODULE
 static int __init stmmac_cmdline_opt(char *str)
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
