Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E1C5321B03E
	for <lists+linux-stm32@lfdr.de>; Fri, 10 Jul 2020 09:33:55 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 915D9C36B2A;
	Fri, 10 Jul 2020 07:33:55 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E14C7C36B0C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Jul 2020 07:33:52 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06A7UbKC028830; Fri, 10 Jul 2020 09:33:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=nYpYw1UIr0i69d2MbqdY53TAeYo3yA3M+T5eY/nD4Vw=;
 b=TQoNd8RKNS3gU5A/56y5luF7iQO+5LKmIvGPhsfcmZHyaogi4vxrruupgAyZxN+3RE9P
 pJ8SeQhOUMbJ9TsIPjRPcfhpIroG+DBL+oZO9Egb2+ehzM8L3VmYRWPiLUEEB5QMzBQU
 0z34U+Yy9ByiGS9wnZe+CumGHUaVPiqTg0Iyz+YAcaLjNwwpB7tXbpd+yYGBXcub7fJG
 ODXeVWtjFjxyiPCQyzJlYv7W+5EgDWBi0qZWLP4FI7SIqeJjlQuW30jm9vzYCVokLFLi
 sZJSpWra/Z8j9au2LaYcFu90wZfwyLTQIJqgdajpfb168DIwr4JjPbAAsFeavdr3U/oU 7A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 325k409kh2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Jul 2020 09:33:41 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 43017100038;
 Fri, 10 Jul 2020 09:33:41 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag5node2.st.com [10.75.127.14])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2B6422A5AFE;
 Fri, 10 Jul 2020 09:33:41 +0200 (CEST)
Received: from SFHDAG3NODE3.st.com (10.75.127.9) by SFHDAG5NODE2.st.com
 (10.75.127.14) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 10 Jul
 2020 09:33:40 +0200
Received: from SFHDAG3NODE3.st.com ([fe80::3507:b372:7648:476]) by
 SFHDAG3NODE3.st.com ([fe80::3507:b372:7648:476%20]) with mapi id
 15.00.1347.000; Fri, 10 Jul 2020 09:33:40 +0200
From: Benjamin GAIGNARD <benjamin.gaignard@st.com>
To: Rob Herring <robh@kernel.org>
Thread-Topic: [PATCH v7 1/3] dt-bindings: media: stm32-dcmi: Add DCMI min
 frequency property
Thread-Index: AQHWT6e/b2wyFUUnLkaf//MXpHPgJqj/oKMAgAC3YwA=
Date: Fri, 10 Jul 2020 07:33:40 +0000
Message-ID: <20e4907a-f218-3e43-1111-7d4b9ee6d945@st.com>
References: <20200701130129.30961-1-benjamin.gaignard@st.com>
 <20200701130129.30961-2-benjamin.gaignard@st.com>
 <20200709203718.GA837160@bogus>
In-Reply-To: <20200709203718.GA837160@bogus>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.47]
Content-ID: <92383D3D1055FD4C836FEA238A220FF5@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-10_02:2020-07-10,
 2020-07-10 signatures=0
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "vincent.guittot@linaro.org" <vincent.guittot@linaro.org>,
 "rjw@rjwysocki.net" <rjw@rjwysocki.net>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "valentin.schneider@arm.com" <valentin.schneider@arm.com>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 "mchehab@kernel.org" <mchehab@kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: Re: [Linux-stm32] [PATCH v7 1/3] dt-bindings: media: stm32-dcmi:
 Add DCMI min frequency property
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



On 7/9/20 10:37 PM, Rob Herring wrote:
> On Wed, Jul 01, 2020 at 03:01:27PM +0200, Benjamin Gaignard wrote:
>> Document st,stm32-dcmi-min-frequency property which is used to
>> request CPUs minimum frequency when streaming frames.
>>
>> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
>> ---
>>   Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml | 8 ++++++++
>>   1 file changed, 8 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml b/Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml
>> index 3fe778cb5cc3..05ca85a2411a 100644
>> --- a/Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml
>> +++ b/Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml
>> @@ -44,6 +44,13 @@ properties:
>>         bindings defined in
>>         Documentation/devicetree/bindings/media/video-interfaces.txt.
>>   
>> +  st,stm32-dcmi-min-frequency:
>> +    description: DCMI minimum CPUs frequency requirement (in KHz).
>> +    allOf:
>> +      - $ref: /schemas/types.yaml#/definitions/uint32
>> +      - minimum: 0
>> +      - default: 0
> I think this is questionable to be in DT and if it is, it's something
> that's hardly specific to ST or this block. IIRC, we already have a way
> to specify minimum OPPs.
This binding is only needed on some STM32 SoC when DVFS is activated
with low frequency setting in opp. The value also depends of the targeted
video format and framerate.

It is not an opp because it doesn't define a voltage-current-frequency 
combination
but only set a minimum target for the CPUs frequency to guaranty a good 
reaction
time when handling IRQs for the sensor.

Benjamin
>
> Rob
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
