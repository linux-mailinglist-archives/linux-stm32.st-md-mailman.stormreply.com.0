Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B718296135
	for <lists+linux-stm32@lfdr.de>; Thu, 22 Oct 2020 16:57:36 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D3768C424B3;
	Thu, 22 Oct 2020 14:57:35 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 54B58C36B37
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 22 Oct 2020 14:57:32 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09MEbIXu028547; Thu, 22 Oct 2020 16:56:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=BgPhbdVYlDxny8ooH2Pb459HocXmAZYh2XHNIPCGBRM=;
 b=zDu/u4116QgnTcyvRbmk9ZkDAg0EUALgwD3JsF+tr/WMEZrREP2eSQ3CKs6tArB6o3AT
 ckM4pFPSzILSpaIDoVyYOnNCekSD8ZTq+EUqcC/9RBkOZ6A/r4J4Ke0cj1lS6ez8ACO9
 r9PV5pJtjjo2HzKiMhLsAS0E8E2gAxceVg6WHps/hcehN+ayaA+jhKrYHsyYwtRAmEZo
 0HWUNiYpgUFfSm1zSrswujh0BvqI6q/qwgAgIml2Ld59ZLhBu9lqKzGPqpFiYTxRMAqj
 MPjh0LYUeFmnG2EsfWbXtuqbe8yihlUCip1jyM3gnSsNdA2LYY3lBsAdCUjmEX0Gv0I4 BQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34apeeqbs6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Oct 2020 16:56:18 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D533C10002A;
 Thu, 22 Oct 2020 16:56:17 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B883A2C7115;
 Thu, 22 Oct 2020 16:56:17 +0200 (CEST)
Received: from SFHDAG1NODE1.st.com (10.75.127.1) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 22 Oct
 2020 16:56:17 +0200
Received: from SFHDAG1NODE1.st.com ([fe80::91:9840:ca1f:420f]) by
 SFHDAG1NODE1.st.com ([fe80::91:9840:ca1f:420f%20]) with mapi id
 15.00.1473.003; Thu, 22 Oct 2020 16:56:17 +0200
From: Hugues FRUCHET <hugues.fruchet@st.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, Jacopo Mondi
 <jacopo@jmondi.org>
Thread-Topic: [PATCH v4 2/2] media: dt-bindings: media: st,stm32-dcmi: Add
 support of BT656
Thread-Index: AQHWp6o+yOOEjcdb0U+f2PjTKsCmiqmh+tEAgAB6DACAASFDAA==
Date: Thu, 22 Oct 2020 14:56:17 +0000
Message-ID: <327ae9d5-8683-488f-7970-4983e2fec51d@st.com>
References: <1603188889-23664-1-git-send-email-hugues.fruchet@st.com>
 <1603188889-23664-3-git-send-email-hugues.fruchet@st.com>
 <20201021130033.GI2703@paasikivi.fi.intel.com>
 <657634eb-690a-53a6-2ac1-de3c06a1cec4@st.com>
 <20201021214058.GJ2703@paasikivi.fi.intel.com>
In-Reply-To: <20201021214058.GJ2703@paasikivi.fi.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.48]
Content-ID: <D97D13016BC89E40AD0D4EC4C251C049@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.737
 definitions=2020-10-22_10:2020-10-20,
 2020-10-22 signatures=0
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

+ Jacopo for his work on ov772x binding related to BT656

On 10/21/20 11:40 PM, Sakari Ailus wrote:
> Hi Hugues,
> 
> On Wed, Oct 21, 2020 at 02:24:08PM +0000, Hugues FRUCHET wrote:
>> Hi Sakari,
>>
>> On 10/21/20 3:00 PM, Sakari Ailus wrote:
>>> Hi Hugues,
>>>
>>> On Tue, Oct 20, 2020 at 12:14:49PM +0200, Hugues Fruchet wrote:
>>>> Add support of BT656 parallel bus mode in DCMI.
>>>> This mode is enabled when hsync-active & vsync-active
>>>> fields are not specified.
>>>>
>>>> Signed-off-by: Hugues Fruchet <hugues.fruchet@st.com>
>>>> ---
>>>>    .../devicetree/bindings/media/st,stm32-dcmi.yaml   | 30 ++++++++++++++++++++++
>>>>    1 file changed, 30 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml b/Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml
>>>> index 3fe778c..1ee521a 100644
>>>> --- a/Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml
>>>> +++ b/Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml
>>>> @@ -44,6 +44,36 @@ properties:
>>>>          bindings defined in
>>>>          Documentation/devicetree/bindings/media/video-interfaces.txt.
>>>>    
>>>> +    properties:
>>>> +      endpoint:
>>>> +        type: object
>>>> +
>>>> +        properties:
>>>> +          bus-width: true
>>>> +
>>>> +          hsync-active:
>>>> +            description:
>>>> +              If both HSYNC and VSYNC polarities are not specified, BT656
>>>> +              embedded synchronization is selected.
>>>> +            default: 0
>>>> +
>>>> +          vsync-active:
>>>> +            description:
>>>> +              If both HSYNC and VSYNC polarities are not specified, BT656
>>>> +              embedded synchronization is selected.
>>>> +            default: 0
>>>
>>> Should I understand this as if the polarities were not specified, BT.656
>>> will be used?
>>
>> Yes, this is what is documented in video-interfaces.txt:
>> "
>>     Note, that if HSYNC and VSYNC polarities are not specified, embedded
>>     synchronization may be required, where supported.
>> "
>> and
>> "
>> 				/* If hsync-active/vsync-active are missing,
>> 				   embedded BT.656 sync is used */
>> 				hsync-active = <0>;	/* Active low */
>> 				vsync-active = <0>;	/* Active low */
>> "
>> and I found also this in
>> Documentation/devicetree/bindings/media/renesas,vin.yaml
>> "
>>             hsync-active:
>>               description:
>>                 If both HSYNC and VSYNC polarities are not specified,
>> embedded
>>                 synchronization is selected.
>>               default: 1
>>
>>             vsync-active:
>>               description:
>>                 If both HSYNC and VSYNC polarities are not specified,
>> embedded
>>                 synchronization is selected.
>>               default: 1
> 
> Having the defaults leads to somewhat weird behaviour: specifying the
> default value on either property changes the bus type.
> 
>> "
>>
>> In the other hand I've found few occurences of "bus-type"
>> (marvell,mmp2-ccic.yaml), it is why I asked you if "bus-type" is the new
>> way to go versus previous way to signal BT656 (without hsync/vsync) ?
>> As explained previously, I prefer this last way for backward compatibility.
> 
> If you have a default for bus-type (BT.601), this won't be a problem.
> 
> The old DT bindings were somewhat, well, opportunistic. The v4l2-of
> framework-let did its best and sometimes it worked. The behaviour is still
> supported but not encouraged in new bindings.
> 

OK, so let's go for the new way.
I've found an interesting patch from Jacopo that is of great help:
https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20200910162055.614089-4-jacopo+renesas@jmondi.org/

Here is a draft proposal before I push a new version, please comment:

         properties:
           bus-type:
             enum: [5, 6]
             default: 5

           bus-width:
             enum: [8, 10, 12, 14]
             default: 8

           hsync-active:
             enum: [0, 1]
             default: 0

           vsync-active:
             enum: [0, 1]
             default: 0

           pclk-sample:
             enum: [0, 1]
             default: 0

           remote-endpoint: true

         allOf:
           - if:
               properties:
                 bus-type:
                   const: 6
             then:
               properties:
                 hsync-active: false
                 vsync-active: false
                 bus-width:
                   enum: [8]

         required:
           - remote-endpoint

         unevaluatedProperties: false


Unfortunately, the "default: 5" for bus-type is not working !!
If we don't specify "bus-type" in example, dt_binding_check is failing 
as if default was 6, it's hardly understandable (see below) !
         port {
              dcmi_0: endpoint {
                    remote-endpoint = <&ov5640_0>;
                    bus-width = <10>;
                    hsync-active = <0>;
                    vsync-active = <0>;
                    pclk-sample = <1>;
              };
=> this should be OK but error claimed:
   DTC 
Documentation/devicetree/bindings/media/st,stm32-dcmi.example.dt.yaml
   CHECK 
Documentation/devicetree/bindings/media/st,stm32-dcmi.example.dt.yaml
Documentation/devicetree/bindings/media/st,stm32-dcmi.example.dt.yaml: 
dcmi@4c006000: port:endpoint:vsync-active: False schema does not allow [[0]]
dcmi@4c006000: port:endpoint:hsync-active: False schema does not allow [[0]]
dcmi@4c006000: port:endpoint:bus-width:0:0: 10 is not one of [8]
	From schema: Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml

=> if "bus-type" is explicitly set to 5, all is fine (see below) !
         port {
              dcmi_0: endpoint {
                    remote-endpoint = <&ov5640_0>;
                    bus-type = <5>;
                    bus-width = <10>;
                    hsync-active = <0>;
                    vsync-active = <0>;
                    pclk-sample = <1>;
              };
         };

  DTC 
Documentation/devicetree/bindings/media/st,stm32-dcmi.example.dt.yaml
   CHECK 
Documentation/devicetree/bindings/media/st,stm32-dcmi.example.dt.yaml
~/.../media_tree$


>>
>>
>> The bindings previously documented BT.601 (parallel) only, so
>>> it was somewhat ambigious to begin with. Is there a risk of interpreting
>>> old BT.601 bindings as BT.656?
>> I don't think so.
>>
>> With bus-type property, I believe you could
>>> avoid at least that risk.
>> yes but as explained, I'll prefer not to amend current boards device
>> tree files.
> 
> I don't think it matters from this point of view --- you can have a
> default bus-type.
> 
>>
>>>
>>> Also not specifying at least one of the default values leads to BT.656
>>> without bus-type. That could be addressed by removing the defaults.
>>>
>> I'm new to yaml, I've taken that from renesas,vin.yaml. Should I just
>> drop the "default: 1" lines ?
> 
> That's one option, yes. Then you have to have those for BT.601 and it's no
> longer ambiguous.
> 

BR,
Hugues.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
