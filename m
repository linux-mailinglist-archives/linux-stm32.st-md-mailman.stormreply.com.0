Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C7EE92759FF
	for <lists+linux-stm32@lfdr.de>; Wed, 23 Sep 2020 16:30:24 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6ED65C3FAD5;
	Wed, 23 Sep 2020 14:30:24 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BED24C32EB1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Sep 2020 14:30:21 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08NEQi6J014390; Wed, 23 Sep 2020 16:30:12 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : from : to : cc
 : references : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=SjaY/w1nDEoWhikxQtwnd327tYOK3VZ51wdSZT/aEUk=;
 b=YS9RI+MCv/dZTSiRI2HLeGCC4O9EKyJdfd2K8y3fnqmxyNsMerNCRxjA4tmzEoOcNf3c
 pmusSpiiYsbySmOb8Xhmymgq0qY0fRWqTSv3cmcv/lpqBf4syKo1oWtV4q9A1rkBqd/I
 VXrlOXhhAeSs3W8dEE7hKyr5hnEQwsIofTwf2S04rjSTFRUJdazfb2TAbtSLh22wmMsf
 nlt6MZlZjtAQ4FYMmcW1pnA3gB1YuhgoYxqFiVVPt/rQbA9YerPpg26SUP5o0XGp+4lz
 SPnohXRTu0k27RoeX3aD+W40HUtGSji01pRamdaw2TkKBmCWmcFJbPK2wyMINWrnF24r Hg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 33n7eywne2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Sep 2020 16:30:12 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8E69410002A;
 Wed, 23 Sep 2020 16:30:11 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 154C12B8A2E;
 Wed, 23 Sep 2020 16:30:11 +0200 (CEST)
Received: from lmecxl0889.tpe.st.com (10.75.127.49) by SFHDAG3NODE1.st.com
 (10.75.127.7) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 23 Sep
 2020 16:30:09 +0200
From: Arnaud POULIQUEN <arnaud.pouliquen@st.com>
To: Rob Herring <robh@kernel.org>
References: <20200827072101.26588-1-arnaud.pouliquen@st.com>
 <20200827072101.26588-3-arnaud.pouliquen@st.com>
 <20200909202251.GA2975092@bogus>
 <c9d45617-6de9-7e49-0c82-151e67fff61d@st.com>
Message-ID: <cb39ab93-93db-1c2e-4e95-6ec767071549@st.com>
Date: Wed, 23 Sep 2020 16:30:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <c9d45617-6de9-7e49-0c82-151e67fff61d@st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG6NODE3.st.com (10.75.127.18) To SFHDAG3NODE1.st.com
 (10.75.127.7)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-23_10:2020-09-23,
 2020-09-23 signatures=0
Cc: Ohad Ben-Cohen <ohad@wizery.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Fabien DESSENNE <fabien.dessenne@st.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH 2/3] dt-bindings: remoteproc: stm32_rproc:
 update for firmware synchronization
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

Hi Rob,

Gentle reminder.
As I'm not sure to well understand your comment I would appreciate if you could
confirm your expectation before I sent a v2.

Thanks in advance,
Arnaud 

On 9/11/20 3:49 PM, Arnaud POULIQUEN wrote:
> Hi Rob,
> 
> On 9/9/20 10:22 PM, Rob Herring wrote:
>> On Thu, Aug 27, 2020 at 09:21:00AM +0200, Arnaud Pouliquen wrote:
>>> Add new properties description used to attach to a pre-loaded
>>> firmware according to the commit 9276536f455b3
>>> ("remoteproc: stm32: Parse syscon that will manage M4 synchronisation")
>>> which updates the driver part.
>>>
>>> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
>>> ---
>>>  .../bindings/remoteproc/st,stm32-rproc.yaml   | 19 +++++++++++++++++++
>>>  1 file changed, 19 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml
>>> index 4ffa25268fcc..e50957d86b1c 100644
>>> --- a/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml
>>> +++ b/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml
>>> @@ -96,6 +96,25 @@ properties:
>>>          3rd cell: register bitmask for the deep sleep bit
>>>      maxItems: 1
>>>  
>>> +  st,syscfg-m4-state:
>>> +    $ref: "/schemas/types.yaml#/definitions/phandle-array"
>>> +    description: |
>>> +      Reference to the tamp register which exposes the Cortex-M4 state.
>>> +        1st cell: phandle to syscon block
>>> +        2nd cell: register offset containing the Cortex-M4 state
>>> +        3rd cell: register bitmask for the Cortex-M4 state
>>> +    maxItems: 1
>>> +
>>> +  st,syscfg-rsc-tbl:
>>> +    $ref: "/schemas/types.yaml#/definitions/phandle-array"
>>> +    description: |
>>> +      Reference to the tamp register which references the Cortex-M4
>>> +      resource table address.
>>> +        1st cell: phandle to syscon block
>>> +        2nd cell: register offset containing the resource table address
>>> +        3rd cell: register bitmask for the resource table address
>>> +    maxItems: 1
>>
>> Why can't these be implied? You can lookup the tamp syscon by 
>> compatible.
> 
> I just made a copy/past of the  "st,syscfg-pdds" syscon description available in the same file [1]
>   
> I can provide a shorter descriptions, something like this:
> 
>    description: |
>      Reference to the tamp syscon register and bitmask which contains the Cortex-M4
>       resource table address.
>    maxItems: 1
> 
> Would this meet your expectations? If yes, I will also add in next version an extra patch to fix [1]
> 
> [1] https://elixir.bootlin.com/linux/v5.9-rc3/source/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml#L90
> 
>>
>> Please add these to the example.
> 
> I will extend the example with these properties
> 
> Thanks,
> Arnaud
> 
>>
>>> +
>>>    st,auto-boot:
>>>      $ref: /schemas/types.yaml#/definitions/flag
>>>      description:
>>> -- 
>>> 2.17.1
>>>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
