Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 50470225BD5
	for <lists+linux-stm32@lfdr.de>; Mon, 20 Jul 2020 11:38:42 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0C6E6C36B2A;
	Mon, 20 Jul 2020 09:38:42 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1F23BC36B27
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Jul 2020 09:38:41 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06K9MgFI017123; Mon, 20 Jul 2020 11:38:31 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=lC/LymgalsLxxn7CqvsDbLQJCr894y+aoN1Rm4+7KFI=;
 b=B2lHbtZgdj+u9WxQ68HEI/gS7/Z6eRdJaSi0mfGaOMbatZ1z9rMWQWn4GzR0qeO50ycY
 TiUjpfpwqmTMnc9JOFHouSKPbThhLA50opdyH507nGH0RLC1FLJtACNSznORxknYSY2i
 fLj3ACREU2o1kKxTYNft5iLv0mGJEWWtKB2UO4wlTPvO6U3UE/RKWDQqWUMfnmXIhz5u
 0npGd1vsXUjyFiWFfyWM8eEo5LhQuK7i7yoMEm4Z1WMenrye9nY1Mxxf4VrN82557cUs
 eEtCazhSqDwD3civFpNN0lVi49nZ28VbghP657uXePejNwTBJSsGrppIeJvCSbj5U40e eA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 32bsagr125-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Jul 2020 11:38:31 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C6925100034;
 Mon, 20 Jul 2020 11:38:30 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A7FE82B3E71;
 Mon, 20 Jul 2020 11:38:30 +0200 (CEST)
Received: from SFHDAG3NODE3.st.com (10.75.127.9) by SFHDAG3NODE1.st.com
 (10.75.127.7) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 20 Jul
 2020 11:38:30 +0200
Received: from SFHDAG3NODE3.st.com ([fe80::3507:b372:7648:476]) by
 SFHDAG3NODE3.st.com ([fe80::3507:b372:7648:476%20]) with mapi id
 15.00.1347.000; Mon, 20 Jul 2020 11:38:30 +0200
From: Benjamin GAIGNARD <benjamin.gaignard@st.com>
To: Rob Herring <robh@kernel.org>
Thread-Topic: [PATCH v7 1/3] dt-bindings: media: stm32-dcmi: Add DCMI min
 frequency property
Thread-Index: AQHWT6e/b2wyFUUnLkaf//MXpHPgJqj/oKMAgAC3YwCAANDPAIAPCWCA
Date: Mon, 20 Jul 2020 09:38:30 +0000
Message-ID: <fee98476-c92c-579a-ac33-323a5f5feb76@st.com>
References: <20200701130129.30961-1-benjamin.gaignard@st.com>
 <20200701130129.30961-2-benjamin.gaignard@st.com>
 <20200709203718.GA837160@bogus> <20e4907a-f218-3e43-1111-7d4b9ee6d945@st.com>
 <CAL_Jsq+VgXTJy1SQr6B63kLZ3wcRMe4YfYiRNCT6s=gUO_tmTw@mail.gmail.com>
In-Reply-To: <CAL_Jsq+VgXTJy1SQr6B63kLZ3wcRMe4YfYiRNCT6s=gUO_tmTw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.51]
Content-ID: <E726284C4B29AA4DA03C09973C9F53CF@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-20_05:2020-07-17,
 2020-07-20 signatures=0
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



On 7/10/20 10:01 PM, Rob Herring wrote:
> On Fri, Jul 10, 2020 at 1:33 AM Benjamin GAIGNARD
> <benjamin.gaignard@st.com> wrote:
>>
>>
>> On 7/9/20 10:37 PM, Rob Herring wrote:
>>> On Wed, Jul 01, 2020 at 03:01:27PM +0200, Benjamin Gaignard wrote:
>>>> Document st,stm32-dcmi-min-frequency property which is used to
>>>> request CPUs minimum frequency when streaming frames.
>>>>
>>>> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
>>>> ---
>>>>    Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml | 8 ++++++++
>>>>    1 file changed, 8 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml b/Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml
>>>> index 3fe778cb5cc3..05ca85a2411a 100644
>>>> --- a/Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml
>>>> +++ b/Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml
>>>> @@ -44,6 +44,13 @@ properties:
>>>>          bindings defined in
>>>>          Documentation/devicetree/bindings/media/video-interfaces.txt.
>>>>
>>>> +  st,stm32-dcmi-min-frequency:
>>>> +    description: DCMI minimum CPUs frequency requirement (in KHz).
>>>> +    allOf:
>>>> +      - $ref: /schemas/types.yaml#/definitions/uint32
>>>> +      - minimum: 0
>>>> +      - default: 0
>>> I think this is questionable to be in DT and if it is, it's something
>>> that's hardly specific to ST or this block. IIRC, we already have a way
>>> to specify minimum OPPs.
>> This binding is only needed on some STM32 SoC when DVFS is activated
>> with low frequency setting in opp. The value also depends of the targeted
>> video format and framerate.
> As those 2 things are not in the DT, then neither should this value be.
>
>> It is not an opp because it doesn't define a voltage-current-frequency
>> combination
>> but only set a minimum target for the CPUs frequency to guaranty a good
>> reaction
>> time when handling IRQs for the sensor.
> OPPs can be frequency only. This is pretty clearly defining the CPU
> must Operate at a certain minimum Performance Point.
Hi Rob,

My goal here wasn't to define an OPP for the CPU since it is the camera 
interface node
but to avoid let the CPU go to down.
I haven't found how to use OPP bindings, can you provide me hints or 
examples of how
I should do it?

Thanks,
Benjamin

>
> Rob
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
