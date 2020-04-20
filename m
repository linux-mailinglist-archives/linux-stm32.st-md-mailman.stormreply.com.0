Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E36BC1B090C
	for <lists+linux-stm32@lfdr.de>; Mon, 20 Apr 2020 14:15:23 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9AC21C36B0C;
	Mon, 20 Apr 2020 12:15:23 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9F501C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Apr 2020 12:15:21 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03KBrxA1020286; Mon, 20 Apr 2020 14:15:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=oYkfgGSvLLhJSgChHwt5UPO9noM7Sp59Wqwp6zu8gv4=;
 b=xBih1p+Xf94GO7U3gDyqAbhnTDuSjcKRCUh0HMXy7Sg8mKUp6V1ARRE8EoQblboWkmrU
 J7F0RBe2mXqle7OFFJRGr2LFpOQV5FEKCO423ZIr5KtNes15rT3uncAVsIHDJFebXiPN
 y7Alz5vs0UCPfcFgytizNp7Myt1cppjGlaCL+keYsdWN+ygy0sFZQbEgHIRHkBnrTcB+
 56EhwNoa4uMjYiCnc+g5OHRwDtRnJSqlaSeWflUY4CAylYKmHHwEnYUcKIGN3/2ej0Vb
 8feSA803iXwwZ0K1c1bg3qFjcX+K/wRUvRTDBVrKvVTNe+rwpzNsn3Svt/0Kw9ZO40kM pw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30fpp8j9xk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Apr 2020 14:15:07 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6110E100034;
 Mon, 20 Apr 2020 14:15:06 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag5node2.st.com [10.75.127.14])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 477C020E15C;
 Mon, 20 Apr 2020 14:15:06 +0200 (CEST)
Received: from SFHDAG3NODE3.st.com (10.75.127.9) by SFHDAG5NODE2.st.com
 (10.75.127.14) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 20 Apr
 2020 14:15:05 +0200
Received: from SFHDAG3NODE3.st.com ([fe80::3507:b372:7648:476]) by
 SFHDAG3NODE3.st.com ([fe80::3507:b372:7648:476%20]) with mapi id
 15.00.1347.000; Mon, 20 Apr 2020 14:15:05 +0200
From: Benjamin GAIGNARD <benjamin.gaignard@st.com>
To: Fabrice GASNIER <fabrice.gasnier@st.com>, "lee.jones@linaro.org"
 <lee.jones@linaro.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "mark.rutland@arm.com" <mark.rutland@arm.com>, "mcoquelin.stm32@gmail.com"
 <mcoquelin.stm32@gmail.com>, Alexandre TORGUE <alexandre.torgue@st.com>,
 "daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>,
 "tglx@linutronix.de" <tglx@linutronix.de>
Thread-Topic: [RESEND v6 1/6] dt-bindings: mfd: Document STM32 low power timer
 bindings
Thread-Index: AQHWFvIDiS0rSVDAKUm6xHaRsa0yGaiBnm0AgAAszAA=
Date: Mon, 20 Apr 2020 12:15:05 +0000
Message-ID: <83a750a8-85ec-dbc8-a429-d61af5be36b4@st.com>
References: <20200420085930.26989-1-benjamin.gaignard@st.com>
 <20200420085930.26989-2-benjamin.gaignard@st.com>
 <f9d41617-797e-15d4-a058-a0a9e6669cdc@st.com>
In-Reply-To: <f9d41617-797e-15d4-a058-a0a9e6669cdc@st.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.44]
Content-ID: <D343010F4CE77A4D9449AA83278B79CA@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-20_03:2020-04-20,
 2020-04-20 signatures=0
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [Linux-stm32] [RESEND v6 1/6] dt-bindings: mfd: Document STM32
 low power timer bindings
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



On 4/20/20 11:34 AM, Fabrice Gasnier wrote:
> On 4/20/20 10:59 AM, Benjamin Gaignard wrote:
>> Add a subnode to STM low power timer bindings to support timer driver
>>
>> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
>> Reviewed-by: Rob Herring <robh@kernel.org>
>> ---
>>   .../devicetree/bindings/mfd/st,stm32-lptimer.yaml     | 19 +++++++++++++++++++
>>   1 file changed, 19 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/mfd/st,stm32-lptimer.yaml b/Documentation/devicetree/bindings/mfd/st,stm32-lptimer.yaml
>> index ddf190cb800b..64bab1c3bdac 100644
>> --- a/Documentation/devicetree/bindings/mfd/st,stm32-lptimer.yaml
>> +++ b/Documentation/devicetree/bindings/mfd/st,stm32-lptimer.yaml
>> @@ -33,6 +33,9 @@ properties:
>>       items:
>>         - const: mux
>>   
>> +  interrupts:
>> +    maxItems: 1
>> +
>>     "#address-cells":
>>       const: 1
>>   
>> @@ -93,6 +96,16 @@ patternProperties:
>>       required:
>>         - compatible
>>   
>> +  timer:
>> +    type: object
>> +
>> +    properties:
>> +      compatible:
>> +        const: st,stm32-lptimer-timer
>> +
>> +    required:
>> +      - compatible
>> +
>>   required:
>>     - "#address-cells"
>>     - "#size-cells"
>> @@ -106,11 +119,13 @@ additionalProperties: false
>>   examples:
>>     - |
>>       #include <dt-bindings/clock/stm32mp1-clks.h>
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>>       timer@40002400 {
>>         compatible = "st,stm32-lptimer";
>>         reg = <0x40002400 0x400>;
>>         clocks = <&timer_clk>;
>>         clock-names = "mux";
>> +      interrupts-extended = <&exti 47 IRQ_TYPE_LEVEL_HIGH>;
>>         #address-cells = <1>;
>>         #size-cells = <0>;
>>   
>> @@ -131,6 +146,10 @@ examples:
>>         timer {
>>           compatible = "st,stm32-lptimer-timer";
>>         };
>> +
>> +      timer {
>> +        compatible = "st,stm32-lptimer-timer";
>> +      };
> Hi Benjamin,
>
> It looks like the compatible is duplicated in this example.
> Also, from "PATCH v6" I don't see the wakeup-source flag in your resend.
> Can you double-check ?
I have rebased the serie on top of v5.7-rc2, I haven't see that the 
bindings got merged
and, unlucky, these hunks can still be applied and becomes duplicated.
I will send a v7.

Benjamin
>
> Thanks,
> Best Regards,
> Fabrice
>
>>       };
>>   
>>   ...
>>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
