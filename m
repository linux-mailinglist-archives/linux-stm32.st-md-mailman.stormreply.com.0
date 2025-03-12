Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DC19A5D999
	for <lists+linux-stm32@lfdr.de>; Wed, 12 Mar 2025 10:35:32 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D8D85C7802C;
	Wed, 12 Mar 2025 09:35:31 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F129AC6B47E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Mar 2025 09:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WlnjW2BpfjiM63UcojgauSdWRDJorCLGfJ2ZQigHONw=; b=X7IJpKnrsZz4mMD/Y0Imd0BscY
 ScXYdYmGGHGxceZABGH59dKp6Op9aD6N+QknONUFwhjdzmLrB1JoE+PsYvugL8vWxnuFbfKUx7XAi
 VEDp3Oc4nYVDL+5TQHgU0c7U6wQHIPi/qVz5A/1YrKHwhemAqcu9zAFG3SGbdPFS5aa15Vy366BfO
 UTmmU1lHl/mLEjniFwD3m95kk4T8lhPNCKvVHZrwttWqEeGkI6wl87mQHSzC85vsZ6i3VTH1dK8gH
 B6/yYn4HNBY771Peqn7tumWy1Hpmw1YBOpmcgSdAkcaWU4TmmMiXHEDJDOgr2DM5haKaqBE4GBjzs
 mpTA2naw==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:38170 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rmk@armlinux.org.uk>) id 1tsIUS-0005Hh-0g;
 Wed, 12 Mar 2025 09:35:04 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1tsIU5-005vGR-4c; Wed, 12 Mar 2025 09:34:41 +0000
In-Reply-To: <Z9FVHEf3uUqtKzyt@shell.armlinux.org.uk>
References: <Z9FVHEf3uUqtKzyt@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1tsIU5-005vGR-4c@rmk-PC.armlinux.org.uk>
Date: Wed, 12 Mar 2025 09:34:41 +0000
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
Subject: [Linux-stm32] [PATCH net-next v2 4/7] riscv: dts: starfive: remove
 "snps, en-tx-lpi-clockgating" property
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

Whether the MII transmit clock can be stopped is primarily a property
of the PHY (there is a capability bit that should be checked first.)
Whether the MAC is capable of stopping the transmit clock is a separate
issue, but this is already handled by the core DesignWare MAC code.

As commit "net: stmmac: starfive: use PHY capability for TX clock stop"
adds the flag to use the PHY capability, remove the DT property that is
now unecessary.

Cc: Samin Guo <samin.guo@starfivetech.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 arch/riscv/boot/dts/starfive/jh7110.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
index 0d8339357bad..a7aed4a21b65 100644
--- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
@@ -1022,7 +1022,6 @@ gmac0: ethernet@16030000 {
 			snps,force_thresh_dma_mode;
 			snps,axi-config = <&stmmac_axi_setup>;
 			snps,tso;
-			snps,en-tx-lpi-clockgating;
 			snps,txpbl = <16>;
 			snps,rxpbl = <16>;
 			starfive,syscon = <&aon_syscon 0xc 0x12>;
@@ -1053,7 +1052,6 @@ gmac1: ethernet@16040000 {
 			snps,force_thresh_dma_mode;
 			snps,axi-config = <&stmmac_axi_setup>;
 			snps,tso;
-			snps,en-tx-lpi-clockgating;
 			snps,txpbl = <16>;
 			snps,rxpbl = <16>;
 			starfive,syscon = <&sys_syscon 0x90 0x2>;
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
