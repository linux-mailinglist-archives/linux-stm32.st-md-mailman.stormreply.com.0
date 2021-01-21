Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E031A2FED08
	for <lists+linux-stm32@lfdr.de>; Thu, 21 Jan 2021 15:39:30 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 95F83C3FADC;
	Thu, 21 Jan 2021 14:39:30 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BBD3AC3FADA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Jan 2021 14:39:28 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <a.fatoum@pengutronix.de>)
 id 1l2b7Q-0003ca-0u; Thu, 21 Jan 2021 15:39:28 +0100
To: Sasha Levin <sashal@kernel.org>, Jakub Kicinski <kuba@kernel.org>
References: <20210120012602.769683-1-sashal@kernel.org>
 <20210120012602.769683-28-sashal@kernel.org>
 <20210119220815.039ac330@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <20210120142659.GC4035784@sasha-vm>
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Message-ID: <7564ebe1-20e9-36d5-11a7-bcfe27f70987@pengutronix.de>
Date: Thu, 21 Jan 2021 15:39:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210120142659.GC4035784@sasha-vm>
Content-Language: en-US
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, David Wu <david.wu@rock-chips.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH AUTOSEL 5.10 28/45] net: stmmac: Fixed mtu
 channged by cache aligned
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

Hello Sasha,

On 20.01.21 15:26, Sasha Levin wrote:
> On Tue, Jan 19, 2021 at 10:08:15PM -0800, Jakub Kicinski wrote:
>> On Tue, 19 Jan 2021 20:25:45 -0500 Sasha Levin wrote:
>>> From: David Wu <david.wu@rock-chips.com>
>>>
>>> [ Upstream commit 5b55299eed78538cc4746e50ee97103a1643249c ]
>>>
>>> Since the original mtu is not used when the mtu is updated,
>>> the mtu is aligned with cache, this will get an incorrect.
>>> For example, if you want to configure the mtu to be 1500,
>>> but mtu 1536 is configured in fact.
>>>
>>> Fixed: eaf4fac478077 ("net: stmmac: Do not accept invalid MTU values")
>>> Signed-off-by: David Wu <david.wu@rock-chips.com>
>>> Link: https://lore.kernel.org/r/20210113034109.27865-1-david.wu@rock-chips.com
>>> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
>>> Signed-off-by: Sasha Levin <sashal@kernel.org>
>>
>> This was applied 6 days ago, I thought you said you wait two weeks.
>> What am I missing?
> 
> The "AUTOSEL" review cycle is an additional hurdle automatically
> selected patches need to clear before being queued up. There are 7 days
> between the day I sent the review for these and the first day I might
> queue them up.

I guess this could benefit from being documented in
Documentation/process/stable-kernel-rules.rst? Or is this documented
elsewhere?

> 
> This mail isn't an indication that the patch has been added to the
> queue, it's just an extra step to give folks time to object.
> 
> If you add up all the days you'll get >14 :)
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
