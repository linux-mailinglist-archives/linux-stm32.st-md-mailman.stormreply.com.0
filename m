Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 599FDAA43D6
	for <lists+linux-stm32@lfdr.de>; Wed, 30 Apr 2025 09:25:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0AFDCC78F98;
	Wed, 30 Apr 2025 07:25:16 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 04551C78F96
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Apr 2025 07:25:14 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53TLZWv9026619;
 Wed, 30 Apr 2025 09:24:57 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 mMNXiGVHT3EYByl9G4cAVqtYt7CJdPa0zfJuctou39g=; b=RsAXGOcvtG5MYhS+
 rru5trvRuMubkIcK6u0oQXAofMrzyj79QTwYYJzzwbwVD9t6J+00aLFJH/PwdvA7
 f9NJQmsyy6ucrBEmyMfKS77MfzUczatFemBIiDp+Weyk+MWeITViBTz+nX2rWvvN
 4AUxvfFaTDS9CYsiqQJvtm68cFMk9tYPUCAmZydDLHhaXIdEzrhPrqyiNP/N/9rJ
 4obxzM+9HQu+buVk/2MV32waJxAJjTUQunoDNaMlx99kzZ95CwCW5wmp0YV24NPT
 pzsS/kE4Hnoc4sXbRWsLf17Yico7FZfQHB4GD+IH8q3+dRxmCIINZtj/0Os04F+C
 1iM8jQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46b6tmsmeu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Apr 2025 09:24:57 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 597974004A;
 Wed, 30 Apr 2025 09:23:13 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 080D7A54117;
 Wed, 30 Apr 2025 09:21:51 +0200 (CEST)
Received: from [10.48.86.79] (10.48.86.79) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 30 Apr
 2025 09:21:50 +0200
Message-ID: <bf7eddfa-ca7f-49a6-a3f9-574f2c4fe972@foss.st.com>
Date: Wed, 30 Apr 2025 09:21:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 <linux-kernel@vger.kernel.org>
References: <20250427074404.3278732-1-dario.binacchi@amarulasolutions.com>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20250427074404.3278732-1-dario.binacchi@amarulasolutions.com>
X-Originating-IP: [10.48.86.79]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-30_02,2025-04-24_02,2025-02-21_01
Cc: Marek Vasut <marex@denx.de>, Roan van Dijk <roan@protonic.nl>,
 Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 Russell King <linux@armlinux.org.uk>, linux-stm32@st-md-mailman.stormreply.com,
 Oleksij Rempel <o.rempel@pengutronix.de>, devicetree@vger.kernel.org,
 Marc Kleine-Budde <mkl@pengutronix.de>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, David Jander <david@protonic.nl>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 =?UTF-8?Q?Leonard_G=C3=B6hrs?= <l.goehrs@pengutronix.de>,
 linux-amarula@amarulasolutions.com, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 0/8] Support STM32h747i-disco board
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

Hi Dario

On 4/27/25 09:43, Dario Binacchi wrote:
> The series adds support for STM32h747i-disco board
> 
> The board includes an STM32H747XI SoC with the following resources:
>   - 2 Mbytes Flash
>   - 1 Mbyte SRAM
>   - LCD-TFT controller
>   - MIPI-DSI interface
>   - FD-CAN
>   - USB 2.0 high-speed/full-speed
>   - Ethernet MAC
>   - camera interface
> 
> Detailed information can be found at:
> https://www.st.com/en/evaluation-tools/stm32h747i-disco.html
> 
> 
> Dario Binacchi (8):
>    ARM: dts: stm32h7-pinctrl: add _a suffix to u[s]art_pins phandles
>    dt-bindings: arm: stm32: add compatible for stm32h747i-disco board
>    ARM: stm32: add a new SoC - STM32H747
>    clk: stm32h7: rename USART{7,8}_CK to UART{7,8}_CK
>    ARM: dts: stm32: add uart8 node for stm32h743 MCU
>    ARM: dts: stm32: add pin map for UART8 controller on stm32h743
>    ARM: dts: stm32: add an extra pin map for USART1 on stm32h743
>    ARM: dts: stm32: support STM32h747i-disco board
> 
>   .../devicetree/bindings/arm/stm32/stm32.yaml  |   4 +
>   arch/arm/boot/dts/st/Makefile                 |   1 +
>   arch/arm/boot/dts/st/stm32h7-pinctrl.dtsi     |  34 ++++-
>   arch/arm/boot/dts/st/stm32h743.dtsi           |   8 ++
>   arch/arm/boot/dts/st/stm32h743i-disco.dts     |   2 +-
>   arch/arm/boot/dts/st/stm32h743i-eval.dts      |   2 +-
>   arch/arm/boot/dts/st/stm32h747i-disco.dts     | 136 ++++++++++++++++++
>   arch/arm/boot/dts/st/stm32h750i-art-pi.dts    |   6 +-
>   arch/arm/mach-stm32/board-dt.c                |   1 +
>   include/dt-bindings/clock/stm32h7-clks.h      |   4 +-
>   10 files changed, 187 insertions(+), 11 deletions(-)
>   create mode 100644 arch/arm/boot/dts/st/stm32h747i-disco.dts
> 

Series applied on stm32-next. I changed patch 4 commit title according 
to Krzysztof comment.

Cheers
Alex
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
