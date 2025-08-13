Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 13006B2539A
	for <lists+linux-stm32@lfdr.de>; Wed, 13 Aug 2025 21:06:39 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 26561C36B2C;
	Wed, 13 Aug 2025 19:06:38 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 68B68C36B27
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 Aug 2025 19:06:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 5411F601D6;
 Wed, 13 Aug 2025 19:06:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBF5FC4CEEB;
 Wed, 13 Aug 2025 19:06:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755111995;
 bh=wBSCYvD6eI/0TlyZhgU8cG9wLNrFJkRgE09i4a9qP58=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=OBlNzSvRjYqb41fYPkb3XtEcTVzUOCIp4pAPjdUcdNq5BEF6bkAtQusOWZ8qpO1rh
 dECUANL8UKjbFMWY19cFtNLzPNbTB70lFZeDmR4GG9SXmuKvsKGka9J9bOXBE9CmUI
 xI8Sun32XfDsGo1XAwxxItZ/b+3r+cZ1S6/tl8VXVgPt4NOugGilQkaYmyRrNtUcCe
 8Bb81m1ZPt/nngE+7NgXcWBZZFQh857JxRS0+0Zl32NvbnBXl901oGQFPQwccwT9bE
 j/huJWTJgU7/LqTKJuLWIm0LCCXuC7+S/NVFmHOaTmwI5BIkBJlKY+AJjamr5py9Rr
 QQet0O7smwECw==
Date: Wed, 13 Aug 2025 14:06:33 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Christian Bruel <christian.bruel@foss.st.com>
Message-ID: <20250813190633.GA284987@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250813115319.212721-1-christian.bruel@foss.st.com>
Cc: robh@kernel.org, linux-kernel@vger.kernel.org,
 kernel test robot <lkp@intel.com>, mani@kernel.org, linux-pci@vger.kernel.org,
 lpieralisi@kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-gpio@vger.kernel.org, mcoquelin.stm32@gmail.com, bhelgaas@google.com,
 linus.walleij@linaro.org, linux-arm-kernel@lists.infradead.org,
 kwilczynski@kernel.org
Subject: Re: [Linux-stm32] [PATCH v1] PCI: stm32: use
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

On Wed, Aug 13, 2025 at 01:53:19PM +0200, Christian Bruel wrote:
> Replace direct access to dev->pins->init_state with the new helper
> pinctrl_pm_select_init_state() to select the init pinctrl state.
> This fixes build issues when CONFIG_PINCTRL is not defined.
> 
> Depends-on: <20250813081139.93201-3-christian.bruel@foss.st.com>
> Reported-by: Bjorn Helgaas <bhelgaas@google.com>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202506260920.bmQ9hQ9s-lkp@intel.com/
> Fixes: 633f42f48af5 ("PCI: stm32: Add PCIe host support for STM32MP25")
> Signed-off-by: Christian Bruel <christian.bruel@foss.st.com>

I can't merge 633f42f48af5 as-is because of the build issue.

Pinctrl provides stubs for the non-CONFIG_PINCTRL case; the issue is
that 633f42f48af5 uses dev->pins, which only exists when
CONFIG_PINCTRL is enabled.  

The possibilities I see are:

  1) Merge initial stm32 without suspend/resume support via PCI, merge
     pinctrl_pm_select_init_state() via pinctrl, then add stm32
     suspend/resume support.  pinctrl_pm_select_init_state() and stm32
     (without suspend/resume) would appear in v6.18, and stm32
     suspend/resume would be added in v6.19.

  2) Temporarily #ifdef the dev->pins use.  pinctrl_pm_select_init_state()
     and stm32 (with #ifdef) would appear in v6.18, follow-on patch to
     replace #ifdef with pinctrl_pm_select_init_state() would appear
     in v6.19.

  3) Merge your [1] to add pinctrl_pm_select_init_state() via PCI with
     Linus's ack, followed by the stm32 series with the change below
     squashed in.  Everything would appear in v6.18.

I'm OK with any of these.

[1] https://lore.kernel.org/r/20250813081139.93201-1-christian.bruel@foss.st.com

> ---
> Changes in v1:
>  - pinctrl_pm_select_init_state() return 0 if the state is not defined.
>    No need to test as pinctrl_pm_select_default_state() is called.
> ---
>  drivers/pci/controller/dwc/pcie-stm32.c | 10 +++-------
>  1 file changed, 3 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-stm32.c b/drivers/pci/controller/dwc/pcie-stm32.c
> index 50fae5f5ced2..8501b9ed0633 100644
> --- a/drivers/pci/controller/dwc/pcie-stm32.c
> +++ b/drivers/pci/controller/dwc/pcie-stm32.c
> @@ -90,14 +90,10 @@ static int stm32_pcie_resume_noirq(struct device *dev)
>  
>  	/*
>  	 * The core clock is gated with CLKREQ# from the COMBOPHY REFCLK,
> -	 * thus if no device is present, must force it low with an init pinmux
> -	 * to be able to access the DBI registers.
> +	 * thus if no device is present, must deassert it with a GPIO from
> +	 * pinctrl pinmux before accessing the DBI registers.
>  	 */
> -	if (!IS_ERR(dev->pins->init_state))
> -		ret = pinctrl_select_state(dev->pins->p, dev->pins->init_state);
> -	else
> -		ret = pinctrl_pm_select_default_state(dev);
> -
> +	ret = pinctrl_pm_select_init_state(dev);
>  	if (ret) {
>  		dev_err(dev, "Failed to activate pinctrl pm state: %d\n", ret);
>  		return ret;
> -- 
> 2.34.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
