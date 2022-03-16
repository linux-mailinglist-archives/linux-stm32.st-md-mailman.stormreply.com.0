Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 289D24DB053
	for <lists+linux-stm32@lfdr.de>; Wed, 16 Mar 2022 14:04:35 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CD679C5F1F2;
	Wed, 16 Mar 2022 13:04:34 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 20969C5EC6C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Mar 2022 13:04:33 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 22GAA8Yh009708;
 Wed, 16 Mar 2022 14:04:22 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=caLH5xorRCEoALX4pq7ufOB8VX+um3FujwLjscQI2h8=;
 b=n3cotjuT9QfJZ8TudzlmmakXMPIczQmnyDBqjgRXbOtBfTE3jysM7FkbnGnzeHiW/k4P
 TaK9S2d1KPfI8+jf1cK7L4vNc8d1fk9m4k4Bi8Er8tYD2XNEPOv9jcauTlY+8Dp0K0Cn
 DK/Pv6g/4MKBvbaMvjwEnxq/2JAOdzywlLlL9yEvIj78rviafd7C+M5lA8DXin5j9b03
 jgFCRtTXFnH2K1YjPn9koH5+oGKZ1ar2zu5GrR7Wp3DlEj8QUpgwghmXyAQu7LJ6d4mb
 lORWUvSfuEwWMIMVJNdbcM1HwrATJcLNFSRn9obh8OLd8h9N5AA8y75cKlVXy4yFL7M2 Og== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3et63hdn0h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Mar 2022 14:04:22 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C804B10002A;
 Wed, 16 Mar 2022 14:04:20 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id BFC4D2278A3;
 Wed, 16 Mar 2022 14:04:20 +0100 (CET)
Received: from [10.201.22.79] (10.75.127.45) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Wed, 16 Mar
 2022 14:04:20 +0100
Message-ID: <ba05cd7e-0c1a-5188-f92a-20eb243789ab@foss.st.com>
Date: Wed, 16 Mar 2022 14:04:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski@canonical.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
References: <20220316124553.6818-1-gabriel.fernandez@foss.st.com>
From: Gabriel FERNANDEZ <gabriel.fernandez@foss.st.com>
In-Reply-To: <20220316124553.6818-1-gabriel.fernandez@foss.st.com>
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-16_04,2022-03-15_01,2022-02-23_01
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v3 00/13] Introduction of STM32MP13 RCC
 driver (Reset Clock Controller)
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

Sorry, this series is incomplete due to a firewall issue.

I will resend it.

Best regards

Gabriel


On 3/16/22 13:45, gabriel.fernandez@foss.st.com wrote:
> From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
>
> v3:
>    - cosmetic change from Stephen Boyd
>    - rename some functions in clk-stm32-core
>    - add missing static for variables or functions
>
> v2:
>    - Resend because patch 9,10,12,13 has not been sent
>    - add Reviewed by Krzysztof Kozlowski for patch 1
>
> Gabriel Fernandez (13):
>    dt-bindings: rcc: stm32: add new compatible for STM32MP13 SoC
>    clk: stm32: Introduce STM32MP13 RCC drivers (Reset Clock Controller)
>    clk: stm32mp13: add stm32_mux clock management
>    clk: stm32mp13: add stm32_gate management
>    clk: stm32mp13: add stm32 divider clock
>    clk: stm32mp13: add composite clock
>    clk: stm32mp13: manage secured clocks
>    clk: stm32mp13: add all STM32MP13 peripheral clocks
>    clk: stm32mp13: add all STM32MP13 kernel clocks
>    clk: stm32mp13: add multi mux function
>    clk: stm32mp13: add safe mux management
>    ARM: dts: stm32: enable optee firmware and SCMI support on STM32MP13
>    ARM: dts: stm32: add RCC on STM32MP13x SoC family
>
>   .../bindings/clock/st,stm32mp1-rcc.yaml       |    2 +
>   arch/arm/boot/dts/stm32mp131.dtsi             |  128 +-
>   arch/arm/boot/dts/stm32mp133.dtsi             |    4 +-
>   arch/arm/boot/dts/stm32mp13xf.dtsi            |    3 +-
>   drivers/clk/Kconfig                           |    5 +
>   drivers/clk/Makefile                          |    1 +
>   drivers/clk/stm32/Makefile                    |    1 +
>   drivers/clk/stm32/clk-stm32-core.c            |  695 +++++++
>   drivers/clk/stm32/clk-stm32-core.h            |  188 ++
>   drivers/clk/stm32/clk-stm32mp13.c             | 1620 +++++++++++++++
>   drivers/clk/stm32/reset-stm32.c               |  122 ++
>   drivers/clk/stm32/reset-stm32.h               |    8 +
>   drivers/clk/stm32/stm32mp13_rcc.h             | 1748 +++++++++++++++++
>   include/dt-bindings/clock/stm32mp13-clks.h    |  229 +++
>   include/dt-bindings/reset/stm32mp13-resets.h  |  100 +
>   15 files changed, 4794 insertions(+), 60 deletions(-)
>   create mode 100644 drivers/clk/stm32/Makefile
>   create mode 100644 drivers/clk/stm32/clk-stm32-core.c
>   create mode 100644 drivers/clk/stm32/clk-stm32-core.h
>   create mode 100644 drivers/clk/stm32/clk-stm32mp13.c
>   create mode 100644 drivers/clk/stm32/reset-stm32.c
>   create mode 100644 drivers/clk/stm32/reset-stm32.h
>   create mode 100644 drivers/clk/stm32/stm32mp13_rcc.h
>   create mode 100644 include/dt-bindings/clock/stm32mp13-clks.h
>   create mode 100644 include/dt-bindings/reset/stm32mp13-resets.h
>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
