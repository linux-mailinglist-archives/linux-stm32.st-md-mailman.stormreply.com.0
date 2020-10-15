Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BE47B28F634
	for <lists+linux-stm32@lfdr.de>; Thu, 15 Oct 2020 17:52:24 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 68C81C424AF;
	Thu, 15 Oct 2020 15:52:24 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0AF64C32EA7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Oct 2020 15:52:21 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09FFlVxm022682; Thu, 15 Oct 2020 17:52:12 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=DQoZvXhZdY8zvlwqNoG3Kx2x3idDsD/0xwAEfYm3lmg=;
 b=frC6C3Qvq4fZHf57420oWogSEGGUC0BWQGSoKkvNfjKDooZAj35VztML77in6NEUbC4q
 duZOMxxT0PhTQ+hCu4VlNRBr9h2ObFtbdU9GZoFUr/Unatrl8Oo2B9MuapLnJ6YImI3z
 9U6jIoIg21ynWB5s63QMiOwy5S/FqDanX6lButpH2aMCBg/VB8YKISWCHpqT6uLsF/CG
 OeeHKtCUHTIgUmK+U41hiokz+WKm/+67e5Ke1V1ctfHuZ9RZqMu1+F39s8QZCGazWF6V
 7rVw7Gac1Oj7gCUo3QEonj4WxVd4DeLasFVnm1NSc8YTd7QLhcjpRRvvprCee3LH329X QA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 343587e377-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Oct 2020 17:52:12 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 930E810002A;
 Thu, 15 Oct 2020 17:52:11 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 781E22CD045;
 Thu, 15 Oct 2020 17:52:11 +0200 (CEST)
Received: from lmecxl0912.lme.st.com (10.75.127.49) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 15 Oct
 2020 17:52:10 +0200
To: Ahmad Fatoum <a.fatoum@pengutronix.de>, Marek Vasut <marex@denx.de>, Yann
 GAUTIER <yann.gautier@st.com>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>
References: <20201009210820.243659-1-marex@denx.de>
 <f842dd08-77d0-fd5b-63fd-26762a54be5e@st.com>
 <a28a3842-0fcf-458e-ef26-aeffed035b32@pengutronix.de>
 <a1f1138e-444d-5e3b-4e1a-614a3fc1981e@denx.de>
 <33b2ff3f-3809-46db-a989-c7517d6e8369@pengutronix.de>
 <11b92f1e-fda0-e98a-8db7-f53004f2404d@denx.de>
 <e95247bd-7b1d-b44c-4a9e-c9951f37e6cf@pengutronix.de>
From: Alexandre Torgue <alexandre.torgue@st.com>
Message-ID: <0f815500-9ff3-da51-42b2-7a262d57f510@st.com>
Date: Thu, 15 Oct 2020 17:51:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <e95247bd-7b1d-b44c-4a9e-c9951f37e6cf@pengutronix.de>
Content-Language: en-US
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG3NODE2.st.com (10.75.127.8) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-15_09:2020-10-14,
 2020-10-15 signatures=0
Cc: hardware@linux-automation.com, Patrick DELAUNAY <patrick.delaunay@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Hi

On 10/15/20 3:47 PM, Ahmad Fatoum wrote:
> Hello,
> 
> On 10/15/20 3:40 PM, Marek Vasut wrote:
>>>> Currently the
>>>> stm32mp15-pinmux.dtsi is not consistent in that aspect. I am not arguing
>>>> about any one single board, but about the dtsi, I suspect by default the
>>>> pull ups should be enabled, and possibly on board-DT-level they should
>>>> be disabled if not needed instead ?
>>>
>>> I think this is a good idea. But existing boards should be fixed up so that
>>> their old behavior is maintained.
>>
>> So, which boards do we fix. The automation-1 board and the ST ones ?
> 
> fixed up, not fixed. I don't know if ST is fine with the changes, for
> the MC-1, please do:
> 
> -------------- 8< -------------
> diff --git a/arch/arm/boot/dts/stm32mp157c-lxa-mc1.dts b/arch/arm/boot/dts/stm32mp157c-lxa-mc1.dts
> index 5700e6b700d3..7134466256b3 100644
> --- a/arch/arm/boot/dts/stm32mp157c-lxa-mc1.dts
> +++ b/arch/arm/boot/dts/stm32mp157c-lxa-mc1.dts
> @@ -208,6 +208,14 @@ pins2 {
>          };
>   };
> 
> +&sdmmc2_d47_pins_b {
> +       /* board already has external 47K pull-ups */
> +
> +       pins {
> +               /delete-property/ bias-pull-up;
> +               bias-disable;
> +       };
> +};
> +

This proposition remind me an old discussion we got with Marek about 
"where pin definitions has to be done ?". My approach is to not define 
pins groups inside board dts file mainly because pinmux is a SoC 
configuration and a board only use one of those configurations blablabla 
:). But counter-argument is that pull-up/pull-down, Open-drain push-pull 
settings are "driven" by the board configuration and I agree.

We are exactly in this case here but before to rework all STM32 DT to 
split pin config I propose to keep what we have today, and to enable 
bias-pull-up, (or other settings) in boards that need it.

Marek, what's your feeling ?

cheers
alex



>   &sdmmc2 {
>          pinctrl-names = "default", "opendrain", "sleep";
>          pinctrl-0 = <&sdmmc2_b4_pins_a &sdmmc2_d47_pins_b>;
> 
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
