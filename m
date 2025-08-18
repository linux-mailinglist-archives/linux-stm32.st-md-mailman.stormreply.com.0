Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7383FB2B44B
	for <lists+linux-stm32@lfdr.de>; Tue, 19 Aug 2025 01:06:49 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1B9D2C36B24;
	Mon, 18 Aug 2025 23:06:49 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 13EF0C36B20
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 18 Aug 2025 23:06:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id BDE5844AA3;
 Mon, 18 Aug 2025 23:06:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7603C4CEEB;
 Mon, 18 Aug 2025 23:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755558402;
 bh=FEJffBBO1GLCjVFd+vVCwbbTg5k2KIInXnhfagOBwMs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=blwLuBx1g4adfeKGLh3pBnCLg9iEbXEvSOMPLrSmWNuooAFkAtZyO4IB66/G79Emr
 wFY5JUW6IO22P30f9reCRQEXOScadGZpvELaHJl6J1ddMfYSHZRKHfv9VbTCeMxxPM
 nhEj2d7FoAD9WuQzpAP2IZQvBLDdFtUCJ/e1SrahHsiUy4sZ3W2Pr8DoilPM6xwng8
 xPFcMmmcfF4gY0Br1MYl0yFfp2Io+lTINebmUgCaQcADnEb5OO3UjgXQd5sKlbSS2a
 jULfiSAnXYHHpuP+IxZwKm5kY0/lzMO7fDd2FEIHgHZhLWt4kt7AspAopU7vjB3N3u
 CkqzjyqjPGZKw==
Date: Mon, 18 Aug 2025 18:06:40 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Christian Bruel <christian.bruel@foss.st.com>
Message-ID: <20250818230640.GA560877@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <917c9323-9c0c-406f-a314-a6e4a5511b45@foss.st.com>
Cc: robh@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de,
 mani@kernel.org, linux-pci@vger.kernel.org, lpieralisi@kernel.org,
 thippeswamy.havalige@amd.com, Linus Walleij <linus.walleij@linaro.org>,
 linux-kernel@vger.kernel.org, cassel@kernel.org, devicetree@vger.kernel.org,
 quic_schintav@quicinc.com, linux-arm-kernel@lists.infradead.org,
 mcoquelin.stm32@gmail.com, bhelgaas@google.com, krzk+dt@kernel.org,
 shradha.t@samsung.com, linux-stm32@st-md-mailman.stormreply.com,
 johan+linaro@kernel.org, kwilczynski@kernel.org
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

[+cc Linus]

On Mon, Aug 18, 2025 at 12:50:19PM +0200, Christian Bruel wrote:
> On 8/13/25 21:29, Bjorn Helgaas wrote:
> > On Tue, Jun 10, 2025 at 11:07:07AM +0200, Christian Bruel wrote:
> > > Add driver for the STM32MP25 SoC PCIe Gen1 2.5 GT/s and Gen2 5GT/s
> > > controller based on the DesignWare PCIe core.
> > > ...

> > > +static int stm32_pcie_resume_noirq(struct device *dev)
> > > +{
> > > +	struct stm32_pcie *stm32_pcie = dev_get_drvdata(dev);
> > > +	int ret;
> > > +
> > > +	/*
> > > +	 * The core clock is gated with CLKREQ# from the COMBOPHY REFCLK,
> > > +	 * thus if no device is present, must force it low with an init pinmux
> > > +	 * to be able to access the DBI registers.
> > 
> > What happens on initial probe if no device is present?  I assume we
> > access DBI registers in the dw_pcie_host_init() path, and it seems
> > like we'd have the same issue with DBI not being accessible when no
> > device is present.
> 
> Correct, same issue. The magic happens with the PINCTRL init state that is
> automatically called before probe. As I tried to explain in the
> Documentation in the pinctrl patch:
> 
> - if ``init`` and ``default`` are defined in the device tree, the "init"
>   state is selected before the driver probe and the "default" state is
>   selected after the driver probe.

OK, thanks for that reminder!

The fact that the pinctrl init state is set implicitly before .probe(),
but we have to do it explicitly in .stm32_pcie_resume_noirq() seems a
*little* bit weird and makes the driver harder to review.  But ... I
guess that's out of scope for this series.

I see that Linus has given his approval to merge the new
pinctrl_pm_select_init_state() along with this series.  Would you mind
pulling those changes [1] and the use [2] into a v13 of this series?
That way I won't have to collect up all the pieces and risk missing
something.

BTW, I noticed a s/platformm/platform/ typo in the "[PATCH v1 2/2]
pinctrl: Add pinctrl_pm_select_init_state helper function" patch.

> > > +	if (!IS_ERR(dev->pins->init_state))
> > > +		ret = pinctrl_select_state(dev->pins->p, dev->pins->init_state);
> > > +	else
> > > +		ret = pinctrl_pm_select_default_state(dev);
> > > +
> > > +	if (ret) {
> > > +		dev_err(dev, "Failed to activate pinctrl pm state: %d\n", ret);
> > > +		return ret;
> > > +	}

> > > +static int stm32_add_pcie_port(struct stm32_pcie *stm32_pcie)
> > > +{
> > > +	struct device *dev = stm32_pcie->pci.dev;
> > > +	unsigned int wake_irq;
> > > +	int ret;
> > > +
> > > +	/* Start to enable resources with PERST# asserted */
> > 
> > I guess if device tree doesn't describe PERST#, we assume PERST# is
> > actually *deasserted* already at this point (because
> > stm32_pcie_deassert_perst() does nothing other than the delay)?
> 
> yes, this also implies that PV is stable

Maybe we could update the comment somehow?  Or maybe even just remove
it, since we actually don't know the state of PERST# at this point?

It sounds like we don't know the PERST# state until after we call
stm32_pcie_deassert_perst() below.

> > > +	ret = phy_set_mode(stm32_pcie->phy, PHY_MODE_PCIE);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	ret = phy_init(stm32_pcie->phy);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	ret = regmap_update_bits(stm32_pcie->regmap, SYSCFG_PCIECR,
> > > +				 STM32MP25_PCIECR_TYPE_MASK,
> > > +				 STM32MP25_PCIECR_RC);
> > > +	if (ret)
> > > +		goto err_phy_exit;
> > > +
> > > +	stm32_pcie_deassert_perst(stm32_pcie);

Bjorn

[1] https://lore.kernel.org/r/20250813081139.93201-1-christian.bruel@foss.st.com
[2] https://lore.kernel.org/r/20250813115319.212721-1-christian.bruel@foss.st.com

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
