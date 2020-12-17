Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0017F2DCD97
	for <lists+linux-stm32@lfdr.de>; Thu, 17 Dec 2020 09:25:58 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A2BFDC3089F;
	Thu, 17 Dec 2020 08:25:58 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 30785C36B35
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Dec 2020 08:25:57 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <a.fatoum@pengutronix.de>)
 id 1kpobh-0003su-Ub; Thu, 17 Dec 2020 09:25:53 +0100
To: Jakub Kicinski <kuba@kernel.org>, Holger Assmann <h.assmann@pengutronix.de>
References: <20201216113239.2980816-1-h.assmann@pengutronix.de>
 <20201216171334.1e36fbff@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Message-ID: <ae5371c0-ea53-6885-a25b-b44e9fe0b615@pengutronix.de>
Date: Thu, 17 Dec 2020 09:25:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20201216171334.1e36fbff@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
Content-Language: en-US
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: kernel@pengutronix.de, Jose Abreu <joabreu@synopsys.com>,
 netdev@vger.kernel.org, Richard Cochran <richardcochran@gmail.com>,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Rayagond Kokatanur <rayagond@vayavyalabs.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Michael Olbrich <m.olbrich@pengutronix.de>,
 Jose Abreu <Jose.Abreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/2] net: stmmac: retain PTP-clock at
	hwtstamp_set
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

Hello,

On 17.12.20 02:13, Jakub Kicinski wrote:
>> +			netdev_warn(priv->dev, "HW Timestamping init failed: %pe\n",
>> +					ERR_PTR(ret));
> 
> why convert to ERR_PTR and use %pe and not just %d?

To get a symbolic error name if support is compiled in (note the `e' after %p).

> 
> also continuation misaligned
> 
>> +		} else {
>> +			ret = stmmac_init_ptp(priv);
>> +			if (ret == -EOPNOTSUPP)
>> +				netdev_warn(priv->dev, "PTP not supported by HW\n");
>> +			else if (ret)
>> +				netdev_warn(priv->dev, "PTP init failed\n");
>> +		}
>>  	}
>>  
>>  	priv->eee_tw_timer = STMMAC_DEFAULT_TWT_LS;
>> @@ -5290,8 +5330,7 @@ int stmmac_resume(struct device *dev)
>>  		/* enable the clk previously disabled */
>>  		clk_prepare_enable(priv->plat->stmmac_clk);
>>  		clk_prepare_enable(priv->plat->pclk);
>> -		if (priv->plat->clk_ptp_ref)
>> -			clk_prepare_enable(priv->plat->clk_ptp_ref);
>> +		stmmac_init_hwtstamp(priv);
> 
> This was optional, now you always init?

Indeed, omitting the if condition here will lead to a needless warning on every reset.

Cheers,
Ahmad

> 
>>  		/* reset the phy so that it's ready */
>>  		if (priv->mii)
>>  			stmmac_mdio_reset(priv->mii);
>>
>> base-commit: 3db1a3fa98808aa90f95ec3e0fa2fc7abf28f5c9
> 
> 

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
