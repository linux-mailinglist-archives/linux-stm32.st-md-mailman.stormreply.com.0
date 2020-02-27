Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B6693172927
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Feb 2020 21:03:00 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5EB98C36B0B;
	Thu, 27 Feb 2020 20:03:00 +0000 (UTC)
Received: from shards.monkeyblade.net (shards.monkeyblade.net [23.128.96.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 43DBDC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Feb 2020 20:02:57 +0000 (UTC)
Received: from localhost (unknown [IPv6:2601:601:9f00:477::3d5])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id AE1E5121793E1;
 Thu, 27 Feb 2020 12:02:54 -0800 (PST)
Date: Thu, 27 Feb 2020 12:02:54 -0800 (PST)
Message-Id: <20200227.120254.241641132362203475.davem@davemloft.net>
To: linux@armlinux.org.uk
From: David Miller <davem@davemloft.net>
In-Reply-To: <20200226102312.GX25745@shell.armlinux.org.uk>
References: <20200226102312.GX25745@shell.armlinux.org.uk>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Thu, 27 Feb 2020 12:02:55 -0800 (PST)
Cc: andrew@lunn.ch, linux-doc@vger.kernel.org, thomas.petazzoni@bootlin.com,
 ioana.ciornei@nxp.com, linux-stm32@st-md-mailman.stormreply.com,
 f.fainelli@gmail.com, corbet@lwn.net, michal.simek@xilinx.com,
 joabreu@synopsys.com, kuba@kernel.org, Mark-MC.Lee@mediatek.com,
 sean.wang@mediatek.com, hauke@hauke-m.de, radhey.shyam.pandey@xilinx.com,
 linux-mediatek@lists.infradead.org, john@phrozen.org, matthias.bgg@gmail.com,
 peppe.cavallaro@st.com, linux-arm-kernel@lists.infradead.org,
 netdev@vger.kernel.org, vivien.didelot@gmail.com, mcoquelin.stm32@gmail.com,
 nbd@nbd.name, olteanv@gmail.com, hkallweit1@gmail.com
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

From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
Date: Wed, 26 Feb 2020 10:23:12 +0000

> The following series changes the phylink interface to allow us to
> better support split MAC / MAC PCS setups.  The fundamental change
> required for this turns out to be quite simple.
> 
> Today, mac_config() is used for everything to do with setting the
> parameters for the MAC, and mac_link_up() is used to inform the
> MAC driver that the link is now up (and so to allow packet flow.)
> mac_config() also has had a few implementation issues, with folk
> who believe that members such as "speed" and "duplex" are always
> valid, where "link" gets used inappropriately, etc.
> 
> With the proposed patches, all this changes subtly - but in a
> backwards compatible way at this stage.
> 
> We pass the the full resolved link state (speed, duplex, pause) to
> mac_link_up(), and it is now guaranteed that these parameters to
> this function will always be valid (no more SPEED_UNKNOWN or
> DUPLEX_UNKNOWN here - unless phylink is fed with such things.)
> 
> Drivers should convert over to using the state in mac_link_up()
> rather than configuring the speed, duplex and pause in the
> mac_config() method. The patch series includes a number of MAC
> drivers which I've thought have been easy targets - I've left the
> remainder as I think they need maintainer input. However, *all*
> drivers will need conversion for future phylink development.
> 
> v2: add ocelot/felix and qca/ar9331 DSA drivers to patch 2, add
>   received tested-by so far.

In order to end the storm in a teacup, I've applied this series.

:-)

Thanks Russell.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
