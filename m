Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A78A728F312
	for <lists+linux-stm32@lfdr.de>; Thu, 15 Oct 2020 15:18:57 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5CD1EC3FADE;
	Thu, 15 Oct 2020 13:18:57 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9D661C32EA3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Oct 2020 13:18:55 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <a.fatoum@pengutronix.de>)
 id 1kT39i-0003th-Tx; Thu, 15 Oct 2020 15:18:54 +0200
To: Marek Vasut <marex@denx.de>, Yann GAUTIER <yann.gautier@st.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
References: <20201009210820.243659-1-marex@denx.de>
 <f842dd08-77d0-fd5b-63fd-26762a54be5e@st.com>
 <a28a3842-0fcf-458e-ef26-aeffed035b32@pengutronix.de>
 <a1f1138e-444d-5e3b-4e1a-614a3fc1981e@denx.de>
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Message-ID: <33b2ff3f-3809-46db-a989-c7517d6e8369@pengutronix.de>
Date: Thu, 15 Oct 2020 15:18:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <a1f1138e-444d-5e3b-4e1a-614a3fc1981e@denx.de>
Content-Language: en-US
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: hardware@linux-automation.com, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Patrick DELAUNAY <patrick.delaunay@st.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: stm32: Consistently enable
 internal pull-ups for SD bus
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

Hello Marek,

On 10/15/20 2:52 PM, Marek Vasut wrote:
> On 10/15/20 2:44 PM, Ahmad Fatoum wrote:
> 
> Hi,
> 
> [...]
> 
>> We already have 47K external pull-ups on all the SDMMC2's data lanes and we
>> don't need the SoC-internal pull-up there as well.
>>
>> On the SDMMC1 we lack them, so they were added in the board DTS:
> 
> You do need pullups on SD bus by default.

Yes, we are aware of this now :-)

> Currently the
> stm32mp15-pinmux.dtsi is not consistent in that aspect. I am not arguing
> about any one single board, but about the dtsi, I suspect by default the
> pull ups should be enabled, and possibly on board-DT-level they should
> be disabled if not needed instead ?

I think this is a good idea. But existing boards should be fixed up so that
their old behavior is maintained.

> [...]
> 
>> I don't mind the central pinctrl settings changed to make them more widely applicable
>> if current users get such override nodes inserted to maintain their existing settings.
>>
>> (My favorite would of course be to allow board DTS to just keep their own pinctrl
>>  nodes outside stm32mp15-pinctrl.dtsi.)
> 
> I agree, the current state is just heading toward combinatorial
> explosion of pinmux entries.


Cheers
Ahmad

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
