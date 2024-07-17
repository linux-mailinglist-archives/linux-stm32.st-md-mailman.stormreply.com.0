Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FDC9933867
	for <lists+linux-stm32@lfdr.de>; Wed, 17 Jul 2024 09:58:54 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D5167C71292;
	Wed, 17 Jul 2024 07:58:53 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 40AB9C71280
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 Jul 2024 07:58:47 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46H5Dqlr012713;
 Wed, 17 Jul 2024 09:58:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 JysyCBZhVVX0Cqer7ON/N8yUNt3og7/Pelyhdd9TMOo=; b=UFy3v8UwHllZJT2N
 LHkfc8DIJiNRpmcdWwTr9rsI+cLhBs0w4JJ1ApFwQvR51+AJ7u4jSmzoKk9Ok0oR
 h+RhkwzdI4wYJ9muiOl17TBPC5Dk3LuNv6Hk/zl+XFBv6qgXnNZxHrgnKV6UWRH0
 BK/Awz4771/8y/CMaUcA4++jh8EH/WSKPExY5mAQzWtj636NYQ/HmrnGUAoyMaDN
 h5iiphfcOoMalmJkBHE3O+W4fP06+d5XZvy/0vApW8f72mbdzrN8ef2Qv7alJjBW
 pVsYfzD4CYk0BgG4mU67LP9dzV7q4jaffCpoF+6jzN1ehag6WssQ4XaWOvhJIxmK
 Ua2wJg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 40dwfdj9dw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 Jul 2024 09:58:39 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 6419D40044;
 Wed, 17 Jul 2024 09:58:35 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A587E244DA1;
 Wed, 17 Jul 2024 09:57:58 +0200 (CEST)
Received: from [10.48.86.111] (10.48.86.111) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Wed, 17 Jul
 2024 09:57:58 +0200
Message-ID: <5266d334-0006-4fa8-981d-eca04f99a899@foss.st.com>
Date: Wed, 17 Jul 2024 09:57:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
References: <20240711140843.3201530-1-valentin.caron@foss.st.com>
 <2024071521121650db391a@mail.local>
Content-Language: en-US
From: Valentin CARON <valentin.caron@foss.st.com>
In-Reply-To: <2024071521121650db391a@mail.local>
X-Originating-IP: [10.48.86.111]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-17_04,2024-07-16_02,2024-05-17_01
Cc: linux-rtc@vger.kernel.org, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 0/4] rtc: stm32: add pinctrl interface to
	handle RTC outs
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



On 7/15/24 23:12, Alexandre Belloni wrote:
> Hello,
> 
> On 11/07/2024 16:08:39+0200, Valentin Caron wrote:
>> This series adds a pinctrl/pinmux interface to control STM32 RTC outputs.
>>
>> Theses two signals output are possible:
>>   - LSCO (Low Speed Clock Output) that allow to output LSE clock on a pin.
>>     On STM32MPU Discovery boards, this feature is used to generate a clock
>>     to Wifi/Bluetooth module.
>>   - Alarm out that allow to send a pulse on a pin when alarm A of the RTC
>>     expires.
>>
>> First attempt [1] was based on 'st,' vendor properties, this one is based
>> on pinctrl and pinmux framework.
>>
>> As device-trees will be upstreamed separately, here is an example:
>>
>> stm32-pinctrl {
>>      rtc_rsvd_pins_a: rtc-rsvd-0 {
>>          pins {
>>              pinmux = <STM32_PINMUX('B', 2, AF1)>, /* OUT2 */
>>                       <STM32_PINMUX('I', 8, ANALOG)>; /* OUT2_RMP */
>>          };
>>      };
>> };
>>
>> stm32-rtc {
>>      pinctrl-0 = <&rtc_rsvd_pins_a &rtc_alarma_pins_a>;
>>
>>      /* Enable by foo-device */
>>      rtc_lsco_pins_a: rtc-lsco-0 {
>>          pins = "out2_rmp";
>>          function = "lsco";
>>      };
>>
>>      /* Enable by stm32-rtc hog */
>>      rtc_alarma_pins_a: rtc-alarma-0 {
>>          pins = "out2";
>>          function = "alarm-a";
>>      };
>> };
>>
>> foo-device {
>>      pinctrl-0 = <&rtc_lsco_pins_a>;
>> };
>>
> 
> This all seems good to me, I let you fix the various issues that have
> been reported. I was just wondering whether the LSCO clock was registered
> early enough to be used but I guess you tested that.
> 

Hi,

Here it is:
https://lore.kernel.org/lkml/20240717074835.2210411-1valentin.caron@foss.st.com/

Yes it works fine, RTC is probed early enough in the boot sequence, and 
so Wifi/BT module does not have an issue to get the LSCO clock.

Thanks,
Valentin
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
