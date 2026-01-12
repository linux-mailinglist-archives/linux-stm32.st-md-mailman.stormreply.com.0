Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 21431D125AC
	for <lists+linux-stm32@lfdr.de>; Mon, 12 Jan 2026 12:44:07 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A884EC3F945;
	Mon, 12 Jan 2026 11:44:06 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8F90AC36B30
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Jan 2026 11:44:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id E82E243E75;
 Mon, 12 Jan 2026 11:44:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02848C16AAE;
 Mon, 12 Jan 2026 11:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768218242;
 bh=wYxzqaucRGuoMNi3CMgj0x5c6RoysJv8GcSjGMutuIM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BDSFaEjhcr82fZbuOnjBsIysguMmvESRnrY4Tpsv9UGf02g8W7lpkhwWzD3ZIsLOR
 7AeG2s+ycAlQNjCw8YvdfZWEU6xGElMYLW6io9YkNrIvlGIPar1iQI7aij9znZaI/6
 BxJ/wIFz6DdmbdPiZHbOoiwkZUJv3hQjpiOuavR/2Ua7mkrI3qhF0BRjXMU8U5mBPo
 2HMuNGiN0xFNsBs0I4Q2tw3Cwl1R6aWTYi3pXz6xaXjzyFoGuIH7U0OtYGZv4JnSKY
 y+AXIMFWSkAK5y7yHajqyXFoHhHBAtAJssYs+UufUpqaqMQPxX/X1j7u9ik4vwXeRY
 +s9LbpjkC3sow==
Date: Mon, 12 Jan 2026 12:43:50 +0100
From: Niklas Cassel <cassel@kernel.org>
To: Koichiro Den <den@valinux.co.jp>
Message-ID: <aWTedhkOclAVvktO@ryzen>
References: <20260108172403.2629671-1-den@valinux.co.jp>
 <20260108172403.2629671-4-den@valinux.co.jp>
 <aWAZv3ZwdUmo4_wc@ryzen>
 <nqpwi6ewen4kf7jqgon4ljerceqjeaule25dzb6ytas3wslqhp@ddkr3jum6eac>
 <aWC8jGTtKIzVuG-X@ryzen>
 <wvb42kyfcpyii3jql2gm75dd6hqpcd32yat2yb7cg7sl3raw4l@d4mfxk47l6md>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <wvb42kyfcpyii3jql2gm75dd6hqpcd32yat2yb7cg7sl3raw4l@d4mfxk47l6md>
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

On Sat, Jan 10, 2026 at 11:29:06PM +0900, Koichiro Den wrote:

(snip)

> > Your new feature (epc_features->subrange_mapping) in epc_features appears
> > to depend on epc_features->dynamic_inbound_mapping, so it is a shame that
> > we don't have a epc_features->dynamic_inbound_mapping bit, so that this new
> > feature could have depended on that bit.
> > 
> > 	if (epf_bar->use_submap &&
> > 	    !(epc_features->dynamic_inbound_mapping &&
> > 	      epc_features->subrange_mapping))
> > 		return -EINVAL;
> > 
> > 
> > I think adding some documentation is a good step.
> > 
> > Perhaps we should also introduce a epc_features->dynamic_inbound_mapping bit?
> > Since you are making DWC glue drivers return a mutable EPC features, we could
> > set this bit in the DWC driver after that commit. What do you think?
> 
> As you pointed out, support for dynamic_inbound_mapping is needed
> independently of my series. Given that, it would make sense to handle it
> either before this series, or to fold it into the next iteration (=v6) of
> the series if that is preferred.

Please fold it into the next iteration (=v6).

It should be a one liner patch in the DWC driver, at least if you put it
after your "PCI: dwc: Allow glue drivers to return mutable EPC features"
patch.

Thank you for all your efforts on improving the endpoint framework.


Kind regards,
Niklas
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
