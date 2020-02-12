Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1206015AE2A
	for <lists+linux-stm32@lfdr.de>; Wed, 12 Feb 2020 18:08:14 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AF420C36B0B;
	Wed, 12 Feb 2020 17:08:13 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 13A3CC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Feb 2020 17:08:12 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01CGwfID011572; Wed, 12 Feb 2020 18:07:52 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=xrbRWyg0D4q5eEPIH0r1B8C3kSO9phO+KLwzSaQYec4=;
 b=yHLVovXExQw1APYQpnN4nqcUrSA/3LPowdOd4HSTE07PC3N96Dabw4dK0gRR3qyFQdHe
 ifMQsURbHly4TcE/aXbuc2cfjRVVvc0dS6ZtmiiXwZyPGUMRK0Krn9zxBAUCm78WceiL
 aTORRBymFHqI0+RGu+wviMIm1/0HPLPvgL0Id79/yZDpzo/09k+uqrXoryIM7PA1jcfs
 p1hssJkHeNOX0Koiqf+Utb6iJrpukBloH1DDmaAzR7xUciXazuJjaHzKBZGdBSqbAyN9
 Va7lUZ9eRQXaF4JwecL4LdJIOYOmWd9Ok2UMwfhxBC3bPgmc4GR7pZ5x4vmncPHUcaEc NA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2y1urhftnv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Feb 2020 18:07:52 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7FA6310002A;
 Wed, 12 Feb 2020 18:07:50 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7BE852BF9C4;
 Wed, 12 Feb 2020 18:07:50 +0100 (CET)
Received: from SFHDAG3NODE3.st.com (10.75.127.9) by SFHDAG3NODE1.st.com
 (10.75.127.7) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 12 Feb
 2020 18:07:49 +0100
Received: from SFHDAG3NODE3.st.com ([fe80::3507:b372:7648:476]) by
 SFHDAG3NODE3.st.com ([fe80::3507:b372:7648:476%20]) with mapi id
 15.00.1347.000; Wed, 12 Feb 2020 18:07:49 +0100
From: Benjamin GAIGNARD <benjamin.gaignard@st.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Thread-Topic: [PATCH v3 1/2] dt-bindings: mfd: Document STM32 low power
 clkevent bindings
Thread-Index: AQHV1dN1SufRLAitBUGp4OAGtW3SUqgXzN0AgAAEoIA=
Date: Wed, 12 Feb 2020 17:07:49 +0000
Message-ID: <f25fc32a-7131-6b78-5bf2-d2028e74820e@st.com>
References: <20200128120702.26166-1-benjamin.gaignard@st.com>
 <20200128120702.26166-2-benjamin.gaignard@st.com>
 <20200212165116.GA2949@linaro.org>
In-Reply-To: <20200212165116.GA2949@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.47]
Content-ID: <C493ABCE6CA6CB4FB177F0711786531B@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-12_08:2020-02-12,
 2020-02-12 signatures=0
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
 "linux@armlinux.org.uk" <linux@armlinux.org.uk>,
 Pascal PAILLET-LME <p.paillet@st.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 Fabrice GASNIER <fabrice.gasnier@st.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH v3 1/2] dt-bindings: mfd: Document STM32
 low power clkevent bindings
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


On 2/12/20 5:51 PM, Daniel Lezcano wrote:
> On Tue, Jan 28, 2020 at 01:07:01PM +0100, Benjamin Gaignard wrote:
>> Add a subnode to STM low power timer bindings to support clkevent driver
> clkevent is Linux specific.
Does 'event' or 'broadcast' would sound better ?
>
>> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
>> ---
>>   .../devicetree/bindings/mfd/st,stm32-lptimer.yaml          | 14 ++++++++++++++
>>   1 file changed, 14 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/mfd/st,stm32-lptimer.yaml b/Documentation/devicetree/bindings/mfd/st,stm32-lptimer.yaml
>> index 1a4cc5f3fb33..535e0b40cdf9 100644
>> --- a/Documentation/devicetree/bindings/mfd/st,stm32-lptimer.yaml
>> +++ b/Documentation/devicetree/bindings/mfd/st,stm32-lptimer.yaml
>> @@ -81,6 +81,16 @@ patternProperties:
>>       required:
>>         - compatible
>>   
>> +  clkevent:
>> +    type: object
>> +
>> +    properties:
>> +      compatible:
>> +        const: st,stm32-clkevent-lp
>> +
>> +    required:
>> +      - compatible
>> +
>>   required:
>>     - "#address-cells"
>>     - "#size-cells"
>> @@ -115,6 +125,10 @@ examples:
>>         counter {
>>           compatible = "st,stm32-lptimer-counter";
>>         };
>> +
>> +      clkevent {
>> +        compatible = "st,stm32-clkevent-lp";
>> +      };
>>       };
>>   
>>   ...
>> -- 
>> 2.15.0
>>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
