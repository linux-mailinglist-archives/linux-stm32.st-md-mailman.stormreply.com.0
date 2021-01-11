Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CFBD02F0DA7
	for <lists+linux-stm32@lfdr.de>; Mon, 11 Jan 2021 09:13:24 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7804AC5660F;
	Mon, 11 Jan 2021 08:13:24 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BF237C32EA7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Jan 2021 08:13:22 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[127.0.0.1])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <h.assmann@pengutronix.de>)
 id 1kysKG-0002Gq-99; Mon, 11 Jan 2021 09:13:20 +0100
To: Jakub Kicinski <kuba@kernel.org>
References: <20201216113239.2980816-1-h.assmann@pengutronix.de>
 <20201216171334.1e36fbff@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
From: Holger Assmann <h.assmann@pengutronix.de>
Message-ID: <efb0fe5e-36af-9b36-98d2-e5f006c749d9@pengutronix.de>
Date: Mon, 11 Jan 2021 09:13:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201216171334.1e36fbff@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
Content-Language: en-US
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: h.assmann@pengutronix.de
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On Thu, 17.12.20 um 02:13 Jakub Kicinski wrote:
> 
> Thanks for the patch, minor nits below.

Thanks for the Feedback! I will work it in for my v2.

>> +
>> +	if (!(priv->dma_cap.time_stamp || priv->dma_cap.atime_stamp))
> 
> !a && !b reads better IMHO

We've chosen this variant because it is already used this way in
stmmac_main (e.g. in stmmac_hwtstamp_set(), stmmac_hwtstamp_get(), or
stmmac_validate()).

>> @@ -5290,8 +5330,7 @@ int stmmac_resume(struct device *dev)
>>   		/* enable the clk previously disabled */
>>   		clk_prepare_enable(priv->plat->stmmac_clk);
>>   		clk_prepare_enable(priv->plat->pclk);
>> -		if (priv->plat->clk_ptp_ref)
>> -			clk_prepare_enable(priv->plat->clk_ptp_ref);
>> +		stmmac_init_hwtstamp(priv);
> 
> This was optional, now you always init?

This was not intended. Will be fixed in v2 to be optional again.

Regards,
Holger
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
