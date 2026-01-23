Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SJDTF/boc2nhzQAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 23 Jan 2026 22:32:38 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D0F557AED1
	for <lists+linux-stm32@lfdr.de>; Fri, 23 Jan 2026 22:32:37 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6E5E9C8F264;
	Fri, 23 Jan 2026 21:32:37 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 34E02C030CD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Jan 2026 21:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UId/Vzt9Vm2GMBalR/x7lGAofZBiET9NUSj2/ZXMbKw=; b=UUVNlVPj9g+71IhAhxMULD9ivp
 frh5NGpDhavuR+455fTIxq4AsTEpiUZgXVk0HasxdIi98K7k3RRP7N+iWhDyCxEh9lh11T4f9Ad/6
 PkHZeihli1kFmfs5qwHKvpHOI07TrNEtvK+ZiVmZWYLgSWU/ozx5M72kIR/jNtfHAXwDslutBShFe
 pDtmZQhMAitq6rtrK1c/pSRmDQKWohJzJiPduRvw6pp65OnOtiwP0qXgUQI70/XxvYTr+/9xdihQz
 SCxnjkqNlqsasxYT6+YN5G8i7Ydi2h2cdI7ifWwETuuMrq1coSffTwsc3dXpsHr9SK8DcpDFrtq8J
 hiXRr/4g==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:43970)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <linux@armlinux.org.uk>) id 1vjOlV-000000002YU-2dTD;
 Fri, 23 Jan 2026 21:32:25 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1vjOlR-000000002QA-2jQL; Fri, 23 Jan 2026 21:32:21 +0000
Date: Fri, 23 Jan 2026 21:32:21 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Message-ID: <aXPo5R1Q-qWG3r3l@shell.armlinux.org.uk>
References: <aXNEwBW3OA1xLEUj@shell.armlinux.org.uk>
 <aXN5BFXMshnhwBQ7@oss.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aXN5BFXMshnhwBQ7@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Andrew Lunn <andrew@lunn.ch>, Neil Armstrong <neil.armstrong@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Vinod Koul <vkoul@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 netdev@vger.kernel.org, linux-phy@lists.infradead.org,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next v2 00/14] net: stmmac: SerDes, PCS,
 BASE-X, and inband goodies
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
X-Rspamd-Server: lfdr
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
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:mohd.anwar@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:andrew@lunn.ch,m:neil.armstrong@linaro.org,m:linux-arm-msm@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:vkoul@kernel.org,m:mcoquelin.stm32@gmail.com,m:netdev@vger.kernel.org,m:linux-phy@lists.infradead.org,m:kuba@kernel.org,m:pabeni@redhat.com,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,m:hkallweit1@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,lunn.ch,linaro.org,vger.kernel.org,st-md-mailman.stormreply.com,google.com,kernel.org,gmail.com,lists.infradead.org,redhat.com,davemloft.net];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[linux@armlinux.org.uk,linux-stm32-bounces@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[armlinux.org.uk:-];
	NEURAL_SPAM(0.00)[0.729];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[linux@armlinux.org.uk,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: D0F557AED1
X-Rspamd-Action: no action

On Fri, Jan 23, 2026 at 07:05:00PM +0530, Mohd Ayaan Anwar wrote:
> 4. Switching from 1G to 2.5G - similar issues + a NULL pointer
> dereference. I am checking on the reason for it.

For the NULL pointer dereference, this is a bit weird, and may help to
point towards the issue.

> 	[ 1235.996004] qcom-ethqos 23040000.ethernet eth1: phy link down 2500base-x/Unknown/Unknown/none/off/nolpi
> 	[ 1240.517716] qcom-ethqos 23040000.ethernet eth1: phy link up 2500base-x/2.5Gbps/Full/none/off/nolpi
> 	[ 1240.529470] qcom-ethqos 23040000.ethernet eth1: major config, requested phy/2500base-x
> 	[ 1240.537642] qcom-ethqos 23040000.ethernet eth1: interface 2500base-x inband modes: pcs=00 phy=00
> 	[ 1240.546702] qcom-ethqos 23040000.ethernet eth1: major config, active phy/outband/2500base-x
> 	[ 1240.555441] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000010

> 	[ 1240.880168] Code: d63f0020 f9400e60 b4000040 f900081f (f9000ad3)

This code line disassembles to:

   0:   d63f0020        blr     x1
   4:   f9400e60        ldr     x0, [x19, #24]
   8:   b4000040        cbz     x0, 10 <.text+0x10>
   c:   f900081f        str     xzr, [x0, #16]
  10:   f9000ad3        str     x19, [x22, #16]

which, after comparing with my disassembly, the blr x1 is the call to
pcs_disable() inside phylink_pcs_disable() in this code:

        if (pcs_changed) {
                phylink_pcs_disable(pl->pcs);

                if (pl->pcs)
                        pl->pcs->phylink = NULL;

                pcs->phylink = pl;

and the failing store is the one for that last line of C code - in
other words, pcs = NULL.

This means that mac_select_pcs() returned NULL when being asked
"which PCS should be used for 2500base-X" ?

This suggests that the SerDes detection of support for 2500BASE-X
isn't working, meaning that stmmac_mac_select_pcs() ends up returning
NULL, rather than &priv->integrated_pcs->pcs.

That would only happen if:

                /* Only allow 2500Base-X if the SerDes has support. */
                ret = dwmac_serdes_validate(priv, PHY_INTERFACE_MODE_2500BASEX);
                if (ret == 0)
                        __set_bit(PHY_INTERFACE_MODE_2500BASEX,
                                  spcs->pcs.supported_interfaces);

fails, meaning we don't set that interface mode for the PCS.
dwmac_serdes_validate() calls phy_validate() for PHY_MODE_ETHERNET
with the PHY interface mode as the sub mode.

Patch 3 adds the required methods to phy-qcom-sgmii-eth.c to allow
phy_validate() to indicate whether this is supported or not:

        .validate       = qcom_dwmac_sgmii_phy_validate,

and its implementation is:

        int ret = qcom_dwmac_sgmii_phy_speed(mode, submode);

        return ret < 0 ? ret : 0;

where qcom_dwmac_sgmii_phy_speed() is:

        if (mode != PHY_MODE_ETHERNET)
                return -EINVAL;

        if (submode == PHY_INTERFACE_MODE_SGMII ||
            submode == PHY_INTERFACE_MODE_1000BASEX)
                return SPEED_1000;

        if (submode == PHY_INTERFACE_MODE_2500BASEX)
                return SPEED_2500;

        return -EINVAL;

So, this should be returning a positive integer (SPEED_2500), which
should cause phy_validate(serdes, PHY_MODE_ETHERNET,
PHY_INTERFACE_MODE_2500BASEX, NULL) to return success (zero). That
should result in PHY_INTERFACE_MODE_2500BASEX being set in
spcs->pcs.supported_interfaces, and thus &priv->integrated_pcs->pcs
being returned for PHY_INTERFACE_MODE_2500BASEX.

Is the particular hardware you're running this oopsing test on not
using a SerDes PHY? If that's the case, how does it switch between
2.5Gbps and 1Gbps data rate on the SerDes?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
