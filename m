Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E1A8AF8DD8
	for <lists+linux-stm32@lfdr.de>; Fri,  4 Jul 2025 11:12:56 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 37D76C36B2F;
	Fri,  4 Jul 2025 09:12:56 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D1405C36B2E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  4 Jul 2025 09:12:55 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5647Zsmm012108;
 Fri, 4 Jul 2025 11:12:46 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 o9vFHnH+10VgpguGO7CSDoz8TQTajPJNBGdmVoWn0WM=; b=aqQqbzM7yRmB9AiA
 xExSCXj2ZJY+0YRGwxXqL63PYmeEjiuE34qNGrmr0Ap9IQEZ+G47upZdb9+EiqNg
 eAhrP6gvxoretMVSCukaQqM8KXoGSTMbyI6NEEoWNjGqxmHxq7rIsMliK6TrOoD3
 P4CQhgxMaRmb15mh60ZSlAd/itqy9R/gWKIG4+KKM2IHMT8JR95FoLbTE1cRc/gs
 LCAh9ZDFUIgW0nI7Y+QLnZba/vR3dQL8ptwozFYIVqfnpmJopoWxwuH5cBCIiXAb
 EqoOwORtYh6Yx1+q0beeKVfLjMQ9+jlEuMhRd0j3cW/ierm+CuAaabIM20Ol2C01
 5QrfEA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47jubp9329-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Jul 2025 11:12:46 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 87A7A4004F;
 Fri,  4 Jul 2025 11:11:51 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6C28BA4D113;
 Fri,  4 Jul 2025 11:10:50 +0200 (CEST)
Received: from [10.48.86.79] (10.48.86.79) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 4 Jul
 2025 11:10:49 +0200
Message-ID: <7a56c778-0c46-49a4-8a83-ed7ec8355ef7@foss.st.com>
Date: Fri, 4 Jul 2025 11:10:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>, <lee@kernel.org>,
 <ukleinek@kernel.org>
References: <20250110091922.980627-1-fabrice.gasnier@foss.st.com>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20250110091922.980627-1-fabrice.gasnier@foss.st.com>
X-Originating-IP: [10.48.86.79]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_03,2025-07-02_04,2025-03-28_01
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
 linux-iio@vger.kernel.org, catalin.marinas@arm.com,
 linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, krzk+dt@kernel.org, will@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, jic23@kernel.org, wbg@kernel.org
Subject: Re: [Linux-stm32] [PATCH v3 0/8] Add STM32MP25 timers support: MFD,
 PWM, IIO and counter drivers
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

Hi Fabrie

On 1/10/25 10:19, Fabrice Gasnier wrote:
> This series adds STM32MP25 support on MFD PWM, IIO, counter timer drivers.
> This new timer variant is managed by using a new DT compatible string.
> It comes with a slightly updated register set, some new features and new
> interconnect signals inside the SoC. There is also a new instance (TIM20).
> Same feature list as on STM32MP1x is supported currently, except for PWM
> capture (not enabled, by DT).
> The device tree files add all instances in stm32mp251 dtsi. PWM, counter
> and trigger examples are provided for stm32mp257f-ev1 board.
> 
> Changes in V3
> ---
> - MFD updated since Lee's coments
> - IIO patch dropped since applied by Jonathan
> 
> Changes in V2
> ---
> - PMW driver updated to address Uwe's review comments
> - Collected Acked-by
> 
> Fabrice Gasnier (8):
>    dt-bindings: mfd: stm32-timers: add support for stm32mp25
>    mfd: stm32-timers: add support for stm32mp25
>    counter: stm32-timer-cnt: add support for stm32mp25
>    pwm: stm32: add support for stm32mp25
>    arm64: defconfig: enable STM32 timers drivers
>    arm64: dts: st: add timer nodes on stm32mp251
>    arm64: dts: st: add timer pins for stm32mp257f-ev1
>    arm64: dts: st: add timer nodes on stm32mp257f-ev1
> 
>   .../bindings/mfd/st,stm32-timers.yaml         |  18 +-
>   arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi |  61 ++
>   arch/arm64/boot/dts/st/stm32mp251.dtsi        | 524 ++++++++++++++++++
>   arch/arm64/boot/dts/st/stm32mp257f-ev1.dts    |  58 ++
>   arch/arm64/configs/defconfig                  |   4 +
>   drivers/counter/stm32-timer-cnt.c             |   7 +-
>   drivers/mfd/stm32-timers.c                    |  31 +-
>   drivers/pwm/pwm-stm32.c                       |  42 +-
>   include/linux/mfd/stm32-timers.h              |   9 +
>   9 files changed, 740 insertions(+), 14 deletions(-)
> 

Patches 5 to 8 applied on stm32-next.

Thanks
Alex
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
