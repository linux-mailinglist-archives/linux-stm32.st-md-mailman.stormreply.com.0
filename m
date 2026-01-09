Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 91698D07D0D
	for <lists+linux-stm32@lfdr.de>; Fri, 09 Jan 2026 09:30:19 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 552ABC8F286;
	Fri,  9 Jan 2026 08:30:19 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D3814C8F27B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  9 Jan 2026 08:30:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id AA1F060136;
 Fri,  9 Jan 2026 08:30:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 929F2C4CEF1;
 Fri,  9 Jan 2026 08:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767947416;
 bh=3Y/4K7MdRQsPCaqilZFCu7ZODfNDBbKlBmqwPSVOHE4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KaHmVdUwZWxvuB7ircX7ZztfhNCS1a9BTb6T0uPs+Q8BKvaZCbB+xYdh0efbbA/BR
 bkIBdQCmh2pdinGW6ArMfuOO6fvAaC1nJbcezIMdkn2kzkbHwDwRFXL2OpiN19nk8N
 4igYJU5hWPQG9zpkf1UjRb9Issh9v819ZcqIFnR52+WTmYfRzEv07jzrVDy/GKTXyi
 Y5gf1lPSGGMTiKQqntrZ6xy4Or5V7cJVR+A/Mo2DBg60Vo6XrD+dgWiMldLe/rBdU2
 SJIPFSwArTjX0JW+7sHkCG2FBzFloJGX/CmtARnJdYrNMmKN9qvU6cFpl6PtI7O/ep
 fOAbK1oUz946A==
Date: Fri, 9 Jan 2026 09:30:04 +0100
From: Niklas Cassel <cassel@kernel.org>
To: Koichiro Den <den@valinux.co.jp>
Message-ID: <aWC8jGTtKIzVuG-X@ryzen>
References: <20260108172403.2629671-1-den@valinux.co.jp>
 <20260108172403.2629671-4-den@valinux.co.jp>
 <aWAZv3ZwdUmo4_wc@ryzen>
 <nqpwi6ewen4kf7jqgon4ljerceqjeaule25dzb6ytas3wslqhp@ddkr3jum6eac>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <nqpwi6ewen4kf7jqgon4ljerceqjeaule25dzb6ytas3wslqhp@ddkr3jum6eac>
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

On Fri, Jan 09, 2026 at 04:29:14PM +0900, Koichiro Den wrote:
> > Does that mean that the usage of this API will be something like:
> > 
> > 1) set_bar() ## using BAR match mode, since BAR match mode can write
> >    the BAR mask to define a BAR size, so that the host can assign a
> >    PCI address to the BAR.
> 
> BAR sizing is done by dw_pcie_ep_set_bar_{programmable,resizable}() before
> iATU programming regardless of match mode. I keep BAR match mode here just
> because Address match mode requires a valid base address. That's why I
> added the `if (!base)` guard.
> 
> > 
> > 2) start() ## start link
> > 
> > 3) link up
> > 
> > 4) wait for some special command, perhaps NTB_EPF_COMMAND
> > CMD_CONFIGURE_DOORBELL or NTB_EPF_COMMAND CMD_CONFIGURE_MW
> > 
> > 5) set_bar() ## using Address match mode. Because address match mode
> >    requires that the host has assigned a PCI address to the BAR, we
> >    can only change the mapping for a BAR after the host has assigned
> >    PCI addresses for all bars.
> > 
> 
> The overall usage flow matches what I'm assuming.

Ok, perhaps document something that the submap feature requires that the
BAR already has been assigned an address (and that it thus has to call
set_bar() twice, without calling clear_bar() in-between.

This is a new feature, and since you provide a mapping for the whole BAR,
I think it is logical for people to incorrectly assume that you could use
this feature by just calling set_bar() once.


> > Perhaps you should add some text to:
> > Documentation/PCI/endpoint/pci-endpoint.rst
> > 
> > Because right now the documentation for pci_epc_set_bar() says:
> > 
> >    The PCI endpoint function driver should use pci_epc_set_bar() to configure
> >    the Base Address Register in order for the host to assign PCI addr space.
> >    Register space of the function driver is usually configured
> >    using this API.
> > 
> > So it is obviously meant to be called *before* the host assigns a PCI
> > address for the BAR. Now with submap ranges, it appears that it has to
> > be called *after* the host assigned a PCI address for the BAR.
> 
> I agree. As I understand it, the current text seems not to reflect mainline
> since commit 4284c88fff0e ("PCI: designware-ep: Allow pci_epc_set_bar()
> update inbound map address"), but anyway I should add explicit
> documentation for this subrange mapping use case.

Sure, 4284c88fff0e ("PCI: designware-ep: Allow pci_epc_set_bar() update
inbound map address") modified so that set_bar() can be called twice,
without calling clear_bar().

However, that patch was a mess because:
1) It got merged via the NTB tree, even though the PCI maintainer wanted a
   different design:
   https://lore.kernel.org/linux-pci/20220818060230.GA12008@thinkpad/T/#m411b3e9f6625da9dde747f624ed6870bef3e8823
2) It was buggy:
   https://github.com/torvalds/linux/commit/c2a57ee0f2f1ad8c970ff58b78a43e85abbdeb7f
3) It lacked the proper conditional checks for the feature to work (and it
   lacked any comments in the source explaining why it was skipping steps):
   https://github.com/torvalds/linux/commit/3708acbd5f169ebafe1faa519cb28adc56295546
4) It failed to update the documentation.
5) It failed to add a new flag for this feature in epc_features.
   I seriously doubt that any non-DWC based EP controller supports changing
   the inbound address translations without first disabling the BAR.
   (It probably should have added a epc_features->dynamic_inbound_mapping bit.)


So all in all 4284c88fff0e in not the best example :)


Your new feature (epc_features->subrange_mapping) in epc_features appears
to depend on epc_features->dynamic_inbound_mapping, so it is a shame that
we don't have a epc_features->dynamic_inbound_mapping bit, so that this new
feature could have depended on that bit.

	if (epf_bar->use_submap &&
	    !(epc_features->dynamic_inbound_mapping &&
	      epc_features->subrange_mapping))
		return -EINVAL;


I think adding some documentation is a good step.

Perhaps we should also introduce a epc_features->dynamic_inbound_mapping bit?
Since you are making DWC glue drivers return a mutable EPC features, we could
set this bit in the DWC driver after that commit. What do you think?

I realize that we would not be able to add any actual verification for the
epc_features->dynamic_inbound_mapping feature itself (in set_bar()), since
there is no way for set_bar() to know if a BAR has already been configured
(since struct pci_epc does not have an array of the currently configured BARs).

But at least it would allow an EPF driver (e.g. vNTB) to know if it can call
set_bar() twice or not, and can error out if the EPF driver is being used on
a EPC that doesn't support epc_features->dynamic_inbound_mapping.


Kind regards,
Niklas
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
