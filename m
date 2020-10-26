Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B84932998C2
	for <lists+linux-stm32@lfdr.de>; Mon, 26 Oct 2020 22:30:24 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6334CC36B37;
	Mon, 26 Oct 2020 21:30:24 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5DD89C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 Oct 2020 21:30:22 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <a.fatoum@pengutronix.de>)
 id 1kXA4J-00088d-AK; Mon, 26 Oct 2020 22:30:19 +0100
To: Rob Herring <robh@kernel.org>
References: <20201021102855.18026-1-a.fatoum@pengutronix.de>
 <20201026143656.GA118160@bogus>
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Message-ID: <23e423ba-25f2-c3ed-ea65-2c2d86ae9522@pengutronix.de>
Date: Mon, 26 Oct 2020 22:30:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201026143656.GA118160@bogus>
Content-Language: en-US
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 kernel@pengutronix.de, Maxime Coquelin <mcoquelin.stm32@gmail.com>
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

Hello Rob,

On 10/26/20 3:36 PM, Rob Herring wrote:
> On Wed, Oct 21, 2020 at 12:28:55PM +0200, Ahmad Fatoum wrote:
>> The stm32mp1 TAMP (Tamper and backup registers) does tamper detection
>> and features 32 backup registers that, being in the RTC domain, may
>> survive even with Vdd switched off.
>>
>> This makes it suitable for use to communicate a reboot mode from OS
>> to bootloader via the syscon-reboot-mode binding. Add a "simple-mfd"
>> to support probing such a child node. The actual reboot mode
>> node could then be defined in a board.dts or fixed up by the bootloader.
> 
> 'simple-mfd' implies there is no dependency on the parent node for the 
> child (such as the regmap perhaps). Is that the case here?

No, there's a dependency and the Linux driver does syscon_node_to_regmap
on the device tree node's parent but that's how the syscon-reboot-mode binding
is documented:

  The SYSCON mapped register is retrieved from the
  parental dt-node plus the offset. So the SYSCON reboot-mode node
  should be represented as a sub-node of a "syscon", "simple-mfd" node.

How would you prefer this being done instead?

Cheers,
Ahmad

> 
>>
>> Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
>> ---
>> v1 available here:
>> https://lore.kernel.org/linux-arm-kernel/20200916142216.25142-1-a.fatoum@pengutronix.de/
>>
>> v1 -> v2:
>>  - new patch, rebased on top of
>>    https://lore.kernel.org/r/20201014125441.2457-1-arnaud.pouliquen@st.com
>> ---
>>  .../devicetree/bindings/arm/stm32/st,stm32-syscon.yaml       | 5 ++++-
>>  1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml b/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
>> index 6634b3e0853e..4684017a42e4 100644
>> --- a/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
>> +++ b/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
>> @@ -19,8 +19,11 @@ properties:
>>                - st,stm32mp151-pwr-mcu
>>                - st,stm32-syscfg
>>                - st,stm32-power-config
>> -              - st,stm32-tamp
>>            - const: syscon
>> +      - items:
>> +          - const: st,stm32-tamp
>> +          - const: syscon
>> +          - const: simple-mfd
>>  
>>    reg:
>>      maxItems: 1
>> -- 
>> 2.28.0
>>
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
