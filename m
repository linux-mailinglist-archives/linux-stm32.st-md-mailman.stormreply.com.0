Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BFE8532647F
	for <lists+linux-stm32@lfdr.de>; Fri, 26 Feb 2021 16:09:39 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3FC3EC57B59;
	Fri, 26 Feb 2021 15:09:39 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A19D3C3FADC
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Feb 2021 15:09:37 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 11QF2fL4021970; Fri, 26 Feb 2021 16:09:22 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=qgcrA1p2mMePbblJBUkLPvlWf3ASWdD1ZKPpEgB7wzI=;
 b=gLphndUu/UTcY60EWbY7aHW3WL1FZjSnEdVK2TumSXgQRydM9r/9wjseLb9WjrMZEiyN
 XVVwquxha2vMa+3xyOx5WIIqfvbsQH6ppisdOflZuFuMpbCmqKdtx29b5A5tpgDD+YF9
 pn1aptjUPkwYuRVtP28wiFZl6HWJErIBr2CBm1ZfVOoMsvXPE0aK7AH5wcfkXqqEEbF2
 rt8R1bu26Khy7LJntORm9tC8gh5bMsP3gzDd9anXKqqDdZ9+jW5af4+yOdbzcl9/Rx4q
 u3EBIkSU0ntr5ofKmYAL0U+DxIW1OFDybDgzxzIosZLzK8qNQ8X4HPWLlWqdR9AiVtPS BA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 36w66vxav9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Feb 2021 16:09:22 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1E37310002A;
 Fri, 26 Feb 2021 16:09:22 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E01C9234B17;
 Fri, 26 Feb 2021 16:09:21 +0100 (CET)
Received: from lmecxl0912.lme.st.com (10.75.127.51) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 26 Feb
 2021 16:09:21 +0100
To: Jagan Teki <jagan@amarulasolutions.com>
References: <20201223191402.378560-1-jagan@amarulasolutions.com>
 <20201223191402.378560-3-jagan@amarulasolutions.com>
 <21398844-c334-f753-0fac-144a0cdc29dc@foss.st.com>
 <CAMty3ZBotTi2RwkKUpb+8KBOJ484hHzOV0p4J_dJ-fBVSDoMAg@mail.gmail.com>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
Message-ID: <cb9708b7-dfd2-04d3-a3d9-2479ab428f1a@foss.st.com>
Date: Fri, 26 Feb 2021 16:09:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAMty3ZBotTi2RwkKUpb+8KBOJ484hHzOV0p4J_dJ-fBVSDoMAg@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-02-26_03:2021-02-24,
 2021-02-26 signatures=0
Cc: devicetree <devicetree@vger.kernel.org>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Francesco Utel <francesco.utel@engicam.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Mirko Ardinghi <mirko.ardinghi@engicam.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Matteo Lisi <matteo.lisi@engicam.com>
Subject: Re: [Linux-stm32] [PATCH 2/5] ARM: dts: stm32: Add Engicam MicroGEA
	STM32MP1 SoM
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Hi Jagan

On 2/24/21 7:05 PM, Jagan Teki wrote:
> On Mon, Jan 25, 2021 at 8:35 PM Alexandre TORGUE
> <alexandre.torgue@foss.st.com> wrote:
>>
>> Hi,
>>
>> On 12/23/20 8:13 PM, Jagan Teki wrote:
>>> MicroGEA STM32MP1 is an EDIMM SoM based on STM32MP157A from Engicam.
>>>
>>> General features:
>>> - STM32MP157AAC
>>> - Up to 1GB DDR3L-800
>>> - 512MB Nand flash
>>> - I2S
>>>
>>> MicroGEA STM32MP1 needs to mount on top of Engicam MicroDev carrier
>>> boards for creating complete platform solutions.
>>>
>>> Add support for it.
>>>
>>> Signed-off-by: Matteo Lisi <matteo.lisi@engicam.com>
>>> Signed-off-by: Francesco Utel <francesco.utel@engicam.com>
>>> Signed-off-by: Mirko Ardinghi <mirko.ardinghi@engicam.com>
>>> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
>>> ---
>>>    .../dts/stm32mp157a-microgea-stm32mp1.dtsi    | 147 ++++++++++++++++++
>>>    1 file changed, 147 insertions(+)
>>>    create mode 100644 arch/arm/boot/dts/stm32mp157a-microgea-stm32mp1.dtsi
>>>
>>> diff --git a/arch/arm/boot/dts/stm32mp157a-microgea-stm32mp1.dtsi b/arch/arm/boot/dts/stm32mp157a-microgea-stm32mp1.dtsi
>>> new file mode 100644
>>> index 000000000000..97d569107bfe
>>> --- /dev/null
>>> +++ b/arch/arm/boot/dts/stm32mp157a-microgea-stm32mp1.dtsi
>>> @@ -0,0 +1,147 @@
>>> +// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
>>> +/*
>>> + * Copyright (c) STMicroelectronics 2019 - All Rights Reserved
>>> + * Copyright (c) 2020 Engicam srl
>>> + * Copyright (c) 2020 Amarula Solutons(India)
>>> + */
>>> +
>>
>> If STM32MP157AAC is soldered onto this board, you should include SoC
>> dtsi here and no into MicroDev 2.0 board. No ?
> 
> No, it's an SoM dtsi. and it can be associated with the respective
> carrier board and include files are attached in its dts.
> 
> Please check the next patches on this series.
Ok, I thought it was a mistake as you mentioned "- STM32MP157AAC" in 
your commit message.

regards
alex



> Jagan.
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
