Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B95D926609E
	for <lists+linux-stm32@lfdr.de>; Fri, 11 Sep 2020 15:50:18 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 62ABDC3FAE3;
	Fri, 11 Sep 2020 13:50:18 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 69A2FC3FADF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 11 Sep 2020 13:50:16 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08BDlfdN016391; Fri, 11 Sep 2020 15:50:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=LedGIkihyb95sarwl6GH6FHkhiz/ZEZc+nrtI6/KHRQ=;
 b=DqTcfhEOyT+mjya84EPGVrM1imjDeblcaBYwSTzOxQYWNd7Sxj+G2zkIvTMr27NXSkLH
 YwCMK1oAw8clCxnrvtktuamiNqy3/2L5FGqPVJAKmXMtlLIAZkgL7Xb9lwNXt/zlwjj+
 g/tXBi70Q0H/h5xkp10E1dsHKe9RbmMr4/IdRhqw+t7MhfiT3cbMIjPqJ3ATFTEH45l8
 8U1HEraZ7IV/4NAm8H2Pph2HvEftW9I5xblkFqbHCkuDZMdoIXPZV1JeKWL11M0eHx5i
 AKn8VypoIsE50fhMd/ZeHzv7iv0OpJ0zhr4c1hWKq8Rbjx414URLPZsvqup0j/irA8Lf zg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 33c1jfhyq1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Sep 2020 15:50:04 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id AA153100038;
 Fri, 11 Sep 2020 15:50:02 +0200 (CEST)
Received: from Webmail-eu.st.com (gpxdag3node4.st.com [10.75.127.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8D99F2AD9FD;
 Fri, 11 Sep 2020 15:50:02 +0200 (CEST)
Received: from lmecxl0889.tpe.st.com (10.75.127.44) by GPXDAG3NODE4.st.com
 (10.75.127.71) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 11 Sep
 2020 15:50:00 +0200
To: Rob Herring <robh@kernel.org>
References: <20200827072101.26588-1-arnaud.pouliquen@st.com>
 <20200827072101.26588-3-arnaud.pouliquen@st.com>
 <20200909202251.GA2975092@bogus>
From: Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Message-ID: <c9d45617-6de9-7e49-0c82-151e67fff61d@st.com>
Date: Fri, 11 Sep 2020 15:49:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200909202251.GA2975092@bogus>
Content-Language: en-US
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG4NODE2.st.com (10.75.127.11) To GPXDAG3NODE4.st.com
 (10.75.127.71)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-11_05:2020-09-10,
 2020-09-11 signatures=0
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

On 9/9/20 10:22 PM, Rob Herring wrote:
> On Thu, Aug 27, 2020 at 09:21:00AM +0200, Arnaud Pouliquen wrote:
>> Add new properties description used to attach to a pre-loaded
>> firmware according to the commit 9276536f455b3
>> ("remoteproc: stm32: Parse syscon that will manage M4 synchronisation")
>> which updates the driver part.
>>
>> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
>> ---
>>  .../bindings/remoteproc/st,stm32-rproc.yaml   | 19 +++++++++++++++++++
>>  1 file changed, 19 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml
>> index 4ffa25268fcc..e50957d86b1c 100644
>> --- a/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml
>> +++ b/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml
>> @@ -96,6 +96,25 @@ properties:
>>          3rd cell: register bitmask for the deep sleep bit
>>      maxItems: 1
>>  
>> +  st,syscfg-m4-state:
>> +    $ref: "/schemas/types.yaml#/definitions/phandle-array"
>> +    description: |
>> +      Reference to the tamp register which exposes the Cortex-M4 state.
>> +        1st cell: phandle to syscon block
>> +        2nd cell: register offset containing the Cortex-M4 state
>> +        3rd cell: register bitmask for the Cortex-M4 state
>> +    maxItems: 1
>> +
>> +  st,syscfg-rsc-tbl:
>> +    $ref: "/schemas/types.yaml#/definitions/phandle-array"
>> +    description: |
>> +      Reference to the tamp register which references the Cortex-M4
>> +      resource table address.
>> +        1st cell: phandle to syscon block
>> +        2nd cell: register offset containing the resource table address
>> +        3rd cell: register bitmask for the resource table address
>> +    maxItems: 1
> 
> Why can't these be implied? You can lookup the tamp syscon by 
> compatible.

I just made a copy/past of the  "st,syscfg-pdds" syscon description available in the same file [1]
  
I can provide a shorter descriptions, something like this:

   description: |
     Reference to the tamp syscon register and bitmask which contains the Cortex-M4
      resource table address.
   maxItems: 1

Would this meet your expectations? If yes, I will also add in next version an extra patch to fix [1]

[1] https://elixir.bootlin.com/linux/v5.9-rc3/source/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml#L90

> 
> Please add these to the example.

I will extend the example with these properties

Thanks,
Arnaud

> 
>> +
>>    st,auto-boot:
>>      $ref: /schemas/types.yaml#/definitions/flag
>>      description:
>> -- 
>> 2.17.1
>>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
