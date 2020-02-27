Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 55D12172AEE
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Feb 2020 23:13:50 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 97B31C36B0B;
	Thu, 27 Feb 2020 22:13:49 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 60203C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Feb 2020 22:13:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TLyRnJ1kCDzmRuRPTz7K92VaFFh1/vMyyOGH0HaTtQU=; b=hCxh6qfDzl2vp7DfzH7YiKHP4
 DhRLp6tdz6Pf8sxKQD3D3uLhUeE+80ZYoKZT3UyLGQSdNw2BZ2vr/HFjStzNnKnsTYpuy/9jOOGfk
 6he1mGrm1X7/9X5DeNZUs1Z0YBlJbGOhyg/Mxqn/zwJREwIsRGrpgC623yJdZzyZ7xB5x/DQCzdNa
 fm5KA+xAB23YrLCSiNZBi0hBMiSRKZamKETgxTXepn1R/l59dEmUXwWzllDpEEhgRZJDxCjgOc3kp
 mQO+YUx+2XZASMjQcq5zZM75k/L8YzXGdqB7mqjRvkBPzH4TlE6bzD5IbwetU/vIwC7WwXYqo+UDW
 J0cfEvkEA==;
Received: from shell.armlinux.org.uk
 ([2002:4e20:1eda:1:5054:ff:fe00:4ec]:53650)
 by pandora.armlinux.org.uk with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <linux@armlinux.org.uk>)
 id 1j7RPK-0008OF-2y; Thu, 27 Feb 2020 22:13:26 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1j7RP9-0001Kj-JH; Thu, 27 Feb 2020 22:13:15 +0000
Date: Thu, 27 Feb 2020 22:13:15 +0000
From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
To: David Miller <davem@davemloft.net>
Message-ID: <20200227221315.GS25745@shell.armlinux.org.uk>
References: <20200226102312.GX25745@shell.armlinux.org.uk>
 <20200227.120254.241641132362203475.davem@davemloft.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200227.120254.241641132362203475.davem@davemloft.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: andrew@lunn.ch, linux-doc@vger.kernel.org, thomas.petazzoni@bootlin.com,
 ioana.ciornei@nxp.com, linux-stm32@st-md-mailman.stormreply.com,
 f.fainelli@gmail.com, corbet@lwn.net, michal.simek@xilinx.com,
 hkallweit1@gmail.com, joabreu@synopsys.com, kuba@kernel.org,
 vivien.didelot@gmail.com, sean.wang@mediatek.com, hauke@hauke-m.de,
 radhey.shyam.pandey@xilinx.com, linux-mediatek@lists.infradead.org,
 john@phrozen.org, matthias.bgg@gmail.com, peppe.cavallaro@st.com,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 Mark-MC.Lee@mediatek.com, mcoquelin.stm32@gmail.com, olteanv@gmail.com,
 nbd@nbd.name
Subject: Re: [Linux-stm32] [PATCH net-next v2 0/8] rework phylink interface
 for split MAC/PCS support
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

On Thu, Feb 27, 2020 at 12:02:54PM -0800, David Miller wrote:
> From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
> Date: Wed, 26 Feb 2020 10:23:12 +0000
> 
> > The following series changes the phylink interface to allow us to
> > better support split MAC / MAC PCS setups.  The fundamental change
> > required for this turns out to be quite simple.
> > 
> > Today, mac_config() is used for everything to do with setting the
> > parameters for the MAC, and mac_link_up() is used to inform the
> > MAC driver that the link is now up (and so to allow packet flow.)
> > mac_config() also has had a few implementation issues, with folk
> > who believe that members such as "speed" and "duplex" are always
> > valid, where "link" gets used inappropriately, etc.
> > 
> > With the proposed patches, all this changes subtly - but in a
> > backwards compatible way at this stage.
> > 
> > We pass the the full resolved link state (speed, duplex, pause) to
> > mac_link_up(), and it is now guaranteed that these parameters to
> > this function will always be valid (no more SPEED_UNKNOWN or
> > DUPLEX_UNKNOWN here - unless phylink is fed with such things.)
> > 
> > Drivers should convert over to using the state in mac_link_up()
> > rather than configuring the speed, duplex and pause in the
> > mac_config() method. The patch series includes a number of MAC
> > drivers which I've thought have been easy targets - I've left the
> > remainder as I think they need maintainer input. However, *all*
> > drivers will need conversion for future phylink development.
> > 
> > v2: add ocelot/felix and qca/ar9331 DSA drivers to patch 2, add
> >   received tested-by so far.
> 
> In order to end the storm in a teacup, I've applied this series.
> 
> :-)
> 
> Thanks Russell.

Thanks David, I was getting concerned that the teacup might break! :p

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps up
According to speedtest.net: 11.9Mbps down 500kbps up
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
