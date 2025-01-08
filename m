Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B02BA054AC
	for <lists+linux-stm32@lfdr.de>; Wed,  8 Jan 2025 08:37:12 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1EF89C78026;
	Wed,  8 Jan 2025 07:37:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4B400C78025
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  8 Jan 2025 07:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736321832; x=1767857832;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=3u6bfLayhG54+WPRNwaf/qn6txkoyZ4B6wiWkKksZco=;
 b=CfCBkeLgpR7oBWSV5pYfe8QquDNLs9hSopxTh3wn1Wgv5S6IM+9lHY0l
 l+jnW4KOjyfgzRhmdOBILG99MfR/VH1MgBU1Rf9lLx2pFjByrEtWiDWdz
 Ksl0KGRfqv2mF8xf8LQZB70qSM1FRRJwyKJVWix9gq+RxC2e4anqJMOoL
 c5/pwCrY9o5Nxr5qExhd4p/4ReOzZVLeo1rDsNqmkE/6fUbH2dCs9ccdM
 zTT5X7YpUoGJH6Dgg7sLZ3X6HHUkIOnCAi7GZwhEc3W/ts3LQNyuW3YmZ
 K79IOyjhx6vPMfahokGB8ePXHpkKHliHSbRsD2ZWi39hex40O4VTpLduL g==;
X-CSE-ConnectionGUID: hOfD6f7DRzqvspry1sz4fg==
X-CSE-MsgGUID: tGRhpvXAQNiRZK0KhMJpiQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="54081465"
X-IronPort-AV: E=Sophos;i="6.12,297,1728975600"; d="scan'208";a="54081465"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2025 23:37:03 -0800
X-CSE-ConnectionGUID: tfkFk3DfQlG2R76nsCMEHA==
X-CSE-MsgGUID: I5uzctEQSUqQrc844McEXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,297,1728975600"; d="scan'208";a="103225655"
Received: from unknown (HELO [10.107.18.17]) ([10.107.18.17])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2025 23:36:59 -0800
Message-ID: <66b95153-cb12-494d-851c-093a0006547f@linux.intel.com>
Date: Wed, 8 Jan 2025 15:36:57 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
References: <Z31V9O8SATRbu2L3@shell.armlinux.org.uk>
 <E1tVCRZ-007Y35-9N@rmk-PC.armlinux.org.uk>
Content-Language: en-US
From: Choong Yong Liang <yong.liang.choong@linux.intel.com>
In-Reply-To: <E1tVCRZ-007Y35-9N@rmk-PC.armlinux.org.uk>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>



On 8/1/2025 12:28 am, Russell King (Oracle) wrote:
> When stmmac_ethtool_op_get_eee() is called, stmmac sets the tx_lpi_timer
> and tx_lpi_enabled members, and then calls into phylink and thus phylib.
> phylib overwrites these members.
> 
> phylib will also cause a link down/link up transition when settings
> that impact the MAC have been changed.
> 
> Convert stmmac to use the tx_lpi_timer setting in struct phy_device,
> updating priv->tx_lpi_timer each time when the link comes up, rather
> than trying to maintain this user setting itself. We initialise the
> phylib tx_lpi_timer setting by doing a get_ee-modify-set_eee sequence
> with the last known priv->tx_lpi_timer value. In order for this to work
> correctly, we also need this member to be initialised earlier.
> 
> As stmmac_eee_init() is no longer called outside of stmmac_main.c, make
> it static.
> 
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Hi Russell,

I have completed the sanity test on the EEE changes to the stmmac driver.

It seems that most of the changes are acceptable with respect to EEE behavior.

However, I noticed that this part of the code requires a minor change to 
fix the logic:

	/* Configure phylib's copy of the LPI timer */
	if (phylink_ethtool_get_eee(priv->phylink, &eee) == 0) {
		eee.tx_lpi_timer = priv->tx_lpi_timer;
		phylink_ethtool_set_eee(priv->phylink, &eee);
	}

Otherwise, the "tx_lpi_timer" will not be set correctly during the initial 
state.

Tested-by: Choong Yong Liang <yong.liang.choong@linux.intel.com>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
