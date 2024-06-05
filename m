Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 103338FC6B0
	for <lists+linux-stm32@lfdr.de>; Wed,  5 Jun 2024 10:38:51 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B8DF3C6C855;
	Wed,  5 Jun 2024 08:38:50 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 96A9FC62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  5 Jun 2024 08:38:43 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4557pqhU012938;
 Wed, 5 Jun 2024 10:38:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 yblqeVgdzJlkjjtIvKSnunjf6uXDlyqBWLVo+p3FKHA=; b=oNWrSzIQOFm31ylc
 7vtZZVTb1TAo9pOCH/+LEN0GQ4QQNU000CSGyQ2KV1xmicC/+bDIf/kHOjFLBuMl
 W0WxWGqNbRxNdjGVH0mB01fSUPcMT4EYL7pAlLgG+cdn3iPEtslo0SQe+Bba1yan
 A1X4DVNiW4/6fBTRznTIMvKRUhCK0HhtBQS1K/EYEIynvBq0+gIxKJrTZpwO2nzv
 6ZhLZ4Pr32aG7Z3rBGUDshStC7UFUXgIV8ZPDkzYrvruAHpN//EHLW8XRLAAkI7j
 kKn3eE70NgCAJ/G0oTz9q4ZnPeabbB2uPemCffPIwiBZ5ODrbzb9qzK8dSrav2lv
 U147hQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3yfw3wquse-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 Jun 2024 10:38:33 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 3E9FE40045;
 Wed,  5 Jun 2024 10:37:45 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 37C352132CD;
 Wed,  5 Jun 2024 10:37:11 +0200 (CEST)
Received: from [10.48.86.79] (10.48.86.79) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 5 Jun
 2024 10:37:10 +0200
Message-ID: <90eca010-2992-4fc4-99dc-2265610c4615@foss.st.com>
Date: Wed, 5 Jun 2024 10:37:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Yannick Fertre <yannick.fertre@foss.st.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Philippe Cornu <philippe.cornu@foss.st.com>,
 <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20240506144945.293966-1-yannick.fertre@foss.st.com>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20240506144945.293966-1-yannick.fertre@foss.st.com>
X-Originating-IP: [10.48.86.79]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-04_11,2024-06-05_01,2024-05-17_01
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: stm32: add goodix touchscreen
	on stm32mp135f-dk
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

Hi Yannick

On 5/6/24 16:49, Yannick Fertre wrote:
> Touchscreen reset needs to be configured
> via the pinctrl not the driver (a pull-down resistor
> has been soldered onto the reset line which forces
> the touchscreen to reset state).
> Interrupt line must have a pull-down resistor
> in order to freeze the i2c address at 0x5D.
> 
> Signed-off-by: Yannick Fertre <yannick.fertre@foss.st.com>
> ---
>   arch/arm/boot/dts/st/stm32mp13-pinctrl.dtsi | 22 +++++++++++++++++++++
>   arch/arm/boot/dts/st/stm32mp135f-dk.dts     | 14 +++++++++++++
>   2 files changed, 36 insertions(+)
> 

Applied on stm32-next.

Cheers!
alex
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
