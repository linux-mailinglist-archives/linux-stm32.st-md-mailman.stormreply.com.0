Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 86B7B2AD3C0
	for <lists+linux-stm32@lfdr.de>; Tue, 10 Nov 2020 11:28:03 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 52211C3FAE2;
	Tue, 10 Nov 2020 10:28:03 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 60B49C36B35
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Nov 2020 10:28:01 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <a.fatoum@pengutronix.de>)
 id 1kcQsX-0000Gu-S8; Tue, 10 Nov 2020 11:27:57 +0100
To: Alexandre Torgue <alexandre.torgue@st.com>
References: <20201021102855.18026-1-a.fatoum@pengutronix.de>
 <20201026143656.GA118160@bogus>
 <23e423ba-25f2-c3ed-ea65-2c2d86ae9522@pengutronix.de>
 <CAL_JsqL8sjw1o6PzCSRM9FtRx7XLDQg2bWXxo4Yw5t6fnroudw@mail.gmail.com>
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Message-ID: <20d5ccf8-c98f-fe3c-767b-1ad99be9dd19@pengutronix.de>
Date: Tue, 10 Nov 2020 11:27:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <CAL_JsqL8sjw1o6PzCSRM9FtRx7XLDQg2bWXxo4Yw5t6fnroudw@mail.gmail.com>
Content-Language: en-US
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Sascha Hauer <kernel@pengutronix.de>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Subject: Re: [Linux-stm32] [PATCH v2 1/2] dt-bindings: arm: stm32: add
 simple-mfd compatible for tamp node
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

Hello Alex,

On 10/27/20 1:15 PM, Rob Herring wrote:
> On Mon, Oct 26, 2020 at 4:30 PM Ahmad Fatoum <a.fatoum@pengutronix.de> wrote:
>>
>> Hello Rob,
>>
>> On 10/26/20 3:36 PM, Rob Herring wrote:
>>> On Wed, Oct 21, 2020 at 12:28:55PM +0200, Ahmad Fatoum wrote:
>>>> The stm32mp1 TAMP (Tamper and backup registers) does tamper detection
>>>> and features 32 backup registers that, being in the RTC domain, may
>>>> survive even with Vdd switched off.
>>>>
>>>> This makes it suitable for use to communicate a reboot mode from OS
>>>> to bootloader via the syscon-reboot-mode binding. Add a "simple-mfd"
>>>> to support probing such a child node. The actual reboot mode
>>>> node could then be defined in a board.dts or fixed up by the bootloader.
>>>
>>> 'simple-mfd' implies there is no dependency on the parent node for the
>>> child (such as the regmap perhaps). Is that the case here?
>>
>> No, there's a dependency and the Linux driver does syscon_node_to_regmap
>> on the device tree node's parent but that's how the syscon-reboot-mode binding
>> is documented:
>>
>>   The SYSCON mapped register is retrieved from the
>>   parental dt-node plus the offset. So the SYSCON reboot-mode node
>>   should be represented as a sub-node of a "syscon", "simple-mfd" node.
>>
>> How would you prefer this being done instead?
> 
> Well, probably the syscon driver could just probe any children, but
> I'm not sure if that would break anyone. So I guess fine as-is.
> 
> Reviewed-by: Rob Herring <robh@kernel.org>

Gentle ping.

> 
> Rob
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
