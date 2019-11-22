Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FA751068BF
	for <lists+linux-stm32@lfdr.de>; Fri, 22 Nov 2019 10:22:15 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CCA06C36B0B;
	Fri, 22 Nov 2019 09:22:14 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 57705C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Nov 2019 09:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SWbmUilvZWyu9G5awdEU2KvPZeq3aeg+c1C4lJEnjoo=; b=an41Zr2/uNxSIUfMI75HmnIqV
 Gdh4kdDw4HAonLEtaGjxH9/njeLzh1GpRZf0SdfF3fR2JOqSPElZfwlBFHwa/As7LqES2oxUVPEgq
 lddNaJanCjc5wYIDGjIC6vp/7cs3bWV0EO6UQnizW+CueuuyXnvdNQV/pi8CzUwU8DlC0rh6gDmZ1
 3czSPX/k0lEm6+tq7d/3jiRJ4d4qIWMKj98kTVi55jDe/fx0aIEp9e0NpBdiBblRVh8AqwC9lFmii
 C0NYYCbzgJdJnfp2kZxdu3CcqNMvAR7V2i6h4Fcg2aJSzTu3H2Np+acyCy0rAWe9S3KvME8OebaDh
 lt4WPkmBg==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:43048)
 by pandora.armlinux.org.uk with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <linux@armlinux.org.uk>)
 id 1iY58L-000490-9z; Fri, 22 Nov 2019 09:21:45 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1iY58D-0003Yo-1A; Fri, 22 Nov 2019 09:21:37 +0000
Date: Fri, 22 Nov 2019 09:21:37 +0000
From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
To: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <20191122092136.GJ25745@shell.armlinux.org.uk>
References: <E1iXaSM-0004t1-9L@rmk-PC.armlinux.org.uk>
 <20191121.191417.1339124115325210078.davem@davemloft.net>
 <0a9e016b-4ee3-1f1c-0222-74180f130e6c@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0a9e016b-4ee3-1f1c-0222-74180f130e6c@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: andrew@lunn.ch, nbd@openwrt.org, sean.wang@mediatek.com,
 netdev@vger.kernel.org, peppe.cavallaro@st.com, radhey.shyam.pandey@xilinx.com,
 michal.simek@xilinx.com, mcoquelin.stm32@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, joabreu@synopsys.com,
 linux-mediatek@lists.infradead.org, thomas.petazzoni@bootlin.com,
 john@phrozen.org, matthias.bgg@gmail.com, vivien.didelot@gmail.com,
 hkallweit1@gmail.com, David Miller <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Mark-MC.Lee@mediatek.com
Subject: Re: [Linux-stm32] [CFT PATCH net-next v2] net: phylink: rename
 mac_link_state() op to mac_pcs_get_state()
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

On Thu, Nov 21, 2019 at 07:36:44PM -0800, Florian Fainelli wrote:
> 
> 
> On 11/21/2019 7:14 PM, David Miller wrote:
> > From: Russell King <rmk+kernel@armlinux.org.uk>
> > Date: Thu, 21 Nov 2019 00:36:22 +0000
> > 
> >> Rename the mac_link_state() method to mac_pcs_get_state() to make it
> >> clear that it should be returning the MACs PCS current state, which
> >> is used for inband negotiation rather than just reading back what the
> >> MAC has been configured for. Update the documentation to explicitly
> >> mention that this is for inband.
> >>
> >> We drop the return value as well; most of phylink doesn't check the
> >> return value and it is not clear what it should do on error - instead
> >> arrange for state->link to be false.
> >>
> >> Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
> >> ---
> >> This is something I'd like to do to make it clearer what phylink
> >> expects of this function, and that it shouldn't just read-back how
> >> the MAC was configured.
> >>
> >> This version drops the deeper changes, concentrating just on the
> >> phylink API rather than delving deeper into drivers, as I haven't
> >> received any feedback on that patch.
> >>
> >> It would be nice to see all these drivers tested with this change.
> > 
> > I'm tempted to just apply this, any objections?
> > 
> 
> Russell, which of this patch or: http://patchwork.ozlabs.org/patch/1197425/
> 
> would you consider worthy of merging?

Let's go with v2 for now - it gets the rename done with less risk that
there'll be a problem.  I can always do the remainder in a separate
patch after the merge window as a separate patch.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps up
According to speedtest.net: 11.9Mbps down 500kbps up
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
