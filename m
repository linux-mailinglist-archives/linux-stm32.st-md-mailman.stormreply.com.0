Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 49EC0AADFCD
	for <lists+linux-stm32@lfdr.de>; Wed,  7 May 2025 14:54:04 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EE882C7A820;
	Wed,  7 May 2025 12:54:03 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D87F2C78F9E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  7 May 2025 12:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=0fFKNksEmsQbsR0EeTe+adaYOVO5vW1ZpKsqI4+DB0w=; b=cGG+Z50pQm4mNB0XLYgfBKfuDN
 LcmS5xvP96t6kKOa1AQP65/D3VYC4jAh0qaiWrV3uxoBb8Q0GZmjaB+bch+hhgpUWJ4F5I0VcCNr7
 /4qySYXc5TTwrfO0BDKmvUcqfmaG2/6fsDXZMvQElpu34LYb4R1DhkhBVtyJ1TczM0qQ=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1uCeHd-00Bsiq-9G; Wed, 07 May 2025 14:53:57 +0200
Date: Wed, 7 May 2025 14:53:57 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Goran Radenovic <goran.radni@gmail.com>
Message-ID: <3a7ef1bd-2c0e-4637-b0b6-2c0b73388618@lunn.ch>
References: <20250505115827.29593-1-goran.radni@gmail.com>
 <20250505115827.29593-5-goran.radni@gmail.com>
 <2d0ff289-06f6-4bde-a238-097d22573d4e@lunn.ch>
 <63665c17-da37-4b5b-9c2d-28d5a669680f@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <63665c17-da37-4b5b-9c2d-28d5a669680f@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 =?iso-8859-1?Q?B=F6rge_Str=FCmpfel?= <boerge.struempfel@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v5 4/4] ARM: dts: stm32: add initial
 support for stm32mp157-ultra-fly-sbc board
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

> > > +	phy-handle = <&phy1>;
> > > +
> > > +	mdio {
> > > +		#address-cells = <1>;
> > > +		#size-cells = <0>;
> > > +		compatible = "snps,dwmac-mdio";
> > > +		phy1: ethernet-phy@1 {
> > > +			reg = <1>;
> > > +			interrupt-parent = <&gpiod>;
> > > +			interrupts = <0 IRQ_TYPE_EDGE_FALLING>;
> > 
> > PHY interrupts are 99% time level, not edge.
> 
> That is correct, but I am facing strange behavior, when I set
> IRQ_TYPE_LEVEL_LOW.
> My board stops booting at:
> 
> [    2.343233] Waiting for root device /dev/mmcblk0p4...
> [   12.638818] platform 5a006000.usbphyc: deferred probe pending
> [   12.643192] platform 49000000.usb-otg: deferred probe pending
> [   12.649029] platform 48003000.adc: deferred probe pending
> [   12.654277] platform 5800d000.usb: deferred probe pending
> [   12.659744] platform 5800c000.usb: deferred probe pending
> [   12.665089] amba 58005000.mmc: deferred probe pending
> [   12.670239] amba 58007000.mmc: deferred probe pending
> [   12.675185] platform 50025000.vrefbuf: deferred probe pending
> 
> I must investigate this. If You have any idea, You are welcome to share it.

Could be an interrupt storm. The interrupt is not getting cleared
because of something missing in the PHY driver, so it just fires again
and again.

	Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
