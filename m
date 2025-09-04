Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2091CB447A8
	for <lists+linux-stm32@lfdr.de>; Thu,  4 Sep 2025 22:49:56 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7DFB4C3FACF;
	Thu,  4 Sep 2025 20:49:55 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9C9E6C36B29
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  4 Sep 2025 20:49:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MgQkSL1KPd31q0yGx1YBfBg/BNXTL/hwsPCMI8L4USk=; b=cafd0cQl9t9SZ6QiVZLpIxJfk1
 nSGxl+L3uTgjh2c26Pg8GivhTLKLI9rB5WC2JhFEvZ7VO5rU3HCGFQ3pXcyRAsXbYnLDPllgZoYYg
 LtpX1A890+XJGATjLiJUfNfqo7RM9SxLuDg7hLT1XWKLURmspGmuSxCpnPdCz0odRK8XbWovJdMDx
 yDLtxick2P47burx74WmW4HcMGAQpWah/L4XyGHN7QVmhVZ6rexPUR0bIwvPXGsGTVfJ4HTAa+5Wt
 XIMg0VOvEWPuugPUjlQHfafL0bRsgUj7xEhA+K61CnKQHtq6OuXyyNsZo+GRwZRf6cTzhFubCO29n
 XeiF82Kg==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:57380)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <linux@armlinux.org.uk>) id 1uuGtn-000000002X1-2IMh;
 Thu, 04 Sep 2025 21:49:39 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1uuGth-000000001qx-3mKy; Thu, 04 Sep 2025 21:49:33 +0100
Date: Thu, 4 Sep 2025 21:49:33 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Prabhakar <prabhakar.csengg@gmail.com>
Message-ID: <aLn7XVnWmHv1Bfe2@shell.armlinux.org.uk>
References: <20250904203949.292066-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250904203949.292066-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250904203949.292066-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 Eric Dumazet <edumazet@google.com>, linux-stm32@st-md-mailman.stormreply.com,
 Rob Herring <robh@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
 Jose Abreu <joabreu@synopsys.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>, Philipp Zabel <p.zabel@pengutronix.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH net-next v2 2/3] net: stmmac:
 dwmac-renesas-gbeth: Use OF data for configuration
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

On Thu, Sep 04, 2025 at 09:39:48PM +0100, Prabhakar wrote:
>  	plat_dat->init = renesas_gbeth_init;
>  	plat_dat->exit = renesas_gbeth_exit;
> -	plat_dat->flags |= STMMAC_FLAG_HWTSTAMP_CORRECT_LATENCY |
> -			   STMMAC_FLAG_EN_TX_LPI_CLK_PHY_CAP |
> -			   STMMAC_FLAG_SPH_DISABLE;
> +	plat_dat->flags |= gbeth->of_data->stmmac_flags;

You include the first two flags in your new device. I would like to see
at least STMMAC_FLAG_EN_TX_LPI_CLK_PHY_CAP always being set. The only
reason we have the STMMAC_FLAG_EN_TX_LPI_CLK_PHY_CAP flag is to avoid
changing existing behaviour and causing regressions. New stuff should
always set this.

If there is a reason not to have this set (e.g., PCS doesn't support
it) then we need to make that a PCS property and extend phylink's EEE
support. If there's something wrong in the setup that stmmac does for
EEE, then I'd like to hear about it as well.

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
