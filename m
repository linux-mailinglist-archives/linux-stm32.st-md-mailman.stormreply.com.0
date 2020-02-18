Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BA2A1161EAB
	for <lists+linux-stm32@lfdr.de>; Tue, 18 Feb 2020 02:53:52 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 700C8C36B0B;
	Tue, 18 Feb 2020 01:53:52 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1A0D6C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Feb 2020 01:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Zi/r8mbt3ArBElcGWaOvulYaFWwCLLGqTvQ8tW82sm8=; b=Y8gnB20+kMGP6TPFsLqUZ+xR9
 pCvJWoL/yMGmbYUsAEci98dSssqiYXl4OWUljCcU4eHFI8HrQCM0++2E5GNyHqVKjF59duOtOrG2A
 ak+/ETbJituUu0nCLLaNL3q8KWuEg83+5Jr0P5e6yFYEkCdNP7nmktmOafEQVvpd4xS495RiBcrZr
 SQf9jBeY3cMkdURtEJ+9F1sGUl1I31qIPpR4+wWdsAC5X8htuiLH78zBGcApEm+A+TQsKl4dXTA8S
 /a3RN+Kh/upi1G0HG8YWCUk9PP/pXQiOAV8BAolOaw353yla1DrrL7QVVQkQu/nvyh0s+GhK5fOK9
 gnx8OUMcg==;
Received: from shell.armlinux.org.uk
 ([2001:4d48:ad52:3201:5054:ff:fe00:4ec]:41782)
 by pandora.armlinux.org.uk with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <linux@armlinux.org.uk>)
 id 1j3s4u-0004Jk-S6; Tue, 18 Feb 2020 01:53:37 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1j3s4l-0006oC-Qv; Tue, 18 Feb 2020 01:53:27 +0000
Date: Tue, 18 Feb 2020 01:53:27 +0000
From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
To: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <20200218015327.GD25745@shell.armlinux.org.uk>
References: <20200217172242.GZ25745@shell.armlinux.org.uk>
 <E1j3k7e-00071q-3R@rmk-PC.armlinux.org.uk>
 <16f6912c-84a9-f1ab-6688-6a55ebf34270@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <16f6912c-84a9-f1ab-6688-6a55ebf34270@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Andrew Lunn <andrew@lunn.ch>, linux-doc@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-stm32@st-md-mailman.stormreply.com, Felix Fietkau <nbd@openwrt.org>,
 Ioana Radulescu <ruxandra.radulescu@nxp.com>, Jonathan Corbet <corbet@lwn.net>,
 Michal Simek <michal.simek@xilinx.com>, Jose Abreu <joabreu@synopsys.com>,
 Jakub Kicinski <kuba@kernel.org>, Vivien Didelot <vivien.didelot@gmail.com>,
 Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>,
 Sean Wang <sean.wang@mediatek.com>, linux-mediatek@lists.infradead.org,
 John Crispin <john@phrozen.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 Mark Lee <Mark-MC.Lee@mediatek.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "David S. Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [CFT 1/8] net: phylink: propagate resolved link
 config via mac_link_up()
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

On Mon, Feb 17, 2020 at 01:54:19PM -0800, Florian Fainelli wrote:
> 
> 
> On 2/17/2020 9:23 AM, Russell King wrote:
> > Propagate the resolved link parameters via the mac_link_up() call for
> > MACs that do not automatically track their PCS state.
> > 
> > Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
> > ---
> 
> [snip]
> 
> 
> > -static void macb_mac_link_up(struct phylink_config *config, unsigned int mode,
> > -			     phy_interface_t interface, struct phy_device *phy)
> > +static void macb_mac_link_up(struct phylink_config *config,
> > +			     struct phy_device *phy,
> > +			     unsigned int mode, phy_interface_t interface,
> > +			     int speed, int duplex,
> > +			     bool tx_pause, bool rx_pause)
> 
> I have not been able to find an answer so I will ask this question, why
> not pass a const struct phylink_link_state reference here instead of
> splitting those link settings as individual function parameters? Or
> maybe introduce a phylink_link_settings comprised of all of those 4
> settings and embed it within phylink_link_state as well?

History of mac_config() has shown that passing something like
struct phylink_link_state results in stuff that should not be used
being used inspite of documentation saying otherwise.  Passing
just the appropriate state ensures that stuff which should not
be used can't be got at.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps up
According to speedtest.net: 11.9Mbps down 500kbps up
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
