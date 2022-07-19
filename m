Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C08CD57A39F
	for <lists+linux-stm32@lfdr.de>; Tue, 19 Jul 2022 17:49:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A60D3C640F6;
	Tue, 19 Jul 2022 15:49:19 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 58BD8C640F4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Jul 2022 15:49:18 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26JF18n2006836;
 Tue, 19 Jul 2022 17:49:08 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=xNJ4ErN3u9jkwMCarC2DByfr3qT4TwK9Imt9o2bL5z0=;
 b=GBgzepkdJdsFAckF9I/WRy8sXMFk7VCCjo7Y7HRdF1F76W5b6gsikNP3c+7PLlUGZoQP
 DgKLybIfd/dd/XzIrk7sodntJHPa/do2UvuMDiPJHd/9cI4cUdBQIMYAqv1i+sQE0rSM
 3ViMAILa5kcIyZmUn6VvAB2B0EzexNri17aJD3gV0DtHvylzakv8JM92s1oXpCSr8aS9
 EAcEtUe5fybPg1YAt6w/dO1PR9nT/rC3OQUoLIlKBhJoa6LatC/j341H4yooZDIksZTz
 72/e/3Qoq0bcwb8kne9yJdBvA/dj3BJa9ovKz/CWwa4zepmuyuSK3Ikh5/T38E++IslD 9w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3hbnp60r8v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 Jul 2022 17:49:08 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 09E6610002A;
 Tue, 19 Jul 2022 17:49:08 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0502522D17D;
 Tue, 19 Jul 2022 17:49:08 +0200 (CEST)
Received: from [10.201.20.208] (10.75.127.44) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Tue, 19 Jul
 2022 17:49:04 +0200
Message-ID: <011c1254-f3e9-f363-52a5-c71f7b5a2805@foss.st.com>
Date: Tue, 19 Jul 2022 17:49:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Content-Language: en-US
To: Jonathan Corbet <corbet@lwn.net>, Vinod Koul <vkoul@kernel.org>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>
References: <20220719153122.620730-1-amelie.delaunay@foss.st.com>
From: Amelie Delaunay <amelie.delaunay@foss.st.com>
In-Reply-To: <20220719153122.620730-1-amelie.delaunay@foss.st.com>
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-19_04,2022-07-19_01,2022-06-22_01
Cc: Marek Vasut <marex@denx.de>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 0/6] STM32 DMA-MDMA chaining feature
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

Please drop this malformed patchset, I'll send a new one.

On 7/19/22 17:31, Amelie Delaunay wrote:
> This patchset (re)introduces STM32 DMA-MDMA chaining feature.
> 
> As the DMA is not able to generate convenient burst transfer on the DDR,
> it penalises the AXI bus when accessing the DDR. While it accesses
> optimally the SRAM. The DMA-MDMA chaining then consists in having an SRAM
> buffer between DMA and MDMA, so the DMA deals with peripheral and SRAM,
> and the MDMA with SRAM and DDR.
> 
> The feature relies on the fact that DMA channel Transfer Complete signal
> can trigger a MDMA channel transfer and MDMA can clear the DMA request by
> writing to DMA Interrupt Clear register.
> 
> A deeper introduction can be found in patch 1.
> 
> Previous implementation [1] has been dropped as nacked.
> Unlike this previous implementation (where all the stuff was embedded in
> stm32-dma driver), the user (in peripheral drivers using dma) has now to
> configure the MDMA channel.
> 
> [1] https://lore.kernel.org/lkml/1538139715-24406-1-git-send-email-pierre-yves.mordret@st.com/
> 
> Changes in v3:
> - introduce two prior patches to help readibility
> - fix stm32-dma struct stm32_dma_mdma_config documentation
> 
> Changes in v2:
> - wrap to 80-column limit for documentation
> - add an entry for this documentation in index.rst
> - use simple table instead of csv-table in documentation
> 
> 
> Amelie Delaunay (6):
>    dmaengine: stm32-dma: introduce 3 helpers to address channel flags
>    dmaengine: stm32-dma: use bitfield helpers
>    docs: arm: stm32: introduce STM32 DMA-MDMA chaining feature
>    dmaengine: stm32-dmamux: set dmamux channel id in dma features
>      bitfield
>    dmaengine: stm32-dma: add support to trigger STM32 MDMA
>    dmaengine: stm32-mdma: add support to be triggered by STM32 DMA
> 
>   Documentation/arm/index.rst                   |   1 +
>   .../arm/stm32/stm32-dma-mdma-chaining.rst     | 415 ++++++++++++++++++
>   drivers/dma/stm32-dma.c                       | 136 +++---
>   drivers/dma/stm32-dmamux.c                    |   2 +-
>   drivers/dma/stm32-mdma.c                      |  70 ++-
>   5 files changed, 569 insertions(+), 55 deletions(-)
>   create mode 100644 Documentation/arm/stm32/stm32-dma-mdma-chaining.rst
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
