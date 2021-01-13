Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AD672F4A38
	for <lists+linux-stm32@lfdr.de>; Wed, 13 Jan 2021 12:34:28 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DEF12C32EA8;
	Wed, 13 Jan 2021 11:34:27 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4804DC424BE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 Jan 2021 11:34:26 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4DG52B1D9cz1s8vL;
 Wed, 13 Jan 2021 12:34:26 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4DG52B0R34z1qqkw;
 Wed, 13 Jan 2021 12:34:26 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id sYKn3FNqEKDq; Wed, 13 Jan 2021 12:34:22 +0100 (CET)
X-Auth-Info: 8NKgG4WI1id14ec42vtqdyNS4AXM0ddjBFlmNIJJ5Hg=
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Wed, 13 Jan 2021 12:34:22 +0100 (CET)
To: Ulf Hansson <ulf.hansson@linaro.org>
References: <20210105140718.122752-1-marex@denx.de>
 <CAPDyKFoQfm2ZtPdsZSZtOCDH-FJqNzihYqZny-vUdK4Q4tWTzQ@mail.gmail.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <b83c1112-010b-a40f-319f-84c755424b0f@denx.de>
Date: Wed, 13 Jan 2021 12:34:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CAPDyKFoQfm2ZtPdsZSZtOCDH-FJqNzihYqZny-vUdK4Q4tWTzQ@mail.gmail.com>
Content-Language: en-US
Cc: Linus Walleij <linus.walleij@linaro.org>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] [RFC] mmc: mmci: Add support for probing
 bus voltage level translator
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

On 1/13/21 11:44 AM, Ulf Hansson wrote:

[...]

>> NOTE: I would prefer this solution over having a custom DT per SoM,
>>        since it reduces the amount of DT combinations.
>> ---
>>   arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi | 32 ++++++++-
>>   drivers/mmc/host/mmci.c                      | 70 ++++++++++++++++++--
> 
> Please avoid mixing DTS changes with changes to code in drivers.

With RFC patch you likely want to see the whole picture, so I kept it in 
one patch.

>>   2 files changed, 96 insertions(+), 6 deletions(-)
>>
>> diff --git a/arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi b/arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi
>> index dc70ddd09e9d..a69cae19d92d 100644
>> --- a/arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi
>> +++ b/arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi
>> @@ -401,15 +401,45 @@ &rtc {
>>          status = "okay";
>>   };
>>
>> +&pinctrl {
>> +       sdmmc1_b4_init_pins_a: sdmmc1-init-b4-0 {
>> +               pins1 {
>> +                       pinmux = <STM32_PINMUX('C', 8, AF12)>, /* SDMMC1_D0 */
>> +                                <STM32_PINMUX('C', 9, AF12)>, /* SDMMC1_D1 */
>> +                                <STM32_PINMUX('C', 10, AF12)>, /* SDMMC1_D2 */
>> +                                <STM32_PINMUX('C', 11, AF12)>; /* SDMMC1_D3 */
>> +                       slew-rate = <1>;
>> +                       drive-push-pull;
>> +                       bias-disable;
>> +               };
>> +       };
>> +
>> +       sdmmc1_dir_init_pins_a: sdmmc1-init-dir-0 {
>> +               pins1 {
>> +                       pinmux = <STM32_PINMUX('F', 2, AF11)>, /* SDMMC1_D0DIR */
>> +                                <STM32_PINMUX('C', 7, AF8)>, /* SDMMC1_D123DIR */
>> +                                <STM32_PINMUX('B', 9, AF11)>; /* SDMMC1_CDIR */
>> +                       slew-rate = <1>;
>> +                       drive-push-pull;
>> +                       bias-pull-up;
>> +               };
>> +       };
>> +};
>> +
>>   &sdmmc1 {
>> -       pinctrl-names = "default", "opendrain", "sleep";
>> +       pinctrl-names = "default", "opendrain", "sleep", "init";
> 
> Apologize for my ignorance, but my understanding of "init" vs
> "default" is that "init" should be treated as the legacy name for the
> pinstate. I would appreciate Linus' opinion on this.

My understanding is that "init" is the way pins are configured before 
the driver reconfigures them to whatever the driver needs to configure 
them to. The "default" state is the normal operational state of the 
hardware, which often is the same as "init".

[...]

>>   static int mmci_of_parse(struct device_node *np, struct mmc_host *mmc)
>>   {
>>          struct mmci_host *host = mmc_priv(mmc);
>> @@ -1913,7 +1973,7 @@ static int mmci_of_parse(struct device_node *np, struct mmc_host *mmc)
>>          if (of_get_property(np, "st,neg-edge", NULL))
>>                  host->clk_reg_add |= MCI_STM32_CLK_NEGEDGE;
>>          if (of_get_property(np, "st,use-ckin", NULL))
>> -               host->clk_reg_add |= MCI_STM32_CLK_SELCKIN;
>> +               mmci_probe_level_translator(mmc);
> 
> I think you can make this change bit less invasive. Rather than having
> to shuffle code around in ->probe(), I suggest you call
> mmci_probe_level_translator() outside and after mmci_of_parse() has
> been called.
> 
> In this way, you can also provide mmci_probe_level_translator() with a
> struct mmci_host *, rather than having to pick it up from
> mmc_priv(mmc), if you see what I mean.
> 
> Of course, this also means in mmci_probe_level_translator() you will
> have to check if MCI_STM32_CLK_SELCKIN has been set, and if not then
> do an early return.

Testing the translator presence when checking whether its enabled in DT 
seems like the right place, but that's really just an implementation detail.

I am more interested in knowing whether adding 
mmci_probe_level_translator() is even acceptable in the first place. Is it ?
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
