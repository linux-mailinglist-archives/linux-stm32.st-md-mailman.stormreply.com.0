Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 75ACD9E5D14
	for <lists+linux-stm32@lfdr.de>; Thu,  5 Dec 2024 18:27:49 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 304E1C7802B;
	Thu,  5 Dec 2024 17:27:49 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EB7A2C7801F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  5 Dec 2024 17:27:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 1AEB7A43E7A;
 Thu,  5 Dec 2024 17:25:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88212C4CED1;
 Thu,  5 Dec 2024 17:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1733419660;
 bh=Ri91blaEJu7Ua+jUwYZXPSeBwql1Lk/K8YeLB3/SMrc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=ecgAG1XAX0KLrXM6fWo9pl2oJJO6VYSY69RsMhWwXPBtDG+NAvyFaFri8BJEEnvJ/
 ASsWy0ZWIpKjN9kJUkZdW9/sv+KdeWeToBjYbiiwzBGTUlerd1t9XqzBdq5RWVJKV2
 g+yYV/Mwpkr8pUzeCmfkDUakzUxFNr+h0d+fg2YBvDgxh7auNQoif/C42tItTndx/f
 PoS/aOSeWdlVhNEgucreK+/PAvsv7A0N1GXCpzH4y0EtPiYRB2K6PQ4KjWCGgD7z+E
 iMJiUfUKBgLWtUhB9rCo9BzHrEloST1HnlsiibqwpZYzCt/GcYJAhNZASZH55UGlVv
 3SUby2bfsHzOA==
Date: Thu, 5 Dec 2024 11:27:38 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Christian Bruel <christian.bruel@foss.st.com>
Message-ID: <20241205172738.GA3054352@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241126155119.1574564-5-christian.bruel@foss.st.com>
Cc: kw@linux.com, conor+dt@kernel.org, p.zabel@pengutronix.de, robh@kernel.org,
 linux-pci@vger.kernel.org, lpieralisi@kernel.org, linux-kernel@vger.kernel.org,
 cassel@kernel.org, devicetree@vger.kernel.org, quic_schintav@quicinc.com,
 mcoquelin.stm32@gmail.com, manivannan.sadhasivam@linaro.org,
 bhelgaas@google.com, krzk+dt@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 4/5] PCI: stm32: Add PCIe endpoint
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

On Tue, Nov 26, 2024 at 04:51:18PM +0100, Christian Bruel wrote:
> Add driver to configure the STM32MP25 SoC PCIe Gen2 controller based on the
> DesignWare PCIe core in endpoint mode.

> +config PCIE_STM32_EP
> +	tristate "STMicroelectronics STM32MP25 PCIe Controller (endpoint mode)"
> +	depends on ARCH_STM32 || COMPILE_TEST
> +	depends on PCI_ENDPOINT
> +	select PCIE_DW_EP
> +	help
> +	  Enables endpoint support for DesignWare core based PCIe controller in found
> +	  in STM32MP25 SoC.

s/in found in/in/ (or "found in" if you prefer)

Wrap so help text fits in 80 columns when for "make menuconfig".

> +static void stm32_pcie_ep_init(struct dw_pcie_ep *ep)
> +{
> +	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
> +	struct stm32_pcie *stm32_pcie = to_stm32_pcie(pci);
> +	enum pci_barno bar;
> +
> +	for (bar = 0; bar < PCI_STD_NUM_BARS; bar++)
> +		dw_pcie_ep_reset_bar(pci, bar);
> +
> +	/* Defer Completion Requests until link started */

I asked about this before [1] but didn't finish the conversation.  My
main point is that I think "Completion Request" is a misnomer.
There's a "Configuration Request" and a "Completion," but no such
thing as a "Completion Request."

Based on your previous response, I think this should say something
like "respond to config requests with Request Retry Status (RRS) until
we're prepared to handle them."

> +	regmap_update_bits(stm32_pcie->regmap, SYSCFG_PCIECR,
> +			   STM32MP25_PCIECR_REQ_RETRY_EN,
> +			   STM32MP25_PCIECR_REQ_RETRY_EN);
> +}
> +
> +static int stm32_pcie_enable_link(struct dw_pcie *pci)
> +{
> +	struct stm32_pcie *stm32_pcie = to_stm32_pcie(pci);
> +	int ret;
> +
> +	regmap_update_bits(stm32_pcie->regmap, SYSCFG_PCIECR,
> +			   STM32MP25_PCIECR_LTSSM_EN,
> +			   STM32MP25_PCIECR_LTSSM_EN);
> +
> +	ret = dw_pcie_wait_for_link(pci);
> +	if (ret)
> +		return ret;
> +
> +	regmap_update_bits(stm32_pcie->regmap, SYSCFG_PCIECR,
> +			   STM32MP25_PCIECR_REQ_RETRY_EN,
> +			   0);

And I assume this means the endpoint will accept config requests and
handle them normally instead of responding with RRS.

Strictly speaking this is a different condition than "the link is up"
because the link must be up in order to even receive a config request.
The purpose of RRS is for devices that need more initialization time
after the link is up before they can respond to config requests.

The fact that the hardware provides this bit makes me think the
designer anticipated that the link might come up before the rest of
the device is fully initialized.

Bjorn

[1] https://lore.kernel.org/r/20241112203846.GA1856246@bhelgaas

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
