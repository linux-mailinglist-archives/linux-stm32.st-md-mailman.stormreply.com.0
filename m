Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D0C948EA80
	for <lists+linux-stm32@lfdr.de>; Fri, 14 Jan 2022 14:20:30 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0AAA3C5F1F4;
	Fri, 14 Jan 2022 13:20:30 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [185.16.172.187])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B3909C5E2AF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Jan 2022 13:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=rWZLer/iLNWHxUeBPp4gf/3AhfEUJd6bEpSN2CeHfZQ=; b=qUoxmfyQiBP1i+i1+kkftR2pR9
 KcaTxqvAnHzmipxu6FVKzpKw1AhMQauwsg4PEC87+YzmXanJ7MVFkP+Nt/KDkQKNvIvEPygZHbZBR
 iQmrqZKw6IPPU1WBPAi8V3Of+7uJ/AomEODzfQIHg3ImI1iIR3Fd4SlEot4drtwZjgxc=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1n8MV7-001Pgy-CB; Fri, 14 Jan 2022 14:20:17 +0100
Date: Fri, 14 Jan 2022 14:20:17 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Kai-Heng Feng <kai.heng.feng@canonical.com>
Message-ID: <YeF4kbsqag+kZ7ji@lunn.ch>
References: <20220114040755.1314349-1-kai.heng.feng@canonical.com>
 <20220114040755.1314349-2-kai.heng.feng@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220114040755.1314349-2-kai.heng.feng@canonical.com>
Cc: Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, alexandre.torgue@foss.st.com,
 Russell King <linux@armlinux.org.uk>, joabreu@synopsys.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 peppe.cavallaro@st.com, Ivan Bornyakov <i.bornyakov@metrotek.ru>,
 Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH 2/2] stmmac: intel: Honor phy LED set by
 system firmware on a Dell hardware
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

>  static void marvell_config_led(struct phy_device *phydev)
>  {
> -	u16 def_config;
> +	struct marvell_priv *priv = phydev->priv;
>  	int err;
>  
> -	switch (MARVELL_PHY_FAMILY_ID(phydev->phy_id)) {
> -	/* Default PHY LED config: LED[0] .. Link, LED[1] .. Activity */
> -	case MARVELL_PHY_FAMILY_ID(MARVELL_PHY_ID_88E1121R):
> -	case MARVELL_PHY_FAMILY_ID(MARVELL_PHY_ID_88E1318S):
> -		def_config = MII_88E1121_PHY_LED_DEF;
> -		break;
> -	/* Default PHY LED config:
> -	 * LED[0] .. 1000Mbps Link
> -	 * LED[1] .. 100Mbps Link
> -	 * LED[2] .. Blink, Activity
> -	 */
> -	case MARVELL_PHY_FAMILY_ID(MARVELL_PHY_ID_88E1510):
> -		if (phydev->dev_flags & MARVELL_PHY_LED0_LINK_LED1_ACTIVE)
> -			def_config = MII_88E1510_PHY_LED0_LINK_LED1_ACTIVE;
> -		else
> -			def_config = MII_88E1510_PHY_LED_DEF;
> -		break;
> -	default:
> +	if (priv->led_def_config == -1)
>  		return;
> +
> +	if (priv->led_def_config)
> +		goto write;

Really?

Please restructure this code. Take it apart into helpers. You need:

A function to set the actual LED configuration.
A function to decide what, if any, configuration to set
A function to store the current configuration on suspend.
A function to restore the current configuration on resume.

Lots of little functions will make it much easier to understand, and
avoid 1980s BASIC style.

I'm also surprised you need to deal with suspend/resume. Why does the
BIOS not set the LED mode on resume, same as it does on power up?

      Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
