Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 08F41F4C4A
	for <lists+linux-stm32@lfdr.de>; Fri,  8 Nov 2019 14:02:41 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8FF67C36B0B;
	Fri,  8 Nov 2019 13:02:40 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B2CDBC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  8 Nov 2019 13:02:38 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xA8D1tQv019203; Fri, 8 Nov 2019 14:02:15 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=WOEu20nR0i4xRSiZf53WXogNt8wyvzvdiHSB58BEZaY=;
 b=Twy3xq/J78m2GKUL7TQSQjyWs+R+K39EqeKWroBU2aDiseZJMmNvT8BM4PGMG7y1h2uX
 P5gHZtJtXLx3yUbnAimdEnCyowD5rige5Fb/6JssRcKE0KCXyxpL37sIG27zoORNhYKX
 py3Rn/Om7hDf+LRh67Vf7Nzo71XzRjvWNQUOdlW1Hixjaob4RpQMP5U/gizvYW7SlxFM
 VmBnSpzIf6W8E1z/2NeKWQtJiA5KJIBBKIPXhUn0PSy3KhfvIax13AQF/w0H1wnGahs4
 YAwEPXAPBqqWL8F3CNlkI/kpJWe62+GDn5gnyBAtVYxUkqqiUAKH7pWtFg4l7MltL8fq 6Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2w41vd3kmx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 08 Nov 2019 14:02:15 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 223DF10003A;
 Fri,  8 Nov 2019 14:02:15 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 068212B7DEF;
 Fri,  8 Nov 2019 14:02:15 +0100 (CET)
Received: from SFHDAG5NODE3.st.com (10.75.127.15) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Fri, 8 Nov
 2019 14:02:14 +0100
Received: from SFHDAG5NODE3.st.com ([fe80::7c09:5d6b:d2c7:5f47]) by
 SFHDAG5NODE3.st.com ([fe80::7c09:5d6b:d2c7:5f47%20]) with mapi id
 15.00.1473.003; Fri, 8 Nov 2019 14:02:14 +0100
From: Christophe ROULLIER <christophe.roullier@st.com>
To: Maxime Ripard <mripard@kernel.org>
Thread-Topic: [PATCH 1/2] dt-bindings: net: dwmac: increase 'maxItems' for
 'clocks', 'clock-names' properties
Thread-Index: AQHVljS9qESSyYnraEKgryyZ/0O5Aw==
Date: Fri, 8 Nov 2019 13:02:14 +0000
Message-ID: <f934df21-ac57-50ad-3e7b-b3b337daabe1@st.com>
References: <20191108103526.22254-1-christophe.roullier@st.com>
 <20191108103526.22254-2-christophe.roullier@st.com>
 <20191108104231.GE4345@gilmour.lan>
In-Reply-To: <20191108104231.GE4345@gilmour.lan>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.45]
Content-ID: <24D71ECBC6C48E469CDC8390CA3DFA02@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-08_03:2019-11-08,2019-11-08 signatures=0
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

On 11/8/19 11:42 AM, Maxime Ripard wrote:
> Hi,
>
> On Fri, Nov 08, 2019 at 11:35:25AM +0100, Christophe Roullier wrote:
>> This change is needed for some soc based on snps,dwmac, which have
>> more than 3 clocks.
>>
>> Signed-off-by: Christophe Roullier <christophe.roullier@st.com>
>> ---
>>   Documentation/devicetree/bindings/net/snps,dwmac.yaml | 8 +++++++-
>>   1 file changed, 7 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Doc=
umentation/devicetree/bindings/net/snps,dwmac.yaml
>> index 4845e29411e4..376a531062c2 100644
>> --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
>> +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
>> @@ -27,6 +27,7 @@ select:
>>             - snps,dwmac-3.710
>>             - snps,dwmac-4.00
>>             - snps,dwmac-4.10a
>> +          - snps,dwmac-4.20a
>>             - snps,dwxgmac
>>             - snps,dwxgmac-2.10
>>
>> @@ -62,6 +63,7 @@ properties:
>>           - snps,dwmac-3.710
>>           - snps,dwmac-4.00
>>           - snps,dwmac-4.10a
>> +        - snps,dwmac-4.20a
>>           - snps,dwxgmac
>>           - snps,dwxgmac-2.10
>>
>> @@ -87,7 +89,8 @@ properties:
>>
>>     clocks:
>>       minItems: 1
>> -    maxItems: 3
>> +    maxItems: 5
>> +    additionalItems: true
> Those additional clocks should be documented
>
> Maxime

Hi Maxime,

The problem it is specific to our soc, so is it possible to

propose "optional clock" for 2 extras clocks in snps,dwmac.yaml

and "official" description in soc yaml file (stm32-dwmac.yaml) ?

 =A0 clocks:
 =A0=A0=A0 minItems: 1
 =A0=A0=A0 maxItems: 5
 =A0=A0=A0 additionalItems: true
 =A0=A0=A0 items:
 =A0=A0=A0=A0=A0 - description: GMAC main clock
 =A0=A0=A0=A0=A0 - description: Peripheral registers interface clock
 =A0=A0=A0=A0=A0 - description:
 =A0=A0=A0=A0=A0=A0=A0=A0=A0 PTP reference clock. This clock is used for pr=
ogramming the
 =A0=A0=A0=A0=A0=A0=A0=A0=A0 Timestamp Addend Register. If not passed then =
the system
 =A0=A0=A0=A0=A0=A0=A0=A0=A0 clock will be used and this is fine on some pl=
atforms.

+=A0=A0=A0=A0=A0 - description: optional clock

+=A0=A0=A0=A0=A0 - description: optional clock

Thanks

Christophe
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
