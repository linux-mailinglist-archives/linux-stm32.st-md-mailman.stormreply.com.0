Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B62FA8356AC
	for <lists+linux-stm32@lfdr.de>; Sun, 21 Jan 2024 17:35:48 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 67096C6B457;
	Sun, 21 Jan 2024 16:35:48 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 42DA7C03FC1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 21 Jan 2024 16:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=+ee0LVJaO5xx5GZobgreq3QpintDB0kzQxoNG6Nuq/Q=; b=CiRXlYfVKNnCf62BxY//FksKhE
 ATDCOxtIR1lSIREWhqcUtHK3cRqyog9XQ4GH772UTukXmojvgCobskeCeXZ5ZcY9fXK9MYVU8G7xW
 8V5HvUAVz2B6iAb9lDZXB8BkOdb4nxFLuGXjeTy9xUMCOjfQ7EoPwCi4LpAxqYcLX6kM=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1rRanN-005f4P-HR; Sun, 21 Jan 2024 17:35:41 +0100
Date: Sun, 21 Jan 2024 17:35:41 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Ziyang Huang <hzyitc@outlook.com>
Message-ID: <9ac4b153-2318-4d69-9771-1b3365104904@lunn.ch>
References: <TYZPR01MB55563BD6A2B78402E4BB44D4C9762@TYZPR01MB5556.apcprd01.prod.exchangelabs.com>
 <TYZPR01MB55568177805D79143E8CF4E2C9762@TYZPR01MB5556.apcprd01.prod.exchangelabs.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <TYZPR01MB55568177805D79143E8CF4E2C9762@TYZPR01MB5556.apcprd01.prod.exchangelabs.com>
Cc: mcoquelin.stm32@gmail.com, netdev@vger.kernel.org, richardcochran@gmail.com,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 p.zabel@pengutronix.de, matthias.bgg@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com
Subject: Re: [Linux-stm32] [PATCH 6/8] net: mdio: ipq4019: support reset
	control
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

On Sun, Jan 21, 2024 at 08:42:35PM +0800, Ziyang Huang wrote:

In this case, you need to document why the MDIO core reset controller
code does not work for you.

You are also missing the device tree binding again.

> @@ -248,6 +254,10 @@ static int ipq4019_mdio_probe(struct platform_device *pdev)
>  	if (IS_ERR(priv->membase))
>  		return PTR_ERR(priv->membase);
>  
> +	priv->rst = devm_reset_control_array_get_optional_exclusive(&pdev->dev);
> +	if (IS_ERR(priv->rst))
> +		return PTR_ERR(priv->rst);

How many resets does this MDIO controller have? Would
devm_reset_control_get_optional_exclusive() be sufficient.


    Andrew

---
pw-bot: cr
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
