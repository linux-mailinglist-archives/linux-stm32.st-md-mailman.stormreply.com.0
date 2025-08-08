Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F099BB1ED32
	for <lists+linux-stm32@lfdr.de>; Fri,  8 Aug 2025 18:45:33 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1318BC3F952;
	Fri,  8 Aug 2025 16:45:33 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2FC05C349C4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  8 Aug 2025 16:45:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id BFE3741990;
 Fri,  8 Aug 2025 16:45:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35B18C4CEED;
 Fri,  8 Aug 2025 16:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1754671529;
 bh=//umrJE1AbcTB9AycRys08E8KmLxAmzbvhRupedv5Dc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=SvHuX7FEsNr/3GDzQCcVIGtDMzLvyEzFXv2qcJIyKcwE3G78CSt/D7BpyK8W2wlnq
 JcneXt1bupQaxlOiNKQqGSnYPJN3gHF2rsyY9huClbmsgeaaWtB6ztvE8lig3YSkom
 typw/etKQmR4W3aFAdlT3O1MtBlp3Ep1wqgigkNBBW9L/SL+AkcJKVVpBD//k/2gSL
 VjeTSEi189qln5PGC1fpGpcbTwSuFr32t8jznTpd45Yw4mTx9q/Wd/Cns+n+M12cC2
 Se0DxDoj28CwAkOJDftgEKv/PP5dBs1tSEC+Fc0no1sAx+NaR6LTEctwBcOto5dXzv
 ABu30wpzFBPDA==
Date: Fri, 8 Aug 2025 11:45:27 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Christian Bruel <christian.bruel@foss.st.com>
Message-ID: <20250808164527.GA92564@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e7cd764d-bc6d-4e39-aa03-0eee8e30d3e5@foss.st.com>
Cc: robh@kernel.org, conor+dt@kernel.org, linux-kernel@vger.kernel.org,
 p.zabel@pengutronix.de, mani@kernel.org, linux-pci@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, thippeswamy.havalige@amd.com,
 linux-stm32@st-md-mailman.stormreply.com, cassel@kernel.org,
 devicetree@vger.kernel.org, quic_schintav@quicinc.com,
 linux-arm-kernel@lists.infradead.org, mcoquelin.stm32@gmail.com,
 bhelgaas@google.com, krzk+dt@kernel.org, shradha.t@samsung.com,
 lpieralisi@kernel.org, johan+linaro@kernel.org, kwilczynski@kernel.org
Subject: Re: [Linux-stm32] [PATCH v12 2/9] PCI: stm32: Add PCIe host support
	for STM32MP25
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

On Fri, Aug 08, 2025 at 04:55:52PM +0200, Christian Bruel wrote:
> On 8/7/25 20:09, Bjorn Helgaas wrote:
> > [+to Linus for pinctrl usage question below]
> > 
> > On Tue, Jun 10, 2025 at 11:07:07AM +0200, Christian Bruel wrote:
> > > Add driver for the STM32MP25 SoC PCIe Gen1 2.5 GT/s and Gen2 5GT/s
> > > controller based on the DesignWare PCIe core.

> > > +	return pinctrl_pm_select_sleep_state(dev);
> > 
> > Isn't there some setup required before we can use
> > pinctrl_select_state(), pinctrl_pm_select_sleep_state(),
> > pinctrl_pm_select_default_state(), etc?
> > 
> > I expected something like devm_pinctrl_get() in the .probe() path, but
> > I don't see anything.  I don't know how pinctrl works, but I don't see
> > how dev->pins gets set up.
> 
> Linus knows better, but the dev->pins states are attached to the dev struct
> before probe by the pinctrl driver
> 
> /**
>  * pinctrl_bind_pins() - called by the device core before probe
>  * @dev: the device that is just about to probe
>  */
> int pinctrl_bind_pins(struct device *dev)

Thanks for the pointer.  Might be worthy of a mention in
Documentation/driver-api/pin-control.rst.  Maybe pinctrl/consumer.h
could even have a bread crumb to that effect since drivers use all
those interfaces that rely in the implicit initialization done before
their .probe().

pin-control.rst mentions pinctrl_get_select_default() being called
just before the driver probe, but that's now unused and it looks like
pinctrl_bind_pins() does something similar:

  really_probe
    pinctrl_bind_pins
      dev->pins = devm_kzalloc()
      devm_pinctrl_get
      pinctrl_lookup_state(PINCTRL_STATE_DEFAULT)
      pinctrl_lookup_state(PINCTRL_STATE_INIT)
      pinctrl_select_state(init)      # if present, else default
    call_driver_probe

Bjorn
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
