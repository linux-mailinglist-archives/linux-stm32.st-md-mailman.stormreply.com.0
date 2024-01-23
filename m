Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 22D33839D1B
	for <lists+linux-stm32@lfdr.de>; Wed, 24 Jan 2024 00:15:46 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C6C78C6DD6D;
	Tue, 23 Jan 2024 23:15:45 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 25D9DC65E4F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 23 Jan 2024 23:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=7yX5+XCrARod+VsoOp+tq6jnm8t8QU2YLMp+hsOIWWk=; b=d3OhwnX3Vuxy17BtXJOMDM36JV
 ooC8IcgtZCGs4yIn/8R2LlAh2pKkLVmTZsRqKetcoqJG3C109ilqxUjwDIQIY0jq9shUqNXbIXS86
 P/uLuyzEC9ryf7SUfoR71L7HyQZ5b6vhFmTypOlMLhaDQ/zvfn8RZUpVZ7eatF98x2To=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1rSPzV-005t58-FR; Wed, 24 Jan 2024 00:15:37 +0100
Date: Wed, 24 Jan 2024 00:15:37 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Ziyang Huang <hzyitc@outlook.com>
Message-ID: <5ce729ad-549a-48f6-b261-ee8cb91e6474@lunn.ch>
References: <TYZPR01MB55563BD6A2B78402E4BB44D4C9762@TYZPR01MB5556.apcprd01.prod.exchangelabs.com>
 <TYZPR01MB5556D5568546D6DA4313209EC9762@TYZPR01MB5556.apcprd01.prod.exchangelabs.com>
 <2c6c0d72-5d4e-4ec4-beb6-d30852108a67@lunn.ch>
 <TYZPR01MB5556D035D9A13962844BB553C9752@TYZPR01MB5556.apcprd01.prod.exchangelabs.com>
 <e1fd863a-6725-4180-8ad3-faeb44c09238@lunn.ch>
 <TYZPR01MB55567CE79D7F08C738A81683C9742@TYZPR01MB5556.apcprd01.prod.exchangelabs.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <TYZPR01MB55567CE79D7F08C738A81683C9742@TYZPR01MB5556.apcprd01.prod.exchangelabs.com>
Cc: mcoquelin.stm32@gmail.com, netdev@vger.kernel.org, richardcochran@gmail.com,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 p.zabel@pengutronix.de, matthias.bgg@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com
Subject: Re: [Linux-stm32] [PATCH 1/8] net: phy: Introduce Qualcomm IPQ5018
 internal PHY driver
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

> After rechecking the vendor code, you are right. The only special thing of
> this device is that it's a combined device of UNIPHY and at803x general phy.
> So it needs the UNIPHY initialization sequence. But for the PHY part, it's
> almost same as others, just has some special registers. I will merge it into
> at803x driver.

The UNIPHY is a separate driver, its a generic PHY driver? Can we keep
them separate for this internal PHY as well?

The initialisation sequence is what is going to be most 'interesting'
here. How UNIPHY, this PHY and the GCC all come together to make it
work. But for the moment, i think its best the PHY driver controls its
own clock input and reset, using standard Linux APIs, once the driver
has probed via compatible IDs.

       Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
