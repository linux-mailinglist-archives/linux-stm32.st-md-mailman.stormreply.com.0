Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 27ADC8D7E07
	for <lists+linux-stm32@lfdr.de>; Mon,  3 Jun 2024 11:04:46 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D4A1BC6B47E;
	Mon,  3 Jun 2024 09:04:45 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 19638C6B444
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  3 Jun 2024 09:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PL2tpWgubRP0I1wFdl1ZHWzMi0qsZ0DU3zEaEHooRQY=; b=B/GXgkrRVf4Kx2g9TuilFMzYS2
 U9NTJ5sySISyPgH9X1HT28urmVye+m8mf3bX59ZQDteLTM3jnFc1Kzc+tmlAFyVnmxXtbYs0av3NO
 OmLqHpnPC3byTnIq33a+gZJnip3nRKGZul8W89TBkvBRFJ3JHiAwenoET9L5h8IZwUzENpMQUAMOp
 uZWQu6OKtFlZCvBAv4hF9G3Y3hTj/hTIKsrrPn661EXWRJZ/hIJmtTR9est5xH+53rgZ7RoQL2Dnr
 KDSvpFP9+i3sAVYcUhzW8UeuDOaW9ZGHARWbtggPnAP4+E0DPiweET4f+R95aIdfxnRFa9XdvgzvH
 ZnB0owOQ==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:45002)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1sE3bi-0002Tb-2G;
 Mon, 03 Jun 2024 10:03:58 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1sE3be-0000IR-OA; Mon, 03 Jun 2024 10:03:54 +0100
Date: Mon, 3 Jun 2024 10:03:54 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Serge Semin <fancer.lancer@gmail.com>
Message-ID: <Zl2G+gK8qpBjGpb3@shell.armlinux.org.uk>
References: <20240602143636.5839-1-fancer.lancer@gmail.com>
 <20240602143636.5839-11-fancer.lancer@gmail.com>
 <2lpomvxhmh7bxqhkuexukztwzjfblulobepmnc4g4us7leldgp@o3a3zgnpua2a>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2lpomvxhmh7bxqhkuexukztwzjfblulobepmnc4g4us7leldgp@o3a3zgnpua2a>
Cc: Andrew Lunn <andrew@lunn.ch>, Tomer Maimon <tmaimon77@gmail.com>,
 Eric Dumazet <edumazet@google.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sagar Cheluvegowda <quic_scheluve@quicinc.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Florian Fainelli <f.fainelli@gmail.com>, openbmc@lists.ozlabs.org,
 Jose Abreu <joabreu@synopsys.com>,
 Abhishek Chauhan <quic_abchauha@quicinc.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Andrew Halaney <ahalaney@redhat.com>,
 Jose Abreu <Jose.Abreu@synopsys.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Jiawen Wu <jiawenwu@trustnetic.com>,
 linux-arm-kernel@lists.infradead.org, Mengyuan Lou <mengyuanlou@net-swift.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next v2 10/10] net: stmmac: Add DW
 XPCS specified via "pcs-handle" support
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

On Mon, Jun 03, 2024 at 11:54:22AM +0300, Serge Semin wrote:
> >  	if (priv->plat->pcs_init) {
> >  		ret = priv->plat->pcs_init(priv);
> 
> > +	} else if (fwnode_property_present(devnode, "pcs-handle")) {
> > +		pcsnode = fwnode_find_reference(devnode, "pcs-handle", 0);
> > +		xpcs = xpcs_create_fwnode(pcsnode, mode);
> > +		fwnode_handle_put(pcsnode);
> > +		ret = PTR_ERR_OR_ZERO(xpcs);
> 
> Just figured, we might wish to be a bit more portable in the
> "pcs-handle" property semantics implementation seeing there can be at
> least three different PCS attached:
> DW XPCS
> Lynx PCS
> Renesas RZ/N1 MII
> 
> Any suggestion of how to distinguish the passed handle? Perhaps
> named-property, phandle argument, by the compatible string or the
> node-name?

I can't think of a reasonable solution to this at the moment. One
solution could be pushing this down into the platform code to deal
with as an interim solution, via the new .pcs_init() method.

We could also do that with the current XPCS code, since we know that
only Intel mGBE uses xpcs. This would probably allow us to get rid
of the has_xpcs flag.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
