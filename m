Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E204AA0579A
	for <lists+linux-stm32@lfdr.de>; Wed,  8 Jan 2025 11:08:03 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8F8D1C78031;
	Wed,  8 Jan 2025 10:08:03 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A55A7C78030
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  8 Jan 2025 10:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IM18OvxnC2Fka89jFAwkpiq2it51EwQpNq/r7/+W1qM=; b=PtfGjMV6PHxFkPsIypAGiLRCK7
 iqSLKC1OGaVkSIc8VVHCRlTTXaizu2k7rcfRIJjTlqFwILbKNa+VgN5x8UW1RNQQToDvD3IKqKYqQ
 UdTuwFuXYn3RncFb9zrzkwGJLE31h4YZKzdi6nDvgJYFZrld1MxZAJe2nDd4rOIxGaCcXK7RINXmc
 I+/+RybMotW6qFPVCbjkW/6c27C9Xj6uo+IxXx7ZHQGOhM69/3PTT+6fJA0oflXXNC0PcM3lVH/h7
 yl4bYMAx9fq62wORkA5tZU8aezNa97S0XYoA4XIByJsA4JNMAwosQooWALZ8SlU9DLvTzM/mgUM/U
 gziQYczw==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:60424)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1tVSyU-0000Lv-2r;
 Wed, 08 Jan 2025 10:07:42 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
 (envelope-from <linux@shell.armlinux.org.uk>) id 1tVSyP-0006Bv-0q;
 Wed, 08 Jan 2025 10:07:37 +0000
Date: Wed, 8 Jan 2025 10:07:37 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Choong Yong Liang <yong.liang.choong@linux.intel.com>
Message-ID: <Z35OaQDLS_i2uL_b@shell.armlinux.org.uk>
References: <Z31V9O8SATRbu2L3@shell.armlinux.org.uk>
 <E1tVCRZ-007Y35-9N@rmk-PC.armlinux.org.uk>
 <66b95153-cb12-494d-851c-093a0006547f@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <66b95153-cb12-494d-851c-093a0006547f@linux.intel.com>
Cc: Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next v3 02/18] net: stmmac: move
 tx_lpi_timer tracking to phylib
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

On Wed, Jan 08, 2025 at 03:36:57PM +0800, Choong Yong Liang wrote:
> I have completed the sanity test on the EEE changes to the stmmac driver.
> 
> It seems that most of the changes are acceptable with respect to EEE behavior.
> 
> However, I noticed that this part of the code requires a minor change to fix
> the logic:
> 
> 	/* Configure phylib's copy of the LPI timer */
> 	if (phylink_ethtool_get_eee(priv->phylink, &eee) == 0) {
> 		eee.tx_lpi_timer = priv->tx_lpi_timer;
> 		phylink_ethtool_set_eee(priv->phylink, &eee);
> 	}
> 
> Otherwise, the "tx_lpi_timer" will not be set correctly during the initial
> state.
> 
> Tested-by: Choong Yong Liang <yong.liang.choong@linux.intel.com>

Thanks for testing. I can't update the series as there has been a power
failure at home, hence the machine that has my git trees on is
inaccessible at the moment.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
