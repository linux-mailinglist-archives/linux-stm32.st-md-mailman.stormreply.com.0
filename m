Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9505EB17217
	for <lists+linux-stm32@lfdr.de>; Thu, 31 Jul 2025 15:32:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A730FC3F938;
	Thu, 31 Jul 2025 13:32:15 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0EE41C3F933
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 31 Jul 2025 13:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
 Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
 Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
 In-Reply-To:References; bh=yfEHBZ02wUVwRXSKBRQb6U57So6qITtjQ8Vyh+zAsHY=; b=x3
 NX7dX0lbkdeNEwffn13vC0JOlNuFr3f1HVsqcNK8OqvHLEdXSwBn/QQXiGa8FBSzv+ylFNEoLS7Dg
 OKoeKKITgmI3sB4qVJJgpux2oJguBXJXMW4GU9o09ogE+ldh7Jn1K1+33vCOMBv7zEp9RHE7hXQSB
 4GtOvSKCAlpfPn8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1uhTNw-003N6x-RK; Thu, 31 Jul 2025 15:31:52 +0200
Date: Thu, 31 Jul 2025 15:31:52 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: =?utf-8?B?5p2O5b+X?= <lizhi2@eswincomputing.com>
Message-ID: <bad83fec-afca-4c41-bee4-e4e4f9ced57a@lunn.ch>
References: <20250703091808.1092-1-weishangjuan@eswincomputing.com>
 <20250703092015.1200-1-weishangjuan@eswincomputing.com>
 <c212c50e-52ae-4330-8e67-792e83ab29e4@lunn.ch>
 <7ccc507d.34b1.1980d6a26c0.Coremail.lizhi2@eswincomputing.com>
 <e734f2fd-b96f-4981-9f00-a94f3fd03213@lunn.ch>
 <6c5f12cd.37b0.1982ada38e5.Coremail.lizhi2@eswincomputing.com>
 <6b3c8130-77f0-4266-b1ed-2de80e0113b0@lunn.ch>
 <006c01dbfafb$3a99e0e0$afcda2a0$@eswincomputing.com>
 <28a48738-af05-41a4-be4c-5ca9ec2071d3@lunn.ch>
 <2b4deeba.3f61.1985fb2e8d4.Coremail.lizhi2@eswincomputing.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2b4deeba.3f61.1985fb2e8d4.Coremail.lizhi2@eswincomputing.com>
Cc: vladimir.oltean@nxp.com, edumazet@google.com, jszhang@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, robh@kernel.org,
 weishangjuan@eswincomputing.com, ningyu@eswincomputing.com, 0x1207@gmail.com,
 kuba@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org,
 jan.petrous@oss.nxp.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 rmk+kernel@armlinux.org.uk, yong.liang.choong@linux.intel.com,
 dfustini@tenstorrent.com, linux-arm-kernel@lists.infradead.org,
 pinkesh.vaghela@einfochips.com, linmin@eswincomputing.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch,
 boon.khai.ng@altera.com, mcoquelin.stm32@gmail.com, inochiama@gmail.com,
 krzk+dt@kernel.org, davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH v3 2/2] ethernet: eswin: Add eic7700
 ethernet driver
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

> > You hardware has a lot of flexibility, but none of if should actually
> > be needed, if you follow the standard.
> > =

> > So phy-mode =3D "rgmii-id"; should be all you need for most boards.
> > Everything else should be optional, with sensible defaults.
> > =

> =

> On our platform, the vendor-specific attributes eswin,dly-param-* were
> initially introduced to compensate for board-specific variations in RGMII
> signal timing, primarily due to differences in PCB trace lengths.

So it seems like, because you have the flexibility in the hardware,
you designed your PCB poorly, breaking the standard, so now must have
these properties.  It would of been much better if you had stuck to
the standard...

Please ensure your default values, when nothing is specified in DT,
correspond to a board which actually fulfils the standard. The next
board which is made using this device can then avoid having anything
special in there DT blob.

> These attributes allow fine-grained, per-signal delay control for RXD, TX=
D,
> TXEN, RXDV, RXCLK, and TXCLK, based on empirically derived optimal phase
> settings.
> In our experience, setting phy-mode =3D "rgmii-id" alone, along with only
> the standard properties rx-internal-delay-ps and tx-internal-delay-ps,
> has proven insufficient to meet our hardware's timing requirements.

You don't need vendor properties for RXCLK and TXCLK, that is what
tx-internal-delay-ps and rx-internal-delay-ps do. They change the
clock signal relative to TX and RX data. So you only need properties
for TXEN and RXDV. You should probably call these
eswin,txen-internal-delay-ps and eswin,rxdv-internal-delay-ps.  In the
binding you need to clearly define what these mean, for your hardware,
i.e.  what is the delay relative to?

> 1. Setting all delay parameters (RXD, TXD, TXEN, RXDV, RXCLK, and TXCLK)
>    using vendor-specific attributes=A0eswin,dly-param-*.
>    e.g.
>    eswin,dly-param-1000m =3D <0x20202020 0x96205A20 0x20202020>;
> 2. Setting delay parameters (RXD, TXD, TXEN, RXDV) using vendor-specific
>    attributes=A0eswin,dly-param-*=A0, RXCLK using rx-internal-delay-ps and
>    TXCLK using tx-internal-delay-ps.
>    e.g
>    eswin,dly-param-1000m =3D <0x20202020 0x80200020 0x20202020>;
>    rx-internal-delay-ps =3D <9000>;
>    tx-internal-delay-ps =3D <2200>;

Neither. DT should not contain HW values you poke into registers. They
should be SI using, in this case, pico seconds. From these delays in
picoseconds, have the driver calculate what values should be written
into the registers.

And these delay values are unlikely to be correct. You are using
rgmii-id, so the PHY is adding 2ns. You want the MAC to make small
tuning adjustments, so 200 could be reasonable, but 9000ps is way too
big.

	Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
