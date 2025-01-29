Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 33CD4A21D88
	for <lists+linux-stm32@lfdr.de>; Wed, 29 Jan 2025 14:07:06 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ECBD6C78026;
	Wed, 29 Jan 2025 13:07:05 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3B1BDC7801F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Jan 2025 13:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=NE+/cXEahUBCqeTZXG0troRfgMK7rMSagxCJsqVZEks=; b=UzporGQkBf1nm2HZlsOn+y9rTZ
 OjGPEsEd6+PwBg0wNZPQ16H1EKVb6Xc5mvAKzVwh0rPS43WkbbO2IYEAoWFvDAzao89F/yJH3tWzN
 i6AtywwHN8SANcBGiYEwkIXUOeZ6nPafstR+QZdOkwCzCWxmUwQm9J9uud+94fTObWBw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1td7mY-0098By-Px; Wed, 29 Jan 2025 14:07:02 +0100
Date: Wed, 29 Jan 2025 14:07:02 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Swathi K S <swathi.ks@samsung.com>
Message-ID: <c86d69f5-eb97-4e0b-b2db-5b30f472a0d3@lunn.ch>
References: <20250128102558.22459-1-swathi.ks@samsung.com>
 <CGME20250128102743epcas5p1388a66efc96444adc8f1dbe78d7239b9@epcas5p1.samsung.com>
 <20250128102558.22459-5-swathi.ks@samsung.com>
 <918d6885-969e-46f1-b414-614905b12831@kernel.org>
 <002e01db722e$e018b7e0$a04a27a0$@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <002e01db722e$e018b7e0$a04a27a0$@samsung.com>
Cc: jayati.sahu@samsung.com, edumazet@google.com, linux-fsd@tesla.com,
 alim.akhtar@samsung.com, linux-stm32@st-md-mailman.stormreply.com,
 robh@kernel.org, linux-samsung-soc@vger.kernel.org, ssiddha@tesla.com,
 pankaj.dubey@samsung.com, 'Krzysztof Kozlowski' <krzk@kernel.org>,
 joabreu@synopsys.com, kuba@kernel.org, pabeni@redhat.com,
 devicetree@vger.kernel.org, conor+dt@kernel.org, ravi.patel@samsung.com,
 richardcochran@gmail.com, peppe.cavallaro@st.com,
 linux-arm-kernel@lists.infradead.org, rcsekar@samsung.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 mcoquelin.stm32@gmail.com, gost.dev@samsung.com, davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH v5 4/4] arm64: dts: fsd: Add Ethernet
 support for PERIC Block of FSD SoC
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

On Wed, Jan 29, 2025 at 02:49:14PM +0530, Swathi K S wrote:
> 
> 
> > -----Original Message-----
> > From: Krzysztof Kozlowski <krzk@kernel.org>
> > Sent: 28 January 2025 19:48
> > To: Swathi K S <swathi.ks@samsung.com>; robh@kernel.org;
> > davem@davemloft.net; edumazet@google.com; kuba@kernel.org;
> > pabeni@redhat.com; conor+dt@kernel.org; richardcochran@gmail.com;
> > mcoquelin.stm32@gmail.com; andrew@lunn.ch; alim.akhtar@samsung.com;
> > linux-fsd@tesla.com
> > Cc: netdev@vger.kernel.org; devicetree@vger.kernel.org; linux-
> > kernel@vger.kernel.org; linux-stm32@st-md-mailman.stormreply.com;
> > linux-arm-kernel@lists.infradead.org; linux-samsung-soc@vger.kernel.org;
> > alexandre.torgue@foss.st.com; peppe.cavallaro@st.com;
> > joabreu@synopsys.com; rcsekar@samsung.com; ssiddha@tesla.com;
> > jayati.sahu@samsung.com; pankaj.dubey@samsung.com;
> > ravi.patel@samsung.com; gost.dev@samsung.com
> > Subject: Re: [PATCH v5 4/4] arm64: dts: fsd: Add Ethernet support for PERIC
> > Block of FSD SoC
> > 
> > On 28/01/2025 11:25, Swathi K S wrote:
> > >
> > >  &pinctrl_pmu {
> > > diff --git a/arch/arm64/boot/dts/tesla/fsd.dtsi
> > b/arch/arm64/boot/dts/tesla/fsd.dtsi
> > > index cc67930ebf78..670f6a852542 100644
> > > --- a/arch/arm64/boot/dts/tesla/fsd.dtsi
> > > +++ b/arch/arm64/boot/dts/tesla/fsd.dtsi
> > > @@ -1027,6 +1027,33 @@
> > >  			phy-mode = "rgmii-id";
> > >  			status = "disabled";
> > >  		};
> > > +
> > > +		ethernet_1: ethernet@14300000 {
> > 
> > Don't add nodes to the end, because that lead to mess we have there.
> > Squeeze it somewhere where impact on resorting would be the smallest.
> 
> Just to clarify,  inserting the node somewhere in the middle, where it fits alphabetically, would minimize the impact on resorting.
> Is my understanding correct?

I think the coding style says to order them by address. So sort on
14300000.

The issue here is merging patches coming from different subsystems. If
these patches are merged via netdev, and there are other patches for
other devices coming from other subsystem, there is going to be a
merge conflict if they all append to the end. By keeping things
ordered, the chance of a merge conflict is much lower, since the
changes are likely to be separated. So you will find in Linux anything
which can be sorted is sorted. Makefile, Kconfig, order of #includes
etc.

	Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
