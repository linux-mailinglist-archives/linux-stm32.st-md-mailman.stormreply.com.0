Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 63534A3875E
	for <lists+linux-stm32@lfdr.de>; Mon, 17 Feb 2025 16:18:30 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2318AC78F67;
	Mon, 17 Feb 2025 15:18:30 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A8FAFC7128A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Feb 2025 15:18:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=NvYluRdkIYTZI6ccj4hQ+kAHZsTnKaccn8jpIrnuS3A=; b=2UefaQrU/d+T+mYtpph7dWPoXp
 aVvHZBJgTEnrOinhX8HEMfrJs70OqL4CD3KhJuGXaJGvR9OpbNBqCMg+gEX1R/V7jE4RuB6j2CHxG
 Puzdg59ZwMIzvxt+ZI8HuIo6fHQbXq3ijGCm1odfEaEchH67hhBwbD2n8tyNyPBo+DRU=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1tk2st-00F0Ij-7o; Mon, 17 Feb 2025 16:18:11 +0100
Date: Mon, 17 Feb 2025 16:18:11 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Swathi K S <swathi.ks@samsung.com>
Message-ID: <18746e2f-4124-4f85-97d2-a040b78b4b34@lunn.ch>
References: <20250213044624.37334-1-swathi.ks@samsung.com>
 <CGME20250213044955epcas5p110d1e582c8ee02579ead73f9686819ff@epcas5p1.samsung.com>
 <20250213044624.37334-2-swathi.ks@samsung.com>
 <85e0dec0-5b40-427a-9417-cae0ed2aa484@lunn.ch>
 <00b001db7e9f$ca7cfbd0$5f76f370$@samsung.com>
 <ffb13051-ab93-4729-8b98-20e278552673@lunn.ch>
 <011901db80fb$8e968f60$abc3ae20$@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <011901db80fb$8e968f60$abc3ae20$@samsung.com>
Cc: robh@kernel.org, conor+dt@kernel.org, linux-kernel@vger.kernel.org,
 ravi.patel@samsung.com, devicetree@vger.kernel.org, netdev@vger.kernel.org,
 richardcochran@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 andrew+netdev@lunn.ch, edumazet@google.com, mcoquelin.stm32@gmail.com,
 'Pankaj Dubey' <pankaj.dubey@samsung.com>, kuba@kernel.org, krzk+dt@kernel.org,
 pabeni@redhat.com, rmk+kernel@armlinux.org.uk, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v6 1/2] dt-bindings: net: Add FSD EQoS
 device tree bindings
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

> > > > > +  phy-mode:
> > > > > +    enum:
> > > > > +      - rgmii-id
> > > >
> > > > phy-mode is normally a board property, in the .dts file, since the
> > > > board
> > > might
> > > > decide to have extra long clock lines and so want 'rgmii'.

> Hi Andrew, 
> What you said is right. Generally, PCB provides internal delay.

It is actually pretty unusual for the PCB to add the delays. But there
are some boards which do this. Which is why you should support it.

> But in this case, due to customer request, the delay was added into SoC.

Idealy, by the PHY. However, in terms of DT, the board .dts file just
needs to say 'rmgii-id', meaning that the board does not provide the
delays, so the MAC/PHY pair needs to provide the delay.

> The following doc on rgmii says that "Devices which implement internal delay
> shall be referred to as RGMII-ID. 
> Devices may offer an option to operate with/without internal delay and still
> remain compliant with this spec"
> https://community.nxp.com/pwmxy87654/attachments/pwmxy87654/imx-processors/2
> 0655/1/RGMIIv2_0_final_hp.pdf
> 
> Also, the driver is in such a way that it handles all four rgmii in the same
> way. 
> 
> Considering this, could you let us know what will be the right approach to
> take in this case?

List all four phy-modes in the binding. They should all be
valid. However, the .dtsi file should not list a phy-mode, since it is
a board property, not a SoC property.

	Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
