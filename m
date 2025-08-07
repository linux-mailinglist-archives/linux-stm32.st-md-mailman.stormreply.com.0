Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D0954B1DCD7
	for <lists+linux-stm32@lfdr.de>; Thu,  7 Aug 2025 20:05:24 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9E3F4C36B15;
	Thu,  7 Aug 2025 18:05:23 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4F3F8C36B0D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  7 Aug 2025 18:05:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id CC1D445429;
 Thu,  7 Aug 2025 18:05:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D6AFC4CEEB;
 Thu,  7 Aug 2025 18:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1754589920;
 bh=xKpdGfGG9X89d+WYFfLmSef3z1eEJiPKsaCnJZfi//o=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=c56iw94LMjfCTQ66ZGwvscHeQingtEi1BN5o2AVxTSaGSKTDiuQ6+ltUm7Jdakf0p
 KJHhGzLT5y3/d1/pgUJee+oXgPAWU3BQuDWkmfluEH/+0xKhdpe/qHyf3SGc3JnUo7
 Kzl5xxmGFv4fXuDQMYXaH6cNq5WDiLIZf5u6/Zczvv4og25ptx6G2py/u43Ti8RIlx
 5TsyHim7Q5xI5qtrH8T0+53Wd4nQG/fNppMfQG7PRkTVwcbXXhh6oU1PJIxcJNdNPK
 qvnZFc3aAGv2A9McbAffQmwJDw3f7eRRmRM6jO6olH4SeyB3SzyI+gwAvRnCbF3LgY
 z8RTMlTWzR78Q==
Date: Thu, 7 Aug 2025 13:05:19 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Christian Bruel <christian.bruel@foss.st.com>
Message-ID: <20250807180519.GA56557@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250717063042.2236524-3-christian.bruel@foss.st.com>
Cc: robh@kernel.org, linux-kernel@vger.kernel.org,
 kernel test robot <lkp@intel.com>, mani@kernel.org, linux-pci@vger.kernel.org,
 lpieralisi@kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-gpio@vger.kernel.org, mcoquelin.stm32@gmail.com, bhelgaas@google.com,
 linus.walleij@linaro.org, linux-arm-kernel@lists.infradead.org,
 kwilczynski@kernel.org
Subject: Re: [Linux-stm32] [RESEND PATCH 2/2] PCI: stm32: use
 pinctrl_pm_select_init_state() in stm32_pcie_resume_noirq()
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

On Thu, Jul 17, 2025 at 08:30:42AM +0200, Christian Bruel wrote:
> Replace direct access to dev->pins->init_state with the new helper
> pinctrl_pm_select_init_state() to select the init pinctrl state.
> This fixes build issues when CONFIG_PINCTRL is not defined.
> 
> Signed-off-by: Christian Bruel <christian.bruel@foss.st.com>
> Reported-by: Bjorn Helgaas <bhelgaas@google.com>  
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202506260920.bmQ9hQ9s-lkp@intel.com/
> Fixes: 633f42f48af5 ("PCI: stm32: Add PCIe host support for STM32MP25")

633f42f48af5 is still on pci/controller/dwc-stm32, but only for
reference.  After v6.17-rc1, we will need to rebase to it and figure
out the merge strategy.

Part of that will be to restructure 633f42f48af5 and the material
below such that there is no build issue at any point in the series.

> ---
>  drivers/pci/controller/dwc/pcie-stm32.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-stm32.c b/drivers/pci/controller/dwc/pcie-stm32.c
> index 50fae5f5ced2..c1d803dc3778 100644
> --- a/drivers/pci/controller/dwc/pcie-stm32.c
> +++ b/drivers/pci/controller/dwc/pcie-stm32.c
> @@ -28,6 +28,7 @@ struct stm32_pcie {
>  	struct clk *clk;
>  	struct gpio_desc *perst_gpio;
>  	struct gpio_desc *wake_gpio;
> +	bool   have_pinctrl_init;
>  };
>  
>  static void stm32_pcie_deassert_perst(struct stm32_pcie *stm32_pcie)
> @@ -91,10 +92,10 @@ static int stm32_pcie_resume_noirq(struct device *dev)
>  	/*
>  	 * The core clock is gated with CLKREQ# from the COMBOPHY REFCLK,
>  	 * thus if no device is present, must force it low with an init pinmux
> -	 * to be able to access the DBI registers.
> +	 * if present to be able to access the DBI registers.
>  	 */
> -	if (!IS_ERR(dev->pins->init_state))
> -		ret = pinctrl_select_state(dev->pins->p, dev->pins->init_state);
> +	if (stm32_pcie->have_pinctrl_init)
> +		ret = pinctrl_pm_select_init_state(dev);
>  	else
>  		ret = pinctrl_pm_select_default_state(dev);
>  
> @@ -274,6 +275,9 @@ static int stm32_pcie_probe(struct platform_device *pdev)
>  		return dev_err_probe(dev, PTR_ERR(stm32_pcie->rst),
>  				     "Failed to get PCIe reset\n");
>  
> +	if (device_property_match_string(dev, "pinctrl-names", PINCTRL_STATE_INIT) >= 0)
> +		stm32_pcie->have_pinctrl_init = true;
> +
>  	ret = stm32_pcie_parse_port(stm32_pcie);
>  	if (ret)
>  		return ret;
> -- 
> 2.34.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
