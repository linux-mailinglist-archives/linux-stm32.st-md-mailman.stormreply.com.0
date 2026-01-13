Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C8A4D1ADFC
	for <lists+linux-stm32@lfdr.de>; Tue, 13 Jan 2026 19:44:42 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C3527C5A4EF;
	Tue, 13 Jan 2026 18:44:41 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 737A9C0693D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Jan 2026 18:44:40 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 2A8F76000A;
 Tue, 13 Jan 2026 18:44:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC54FC116C6;
 Tue, 13 Jan 2026 18:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768329878;
 bh=guH+X5X5Zw5RK4+z7WReUiSq/PEpKm6VSIBaw1TF1Wk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mJ/epLMx61KYA6qPjpRXqerwQQ3NcjyRncy5NLUppRcvNbs2ALyBM6FjEhD9uCvW2
 eg+DxvUNeugL74YCHEYOOv4VS+A/BfA6G/dMZqmg4UIxaOswYQMpqwbpy7mH2VJssd
 pryhg1yTNddK0bWY9Uq9gE7ggwr1D0Kf4ak8pCyjAuuQxjtChOyO00kugpRuZ29n40
 WzTS8Cd0E4qQJrBcO9qMgrhYRyavxl9eWt+/iAY5yX2qEdebOKThI+hfkrhzfqh5HQ
 VQ0q4gLY53Z/GZ66GOvRjkXfxIKgJEY7/T6uorHk2QfWRmmEUeUhwAT/SFYMOSF+KF
 80DfzL+JVf/oA==
Date: Tue, 13 Jan 2026 19:44:25 +0100
From: Niklas Cassel <cassel@kernel.org>
To: Koichiro Den <den@valinux.co.jp>
Message-ID: <aWaSggUJpnxjAPA_@ryzen>
References: <20260113162719.3710268-1-den@valinux.co.jp>
 <20260113162719.3710268-5-den@valinux.co.jp>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260113162719.3710268-5-den@valinux.co.jp>
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
Subject: Re: [Linux-stm32] [PATCH v7 4/6] PCI: dwc: Advertise dynamic
 inbound mapping support
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

On Wed, Jan 14, 2026 at 01:27:17AM +0900, Koichiro Den wrote:
> The DesignWare EP core has supported updating the inbound iATU mapping
> for an already configured BAR (i.e. allowing pci_epc_set_bar() to be
> called again without a prior pci_epc_clear_bar()) since
> commit 4284c88fff0e ("PCI: designware-ep: Allow pci_epc_set_bar() update
> inbound map address").
> 
> Now that the EPC layer exposes this capability via the
> dynamic_inbound_mapping feature bit, set the bit centrally in the
> DesignWare EP layer so that all DWC-based EP glue drivers report it
> consistently, without duplicating the same flag in each individual
> driver.
> 
> No functional change intended. This only advertises existing behavior to
> EPF drivers.
> 
> Suggested-by: Niklas Cassel <cassel@kernel.org>
> Signed-off-by: Koichiro Den <den@valinux.co.jp>
> ---

Reviewed-by: Niklas Cassel <cassel@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
