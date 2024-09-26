Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C9843987336
	for <lists+linux-stm32@lfdr.de>; Thu, 26 Sep 2024 14:03:03 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7B551C6B47E;
	Thu, 26 Sep 2024 12:03:03 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 75EEACFAC50
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 26 Sep 2024 12:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WYYHaHC3yYNJYLN4CApnoOkWKsFh2EHIy2WfmkUP9Uk=; b=x0p4i8zaQ+D2Whmjo/HvditnuO
 wXG7j4IkFcJh4xgLcsgNIf+EqXcKbqEk5c30E1O0yn/ULpgMaWVe/VMMClwXSP7QTlli/b9gT6dPd
 y3veq8GOqLohWO5z7Gfkb3WtOzMID70MoRGoBHLmK+3Ir3qtUur/TWg6/l+eK4I2+C6G3nA92PVZn
 26ubyWwrpph/GMRb68LoXztr+hBAs7EiHpPi9HU7HeqloOtK3g0AD4iVMylseciKMwV1uQCHiKkwe
 JTFQwFhXNNTjyBtyl2owbuE3O7BdIjjQFdJYuL7gxucrCTGKWsRod8rOZVTirCFmXy3pnqdhSr+sc
 So/pTPWg==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:48756)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1stnCk-0008AL-2g;
 Thu, 26 Sep 2024 13:02:42 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
 (envelope-from <linux@shell.armlinux.org.uk>) id 1stnCe-0008Iy-0C;
 Thu, 26 Sep 2024 13:02:36 +0100
Date: Thu, 26 Sep 2024 13:02:35 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Vladimir Oltean <olteanv@gmail.com>
Message-ID: <ZvVNWxIRhKyNLM/J@shell.armlinux.org.uk>
References: <ZvF0er+vyciwy3Nx@shell.armlinux.org.uk>
 <E1ssjcz-005Ns9-D5@rmk-PC.armlinux.org.uk>
 <20240925131517.s562xmc5ekkslkhp@skbuf>
 <ZvRmr3aU1Fz6z0Oc@shell.armlinux.org.uk>
 <20240925211613.lmi2kh6hublkutbb@skbuf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240925211613.lmi2kh6hublkutbb@skbuf>
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Andrew Lunn <andrew@lunn.ch>,
 Florian Fainelli <f.fainelli@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 netdev@vger.kernel.org, Jose Abreu <joabreu@synopsys.com>,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jiawen Wu <jiawenwu@trustnetic.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Mengyuan Lou <mengyuanlou@net-swift.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH RFC net-next 06/10] net: dsa: sja1105:
 simplify static configuration reload
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

On Thu, Sep 26, 2024 at 12:16:13AM +0300, Vladimir Oltean wrote:
> On Wed, Sep 25, 2024 at 08:38:23PM +0100, Russell King (Oracle) wrote:
> > > There are 2 more changes which I believe should be made in sja1105_set_port_speed():
> > > - since it isn't called from mac_config() anymore but from mac_link_up()
> > >   (change which happened quite a while ago), it mustn't handle SPEED_UNKNOWN
> > > - we can trust that phylink will not call mac_link_up() with a speed
> > >   outside what we provided in mac_capabilities, so we can remove the
> > >   -EINVAL "default" speed_mbps case, and make this method return void,
> > >   as it can never truly cause an error
> > > 
> > > But I believe these are incremental changes which should be done after
> > > this patch. I've made a note of them and will create 2 patches on top
> > > when I have the spare time.
> > 
> > ... if we were to make those changes prior to this patch, then the
> > dev_err() will no longer be there and thus this becomes a non-issue.
> > So I'd suggest a patch prior to this one to make the changes you state
> > here, thus eliminating the need for this hunk in this patch.
> 
> That sounds good. Are you suggesting you will write up such a patch for v2?

Actually, the three patches become interdependent.

Let's say we want to eliminate SPEED_UNKNOWN. Prior to my patch in this
sub-thread, we have this:

                speed_mbps[i] = sja1105_port_speed_to_ethtool(priv,
                                                              mac[i].speed);
...
                rc = sja1105_adjust_port_config(priv, i, speed_mbps[i]);

sja1105_port_speed_to_ethtool() can return SPEED_UNKNOWN if
mac[i].speed is not one of the four encodings. If we can't guarantee
that it is one of the four encodings, then SPEED_UNKNOWN may be
passed into sja1105_adjust_port_config().

Similarly, as for the default case, we can't simply delete that,
because that'll leave "speed" uninitialised and we'll get a build
warning without my changes. We could change the default case to
simply:

	default:
		return 0;

but that just looks perverse.

So, I think rather than trying to do your suggestion before my patch,
my patch needs to stand as it currently is, and then your suggestion
must happen after it - otherwise we end up introducing more complexity
or weirdness.

Hmm?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
