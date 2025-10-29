Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 84B89C1BFCC
	for <lists+linux-stm32@lfdr.de>; Wed, 29 Oct 2025 17:15:00 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 84AB2C62D44;
	Wed, 29 Oct 2025 16:14:59 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 12EEFC5663C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Oct 2025 16:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=W1uta8p/W5QNqzGp1HZ4zz99/QdMe5/qSC/Dn+nw3nE=; b=EMxl0AuB+F5NhLkZJJB1QEOz6d
 izBrPIejNaEZTbx1kB9++36hpSVq4VrbjowPsYx+wxYn1n6hWtIB2p5LFEgSEk/losPNx3B0CY8ye
 sCxHCGOBRk+cYdYfJk9L4R3/NETijwSnOr9s4M4h5TtLy+Q3wdwNr7yeJrRKRN49SHAvUE3t2UPDS
 2/uJDN6FCVpX5sQz5b799RklPXywAZOGOzW9PGUHHsIavoD61BRVcRTFi4dwPW6ed0PjSnx/V2gXm
 rQMmufWZRvlV+4WEHLOYcFA5nixNaF4W/UirLbd+QGwTPGcino/bth4BxE6Ag7pzYPwpD0ZV5ryvT
 ZeBJ7pZw==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:56504)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <linux@armlinux.org.uk>) id 1vE8ow-000000004ci-1h3W;
 Wed, 29 Oct 2025 16:14:46 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1vE8os-000000007eD-12kw; Wed, 29 Oct 2025 16:14:42 +0000
Date: Wed, 29 Oct 2025 16:14:42 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: rohan.g.thomas@altera.com
Message-ID: <aQI9ckiHEybp3c_y@shell.armlinux.org.uk>
References: <20251029-agilex5_ext-v1-0-1931132d77d6@altera.com>
 <20251029-agilex5_ext-v1-1-1931132d77d6@altera.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251029-agilex5_ext-v1-1-1931132d77d6@altera.com>
Cc: Steffen Trumtrar <s.trumtrar@pengutronix.de>, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, Richard Cochran <richardcochran@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 1/4] net: stmmac: socfpga:
 Agilex5 EMAC platform configuration
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

On Wed, Oct 29, 2025 at 04:06:13PM +0800, Rohan G Thomas via B4 Relay wrote:
> +static void socfpga_common_plat_dat(struct socfpga_dwmac *dwmac)
> +{
> +	struct plat_stmmacenet_data *plat_dat = dwmac->plat_dat;
> +
> +	plat_dat->bsp_priv = dwmac;

Surely this is something which is always done? What's the point in
moving this to a function that always needs to be called from the
implementation specific setup_plat_dat() method?

> +	plat_dat->fix_mac_speed = socfpga_dwmac_fix_mac_speed;
> +	plat_dat->init = socfpga_dwmac_init;
> +	plat_dat->pcs_init = socfpga_dwmac_pcs_init;
> +	plat_dat->pcs_exit = socfpga_dwmac_pcs_exit;
> +	plat_dat->select_pcs = socfpga_dwmac_select_pcs;

From what I can see in your patch series, these are never changed.
So, I question the value of having this "common_plat_dat"
initialisation function. Why not leave this code in
socfpga_dwmac_probe(), and just move the initialisation of
plat_dat->core_type and plat_dat->riwt_off ?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
