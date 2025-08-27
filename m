Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BB57B389F5
	for <lists+linux-stm32@lfdr.de>; Wed, 27 Aug 2025 20:58:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D0050C3F958;
	Wed, 27 Aug 2025 18:58:29 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4E434C3F957
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 27 Aug 2025 18:58:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 33F3B60266;
 Wed, 27 Aug 2025 18:58:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8403C4CEEB;
 Wed, 27 Aug 2025 18:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756321106;
 bh=k/tPNcfJ/qdnWRcsE6nXClRCEZmBAkB4S98CVmbWffE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=p/A4hCuXnw78K2/C7/7U2ep3c3mB0WH5FKsFfvMkA9XgZ3H7LOX8UCUSWJNoafOwu
 VJwzEpoV0FLpzBZU2Gw77yR4FhTSim9ud/WuydhPXNXtF/rGRXGfd+YK3F5on9j3m1
 BS5UCJTAZLWfEiDJLhUiXABrbbSP1hTFOC4xOKq0sIZR+fCLsoqZpQlzLmgFotwXwP
 JttlA+091dVHUkpQgd8HOqDX2sV3jjLpIwqXnPEyTY1NeHt8YuYy8Rg6HWDtPSKuuJ
 jW3ADEJW9Z1TzPtmOWkaj5LY0S4P5ZnFSbOb2JCD/SeOL3yUWwPQSTKjtiQSTch1dj
 WebNWWgPMD0CA==
Date: Wed, 27 Aug 2025 13:58:25 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Christian Bruel <christian.bruel@foss.st.com>
Message-ID: <20250827185825.GA894342@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250820075411.1178729-7-christian.bruel@foss.st.com>
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

On Wed, Aug 20, 2025 at 09:54:06AM +0200, Christian Bruel wrote:
> Add driver to configure the STM32MP25 SoC PCIe Gen1 2.5GT/s or Gen2 5GT/s
> controller based on the DesignWare PCIe core in endpoint mode.

> +static void stm32_pcie_perst_deassert(struct dw_pcie *pci)
> +{
> +	struct stm32_pcie *stm32_pcie = to_stm32_pcie(pci);
> +	struct device *dev = pci->dev;
> +	struct dw_pcie_ep *ep = &pci->ep;
> +	int ret;
> +
> +	dev_dbg(dev, "PERST de-asserted by host\n");
> +
> +	ret = pm_runtime_resume_and_get(dev);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to resume runtime PM: %d\n", ret);
> +		return;
> +	}
> +
> +	ret = stm32_pcie_enable_resources(stm32_pcie);
> +	if (ret) {
> +		dev_err(dev, "Failed to enable resources: %d\n", ret);
> +		goto err_pm_put_sync;
> +	}
> +
> +	/*
> +	 * Need to reprogram the configuration space registers here because the
> +	 * DBI registers were incorrectly reset by the PHY RCC during phy_init().

Is this incorrect reset of DBI registers a software issue or some kind
of hardware erratum that might be fixed someday?  Or maybe it's just a
characteristic of the hardware and thus not really "incorrect"?

I do see that qcom_pcie_perst_deassert() in pcie-qcom-ep.c also calls
dw_pcie_ep_init_registers() in the qcom_pcie_ep_perst_irq_thread()
path.

So does pex_ep_event_pex_rst_deassert() (pcie-tegra194.c) in the
tegra_pcie_ep_pex_rst_irq() path.

But as far as I can tell, none of the other dwc drivers need this, so
maybe it's something to do with the glue around the DWC core?

> +	 */
> +	ret = dw_pcie_ep_init_registers(ep);
> +	if (ret) {
> +		dev_err(dev, "Failed to complete initialization: %d\n", ret);
> +		goto err_disable_resources;
> +	}
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
