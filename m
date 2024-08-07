Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0170494A42B
	for <lists+linux-stm32@lfdr.de>; Wed,  7 Aug 2024 11:21:40 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AC68FC71289;
	Wed,  7 Aug 2024 09:21:39 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0CD2DC6B45B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  7 Aug 2024 09:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/S2HbQbKCvoRKCalpj7tukbXlDtRqceNWh29Ov9kqRk=; b=ruz/HlMfGDxAGOSawPrT7yXv4W
 7+OT/Zhroaw41ZQ+0L/8PWuUHylYAShBLlxvdDIzMT32/00eQTmhogBZslu0y9WcSvg9KWSVf6V1J
 GXJHSC0u23FsYJS8xMihPElo0G9+x5JgPYIi3XJJg6i57akXi2lSLXDw2Chv/Q0E4aOfPB884PMS6
 QyyAyffINECZOlZ08gFB3lRrOV5fwctcsIxIsaCWY+CIR0qpUxaVQdBC6dK9VMka16x2fKXgaKRqh
 5o6NHZp0pMu3SgQ5mcLpo8jFH4MezpsJHN6FL8EAvm3l2leojTLM0jFuo3GQ2/s5ef0J3cvNNDfKm
 kFAUVsGg==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:51116)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1sbcqx-0006km-0V;
 Wed, 07 Aug 2024 10:21:07 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1sbcqx-0004Bw-NV; Wed, 07 Aug 2024 10:21:07 +0100
Date: Wed, 7 Aug 2024 10:21:07 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Serge Semin <fancer.lancer@gmail.com>
Message-ID: <ZrM8g5KoaBi5L00b@shell.armlinux.org.uk>
References: <ZrCoQZKo74zvKMhT@shell.armlinux.org.uk>
 <rq2wbrm2q3bizgxcnl6kmdiycpldjl6rllsqqgpzfhsfodnd3o@ymdfbxq2gj5j>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <rq2wbrm2q3bizgxcnl6kmdiycpldjl6rllsqqgpzfhsfodnd3o@ymdfbxq2gj5j>
Cc: Sneh Shah <quic_snehshah@quicinc.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 John Fastabend <john.fastabend@gmail.com>, Alexei Starovoitov <ast@kernel.org>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Vinod Koul <vkoul@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 netdev@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>, bpf@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Andrew Halaney <ahalaney@redhat.com>
Subject: Re: [Linux-stm32] [PATCH RFC net-next v4 00/14] net: stmmac:
 convert stmmac "pcs" to phylink
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

On Tue, Aug 06, 2024 at 09:56:04PM +0300, Serge Semin wrote:
> Hi Russell
> 
> Got this series tested on my DW GMAC v3.73a + Micrel KSZ9031RNX PHY
> with the in-band link status management enabled. The same positive result
> as before, on v1-v2:
> [  294.651324] stmmaceth 1f060000.ethernet eth1: configuring for inband/rgmii-rxid link mode
> [  294.582498] stmmaceth 1f060000.ethernet eth1: Register MEM_TYPE_PAGE_POOL RxQ-0
> [  294.594308] stmmaceth 1f060000.ethernet eth1: PHY [stmmac-1:03] driver [RTL8211E Gigabit Ethernet] (irq=POLL)
> [  294.605453] dwmac1000: Master AXI performs any burst length
> [  294.611899] stmmaceth 1f060000.ethernet: invalid port speed
> [  294.618229] stmmaceth 1f060000.ethernet eth1: No Safety Features support found
> [  294.626412] stmmaceth 1f060000.ethernet eth1: No MAC Management Counters available
> [  294.634912] stmmaceth 1f060000.ethernet eth1: IEEE 1588-2008 Advanced Timestamp supported
> [  294.644380] stmmaceth 1f060000.ethernet eth1: registered PTP clock
> [  294.651324] stmmaceth 1f060000.ethernet eth1: configuring for inband/rgmii-rxid link mode
> ...
> [  298.772917] stmmaceth 1f060000.ethernet eth1: Link is Up - 1Gbps/Full - flow control rx/tx
> 
> So feel free to add:
> Tested-by: Serge Semin <fancer.lancer@gmail.com>

Thanks.

> Please note the warning: "stmmaceth 1f060000.ethernet: invalid port
> speed" in the log above. This is a false negative warning since my
> network devices isn't of MAC2MAC-type and there is no snps,ps-speed
> property in my dts. So having the priv->hw.ps set to zero should be
> fine. That said I guess we need to add the warning fix to the 14/14
> patch which would permit the plat_stmmacenet_data::mac_port_sel_speed
> field being zero.

I think this is a separate issue - one which exists even today with
the stmmac driver as this code hasn't changed. Maybe it should be a
separate patch targetting the net tree?

> > Previous cover messages from earlier posts below:
> > 
> > This is version 3 of the series switching stmmac to use phylink PCS
> > isntead of going behind phylink's back.
> > 
> > Changes since version 2:
> > - Adopted some of Serge's feedback.
> > - New patch: adding ethqos_pcs_set_inband() for qcom-ethqos so we
> >   have one place to modify for AN control rather than many.
> > - New patch: pass the stmmac_priv structure into the pcs_set_ane()
> >   method.
> > - New patch: remove pcs_get_adv_lp() early, as this is only for TBI
> >   and RTBI, support for which we dropped in an already merged patch.
> > - Provide stmmac_pcs structure to encapsulate the pointer to
> >   stmmac_priv, PCS MMIO address pointer and phylink_pcs structure.
> > - Restructure dwmac_pcs_config() so we can eventually share code
> >   with dwmac_ctrl_ane().
> > - New patch: move dwmac_ctrl_ane() into stmmac_pcs.c, and share code.
> > - New patch: pass the stmmac_pcs structure into dwmac_pcs_isr().
> > - New patch: similar to Serge's patch, rename the PCS registers, but
> >   use STMMAC_PCS_ as the prefix rather than just PCS_ which is too
> >   generic.
> > - New patch: incorporate "net: stmmac: Activate Inband/PCS flag
> >   based on the selected iface" from Serge.
> > 
> > On the subject of whether we should have two PCS instances, I
> > experimented with that and have now decided against it. Instead,
> > dwmac_pcs_config() now tests whether we need to fiddle with the
> > PCS control register or not.
> > 
> 
> > Note that I prefer not to have multiple layers of indirection, but
> > instead prefer a library-style approach, which is why I haven't
> > turned the PCS support into something that's self contained with
> > a method in the MAC driver to grab the RGSMII status.
> 
> I understand the reason of your choice in this case. As a result a
> some part of my changes haven't been merged in into your series. But I
> deliberately selected the approach with having the simple PCS
> HW-interface callbacks utilized for a self-contained internal PCS
> implementation. Here is why:
> 1. Signify that the DW GMAC and DW QoS Eth internal PCSs are the
> same.
> 2. Reduce the amount of code.
> 3. Collects the entire PCS implementation in a single place which
> improves the code readability.
> 4. The PCS ops initialization is implemented in the same way as the
> PTP, MMC and EST (and likely FPE in some time in future), in the
> hwif.c and the interface/core callbacks in the dedicated files
> (stmmac_ptp.c, mmc_core.c, stmmac_est.c, etc). So the PCS
> implementation would be in general unified with what has been done for
> PTP/MMC/EST/etc. 
> 5. ...
> 
> Taking that into account I am still convinced that my approach worth
> to be implemented. Hope you won't mind, if after your series is merged
> in I'll submit another patch set which would introduce some of my
> PCS-changes not included into your patch set. Like this:
> 1. Move the mac_device_info instance to being defined in the
> stmmac_priv structure (new patch, so to drop the stmmac_priv pointer
> from stmmac_pcs).
> 2. Introduce stmmac_priv::pcsaddr (to have the PCS CSR base address
> defined in the same way as for PTP/MMC/EST/etc).
> 3. Provide the HWIF ops:
>    stmmac_pcs_ops {
>         pcs_get_config_reg;
>         pcs_enable_irq;
>         pcs_disable_irq;
>    } for DW GMAC and DW QoS Eth.
> 4. Move PCS implementation to stmmac_pcs.c
> 5. Direct using the plat_stmmacenet_data::mac_port_sel_speed field
> instead of the mac_device_info::ps.
> 6. Some more cleanups like converting the struct stmmac_hwif_entry
> field from void-pointers to the typed-pointers, ...

I guessed that you would dig your heals in over this, and want to do
it your own way despite all the points I raised against your patch
series on my previous posting arguing against much of this.

So, at this point I give up with this patch series - clearly there is
no room for discussion about the way forward, and you want to do it
your way no matter what.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
