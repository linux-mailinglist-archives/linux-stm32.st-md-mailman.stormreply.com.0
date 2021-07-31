Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D782B3DC2B1
	for <lists+linux-stm32@lfdr.de>; Sat, 31 Jul 2021 04:29:22 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8D5FFC57B6F;
	Sat, 31 Jul 2021 02:29:22 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [185.16.172.187])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2A025C56630
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 31 Jul 2021 02:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=fTMpPnF7MNPIeWiCWwW2KmQn0PAalSgBt+h2ZsLcBHU=; b=l/Uryn7pXFoajvjHHL7k0N/Krr
 4ZZhnM75MOm+LJCvJh+wASnN667p+KNfS7Vq+5Q8rwjN06d9RhSlnl9DVOiAEcWeS4yulFwlBpvrP
 UCwBceM7Jt1KzmZchFuSKSOO+PyYsCIBNuAvzUeHXrvP5fbsVzEhsn/cwbbntAoKrOYk=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1m9ekJ-00FYZR-Ab; Sat, 31 Jul 2021 04:29:03 +0200
Date: Sat, 31 Jul 2021 04:29:03 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Daniel Walker <danielwa@cisco.com>
Message-ID: <YQS1bzsIAD83+762@lunn.ch>
References: <20210729234443.1713722-1-danielwa@cisco.com>
 <YQNrmB9XHkcGy5D0@lunn.ch> <20210730144830.GO1633923@zorba>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210730144830.GO1633923@zorba>
Cc: Balamurugan Selvarajan <balamsel@cisco.com>, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Russell King <linux@armlinux.org.uk>, Jakub Kicinski <kuba@kernel.org>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 xe-linux-external@cisco.com, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [RFC-PATCH] net: stmmac: Add KR port support.
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

On Fri, Jul 30, 2021 at 07:48:30AM -0700, Daniel Walker wrote:
> On Fri, Jul 30, 2021 at 05:01:44AM +0200, Andrew Lunn wrote:
> > On Thu, Jul 29, 2021 at 04:44:42PM -0700, Daniel Walker wrote:
> > > From: Balamurugan Selvarajan <balamsel@cisco.com>
> > > 
> > > For KR port the mii interface is a chip-to-chip
> > > interface without a mechanical connector. So PHY
> > > inits are not applicable. In this case MAC is
> > > configured to operate at forced speed(1000Mbps)
> > > and full duplex. Modified driver to accommodate
> > > PHY and NON-PHY mode.
> > 
> > I agree with Florian here. Look at all the in kernel examples of a SoC
> > MAC connected to an Ethernet switch. Some use rgmii, others 1000BaseX
> > or higher. But they all follow the same scheme, and don't need
> > invasive MAC driver changes.
> 
> 
> Can you provide the examples which you looked at ?

There are plenty of examples using Freescale FEC and Marvell Ethernet
switches:

arch/arm/boot/dts/vf610-zii-dev-rev-b.dts

Or the Mavell based

arch/arm/boot/dts/armada-xp-linksys-mamba.dts

	Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
