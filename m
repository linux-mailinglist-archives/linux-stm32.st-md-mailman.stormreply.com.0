Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D876571B71
	for <lists+linux-stm32@lfdr.de>; Tue, 12 Jul 2022 15:38:04 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C9018C640F8;
	Tue, 12 Jul 2022 13:38:03 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DB9EBC03FD4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Jul 2022 13:38:01 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26C9Fa5x002441;
 Tue, 12 Jul 2022 15:37:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=h4xD17V7DTR/YNErBVRjs3G7RJZlt2Jn4LyRZD6px+4=;
 b=FJAxMZeSr66ZY5WN87Yvn3qR9Bemn1VfFdpQ5//MFtocWtSe/WNGaytc90QqANxrAOmV
 sVNWVMUxdB0Qp3jJtUYNOaRtnzjlLv2XEsfQpqJi6ahJ5RcZmfLewH9GhOvz8Tvv4PDW
 FRXQQ9z/REk2wuTE60sKbb1YQrJ3t5YIXIg/Xvr3O1yFYbOCn9rCebilXSMTKT2yq909
 sCmudFgylUs+nXKUme55+ptXcb9LliRuGoTgNcp2IFT/BBwb3uBtdtwq6z8Izc0Vhk3E
 hvljL3gcXV617KkptqhybuOqqKw7eanAvWgvjJD0Y98xpTaF5Gr17xDtmFYnR1wZQXKB 5w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3h9173k3qb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Jul 2022 15:37:45 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 30356100034;
 Tue, 12 Jul 2022 15:37:44 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2179321FEBB;
 Tue, 12 Jul 2022 15:37:44 +0200 (CEST)
Received: from [10.211.14.207] (10.75.127.45) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Tue, 12 Jul
 2022 15:37:42 +0200
Message-ID: <e51bed47-b3fd-a328-a545-2810072e2bb8@foss.st.com>
Date: Tue, 12 Jul 2022 15:37:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Content-Language: en-US
To: Jonathan Corbet <corbet@lwn.net>, Vinod Koul <vkoul@kernel.org>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>
References: <20220711084703.268481-1-amelie.delaunay@foss.st.com>
 <20220711084703.268481-2-amelie.delaunay@foss.st.com>
 <87a69ffzvk.fsf@meer.lwn.net>
From: Amelie Delaunay <amelie.delaunay@foss.st.com>
In-Reply-To: <87a69ffzvk.fsf@meer.lwn.net>
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-12_08,2022-07-12_01,2022-06-22_01
Cc: Marek Vasut <marex@denx.de>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/4] docs: arm: stm32: introduce STM32
 DMA-MDMA chaining feature
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



On 7/11/22 17:11, Jonathan Corbet wrote:
> Amelie Delaunay <amelie.delaunay@foss.st.com> writes:
> 
>> STM32 DMA-MDMA chaining feature is available on STM32 SoCs which embed
>> STM32 DMAMUX, DMA and MDMA controllers. It is the case on STM32MP1 SoCs but
>> also on STM32H7 SoCs. But focus is on STM32MP1 SoCs, using DDR.
>> This documentation aims to explain how to use STM32 DMA-MDMA chaining
>> feature in drivers of STM32 peripheral having request lines on STM32 DMA.
>>
>> Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
>> ---
>>   .../arm/stm32/stm32-dma-mdma-chaining.rst     | 365 ++++++++++++++++++
>>   1 file changed, 365 insertions(+)
>>   create mode 100644 Documentation/arm/stm32/stm32-dma-mdma-chaining.rst
> 
> When you add a new RST file you also need to add it to index.rst
> somewhere so that it becomes part of the docs build.
> 

Thanks for you review.

I'll add it to index.rst, with other stm32 documentations.

>> diff --git a/Documentation/arm/stm32/stm32-dma-mdma-chaining.rst b/Documentation/arm/stm32/stm32-dma-mdma-chaining.rst
>> new file mode 100644
>> index 000000000000..bfbbadc45aa7
>> --- /dev/null
>> +++ b/Documentation/arm/stm32/stm32-dma-mdma-chaining.rst
>> @@ -0,0 +1,365 @@
>> +.. SPDX-License-Identifier: GPL-2.0
>> +
>> +=======================
>> +STM32 DMA-MDMA chaining
>> +=======================
>> +
>> +
>> +Introduction
>> +------------
>> +
>> +  This document describes the STM32 DMA-MDMA chaining feature. But before going further, let's
>> +  introduce the peripherals involved.
> 
> Please keep to the 80-column limit for documentation, it makes it easier
> to read.
> 

OK, I prepare a v2 with a 80-column limit for the documentation patch.

>> +  To offload data transfers from the CPU, STM32 microprocessors (MPUs) embed direct memory access
>> +  controllers (DMA).
>> +
>> +  STM32MP1 SoCs embed both STM32 DMA and STM32 MDMA controllers. STM32 DMA request routing
>> +  capabilities are enhanced by a DMA request multiplexer (STM32 DMAMUX).
>> +
>> +  **STM32 DMAMUX**
>> +
>> +  STM32 DMAMUX routes any DMA request from a given peripheral to any STM32 DMA controller (STM32MP1
>> +  counts two STM32 DMA controllers) channels.
>> +
>> +  **STM32 DMA**
>> +
>> +  STM32 DMA is mainly used to implement central data buffer storage (usually in the system SRAM) for
>> +  different peripheral. It can access external RAMs but without the ability to generate convenient
>> +  burst transfer ensuring the best load of the AXI.
>> +
>> +  **STM32 MDMA**
>> +
>> +  STM32 MDMA (Master DMA) is mainly used to manage direct data transfers between RAM data buffers
>> +  without CPU intervention. It can also be used in a hierarchical structure that uses STM32 DMA as
>> +  first level data buffer interfaces for AHB peripherals, while the STM32 MDMA acts as a second
>> +  level DMA with better performance. As a AXI/AHB master, STM32 MDMA can take control of the AXI/AHB
>> +  bus.
>> +
>> +
>> +Principles
>> +----------
>> +
>> +  STM32 DMA-MDMA chaining feature relies on the strengths of STM32 DMA and STM32 MDMA controllers.
>> +
>> +  STM32 DMA has a circular Double Buffer Mode (DBM). At each end of transaction (when DMA data
>> +  counter - DMA_SxNDTR - reaches 0), the memory pointers (configured with DMA_SxSM0AR and
>> +  DMA_SxM1AR) are swapped and the DMA data counter is automatically reloaded. This allows the SW or
>> +  the STM32 MDMA to process one memory area while the second memory area is being filled/used by the
>> +  STM32 DMA transfer.
>> +
>> +  With STM32 MDMA linked-list mode, a single request initiates the data array (collection of nodes)
>> +  to be transferred until the linked-list pointer for the channel is null. The channel transfer
>> +  complete of the last node is the end of transfer, unless first and last nodes are linked to each
>> +  other, in such a case, the linked-list loops on to create a circular MDMA transfer.
>> +
>> +  STM32 MDMA has direct connections with STM32 DMA. This enables autonomous communication and
>> +  synchronization between peripherals, thus saving CPU resources and bus congestion. Transfer
>> +  Complete signal of STM32 DMA channel can triggers STM32 MDMA transfer. STM32 MDMA can clear the
>> +  request generated by the STM32 DMA by writing to its Interrupt Clear register (whose address is
>> +  stored in MDMA_CxMAR, and bit mask in MDMA_CxMDR).
>> +
>> +  .. csv-table:: STM32 MDMA interconnect table with STM32 DMA
>> +        :header: "STM32 DMAMUX channels", "STM32 DMA controllers channels",
>> +                 "STM32 DMA Transfer Complete signal", "STM32 MDMA request"
> 
> If at all possible, please use simple tables; that makes the plain text
> documentation much easier to read.
> 

It is possible, with some extra lines. I'll update it in v2 coming soon.

> [...]
> 
> Thanks,
> 
> jon

Regards,
Amelie
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
