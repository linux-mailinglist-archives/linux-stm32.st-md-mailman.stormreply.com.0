Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B0198BA4DF
	for <lists+linux-stm32@lfdr.de>; Fri,  3 May 2024 03:25:34 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 22DF9C712A1;
	Fri,  3 May 2024 01:25:34 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D84C1C712A0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  3 May 2024 01:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=rPaJqqgEDySEy7m0HaNo8dsnzSm/N9I0/G6a8VXE0NA=; b=G3iSQ0lFTzjf7q24aBd4DutcCh
 T7kJxoiU3WKIB80JHJI3irt9WQKmxOhjdzoDfpb1kplsX6x8CRVvBdYVCm7rKGNsWTztVazbf9QXv
 nmKnOScH08h+7b7DiICyFQ1R01l/AP5sNmk3VxIrMRkUptPWYJUWcnACbcQErotrnPxM=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1s2hfr-00EXRq-Rh; Fri, 03 May 2024 03:25:19 +0200
Date: Fri, 3 May 2024 03:25:19 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Serge Semin <fancer.lancer@gmail.com>
Message-ID: <25d1164e-0ac2-4311-ad27-aa536dca3882@lunn.ch>
References: <uz66kbjbxieof6vkliuwgpzhlrbcmeb2f5aeuourw2vqcoc4hv@2adpvba3zszx>
 <ZjFl4rql0UgsHp97@shell.armlinux.org.uk>
 <ykdqxnky7shebbhtucoiokbews2be5bml6raqafsfn4x6bp6h3@nqsn6akpajvp>
 <7723d4l2kqgrez3yfauvp2ueu6awbizkrq4otqpsqpytzp45q2@rju2nxmqu4ew>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7723d4l2kqgrez3yfauvp2ueu6awbizkrq4otqpsqpytzp45q2@rju2nxmqu4ew>
Cc: davem@davemloft.net, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 hkallweit1@gmail.com, "Russell King \(Oracle\)" <linux@armlinux.org.uk>,
 edumazet@google.com, joabreu@synopsys.com, mcoquelin.stm32@gmail.com,
 kuba@kernel.org, pabeni@redhat.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, Andrew Halaney <ahalaney@redhat.com>
Subject: Re: [Linux-stm32] racing ndo_open()/phylink*connect() with
	phy_probe()
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

> AFAICS the problem is in the race between the end0 and end1 device
> probes. Right?
> If so then can't the order be fixed by adding the links between the
> OF-devices?  As it's already done for various phandle-based references
> like "clocks", "gpios", "phys", etc?

It gets tricky because an MDIO bus master device is often a sub device
of an Ethernet MAC driver. Typically how it works is that a MAC driver
probes. Part way through the probe it creates an MDIO bus driver,
which enumerates the MDIO bus and creates the PHYs. Later in the MAC
driver probe, or maybe when the MAC driver is opened, it follows the
phy-handle to a PHY on its own MDIO bus.

If you were to say it cannot probe the MAC driver until the MDIO bus
driver is created and the PHYs created, you never get anywhere,
because it is the act of probing the MAC driver which creates the PHYs
which fulfils the phandle.

You would need to differentiate between a phandle pointing deeper into
the same branch of a DT tree, or pointing to a different branch of a
DT tree. If it is deeper within the same branch, you need to probe in
order to make progress. If it points to a different branch you need to
defer until that sub-branch has successfully probed. And if you get
two branches which are mutually dependent on each other, probe and
hope EPROBE_DEFER solves it.

	Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
