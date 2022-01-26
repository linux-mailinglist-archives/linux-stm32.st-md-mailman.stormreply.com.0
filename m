Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EC94149C6E7
	for <lists+linux-stm32@lfdr.de>; Wed, 26 Jan 2022 10:55:35 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 92C39C5F1D6;
	Wed, 26 Jan 2022 09:55:35 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BD0F0C5F1D3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Jan 2022 09:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=V8Uqobix5AjhwcCsMkdZlxgySGKpMgvXrCqwp7f4jIE=; b=OFQ2r9Rv9k1+6yjKTg5rruRSU/
 FaiXH+keA6pqHDBj4Uk7/VvJuUiM1BpBr7dqrUA523EXe4ZWSbhBk+cgPjww7neZZPz6jydgs5njF
 4i8CR9EsRnZ2irZeeH49CM+Ryhr2U1TmrFBweqjX8oA2XvIlj0WMMdORTx43s8dfP+xX/7hTp7m7H
 x3+ny3q+Xb4/GNHUTIlH/JFOY8ApXpwdfF8R0I/FKtcbEoRxdQXR/H098BLqPRcw6dzU4VE/QbyVm
 BGw3cdgjqaRSwIGWiI/i2TrfxMkIVcWnmKgC02CCUa2Cd1cwcAcvSLsaDAuupu265gJNz68F4KOg6
 DjPO6WNQ==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:56872)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <linux@armlinux.org.uk>)
 id 1nCf1L-00035P-6b; Wed, 26 Jan 2022 09:55:19 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1nCf17-0004Mp-RT; Wed, 26 Jan 2022 09:55:05 +0000
Date: Wed, 26 Jan 2022 09:55:05 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Jakub Kicinski <kuba@kernel.org>
Message-ID: <YfEaeaES8w7PmB0n@shell.armlinux.org.uk>
References: <YfAnkuhiMoeFcVnb@shell.armlinux.org.uk>
 <E1nCOs4-005LSp-HF@rmk-PC.armlinux.org.uk>
 <20220125105303.2025dfae@kicinski-fedora-PC1C0HJN.hsd1.ca.comcast.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220125105303.2025dfae@kicinski-fedora-PC1C0HJN.hsd1.ca.comcast.net>
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Andrew Lunn <andrew@lunn.ch>,
 netdev@vger.kernel.org, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next 4/7] net: stmmac/xpcs: convert to
	pcs_validate()
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

On Tue, Jan 25, 2022 at 10:53:03AM -0800, Jakub Kicinski wrote:
> On Tue, 25 Jan 2022 16:40:40 +0000 Russell King (Oracle) wrote:
> > stmmac explicitly calls the xpcs driver to validate the ethtool
> > linkmodes. This is no longer necessary as phylink now supports
> > validation through a PCS method. Convert both drivers to use this
> > new mechanism.
> > 
> > Tested-by: Wong Vee Khee <vee.khee.wong@linux.intel.com> # Intel EHL            Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> 
> Sign-offs got scrambled.

Grumble. Never used to happen when I used MicroEMACS, but seems to be a
regular occurence when using vim - because it's pretty much impossible
to see wrapped lines in vim, especially when they have the perfect
amount of white space at the end of the previous line.

> Transient warning from here to patch 6:
> 
> drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:943:22: warning: unused variable 'priv' [-Wunused-variable]
>         struct stmmac_priv *priv = netdev_priv(to_net_dev(config->dev));
>                             ^

Thanks, v2 will be on its way with both of the above fixed.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
