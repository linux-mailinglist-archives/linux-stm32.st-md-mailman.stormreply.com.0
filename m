Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 75C5EBDF068
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Oct 2025 16:28:53 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 398F7C56636;
	Wed, 15 Oct 2025 14:28:53 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8965EC56632
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Oct 2025 14:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=k++NOzDiNb27hLDKjlUMeDDn+u3bsze6iAKn/JJT5GA=; b=f2zkT/aluwKOFxG5BV1+M1aS37
 BAFn2ANdCjKeehxBylnqfVsdmZH5mkC6269wHlSSI2+XluTe7zgOjGSjJBjw3+MNdCdFicjenKUx1
 mS5FrVu+cSiVNy+d7aU2n36GpJN6Jo9RIhe4XnCXkoTsnwLPJVNfpsQON6mDl9a/c/fEHe++EV4qE
 Vk4p/V7PD9D0URzLnPlvyBxdYkv2LtzcgCY1H7hW2nO8FeJukb3ppf/vuhdyt32MEjO5PlzrvcCkx
 bsEullaWVYCLFZ8DF2bsBDYXesUMYF9nafpSf/I0R4jMhkE0/+x67A7GBVPp68TAv/uGxoQ6xv9Y1
 QLgqFTng==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:46532 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <rmk@armlinux.org.uk>) id 1v92NO-000000004hK-3q4i;
 Wed, 15 Oct 2025 15:21:15 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1v92NE-0000000AmHd-15fv; Wed, 15 Oct 2025 15:21:04 +0100
In-Reply-To: <aO-tbQCVu47R3izM@shell.armlinux.org.uk>
References: <aO-tbQCVu47R3izM@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1v92NE-0000000AmHd-15fv@rmk-PC.armlinux.org.uk>
Date: Wed, 15 Oct 2025 15:21:04 +0100
Cc: Song Yoong Siang <yoong.siang.song@intel.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Kees Cook <kees@kernel.org>,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 Faizal Rahim <faizal.abdul.rahim@linux.intel.com>,
 Swathi K S <swathi.ks@samsung.com>, Eric Dumazet <edumazet@google.com>,
 Jisheng Zhang <jszhang@kernel.org>, Simon Horman <horms@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, Furong Xu <0x1207@gmail.com>,
 Oleksij Rempel <o.rempel@pengutronix.de>, Shenwei Wang <shenwei.wang@nxp.com>,
 Abhishek Chauhan <quic_abchauha@quicinc.com>,
 Jacob Keller <jacob.e.keller@intel.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Tiezhu Yang <yangtiezhu@loongson.cn>,
 Daniel Machon <daniel.machon@microchip.com>,
 Ley Foon Tan <leyfoon.tan@starfivetech.com>, linux-arm-msm@vger.kernel.org,
 "Jan Petrous \(OSS\)" <jan.petrous@oss.nxp.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Choong Yong Liang <yong.liang.choong@linux.intel.com>,
 Alexis Lothore <alexis.lothore@bootlin.com>,
 Drew Fustini <dfustini@tenstorrent.com>, linux-arm-kernel@lists.infradead.org,
 Rohan G Thomas <rohan.g.thomas@altera.com>,
 Vladimir Oltean <olteanv@gmail.com>, Inochi Amaoto <inochiama@gmail.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Vinod Koul <vkoul@kernel.org>,
 Boon Khai Ng <boon.khai.ng@altera.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Michal Swiatkowski <michal.swiatkowski@linux.intel.com>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 Matthew Gerlach <matthew.gerlach@altera.com>,
 "David S. Miller" <davem@davemloft.net>, Yu-Chun Lin <eleanor15x@gmail.com>
Subject: [Linux-stm32] [PATCH net-next 13/14] net: stmmac: provide PCS
	initialisation hook
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

dwmac cores provide a feature bit to indicate when the PCS block is
present, but features are only read after the core's setup() function
has been called, meaning we can't decide whether to initialise the
integrated PCS in the setup function. Provide a new MAC core hook
for PCS initialisation, which will be called after the feature
registers have been read.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/hwif.h        | 4 ++++
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 7 +++++++
 2 files changed, 11 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.h b/drivers/net/ethernet/stmicro/stmmac/hwif.h
index 7796f5f3c96f..82cfb6bec334 100644
--- a/drivers/net/ethernet/stmicro/stmmac/hwif.h
+++ b/drivers/net/ethernet/stmicro/stmmac/hwif.h
@@ -313,6 +313,8 @@ enum stmmac_lpi_mode {
 
 /* Helpers to program the MAC core */
 struct stmmac_ops {
+	/* Initialise any PCS instances */
+	int (*pcs_init)(struct stmmac_priv *priv);
 	/* MAC core initialization */
 	void (*core_init)(struct mac_device_info *hw, struct net_device *dev);
 	/* Update MAC capabilities */
@@ -413,6 +415,8 @@ struct stmmac_ops {
 					u32 pclass);
 };
 
+#define stmmac_mac_pcs_init(__priv) \
+	stmmac_do_callback(__priv, mac, pcs_init, __priv)
 #define stmmac_core_init(__priv, __args...) \
 	stmmac_do_void_callback(__priv, mac, core_init, __args)
 #define stmmac_mac_update_caps(__priv) \
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index c3633baf5180..35cd881b3496 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -7238,6 +7238,13 @@ static int stmmac_hw_init(struct stmmac_priv *priv)
 			 "Enable RX Mitigation via HW Watchdog Timer\n");
 	}
 
+	/* Unimplemented PCS init (as indicated by stmmac_do_callback()
+	 * perversely returning -EINVAL) is non-fatal.
+	 */
+	ret = stmmac_mac_pcs_init(priv);
+	if (ret != -EINVAL)
+		return ret;
+
 	return 0;
 }
 
-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
