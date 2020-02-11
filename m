Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1880C159319
	for <lists+linux-stm32@lfdr.de>; Tue, 11 Feb 2020 16:24:39 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CDE83C36B0B;
	Tue, 11 Feb 2020 15:24:38 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BAC91C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Feb 2020 15:24:37 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01BFClE1006474; Tue, 11 Feb 2020 16:24:21 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=Ezoe/G+jJX5I3pY7QRbq/bcM4zPDwuqJPks4FpvMtAg=;
 b=LJQq/uiVV+asoDaiAIWJc4GnWWL1dMo86OQyN3S/EZepubJjjcFGw+/nO/8AwKkCz8Q8
 6jbAdWOtrTqk2wQN1FKPjpyiFHVO42Coaxy8UGb7jikQoJZf1B6Cxmzk2DbJF1Nnw5Yo
 gne+/y5LxnTcM1d/S5EGtdBc55790jTXh6krFOdWpEM++9AqxVoKoDrHspAhHTvXrcS8
 w3lGm+loV14d4GC2vnUVxtvuI98wU4jchGI4TwhiN3H243OjwK1YohlbULKLAneCEA0W
 vbT49ombzjku4t65J/VQ849dK2F1ooEZlDEsaB/1o3APzQmA+fEtN/TZkbhYHhvEFMLv /w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2y1urh68mj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 11 Feb 2020 16:24:21 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6353110003A;
 Tue, 11 Feb 2020 16:24:20 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2C9D12BEC69;
 Tue, 11 Feb 2020 16:24:20 +0100 (CET)
Received: from SFHDAG6NODE2.st.com (10.75.127.17) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Tue, 11 Feb
 2020 16:24:19 +0100
Received: from SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6]) by
 SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6%20]) with mapi id
 15.00.1347.000; Tue, 11 Feb 2020 16:24:19 +0100
From: Olivier MOYSAN <olivier.moysan@st.com>
To: Jonathan Cameron <jic23@kernel.org>
Thread-Topic: [PATCH 1/4] dt-bindings: iio: adc: sd modulator: add vref support
Thread-Index: AQHV3qHoiCGlg6dSeUqjiNMk6pDzMqgWEKCA
Date: Tue, 11 Feb 2020 15:24:19 +0000
Message-ID: <a2a738c1-4080-be91-a8bf-3aebe20b27f7@st.com>
References: <20200204101008.11411-1-olivier.moysan@st.com>
 <20200204101008.11411-2-olivier.moysan@st.com>
 <20200208160454.0f153bfb@archlinux>
In-Reply-To: <20200208160454.0f153bfb@archlinux>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.44]
Content-ID: <BB4AC24A2811754EA7AC0E65DB67844E@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-11_04:2020-02-10,
 2020-02-11 signatures=0
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "lars@metafoo.de" <lars@metafoo.de>,
 "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "pmeerw@pmeerw.net" <pmeerw@pmeerw.net>, "knaack.h@gmx.de" <knaack.h@gmx.de>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH 1/4] dt-bindings: iio: adc: sd modulator:
	add vref support
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

On 2/8/20 5:04 PM, Jonathan Cameron wrote:
> On Tue, 4 Feb 2020 11:10:05 +0100
> Olivier Moysan <olivier.moysan@st.com> wrote:
>
>> Add vref supply support to sigma delta modulator.
>>
>> Signed-off-by: Olivier Moysan <olivier.moysan@st.com>
>> ---
>>   .../devicetree/bindings/iio/adc/sigma-delta-modulator.yaml    | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/iio/adc/sigma-delta-modulator.yaml b/Documentation/devicetree/bindings/iio/adc/sigma-delta-modulator.yaml
>> index a390343d0c2a..2afe0765e971 100644
>> --- a/Documentation/devicetree/bindings/iio/adc/sigma-delta-modulator.yaml
>> +++ b/Documentation/devicetree/bindings/iio/adc/sigma-delta-modulator.yaml
>> @@ -8,6 +8,7 @@ title: Device-Tree bindings for sigma delta modulator
>>   
>>   maintainers:
>>     - Arnaud Pouliquen <arnaud.pouliquen@st.com>
>> +  - Olivier Moysan <olivier.moysan@st.com>
>>   
>>   properties:
>>     compatible:
>> @@ -21,6 +22,9 @@ properties:
>>     '#io-channel-cells':
>>       const: 0
>>   
>> +  vref-supply:
>> +    description: Phandle to the vref input analog reference voltage.
> I note this in review of patch 2 but in general I'm not sure we should
> be introducing this for generic devices.   It's fine if we have an
> explicit compatible but there is no reason to assume a generic sd-modulator
> uses an external reference.
>
> Jonathan
Ok, I will remove reference to external voltage for generic 
sd-modulator, in v2.
I will add it for ads1201 compatible, instead.

Thanks for your review
Olivier
>> +
>>   required:
>>     - compatible
>>     - '#io-channel-cells'
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
