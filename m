Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iC7lIgom1WnB1gcAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 07 Apr 2026 17:43:06 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1013B3B1354
	for <lists+linux-stm32@lfdr.de>; Tue, 07 Apr 2026 17:43:05 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5E34AC8F280;
	Tue,  7 Apr 2026 15:43:05 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2497FC3F945
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 Apr 2026 15:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=K6eG3w8oiPUCd97QZfkNIfRJmJJfLCqermLxkdTt38E=; b=Um8vfHvOGVLnBSi1YYwENGR4vX
 XA9btB41CoP26mDXUqrtPLuhlFVMsmt228uPgpV4TCuJ4Q9lXEKBrCH1g1BirZsPmK6H4ovx1dfrU
 bliXp1c/yaX7FOvcBCsv9pi1DgKRLhYCu+qWx9mXArKxw2FBiaRX4JFBW7QO51ca+1yFZNjqUNIDc
 X0ELogoWHD2b2nUBtmTIyB4N5zHG8VlicmoObcg8z5abng0crlcXhIC8XRx4YhXlMUV4RX1HQnKVn
 oxzkDqMh7nXOSRDwL/xfbmk19ErBXMmJtRmDTIPU3nftLTBKJGERrp8cERvtF/DV+cMrGTxOcJclb
 x3uyXA8w==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:39138)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <linux@armlinux.org.uk>) id 1wA8Zd-0000000017q-03UP;
 Tue, 07 Apr 2026 16:42:41 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1wA8ZT-000000002NZ-2JxT; Tue, 07 Apr 2026 16:42:31 +0100
Date: Tue, 7 Apr 2026 16:42:31 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>
Message-ID: <adUl51QqkeVAd_Pa@shell.armlinux.org.uk>
References: <20260402213629.1996133-1-jitendra.vegiraju@broadcom.com>
 <20260402213629.1996133-2-jitendra.vegiraju@broadcom.com>
 <adUQHHBD0d3p1OSI@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <adUQHHBD0d3p1OSI@shell.armlinux.org.uk>
Cc: quic_abchauha@quicinc.com, me@ziyao.cc, chenchuangyu@xiaomi.com,
 edumazet@google.com, lizhi2@eswincomputing.com, yangtiezhu@loongson.cn,
 linux-stm32@st-md-mailman.stormreply.com, weishangjuan@eswincomputing.com,
 daniel@iogearbox.net, chenhuacai@kernel.org, john.fastabend@gmail.com,
 siyanteng@cqsoftware.com.cn, sdf@fomichev.me,
 bcm-kernel-feedback-list@broadcom.com, vladimir.oltean@nxp.com,
 kuba@kernel.org, pabeni@redhat.com, hawk@kernel.org, richardcochran@gmail.com,
 rohan.g.thomas@altera.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 ast@kernel.org, wens@kernel.org, linux-arm-kernel@lists.infradead.org,
 mcoquelin.stm32@gmail.com, florian.fainelli@broadcom.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch,
 boon.khai.ng@altera.com, horms@kernel.org, bpf@vger.kernel.org,
 davem@davemloft.net, ovidiu.panait.rb@renesas.com
Subject: Re: [Linux-stm32] [PATCH net-next v9 1/4] net: stmmac: Add DW25GMAC
 support in stmmac core driver
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
X-Spamd-Result: default: False [3.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[armlinux.org.uk:s=pandora-2019];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[armlinux.org.uk : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jitendra.vegiraju@broadcom.com,m:quic_abchauha@quicinc.com,m:me@ziyao.cc,m:chenchuangyu@xiaomi.com,m:edumazet@google.com,m:lizhi2@eswincomputing.com,m:yangtiezhu@loongson.cn,m:linux-stm32@st-md-mailman.stormreply.com,m:weishangjuan@eswincomputing.com,m:daniel@iogearbox.net,m:chenhuacai@kernel.org,m:john.fastabend@gmail.com,m:siyanteng@cqsoftware.com.cn,m:sdf@fomichev.me,m:bcm-kernel-feedback-list@broadcom.com,m:vladimir.oltean@nxp.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:hawk@kernel.org,m:richardcochran@gmail.com,m:rohan.g.thomas@altera.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:ast@kernel.org,m:wens@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:mcoquelin.stm32@gmail.com,m:florian.fainelli@broadcom.com,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:andrew+netdev@lunn.ch,m:boon.khai.ng@altera.com,m:horms@kernel.org,m:bpf@vger.kernel.org,m:davem@davemloft.net,m:ovidiu.panait.rb@renesas.com,m:johnfastabend@gmail.com,m:mcoquelinstm32@gm
 ail.com,m:andrew@lunn.ch,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[linux@armlinux.org.uk,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[35];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[quicinc.com,ziyao.cc,xiaomi.com,google.com,eswincomputing.com,loongson.cn,st-md-mailman.stormreply.com,iogearbox.net,kernel.org,gmail.com,cqsoftware.com.cn,fomichev.me,broadcom.com,nxp.com,redhat.com,altera.com,bp.renesas.com,lists.infradead.org,vger.kernel.org,lunn.ch,davemloft.net,renesas.com];
	NEURAL_SPAM(0.00)[0.717];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@armlinux.org.uk,linux-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[armlinux.org.uk:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[armlinux.org.uk:url,shell.armlinux.org.uk:mid]
X-Rspamd-Queue-Id: 1013B3B1354
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 07, 2026 at 03:09:32PM +0100, Russell King (Oracle) wrote:
> Not withstanding my comment about the other Synopsys xlgmac driver that
> we have in the kernel...
> 
> On Thu, Apr 02, 2026 at 02:36:26PM -0700, Jitendra Vegiraju wrote:
> > From: Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>
> > 
> > The DW25GMAC introduced a new DMA architecture called Hyper-DMA (HDMA) for
> > virtualization scalability. This is realized by decoupling physical DMA
> > channels(PDMA) from potentially large number of virtual DMA channels(VDMA).
> > The VDMAs provide software abstraction to driver that map to PDMAs for
> > frame transmission and reception.
> > Since 25GMAC is a derivative of XGMAC, majority of IP is common to both.
> > 
> > To add support for the HDMA in 25GMAC, a new instance of dma_ops,
> > dw25gmac400_dma_ops is introduced.
> > To support the current needs, a simple one-to-one mapping of dw25gmac's
> > logical VDMA (channel) to TC to PDMAs is used. Most of the other dma
> > operation functions in existing dwxgamc2_dma.c file are reused whereever
> 
> Typo: dwxgmac2_dma.c
> 
> > applicable.
> > Added setup function for DW25GMAC's stmmac_hwif_entry in stmmac core.
> 
> In a previous review, I questioned the use of DWMAC_CORE_25GMAC and
> asked about its version numberspace. I believe you indicated that the
> version numberspace is the same as the existing XGMAC core.
> 
> I'm going to question the value of adding DWMAC_CORE_25GMAC.
> 
> 1. What is the value of splitting DWMAC_CORE_25GMAC from
>    DWMAC_CORE_XGMAC given that it's in the same versioning numberspace
>    as XGMAC, and most tests (via dwmac_is_xgmac()) test for XGMAC or
>    25GMAC?
> 
> 2. Have you reviewed all the places that explicitly test for
>    DWMAC_CORE_XGMAC, looking at their "false" paths (for non-XGMAC
>    cores) to determine whether they are suitable? For example:
> 
>         if (priv->plat->core_type == DWMAC_CORE_XGMAC)
>                 ndev->max_mtu = XGMAC_JUMBO_LEN;
>         else if (priv->plat->enh_desc || priv->synopsys_id >= DWMAC_CORE_4_00)
>                 ndev->max_mtu = JUMBO_LEN;
>         else
>                 ndev->max_mtu = SKB_MAX_HEAD(NET_SKB_PAD + NET_IP_ALIGN);
> 
>    XGMAC can handle a max MTU of 16368, but with your code using
>    DWMAC_CORE_25GMAC, we fall back to the next test, which tests the
>    IP version against 0x40, and uses a max MTU of 9000. Given that
>    DWMAC_CORE_4_00 is a different "version number space" this seems
>    wrong.

This is actually wrong - for DWMAC_CORE_25GMAC with a synopsys_id
less than 0x40, this will fall back to SKB_MAX_HEAD(NET_SKB_PAD +
NET_IP_ALIGN) which is as good as "pluck a number out of the air
and watch the driver fall over if you increase the MTU to maximum".
max_mtu ends up being dependent on the system page size, not on any
hardware limitation, which is garbage.

> 3. Looking at the MDIO code, this looks very wrong if you're
>    introducing DWMAC_CORE_25GMAC. Have you tested MDIO accesses?
> 
>    dwxgmac2_setup() is called for DWMAC_CORE_XGMAC core-type. In
>    stmmac_mdio_register(), DWMAC_CORE_XGMAC uses different functions
>    for MDIO bus access for C22 and C45 from other cores - it uses the
>    stmmac_xgmac2_mdio_* functions.
> 
>    These use stmmac_xgmac2_c45_format() and stmmac_xgmac2_c22_format()
>    to format the register values which do not depend on mii.*_mask, but
>    do use mii.address and mii.data for the register offsets. Thus, is
>    there any point to setting mii.addr_mask and mii.reg_mask ?
> 
>    For non-DWMAC_CORE_XGMAC cores, we fall back to the stmmac_mdio_*()
>    functions, which for non-DWMAC_CORE_GMAC4 will only support Clause
>    22 access, not Clause 45 - which would be very strange for a 25G
>    core.
> 
> 4. What about the feature printing in
>    stmmac_main.c::stmmac_dma_cap_show() ?
> 
> 5. What about similar tests in stmmac_est.c and stmmac_ethtool.c ?

Another issue that needs to be looked into is all the tests that
check priv->synopsys_id without checking the core_type. I'm already
concerned that many of these are wrong.

I have some patches now that rename synopsys_id to snpsver (it's really
the Synopsys IP version field which is BCD of the major version and
first digit of the minor version, not some random ID that identifies
the core.)

From what I've ascertained so far:

    GMAC100 cores do not have a readable snpsver number, thus this
    will be zero.

    GMAC cores generally have a snpsver number less than 0x40.

    GMAC4 cores may have a version number that overlaps GMAC cores
    (see first entry for DWMAC_CORE_GMAC4).

    XGMAC and XLGMAC cores each have an entirely separate IP version
    number space from GMAC and GMAC4, which are distinguished by their
    respective userver.

For example:

        /* Only DWMAC core version 5.20 onwards supports HW descriptor prefetch.
         */
        if (priv->snpsver < DWMAC_CORE_5_20)
                priv->plat->dma_cfg->dche = false;

This will match your 25GMAC cores and the XGMAC cores because they have
a Synopsys IP version number less than 0x52. What saves us there is
that dche is only read by dwmac4_dma_init(), used by dwmac4_dma_ops and
dwmac410_dma_ops. These are all used by hwif entries that require
priv->plat->core_type to be DWMAC_CORE_GMAC4. Thus, I'm changing this
one to:

        /* Only DWMAC4 core version 5.20 onwards support HW descriptor prefetch.
         */
        if (priv->plat->core_type != DWMAC_CORE_GMAC4 ||
            priv->snpsver < DWMAC_CORE_5_20)
                priv->plat->dma_cfg->dche = false;

although I'm wondering if that should really be == && to avoid writing
to it for non-GMAC4 cores (it really doesn't matter.)

Then there this:

                case HWTSTAMP_FILTER_PTP_V2_EVENT:
                        /* PTP v2/802.AS1 any layer, any kind of event packet */
                        config->rx_filter = HWTSTAMP_FILTER_PTP_V2_EVENT;
                        ptp_v2 = PTP_TCR_TSVER2ENA;
                        snap_type_sel = PTP_TCR_SNAPTYPSEL_1;
                        if (priv->snpsver < DWMAC_CORE_4_10)
                                ts_event_en = PTP_TCR_TSEVNTENA;

Is PTP_TCR_TSEVNTENA needed for this PTP filter type for XGMAC and
25GMAC cores - because they'll get it because they have snpsver
smaller than 0x41.

Similar here:

        if (priv->plat->rx_coe) {
                priv->hw->rx_csum = priv->plat->rx_coe;
                dev_info(priv->device, "RX Checksum Offload Engine supported\n")+;
                if (priv->snpsver < DWMAC_CORE_4_00)
                        dev_info(priv->device, "COE Type %d\n", priv->hw->rx_csu+m);
        }

In stmmac_ethtool.c, stmmac_mac_debug() won't be called for XGMAC or
25GMAC cores, because:

                if (priv->snpsver >= DWMAC_CORE_3_50)
                        stmmac_mac_debug(priv, priv->ioaddr,
                                        (void *)&priv->xstats,
                                        rx_queues_count, tx_queues_count);

snpsver (synopsys_id) will be smaller than 0x35. Is this correct?

The good news is that stmmac_mdio.c at gates all its checks on the
Synopsys IP version against the core type.

I'll post my RFC patches tidying up some of the version mess in the
next day or so.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
