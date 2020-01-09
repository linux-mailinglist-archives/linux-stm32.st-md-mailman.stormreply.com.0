Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0035713552C
	for <lists+linux-stm32@lfdr.de>; Thu,  9 Jan 2020 10:08:08 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8659BC36B0B;
	Thu,  9 Jan 2020 09:08:08 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8217EC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Jan 2020 09:08:03 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 009943ki002842; Thu, 9 Jan 2020 10:07:35 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=is6x6Xsavc4DrmaKIz9Vu39SoGM1pxSmkBDyOwyjfa0=;
 b=tljAdzLxNcuZNYbois3hdLfVjFYmM+a7XJR2qA4cbheXmLFBmwcvO4Tyd2PSUhPfrtUP
 dGkXZNfXXiMRik0oqLpd8MMkk8w2vph+qXFWX5RpZTzayz/MwKQUvtzaBUn9oB6DT/Xm
 fVEv5X/L+HfQinfv8d96XpjqpEwy/iu0DE07SVJbdbPA87ilcpoRnzVpAXrYHE5Ni44y
 DJi6tT4FeDBqo7qcL13pXZdGwr4mzsDAarBKJ4WnFg3E+4MH/wyWFxBwMPYr+oBUvd4n
 G3fWAxEmEzxBt2tq0Ajwg2Ez0Tt/KIWcBff3mLkHMpLMYIQAOsvVE1LNdaplPElsnl3P 1Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2xakm5rk43-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Jan 2020 10:07:35 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A573A10003B;
 Thu,  9 Jan 2020 10:07:32 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node3.st.com [10.75.127.9])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 84DD02A4D87;
 Thu,  9 Jan 2020 10:07:32 +0100 (CET)
Received: from SFHDAG5NODE3.st.com (10.75.127.15) by SFHDAG3NODE3.st.com
 (10.75.127.9) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Thu, 9 Jan
 2020 10:07:32 +0100
Received: from SFHDAG5NODE3.st.com ([fe80::7c09:5d6b:d2c7:5f47]) by
 SFHDAG5NODE3.st.com ([fe80::7c09:5d6b:d2c7:5f47%20]) with mapi id
 15.00.1473.003; Thu, 9 Jan 2020 10:07:32 +0100
From: Christophe ROULLIER <christophe.roullier@st.com>
To: Maxime Ripard <mripard@kernel.org>
Thread-Topic: [PATCH 1/2] dt-bindings: net: dwmac: increase 'maxItems' for
 'clocks', 'clock-names' properties
Thread-Index: AQHVljS9qESSyYnraEKgryyZ/0O5A6eL1WwAgFaFz4A=
Date: Thu, 9 Jan 2020 09:07:32 +0000
Message-ID: <009e8c0e-6a72-7e14-699e-8a897199ae16@st.com>
References: <20191108103526.22254-1-christophe.roullier@st.com>
 <20191108103526.22254-2-christophe.roullier@st.com>
 <20191108104231.GE4345@gilmour.lan>
 <f934df21-ac57-50ad-3e7b-b3b337daabe1@st.com>
 <20191115075008.GY4345@gilmour.lan>
In-Reply-To: <20191115075008.GY4345@gilmour.lan>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.51]
Content-ID: <23EE773BFEB22B40A7851F2EFDD3C50A@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-09_02:2020-01-08,
 2020-01-09 signatures=0
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "narmstrong@baylibre.com" <narmstrong@baylibre.com>,
 "martin.blumenstingl@googlemail.com" <martin.blumenstingl@googlemail.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 "alexandru.ardelean@analog.com" <alexandru.ardelean@analog.com>,
 "davem@davemloft.net" <davem@davemloft.net>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH 1/2] dt-bindings: net: dwmac: increase
 'maxItems' for 'clocks', 'clock-names' properties
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
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On 15/11/2019 08:50, Maxime Ripard wrote:
> On Fri, Nov 08, 2019 at 01:02:14PM +0000, Christophe ROULLIER wrote:
>> On 11/8/19 11:42 AM, Maxime Ripard wrote:
>>> Hi,
>>>
>>> On Fri, Nov 08, 2019 at 11:35:25AM +0100, Christophe Roullier wrote:
>>>> This change is needed for some soc based on snps,dwmac, which have
>>>> more than 3 clocks.
>>>>
>>>> Signed-off-by: Christophe Roullier <christophe.roullier@st.com>
>>>> ---
>>>>    Documentation/devicetree/bindings/net/snps,dwmac.yaml | 8 +++++++-
>>>>    1 file changed, 7 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/D=
ocumentation/devicetree/bindings/net/snps,dwmac.yaml
>>>> index 4845e29411e4..376a531062c2 100644
>>>> --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
>>>> +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
>>>> @@ -27,6 +27,7 @@ select:
>>>>              - snps,dwmac-3.710
>>>>              - snps,dwmac-4.00
>>>>              - snps,dwmac-4.10a
>>>> +          - snps,dwmac-4.20a
>>>>              - snps,dwxgmac
>>>>              - snps,dwxgmac-2.10
>>>>
>>>> @@ -62,6 +63,7 @@ properties:
>>>>            - snps,dwmac-3.710
>>>>            - snps,dwmac-4.00
>>>>            - snps,dwmac-4.10a
>>>> +        - snps,dwmac-4.20a
>>>>            - snps,dwxgmac
>>>>            - snps,dwxgmac-2.10
>>>>
>>>> @@ -87,7 +89,8 @@ properties:
>>>>
>>>>      clocks:
>>>>        minItems: 1
>>>> -    maxItems: 3
>>>> +    maxItems: 5
>>>> +    additionalItems: true
>>> Those additional clocks should be documented
>>>
>>> Maxime
>> Hi Maxime,
>>
>> The problem it is specific to our soc, so is it possible to
>>
>> propose "optional clock" for 2 extras clocks in snps,dwmac.yaml
>>
>> and "official" description in soc yaml file (stm32-dwmac.yaml) ?
>>
>>   =A0 clocks:
>>   =A0=A0=A0 minItems: 1
>>   =A0=A0=A0 maxItems: 5
>>   =A0=A0=A0 additionalItems: true
>>   =A0=A0=A0 items:
>>   =A0=A0=A0=A0=A0 - description: GMAC main clock
>>   =A0=A0=A0=A0=A0 - description: Peripheral registers interface clock
>>   =A0=A0=A0=A0=A0 - description:
>>   =A0=A0=A0=A0=A0=A0=A0=A0=A0 PTP reference clock. This clock is used fo=
r programming the
>>   =A0=A0=A0=A0=A0=A0=A0=A0=A0 Timestamp Addend Register. If not passed t=
hen the system
>>   =A0=A0=A0=A0=A0=A0=A0=A0=A0 clock will be used and this is fine on som=
e platforms.
>>
>> +=A0=A0=A0=A0=A0 - description: optional clock
>>
>> +=A0=A0=A0=A0=A0 - description: optional clock
> I guess we'd really need to figure out what those clocks are doing,
> they are probably helpful (and used, under a different name) by
> others.
>
> Hopefully the questions Rob asked will clear that out

Rob, do you have any ideas, suggestions ?

Thanks

> Maxime
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
