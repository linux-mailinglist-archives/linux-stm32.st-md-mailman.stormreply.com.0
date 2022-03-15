Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B7164D9622
	for <lists+linux-stm32@lfdr.de>; Tue, 15 Mar 2022 09:26:46 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E0C31C628A8;
	Tue, 15 Mar 2022 08:26:45 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9B93FC628A2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Mar 2022 08:26:44 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 22F4JVqv027247;
 Tue, 15 Mar 2022 09:26:03 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=oDQ0bPSs1kEQPGA4aIXxaRySi/P2J26ASVpVIJPCOfw=;
 b=eCCUCU3ckkjg9JZogaLrJW4bezRHw/mjZBIHhc9DDxaL78yvZ/BafbdZQPDnl81zrBbw
 oD5Gnarfz/xDPmKyulwxiKLb/EbAgrir1PJgnqCHblXu6B7r2oIUym5/jte3hgVn0ZlC
 niCX3zel4DKTke6eYb2627c/hzZxLkv83G93CX5zcfSvIRDqklqNW817kvikFPt1d401
 A8FBfs3AEfWbl/SO0C4Wc1cnYBa2tTz6iiS+VhI2ezSrgY9NxOnn7GY6y0wCOmikD/Fr
 3SKmphfBhfhbn14vDgjV+W6Hy2LCFfF3DeHYksxjqaeecvvQu6c+4G918U/XsxG8+Z38 bw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3etj2ahghy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Mar 2022 09:26:03 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8560B10002A;
 Tue, 15 Mar 2022 09:26:02 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7B789212FC5;
 Tue, 15 Mar 2022 09:26:02 +0100 (CET)
Received: from [10.201.21.172] (10.75.127.46) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Tue, 15 Mar
 2022 09:26:01 +0100
Message-ID: <0bc53018-fce4-4104-fa47-6e60d2367d69@foss.st.com>
Date: Tue, 15 Mar 2022 09:26:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Linus Walleij <linus.walleij@linaro.org>
References: <20220304135134.47827-1-yann.gautier@foss.st.com>
 <20220304135134.47827-2-yann.gautier@foss.st.com>
 <CACRpkdYQz+-im3n-r0_8RKL7so2bHS=aZobty4BbzixmPzms-Q@mail.gmail.com>
From: Yann Gautier <yann.gautier@foss.st.com>
In-Reply-To: <CACRpkdYQz+-im3n-r0_8RKL7so2bHS=aZobty4BbzixmPzms-Q@mail.gmail.com>
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-14_14,2022-03-14_02,2022-02-23_01
Cc: Ludovic Barre <ludovic.barre@foss.st.com>, devicetree@vger.kernel.org,
 Ulf Hansson <ulf.hansson@linaro.org>, Marek Vasut <marex@denx.de>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Manivannan Sadhasivam <mani@kernel.org>,
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

On 3/14/22 23:43, Linus Walleij wrote:
> "On Fri, Mar 4, 2022 at 2:52 PM Yann Gautier <yann.gautier@foss.st.com> wrote:
> 
>> On STMicroelectronics variant of PL18x, the DMA Linked Lists are supported
>> starting from revision v2 of the peripheral. But it has limitations,
>> as all the buffers should be aligned on block size (except the last one).
>> But this cannot be guaranteed with SDIO. We should then have a property
>> to disable the support of LLI.
>>
>> Signed-off-by: Yann Gautier <yann.gautier@foss.st.com>
> 
> Actually I think this is present also on the ux500 variants. See:
> commit 2253ed4b36dc876d1598c4dab5587e537ec68c34
> "mmc: mmci: Support any block sizes for ux500v2 and qcom variant"
> 
> Spot the variant data "dma_power_of_2".
> 
> So whatever property you add
> to the variant data (not in the device tree please) should
> be added to the ux500 variants as well, it will *VERY* likely
> have a problem with LLI elements not being a power of 2
> as it is the ancestor of later STMicro variants.
> 
> It might actually be the reason for some annoying WiFi error
> messages I have seen :/
> 
> Yours,
> Linus Walleij

Hi Linus,

The STM32 variant uses an internal DMA, and the DMA functions are in its 
dedicated file. So I was planning to do the same as what is done in 
meson-gx-mmc.c: using a bounce buffer to copy from/to in case DMA 
constraints are not fulfilled. Not sure it can help for Ux500.

Ulf, before I send my new series (although it is not ready yet), would 
you be OK with the bounce buffer idea?


Best regards,
Yann
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
