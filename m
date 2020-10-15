Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E61CD28F28E
	for <lists+linux-stm32@lfdr.de>; Thu, 15 Oct 2020 14:44:32 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A63F0C424B3;
	Thu, 15 Oct 2020 12:44:32 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C331FC424AF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Oct 2020 12:44:30 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <a.fatoum@pengutronix.de>)
 id 1kT2cQ-0008KB-0Y; Thu, 15 Oct 2020 14:44:30 +0200
To: Yann GAUTIER <yann.gautier@st.com>, Marek Vasut <marex@denx.de>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
References: <20201009210820.243659-1-marex@denx.de>
 <f842dd08-77d0-fd5b-63fd-26762a54be5e@st.com>
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Message-ID: <a28a3842-0fcf-458e-ef26-aeffed035b32@pengutronix.de>
Date: Thu, 15 Oct 2020 14:44:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <f842dd08-77d0-fd5b-63fd-26762a54be5e@st.com>
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

Hello Yann,

thanks for pinging me.

On 10/14/20 3:26 PM, Yann GAUTIER wrote:
> On 10/9/20 11:08 PM, Marek Vasut wrote:
>> @@ -1510,7 +1510,7 @@ pins {
>>   				 <STM32_PINMUX('C', 7, AF10)>; /* SDMMC2_D7 */
>>   			slew-rate = <1>;
>>   			drive-push-pull;
>> -			bias-disable;
>> +			bias-pull-up;
> This one is also used on Linux Automation MC-1 board, Ahmad, is it OK 
> for you?

Hello Marek,

We already have 47K external pull-ups on all the SDMMC2's data lanes and we
don't need the SoC-internal pull-up there as well.

On the SDMMC1 we lack them, so they were added in the board DTS:

  /* stm32mp157c-lxa-mc1.dts */
  &sdmmc1_b4_pins_a {
          /*
           * board lacks external pull-ups on SDMMC lines. Class 10 SD refuses to
           * work, thus enable internal pull-ups.
           */
          pins1 {
                  /delete-property/ bias-disable;
                  bias-pull-up;
          };
          pins2 {
                  /delete-property/ bias-disable;
                  bias-pull-up;
          };
  };

I don't mind the central pinctrl settings changed to make them more widely applicable
if current users get such override nodes inserted to maintain their existing settings.

(My favorite would of course be to allow board DTS to just keep their own pinctrl
 nodes outside stm32mp15-pinctrl.dtsi.)

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
