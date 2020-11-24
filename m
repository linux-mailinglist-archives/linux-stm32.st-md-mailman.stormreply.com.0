Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 86D432C2974
	for <lists+linux-stm32@lfdr.de>; Tue, 24 Nov 2020 15:27:20 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4DAB1C56631;
	Tue, 24 Nov 2020 14:27:20 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E6191C5662F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Nov 2020 14:27:18 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <a.fatoum@pengutronix.de>)
 id 1khZHm-00012a-Hb; Tue, 24 Nov 2020 15:27:14 +0100
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
To: Antonio Borneo <antonio.borneo@st.com>, Jakub Kicinski <kuba@kernel.org>
References: <20191007154306.95827-1-antonio.borneo@st.com>
 <20191007154306.95827-5-antonio.borneo@st.com>
 <20191009152618.33b45c2d@cakuba.netronome.com>
 <42960ede-9355-1277-9a6f-4eac3c22365c@pengutronix.de>
Message-ID: <6d314a48-8d01-5a31-63de-8159e68d665e@pengutronix.de>
Date: Tue, 24 Nov 2020 15:27:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <42960ede-9355-1277-9a6f-4eac3c22365c@pengutronix.de>
Content-Language: en-US
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, has <has@pengutronix.de>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>, Jose Abreu <joabreu@synopsys.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: add flexible PPS to dwmac
	4.10a
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

To += Jakub's new address

On 24.11.20 15:15, Ahmad Fatoum wrote:
> Hello Jakub,
> 
> On 10.10.19 00:26, Jakub Kicinski wrote:
>> On Mon, 7 Oct 2019 17:43:06 +0200, Antonio Borneo wrote:
>>> All the registers and the functionalities used in the callback
>>> dwmac5_flex_pps_config() are common between dwmac 4.10a [1] and
>>> 5.00a [2].
>>>
>>> Reuse the same callback for dwmac 4.10a too.
>>>
>>> Tested on STM32MP15x, based on dwmac 4.10a.
>>>
>>> [1] DWC Ethernet QoS Databook 4.10a October 2014
>>> [2] DWC Ethernet QoS Databook 5.00a September 2017
>>>
>>> Signed-off-by: Antonio Borneo <antonio.borneo@st.com>
>>
>> Applied to net-next.
> 
> This patch seems to have been fuzzily applied at the wrong location.
> The diff describes extension of dwmac 4.10a and so does the @@ line:
> 
>   @@ -864,6 +864,7 @@ const struct stmmac_ops dwmac410_ops = {
> 
> The patch was applied mainline as 757926247836 ("net: stmmac: add
> flexible PPS to dwmac 4.10a"), but it extends dwmac4_ops instead:
> 
>   @@ -938,6 +938,7 @@ const struct stmmac_ops dwmac4_ops = {
> 
> I don't know if dwmac4 actually supports FlexPPS, so I think it's
> better to be on the safe side and revert 757926247836 and add the
> change for the correct variant.
> 
> Cheers,
> Ahmad
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
