Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 86F60728333
	for <lists+linux-stm32@lfdr.de>; Thu,  8 Jun 2023 17:01:52 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0B6CEC65E70;
	Thu,  8 Jun 2023 15:01:52 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5B2BAC65E42
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  8 Jun 2023 15:01:50 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 358DjZ7E007815; Thu, 8 Jun 2023 17:01:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=6Et4cvFIq/pKVgDeMHIzyzLsDRyen07hsz6FgsksPLs=;
 b=0PfqoVX20UfGueEXgB40GQuDTAo+PnF6KJtQYLQB+4AN0ZTzWj19x8eAoHzdrE2qsJ0G
 gGe/v+iBeTYLPs8WSVLDTL6WhinZPYJh5WacS6Z0pSEsXhGeWIqI5jpgEskW7AfQmAz8
 YS5EkICuVaHjijs9ojTV+YAUlkJ4qevrDGOGWS2LysWI6TCFtOjTNP77DJ3NRnGnNWb3
 cGktge5Ls6LNH8opY9SdG8VrAmr36A2z4fui0DsJtldL8ncS06ATEtaZcDY2lIAMUl/v
 z0EgRY4ojd8YMzFMQ9hLJ6QdAEXKbwLRWJc2TLNR1aWbH2nF7oMPKIcNM0EpBu3JQT1d Eg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3r3cax27g3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 08 Jun 2023 17:01:35 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5DC0D10003A;
 Thu,  8 Jun 2023 17:01:34 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3D16B23695F;
 Thu,  8 Jun 2023 17:01:34 +0200 (CEST)
Received: from [10.201.21.93] (10.201.21.93) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Thu, 8 Jun
 2023 17:01:32 +0200
Message-ID: <59f4a900-34ee-d991-c350-265d38e7c862@foss.st.com>
Date: Thu, 8 Jun 2023 17:01:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Catalin
 Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Arnd
 Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, <soc@kernel.org>
References: <20230602132859.16442-1-alexandre.torgue@foss.st.com>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20230602132859.16442-1-alexandre.torgue@foss.st.com>
X-Originating-IP: [10.201.21.93]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-08_10,2023-06-08_01,2023-05-22_02
Cc: devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v2 00/10] Add STM32MP25 support
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

Hi

On 6/2/23 15:28, Alexandre Torgue wrote:
> I'm pleased to announce extension of the STM32 MPU family with the addition of
> the STM32MP25 Armv8 based SoCs.
> 
> STM32MP25 family is composed of 4 SoCs defined as following:
> 
>    -STM32MP251: common part composed of 1*Cortex-A35, common peripherals like
>     SDMMC, UART, SPI, I2C, PCIe, USB3, parallel and DSI display, 1*ETH ...
> 
>    -STM32MP253: STM32MP251 + 1*Cortex-A35 (dual CPU), a second ETH, CAN-FD and
>     LVDS display.
> 
>    -STM32MP255: STM32MP253 + GPU/AI and video encode/decode.
>    -STM32MP257: STM32MP255 + ETH TSN switch (2+1 ports).
> 
>    A second diversity layer exists for security features/ A35 frequency:
>    -STM32MP25xY, "Y" gives information:
>      -Y = A means A35@1.2GHz + no cryp IP and no secure boot.
>      -Y = C means A35@1.2GHz + cryp IP and secure boot.
>      -Y = D means A35@1.5GHz + no cryp IP and no secure boot.
>      -Y = F means A35@1.5GHz + cryp IP and secure boot.
> 
> This series adds the STM32MP257F EV1 board support. This board embeds a
> STM32MP257FAI SoC, with 4GB of DDR4, TSN switch (2+1 ports), 2*USB typeA,
> 1*USB2 typeC, SNOR OctoSPI, mini PCIe, STPMIC2 for power distribution ...
> 
> Changes since v1:
> 
> -Add Conor "reviewed-by".
> -Drop patch[4] of initial series to not define SoC without board in stm32,yaml.
> -Add Krzysztof "Acked-by" after reordering enum in st,stm32-syscon.yaml
> 
> Thanks
> Alex
> 
> Alexandre Torgue (9):
>    dt-bindings: pinctrl: stm32: support for stm32mp257 and additional
>      packages
>    pinctrl: stm32: add stm32mp257 pinctrl support
>    arm64: introduce STM32 family on Armv8 architecture
>    arm64: dts: st: introduce stm32mp25 SoCs family
>    arm64: dts: st: introduce stm32mp25 pinctrl files
>    dt-bindings: stm32: document stm32mp257f-ev1 board
>    arm64: dts: st: add stm32mp257f-ev1 board support
>    arm64: defconfig: enable ARCH_STM32 and STM32 serial driver
>    MAINTAINERS: add entry for ARM/STM32 ARCHITECTURE
> 
> Patrick Delaunay (1):
>    dt-bindings: stm32: add st,stm32mp25-syscfg compatible for syscon
> 

Series applied on stm32-next.

Regards
Alex

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
