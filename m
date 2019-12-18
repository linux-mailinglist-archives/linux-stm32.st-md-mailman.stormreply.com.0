Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B1215124965
	for <lists+linux-stm32@lfdr.de>; Wed, 18 Dec 2019 15:23:52 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7674FC36B0C;
	Wed, 18 Dec 2019 14:23:52 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 63B16C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Dec 2019 14:23:50 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xBIEMRju009267; Wed, 18 Dec 2019 15:23:40 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=CqqtdBSOQzQqY2X0T5pw83xNGBYfoG1Y6eQNNcwZcOs=;
 b=sO8+RfNMnFy+X6hhI9GL6hnltJcNCoANQTxOee2pWtP2t9XSI6aMsUr+18FYUeyt5bCT
 rQYgeOsAnIRPdHlagkpf3ZjL4lsFu79+2jVdeX58pd6nMhoXOiPoO2/vqhtBYM2tu4h6
 9SHIOLyEQIK64dOpBRuuPSiWQJqvhTqRHVcTrzbGe0Nudli8a01BQTryfnLvlBZn1mLa
 z7J6OK67HdEkDfHkru6qSaztT8KaN3XSWaiLiEQQetNIrhd1eLYG4DqPMO+/Exni8Ggx
 GaE44x0p/Z/M8Svt1rFcfJ/3BxVguwLOLXzWcRGcyk2Rg/AJ3oP0cJ55Rd7rpioRbV5O WQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2wvnremuku-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Dec 2019 15:23:40 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2435D100038;
 Wed, 18 Dec 2019 15:23:39 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0ADDA210D29;
 Wed, 18 Dec 2019 15:23:39 +0100 (CET)
Received: from lmecxl0912.lme.st.com (10.75.127.51) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Wed, 18 Dec
 2019 15:23:38 +0100
To: Benjamin Gaignard <benjamin.gaignard@st.com>, <vkoul@kernel.org>,
 <robh+dt@kernel.org>, <mark.rutland@arm.com>, <mcoquelin.stm32@gmail.com>
References: <20191217092201.20022-1-benjamin.gaignard@st.com>
From: Alexandre Torgue <alexandre.torgue@st.com>
Message-ID: <925ed27e-25a4-7382-af52-fda1688ac789@st.com>
Date: Wed, 18 Dec 2019 15:23:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191217092201.20022-1-benjamin.gaignard@st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG5NODE2.st.com (10.75.127.14) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-18_04:2019-12-17,2019-12-18 signatures=0
Cc: dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 0/6] Convert STM32 dma to json-schema
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

Hi Benjamin,

On 12/17/19 10:21 AM, Benjamin Gaignard wrote:
> This series convert STM32 dma, mdma and dmamux bindings to json-schema.
> Yaml bindings use dma-controller and dma-router schemas where nodes names
> are verified which lead to fix stm32f746, stm32f743 and stm32mp157 device
> tree files.
> 
> Benjamin Gaignard (6):
>    dt-bindings: dma: Convert stm32 DMA bindings to json-schema
>    dt-bindings: dma: Convert stm32 MDMA bindings to json-schema
>    dt-bindings: dma: Convert stm32 DMAMUX bindings to json-schema
>    ARM: dts: stm32: fix dma controller node name on stm32f746
>    ARM: dts: stm32: fix dma controller node name on stm32f743
>    ARM: dts: stm32: fix dma controller node name on stm32mp157c
> 
>   .../devicetree/bindings/dma/st,stm32-dma.yaml      | 102 ++++++++++++++++++++
>   .../devicetree/bindings/dma/st,stm32-dmamux.yaml   |  52 ++++++++++
>   .../devicetree/bindings/dma/st,stm32-mdma.yaml     | 105 +++++++++++++++++++++
>   .../devicetree/bindings/dma/stm32-dma.txt          |  83 ----------------
>   .../devicetree/bindings/dma/stm32-dmamux.txt       |  84 -----------------
>   .../devicetree/bindings/dma/stm32-mdma.txt         |  94 ------------------
>   arch/arm/boot/dts/stm32f746.dtsi                   |   4 +-
>   arch/arm/boot/dts/stm32h743.dtsi                   |   6 +-
>   arch/arm/boot/dts/stm32mp157c.dtsi                 |   6 +-
>   9 files changed, 267 insertions(+), 269 deletions(-)
>   create mode 100644 Documentation/devicetree/bindings/dma/st,stm32-dma.yaml
>   create mode 100644 Documentation/devicetree/bindings/dma/st,stm32-dmamux.yaml
>   create mode 100644 Documentation/devicetree/bindings/dma/st,stm32-mdma.yaml
>   delete mode 100644 Documentation/devicetree/bindings/dma/stm32-dma.txt
>   delete mode 100644 Documentation/devicetree/bindings/dma/stm32-dmamux.txt
>   delete mode 100644 Documentation/devicetree/bindings/dma/stm32-mdma.txt
> 

For  DT patches, please rebase your patches on stm32-next. Major updates 
have been done for STM DT diversity.

Thanks in advance.

Alex
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
