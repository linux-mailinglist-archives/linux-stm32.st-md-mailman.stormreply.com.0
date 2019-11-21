Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 08A8F104EB2
	for <lists+linux-stm32@lfdr.de>; Thu, 21 Nov 2019 10:06:17 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AA9C3C36B0B;
	Thu, 21 Nov 2019 09:06:16 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9D681C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Nov 2019 09:06:14 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAL92o3F028033; Thu, 21 Nov 2019 10:05:54 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=X4UEF/oAolwYF/YR+6kYxpWAn7eU7vcEn3UoypO+JG0=;
 b=isFqjCoPRp7uBat+j6CYR/dWa1UNCWVfschlhEJZgZ0w9Vt0rqNlP0QrIW/Tu3aoBI8E
 Q5ofZpBXzNfR4sT0bvgGqO0gmciVFZ5SiDz5JrZ54Pw38+HBZJLgAmhcVpQyJjvhzAJQ
 M9aXvvKexcVW7ZUEHKczpCa/lXdb5tAtPKuOzyJEbTirnFNNz3ycIcUVGImHWacOhyh9
 23OEk3DTYXASh0HRTNm4taYBqOzxzfdznqneolE5S3wk4BxSrVShcznsAFUjnW6kpnMm
 /ZYJk17zbrqi+eu0pLO+UAm9Aa02mAV4x5tgQt2+qKrCG7RjxuXivOXV6feAhmtqui9z ww== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2wa9usj9ef-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Nov 2019 10:05:54 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 465C8100034;
 Thu, 21 Nov 2019 10:05:53 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 318C52B2376;
 Thu, 21 Nov 2019 10:05:53 +0100 (CET)
Received: from lmecxl0889.lme.st.com (10.75.127.48) by SFHDAG3NODE1.st.com
 (10.75.127.7) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 21 Nov
 2019 10:05:52 +0100
To: Rob Herring <robh@kernel.org>
References: <20191118101420.23610-1-arnaud.pouliquen@st.com>
 <CAL_Jsq+42wx1AJO=jXXBhmaKMkBq-RtoF+kxVjS2z9fSwhcaEQ@mail.gmail.com>
From: Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Message-ID: <9d3a1e61-4c75-fd5c-7142-111f08117530@st.com>
Date: Thu, 21 Nov 2019 10:05:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAL_Jsq+42wx1AJO=jXXBhmaKMkBq-RtoF+kxVjS2z9fSwhcaEQ@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG4NODE3.st.com (10.75.127.12) To SFHDAG3NODE1.st.com
 (10.75.127.7)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-21_01:2019-11-20,2019-11-21 signatures=0
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Jassi Brar <jassisinghbrar@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Fabien Dessenne <fabien.dessenne@st.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH v2] dt-bindings: mailbox: convert
 stm32-ipcc to json-schema
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



On 11/20/19 9:26 PM, Rob Herring wrote:
> On Mon, Nov 18, 2019 at 4:15 AM Arnaud Pouliquen
> <arnaud.pouliquen@st.com> wrote:
>>
>> Convert the STM32 IPCC bindings to DT schema format using
>> json-schema
>>
>> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
>> ---
>>  .../bindings/mailbox/st,stm32-ipcc.yaml       | 91 +++++++++++++++++++
>>  .../bindings/mailbox/stm32-ipcc.txt           | 47 ----------
>>  2 files changed, 91 insertions(+), 47 deletions(-)
>>  create mode 100644 Documentation/devicetree/bindings/mailbox/st,stm32-ipcc.yaml
>>  delete mode 100644 Documentation/devicetree/bindings/mailbox/stm32-ipcc.txt
> 
> Thanks for helping me find 2 meta-schema errors. :) Please update
> dt-schema and re-run 'make dt_binding_check'.
> 
it a privilege to help you to improve the scripts ;-)

Thanks for the reviews, based on it i will also update the following patch
dt-bindings: remoteproc: convert stm32-rproc to json-schema

Regards
Arnaud

>> diff --git a/Documentation/devicetree/bindings/mailbox/st,stm32-ipcc.yaml b/Documentation/devicetree/bindings/mailbox/st,stm32-ipcc.yaml
>> new file mode 100644
>> index 000000000000..90157d4deac1
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/mailbox/st,stm32-ipcc.yaml
>> @@ -0,0 +1,91 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: "http://devicetree.org/schemas/mailbox/st,stm32-ipcc.yaml#"
>> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
>> +
>> +title: STMicroelectronics STM32 IPC controller bindings
>> +
>> +description:
>> +  The IPCC block provides a non blocking signaling mechanism to post and
>> +  retrieve messages in an atomic way between two processors.
>> +  It provides the signaling for N bidirectionnal channels. The number of
>> +  channels (N) can be read from a dedicated register.
>> +
>> +maintainers:
>> +  - Fabien Dessenne <fabien.dessenne@st.com>
>> +  - Arnaud Pouliquen <arnaud.pouliquen@st.com>
>> +
>> +properties:
>> +  compatible:
>> +    const: st,stm32mp1-ipcc
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +     maxItems: 1
>> +
>> +  interrupts:
>> +    items:
>> +      - description: rx channel occupied
>> +      - description: tx channel free
>> +      - description: wakeup source
>> +    minItems: 2
>> +    maxItems: 3
>> +
>> +  interrupt-names:
>> +    items:
>> +      enums: [ rx, tx, wakeup ]
> 
> 'enums' is not a valid keyword. 'enum' is valid, but his should be in
> a defined order (so a list of items).
> 
>> +    minItems: 2
>> +    maxItems: 3
>> +
>> +  wakeup-source:
>> +    $ref: /schemas/types.yaml#/definitions/flag
>> +    description:
>> +      Enables wake up of host system on wakeup IRQ assertion.
> 
> Just 'true' is enough here. Assume we have a common definition.
> 
>> +
>> +  "#mbox-cells":
>> +    const: 1
>> +
>> +  st,proc-id:
>> +    description: Processor id using the mailbox (0 or 1)
>> +    allOf:
>> +      - minimum: 0
>> +      - maximum: 1
> 
> 'enum: [ 0, 1 ]' is more concise.
> 
> Also, needs a $ref to the type.
> 
>> +      - default: 0
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - st,proc-id
>> +  - clocks
>> +  - interrupt-names
>> +  - "#mbox-cells"
>> +
>> +oneOf:
>> +  - required:
>> +      - interrupts
>> +  - required:
>> +      - interrupts-extended
> 
> The tooling takes care of this for you. Just list 'interrupts' as required.
> 
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    #include <dt-bindings/clock/stm32mp1-clks.h>
>> +    ipcc: mailbox@4c001000 {
>> +      compatible = "st,stm32mp1-ipcc";
>> +      #mbox-cells = <1>;
>> +      reg = <0x4c001000 0x400>;
>> +      st,proc-id = <0>;
>> +      interrupts-extended = <&intc GIC_SPI 100 IRQ_TYPE_NONE>,
>> +                     <&intc GIC_SPI 101 IRQ_TYPE_NONE>,
>> +                     <&aiec 62 1>;
>> +      interrupt-names = "rx", "tx", "wakeup";
>> +      clocks = <&rcc_clk IPCC>;
>> +      wakeup-source;
>> +    };
>> +
>> +...
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
