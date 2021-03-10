Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B2D11333790
	for <lists+linux-stm32@lfdr.de>; Wed, 10 Mar 2021 09:41:59 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 62F44C57196;
	Wed, 10 Mar 2021 08:41:59 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 96B71C57183
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Mar 2021 08:41:57 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12A8Gqm2032122; Wed, 10 Mar 2021 09:41:46 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=selector1;
 bh=EGWBG9H2dj1JOuRZp9raVFHziFicf+Gku0YgY3zajzc=;
 b=nX4SJiobo7ikV/qN8W0aqaT0z4OtG/QSLvEFeCZJrAkknLhRvo2WTS+EsBiIgXhHKlML
 7tkeVYpoRl073uy2ApFlcL4cg+DHpW/bO1JsjTUzkqCMQVJNgo88RE7TH2mU4SX0WxvA
 dgdK+OH8NcWLJswHt7XeusEctHgdVQY3ep8Dtjo51SWRPVTFMq0ryh6SlaCa82CXj4iu
 sEr6OvGDABydXncO81i/wkSj2TAT/+3x/3OT+krBrtCO8HZgv5znYJxtqVAYh6HAjHHc
 H/y6QKGYXisHrvWp8CAfs9aoqXAr3u24U6zkKDFGi3EMkCKm3wqYR9+ngqOBSJbACE7F 9w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 373yreqjwg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 Mar 2021 09:41:46 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B631B10002A;
 Wed, 10 Mar 2021 09:41:43 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A1D1C22616C;
 Wed, 10 Mar 2021 09:41:43 +0100 (CET)
Received: from SFHDAG2NODE3.st.com (10.75.127.6) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 10 Mar
 2021 09:41:43 +0100
Received: from SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c]) by
 SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c%20]) with mapi id
 15.00.1473.003; Wed, 10 Mar 2021 09:41:43 +0100
From: Valentin CARON - foss <valentin.caron@foss.st.com>
To: Rob Herring <robh@kernel.org>
Thread-Topic: [PATCH] dt-bindings: serial: stm32: add examples
Thread-Index: AQHXEfDj1skxal1T3EamiE+nrv7Bzqp83agA
Date: Wed, 10 Mar 2021 08:41:43 +0000
Message-ID: <60c2caa0-4b69-4460-63b4-6debf1065c42@foss.st.com>
References: <20210209095948.15889-1-valentin.caron@foss.st.com>
 <20210305185347.GA466473@robh.at.kernel.org>
In-Reply-To: <20210305185347.GA466473@robh.at.kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.45]
Content-ID: <8D4E22DB76473D4F896CC6A013180C20@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-10_04:2021-03-09,
 2021-03-10 signatures=0
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alexandre TORGUE - foss <alexandre.torgue@foss.st.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: serial: stm32: add examples
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


On 3/5/21 7:53 PM, Rob Herring wrote:
> On Tue, Feb 09, 2021 at 10:59:48AM +0100, Valentin Caron wrote:
>> From: Valentin Caron <valentin.caron@st.com>
>>
>> Add examples to show more use cases :
>>   - uart2 with hardware flow control
>>   - uart4 without flow control
> Why do I need these? I can go read your dts files if I need more
> examples.
Hi,

These examples were present in the dt-binding before the convertion to 
json :

https://patchwork.kernel.org/project/linux-arm-kernel/patch/20200122095558.22553-3-benjamin.gaignard@st.com/

Would you like a v2 with this precision ?
However this is not an essential patch, we can just drop it.
>
>> Signed-off-by: Valentin Caron <valentin.caron@foss.st.com>
>> ---
>>   .../bindings/serial/st,stm32-uart.yaml        | 20 +++++++++++++++++++
>>   1 file changed, 20 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/serial/st,stm32-uart.yaml b/Documentation/devicetree/bindings/serial/st,stm32-uart.yaml
>> index 06d5f251ec88..3a4aab5d1862 100644
>> --- a/Documentation/devicetree/bindings/serial/st,stm32-uart.yaml
>> +++ b/Documentation/devicetree/bindings/serial/st,stm32-uart.yaml
>> @@ -82,6 +82,26 @@ additionalProperties: false
>>   examples:
>>     - |
>>       #include <dt-bindings/clock/stm32mp1-clks.h>
>> +
>> +    usart4: serial@40004c00 {
>> +      compatible = "st,stm32-uart";
>> +      reg = <0x40004c00 0x400>;
>> +      interrupts = <52>;
>> +      clocks = <&clk_pclk1>;
>> +      pinctrl-names = "default";
>> +      pinctrl-0 = <&pinctrl_usart4>;
>> +    };
>> +
>> +    usart2: serial@40004400 {
>> +      compatible = "st,stm32-uart";
>> +      reg = <0x40004400 0x400>;
>> +      interrupts = <38>;
>> +      clocks = <&clk_pclk1>;
>> +      st,hw-flow-ctrl;
>> +      pinctrl-names = "default";
>> +      pinctrl-0 = <&pinctrl_usart2 &pinctrl_usart2_rtscts>;
>> +    };
>> +
>>       usart1: serial@40011000 {
>>         compatible = "st,stm32-uart";
>>         reg = <0x40011000 0x400>;
>> -- 
>> 2.17.1
>>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
