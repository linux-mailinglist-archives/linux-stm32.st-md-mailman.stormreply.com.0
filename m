Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 89564B3A788
	for <lists+linux-stm32@lfdr.de>; Thu, 28 Aug 2025 19:16:27 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3B907C30883;
	Thu, 28 Aug 2025 17:16:27 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 60E91C36B0D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 28 Aug 2025 17:16:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id EF31F443CD;
 Thu, 28 Aug 2025 17:16:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DE76C4CEF4;
 Thu, 28 Aug 2025 17:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756401383;
 bh=Kmt4M/Z2w+PlibUTUari/qi5WTPoz/7V3tEAWMttjcs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=lXMjNa1OLazCVKdubqEGCO/lXhyt1mqLJQfntrNgnF2MeIfopD2JSL24bzM3r9g9r
 2FQ23qtLYZLlOH1o3RU26+tDTfmBIwux0hZ2dKZe/xQpgbAQud8uJWbM0fsG+dMUdm
 vuO8pvW/zTg9XPl2CMq9Z8VxXu5j9D0/OjmzDW/WoUCZae0+h9u1t6E1C5SEkwh5S6
 NiPEA3+OmmoeyhCYFFjVSDB0YGXiGktNmSWf4gX+mqBVSG5R/MRlGpN6c5OR5n+hbw
 y4YzH8G2J8JZrbEx1Ub9PxBMWtap5lkFUZqod4nTSCoJBR5XHfFeXcOEwGeXkdFT2B
 CJQt+pQ4f0P9g==
Date: Thu, 28 Aug 2025 12:16:22 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Christian Bruel <christian.bruel@foss.st.com>
Message-ID: <20250828171622.GA945192@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9133348a-f6a4-4425-98e2-a784a7620b3a@foss.st.com>
Cc: linux-doc@vger.kernel.org, linux-pci@vger.kernel.org, lpieralisi@kernel.org,
 quic_schintav@quicinc.com, linux-stm32@st-md-mailman.stormreply.com,
 kwilczynski@kernel.org, namcao@linutronix.de, robh@kernel.org, corbet@lwn.net,
 linux-arm-kernel@lists.infradead.org, linus.walleij@linaro.org,
 mayank.rana@oss.qualcomm.com, devicetree@vger.kernel.org, conor+dt@kernel.org,
 mcoquelin.stm32@gmail.com, mani@kernel.org, qiang.yu@oss.qualcomm.com,
 linux-gpio@vger.kernel.org, bhelgaas@google.com, johan+linaro@kernel.org,
 shradha.t@samsung.com, thippeswamy.havalige@amd.com, inochiama@gmail.com,
 linux-kernel@vger.kernel.org, p.zabel@pengutronix.de, krzk+dt@kernel.org
Subject: Re: [Linux-stm32] [PATCH v13 06/11] PCI: stm32: Add PCIe Endpoint
 support for STM32MP25
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

On Thu, Aug 28, 2025 at 02:12:57PM +0200, Christian Bruel wrote:
> On 8/27/25 20:58, Bjorn Helgaas wrote:
> > On Wed, Aug 20, 2025 at 09:54:06AM +0200, Christian Bruel wrote:
> > > Add driver to configure the STM32MP25 SoC PCIe Gen1 2.5GT/s or Gen2 5GT/s
> > > controller based on the DesignWare PCIe core in endpoint mode.
> > 
> > > +static void stm32_pcie_perst_deassert(struct dw_pcie *pci)
> > > +{
> > > +	struct stm32_pcie *stm32_pcie = to_stm32_pcie(pci);
> > > +	struct device *dev = pci->dev;
> > > +	struct dw_pcie_ep *ep = &pci->ep;
> > > +	int ret;
> > > +
> > > +	dev_dbg(dev, "PERST de-asserted by host\n");
> > > +
> > > +	ret = pm_runtime_resume_and_get(dev);
> > > +	if (ret < 0) {
> > > +		dev_err(dev, "Failed to resume runtime PM: %d\n", ret);
> > > +		return;
> > > +	}
> > > +
> > > +	ret = stm32_pcie_enable_resources(stm32_pcie);
> > > +	if (ret) {
> > > +		dev_err(dev, "Failed to enable resources: %d\n", ret);
> > > +		goto err_pm_put_sync;
> > > +	}
> > > +
> > > +	/*
> > > +	 * Need to reprogram the configuration space registers here because the
> > > +	 * DBI registers were incorrectly reset by the PHY RCC during phy_init().
> > 
> > Is this incorrect reset of DBI registers a software issue or some kind
> > of hardware erratum that might be fixed someday?  Or maybe it's just a
> > characteristic of the hardware and thus not really "incorrect"?
> > 
> > I do see that qcom_pcie_perst_deassert() in pcie-qcom-ep.c also calls
> > dw_pcie_ep_init_registers() in the qcom_pcie_ep_perst_irq_thread()
> > path.
> > 
> > So does pex_ep_event_pex_rst_deassert() (pcie-tegra194.c) in the
> > tegra_pcie_ep_pex_rst_irq() path.
> > 
> > But as far as I can tell, none of the other dwc drivers need this, so
> > maybe it's something to do with the glue around the DWC core?
> 
> The RCC PHY reset is connected to the Synopsys cold reset logic, which
> explains why the registers need to be restored. This point has been
> addressed in the reference manual.

OK.  I dropped "incorrectly" from the comment because I think future
readers will wonder about whether or how this could be fixed, and it
sounds like it's just a feature of the hardware that we need to deal
with.

> > > +	 */
> > > +	ret = dw_pcie_ep_init_registers(ep);
> > > +	if (ret) {
> > > +		dev_err(dev, "Failed to complete initialization: %d\n", ret);
> > > +		goto err_disable_resources;
> > > +	}
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
