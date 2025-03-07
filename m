Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B463A5696B
	for <lists+linux-stm32@lfdr.de>; Fri,  7 Mar 2025 14:52:29 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A42C1C78F95;
	Fri,  7 Mar 2025 13:52:28 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D6835C57194
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  7 Mar 2025 13:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=Jkx3f0giLdjTBdslQHfz5NRis+vzSJwwRoYIVdv9lsw=; b=e8cnS3UN7dYibdwZ10jktHczPl
 15tNwuQTBmqZxPOFXUGY3q8Duy5ddpk38Qib02oSsht9MK2oX5AptZAgwEA9B1jg+uY+ba3jmmfRV
 Iwy2s/rrSlUreWt0RCJ3OIDtvrPV2LbkSoO8BkpiBBk6Qx5P8pFRE/JF7Ku1h9vodFnI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1tqY7Z-0039Yt-LO; Fri, 07 Mar 2025 14:52:13 +0100
Date: Fri, 7 Mar 2025 14:52:13 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Jonas Karlman <jonas@kwiboo.se>
Message-ID: <f5f397bb-476a-429a-9d1e-1c1a9beb8f89@lunn.ch>
References: <20250306203858.1677595-1-jonas@kwiboo.se>
 <20250306203858.1677595-2-jonas@kwiboo.se>
 <d6b15dc2-f6b2-4703-a4da-07618eaed4db@lunn.ch>
 <624f2474-9a39-46a3-a6e5-f9966471bf3d@kwiboo.se>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <624f2474-9a39-46a3-a6e5-f9966471bf3d@kwiboo.se>
Cc: Wadim Egorov <w.egorov@phytec.de>, Heiko Stuebner <heiko@sntech.de>,
 linux-rockchip@lists.infradead.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S . Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/3] net: stmmac: dwmac-rk: Use
 DELAY_ENABLE macro for RK3328
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

On Fri, Mar 07, 2025 at 12:28:42AM +0100, Jonas Karlman wrote:
> Hi Andrew,
> 
> On 2025-03-06 23:25, Andrew Lunn wrote:
> > On Thu, Mar 06, 2025 at 08:38:52PM +0000, Jonas Karlman wrote:
> >> Support for Rockchip RK3328 GMAC and addition of the DELAY_ENABLE macro
> >> was merged in the same merge window. This resulted in RK3328 not being
> >> converted to use the new DELAY_ENABLE macro.
> >>
> >> Change to use the DELAY_ENABLE macro to help disable MAC delay when
> >> RGMII_ID/RXID/TXID is used.
> >>
> >> Fixes: eaf70ad14cbb ("net: stmmac: dwmac-rk: Add handling for RGMII_ID/RXID/TXID")
> > 
> > Please add a description of the broken behaviour. How would i know i
> > need this fix? What would i see?
> 
> Based on my layman testing I have not seen any real broken behaviour
> with current enablement of a zero rx/tx MAC delay for RGMII_ID/RXID/TXID.
> 
> The driver ops is called with a rx/tx_delay=0 for RGMII_ID/RXID/TXID
> modes, what the MAC does with enable=true and rx/tx_delay=0 is unclear
> to me.
> 
> > 
> > We also need to be careful with backwards compatibility. Is there the
> > potential for double bugs cancelling each other out? A board which has
> > the wrong phy-mode in DT, but because of this bug, the wrong register
> > is written and it actually works because of reset defaults?
> 
> To my knowledge this should have very limited effect, however I am no
> network expert and after doing very basic testing on several different
> rk3328/rk3566/rk3568/rk3588 I could not see any real affect with/without
> this change.
> 
> The use of Fixes-tag was more to have a reference to the commit that
> first should have used the DELAY_ENABLE macro.

https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html

  It must either fix a real bug that bothers people or just add a device ID.

It does not sound like this meets the stable requirements. Plus there
is the potential for breakage. So i suggest you drop the Fixes: tag
and we merge this via net-next.

Please take a look at:

https://www.kernel.org/doc/html/latest/process/maintainer-netdev.html

    Andrew

---
pw-bot: cr
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
