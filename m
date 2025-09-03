Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 71261B422D9
	for <lists+linux-stm32@lfdr.de>; Wed,  3 Sep 2025 16:01:08 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 34403C3FACF;
	Wed,  3 Sep 2025 14:01:08 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AD982C3FAC9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 Sep 2025 14:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7fWc7bzaE61Z8/ywQrMGqQ4349t+JxTuForfkmFTiNA=; b=oM9HZmfOA3mMTO7LpPvPNh6Cwv
 2KEgKZsSbbdUJCXNXJUr0n//qU1si2xaKv9J6iMmU2OiPRa27fGEeHSHbENfDDiFB1z/MUd3OxbYB
 ssR+R5DcOO7TeasiCVP+Wl8eLzmoeTO5LWZacW6VCSpVPU9s2QE8kY/hCeAc++t19q6kMsmEf6axS
 tfKJ07+6SaHkxt31iSMwfeIChFYCl8bipyQvfii7P9FmKhtA//1ysV0eOJaMAFdJoKxlssVCqQlZT
 aOC5Yw0Ds7eQ83WQbldPEPsye0OYH3KZeotznJQUX/2LDAADVwT76MTytuoABGg7dZAHUecybTc11
 OytQxCvw==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:52700 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <rmk@armlinux.org.uk>) id 1uto2i-000000000c8-3ssX;
 Wed, 03 Sep 2025 15:00:56 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1uto2i-00000001seA-0lxv; Wed, 03 Sep 2025 15:00:56 +0100
In-Reply-To: <aLhJ8Gzb0T2qpXBE@shell.armlinux.org.uk>
References: <aLhJ8Gzb0T2qpXBE@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1uto2i-00000001seA-0lxv@rmk-PC.armlinux.org.uk>
Date: Wed, 03 Sep 2025 15:00:56 +0100
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 2/2] net: stmmac: intel: only
 populate plat->crosststamp when supported
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

To allow the ptp_chardev code to correctly detect whether crosststamps
are supported, we need to conditionally populate the .getcrosststamp()
method. As the previous patch implements that functionality by
detecting whether the platform glue provides a crosststamp() method,
arrange for the dwmac-intel code to only populate this if the X86
ART feature is present, rather than testing for it at runtime in
intel_crosststamp().

This reflects what other x86 PTP clock drivers do, e.g.
ice_ptp_set_funcs_e830(), e1000e_ptp_init(), idpf_ptp_set_caps() etc.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
index d900b93f46ce..e74d00984b88 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
@@ -371,9 +371,6 @@ static int intel_crosststamp(ktime_t *device,
 	u32 acr_value;
 	int i;
 
-	if (!boot_cpu_has(X86_FEATURE_ART))
-		return -EOPNOTSUPP;
-
 	intel_priv = priv->plat->bsp_priv;
 
 	/* Both internal crosstimestamping and external triggered event
@@ -756,7 +753,9 @@ static int intel_mgbe_common_data(struct pci_dev *pdev,
 
 	plat->int_snapshot_num = AUX_SNAPSHOT1;
 
-	plat->crosststamp = intel_crosststamp;
+	if (boot_cpu_has(X86_FEATURE_ART))
+		plat->crosststamp = intel_crosststamp;
+
 	plat->flags &= ~STMMAC_FLAG_INT_SNAPSHOT_EN;
 
 	/* Setup MSI vector offset specific to Intel mGbE controller */
-- 
2.47.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
