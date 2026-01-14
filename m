Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FDC2D1E227
	for <lists+linux-stm32@lfdr.de>; Wed, 14 Jan 2026 11:39:20 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 19B6BC8F270;
	Wed, 14 Jan 2026 10:39:20 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3219AC8F26F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Jan 2026 10:39:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id C595C60097;
 Wed, 14 Jan 2026 10:39:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26CFAC4CEF7;
 Wed, 14 Jan 2026 10:39:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768387157;
 bh=GXOUS5IVA/W+B1bIiXQJ9wm/cqS9Cfmo4/ZzvR1iFTY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=c1cx4AN6qnW//qfPtg+YU+kBK0Fwi1qx7TD4KI7OcyvNk84LcaOGokwsZbcc85njb
 qNE/fDPQvFv/hrK3hmEx5+u9dS2ysExw/sZMu59+B6tkrQgcsiR0HoyBLL0SqDaJNl
 lZiiHfClvv5U5qlwltVlii620fXgPEmppvSDIBUFS8QaAvEzvcf7lbCi351zOc3W8f
 OSyJms1RzaBtduqCcc4R6U9FLBKh2qAsW/1bGu/5Vq+EF+x+/uK/2ZYuVFmug/pbtL
 IQE5Pt8WGKFCXfH5aCcnYzBH4PHJ3+KmYKvQ4C17LfDVYZ564TGrXzWP3iZN+7Q5zE
 l1TuhhZkNiuDQ==
Date: Wed, 14 Jan 2026 11:39:03 +0100
From: Niklas Cassel <cassel@kernel.org>
To: Koichiro Den <den@valinux.co.jp>
Message-ID: <aWdyR4Xkh2_ZgOf8@fedora>
References: <20260113162719.3710268-1-den@valinux.co.jp>
 <20260113162719.3710268-6-den@valinux.co.jp>
 <5kexuvze2a4m6bd3yhv2cd7yrzo4r6ubbbouktdsurv7n22v7o@7s3pgf6ftgur>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5kexuvze2a4m6bd3yhv2cd7yrzo4r6ubbbouktdsurv7n22v7o@7s3pgf6ftgur>
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
Subject: Re: [Linux-stm32] [PATCH v7 5/6] PCI: dwc: ep: Support BAR subrange
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

On Wed, Jan 14, 2026 at 12:54:37PM +0900, Koichiro Den wrote:
> I realized that I missed one case in v7.
> 
> I think dw_pcie_ep_clear_ib_maps() should also be called from
> dw_pcie_ep_ib_atu_bar() to tear down any existing inbound mappings for the
> same BAR before re-programming it in BAR Match Mode.
> 
> This matters when updating inbound mappings for a BAR without resetting the
> BAR in between. There are four possible transition patterns, and pattern #4
> below was overlooked:
> 
>   1. BAR Match Mode -> BAR Match Mode
>      As the current implementation does, the mapping is simply updated
>      (with the same atu index)
> 
>   2. BAR Match Mode -> Address Match Mode
>      This patch series already ensures the old BAR Match mapping is
>      torn down before reprogramming.
> 
>   3. Address Match Mode -> Address Match Mode
>      Likewise, existing Address Match mappings are cleared first.
> 
>   4. Address Match Mode  -> BAR Match Mode
>      This case was not handled. The change below adds the missing
>      teardown so that stale Address Match mappings do not remain active.
> 
>      --- a/drivers/pci/controller/dwc/pcie-designware-ep.c
>      +++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
>      @@ -148,9 +148,12 @@ static int dw_pcie_ep_ib_atu_bar(struct dw_pcie_ep *ep, u8 func_no, int type,
>              u32 free_win;
>              struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
>      
>      -       if (!ep->bar_to_atu[bar])
>      +       if (!ep->bar_to_atu[bar]) {
>      +               /* Tear down existing mappings before (re)programming. */
>      +               dw_pcie_ep_clear_ib_maps(ep, bar);
>      +
>                      free_win = find_first_zero_bit(ep->ib_window_map,
>                                                    pci->num_ib_windows);
>      -       else
>      +       } else
>                      free_win = ep->bar_to_atu[bar] - 1;

If one of the branches has braces, both branches should have braces:
https://www.kernel.org/doc/html/latest/process/coding-style.html#placing-braces-and-spaces


> 
> Unless there are objections, I'll include this fix in v8.

Isn't it easier/cleaner if we call dw_pcie_ep_clear_ib_maps() in
dw_pcie_ep_set_bar(), rather than calling it in both dw_pcie_ep_ib_atu_addr()
and dw_pcie_ep_ib_atu_bar() ?

dw_pcie_ep_set_bar() knows the condition if we are dynamically reprogramming
a BAR or not, and all the four cases are when dynamically reprogramming a BAR.

I.e. instead of adding additional code to dw_pcie_ep_ib_atu_bar(), we do
something like:

diff --git a/drivers/pci/controller/dwc/pcie-designware-ep.c b/drivers/pci/controller/dwc/pcie-designware-ep.c
index b2ea2c2c986f..63ae5471fe13 100644
--- a/drivers/pci/controller/dwc/pcie-designware-ep.c
+++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
@@ -318,9 +318,6 @@ static int dw_pcie_ep_ib_atu_addr(struct dw_pcie_ep *ep, u8 func_no, int type,
                return -EINVAL;
        }
 
-       /* Tear down any existing mappings before (re)programming. */
-       dw_pcie_ep_clear_ib_maps(ep, bar);
-
        for (i = 0; i < epf_bar->num_submap; i++) {
                off = submap[i].offset;
                size = submap[i].size;
@@ -571,6 +568,9 @@ static int dw_pcie_ep_set_bar(struct pci_epc *epc, u8 func_no, u8 vfunc_no,
                    ep->epf_bar[bar]->flags != flags)
                        return -EINVAL;
 
+               if (ep->epf_bar[bar]->num_submap || epf_bar->num_submap)
+                       dw_pcie_ep_clear_ib_maps(ep, bar);
+
                /*
                 * When dynamically changing a BAR, skip writing the BAR reg, as
                 * that would clear the BAR's PCI address assigned by the host.



_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
