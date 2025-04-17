Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A146A92BD2
	for <lists+linux-stm32@lfdr.de>; Thu, 17 Apr 2025 21:31:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1927AC78F72;
	Thu, 17 Apr 2025 19:31:12 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8716ECFAC4A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Apr 2025 19:31:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 3BBF2A4A49B;
 Thu, 17 Apr 2025 19:25:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2777C4CEE4;
 Thu, 17 Apr 2025 19:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744918269;
 bh=9AX6tVfbkd+pSYNXJrk75ytubbBqDkCzzjRuH1cCBcI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=C3givaiBZ9ajgF4VdBGY/2PGt6kDEdJY24QBrLscfHSkVIs0JkxrLLvGUy+aPIisL
 YVNGCEBiKXeq9hfyPYEqqSKRPl0Z3mlXn2i3faLy0ZNTymx8+GLAuBu+n7nE7k3x/Z
 QgAU+7feL5Z8uN5PuRXAlTm/xeolipSvGwMGfY2HDVDqUiTU2hI5V/yvoOR25vCtGU
 ymP47NCvBN/B4vrjSmLdtg2CXYzhSa445aOwMOWSm3bjLqTx38HkmE6mMBh8ZSU8ZX
 EixnmcB4+POaXdUK22IXvJTtR/Ylgd4aIZh29brR0Km7YZBrFgZJjFd3mTrXBQRWxQ
 8+gNBWETf42RQ==
Date: Thu, 17 Apr 2025 14:31:07 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Christian Bruel <christian.bruel@foss.st.com>
Message-ID: <20250417193107.GA123243@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250417131833.3427126-3-christian.bruel@foss.st.com>
Cc: kw@linux.com, conor+dt@kernel.org, p.zabel@pengutronix.de, robh@kernel.org,
 linux-pci@vger.kernel.org, lpieralisi@kernel.org, thippeswamy.havalige@amd.com,
 linux-kernel@vger.kernel.org, cassel@kernel.org, devicetree@vger.kernel.org,
 quic_schintav@quicinc.com, linux-arm-kernel@lists.infradead.org,
 mcoquelin.stm32@gmail.com, manivannan.sadhasivam@linaro.org,
 bhelgaas@google.com, krzk+dt@kernel.org, shradha.t@samsung.com,
 linux-stm32@st-md-mailman.stormreply.com, johan+linaro@kernel.org
Subject: Re: [Linux-stm32] [PATCH v6 2/9] PCI: stm32: Add PCIe host support
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

On Thu, Apr 17, 2025 at 03:18:26PM +0200, Christian Bruel wrote:
> Add driver for the STM32MP25 SoC PCIe Gen1 2.5 GT/s and Gen2 5GT/s
> controller based on the DesignWare PCIe core.

> +static void stm32_pcie_deassert_perst(struct stm32_pcie *stm32_pcie)
> +{
> +	/* Delay PERST# de-assertion t least 100ms he power to become stable */

s/ t / at /
s/ he / for / ?

Could also remove "100ms".

> +	msleep(PCIE_T_PVPERL_MS);
> +
> +	gpiod_set_value(stm32_pcie->perst_gpio, 0);
> +
> +	/* Wait 100ms for the REFCLK to becode stable  */

s/becode/become/

Could drop "100ms" here, too.

> +	if (stm32_pcie->perst_gpio)
> +		msleep(PCIE_T_RRS_READY_MS);
> +}

> +	if (stm32_pcie->wake_gpio) {
> +		wake_irq = gpiod_to_irq(stm32_pcie->wake_gpio);
> +		ret = dev_pm_set_dedicated_wake_irq(dev, wake_irq);
> +		if (ret) {
> +			dev_info(dev, "Failed to enable wake# %d\n", ret);

I guess this refers to the "WAKE#" signal in the spec?  Could
capitalize to remove the question.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
