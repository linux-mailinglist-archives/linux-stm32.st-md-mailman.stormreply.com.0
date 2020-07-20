Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 40311225B22
	for <lists+linux-stm32@lfdr.de>; Mon, 20 Jul 2020 11:17:27 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DF34AC36B2A;
	Mon, 20 Jul 2020 09:17:26 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6D4F1C36B27
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Jul 2020 09:17:25 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06K9AiTc031182; Mon, 20 Jul 2020 11:17:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=IIqjr+2EWMm3hORsqkFhj9cLOppUA2l9XjaSeJ9kH0A=;
 b=aieiYV5jwCr1RxBctMZGMP2BTkzrRr8JJxWnf0FmCRDKEmMjibLwCJEEFkr7gUoD1CZ9
 yYF5l913JmyfnlrkdUFEh7NtPyBj5GPSmBlzzlf5hTLwE/w1Y/Mbu/3y/+OQ213SpujD
 Ug5Rt3AYgQ91n8WMApBAWCu+wpwBCKt832CKDcbftRXjerleeYNbkOe6fu0oA4GuiytT
 zyZSYvcHQIhl/SvekFZ+PWTOwz6JLuRp2vHNXiHSBiJcb+v2l1+MOxt6Z2f+wYy4MwNf
 zb8TSbhVtZJ3vBhc/OJDtU/TzSlPpbbBL+FVTx0/6Sd9Ja/Uc6g/rFnSMZQ0rgldyJ6P gQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 32bsagqwpf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Jul 2020 11:17:10 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D048F10002A;
 Mon, 20 Jul 2020 11:17:07 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id BC0E521F664;
 Mon, 20 Jul 2020 11:17:07 +0200 (CEST)
Received: from SFHDAG3NODE3.st.com (10.75.127.9) by SFHDAG3NODE1.st.com
 (10.75.127.7) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 20 Jul
 2020 11:17:07 +0200
Received: from SFHDAG3NODE3.st.com ([fe80::3507:b372:7648:476]) by
 SFHDAG3NODE3.st.com ([fe80::3507:b372:7648:476%20]) with mapi id
 15.00.1347.000; Mon, 20 Jul 2020 11:17:07 +0200
From: Benjamin GAIGNARD <benjamin.gaignard@st.com>
To: Rob Herring <robh@kernel.org>
Thread-Topic: [PATCH v4 1/5] dt-bindings: bus: Add firewall bindings
Thread-Index: AQHWT6sWuhNHUdehJ0WOrRFCPK5R86kFrZMAgAp+ogA=
Date: Mon, 20 Jul 2020 09:17:07 +0000
Message-ID: <77cebf30-863e-6265-a061-e0b406bb8de7@st.com>
References: <20200701132523.32533-1-benjamin.gaignard@st.com>
 <20200701132523.32533-2-benjamin.gaignard@st.com>
 <20200713170116.GA364356@bogus>
In-Reply-To: <20200713170116.GA364356@bogus>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.46]
Content-ID: <4445D5F24D8E624B8E2A5AA83AF41703@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-20_05:2020-07-17,
 2020-07-20 signatures=0
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "tomase@xilinx.com" <tomase@xilinx.com>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 "stefano.stabellini@xilinx.com" <stefano.stabellini@xilinx.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH v4 1/5] dt-bindings: bus: Add firewall
	bindings
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



On 7/13/20 7:01 PM, Rob Herring wrote:
> On Wed, Jul 01, 2020 at 03:25:19PM +0200, Benjamin Gaignard wrote:
>> Add schemas for firewall consumer and provider.
>>
>> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
>> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>> ---
>>   .../bindings/bus/stm32/firewall-consumer.yaml      | 36 ++++++++++++++++++++++
>>   .../bindings/bus/stm32/firewall-provider.yaml      | 18 +++++++++++
>>   2 files changed, 54 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/bus/stm32/firewall-consumer.yaml
>>   create mode 100644 Documentation/devicetree/bindings/bus/stm32/firewall-provider.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/bus/stm32/firewall-consumer.yaml b/Documentation/devicetree/bindings/bus/stm32/firewall-consumer.yaml
>> new file mode 100644
>> index 000000000000..d3d76f99b38d
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/bus/stm32/firewall-consumer.yaml
>> @@ -0,0 +1,36 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/bus/stm32/firewall-consumer.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Common Bus Firewall consumer binding
> I'm all for common bindings, but I want to see more than 1 user before
> accepting this. There's been some other postings for similar h/w
> (AFAICT) recently.
>
>> +
>> +description: |
>> +  Firewall properties provide the possible firewall bus controller
>> +  configurations for a device.
>> +  Bus firewall controllers are typically used to control if a hardware
>> +  block can perform read or write operations on bus.
>> +  The contents of the firewall bus configuration properties are defined by
>> +  the binding for the individual firewall controller device.
>> +
>> +  The first configuration 'firewall-0' or the one named 'default' is
>> +  applied before probing the device itself.
> This is a Linux implementation detail and debatable whether the core
> should do this or drivers.
I could prefix the property with 'st,stm32' so it will dedicated to 
STM32 SoCs.
Will it sound better for you ?

 From Greg comments in the previous versions of this patch I understand that
it isn't something to be done in the core. The best I can do here is to 
keep it as
helpers for STM32 SoCs.
>
>> +
>> +maintainers:
>> +  - Benjamin Gaignard <benjamin.gaignard@st.com>
>> +
>> +# always select the core schema
>> +select: true
>> +
>> +properties:
>> +  firewall-0: true
>> +
>> +  firewall-names: true
>> +
>> +patternProperties:
>> +  "firewall-[0-9]":
>> +    $ref: "/schemas/types.yaml#/definitions/phandle-array"
> So I guess multiple properties is to encode all the modes into DT like
> pinctrl does. Is that really necessary? I don't think so as I wouldn't
> expect modes to be defined by the consumer, but by the provider in this
> case. To use pinctrl as a example, we could have pad setting per MMC
> speed. That has to be in the consumer side as the pinctrl knows nothing
> about MMC.
I expect to be able to set phandle on different firewall controllers.
I don't know if it is possible with the same structure than for pins 
controllers.
>   
> Rob
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
