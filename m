Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D9B5D17F24
	for <lists+linux-stm32@lfdr.de>; Tue, 13 Jan 2026 11:18:07 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5F55CC8F283;
	Tue, 13 Jan 2026 10:18:07 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B6358C8F282
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Jan 2026 10:18:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 9FFCB6000A;
 Tue, 13 Jan 2026 10:18:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EE25C116C6;
 Tue, 13 Jan 2026 10:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768299484;
 bh=0fpbeQGAJF9xjq5Byej/gkDKIoAX4CGtzrNcpesJoYY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SRp9YMANteq690cw3Tc7KijMkA6B5f5vSRAv1KYS88CI6bYfRan3AunIB+7E3+4Zf
 mH6JR+bx1yw1zxCxKPf3N1DLKskJu82uTfBstubAf28agXhdqU772iiBJkM5LgXEpy
 plOKWgaX4KN/pF6w30vo35DCBordFKJeLgvSIIfExlQb5H2XThPtbweNqsw40BnW02
 gumS3q0YECyjFfZOW1nnxfwdEnGYxO1CC4ikdXYnd7c3XwQmF7m/5skQdCXx7sdxre
 E0Rgup+mH27I+3bpVVUf7q1WahO6w+oqQMKt64/Evzkesa8eBewcfSH5ATrS9liPkS
 BVWMV4ydfdzuQ==
Date: Tue, 13 Jan 2026 11:17:51 +0100
From: Niklas Cassel <cassel@kernel.org>
To: Koichiro Den <den@valinux.co.jp>
Message-ID: <aWYbzzAeDSLYJJcB@ryzen>
References: <20260113023715.3463724-1-den@valinux.co.jp>
 <20260113023715.3463724-6-den@valinux.co.jp>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260113023715.3463724-6-den@valinux.co.jp>
Cc: imx@lists.linux.dev, vigneshr@ti.com, geert+renesas@glider.be,
 linux-pci@vger.kernel.org, lpieralisi@kernel.org, Frank.Li@nxp.com,
 minghuan.Lian@nxp.com, thierry.reding@gmail.com, festevam@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, marek.vasut+renesas@gmail.com,
 kishon@kernel.org, robh@kernel.org, jesper.nilsson@axis.com,
 hayashi.kunihiko@socionext.com, jirislaby@kernel.org, magnus.damm@gmail.com,
 linux-arm-kernel@axis.com, jonathanh@nvidia.com,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 18255117159@163.com, s-vadapalli@ti.com, kwilczynski@kernel.org,
 shawn.lin@rock-chips.com, srikanth.thokala@intel.com, hongxing.zhu@nxp.com,
 mcoquelin.stm32@gmail.com, mani@kernel.org, linux-arm-msm@vger.kernel.org,
 s.hauer@pengutronix.de, linuxppc-dev@lists.ozlabs.org, bhelgaas@google.com,
 linux-omap@vger.kernel.org, rongqianfeng@vivo.com, mingkai.hu@nxp.com,
 roy.zang@nxp.com, linux-tegra@vger.kernel.org, christian.bruel@foss.st.com,
 linux.amoon@gmail.com, jingoohan1@gmail.com, yoshihiro.shimoda.uh@renesas.com,
 heiko@sntech.de, linux-kernel@vger.kernel.org, vidyas@nvidia.com,
 linux-renesas-soc@vger.kernel.org, mhiramat@kernel.org, kernel@pengutronix.de,
 shawnguo@kernel.org, nicolas.frattaroli@collabora.com, l.stach@pengutronix.de
Subject: Re: [Linux-stm32] [PATCH v6 5/5] Documentation: PCI: endpoint:
 Clarify pci_epc_set_bar() usage
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

On Tue, Jan 13, 2026 at 11:37:15AM +0900, Koichiro Den wrote:
> The current documentation implies that pci_epc_set_bar() is only used
> before the host enumerates the endpoint.
> 
> In practice, some Endpoint Controllers support calling pci_epc_set_bar()
> multiple times for the same BAR (without clearing it) in order to update
> inbound address translations after the host has programmed the BAR base
> address, which some Endpoint Functions such as vNTB already relies on.
> Add document text for that.
> 
> Also document the expected call flow for BAR subrange mapping
> (pci_epf_bar.use_submap / pci_epf_bar.submap), which may require
> a second pci_epc_set_bar() call after the host has programmed the BAR base
> address.
> 
> Signed-off-by: Koichiro Den <den@valinux.co.jp>
> ---
>  Documentation/PCI/endpoint/pci-endpoint.rst | 22 +++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/Documentation/PCI/endpoint/pci-endpoint.rst b/Documentation/PCI/endpoint/pci-endpoint.rst
> index 0741c8cbd74e..d3d9abbbc71e 100644
> --- a/Documentation/PCI/endpoint/pci-endpoint.rst
> +++ b/Documentation/PCI/endpoint/pci-endpoint.rst
> @@ -95,6 +95,28 @@ by the PCI endpoint function driver.
>     Register space of the function driver is usually configured
>     using this API.
>  
> +   Some endpoint controllers also support calling pci_epc_set_bar() again
> +   for the same BAR (without calling pci_epc_clear_bar()) to update inbound
> +   address translations after the host has programmed the BAR base address.
> +   Endpoint function drivers can check this capability via the
> +   dynamic_inbound_mapping EPC feature bit.
> +
> +   When pci_epf_bar.use_submap is set, the endpoint function driver is
> +   requesting BAR subrange mapping using pci_epf_bar.submap. This requires
> +   the EPC to advertise support via the subrange_mapping EPC feature bit.
> +
> +   If the EPF driver wants to program inbound subrange mappings that are
> +   based on the BAR base address programmed by the host during enumeration,
> +   it needs to call pci_epc_set_bar() twice for the same BAR (requires
> +   dynamic_inbound_mapping): first with use_submap cleared to configure the
> +   BAR size, then after the PCIe link is up and the host enumerates the
> +   endpoint and programs the BAR base address, again with use_submap set.

"If the EPF driver wants to ..."

Here you have phrased it in a way where it almost seems like this is an
alternative way that you could use this feature.

But in reality, dw_pcie_ep_ib_atu_addr() will return an error if
dw_pcie_ep_read_bar_assigned() does not return an assigned PCI address.

So perhaps write it something like:
"When an EPF driver wants to make use of the inbound subrange mapping
feature, it requires that the BAR base address has been programmed by
the host during enumeration. Thus, it needs to ..."


> +
> +   Note that in this flow, the EPF driver must not call pci_epc_clear_bar()
> +   between the two pci_epc_set_bar() calls, because clearing the BAR can
> +   clear/disable the BAR register or BAR decode on the endpoint while the
> +   host still expects the assigned BAR address to remain valid.

"Note that in this flow, ..."

This also somehow sounds like this is an alternative way, when it is the
only way.

Perhaps simply something like:
"Note that when making use of the inbound subrange mapping feature,
the EPF driver must not call pci_epc_clear_bar() ..."


With that fixed, this looks good to me:
Reviewed-by: Niklas Cassel <cassel@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
