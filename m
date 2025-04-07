Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D6925A7EAB7
	for <lists+linux-stm32@lfdr.de>; Mon,  7 Apr 2025 20:39:24 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 96D6AC78F97;
	Mon,  7 Apr 2025 18:39:24 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2D7A4C7128A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  7 Apr 2025 18:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7+k8l60Jz29isMjvUltmDyPcIdk3zSjT5fRqSkqwuVw=; b=K/UowfzxYQzkpVrgomY9rjzdDV
 T79PoPiBig959UMX8og4dwts15l/1eYRDGbcp4rIDvuMpRvxmwAsbdgpFn/kL8Z6xhdBkF75pvzH6
 H00/A7+UFsdLNgTKd9tFOddhujUtTecGImGg6fjBYmRH6kHAt6XwMSbLvjETsPnckUa1u+zddznYg
 A2ISIpTHuAw28s+81sxwzBZ7P+mLLZluDhgLBVrUffUeyLLD3sFLOBRWRv2JzDYiSAFS27PGs5fNz
 nggsl0uoHbAf1aI4c2/TqJdw2ybpJOlSrJp3cCk4Ig+dT8ptr7B2DvZGCnMcFj4vf2/znABsGSRAT
 VGv37MlQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:47490 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rmk@armlinux.org.uk>) id 1u1rNM-0005re-2S;
 Mon, 07 Apr 2025 19:39:16 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1u1rMq-0013OH-PI; Mon, 07 Apr 2025 19:38:44 +0100
In-Reply-To: <Z_Qbw0tZ2ktgBf7c@shell.armlinux.org.uk>
References: <Z_Qbw0tZ2ktgBf7c@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1u1rMq-0013OH-PI@rmk-PC.armlinux.org.uk>
Date: Mon, 07 Apr 2025 19:38:44 +0100
Cc: Thierry Reding <treding@nvidia.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Jon Hunter <jonathanh@nvidia.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Prabhakar <prabhakar.csengg@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 1/2] net: stmmac: provide
	stmmac_pltfr_find_clk()
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

Provide a generic way to find a clock in the bulk data.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c | 11 +++++++++++
 drivers/net/ethernet/stmicro/stmmac/stmmac_platform.h |  3 +++
 2 files changed, 14 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
index c73eff6a56b8..43c869f64c39 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
@@ -709,6 +709,17 @@ devm_stmmac_probe_config_dt(struct platform_device *pdev, u8 *mac)
 #endif /* CONFIG_OF */
 EXPORT_SYMBOL_GPL(devm_stmmac_probe_config_dt);
 
+struct clk *stmmac_pltfr_find_clk(struct plat_stmmacenet_data *plat_dat,
+				  const char *name)
+{
+	for (int i = 0; i < plat_dat->num_clks; i++)
+		if (strcmp(plat_dat->clks[i].id, name) == 0)
+			return plat_dat->clks[i].clk;
+
+	return NULL;
+}
+EXPORT_SYMBOL_GPL(stmmac_pltfr_find_clk);
+
 int stmmac_get_platform_resources(struct platform_device *pdev,
 				  struct stmmac_resources *stmmac_res)
 {
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.h b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.h
index 72dc1a32e46d..6e6561e29d6e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.h
@@ -14,6 +14,9 @@
 struct plat_stmmacenet_data *
 devm_stmmac_probe_config_dt(struct platform_device *pdev, u8 *mac);
 
+struct clk *stmmac_pltfr_find_clk(struct plat_stmmacenet_data *plat_dat,
+				  const char *name);
+
 int stmmac_get_platform_resources(struct platform_device *pdev,
 				  struct stmmac_resources *stmmac_res);
 
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
