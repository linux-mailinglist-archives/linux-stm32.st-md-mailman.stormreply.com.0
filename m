Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 72DE14DC3D7
	for <lists+linux-stm32@lfdr.de>; Thu, 17 Mar 2022 11:18:47 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 24186C60467;
	Thu, 17 Mar 2022 10:18:47 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C02AEC5F1EE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Mar 2022 10:18:45 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 22H8AOCs004861;
 Thu, 17 Mar 2022 11:18:01 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=s0T2J+BUPfq3wtxoi9ptnx4PkAnuCrcogO563PL6A7E=;
 b=tqrYTAk4hJkdazLPqvrldMktXaVm9S42CGuzyXUR+l5dwYSKzFJXJcmWvCl3n/6Zd4oj
 nB68lSvlWf68oH7XFck5WhuVEOTLdPTjFNuJouxs2duli8lL5txwogER8/4avRbIF9gw
 dLJladdVvNk4eePFSSjp7XfbapW34ADQgrnjIwmEW8lYSQtXdYl26zgh10fJGGgPtien
 J3iHVDGmmZC6QAIer+Q+JtV2HW8DPlmS+6IqtxyQlSGOtmm7Kgwwzd7K8QymiRdJgZTb
 1U5eEf3EgbJEdQ9r6aWG0bJGyOcRT18cgI169NWPyrzeVCSjSDQQBM04laO0yP+kECcW oA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3et63jbvmh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Mar 2022 11:18:00 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id AFA8910002A;
 Thu, 17 Mar 2022 11:17:58 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9B821215132;
 Thu, 17 Mar 2022 11:17:58 +0100 (CET)
Received: from [10.211.8.11] (10.75.127.47) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Thu, 17 Mar
 2022 11:17:57 +0100
Message-ID: <6bfade04-36b4-98c3-2796-ebeaa230f52e@foss.st.com>
Date: Thu, 17 Mar 2022 11:17:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Ulf Hansson <ulf.hansson@linaro.org>
References: <20220304135134.47827-1-yann.gautier@foss.st.com>
 <20220304135134.47827-2-yann.gautier@foss.st.com>
 <CACRpkdYQz+-im3n-r0_8RKL7so2bHS=aZobty4BbzixmPzms-Q@mail.gmail.com>
 <0bc53018-fce4-4104-fa47-6e60d2367d69@foss.st.com>
 <CAPDyKFqgQZFH3LT1Z+G9N0MVfhFwoiUr9N2sKFaejTWcH+dNXg@mail.gmail.com>
From: Yann Gautier <yann.gautier@foss.st.com>
In-Reply-To: <CAPDyKFqgQZFH3LT1Z+G9N0MVfhFwoiUr9N2sKFaejTWcH+dNXg@mail.gmail.com>
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-17_03,2022-03-15_01,2022-02-23_01
Cc: Ludovic Barre <ludovic.barre@foss.st.com>, devicetree@vger.kernel.org,
 Marek Vasut <marex@denx.de>, Philipp Zabel <p.zabel@pengutronix.de>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Grzegorz Szymaszek <gszymaszek@short.pl>, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 kernel@dh-electronics.com, Rob Herring <robh+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Russell King <linux@armlinux.org.uk>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/3] dt-bindings: mmc: mmci: add a
 property to disable DMA LLI
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

On 3/17/22 11:00, Ulf Hansson wrote:
> On Tue, 15 Mar 2022 at 09:26, Yann Gautier <yann.gautier@foss.st.com> wrote:
>>
>> On 3/14/22 23:43, Linus Walleij wrote:
>>> "On Fri, Mar 4, 2022 at 2:52 PM Yann Gautier <yann.gautier@foss.st.com> wrote:
>>>
>>>> On STMicroelectronics variant of PL18x, the DMA Linked Lists are supported
>>>> starting from revision v2 of the peripheral. But it has limitations,
>>>> as all the buffers should be aligned on block size (except the last one).
>>>> But this cannot be guaranteed with SDIO. We should then have a property
>>>> to disable the support of LLI.
>>>>
>>>> Signed-off-by: Yann Gautier <yann.gautier@foss.st.com>
>>>
>>> Actually I think this is present also on the ux500 variants. See:
>>> commit 2253ed4b36dc876d1598c4dab5587e537ec68c34
>>> "mmc: mmci: Support any block sizes for ux500v2 and qcom variant"
>>>
>>> Spot the variant data "dma_power_of_2".
>>>
>>> So whatever property you add
>>> to the variant data (not in the device tree please) should
>>> be added to the ux500 variants as well, it will *VERY* likely
>>> have a problem with LLI elements not being a power of 2
>>> as it is the ancestor of later STMicro variants.
>>>
>>> It might actually be the reason for some annoying WiFi error
>>> messages I have seen :/
>>>
>>> Yours,
>>> Linus Walleij
>>
>> Hi Linus,
>>
>> The STM32 variant uses an internal DMA, and the DMA functions are in its
>> dedicated file. So I was planning to do the same as what is done in
>> meson-gx-mmc.c: using a bounce buffer to copy from/to in case DMA
>> constraints are not fulfilled. Not sure it can help for Ux500.
> 

Hi Ulf,

> We already have a bounce buffer in mmci_pio_read(), but we need one in
> mmc_pio_write() too, which hasn't been implemented yet.

The idea is to keep using our internal DMA, and not switch to pio mode.

> 
>>
>> Ulf, before I send my new series (although it is not ready yet), would
>> you be OK with the bounce buffer idea?
> 
> Yes, that works for me.
I have patches almost ready, I'll send that soon.

> 
> On the other hand, it would be even better if we could specify the
> buffer limitations per mmc host instance, so upper layers (SDIO func
> drivers) could conform to these - and use better buffers, to achieve a
> better performance.

We've seen things that could be improved in the wifi driver. I'll check 
what could be done.

Best regards,
Yann
> 
>>
>>
>> Best regards,
>> Yann
> 
> Kind regards
> Uffe

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
