Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AF4EBEED09
	for <lists+linux-stm32@lfdr.de>; Sun, 19 Oct 2025 23:13:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B1A04C57B73;
	Sun, 19 Oct 2025 21:13:22 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0758FC5660C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 19 Oct 2025 21:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eenAxMjIeldA+zxHFfckTsl9LnonghykutSollA6fAQ=; b=DDWPScIPLCw0DfEas9sSnrqwnl
 924rKv9Y9u9qfoZfas7/Qr6FGRpBUxS8BnyqKUFxCoUBMOkOonczyDrjqwiCB5Pb7araz8LK81dnf
 FI3wZOhObn3NQBuReVlAfSSLuXoFgeOHOjX1wBwyc4YWhT5G5oJeGESzQq8EDq1kC/CERg0rqqSXd
 Dc8MmjXY7lztAYxEDIWIEXa+ydtzMt0vpvDF+Aq3m4EYZPcyTuyZrcHxDMg1JdOaUqhrcWWLPMc28
 CY4e5PkiqYHcPvlnGh5LhOcNRkETqSFJUF9tFEhdVZlakgKKv8mP6TLEhRwycx/zLuxhvhUZMy5Og
 teXOzw5A==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:38750)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <linux@armlinux.org.uk>) id 1vAahy-000000001Ws-1Xwg;
 Sun, 19 Oct 2025 22:12:54 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1vAPeu-0000000068f-3P1z; Sun, 19 Oct 2025 10:25:00 +0100
Date: Sun, 19 Oct 2025 10:25:00 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Message-ID: <aPSubO4tJjN_ns-t@shell.armlinux.org.uk>
References: <20251017011802.523140-1-inochiama@gmail.com>
 <34fcc4cd-cd3d-418a-8d06-7426d2514dee@lunn.ch>
 <i5prc7y4fxt3krghgvs7buyfkwwulxnsc2oagbwdjx4tbqjqls@fx4nkkyz6tdt>
 <c16e53f9-f506-41e8-b3c6-cc3bdb1843e1@lunn.ch>
 <aPP9cjzwihca-h6C@shell.armlinux.org.uk>
 <370d13b7-bba8-449d-9050-e0719d20b57c@lunn.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <370d13b7-bba8-449d-9050-e0719d20b57c@lunn.ch>
Cc: Vivian Wang <wangruikang@iscas.ac.cn>, linux-kernel@vger.kernel.org,
 Icenowy Zheng <uwu@icenowy.me>, Inochi Amaoto <inochiama@gmail.com>,
 Chen Wang <unicorn_wang@outlook.com>, Longbin Li <looong.bin@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Yixun Lan <dlan@gentoo.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 netdev@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Han Gao <rabenda.cn@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, sophgo@lists.linux.dev,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Yao Zi <ziyao@disroot.org>
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: dwmac-sophgo: Add phy
	interface filter
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

On Sun, Oct 19, 2025 at 02:04:02AM +0200, Andrew Lunn wrote:
> > "rgmii-id" doesn't mean "there is a delay _somewhere_ in the system".
> > It's supposed to mean that the PHY should add delays on both tx and
> > rx paths.
> 
> When passed to the PHY it means that.
> 
> However, DT describes the hardware, the PCB. "rgmii-id" means the PCB
> does not provide the delays. So the MAC/PHY combination needs to add
> the delays. We normally have the PHY provide the delays, so the
> phy-mode is normally passed straight to the PHY. However, if the MAC
> is adding a delay, which it is in this case, in one direction and
> cannot be turned off, the value passed to the PHY needs to reflect
> this, to avoid double delays.
> 
> And because the MAC delay cannot be turned off, it means there are PCB
> designs which don't work, double delays. So it would be nice not to
> list them in the binding.

Well, I find this confusing. I'd suggest there needs to be common code
to deal with it so we can stop thinking about it, and just push everyone
towards using the common code.

phy_interface_t phy_fix_phy_mode_for_mac_delays(phy_interface_t interface,
						bool mac_txid, bool mac_rxid)
{
	if (!phy_interface_mode_is_rgmii(interface))
		return interface;

	if (mac_txid && mac_rxid) {
		if (interface == PHY_INTERFACE_MODE_RGMII_ID)
			return PHY_INTERFACE_MODE_RGMII;
		return PHY_INTERFACE_MODE_NA;
	}

	if (mac_txid) {
		if (interface == PHY_INTERFACE_MODE_RGMII_ID)
			return PHY_INTERFACE_MODE_RGMII_RXID;
		if (interface == PHY_INTERFACE_MODE_RGMII_TXID)
			return PHY_INTERFACE_MODE_RGMII;
		return PHY_INTERFACE_MODE_NA;
	}

	if (mac_rxid) {
		if (interface == PHY_INTERFACE_MODE_RGMII_ID)
			return PHY_INTERFACE_MODE_RGMII_TXID;
		if (interface == PHY_INTERFACE_MODE_RGMII_RXID)
			return PHY_INTERFACE_MODE_RGMII;
		return PHY_INTERFACE_MODE_NA;
	}

	return interface;
}

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
