Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5683582301A
	for <lists+linux-stm32@lfdr.de>; Wed,  3 Jan 2024 16:01:29 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 08D5AC6B476;
	Wed,  3 Jan 2024 15:01:29 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8025DC6B452
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 Jan 2024 15:01:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=g8K4Wbg5JDQXx3q/iM3cUgJD+tm3dXGYqWadi7wsaLo=; b=vRPIlCafJtPTrLDLkNkZyvUl24
 xXTcQv22UTsNwmoIsCywmF04xqy6lyWQK7KYruZXaUaDViF1OsvA9njVSvWZhVAjorCzROmbXDnZ5
 HBNIdw52sG47eqZTfY1LV4xew4V0KVKtwyDSxrE+W45fbgni3Tk4ETlr8k5x8nxUvDd/eOn415kIZ
 Z3NrN5jVaJ0ePDyNWY1jLcUbVzZbDVrQ9TxJt6ajP33+fn5inC0g2cnbaW1NXLNnGiLtyOrKnzW6y
 NHn5jw87eNqwA+y0t2l9AkfpVAStCcudTUtAWpz9YWgt7jXCL/t8sJTKfWH6T7db6AbezzbiTJWR5
 b42yMw4w==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:48018)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1rL2k2-0007cb-1L;
 Wed, 03 Jan 2024 15:01:10 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1rL2jz-0006Sx-I0; Wed, 03 Jan 2024 15:01:07 +0000
Date: Wed, 3 Jan 2024 15:01:07 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Romain Gantois <romain.gantois@bootlin.com>
Message-ID: <ZZV2s/TGKanl76TI@shell.armlinux.org.uk>
References: <20240103142827.168321-1-romain.gantois@bootlin.com>
 <20240103142827.168321-6-romain.gantois@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240103142827.168321-6-romain.gantois@bootlin.com>
Cc: Marek Vasut <marex@denx.de>, Andrew Lunn <andrew@lunn.ch>,
 Pascal EBERHARD <pascal.eberhard@se.com>, netdev@vger.kernel.org,
 Sylvain Girard <sylvain.girard@se.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-renesas-soc@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Clark Wang <xiaoning.wang@nxp.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <clement.leger@bootlin.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net 5/5] net: pcs: rzn1-miic: Init RX
 clock early if MAC requires it
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

On Wed, Jan 03, 2024 at 03:28:25PM +0100, Romain Gantois wrote:
> The GMAC1 controller in the RZN1 IP requires the RX MII clock signal to be
> started before it initializes its own hardware, thus before it calls
> phylink_start.
> 
> Check the rxc_always_on pcs flag and enable the clock signal during the
> link validation phase.

However, validation is *not* supposed to change the configuration of
the hardware. Validation may fail. The "interface" that gets passed
to validation may never ever be selected. This change feels like
nothing more than a hack.

Since the MAC driver has to itself provide the PCS to phylink via the
mac_select_pcs() method, the MAC driver already has knowledge of which
PCS it is going to be using. Therefore, I think it may make sense
to do something like this:

int phylink_pcs_preconfig(struct phylink *pl, struct phylink_pcs *pcs)
{
	if (pl->config->mac_requires_rxc)
		pcs->rxc_always_on = true;

	if (pcs->ops->preconfig)
		pcs->ops->pcs_preconfig(pcs);
}

and have stmmac call phylink_pcs_preconfig() for each PCS that it will
be using during initialisation / resume paths?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
