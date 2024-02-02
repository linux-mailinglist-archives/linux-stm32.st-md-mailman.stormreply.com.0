Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D9FE8846BFE
	for <lists+linux-stm32@lfdr.de>; Fri,  2 Feb 2024 10:33:44 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8DDBCC6DD9F;
	Fri,  2 Feb 2024 09:33:44 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 76011C6C820
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 Feb 2024 09:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
 Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=H88J5TUA4kjzKrM8edavWO7CzzGR5hnVTyCFR8jMm6M=; b=o9aTOCOtnDglVLzDJl90mCnXEN
 icDDEyJnZAKHU6F6Z0n7hw86O6lijLfhhn0Der1BSHRrKuL1iag/1Rcvb2iAelSvuSy18iq4wysbt
 7J2+B1pjzUtSvlAU9LFrLIGCyiA7GNdpAQylKRxYWzx5iiYeXxBSvYx8rwbyMnS3A5GgBrT+6APE7
 u0uXNPrqs4RmJGLmUp4Zdfkgjz4Ln8JZTMVsZvWlwL8pRAvd8l/lmITm4OT09Eyf6UmhIoXSRp7m9
 VF7nPSWlXvhS/SllW+bgXY4iiOuuUda6p40zpe0PMdeu75LPf8SWwvUs9mZbOQDyvRGx17oap5uXR
 pMHpZEAg==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:37008)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1rVpvN-0005hy-1I;
 Fri, 02 Feb 2024 09:33:29 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1rVpvE-0008D5-T5; Fri, 02 Feb 2024 09:33:20 +0000
Date: Fri, 2 Feb 2024 09:33:20 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Message-ID: <Zby24IKSgzpvRDNF@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
Cc: Vladimir Oltean <olteanv@gmail.com>, Doug Berger <opendmb@gmail.com>,
 Byungho An <bh74.an@samsung.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Justin Chen <justin.chen@broadcom.com>, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Clark Wang <xiaoning.wang@nxp.com>,
 NXP Linux Team <linux-imx@nxp.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 bcm-kernel-feedback-list@broadcom.com, Shenwei Wang <shenwei.wang@nxp.com>,
 Paolo Abeni <pabeni@redhat.com>, Wei Fang <wei.fang@nxp.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 0/6] net: eee network driver cleanups
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

Hi,

Since commit d1420bb99515 ("net: phy: improve generic EEE ethtool
functions") changed phylib to set eee->eee_active and eee->eee_enabled,
overriding anything that drivers have set these to prior to calling
phy_ethtool_get_eee().

Therefore, drivers setting these members becomes redundant, since
phylib overwrites the values they set. This series finishes off
Heiner's work in the referenced commit by removing these redundant
writes in various drivers and any associated code or structure members
that become unnecessary.

 drivers/net/dsa/b53/b53_common.c                     | 6 ------
 drivers/net/ethernet/broadcom/asp2/bcmasp_ethtool.c  | 4 ----
 drivers/net/ethernet/broadcom/asp2/bcmasp_intf.c     | 5 +++--
 drivers/net/ethernet/broadcom/genet/bcmgenet.c       | 8 +++-----
 drivers/net/ethernet/broadcom/genet/bcmmii.c         | 5 +++--
 drivers/net/ethernet/freescale/fec_main.c            | 3 ---
 drivers/net/ethernet/samsung/sxgbe/sxgbe_common.h    | 1 -
 drivers/net/ethernet/samsung/sxgbe/sxgbe_ethtool.c   | 2 --
 drivers/net/ethernet/samsung/sxgbe/sxgbe_main.c      | 1 -
 drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c | 2 --
 10 files changed, 9 insertions(+), 28 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
