Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B64A4B0C4EA
	for <lists+linux-stm32@lfdr.de>; Mon, 21 Jul 2025 15:11:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6B35CC32E8F;
	Mon, 21 Jul 2025 13:11:22 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3C37AC349C7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Jul 2025 13:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=2EDIiB7F78ZZl6mL2M2TE1SlEuzFD+iUDjhHgloH2UQ=; b=GJXuiBC/9awoiua23kOQl4lLOW
 CFBVBr2ilT1eXsLt4slNEf2a9gf4h450QI1ETxHQgiF/Wsjr1DB4gTHOLzMfCNsnHM6XunnilUISW
 GNoFh56TtE+Rd/JtZlZtO7oZCxgWmeODHCUp1c5Oo9nK2+L9eQjBBBvtqSSojLiiDLk8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1udqIB-002MCv-Vx; Mon, 21 Jul 2025 15:10:55 +0200
Date: Mon, 21 Jul 2025 15:10:55 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: =?utf-8?B?5p2O5b+X?= <lizhi2@eswincomputing.com>
Message-ID: <6b3c8130-77f0-4266-b1ed-2de80e0113b0@lunn.ch>
References: <20250703091808.1092-1-weishangjuan@eswincomputing.com>
 <20250703092015.1200-1-weishangjuan@eswincomputing.com>
 <c212c50e-52ae-4330-8e67-792e83ab29e4@lunn.ch>
 <7ccc507d.34b1.1980d6a26c0.Coremail.lizhi2@eswincomputing.com>
 <e734f2fd-b96f-4981-9f00-a94f3fd03213@lunn.ch>
 <6c5f12cd.37b0.1982ada38e5.Coremail.lizhi2@eswincomputing.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6c5f12cd.37b0.1982ada38e5.Coremail.lizhi2@eswincomputing.com>
Cc: vladimir.oltean@nxp.com, edumazet@google.com, jszhang@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, robh@kernel.org,
 weishangjuan@eswincomputing.com, ningyu@eswincomputing.com, 0x1207@gmail.com,
 kuba@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org,
 jan.petrous@oss.nxp.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 rmk+kernel@armlinux.org.uk, yong.liang.choong@linux.intel.com,
 dfustini@tenstorrent.com, linux-arm-kernel@lists.infradead.org,
 pinkesh.vaghela@einfochips.com, linmin@eswincomputing.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch,
 boon.khai.ng@altera.com, mcoquelin.stm32@gmail.com, inochiama@gmail.com,
 krzk+dt@kernel.org, davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH v3 2/2] ethernet: eswin: Add eic7700
 ethernet driver
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

> > > Let me clarify the purpose of the three elements in each dly_param_* array:
> > >   dly_param_[x][0]: Delay configuration for TXD signals
> > >   dly_param_[x][1]: Delay configuration for control signals (e.g., TX_EN, RX_DV, RX_CLK)
> > >   dly_param_[x][2]: Delay configuration for RXD signals
> > 
> > Maybe add a #define or an enum for the index.
> > 
> > Do these delays represent the RGMII 2ns delay?
> > 
> 
> Yes, these delays refer to the RGMII delay, but they are not strictly 2ns. There are a few points that require further clarification:
> 1. Regarding delay configuration logic:
>    As you mentioned in version V2, rx-internal-delay-ps and tx-internal-delay-ps will be mapped to and overwrite the corresponding bits in the EIC7700_DELAY_VALUE1 register, which controls the rx_clk and tx_clk delays. Is this understanding and approach correct and feasible?

Please configure your email client to wrap at about 78
characters. Standard network etiquette.

Yes, if rx-internal-delay-ps or/and tx-internal-delay-ps are in DT,
they should configure the delay the MAC applies.


> 2. About the phy-mode setting:
>    In our platform, the internal delays are provided by the MAC. When configuring rx-internal-delay-ps and tx-internal-delay-ps in the device tree, is it appropriate to set phy-mode = "rgmii-id" in this case?

Please read:

https://elixir.bootlin.com/linux/v6.15.7/source/Documentation/devicetree/bindings/net/ethernet-controller.yaml#L287

It gives a detailed description of what phy-mode = "rmgii-id" means. 

> 3. Delay values being greater than 2ns:
>    In our platform, the optimal delay values for rx_clk and tx_clk are determined based on the board-level timing adjustment, and both are greater than 2ns. Given this, is it reasonable and compliant with the RGMII specification to set both rx-internal-delay-ps and tx-internal-delay-ps to values greater than 2ns in the Device Tree?

It is O.K. when the total delay is > 2ns. However, please note what is
said, the normal way to implement delays in Linux. The PHY does the
2ns delay. The MAC can then do fine tuning, adding additional small
delays.

> There is a question that needs clarification:
> The EIC7700_DELAY_VALUE0 and EIC7700_DELAY_VALUE1 registers contain the optimal delay configurations determined through board-level phase adjustment. Therefore, they are also used as the default values in our platform. If the default delay is set to 0ps, the Ethernet interface may fail to function correctly in our platform.

So there is only every going to be one board? There will never produce
a cost optimised version with a different, cheaper PHY? You will never
support connecting the MAC directly an Ethernet switch? You will never
make use of a PHY which can translate to SGMII/1000BaseX, and then
have an SFP cage?

DT properties are there to make your hardware more flexible. You can
use it to describe such setups, and handle the timing needed for each.

By default, when phy-mode is rgmii-id, the MAC adds 0ns, the PHY 2ns,
and most systems will just work. That 2ns is what the RGMII standard
requires. You can then fine tune it with rx-internal-delay-ps and
tx-internal-delay-ps if your design does not correctly follow the
RGMII standard.

	Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
