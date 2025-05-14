Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DA546AB65DE
	for <lists+linux-stm32@lfdr.de>; Wed, 14 May 2025 10:26:55 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 81436C7128A;
	Wed, 14 May 2025 08:26:55 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 52C61C6C83D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 May 2025 08:26:54 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54E7vtKW023076;
 Wed, 14 May 2025 10:26:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 ds5+8iM4sRf0Jo4IyqmV53NfBcmFz2cJwNiJZ/wCrmk=; b=pMGlMrFN7CKCc5l+
 /xUdEV5gxnTpRkg4FOuwGXS51BtuZ1kYDbW2LqiQMA2nhQSxwBFpjwLYCC2AhmDk
 msfLU+TozS7alcR8HZhZhXZb623TTILmwa7sKOnjfrj5H6LqzSSBzRZvyWS96QXC
 IWewdZXh737I31ekESxstCKDAXVXyOg1jGM5JpXfULiVEi+6tUDx4AHPQbn9ke2c
 LGDbfmqBSsPHm40wvkDE9bbbYeAJlHl5fGiH4T7HQpRId+2j7ux8/eK9Vy/8e4s8
 2DWJq5H67SsCDvyIICQi6YLh8xDI53BVvYN7sh5Yup55vf0X5feVmbg0IB1O8w3z
 +IM2dA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46mbdxtj5k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 May 2025 10:26:24 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id C8B5240044;
 Wed, 14 May 2025 10:25:13 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1C3FDB3A736;
 Wed, 14 May 2025 10:24:03 +0200 (CEST)
Received: from [10.48.86.79] (10.48.86.79) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 14 May
 2025 10:24:02 +0200
Message-ID: <7f79af9a-2b42-48c0-98c5-6bf2afc61206@foss.st.com>
Date: Wed, 14 May 2025 10:24:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>, <daniel.lezcano@linaro.org>,
 <lee@kernel.org>, <tglx@linutronix.de>
References: <20250429125133.1574167-1-fabrice.gasnier@foss.st.com>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20250429125133.1574167-1-fabrice.gasnier@foss.st.com>
X-Originating-IP: [10.48.86.79]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_02,2025-05-14_02,2025-02-21_01
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
 linux-iio@vger.kernel.org, catalin.marinas@arm.com,
 linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org, ukleinek@kernel.org,
 linux-arm-kernel@lists.infradead.org, krzk+dt@kernel.org, will@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, jic23@kernel.org, wbg@kernel.org
Subject: Re: [Linux-stm32] (subset)[PATCH v6 0/7] Add STM32MP25 LPTIM
 support: MFD, PWM, IIO, counter, clocksource
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

Hi Fabrice

On 4/29/25 14:51, Fabrice Gasnier wrote:
> This series adds support for STM32MP25 to MFD PWM, IIO, counter and
> clocksource low-power timer (LPTIM) drivers.
> This new variant is managed by using a new DT compatible string, hardware
> configuration and version registers.
> It comes with a slightly updated register set, some new features and new
> interconnect signals inside the SoC.
> Same feature list as on STM32MP1x is supported currently.
> The device tree files add all instances in stm32mp251 dtsi file.
> 

Following patches are applied on stm32-next:

[PATCH v6 5/7] arm64: defconfig: enable STM32 LP timer clockevent driver
[PATCH v6 6/7] arm64: dts: st: add low-power timer nodes on stm32mp251
[PATCH v6 7/7] arm64: dts: st: use lptimer3 as tick broadcast source on 
stm32mp257f-ev1


Thanks
Alex
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
