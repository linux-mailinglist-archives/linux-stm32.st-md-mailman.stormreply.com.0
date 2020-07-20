Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AD64225B50
	for <lists+linux-stm32@lfdr.de>; Mon, 20 Jul 2020 11:21:56 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 09332C36B2A;
	Mon, 20 Jul 2020 09:21:56 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 34E1AC36B27
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Jul 2020 09:21:50 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06K9EfOc031975; Mon, 20 Jul 2020 11:21:36 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=GN+yMTwPABdvVS7FhpTsm1OeMf5cbjvKozUPn7B/wV0=;
 b=FCelGv/muQ0iz9iNtNePn+kuqHIZ8Ao19lKMbdtwbZvONG8p5URLzO+HDLjxYVjsAkrr
 iYNd8jksWV6jSPgbNjqhj+kfsYStKHyjBz5H4Dv4WpBeSkJPmvgtl1POi6wsNWOfWs6j
 1G2hvOnj9oCcQC035VphHI+hz96+vd1IWwLmb6i41dGEFM+IX0S6I8MniOgS8zacoj7X
 yr3SpFFR56k8oZO4sFDog1LHox4AaxzuktXEeiUNnfW/F8wi91MwOWMFbgXwO43PhuUT
 NcXeLG8HhHHe8mdKtTbWBBkcc2/aaNPwp6UqLWfURIay/QtgSxI7i4HdKb37m4+UIMHg oQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 32bs6uqvpb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Jul 2020 11:21:36 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id F301A10002A;
 Mon, 20 Jul 2020 11:21:35 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DF5FC2B33A4;
 Mon, 20 Jul 2020 11:21:35 +0200 (CEST)
Received: from SFHDAG3NODE3.st.com (10.75.127.9) by SFHDAG3NODE1.st.com
 (10.75.127.7) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 20 Jul
 2020 11:21:35 +0200
Received: from SFHDAG3NODE3.st.com ([fe80::3507:b372:7648:476]) by
 SFHDAG3NODE3.st.com ([fe80::3507:b372:7648:476%20]) with mapi id
 15.00.1347.000; Mon, 20 Jul 2020 11:21:35 +0200
From: Benjamin GAIGNARD <benjamin.gaignard@st.com>
To: Rob Herring <robh@kernel.org>
Thread-Topic: [PATCH v4 3/5] dt-bindings: bus: Add STM32 ETZPC firewall
 controller
Thread-Index: AQHWT6sXiDhFwJxpJEGLijki4gqejakFrtAAgAp+pQA=
Date: Mon, 20 Jul 2020 09:21:35 +0000
Message-ID: <98aef908-ddbb-4bcd-1880-02f2583059c6@st.com>
References: <20200701132523.32533-1-benjamin.gaignard@st.com>
 <20200701132523.32533-4-benjamin.gaignard@st.com>
 <20200713170542.GA384390@bogus>
In-Reply-To: <20200713170542.GA384390@bogus>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.47]
Content-ID: <4A487863F4E9234D83FD1BD592691EB8@st.com>
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
Subject: Re: [Linux-stm32] [PATCH v4 3/5] dt-bindings: bus: Add STM32 ETZPC
 firewall controller
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



On 7/13/20 7:05 PM, Rob Herring wrote:
> On Wed, Jul 01, 2020 at 03:25:21PM +0200, Benjamin Gaignard wrote:
>> Document STM32 ETZPC firewall controller bindings
>>
>> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
>> ---
>>   .../bindings/bus/stm32/st,stm32-etzpc.yaml         | 46 ++++++++++++++++++++++
>>   1 file changed, 46 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/bus/stm32/st,stm32-etzpc.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/bus/stm32/st,stm32-etzpc.yaml b/Documentation/devicetree/bindings/bus/stm32/st,stm32-etzpc.yaml
>> new file mode 100644
>> index 000000000000..d92865fda40c
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/bus/stm32/st,stm32-etzpc.yaml
>> @@ -0,0 +1,46 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/bus/stm32/st,stm32-etzpc.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: STM32 Extended TrustZone Protection controller
>> +
>> +maintainers:
>> +  - Benjamin Gaignard <benjamin.gaignard@st.com>
>> +
>> +description: STMicroelectronics's STM32 firewall bus controller implementation
>> +
>> +allOf:
>> +  - $ref: "firewall-provider.yaml#"
>> +  - $ref: /schemas/simple-bus.yaml#
> Your bus has controls/setup, it's not a simple-bus.
>
> Do you expect an old kernel or one with support for "st,stm32-etzpc-bus"
> disabled to work? How's it going to know if certain nodes can't be
> accessed without that support?
It already works with simple bus.
The goal behind implementing firewall bus controllers is to expose this 
in the DT
rather than hide it in the boot stages.

>
>> +
>> +properties:
>> +  compatible:
>> +    contains:
>> +      enum:
>> +        - st,stm32-etzpc-bus
>> +
>> +  reg:
>> +   maxItems: 1
>> +
>> +  '#firewall-cells':
>> +    const: 2
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - '#firewall-cells'
>> +
>> +examples:
>> +  - |
>> +    soc@5c007000 {
>> +      compatible = "st,stm32-etzpc-bus", "simple-bus";
>> +      reg = <0x5c007000 0x400>;
>> +      #firewall-cells = <2>;
>> +      #address-cells = <1>;
>> +      #size-cells = <1>;
>> +      ranges;
>> +    };
>> +
>> +...
>> -- 
>> 2.15.0
>>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
