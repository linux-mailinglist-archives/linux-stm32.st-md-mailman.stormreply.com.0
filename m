Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2066CD062CE
	for <lists+linux-stm32@lfdr.de>; Thu, 08 Jan 2026 21:55:44 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C6809C8F286;
	Thu,  8 Jan 2026 20:55:43 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 25258C8F285
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  8 Jan 2026 20:55:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 5F8A040989;
 Thu,  8 Jan 2026 20:55:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B290C116C6;
 Thu,  8 Jan 2026 20:55:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767905740;
 bh=xBJe/1TFcmT6ykWBd9m6VDk/sy5CDIe6A5UhmE5fQMc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SjSg9NeThhyh+++t7oDphRi9jrjfHMpyjFOTzaeh0gYoZ3izGVjS4O26bFUA1QUvm
 J3SqsMuOQCewM7IKUQ96hK2KMq/kcHx9beh18yud/0R4cTYRVZLISqCM0zEThG8jQ+
 h5AYr5uN46Rj5jEJLWP1pW79KbPjBYUs+2Un3MzTPCOu3AXqD7aNoNxS/PtrsiFlh/
 hahC8p89QMUHjsXVrAsAGZl/GL0U9LcdaKzZNuS74lwloUO1xDsSnYzTWALX39Z9GL
 rvyrOUOB/9IfhehMJlaoXTpriWA0L1IpI4LhNpjLMymvGJSP5UfbZz9Kzfuz+mPimt
 U7lpSI5WgMQxg==
Date: Thu, 8 Jan 2026 21:55:27 +0100
From: Niklas Cassel <cassel@kernel.org>
To: Koichiro Den <den@valinux.co.jp>
Message-ID: <aWAZv3ZwdUmo4_wc@ryzen>
References: <20260108172403.2629671-1-den@valinux.co.jp>
 <20260108172403.2629671-4-den@valinux.co.jp>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260108172403.2629671-4-den@valinux.co.jp>
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
Subject: Re: [Linux-stm32] [PATCH v5 3/3] PCI: dwc: ep: Support BAR subrange
 inbound mapping via Address Match Mode iATU
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

Hello Koichiro,

On Fri, Jan 09, 2026 at 02:24:03AM +0900, Koichiro Den wrote:

(snip)

> +/* Address Match Mode inbound iATU mapping */
> +static int dw_pcie_ep_ib_atu_addr(struct dw_pcie_ep *ep, u8 func_no, int type,
> +				  const struct pci_epf_bar *epf_bar)
> +{
> +	const struct pci_epf_bar_submap *submap = epf_bar->submap;
> +	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
> +	enum pci_barno bar = epf_bar->barno;
> +	struct device *dev = pci->dev;
> +	u64 pci_addr, parent_bus_addr;
> +	struct dw_pcie_ib_map *new;
> +	u64 size, off, base;
> +	unsigned long flags;
> +	int free_win, ret;
> +	unsigned int i;
> +
> +	if (!epf_bar->num_submap || !submap || !epf_bar->size)
> +		return -EINVAL;
> +
> +	ret = dw_pcie_ep_validate_submap(ep, submap, epf_bar->num_submap,
> +					 epf_bar->size);
> +	if (ret)
> +		return ret;
> +
> +	base = dw_pcie_ep_read_bar_assigned(ep, func_no, bar, epf_bar->flags);
> +	if (!base) {
> +		dev_err(dev,
> +			"BAR%u not assigned, cannot set up sub-range mappings\n",
> +			bar);
> +		return -EINVAL;
> +	}

Sorry for giving additional review comments.

But there is one thing that I might not be so obvious for someone just
reading this source. How is this API supposed to be used in practice?

Most DWC-based controllers are not hotplug capable.

That means that we must boot the EP, create the EPF symlink in configfs,
and start link training by writing to configfs, before starting the host.

dw_pcie_ep_ib_atu_addr() reads the PCI address that the host has assigned
to the BAR, and returns an error if the host has not already assigned a
PCI addres to the BAR.

Does that mean that the usage of this API will be something like:

1) set_bar() ## using BAR match mode, since BAR match mode can write
   the BAR mask to define a BAR size, so that the host can assign a
   PCI address to the BAR.

2) start() ## start link

3) link up

4) wait for some special command, perhaps NTB_EPF_COMMAND
CMD_CONFIGURE_DOORBELL or NTB_EPF_COMMAND CMD_CONFIGURE_MW

5) set_bar() ## using Address match mode. Because address match mode
   requires that the host has assigned a PCI address to the BAR, we
   can only change the mapping for a BAR after the host has assigned
   PCI addresses for all bars.



Perhaps you should add some text to:
Documentation/PCI/endpoint/pci-endpoint.rst

Because right now the documentation for pci_epc_set_bar() says:

   The PCI endpoint function driver should use pci_epc_set_bar() to configure
   the Base Address Register in order for the host to assign PCI addr space.
   Register space of the function driver is usually configured
   using this API.

So it is obviously meant to be called *before* the host assigns a PCI
address for the BAR. Now with submap ranges, it appears that it has to
be called *after* the host assigned a PCI address for the BAR.

So I can only assume that you will call set_bar() twice.
Once with BAR match mode, and then a second time with address map mode.

It might be obvious to you, but I think it makes sense to also have some
kind of documentation for this feature.


Kind regards,
Niklas
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
