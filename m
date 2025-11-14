Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B4987C5EF0C
	for <lists+linux-stm32@lfdr.de>; Fri, 14 Nov 2025 19:59:33 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4F58AC628DA;
	Fri, 14 Nov 2025 18:59:33 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EF341C06935
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Nov 2025 18:59:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id D22F960186;
 Fri, 14 Nov 2025 18:59:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A38BC2BC86;
 Fri, 14 Nov 2025 18:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1763146770;
 bh=kb4vVC9exWAZjRCcwIcqHoYZzk1sVFsAZ4sy0TjOZnU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=D7sY7WBeYKhYRE/ZqKAyww/oiMkz2yorlpOCsTSA+VvkPWjr4qNoyWG22jVnny5ZW
 gs1lnsk0CkM9PLT8NG7WmjnBImZZHVdI8gOxC3VQpxvgPcLkzEdBrtzzqtbFIsQ0QO
 v32878CMEiOi4xiYQJ1TBCOG/KaHrVdGiSzlX97rOSKcTu5CP4UUQ4g3RtU8sxkNrI
 DlvTIhLY8Jbdf6Dk7U87xsmeJ84UQ5oukLg/g92pvyDyFFQk7wVrNMfGMTGPwTmAog
 h0k2wxcVHwtgw0dF6Ye7nsueTLiIYzzq82Md5pqoA3DuqNnN4suN+uYB/KwaQhUd3C
 qy3j20hjujKbw==
Date: Fri, 14 Nov 2025 12:59:28 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Christian Bruel <christian.bruel@foss.st.com>
Message-ID: <20251114185928.GA2335574@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251114-perst_ep-v1-1-e7976317a890@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>,
 linux-pci@vger.kernel.org, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Bjorn Helgaas <bhelgaas@google.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org,
 Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>
Subject: Re: [Linux-stm32] [PATCH] PCI: stm32: Fix LTSSM EP race with start
	link.
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

On Fri, Nov 14, 2025 at 08:45:52AM +0100, Christian Bruel wrote:
> If the host has deasserted PERST# and started link training before the link
> is started on EP side, enabling LTSSM before the endpoint registers are
> initialized in the perst_irq handler results in probing incorrect values.
> 
> Thus, wait for the PERST# level-triggered interrupt to start link training
> at the end of initialization and cleanup the stm32_pcie_[start stop]_link
> functions.

I've seen this kind of thing in other drivers, and I wondered whether
it was safe because the host asserts and deasserts PERST#
asynchronously, independent of anything the endpoint is doing.

I assume it's possible that the host deasserts PERST# before this
driver has the stm32_pcie_ep_perst_irq_thread() thread set up.  If
that happens and the driver doesn't see the PERST# interrupt, does
everything still work correctly?

> Signed-off-by: Christian Bruel <christian.bruel@foss.st.com>
> ---
>  drivers/pci/controller/dwc/pcie-stm32-ep.c | 38 ++++++------------------------
>  1 file changed, 7 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-stm32-ep.c b/drivers/pci/controller/dwc/pcie-stm32-ep.c
> index 3400c7cd2d88a279c49ef36a99fc7537c381c384..d0654bb43759bb8d0f0d7badbf7bdae839241fcf 100644
> --- a/drivers/pci/controller/dwc/pcie-stm32-ep.c
> +++ b/drivers/pci/controller/dwc/pcie-stm32-ep.c
> @@ -37,36 +37,9 @@ static void stm32_pcie_ep_init(struct dw_pcie_ep *ep)
>  		dw_pcie_ep_reset_bar(pci, bar);
>  }
>  
> -static int stm32_pcie_enable_link(struct dw_pcie *pci)
> -{
> -	struct stm32_pcie *stm32_pcie = to_stm32_pcie(pci);
> -
> -	regmap_update_bits(stm32_pcie->regmap, SYSCFG_PCIECR,
> -			   STM32MP25_PCIECR_LTSSM_EN,
> -			   STM32MP25_PCIECR_LTSSM_EN);
> -
> -	return dw_pcie_wait_for_link(pci);
> -}
> -
> -static void stm32_pcie_disable_link(struct dw_pcie *pci)
> -{
> -	struct stm32_pcie *stm32_pcie = to_stm32_pcie(pci);
> -
> -	regmap_update_bits(stm32_pcie->regmap, SYSCFG_PCIECR, STM32MP25_PCIECR_LTSSM_EN, 0);
> -}
> -
>  static int stm32_pcie_start_link(struct dw_pcie *pci)
>  {
>  	struct stm32_pcie *stm32_pcie = to_stm32_pcie(pci);
> -	int ret;
> -
> -	dev_dbg(pci->dev, "Enable link\n");
> -
> -	ret = stm32_pcie_enable_link(pci);
> -	if (ret) {
> -		dev_err(pci->dev, "PCIe cannot establish link: %d\n", ret);
> -		return ret;
> -	}
>  
>  	enable_irq(stm32_pcie->perst_irq);
>  
> @@ -77,11 +50,7 @@ static void stm32_pcie_stop_link(struct dw_pcie *pci)
>  {
>  	struct stm32_pcie *stm32_pcie = to_stm32_pcie(pci);
>  
> -	dev_dbg(pci->dev, "Disable link\n");
> -
>  	disable_irq(stm32_pcie->perst_irq);
> -
> -	stm32_pcie_disable_link(pci);
>  }
>  
>  static int stm32_pcie_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
> @@ -152,6 +121,8 @@ static void stm32_pcie_perst_assert(struct dw_pcie *pci)
>  
>  	dev_dbg(dev, "PERST asserted by host\n");
>  
> +	regmap_update_bits(stm32_pcie->regmap, SYSCFG_PCIECR, STM32MP25_PCIECR_LTSSM_EN, 0);
> +
>  	pci_epc_deinit_notify(ep->epc);
>  
>  	stm32_pcie_disable_resources(stm32_pcie);
> @@ -192,6 +163,11 @@ static void stm32_pcie_perst_deassert(struct dw_pcie *pci)
>  
>  	pci_epc_init_notify(ep->epc);
>  
> +	/* Enable link training */
> +	regmap_update_bits(stm32_pcie->regmap, SYSCFG_PCIECR,
> +			   STM32MP25_PCIECR_LTSSM_EN,
> +			   STM32MP25_PCIECR_LTSSM_EN);
> +
>  	return;
>  
>  err_disable_resources:
> 
> ---
> base-commit: 31115ecec74fe5c679a149d7037009f26b3aa8a9
> change-id: 20251113-perst_ep-0b57b9679cf9
> 
> Best regards,
> -- 
> Christian Bruel <christian.bruel@foss.st.com>
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
