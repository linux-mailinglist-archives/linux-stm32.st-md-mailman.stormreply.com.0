Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1022544AF51
	for <lists+linux-stm32@lfdr.de>; Tue,  9 Nov 2021 15:19:42 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BF9B9C5EC6F;
	Tue,  9 Nov 2021 14:19:41 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7A5D7C5EC6D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Nov 2021 14:19:40 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[127.0.0.1])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <a.fatoum@pengutronix.de>)
 id 1mkRyH-0003AW-2g; Tue, 09 Nov 2021 15:19:33 +0100
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
To: Vladimir Oltean <vladimir.oltean@nxp.com>,
 Kurt Kanzenbach <kurt.kanzenbach@linutronix.de>,
 Holger Assmann <h.assmann@pengutronix.de>
References: <20211108202854.1740995-1-vladimir.oltean@nxp.com>
 <87bl2t3fkq.fsf@kurt> <20211109103504.ahl2djymnevsbhoj@skbuf>
Message-ID: <6bf6db8b-4717-71fe-b6de-9f6e12202dad@pengutronix.de>
Date: Tue, 9 Nov 2021 15:19:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211109103504.ahl2djymnevsbhoj@skbuf>
Content-Language: en-US
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: Yannick Vignon <yannick.vignon@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 "David S. Miller" <davem@davemloft.net>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 Xiaoliang Yang <xiaoliang.yang_1@nxp.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH net] net: stmmac: allow a tc-taprio
 base-time of zero
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

Hello Vladimir, Kurt,

On 09.11.21 11:35, Vladimir Oltean wrote:
> On Tue, Nov 09, 2021 at 09:20:53AM +0100, Kurt Kanzenbach wrote:
>> Hi Vladimir,
>>
>> On Mon Nov 08 2021, Vladimir Oltean wrote:
>>> Commit fe28c53ed71d ("net: stmmac: fix taprio configuration when
>>> base_time is in the past") allowed some base time values in the past,
>>> but apparently not all, the base-time value of 0 (Jan 1st 1970) is still
>>> explicitly denied by the driver.
>>>
>>> Remove the bogus check.
>>>
>>> Fixes: b60189e0392f ("net: stmmac: Integrate EST with TAPRIO scheduler API")
>>> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
>>
>> I've experienced the same problem and wanted to send a patch for
>> it. Thanks!
>>
>> Reviewed-by: Kurt Kanzenbach <kurt@linutronix.de>
> 
> Cool. So you had that patch queued up? What other stmmac patches do you
> have queued up? :) Do you have a fix for the driver setting the PTP time
> every time when SIOCSHWTSTAMP is called? This breaks the UTC-to-TAI
> offset established by phc2sys and it takes a few seconds to readjust,
> which is very annoying.

Sounds like the same issue in:
https://lore.kernel.org/netdev/20201216113239.2980816-1-h.assmann@pengutronix.de/

Cheers,
Ahmad

> _______________________________________________
> Linux-stm32 mailing list
> Linux-stm32@st-md-mailman.stormreply.com
> https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
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
