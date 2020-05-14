Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E9C141D2FF5
	for <lists+linux-stm32@lfdr.de>; Thu, 14 May 2020 14:39:07 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A7B2FC36B12;
	Thu, 14 May 2020 12:39:07 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 20505C36B0E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 May 2020 12:39:03 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04ECWRpb031347; Thu, 14 May 2020 14:38:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=gK4gRac8zCJ49BVWhgCYszm1HwapCUJoPR2k/1pndPk=;
 b=qPxbDB2jBqpiVaEwpezjOHZi/uxRnvCZ6Exwe+7WK52uI0EdKnWpTbUqyUuiZPXCnxJ4
 Do6vdK1vZ0BxbplxQakO7YP4qQZWe06PIx/FpH1gIMcKGPzyorjE+R6N4d64sBoQYGFp
 6XO7K2XAzNc3Z7GAh/KLe7Mvzt1CrlA+Sfk7Nw+jVvL318TTMhJ4u+i4zo6wiH69qmza
 OKPCF+Htv29t+IyHli1feCCpVLZJGh0yYtHEWLOOzm08UKgOsA2t3tMOXT/ZnjgJDPpd
 UNX2aYKc3WJbUEPgHfToOJA+AmAwRIjoU0NPtm6/GAGnGRvPxTKb/D3g7lAKGvY+CXG8 Sw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3100vqk4kq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 May 2020 14:38:55 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8996610002A;
 Thu, 14 May 2020 14:38:55 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 786702B8A1F;
 Thu, 14 May 2020 14:38:55 +0200 (CEST)
Received: from lmecxl0912.tpe.st.com (10.75.127.46) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Thu, 14 May
 2020 14:38:51 +0200
To: <mani@kernel.org>, <robh+dt@kernel.org>, <mcoquelin.stm32@gmail.com>
References: <20200503154215.23654-1-mani@kernel.org>
From: Alexandre Torgue <alexandre.torgue@st.com>
Message-ID: <abbd6fd1-ec74-3ae5-b041-d31dfc5ded82@st.com>
Date: Thu, 14 May 2020 14:38:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200503154215.23654-1-mani@kernel.org>
Content-Language: en-US
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG4NODE2.st.com (10.75.127.11) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.676
 definitions=2020-05-14_03:2020-05-14,
 2020-05-14 signatures=0
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v2 0/6] Add Stinger96 and IoT Box board
	support
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

Hi Mani

On 5/3/20 5:42 PM, mani@kernel.org wrote:
> From: Manivannan Sadhasivam <mani@kernel.org>
> 
> Hello,
> 
> This series adds Stinger96 and IoT Box board support. These boards are
> based on STM32MP157A SoC, designed and manufactured by Shiratech solutions.
> 
> The Stinger96 is a base board (96Boards IoT Extended edition) while IoT Box
> adds one mezzanine on top of it and sold as a gateway device.
> 
> This series depends on below patchsets already submitted and gone through
> reviews:
> 
> [PATCH v3 0/3] Add Reset and Wakeup support for CCS811
> [PATCH v3 0/2] Add CTS/RTS gpio support to STM32 UART
> 
> More information about these boards can be found in below links:
> 
> https://www.shiratech-solutions.com/products/stinger96/
> https://www.shiratech-solutions.com/products/iot-box/
> 
> Thanks,
> Mani
> 

Series applied on stm32-next.

Regards
Alex

> Changes in v2:
> 
> * Used "stm32" prefix for all DT commits
> * Dropped custom sdmmc2 pinctrl node since existing node itself has pullup
>    enabled and works fine.
> 
> Manivannan Sadhasivam (6):
>    dt-bindings: Add vendor prefix for Shiratech Solutions
>    ARM: dts: stm32: Add missing pinctrl entries for STM32MP15
>    dt-bindings: arm: stm32: Document Stinger96 compatible
>    ARM: dts: stm32: Add Stinger96 board support
>    dt-bindings: arm: stm32: Document IoT Box compatible
>    ARM: dts: stm32: Add IoT Box board support
> 
>   .../devicetree/bindings/arm/stm32/stm32.yaml  |   2 +
>   .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
>   arch/arm/boot/dts/Makefile                    |   2 +
>   arch/arm/boot/dts/stm32mp15-pinctrl.dtsi      |  64 ++++
>   arch/arm/boot/dts/stm32mp157a-iot-box.dts     |  68 ++++
>   arch/arm/boot/dts/stm32mp157a-stinger96.dts   |  12 +
>   arch/arm/boot/dts/stm32mp157a-stinger96.dtsi  | 342 ++++++++++++++++++
>   7 files changed, 492 insertions(+)
>   create mode 100644 arch/arm/boot/dts/stm32mp157a-iot-box.dts
>   create mode 100644 arch/arm/boot/dts/stm32mp157a-stinger96.dts
>   create mode 100644 arch/arm/boot/dts/stm32mp157a-stinger96.dtsi
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
