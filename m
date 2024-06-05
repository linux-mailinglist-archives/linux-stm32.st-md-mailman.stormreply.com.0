Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 39AF08FC4B7
	for <lists+linux-stm32@lfdr.de>; Wed,  5 Jun 2024 09:39:00 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DBCCEC6C855;
	Wed,  5 Jun 2024 07:38:59 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1E14AC6B47A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  5 Jun 2024 07:38:53 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 454NbIlB017454;
 Wed, 5 Jun 2024 09:38:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 38mexcFinmeYZ5CXGcnyNIf7y0LU4Ehs0MNrESWhWcE=; b=MCJpSfA8j+djdKSA
 GbK50nmQUsDObI2T1H1uYM8NCz9/bbR506v0asJnljCqnxkt/rRsTagMvROO/rVN
 sb5wv05+jS5Hbl5l1BYByNuRs21za1e8OgNX1Yt8WseBsFmX6fJIuTQ5M7DKeROd
 lBWJYMX4mPR98FyTnBK3o1Obq0BEnUXbj+IjuGJYP8l+y5zxJRPKRVS5tw1PD9lR
 167MZvkXT47IAsKKFQG8oFoi/hxbBPJA7LN/emYX4qvcBk9ch9fUyQqy+tMqaA/T
 47GJMh+3LV00h9qzULBWdTJboO6ZAMv8eJyLELNVqq8RRfsc1LhO+g15zd7EV5wx
 B4kmOA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3yfw91fh97-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 Jun 2024 09:38:43 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 3CF4740045;
 Wed,  5 Jun 2024 09:38:39 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9CF9E211959;
 Wed,  5 Jun 2024 09:38:09 +0200 (CEST)
Received: from [10.48.86.79] (10.48.86.79) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 5 Jun
 2024 09:38:09 +0200
Message-ID: <53bd5ee4-dbf0-48d1-b110-248d43bbbfa4@foss.st.com>
Date: Wed, 5 Jun 2024 09:38:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Valentin Caron <valentin.caron@foss.st.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
References: <20240520140024.3711080-1-valentin.caron@foss.st.com>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20240520140024.3711080-1-valentin.caron@foss.st.com>
X-Originating-IP: [10.48.86.79]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-04_11,2024-06-05_01,2024-05-17_01
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 0/3] arm64: dts: st: add usart nodes for
	stm32mp25
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

On 5/20/24 16:00, Valentin Caron wrote:
> STM32MP25 got the same serial hardware block as STM32MP1x but with two improvements:
>   - TX and RX FIFO have been extended to 64 bytes.
>   - one instance more than in STM32MP1x series (4x usart and 5x uart).
>   
> STM32MP257F-EV1 board has one usart used by console and one usart on IO port.
> 
> Valentin Caron (3):
>    arm64: dts: st: add usart nodes on stm32mp25
>    arm64: dts: st: add usart6 pinctrl used on stm32mp257f-ev1 board
>    arm64: dts: st: add usart6 on stm32mp257f-ev1 board
> 
>   arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi | 41 +++++++++++
>   arch/arm64/boot/dts/st/stm32mp251.dtsi        | 72 +++++++++++++++++++
>   arch/arm64/boot/dts/st/stm32mp257f-ev1.dts    | 10 +++
>   3 files changed, 123 insertions(+)
> 

Series applied on stm32-next.

thanks!!

Alex
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
