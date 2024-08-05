Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D0795947970
	for <lists+linux-stm32@lfdr.de>; Mon,  5 Aug 2024 12:24:37 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7EAD1C7128F;
	Mon,  5 Aug 2024 10:24:37 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BEDC5C6B45B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 Aug 2024 10:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
 Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zTpA9x9kukSOwUTDZi7ZggHcwRWBVASVXoF+8pkOu/c=; b=ey8p74j9MyZuxv1LeO36IUtFZe
 yaeH+cJ34L5N0LU1L3nc+HhFTnMzijNxna0llkIGXaAFoGAodPKaisczaMrRIWHMU4rlvPmLXH1fP
 EaHPhfqE8QPROKoNihL5t35OOEZz0pFvGKQbMMsGgj/14fGXjH/WMwH0VTvmcaThKvi5wnPEj5Tqw
 Wzpuot4TL1dtFhLeuOl4SuJLmOo485DyVIKn7sqPYTrVCzhg7OonzbHJeD+o0039RC3FPVsVZA9nE
 6plGjlqF4IAdMh5pgXkeZp06QJKdSmwn1IqiCjtAtH8GCud5fZbkLo2TRJq1zMQkU5/u++jd21Ehw
 hF0A2mFg==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:34132)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1sausj-0002ab-0X;
 Mon, 05 Aug 2024 11:24:01 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1sausj-0002J4-50; Mon, 05 Aug 2024 11:24:01 +0100
Date: Mon, 5 Aug 2024 11:24:01 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Serge Semin <fancer.lancer@gmail.com>
Message-ID: <ZrCoQZKo74zvKMhT@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
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
Subject: [Linux-stm32] [PATCH RFC net-next v4 00/14] net: stmmac: convert
 stmmac "pcs" to phylink
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

Hi,

Changes since version 3:
- added Andrew's reviewed-bys
- fixed kernel-doc for dwmac_pcs_isr()
- updated patch 11 commit message
- fixed build error reported by Jakub
- add Sneh Shah to Cc list (for testing 2.5G modes)

Bartosz - I know you've given your tested-by this morning, I will be
adding that after posting this series, so please don't think it's been
lost!

Previous cover messages from earlier posts below:

This is version 3 of the series switching stmmac to use phylink PCS
isntead of going behind phylink's back.

Changes since version 2:
- Adopted some of Serge's feedback.
- New patch: adding ethqos_pcs_set_inband() for qcom-ethqos so we
  have one place to modify for AN control rather than many.
- New patch: pass the stmmac_priv structure into the pcs_set_ane()
  method.
- New patch: remove pcs_get_adv_lp() early, as this is only for TBI
  and RTBI, support for which we dropped in an already merged patch.
- Provide stmmac_pcs structure to encapsulate the pointer to
  stmmac_priv, PCS MMIO address pointer and phylink_pcs structure.
- Restructure dwmac_pcs_config() so we can eventually share code
  with dwmac_ctrl_ane().
- New patch: move dwmac_ctrl_ane() into stmmac_pcs.c, and share code.
- New patch: pass the stmmac_pcs structure into dwmac_pcs_isr().
- New patch: similar to Serge's patch, rename the PCS registers, but
  use STMMAC_PCS_ as the prefix rather than just PCS_ which is too
  generic.
- New patch: incorporate "net: stmmac: Activate Inband/PCS flag
  based on the selected iface" from Serge.

On the subject of whether we should have two PCS instances, I
experimented with that and have now decided against it. Instead,
dwmac_pcs_config() now tests whether we need to fiddle with the
PCS control register or not.

Note that I prefer not to have multiple layers of indirection, but
instead prefer a library-style approach, which is why I haven't
turned the PCS support into something that's self contained with
a method in the MAC driver to grab the RGSMII status.

-----

This is version 2 of the series switching stmmac to use phylink PCS
instead of going behind phylink's back.

Changes since version 1:
- Addition of patches from Serge Semin to allow RGMII to use the
  "PCS" code even if priv->dma_cap.pcs is not set (including tweaks
  by me.)
- Restructuring of the patch set to be a more logical split.
- Leave the pcs_ctrl_ane methods until we've worked out what to do
  with the qcom-ethqos driver (this series may still end up breaking
  it, but at least we will now successfully compile.)

A reminder that what I want to hear from this patch set are the results
of testing - and thanks to Serge, the RGMII paths were exercised, but
I have not had any results for the SGMII side of this.

There are still a bunch of outstanding questions:

- whether we should be using two separate PCS instances, one for
  RGMII and another for SGMII. If the PCS hardware is not present,
  but are using RGMII mode, then we probably don't want to be
  accessing the registers that would've been there for SGMII.
- what the three interrupts associated with the PCS code actually
  mean when they fire.
- which block's status we're reading in the pcs_get_state() method,
  and whether we should be reading that for both RGMII and SGMII.
- whether we need to activate phylink's inband mode in more cases
  (so that the PCS/MAC status gets read and used for the link.)

There's probably more questions to be asked... but really the critical
thing is to shake out any breakage from making this conversion. Bear
in mind that I have little knowledge of this hardware, so this
conversion has been done somewhat blind using only what I can observe
from the current driver.

------

As I noted recently in a thread (and was ignored) stmmac sucks. (I
won't hide my distain for drivers that make my life as phylink
maintainer more difficult!)

One of the contract conditions for using phylink is that the driver
will _not_ mess with the netif carrier. stmmac developers/maintainers
clearly didn't read that, because stmmac messes with the netif
carrier, which destroys phylink's guarantee that it'll make certain
calls in a particular order (e.g. it won't call mac_link_up() twice
in a row without an intervening mac_link_down().) This is clearly
stated in the phylink documentation.

Thus, this patch set attempts to fix this. Why does it mess with the
netif carrier? It has its own independent PCS implementation that
completely bypasses phylink _while_ phylink is still being used.
This is not acceptable. Either the driver uses phylink, or it doesn't
use phylink. There is no half-way house about this. Therefore, this
driver needs to either be fixed, or needs to stop using phylink.

Since I was ignored when I brought this up, I've hacked together the
following patch set - and it is hacky at the moment. It's also broken
because of recentl changes involving dwmac-qcom-ethqos.c - but there
isn't sufficient information in the driver for me to fix this. The
driver appears to use SGMII at 2500Mbps, which simply does not exist.
What interface mode (and neg_mode) does phylink pass to pcs_config()
in each of the speeds that dwmac-qcom-ethqos.c is interested in.
Without this information, I can't do that conversion. So for the
purposes of this, I've just ignored dwmac-qcom-ethqos.c (which means
it will fail to build.)

The patch splitup is not ideal, but that's not what I'm interested in
here. What I want to hear is the results of testing - does this switch
of the RGMII/SGMII "pcs" stuff to a phylink_pcs work for this driver?

Please don't review the patches, but you are welcome to send fixes to
them. Once we know that the overall implementation works, then I'll
look at how best to split the patches. In the mean time, the present
form is more convenient for making changes and fixing things.

There is still more improvement that's needed here.

Thanks.

 drivers/net/ethernet/stmicro/stmmac/Makefile       |   2 +-
 drivers/net/ethernet/stmicro/stmmac/common.h       |  25 ++--
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    |  13 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac1000.h    |  13 +-
 .../net/ethernet/stmicro/stmmac/dwmac1000_core.c   | 110 +++++++-------
 drivers/net/ethernet/stmicro/stmmac/dwmac4.h       |  13 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c  |  99 +++++++------
 drivers/net/ethernet/stmicro/stmmac/hwif.h         |  24 ++--
 .../net/ethernet/stmicro/stmmac/stmmac_ethtool.c   | 111 +-------------
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c  |  30 +---
 drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c   |  63 ++++++++
 drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h   | 160 ++++++++++-----------
 12 files changed, 306 insertions(+), 357 deletions(-)
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
