Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 57BC616FBC7
	for <lists+linux-stm32@lfdr.de>; Wed, 26 Feb 2020 11:12:58 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1582CC36B0B;
	Wed, 26 Feb 2020 10:12:58 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B2AE9C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Feb 2020 10:12:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CAamW1A7wSi+dl1kSJ3MLj0iB7qeqpYQKI22daCCGM8=; b=v6DlCO/OJmb9kQvoiXW+Zr432
 8BvCAsk7BQEZrQZMpP9iJSc7ZzWQ1beEXWg6f1rkJar2gHLh0bO6C6g55IjbliVm8GG4wOPoJ5Ua6
 vdY5znpf7BdEkxFYx1esKe7H+3s72RVuWJei0owKFkgQfwQhq1p1LxnrcjjwuMtgy8iRnkfHSDWCU
 ppAdE2TIyan/4aiw8Za37GFy7p9KLPAfuhtItrM+Jis7E9Z6EPwm8rGSfhBsW5F9DrRXs0k6PUwkh
 r9XT5Ir1bufpF5nVPFO5gkuAhgxd3lpmT5fPbnsxbBNoWcWXG+AklBbInbQTfslvbHfTUtRdAfMqJ
 fNfXuKgBA==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:57116)
 by pandora.armlinux.org.uk with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <linux@armlinux.org.uk>)
 id 1j6tfp-0006nj-Vd; Wed, 26 Feb 2020 10:12:14 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1j6tfh-0008KB-0V; Wed, 26 Feb 2020 10:12:05 +0000
Date: Wed, 26 Feb 2020 10:12:04 +0000
From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
To: Ioana Ciornei <ioana.ciornei@nxp.com>
Message-ID: <20200226101204.GW25745@shell.armlinux.org.uk>
References: <20200225093703.GS25745@shell.armlinux.org.uk>
 <E1j6WgG-0000TJ-CC@rmk-PC.armlinux.org.uk>
 <DB8PR04MB68282F710FB598B977C36F99E0ED0@DB8PR04MB6828.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <DB8PR04MB68282F710FB598B977C36F99E0ED0@DB8PR04MB6828.eurprd04.prod.outlook.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Andrew Lunn <andrew@lunn.ch>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
 Michal Simek <michal.simek@xilinx.com>, Jose Abreu <joabreu@synopsys.com>,
 Jakub Kicinski <kuba@kernel.org>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>, Hauke Mehrtens <hauke@hauke-m.de>,
 Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 John Crispin <john@phrozen.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Vladimir Oltean <olteanv@gmail.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Felix Fietkau <nbd@nbd.name>,
 "David S. Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next 5/8] net: dpaa2-mac: use resolved
 link config in mac_link_up()
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

On Tue, Feb 25, 2020 at 04:36:32PM +0000, Ioana Ciornei wrote:
> > Subject: [PATCH net-next 5/8] net: dpaa2-mac: use resolved link config in
> > mac_link_up()
> > 
> > Convert the DPAA2 ethernet driver to use the finalised link parameters in
> > mac_link_up() rather than the parameters in mac_config(), which are more
> > suited to the needs of the DPAA2 MC firmware than those available via
> > mac_config().
> > 
> > Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
> 
> Tested-by: Ioana Ciornei <ioana.ciornei@nxp.com>

Thanks.

> > +
> > +		/* This is lossy; the firmware really should take the pause
> > +		 * enablement status rather than pause/asym pause status.
> > +		 */
> 
> In what sense it's lossy? I cannot see how information can be lost by translating the rx/tx pause state to pause/asym.
> If it's just about the unnecessary double translation, then I agree.. this could have been done in an easier manner.

If you're just translating rx/tx to pause/asym and then doing the
reverse, then it isn't lossy, but if the firmware is resolving
pause/asym according to the table in IEEE 802.3, then it will be
lossy.

If the firmware doesn't interpret the bits, then why not do the
sensible thing and just pass the enablement status rather than
trying to confusingly encode it back to pause/asym?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps up
According to speedtest.net: 11.9Mbps down 500kbps up
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
