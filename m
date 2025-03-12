Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D8B74A5D989
	for <lists+linux-stm32@lfdr.de>; Wed, 12 Mar 2025 10:34:50 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 88965C7802C;
	Wed, 12 Mar 2025 09:34:50 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6679DC6B47E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Mar 2025 09:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
 Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wl6zOR+xtNbThqwqizqyBwsRBu7DaTBch3G1Ngsw9UI=; b=tQy/MXDASRxCbhwMAs0WOjYgC1
 m/A3j6oE1GprwCfkaAzfI5IgKGdHLWDbpQMN9g95HskKLxAUqXz1PwSKfIx+pSxAem9iS3UikdIkw
 65tdgBJZVWX6OxdzbExLxS5xmKk5xBW+dfolr3dfMMjNfSWJyFkU+hphBwtCvTMVJyvaDLqfpfwEz
 FlIxCeOnJSn1Qv09csh21n4tyDvf5ZAX2/pHiNT+YsOQpGRtTYxLzCTUg3iO9MJp1WuKm+f2U1aKM
 Xd8nkGmVayKRDZcv630OeLqrsEgQ42HLC44CN/DFPaedQvI/lIl1PRu0BCIwopVvmVI+YTLq8DlEk
 l4SzR1Ew==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:52664)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1tsITu-0005GN-0y;
 Wed, 12 Mar 2025 09:34:30 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
 (envelope-from <linux@shell.armlinux.org.uk>) id 1tsITk-0004R4-1o;
 Wed, 12 Mar 2025 09:34:20 +0000
Date: Wed, 12 Mar 2025 09:34:20 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Message-ID: <Z9FVHEf3uUqtKzyt@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
Cc: Emil Renner Berthing <kernel@esmil.dk>, Eric Dumazet <edumazet@google.com>,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 Rob Herring <robh@kernel.org>, Alexandre Ghiti <alex@ghiti.fr>,
 Jose Abreu <joabreu@synopsys.com>, Samin Guo <samin.guo@starfivetech.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Minda Chen <minda.chen@starfivetech.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 Conor Dooley <conor@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
Subject: [Linux-stm32] [PATCH net-next v2 0/7] net: stmmac: deprecate "snps,
 en-tx-lpi-clockgating" property
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

On Sun, Mar 09, 2025 at 03:01:45PM +0000, Russell King (Oracle) wrote:
Hi,

This series deprecates the "snps,en-tx-lpi-clockgating" property for
stmmac.

MII Transmit clock gating, where the MAC hardware supports gating this
clock, is a function of the connected PHY capabilities, which it
reports through its status register.

GMAC versions that support transmit clock gating twiddle the LPITCSE
bit accordingly in the LPI control/status register, which is handled
by the GMAC core specific code.

So, "snps,en-tx-lpi-clockgating" not something that is a GMAC property,
but is a work-around for phylib not providing an interface to determine
whether the PHY allows the transmit clock to be disabled.

This series converts the two SoCs that make use of this property (which,
I hasten to add, is set in the SoC code) to use the PHY capability bit
instead of a DT property, then removes the DT property from the .dtsi,
deprecates it in the snps,dwmac binding, and finally in the stmmac code.

I am expecting some discussion on how to merge this, as I think the
order in which these changes is made is important - we don't want to
deprecate the old way until the new code has landed.

Changes in v2:
- Correct Cc list

 Documentation/devicetree/bindings/net/snps,dwmac.yaml |  1 +
 arch/arm/boot/dts/st/stm32mp151.dtsi                  |  1 -
 arch/riscv/boot/dts/starfive/jh7110.dtsi              |  2 --
 drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c  |  1 +
 drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c     |  1 +
 drivers/net/ethernet/stmicro/stmmac/stmmac.h          |  1 +
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c     | 16 ++++++++++++----
 drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c |  5 ++++-
 include/linux/stmmac.h                                |  3 ++-
 9 files changed, 22 insertions(+), 9 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
