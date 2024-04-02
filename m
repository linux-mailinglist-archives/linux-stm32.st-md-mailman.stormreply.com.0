Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F3D6895898
	for <lists+linux-stm32@lfdr.de>; Tue,  2 Apr 2024 17:48:53 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 16076C6B45B;
	Tue,  2 Apr 2024 15:48:53 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2070CC69063
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  2 Apr 2024 15:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EdBhpic/RevODT/o5oeHWQea2/WXlB/Ee0DTXEd6PnU=; b=FQqTBehREw5dCF+UC9pcddFTa/
 bELaN5lEzBQ2doym65Z3/tElDW/nhZzl7WuRJxNqh6vyRIHmXRe9ZEZ8z8u4Xp3xrWFfD4g+YFopU
 ojhtdLVGPFJvGC5pn3dcRdSQcfDOoPVwm2saTZGZA0eaxQXVReM6agigWHrPbpFPEgEcm8oF6P2qw
 qJiVxitO4dCFCjwA0DM+zY6l8mp767OvP6n/Koo/qrBssI710LCcCv9A1VhfDQ6x+trMsRxk5yElY
 w21aFrVilwMC5+8YzG3V67Omhnc8wDej5YZnhboWZ0zSFsrKgMo6KkP3Tia3jwQG3iDYq2EFEEaJM
 or4YPQAg==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:49276)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1rrgNE-000709-0m;
 Tue, 02 Apr 2024 16:48:32 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1rrgN9-00074C-2e; Tue, 02 Apr 2024 16:48:27 +0100
Date: Tue, 2 Apr 2024 16:48:26 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Romain Gantois <romain.gantois@bootlin.com>
Message-ID: <ZgwoygldsA1V8fs9@shell.armlinux.org.uk>
References: <20240402-rzn1-gmac1-v1-0-5be2b2894d8c@bootlin.com>
 <20240402-rzn1-gmac1-v1-2-5be2b2894d8c@bootlin.com>
 <ZgwM/FIKTuN4vkQA@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZgwM/FIKTuN4vkQA@shell.armlinux.org.uk>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, devicetree@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Magnus Damm <magnus.damm@gmail.com>,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <clement.leger@bootlin.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 2/3] net: stmmac: add support for
	RZ/N1 GMAC
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

On Tue, Apr 02, 2024 at 02:49:48PM +0100, Russell King (Oracle) wrote:
> On Tue, Apr 02, 2024 at 02:37:01PM +0200, Romain Gantois wrote:
> > +	ret = stmmac_dvr_probe(dev, plat_dat, &stmmac_res);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ndev = platform_get_drvdata(pdev);
> > +	priv = netdev_priv(ndev);
> > +
> > +	pcs_node = of_parse_phandle(np, "pcs-handle", 0);
> > +	if (pcs_node) {
> > +		pcs = miic_create(dev, pcs_node);
> > +		of_node_put(pcs_node);
> > +		if (IS_ERR(pcs))
> > +			return PTR_ERR(pcs);
> > +
> > +		priv->hw->phylink_pcs = pcs;
> > +	}
> 
> I'm afraid that this fails at one of the most basic principles of kernel
> multi-threaded programming. stmmac_dvr_probe() as part of its work calls
> register_netdev() which publishes to userspace the network device.
> 
> Everything that is required must be setup _prior_ to publication to
> userspace to avoid races, because as soon as the network device is
> published, userspace can decide to bring that interface up. If one
> hasn't finished the initialisation, the interface can be brought up
> before that initialisation is complete.
> 
> I don't see anything obvious in the stmmac data structures that would
> allow you to hook in at an appropriate point before the
> register_netdev() but after the netdev has been created. The
> priv->hw data structure is created by stmmac_hwif_init()
> 
> I see that drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c is also
> guilty of this as well, and should be fixed. It's even worse because it
> does a truck load of stuff after stmmac_dvr_probe() which it most
> definitely should not be doing.
> 
> I definitely get the feeling that the structure of the stmmac driver
> is really getting out of hand, and is making stuff harder for people,
> and it's not improving over time - in fact, it's getting worse. It
> needs a *lot* of work to bring it back to a sane model.

I'm not going to say that the two patches threaded to this email are
"sane" but at least it avoids the problem. socfpga still has issues
with initialisation done after register_netdev() though.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
