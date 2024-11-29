Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CB589DECC4
	for <lists+linux-stm32@lfdr.de>; Fri, 29 Nov 2024 21:58:34 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3E6BFC6C855;
	Fri, 29 Nov 2024 20:58:34 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 83588C57194
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 29 Nov 2024 20:58:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 9F35AA412FE;
 Fri, 29 Nov 2024 20:56:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B75BDC4CECF;
 Fri, 29 Nov 2024 20:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1732913905;
 bh=zZKblG1oW6ilUbzaYkY0HepGVylQVjpGP80Xxjdr6Pk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=KQiVBSEXjNg3lOwoGvXRCuJjrm7xatbZwYoYfv8aYFd2HC0x5IJwKuqgoADK5cx9K
 +KX+jmQbgvhKJQM5fpzL2YlJNdEYoFU52WttObfeKoS51O5ro2RHnsjH0sbHk9v4jY
 mZ01idn5tzWZJrtgbtOuJnR9QciqUf3vbKpMkiMsrzTUEVedYbbKlXa+qwBpRIpc7o
 j+JCVS5cVlgBCevSGvuoEVGWDx9TIVWsyegp2YjjAfCfT4NCKKbPs/KphT0mSysSZW
 8jgaVREpqN7BRnHS8uFMKh7fbOU8g8VMxSepgeHdPF4OoFOGbZAZqPDYvxd+5nR92a
 F2eJxFgKs3hvQ==
Date: Fri, 29 Nov 2024 14:58:22 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Christian Bruel <christian.bruel@foss.st.com>,
 Rob Herring <robh+dt@kernel.org>
Message-ID: <20241129205822.GA2772018@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241126155119.1574564-3-christian.bruel@foss.st.com>
Cc: kw@linux.com, conor+dt@kernel.org, p.zabel@pengutronix.de, robh@kernel.org,
 linux-pci@vger.kernel.org, lpieralisi@kernel.org, linux-kernel@vger.kernel.org,
 cassel@kernel.org, devicetree@vger.kernel.org, quic_schintav@quicinc.com,
 mcoquelin.stm32@gmail.com, manivannan.sadhasivam@linaro.org,
 bhelgaas@google.com, krzk+dt@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 2/5] PCI: stm32: Add PCIe host support
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

[+to Rob, DMA mask question]

On Tue, Nov 26, 2024 at 04:51:16PM +0100, Christian Bruel wrote:
> Add driver for the STM32MP25 SoC PCIe Gen2 controller based on the
> DesignWare PCIe core.

Can you include the numeric rate, not just "gen2", so we don't have to
search for it?

> +static int stm32_pcie_resume_noirq(struct device *dev)
> +{
> +	struct stm32_pcie *stm32_pcie = dev_get_drvdata(dev);
> +	struct dw_pcie *pci = stm32_pcie->pci;
> +	struct dw_pcie_rp *pp = &pci->pp;
> +	int ret;
> +
> +	/* init_state must be called first to force clk_req# gpio when no
> +	 * device is plugged.
> +	 */

Use drivers/pci/ conventional comment style:

  /*
   * text ...
   */

> +static bool is_stm32_pcie_driver(struct device *dev)
> +{
> +	/* PCI bridge */
> +	dev = get_device(dev);
> +
> +	/* Platform driver */
> +	dev = get_device(dev->parent);
> +
> +	return (dev->driver == &stm32_pcie_driver.driver);
> +}
> +
> +/*
> + * DMA masters can only access the first 4GB of memory space,
> + * so we setup the bus DMA limit accordingly.
> + */
> +static int stm32_dma_limit(struct pci_dev *pdev, void *data)
> +{
> +	dev_dbg(&pdev->dev, "disabling DMA DAC for device");
> +
> +	pdev->dev.bus_dma_limit = DMA_BIT_MASK(32);

I don't think this is the right way to do this.  Surely there's a way
to describe the DMA capability of the bridge once instead of iterating
over all the downstream devices?  This quirk can't work for hot-added
devices anyway.

> +	return 0;
> +}
> +
> +static void quirk_stm32_dma_mask(struct pci_dev *pci)
> +{
> +	struct pci_dev *root_port;
> +
> +	root_port = pcie_find_root_port(pci);
> +
> +	if (root_port && is_stm32_pcie_driver(root_port->dev.parent))
> +		pci_walk_bus(pci->bus, stm32_dma_limit, NULL);
> +}
> +DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_SYNOPSYS, 0x0550, quirk_stm32_dma_mask);
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
