Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6AmfD89Yt2nQQAEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 16 Mar 2026 02:11:43 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BD0CA2934AD
	for <lists+linux-stm32@lfdr.de>; Mon, 16 Mar 2026 02:11:42 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5B83AC87EBD;
	Mon, 16 Mar 2026 01:11:42 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D5474C01FB6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Mar 2026 01:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HXOdXMtQPkX3JhHjejsDb3lWeyiFtHpKaRrKgt4OkHc=; b=CUhMUAGeYZEJFOoF7gMbHrExvU
 w+T8qqlDYDUp2Sxo9ZNprsUpT8PRMjHgQrXFSHOYMEADRouvXCsT9ye2bXZmejFsZ2sGxvQLtTddU
 cmaT5xqO5qMVnKTy37T6NelRwqMp5y134Rr0Epn14n/AqQ+c+uNQv1XEF34wDRVYyp4zGa1r2wnDw
 jgMGWEEMmRoA1a2PlGki0k847nu75Mt4N5WjOGGguP23ZV9IncgX8lCURAr4wicQ/nAB2hNF5zdok
 IfkZCnKnDBeGUZ1KOPXuos2VKJnlS+t6ZzWYsWYfuxb7MfKHlv/JMfv38xxmYLi48xoBkY+P8funr
 M1rYCDNg==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:56306)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <linux@armlinux.org.uk>) id 1w1wUS-000000003AQ-0pDz;
 Mon, 16 Mar 2026 01:11:28 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1w1wUN-000000004bS-1Asp; Mon, 16 Mar 2026 01:11:23 +0000
Date: Mon, 16 Mar 2026 01:11:23 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Message-ID: <abdYu864OmNWiWIW@shell.armlinux.org.uk>
References: <abQC7r38QLhSeadl@shell.armlinux.org.uk>
 <abdEscs44fU4kRag@oss.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <abdEscs44fU4kRag@oss.qualcomm.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Vinod Koul <vkoul@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 netdev@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 0/8] net: stmmac: improve PCS
	support
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
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[linux@armlinux.org.uk,linux-stm32-bounces@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:mohd.anwar@oss.qualcomm.com,m:andrew@lunn.ch,m:vkoul@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:netdev@vger.kernel.org,m:kuba@kernel.org,m:pabeni@redhat.com,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[armlinux.org.uk:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@armlinux.org.uk,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns,stormreply.com:email,stormreply.com:url,armlinux.org.uk:url,shell.armlinux.org.uk:mid]
X-Rspamd-Queue-Id: BD0CA2934AD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 16, 2026 at 05:15:53AM +0530, Mohd Ayaan Anwar wrote:
> Hi Russell,
> 
> 1. On QCS9100 Ride R3, the mdio subnode is only defined for ethernet0
>    (see lemans-ride-ethernet-aqr115c.dtsi). ethernet1 uses ethernet0's
>    MDIO bus, so plat_dat->mdio_bus_data is NULL for ethernet1. Therefore,
>    we get:
> 	[    9.205979] Hardware name: Qualcomm Technologies, Inc. Lemans Ride Rev3 (DT)
> 	[    9.221071] pc : qcom_ethqos_probe+0xc4/0x478 [dwmac_qcom_ethqos]
> 	[    9.221078] lr : qcom_ethqos_probe+0x7c/0x478 [dwmac_qcom_ethqos]
> 	[    9.221080] sp : ffff800081aa37f0
> 	[    9.221081] x29: ffff800081aa3860 x28: ffffcf84de69cfe8 x27: 0000000000000001
> 	[    9.221084] x26: 0000000000000000 x25: ffff0000b4577c80 x24: ffff0000818fd010
> 	[    9.221087] x23: ffff000ec7057628 x22: 0000000000000000 x21: ffffcf84ca2ce028
> 	[    9.221089] x20: ffff0000818fd000
> 	[    9.236975]  x19: ffff0000b3301740 x18: 00000000ffffffff
> 	[    9.236977] x17: 0000000000000000 x16: ffffcf84dc4a5448 x15: ffff0000b3301ec5
> 	[    9.236980] x14: 0000000000000000 x13: 0000000000000030 x12: 0101010101010101
> 	[    9.236982] x11: 7f7f7f7f7f7f7f7f x10: 00000000001305b0 x9 : 0000000000000000
> 	[    9.236984] x8 : ffff0000b3301780 x7 : 0000000000000000 x6 : 000000000000003f
> 	[    9.236986] x5 : 0000000000000040 x4 : 0000000000000000 x3 : ffff0000818fd210
> 	[    9.236988] x2 : 0000000000000017 x1 : 0000000000000000 x0 : 0000000000000001
> 	[    9.236991] Call trace:
> 	[    9.236991]  qcom_ethqos_probe+0xc4/0x478 [dwmac_qcom_ethqos] (P)
> 	[    9.236994]  platform_probe+0x5c/0xac
> 				...
> 	[    9.343300] Code: 910a7000 f9400b21 f9010320 52800020 (39005420)
> 	[    9.343302] ---[ end trace 0000000000000000 ]---
> 
>    I added the following workaround:
> 	--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> 	+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> 	@@ -765,7 +767,10 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
> 			case PHY_INTERFACE_MODE_SGMII:
> 					ethqos->configure_func = ethqos_configure_sgmii;
> 					plat_dat->mac_finish = ethqos_mac_finish_serdes;
> 	-               plat_dat->mdio_bus_data->default_an_inband = true;
> 	+               if (plat_dat->mdio_bus_data)
> 	+                       plat_dat->mdio_bus_data->default_an_inband = true;
> 	+               else
> 	+                       dev_err(dev, "plat_dat->mdio_bus_data is NULL");
> 					break;
> 			default:
> 					dev_err(dev, "Unsupported phy mode %s\n",

This means we need to move default_an_inband out of mdio_bus_data.

> 
> 2. After working around issue 1, I hit the following:
> 	[   27.822907] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000000
> 	[   27.831944] Mem abort info:
> 	[   27.834832]   ESR = 0x0000000086000006
> 	[   27.838693]   EC = 0x21: IABT (current EL), IL = 32 bits
> 	[   27.844163]   SET = 0, FnV = 0
> 	[   27.847320]   EA = 0, S1PTW = 0
> 	[   27.850563]   FSC = 0x06: level 2 translation fault
> 	[   27.855587] user pgtable: 4k pages, 48-bit VAs, pgdp=0000000134b1c000
> 	[   27.862212] [0000000000000000] pgd=080000010185c403, p4d=080000010185c403, pud=0800000134884403, pmd=0000000000000000
> 	[   27.873107] Internal error: Oops: 0000000086000006 [#1]  SMP
> 	[   28.001619] Hardware name: Qualcomm Technologies, Inc. Lemans Ride Rev3 (DT)
> 	[   28.008853] pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> 	[   28.016001] pc : 0x0
> 	[   28.018259] lr : phylink_pcs_an_restart+0x50/0x5c
> 	[   28.023092] sp : ffff8000869fb900
> 				...
> 	[   28.185967] ---[ end trace 0000000000000000 ]---
> 
>    This occurs due to pl->pcs->ops->pcs_an_restart being NULL. I added
>    the following workaround:
> 	--- a/drivers/net/phy/phylink.c
> 	+++ b/drivers/net/phy/phylink.c
> 	@@ -1026,7 +1026,8 @@ static void phylink_pcs_an_restart(struct phylink *pl)
> 			if (pl->pcs && linkmode_test_bit(ETHTOOL_LINK_MODE_Autoneg_BIT,
> 							 pl->link_config.advertising) &&
> 			    phy_interface_mode_is_8023z(pl->link_config.interface) &&
> 	-		    phylink_autoneg_inband(pl->act_link_an_mode))
> 	+		    phylink_autoneg_inband(pl->act_link_an_mode) &&
> 	+		    pl->pcs->ops->pcs_an_restart)
> 					pl->pcs->ops->pcs_an_restart(pl->pcs);
> 	 }

Gah, should've added a pcs_an_restart() implementation.

> 3. With the recent VLAN filter changes in net-next, ndo_open takes a long
>    time to complete as vlan_restore_hw_rx_fltr() tries to write filters
>    for all 32 indices. This board previously timed out once, but now
>    times out for each index. This is a separate issue unrelated to this
>    series but I added the following workaround to rule out any timing
>    issues.
> 	--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_vlan.c
> 	+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_vlan.c
> 	@@ -158,7 +158,8 @@ static void vlan_restore_hw_rx_fltr(struct net_device *dev,
> 
> 			/* Extended Rx VLAN Filter Enable */
> 			for (i = 0; i < hw->num_vlan; i++)
> 	-               vlan_write_filter(dev, hw, i, hw->vlan_filter[i]);
> 	+               if (hw->vlan_filter[i])
> 	+                       vlan_write_filter(dev, hw, i, hw->vlan_filter[i]);
> 	 }
> 
> 	 static void vlan_update_hash(struct mac_device_info *hw, u32 hash,

This problem needs solving, and I suspect we need more than the
loopback here. It needs detailed information about your hardware
design, and comes down to the missing receive clock. stmmac is
unusual that missing clocks affect the accessibility of the host.

> With the above workarounds in place, 2.5G works fine, but 1G (and 100M)
> do not. With the RFC v1 series, only the 2.5G->1G speed change was
> broken. With this series, the link does not come up at 1G at all.

This will be because we're not attaching any PHYs when phylink is
being told to operate in 2500BASE-X with inband, since it thinks
that's the media. That, and, because stmmac has a long history, it
needed a special phylink_expects_phy() check added in stmmac_init_phy()
which his what prevents the PHY being attached.

One workaround for this would be to specify SGMII in DT rather than
2500base-X. However, that's not a solution for mainline.

I'm going to have to have another think about this... stmmac is
beginning to get too painful to solve this problem. As I've said
elsewhere, in hind sight, I wish I had blocked dwmac-qcom-ethqos from
being merged because of it's direct fiddling with the integrated PCS.

I'm beginning to wonder whether stmmac can ever be sorted out, or
whether the driver has gone too far, and the best thing now is to
totally decouple it from phylink.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
