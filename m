Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EAFF3515E6
	for <lists+linux-stm32@lfdr.de>; Thu,  1 Apr 2021 17:11:11 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 29F7FC58D5C;
	Thu,  1 Apr 2021 15:11:11 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D35F8C58D58
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  1 Apr 2021 15:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NW9iR6zGvMABtC5sP1r/GglS9DsvmYxxu6+q/ZLVfFY=; b=Gd5OQxSHGkplwdLtJ00KgV6/U
 d9TmtLXaqXV55UHlwIpxZFJGVgUq/sqig6OErVwj1T5Y0dwY/kZWxiqhFfcwjZxQkQwu20ZhtQTNV
 9KRmXM07/v/EP5FtGjKaQwMcPq2aFv7GlYbMop8kgp0bY8HLW9b4KWWFCXVjXWSy0P/fM609FiAtu
 jj4eew3oCzkaJqFojYfmfqvlUg7JpTvd0Pg29miWo0rQDggtehBWJNU0RpOcY494b673y9GLw3PWB
 jW4RLmey/kvNt+9+srpqf7xH4KOgngNjbChjwnQfn0yvKCRBNodHFbmuzWSufsO8yMIgkLfprrmWK
 T1Wc7LBFg==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:52012)
 by pandora.armlinux.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <linux@armlinux.org.uk>)
 id 1lRyy8-0003LM-9t; Thu, 01 Apr 2021 16:10:48 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1lRyy4-00050Q-AM; Thu, 01 Apr 2021 16:10:44 +0100
Date: Thu, 1 Apr 2021 16:10:44 +0100
From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
To: Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>
Message-ID: <20210401151044.GZ1463@shell.armlinux.org.uk>
References: <20210401150152.22444-1-michael.wei.hong.sit@intel.com>
 <20210401150152.22444-2-michael.wei.hong.sit@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210401150152.22444-2-michael.wei.hong.sit@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: andrew@lunn.ch, kim.tatt.chuah@intel.com, fugang.duan@nxp.com,
 alexandre.torgue@st.com, weifeng.voon@intel.com, vee.khee.wong@intel.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, qiangqing.zhang@nxp.com,
 linux-stm32@st-md-mailman.stormreply.com, joabreu@synopsys.com,
 mcoquelin.stm32@gmail.com, kuba@kernel.org, boon.leong.ong@intel.com,
 peppe.cavallaro@st.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org, hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [PATCH net-next 1/2] net: stmmac: enable 2.5Gbps
	link speed
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

On Thu, Apr 01, 2021 at 11:01:51PM +0800, Michael Sit Wei Hong wrote:
> +	/* 2.5G mode only support 2500baseT full duplex only */
> +	if (priv->plat->has_gmac4 && priv->plat->speed_2500_en) {
> +		phylink_set(mac_supported, 2500baseT_Full);
> +		phylink_set(mask, 10baseT_Half);
> +		phylink_set(mask, 10baseT_Full);
> +		phylink_set(mask, 100baseT_Half);
> +		phylink_set(mask, 100baseT_Full);
> +		phylink_set(mask, 1000baseT_Half);
> +		phylink_set(mask, 1000baseT_Full);
> +		phylink_set(mask, 1000baseKX_Full);

Why? This seems at odds to the comment above?

What about 2500baseX_Full ?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
