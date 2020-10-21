Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E166294E9A
	for <lists+linux-stm32@lfdr.de>; Wed, 21 Oct 2020 16:24:27 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 18060C424B3;
	Wed, 21 Oct 2020 14:24:27 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 37D4BC3FAD5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Oct 2020 14:24:25 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09LEM35R032420; Wed, 21 Oct 2020 16:24:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=5W8utT3kmuoZEHHu3EI7BfGuu0kcDg/mhhNgyncNGJI=;
 b=CpP1lgYm4JjMnhSKHGz7Ip6Luy+rpnXqLb7o592JjyCPCh9Wdhd4JgHAFVCggdudoLlU
 jhv4fG0v3X3OeVkXlY8snXVsv1QtA2L7+ulf7qxb8pkyJdy4MHtLTLDtmr7p1m4BSo59
 TJ7anUs0r1npmkFWuCV4/kqQx9IHV2oUaip1u5Kqg9cRPOkADmrM2+EyPnWyeOv9vDpr
 4eH2Hqdhfs5AUcegDmGiLtUYX81/x6vc3Oc+xdW4jFWrtuIjSP1ICIpE8QT7ScDyJwcV
 SMZKs5dwXZzxdSMGYk9Sk0aUjeN945n1YbwAbs73gQ7X+5Y1EY6VjCoSHBZqF19KtGVE ww== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34apedg3np-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 Oct 2020 16:24:10 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 29BE410002A;
 Wed, 21 Oct 2020 16:24:09 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EF1082C758D;
 Wed, 21 Oct 2020 16:24:08 +0200 (CEST)
Received: from SFHDAG1NODE1.st.com (10.75.127.1) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 21 Oct
 2020 16:24:08 +0200
Received: from SFHDAG1NODE1.st.com ([fe80::91:9840:ca1f:420f]) by
 SFHDAG1NODE1.st.com ([fe80::91:9840:ca1f:420f%20]) with mapi id
 15.00.1473.003; Wed, 21 Oct 2020 16:24:08 +0200
From: Hugues FRUCHET <hugues.fruchet@st.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Thread-Topic: [PATCH v4 2/2] media: dt-bindings: media: st,stm32-dcmi: Add
 support of BT656
Thread-Index: AQHWp6o+yOOEjcdb0U+f2PjTKsCmiqmh+tEA
Date: Wed, 21 Oct 2020 14:24:08 +0000
Message-ID: <657634eb-690a-53a6-2ac1-de3c06a1cec4@st.com>
References: <1603188889-23664-1-git-send-email-hugues.fruchet@st.com>
 <1603188889-23664-3-git-send-email-hugues.fruchet@st.com>
 <20201021130033.GI2703@paasikivi.fi.intel.com>
In-Reply-To: <20201021130033.GI2703@paasikivi.fi.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.45]
Content-ID: <333325C122772E4489157C905ABF9912@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.737
 definitions=2020-10-21_06:2020-10-20,
 2020-10-21 signatures=0
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Hans Verkuil <hverkuil@xs4all.nl>, Alain VOLMAT <alain.volmat@st.com>,
 Rob Herring <robh+dt@kernel.org>, Yannick FERTRE <yannick.fertre@st.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: Re: [Linux-stm32] [PATCH v4 2/2] media: dt-bindings: media: st,
 stm32-dcmi: Add support of BT656
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

Hi Sakari,

On 10/21/20 3:00 PM, Sakari Ailus wrote:
> Hi Hugues,
> 
> On Tue, Oct 20, 2020 at 12:14:49PM +0200, Hugues Fruchet wrote:
>> Add support of BT656 parallel bus mode in DCMI.
>> This mode is enabled when hsync-active & vsync-active
>> fields are not specified.
>>
>> Signed-off-by: Hugues Fruchet <hugues.fruchet@st.com>
>> ---
>>   .../devicetree/bindings/media/st,stm32-dcmi.yaml   | 30 ++++++++++++++++++++++
>>   1 file changed, 30 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml b/Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml
>> index 3fe778c..1ee521a 100644
>> --- a/Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml
>> +++ b/Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml
>> @@ -44,6 +44,36 @@ properties:
>>         bindings defined in
>>         Documentation/devicetree/bindings/media/video-interfaces.txt.
>>   
>> +    properties:
>> +      endpoint:
>> +        type: object
>> +
>> +        properties:
>> +          bus-width: true
>> +
>> +          hsync-active:
>> +            description:
>> +              If both HSYNC and VSYNC polarities are not specified, BT656
>> +              embedded synchronization is selected.
>> +            default: 0
>> +
>> +          vsync-active:
>> +            description:
>> +              If both HSYNC and VSYNC polarities are not specified, BT656
>> +              embedded synchronization is selected.
>> +            default: 0
> 
> Should I understand this as if the polarities were not specified, BT.656
> will be used?

Yes, this is what is documented in video-interfaces.txt:
"
   Note, that if HSYNC and VSYNC polarities are not specified, embedded
   synchronization may be required, where supported.
"
and
"
				/* If hsync-active/vsync-active are missing,
				   embedded BT.656 sync is used */
				hsync-active = <0>;	/* Active low */
				vsync-active = <0>;	/* Active low */
"
and I found also this in 
Documentation/devicetree/bindings/media/renesas,vin.yaml
"
           hsync-active:
             description:
               If both HSYNC and VSYNC polarities are not specified, 
embedded
               synchronization is selected.
             default: 1

           vsync-active:
             description:
               If both HSYNC and VSYNC polarities are not specified, 
embedded
               synchronization is selected.
             default: 1
"

In the other hand I've found few occurences of "bus-type" 
(marvell,mmp2-ccic.yaml), it is why I asked you if "bus-type" is the new 
way to go versus previous way to signal BT656 (without hsync/vsync) ?
As explained previously, I prefer this last way for backward compatibility.


The bindings previously documented BT.601 (parallel) only, so
> it was somewhat ambigious to begin with. Is there a risk of interpreting
> old BT.601 bindings as BT.656?
I don't think so.

With bus-type property, I believe you could
> avoid at least that risk.
yes but as explained, I'll prefer not to amend current boards device 
tree files.

> 
> Also not specifying at least one of the default values leads to BT.656
> without bus-type. That could be addressed by removing the defaults.
> 
I'm new to yaml, I've taken that from renesas,vin.yaml. Should I just 
drop the "default: 1" lines ?

>> +
>> +          pclk-sample: true
>> +
>> +          remote-endpoint: true
>> +
>> +        required:
>> +          - remote-endpoint
>> +
>> +        additionalProperties: false
>> +
>> +    additionalProperties: false
>> +
>>   required:
>>     - compatible
>>     - reg
> 

BR,
Hugues.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
