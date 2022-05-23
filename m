Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 987AA530EAF
	for <lists+linux-stm32@lfdr.de>; Mon, 23 May 2022 14:35:14 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 48BC9C0C921;
	Mon, 23 May 2022 12:35:14 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1A8D0C03FC4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 23 May 2022 12:35:13 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24N9xcs3026146;
 Mon, 23 May 2022 14:34:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=qIqK8sKEylUqg49Cc+Izo93o3wEhAt3Jq4iiQrYTUbQ=;
 b=6PmZ9b6rKmjdRP4tdvYnyvxBnK6nHrMvYE2wr20DGpObItpskv+GN69bswIDXXVdfLt4
 WFXNY8YEhrBX6ZT/TLCcH+NrGaH4w80XSYp2irmLVpPquWcINhel53BlBSwmNEIkFbR3
 QENy0RM0AkAJoVSpIOSl513OCVsihsAfWToqnEVs8YrX3JkWOdVNh/O/OIpKtPmWjvYC
 obS4NLuJUwsIfmUtEta6n/Lf1OfPQNeShDtGaHQU/x1NtZ02n0M7cyuPIHmjOUDJGv+2
 39RdwjCKdsfJ5llE4hs3erRbSpSfsyVy3kGLF5lGZmOM+i+KJ+LRfVQ7uyHMGBjtQFzx hQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3g6s02935u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 May 2022 14:34:51 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 182A8100034;
 Mon, 23 May 2022 14:34:51 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 03D2322789E;
 Mon, 23 May 2022 14:34:51 +0200 (CEST)
Received: from [10.201.20.168] (10.75.127.49) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Mon, 23 May
 2022 14:34:50 +0200
Message-ID: <ceb2d1a3-dccd-865e-ed74-54444e49f349@foss.st.com>
Date: Mon, 23 May 2022 14:34:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
References: <20220504130233.330983-1-valentin.caron@foss.st.com>
 <20220504130617.331290-1-valentin.caron@foss.st.com>
 <YnLhw+Y7m8G2xJpK@mail.local>
From: Valentin CARON <valentin.caron@foss.st.com>
In-Reply-To: <YnLhw+Y7m8G2xJpK@mail.local>
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-23_06,2022-05-23_01,2022-02-23_01
Cc: linux-rtc@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 2/6] dt-bindings: rtc: stm32: add alarm A
 out property to select output
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

Hi Alexandre,

On 5/4/22 22:27, Alexandre Belloni wrote:
> Hello,
>
> On 04/05/2022 15:06:13+0200, Valentin Caron wrote:
>> STM32 RTC can pulse some SOC pins when an alarm of RTC expires.
>>
>> This patch adds property to activate alarm A output. The pulse can
>> output on three pins RTC_OUT1, RTC_OUT2, RTC_OUT2_RMP
>> (PC13, PB2, PI8 on stm32mp15) (PC13, PB2, PI1 on stm32mp13).
>>
>> Signed-off-by: Valentin Caron <valentin.caron@foss.st.com>
>> ---
>>   .../devicetree/bindings/rtc/st,stm32-rtc.yaml | 19 ++++++++++++++++++-
>>   1 file changed, 18 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/rtc/st,stm32-rtc.yaml b/Documentation/devicetree/bindings/rtc/st,stm32-rtc.yaml
>> index 56d46ea35c5d..71e02604e8de 100644
>> --- a/Documentation/devicetree/bindings/rtc/st,stm32-rtc.yaml
>> +++ b/Documentation/devicetree/bindings/rtc/st,stm32-rtc.yaml
>> @@ -59,6 +59,13 @@ properties:
>>         Refer to <include/dt-bindings/rtc/rtc-stm32.h> for the supported values.
>>         Pinctrl state named "default" may be defined to reserve pin for RTC output.
>>   
>> +  st,alarm:
>> +    $ref: "/schemas/types.yaml#/definitions/uint32"
>> +    description: |
>> +      To select and enable RTC Alarm A output.
>> +      Refer to <include/dt-bindings/rtc/rtc-stm32.h> for the supported values.
>> +      Pinctrl state named "default" may be defined to reserve pin for RTC output.
>> +
>>   allOf:
>>     - if:
>>         properties:
>> @@ -75,6 +82,9 @@ allOf:
>>           st,lsco:
>>             maxItems: 0
>>   
>> +        st,alarm:
>> +          maxItems: 0
>> +
>>           clock-names: false
>>   
>>         required:
>> @@ -95,6 +105,9 @@ allOf:
>>           st,lsco:
>>             maxItems: 0
>>   
>> +        st,alarm:
>> +          maxItems: 0
>> +
>>         required:
>>           - clock-names
>>           - st,syscfg
>> @@ -117,6 +130,9 @@ allOf:
>>           st,lsco:
>>             maxItems: 1
>>   
>> +        st,alarm:
>> +          maxItems: 1
>> +
>>         required:
>>           - clock-names
>>   
>> @@ -153,8 +169,9 @@ examples:
>>         clocks = <&rcc RTCAPB>, <&rcc RTC>;
>>         clock-names = "pclk", "rtc_ck";
>>         interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
>> +      st,alarm = <RTC_OUT1>;
>>         st,lsco = <RTC_OUT2_RMP>;
> Shouldn't that be exactly the opposite? You have two pins that can
> output different functions. The property should be the pin and the value
> the function. I'd go even further and I would say this is actually
> pinmuxing.
>
You're right, if the property is the pin and the value the function, 
this looks like a pinctrl node.
We choose to develop theses functionalities in the reverse order, to 
avoid the complexity of adding
the pinctrl framework to our driver. Moreover, LSCO and AlarmA may 
haven't a peripheral client and
this would probably require to also implement pinctrl hogging.

Is the implementation that we have proposed is acceptable regarding 
theses elements ?

Thank you,
Valentin

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
