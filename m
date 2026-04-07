Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6Nn+KkAQ1Wl20AcAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 07 Apr 2026 16:10:08 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 36AA93AFC01
	for <lists+linux-stm32@lfdr.de>; Tue, 07 Apr 2026 16:10:07 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A6202C87EC8;
	Tue,  7 Apr 2026 14:10:07 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ACC5EC3F945
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 Apr 2026 14:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MN6qzqxRs/zqrPwuVs2/6X79CviG+I8DWPs5lk/Ay2c=; b=TWW+DFiilpedgYEvtVyq7aTK32
 O3BaEiUrFW1cKLzlvwnM8nb50GigIkogLZuJXkkCF0KkWw6k4YhEkMzSNRfhgRZ8AMZ8Shwam0edR
 pWSEcMgEplZ7851y63OAhIgW3Unkzw0Ou8ZIWTzXZ59MnxmqFXbMt9h+suaD1LRDNLq2/DhwZRRDR
 rWbqm+UTVyVUYtXuyK4cZmHgdSWSXe3Vu3WujAKjftI7mK2VTOHxaYr+Kp75Q9tkNYh1E/mkBi3AD
 Zze+0VwODVD2NvONOkTLv91I3qahyeX7LH9AMPR1vxf5X/ODgy06Xn65DxLY6IqJ89NqCla1w3Hme
 ERjpF/Nw==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:50812)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <linux@armlinux.org.uk>) id 1wA77h-0000000010S-2pf6;
 Tue, 07 Apr 2026 15:09:45 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1wA77U-000000002KF-1WoV; Tue, 07 Apr 2026 15:09:32 +0100
Date: Tue, 7 Apr 2026 15:09:32 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>
Message-ID: <adUQHHBD0d3p1OSI@shell.armlinux.org.uk>
References: <20260402213629.1996133-1-jitendra.vegiraju@broadcom.com>
 <20260402213629.1996133-2-jitendra.vegiraju@broadcom.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260402213629.1996133-2-jitendra.vegiraju@broadcom.com>
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
	NEURAL_SPAM(0.00)[0.693];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[armlinux.org.uk:url,st-md-mailman.stormreply.com:rdns,shell.armlinux.org.uk:mid,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: 36AA93AFC01
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Not withstanding my comment about the other Synopsys xlgmac driver that
we have in the kernel...

On Thu, Apr 02, 2026 at 02:36:26PM -0700, Jitendra Vegiraju wrote:
> From: Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>
> 
> The DW25GMAC introduced a new DMA architecture called Hyper-DMA (HDMA) for
> virtualization scalability. This is realized by decoupling physical DMA
> channels(PDMA) from potentially large number of virtual DMA channels(VDMA).
> The VDMAs provide software abstraction to driver that map to PDMAs for
> frame transmission and reception.
> Since 25GMAC is a derivative of XGMAC, majority of IP is common to both.
> 
> To add support for the HDMA in 25GMAC, a new instance of dma_ops,
> dw25gmac400_dma_ops is introduced.
> To support the current needs, a simple one-to-one mapping of dw25gmac's
> logical VDMA (channel) to TC to PDMAs is used. Most of the other dma
> operation functions in existing dwxgamc2_dma.c file are reused whereever

Typo: dwxgmac2_dma.c

> applicable.
> Added setup function for DW25GMAC's stmmac_hwif_entry in stmmac core.

In a previous review, I questioned the use of DWMAC_CORE_25GMAC and
asked about its version numberspace. I believe you indicated that the
version numberspace is the same as the existing XGMAC core.

I'm going to question the value of adding DWMAC_CORE_25GMAC.

1. What is the value of splitting DWMAC_CORE_25GMAC from
   DWMAC_CORE_XGMAC given that it's in the same versioning numberspace
   as XGMAC, and most tests (via dwmac_is_xgmac()) test for XGMAC or
   25GMAC?

2. Have you reviewed all the places that explicitly test for
   DWMAC_CORE_XGMAC, looking at their "false" paths (for non-XGMAC
   cores) to determine whether they are suitable? For example:

        if (priv->plat->core_type == DWMAC_CORE_XGMAC)
                ndev->max_mtu = XGMAC_JUMBO_LEN;
        else if (priv->plat->enh_desc || priv->synopsys_id >= DWMAC_CORE_4_00)
                ndev->max_mtu = JUMBO_LEN;
        else
                ndev->max_mtu = SKB_MAX_HEAD(NET_SKB_PAD + NET_IP_ALIGN);

   XGMAC can handle a max MTU of 16368, but with your code using
   DWMAC_CORE_25GMAC, we fall back to the next test, which tests the
   IP version against 0x40, and uses a max MTU of 9000. Given that
   DWMAC_CORE_4_00 is a different "version number space" this seems
   wrong.

3. Looking at the MDIO code, this looks very wrong if you're
   introducing DWMAC_CORE_25GMAC. Have you tested MDIO accesses?

   dwxgmac2_setup() is called for DWMAC_CORE_XGMAC core-type. In
   stmmac_mdio_register(), DWMAC_CORE_XGMAC uses different functions
   for MDIO bus access for C22 and C45 from other cores - it uses the
   stmmac_xgmac2_mdio_* functions.

   These use stmmac_xgmac2_c45_format() and stmmac_xgmac2_c22_format()
   to format the register values which do not depend on mii.*_mask, but
   do use mii.address and mii.data for the register offsets. Thus, is
   there any point to setting mii.addr_mask and mii.reg_mask ?

   For non-DWMAC_CORE_XGMAC cores, we fall back to the stmmac_mdio_*()
   functions, which for non-DWMAC_CORE_GMAC4 will only support Clause
   22 access, not Clause 45 - which would be very strange for a 25G
   core.

4. What about the feature printing in
   stmmac_main.c::stmmac_dma_cap_show() ?

5. What about similar tests in stmmac_est.c and stmmac_ethtool.c ?



-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
