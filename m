Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BD3AB9497C5
	for <lists+linux-stm32@lfdr.de>; Tue,  6 Aug 2024 20:56:17 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 62B4BC71290;
	Tue,  6 Aug 2024 18:56:17 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 20831C71289
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 Aug 2024 18:56:10 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-2f032cb782dso9113971fa.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 06 Aug 2024 11:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722970569; x=1723575369;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Pf9/0bfQnePOOTaXBk6YMsUHrh8Q8JuFZwwu+99uXH4=;
 b=dUi0inXWl1OtoX/fWA1ZdKEmEVsu6Bxz+foPgYlIuieEQyr7VRvBn6MJDqUMys7BAY
 fs7HV3I0D8qG/xBDnq7m+G+t2S+00y2IRMMShc4XubeKI/6pNNRcQHV6o9ODWA2sGJRh
 oM8NiGuOxh4yXzTM98p7qiOq05k7DjNvz9Ph8HLkMS8/+EN77XKK0ua5BSn0quP0XV/B
 YatOaCO7Rr0uUAcqKts+Y1TAaGbeU+7MgX24So0cIQP3fCRFpUXdfa8DnswKmGi4HTVq
 a9Iz0/MukyURFgkHM7dtsRK42lgJmrdeYIqVjuf3gCjYtvbfBCNWlFuO2uhuwt3MdYtF
 dF7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722970569; x=1723575369;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Pf9/0bfQnePOOTaXBk6YMsUHrh8Q8JuFZwwu+99uXH4=;
 b=twBi79biwQ5RmBUaTPJzjhNvvuchC1qcXYxE3jfPor5L2KKP8u3V8/8eZ0hteQXm7e
 KRofcyFCUQe2Kv4WhMqSr6j9Ee8IjDaioCBgA5OBD2biw1v2RI5hdNgpCppJLknAryXq
 wlRgMiI+cdnGBudi+OuYBphKjWFsO0FfNi2cdPa2/LWtozpgTYN2b1OLYUQZu20pB/G1
 2vl7NlgjlDtpVXjjK8i9d6FH1vBd8pqkwQ7z656Uf1V6ELIJLIzNpe9U6YksThAi7PeS
 M/9bWkvV9UeLPajSP+r1dFJMAQjR5s8+YbVL08OrTrrFSkIwE/yM1N49divkPHdTtRX1
 mGGQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWOU79BuFJHUyLPlievY/xApTaVNxMGafuO/cYeSNqkuyUd8VQRA7dUGC83yHdE/rhqh8b8MDYZb5Ri7LTuSE7TjRxPVcVJ2UOUU1H9wKhuKk4jy2HhJE2K
X-Gm-Message-State: AOJu0YxyhO50Aza6qt8E5YE1guyWcBs4z5u/beg7qMIz1fbSYAWt+51k
 yUyqteJduDeoDmwiWQAF252RLDf/roh9KPNSu0ExKFzqrJ9ZjJDK
X-Google-Smtp-Source: AGHT+IE4j3d2MbABxSDMFiENvEQ+bNAsQAZt/hODsl/X0IxURgYF6oPEul6YrvfjSgyayvsvcJx8vg==
X-Received: by 2002:a05:651c:218:b0:2ef:2608:2e47 with SMTP id
 38308e7fff4ca-2f15aa92e41mr117683181fa.13.1722970568665; 
 Tue, 06 Aug 2024 11:56:08 -0700 (PDT)
Received: from mobilestation ([178.176.56.174])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f15e187584sm15388571fa.4.2024.08.06.11.56.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Aug 2024 11:56:07 -0700 (PDT)
Date: Tue, 6 Aug 2024 21:56:04 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Message-ID: <rq2wbrm2q3bizgxcnl6kmdiycpldjl6rllsqqgpzfhsfodnd3o@ymdfbxq2gj5j>
References: <ZrCoQZKo74zvKMhT@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZrCoQZKo74zvKMhT@shell.armlinux.org.uk>
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

Hi Russell

On Mon, Aug 05, 2024 at 11:24:01AM +0100, Russell King (Oracle) wrote:
> Hi,
> 
> Changes since version 3:
> - added Andrew's reviewed-bys
> - fixed kernel-doc for dwmac_pcs_isr()
> - updated patch 11 commit message
> - fixed build error reported by Jakub
> - add Sneh Shah to Cc list (for testing 2.5G modes)
> 
> Bartosz - I know you've given your tested-by this morning, I will be
> adding that after posting this series, so please don't think it's been
> lost!

Got this series tested on my DW GMAC v3.73a + Micrel KSZ9031RNX PHY
with the in-band link status management enabled. The same positive result
as before, on v1-v2:
[  294.651324] stmmaceth 1f060000.ethernet eth1: configuring for inband/rgmii-rxid link mode
[  294.582498] stmmaceth 1f060000.ethernet eth1: Register MEM_TYPE_PAGE_POOL RxQ-0
[  294.594308] stmmaceth 1f060000.ethernet eth1: PHY [stmmac-1:03] driver [RTL8211E Gigabit Ethernet] (irq=POLL)
[  294.605453] dwmac1000: Master AXI performs any burst length
[  294.611899] stmmaceth 1f060000.ethernet: invalid port speed
[  294.618229] stmmaceth 1f060000.ethernet eth1: No Safety Features support found
[  294.626412] stmmaceth 1f060000.ethernet eth1: No MAC Management Counters available
[  294.634912] stmmaceth 1f060000.ethernet eth1: IEEE 1588-2008 Advanced Timestamp supported
[  294.644380] stmmaceth 1f060000.ethernet eth1: registered PTP clock
[  294.651324] stmmaceth 1f060000.ethernet eth1: configuring for inband/rgmii-rxid link mode
...
[  298.772917] stmmaceth 1f060000.ethernet eth1: Link is Up - 1Gbps/Full - flow control rx/tx

So feel free to add:
Tested-by: Serge Semin <fancer.lancer@gmail.com>

Please note the warning: "stmmaceth 1f060000.ethernet: invalid port
speed" in the log above. This is a false negative warning since my
network devices isn't of MAC2MAC-type and there is no snps,ps-speed
property in my dts. So having the priv->hw.ps set to zero should be
fine. That said I guess we need to add the warning fix to the 14/14
patch which would permit the plat_stmmacenet_data::mac_port_sel_speed
field being zero.

> 
> Previous cover messages from earlier posts below:
> 
> This is version 3 of the series switching stmmac to use phylink PCS
> isntead of going behind phylink's back.
> 
> Changes since version 2:
> - Adopted some of Serge's feedback.
> - New patch: adding ethqos_pcs_set_inband() for qcom-ethqos so we
>   have one place to modify for AN control rather than many.
> - New patch: pass the stmmac_priv structure into the pcs_set_ane()
>   method.
> - New patch: remove pcs_get_adv_lp() early, as this is only for TBI
>   and RTBI, support for which we dropped in an already merged patch.
> - Provide stmmac_pcs structure to encapsulate the pointer to
>   stmmac_priv, PCS MMIO address pointer and phylink_pcs structure.
> - Restructure dwmac_pcs_config() so we can eventually share code
>   with dwmac_ctrl_ane().
> - New patch: move dwmac_ctrl_ane() into stmmac_pcs.c, and share code.
> - New patch: pass the stmmac_pcs structure into dwmac_pcs_isr().
> - New patch: similar to Serge's patch, rename the PCS registers, but
>   use STMMAC_PCS_ as the prefix rather than just PCS_ which is too
>   generic.
> - New patch: incorporate "net: stmmac: Activate Inband/PCS flag
>   based on the selected iface" from Serge.
> 
> On the subject of whether we should have two PCS instances, I
> experimented with that and have now decided against it. Instead,
> dwmac_pcs_config() now tests whether we need to fiddle with the
> PCS control register or not.
> 

> Note that I prefer not to have multiple layers of indirection, but
> instead prefer a library-style approach, which is why I haven't
> turned the PCS support into something that's self contained with
> a method in the MAC driver to grab the RGSMII status.

I understand the reason of your choice in this case. As a result a
some part of my changes haven't been merged in into your series. But I
deliberately selected the approach with having the simple PCS
HW-interface callbacks utilized for a self-contained internal PCS
implementation. Here is why:
1. Signify that the DW GMAC and DW QoS Eth internal PCSs are the
same.
2. Reduce the amount of code.
3. Collects the entire PCS implementation in a single place which
improves the code readability.
4. The PCS ops initialization is implemented in the same way as the
PTP, MMC and EST (and likely FPE in some time in future), in the
hwif.c and the interface/core callbacks in the dedicated files
(stmmac_ptp.c, mmc_core.c, stmmac_est.c, etc). So the PCS
implementation would be in general unified with what has been done for
PTP/MMC/EST/etc. 
5. ...

Taking that into account I am still convinced that my approach worth
to be implemented. Hope you won't mind, if after your series is merged
in I'll submit another patch set which would introduce some of my
PCS-changes not included into your patch set. Like this:
1. Move the mac_device_info instance to being defined in the
stmmac_priv structure (new patch, so to drop the stmmac_priv pointer
from stmmac_pcs).
2. Introduce stmmac_priv::pcsaddr (to have the PCS CSR base address
defined in the same way as for PTP/MMC/EST/etc).
3. Provide the HWIF ops:
   stmmac_pcs_ops {
        pcs_get_config_reg;
        pcs_enable_irq;
        pcs_disable_irq;
   } for DW GMAC and DW QoS Eth.
4. Move PCS implementation to stmmac_pcs.c
5. Direct using the plat_stmmacenet_data::mac_port_sel_speed field
instead of the mac_device_info::ps.
6. Some more cleanups like converting the struct stmmac_hwif_entry
field from void-pointers to the typed-pointers, ...

-Serge(y)

> 
> -----
> 
> This is version 2 of the series switching stmmac to use phylink PCS
> instead of going behind phylink's back.
> 
> Changes since version 1:
> - Addition of patches from Serge Semin to allow RGMII to use the
>   "PCS" code even if priv->dma_cap.pcs is not set (including tweaks
>   by me.)
> - Restructuring of the patch set to be a more logical split.
> - Leave the pcs_ctrl_ane methods until we've worked out what to do
>   with the qcom-ethqos driver (this series may still end up breaking
>   it, but at least we will now successfully compile.)
> 
> A reminder that what I want to hear from this patch set are the results
> of testing - and thanks to Serge, the RGMII paths were exercised, but
> I have not had any results for the SGMII side of this.
> 
> There are still a bunch of outstanding questions:
> 
> - whether we should be using two separate PCS instances, one for
>   RGMII and another for SGMII. If the PCS hardware is not present,
>   but are using RGMII mode, then we probably don't want to be
>   accessing the registers that would've been there for SGMII.
> - what the three interrupts associated with the PCS code actually
>   mean when they fire.
> - which block's status we're reading in the pcs_get_state() method,
>   and whether we should be reading that for both RGMII and SGMII.
> - whether we need to activate phylink's inband mode in more cases
>   (so that the PCS/MAC status gets read and used for the link.)
> 
> There's probably more questions to be asked... but really the critical
> thing is to shake out any breakage from making this conversion. Bear
> in mind that I have little knowledge of this hardware, so this
> conversion has been done somewhat blind using only what I can observe
> from the current driver.
> 
> ------
> 
> As I noted recently in a thread (and was ignored) stmmac sucks. (I
> won't hide my distain for drivers that make my life as phylink
> maintainer more difficult!)
> 
> One of the contract conditions for using phylink is that the driver
> will _not_ mess with the netif carrier. stmmac developers/maintainers
> clearly didn't read that, because stmmac messes with the netif
> carrier, which destroys phylink's guarantee that it'll make certain
> calls in a particular order (e.g. it won't call mac_link_up() twice
> in a row without an intervening mac_link_down().) This is clearly
> stated in the phylink documentation.
> 
> Thus, this patch set attempts to fix this. Why does it mess with the
> netif carrier? It has its own independent PCS implementation that
> completely bypasses phylink _while_ phylink is still being used.
> This is not acceptable. Either the driver uses phylink, or it doesn't
> use phylink. There is no half-way house about this. Therefore, this
> driver needs to either be fixed, or needs to stop using phylink.
> 
> Since I was ignored when I brought this up, I've hacked together the
> following patch set - and it is hacky at the moment. It's also broken
> because of recentl changes involving dwmac-qcom-ethqos.c - but there
> isn't sufficient information in the driver for me to fix this. The
> driver appears to use SGMII at 2500Mbps, which simply does not exist.
> What interface mode (and neg_mode) does phylink pass to pcs_config()
> in each of the speeds that dwmac-qcom-ethqos.c is interested in.
> Without this information, I can't do that conversion. So for the
> purposes of this, I've just ignored dwmac-qcom-ethqos.c (which means
> it will fail to build.)
> 
> The patch splitup is not ideal, but that's not what I'm interested in
> here. What I want to hear is the results of testing - does this switch
> of the RGMII/SGMII "pcs" stuff to a phylink_pcs work for this driver?
> 
> Please don't review the patches, but you are welcome to send fixes to
> them. Once we know that the overall implementation works, then I'll
> look at how best to split the patches. In the mean time, the present
> form is more convenient for making changes and fixing things.
> 
> There is still more improvement that's needed here.
> 
> Thanks.
> 
>  drivers/net/ethernet/stmicro/stmmac/Makefile       |   2 +-
>  drivers/net/ethernet/stmicro/stmmac/common.h       |  25 ++--
>  .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    |  13 +-
>  drivers/net/ethernet/stmicro/stmmac/dwmac1000.h    |  13 +-
>  .../net/ethernet/stmicro/stmmac/dwmac1000_core.c   | 110 +++++++-------
>  drivers/net/ethernet/stmicro/stmmac/dwmac4.h       |  13 +-
>  drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c  |  99 +++++++------
>  drivers/net/ethernet/stmicro/stmmac/hwif.h         |  24 ++--
>  .../net/ethernet/stmicro/stmmac/stmmac_ethtool.c   | 111 +-------------
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c  |  30 +---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c   |  63 ++++++++
>  drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h   | 160 ++++++++++-----------
>  12 files changed, 306 insertions(+), 357 deletions(-)
>  create mode 100644 drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c
> 
> -- 
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
