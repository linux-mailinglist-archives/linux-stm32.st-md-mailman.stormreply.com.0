Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DE55875246D
	for <lists+linux-stm32@lfdr.de>; Thu, 13 Jul 2023 15:58:57 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 89E83C6B452;
	Thu, 13 Jul 2023 13:58:57 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3B7C3C6B44E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Jul 2023 13:58:56 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 36DDG3DB009960; Thu, 13 Jul 2023 15:58:16 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=jScQfB7dHrSC/WSmDV+VXYQZhrTRCDcVOleEzuAMkbE=;
 b=SfPoPLnnS6bLH20C2mmzuSXgd6/LCZxaRC927PE4Mq989cPc8vsuiDIrNcox0JeecTgk
 vPSy+TZQ0MWOr5EnYuFBdJ4IeZx8ly3L7dJBVxGjU8klO2sMHXDNayHV0IEhjmSJsuCp
 iGud6dnNZMDNTsd/DkUniBS2IpTUNWOe4vjqh2vsQwrqhmWN8E7LzuSEP4zI2yQiwW3+
 zBpv9EiLZwUwirVLGu0eG1qtyzqzjsy3ii1suiVs0vmb/OiOXk2oEMI3chtxRqniHYa3
 X9F+QSqs4L8qMuMBivzwcYURTgZbAwRpZYfPZh60JsRQFYr2leCnOExEUKEI2GdCBMLi ZA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3rtedthy7f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 13 Jul 2023 15:58:16 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4F4DC100056;
 Thu, 13 Jul 2023 15:58:14 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E240A21A21E;
 Thu, 13 Jul 2023 15:58:14 +0200 (CEST)
Received: from [10.201.21.121] (10.201.21.121) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Thu, 13 Jul
 2023 15:58:12 +0200
Message-ID: <ba409196-06a1-bf2b-3536-1e1420550ff4@foss.st.com>
Date: Thu, 13 Jul 2023 15:58:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
References: <20230705172759.1610753-1-gatien.chevallier@foss.st.com>
 <20230705172759.1610753-6-gatien.chevallier@foss.st.com>
 <20230706150906.GB3858320-robh@kernel.org>
 <d13f935c-568b-3c0d-8e7d-006b7d4e7d50@foss.st.com>
 <20230707150724.GA112541-robh@kernel.org>
From: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
In-Reply-To: <20230707150724.GA112541-robh@kernel.org>
X-Originating-IP: [10.201.21.121]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-13_05,2023-07-13_01,2023-05-22_02
Cc: ulf.hansson@linaro.org, linux-iio@vger.kernel.org, catalin.marinas@arm.com,
 edumazet@google.com, Oleksii_Moisieiev@epam.com,
 krzysztof.kozlowski+dt@linaro.org, linux-phy@lists.infradead.org,
 will@kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Peng Fan <peng.fan@oss.nxp.com>, herbert@gondor.apana.org.au,
 hugues.fruchet@foss.st.com, lee@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org,
 andi.shyti@kernel.org, alsa-devel@alsa-project.org, richardcochran@gmail.com,
 linux-serial@vger.kernel.org, mchehab@kernel.org,
 linux-arm-kernel@lists.infradead.org, arnd@kernel.org,
 gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, vkoul@kernel.org, linux-crypto@vger.kernel.org,
 netdev@vger.kernel.org, dmaengine@vger.kernel.org, davem@davemloft.net,
 jic23@kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 05/10] firewall: introduce stm32_firewall
	framework
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

Hello Rob,

On 7/7/23 17:07, Rob Herring wrote:
> On Fri, Jul 07, 2023 at 03:43:15PM +0200, Gatien CHEVALLIER wrote:
>>
>>
>> On 7/6/23 17:09, Rob Herring wrote:
>>> On Wed, Jul 05, 2023 at 07:27:54PM +0200, Gatien Chevallier wrote:
>>>> Introduce a firewall framework that offers to firewall consumers different
>>>> firewall services such as the ability to check their access rights against
>>>> their firewall controller(s).
>>>>
>>>> The firewall framework offers a generic API that is defined in firewall
>>>> controllers drivers to best fit the specificity of each firewall.
>>>>
>>>> There are various types of firewalls:
>>>> -Peripheral firewalls that filter accesses to peripherals
>>>> -Memory firewalls that filter accesses to memories or memory regions
>>>> -Resource firewalls that filter accesses to internal resources such as
>>>> reset and clock controllers
>>>
>>> How do resource firewalls work? Access to registers for some clocks in a
>>> clock controller are disabled? Or something gates off clocks/resets to
>>> a block?
>>
>> To take a practical example:
>>
>> A clock controller can be firewall-aware and have its own firewall registers
>> to configure. To access a clock/reset that is handled this way, a device
>> would need to check this "resource firewall". I thought that for these kinds
>> of hardware blocks, having a common API would help.
> 
> We already have the concept of 'protected clocks' which are ones
> controlled by secure mode which limits what Linux can do with them. I
> think you should extend this mechanism if needed and use the existing
> clock/reset APIs for managing resources.
> 

Ok, thank you for the input. I'll remove this type of firewall for V2 as
I no longer have a use case.

>>>
>>> It might make more sense for "resource" accesses to be managed within
>>> those resource APIs (i.e. the clock and reset frameworks) and leave this
>>> framework to bus accesses.
>>>
>>
>> Okay, I'll drop this for V2 if you find that the above explaination do not
>> justify this.
>>
>>>> A firewall controller must be probed at arch_initcall level and register
>>>> to the framework so that consumers can use their services.
>>>
>>> initcall ordering hacks should not be needed. We have both deferred
>>> probe and fw_devlinks to avoid that problem.
>>>
>>
>> Greg also doubts this.
>>
>> Drivers like reset/clock controllers drivers (core_initcall level) will have
>> a dependency on the firewall controllers in order to initialize their
>> resources. I was not sure how to manage these dependencies.
>>
>> Now, looking at init/main.c, I've realized that core_initcall() level comes
>> before arch_initcall() level...
>>
>> If managed by fw_devlink, the feature-domains property should be supported
>> as well I suppose? I'm not sure how to handle this properly. I'd welcome
>> your suggestion.
> 
> DT parent/child child dependencies are already handled which might be
> enough for you. Otherwise, adding a new provider/consumer binding is a
> couple of lines to add the property names. See drivers/of/property.c.
> 

Ok, I'll try with a modification of drivers/of/property.c as the
parent/child dependency won't be enough. Thanks for pointing this out.

>>>> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
>>>> ---
>>>>    MAINTAINERS                               |   5 +
>>>>    arch/arm64/Kconfig.platforms              |   1 +
>>>>    drivers/bus/Kconfig                       |  10 +
>>>>    drivers/bus/Makefile                      |   1 +
>>>>    drivers/bus/stm32_firewall.c              | 252 ++++++++++++++++++++++
>>>>    drivers/bus/stm32_firewall.h              |  83 +++++++
>>>
>>> Why something stm32 specific? We know there are multiple platforms
>>> wanting something in this area. Wasn't the last attempt common?
>>>
>>> For a common binding, I'm not eager to accept anything new with only 1
>>> user.
>>>
>>
>> Last attempt was common for the feature-domain bindings. The system-bus
>> driver was ST-specific. I don't know if other platforms needs this kind
>> of framework. Are you suggesting that this framework should be generic? Or
>> that this framework should have a st-specific property?
> 
> Ah right, the posting for SCMI device permissions was the binding only.
> The binding should be generic and support more than 1 user. That somewhat
> implies a generic framework, but not necessarily.
> 
>> I've oriented this firewall framework to serve ST purpose. There may be a
>> need for other platforms but I'm not sure that this framework serves them
>> well. One can argue that it is quite minimalist and covers basic purposes of
>> a hardware firewall but I would need more feedback from other vendors to
>> submit it as a generic one.
> 
> We already know there are at least 2 users. Why would we make the 2nd
> user refactor your driver into a common framework?
> 
> [...]
> 

If one thinks this framework is generic enough so it can be of use for
them, so yes, I can submit it as a common framework. I'm not that sure
Oleksii finds a use case with it. He seemed interested by the bindings.
Maybe I'm wrong Oleksii?

For V2, I'd rather submit it again as an ST-specific framework again to
address the generic comments. This way, other people have time to
manifest themselves.

>>>> +int stm32_firewall_get_firewall(struct device_node *np,
>>>> +				struct stm32_firewall *firewall)
>>>> +{
>>>> +	struct stm32_firewall_controller *ctrl;
>>>> +	struct of_phandle_args args;
>>>> +	u32 controller_phandle;
>>>> +	bool match = false;
>>>> +	size_t i;
>>>> +	int err;
>>>> +
>>>> +	if (!firewall)
>>>> +		return -EINVAL;
>>>> +
>>>> +	/* The controller phandle is always the first argument of the feature-domains property. */
>>>> +	err = of_property_read_u32(np, "feature-domains", &controller_phandle);
>>>
>>> Why do you need to parse the property twice?
>>>
>>
>> The first parsing is to have the first argument, which is the controller
>> phandle. The second parsing is here to get the firewall arguments based on
>> the number of arguments defined by #feature-domain-cells. Maybe using
>> of_property_read_u32_array() would be better.
> 
> No. It's not a u32 array. It's a phandle+args property, so you should
> only use phandle+args APIs.
> 
>> I did not want to close the
>> door for supporting several feature domain controllers, hence multiple
>> phandles. of_parse_phandle_with_args() seemed fine for this purpose but the
>> phandle is parsed out.
> 
> There's an iterator for handling multiple phandle+args cases.
> 
> Rob

Ok, will look into that for V2.

Best regards,
Gatien
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
