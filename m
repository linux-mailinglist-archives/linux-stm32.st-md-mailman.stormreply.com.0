Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2053DB3A7CB
	for <lists+linux-stm32@lfdr.de>; Thu, 28 Aug 2025 19:22:59 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AB741C30883;
	Thu, 28 Aug 2025 17:22:58 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C8E30C36B0D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 28 Aug 2025 17:22:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 49BAC45017;
 Thu, 28 Aug 2025 17:22:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7B7EC4CEF5;
 Thu, 28 Aug 2025 17:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756401775;
 bh=D64Dcw+3Q7Bhw7cRL3Mx51sKXxd32kG6A6P2l/nGXPI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=NniPVCL70CJLdBOdxQoW1jaUw3KHNNjTpnByZBXqpMVCAZP6eWtTCp1uK0XEEB00u
 kuHZ0awF3fnjhHf6IH6lJMdKgqVDcRh42ivtIHDLmJRs8ttBqcFf87Jy2jplZeLM3o
 zV9PXCeb/dnaMbPIH0VPYOJ5JKvIpMI2uV6RRVexO3ZmIZaS4mStzp7Wgt12uDwPOi
 Z6/VxNFYcJG2ZtfnAevv1gZT+T0kUpAtm+74fTBX9TXUh7C6HM99sp/lHozeiLbFng
 gEsXq5bQHE6s2jopMhGWOQsPuHfUhZtsa+Fmx1U8CkEtQcw9dUK3tYt6YoW7TAwc35
 /2mMgE9BOicQg==
Date: Thu, 28 Aug 2025 12:22:53 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Christian Bruel <christian.bruel@foss.st.com>
Message-ID: <20250828172253.GA949714@bhelgaas>
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
> ...

> +static int stm32_pcie_start_link(struct dw_pcie *pci)
> +{
> +	struct stm32_pcie *stm32_pcie = to_stm32_pcie(pci);
> +	int ret;
> +
> +	if (stm32_pcie->link_status == STM32_PCIE_EP_LINK_ENABLED) {
> +		dev_dbg(pci->dev, "Link is already enabled\n");
> +		return 0;
> +	}

While looking at the "incorrectly reset" comment, I noticed
stm32_pcie->link_status and wondered why it exists.  It looks like
it's only used in stm32_pcie_start_link() and stm32_pcie_stop_link(),
and I don't see similar tracking in other drivers.

It feels a little racy because the link might go down for reasons
other than calling stm32_pcie_stop_link().

> +	dev_dbg(pci->dev, "Enable link\n");
> +
> +	ret = stm32_pcie_enable_link(pci);
> +	if (ret) {
> +		dev_err(pci->dev, "PCIe cannot establish link: %d\n", ret);
> +		return ret;
> +	}
> +
> +	enable_irq(stm32_pcie->perst_irq);
> +
> +	stm32_pcie->link_status = STM32_PCIE_EP_LINK_ENABLED;
> +
> +	return 0;
> +}
> +
> +static void stm32_pcie_stop_link(struct dw_pcie *pci)
> +{
> +	struct stm32_pcie *stm32_pcie = to_stm32_pcie(pci);
> +
> +	if (stm32_pcie->link_status == STM32_PCIE_EP_LINK_DISABLED) {
> +		dev_dbg(pci->dev, "Link is already disabled\n");
> +		return;
> +	}
> +
> +	dev_dbg(pci->dev, "Disable link\n");
> +
> +	disable_irq(stm32_pcie->perst_irq);
> +
> +	stm32_pcie_disable_link(pci);
> +
> +	stm32_pcie->link_status = STM32_PCIE_EP_LINK_DISABLED;
> +}
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
