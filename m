Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 374DDC0C4DE
	for <lists+linux-stm32@lfdr.de>; Mon, 27 Oct 2025 09:30:10 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EE828C60476;
	Mon, 27 Oct 2025 08:30:02 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D6995C57163
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Oct 2025 18:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=tvR/JOCDykbUtNBkJ2YheNXEBp8e8ja99yZKcJe41jk=; b=Rn166uEXHRAoxorCRcipzvbU/Y
 9LYEOK9yuC6IL2lh2+2j0hi6aIl1fJxE2sNKydc1xihXpchLrcP9i5vDopTNPtE1+PhuYWignc4PL
 /6YlFTFIs3+FkMKTw723y1lHHMx/rp+8d1Cig0WScb12/aNttg/tNHV2+hjX5GnOcfbo=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1vAuyu-00BY4z-B8; Mon, 20 Oct 2025 20:51:44 +0200
Date: Mon, 20 Oct 2025 20:51:44 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Inochi Amaoto <inochiama@gmail.com>
Message-ID: <8da7450f-ef1a-4d8f-9081-a31585e2da19@lunn.ch>
References: <20251020095500.1330057-1-inochiama@gmail.com>
 <20251020095500.1330057-3-inochiama@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251020095500.1330057-3-inochiama@gmail.com>
X-Mailman-Approved-At: Mon, 27 Oct 2025 08:30:00 +0000
Cc: Longbin Li <looong.bin@gmail.com>, Eric Dumazet <edumazet@google.com>,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh@kernel.org>,
 Icenowy Zheng <uwu@icenowy.me>, Vivian Wang <wangruikang@iscas.ac.cn>,
 Chen Wang <unicorn_wang@outlook.com>, Russell King <linux@armlinux.org.uk>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Yao Zi <ziyao@disroot.org>,
 "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>, sophgo@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, Yixun Lan <dlan@gentoo.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Han Gao <rabenda.cn@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 "David S. Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH v2 2/3] net: phy: Add helper for fixing
 RGMII PHY mode based on internal mac delay
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

On Mon, Oct 20, 2025 at 05:54:58PM +0800, Inochi Amaoto wrote:
> The "phy-mode" property of devicetree indicates whether the PCB has
> delay now, which means the mac needs to modify the PHY mode based
> on whether there is an internal delay in the mac.
> 
> This modification is similar for many ethernet drivers. To simplify
> code, define the helper phy_fix_phy_mode_for_mac_delays(speed, mac_txid,
> mac_rxid) to fix PHY mode based on whether mac adds internal delay.
> 
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> ---
>  drivers/net/phy/phy-core.c | 43 ++++++++++++++++++++++++++++++++++++++
>  include/linux/phy.h        |  3 +++
>  2 files changed, 46 insertions(+)
> 
> diff --git a/drivers/net/phy/phy-core.c b/drivers/net/phy/phy-core.c
> index 605ca20ae192..4f258fb409da 100644
> --- a/drivers/net/phy/phy-core.c
> +++ b/drivers/net/phy/phy-core.c
> @@ -101,6 +101,49 @@ const char *phy_rate_matching_to_str(int rate_matching)
>  }
>  EXPORT_SYMBOL_GPL(phy_rate_matching_to_str);
> 
> +/**
> + * phy_fix_phy_mode_for_mac_delays - Convenience function for fixing PHY
> + * mode based on whether mac adds internal delay
> + *
> + * @interface: The current interface mode of the port
> + * @mac_txid: True if the mac adds internal tx delay
> + * @mac_rxid: True if the mac adds internal rx delay
> + *
> + * Return fixed PHY mode, or PHY_INTERFACE_MODE_NA if the interface can
> + * not apply the internal delay
> + */

I think a helper like this is a good idea. But there are a couple of
things i don't like about this implementation.

I don't like returning PHY_INTERFACE_MODE_NA on error. I would prefer
-EINVAL.  of_get_phy_mode() passed a phy_interface_t *, and returns an
errno. The same would be good here.

I find:

phy_fix_phy_mode_for_mac_delays(interface, true, false)

hard to read. You cannot see what these true/false mean. Which is Rx
and which is Tx?

Rather than true false, how about passing an
PHY_INTERFACE_MODE_RGMII_* values?

PHY_INTERFACE_MODE_RGMII_ID would indicate the MAC is doing both
delays.  PHY_INTERFACE_MODE_RGMII_RXID the MAC is implementing the RX
delay? I'm open to other ideas here.

	Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
