Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 75645B4209E
	for <lists+linux-stm32@lfdr.de>; Wed,  3 Sep 2025 15:13:46 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D5FFCC3FAC8;
	Wed,  3 Sep 2025 13:13:45 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DA471C3FAC7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 Sep 2025 13:13:44 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 583Cav0x002331;
 Wed, 3 Sep 2025 15:13:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 RXR6l5zH9EuL6ygVcZdx0q8KXP/yLgdiG12ZI87yuuE=; b=1XAqNyxb4d0nLr+5
 /nhC7xFCng4Jy7BmFmFwA/fpX3aQlJxJ5gqJ9vIIptA1g7UdVjnJkMSizX/xx1yt
 uJqY1ad5BbFYKSNncLqKqzBvnraO1r5QNIjc/JtP59wmhkFekHmeVArisrcVmAmd
 Mi4FpTXOJ8JLMyAlzf+J7sMUXkz8BrXcYvjkRr5/g2CKbLF0ASzOGFqDTZFyNzvL
 zWWLtppycLqkRe0PccSj0f7qAByaCMOIMD8/KNC4vqvdA1hS0mOTjjpnG0Ykbz/y
 Sc6Iy/gcH20DLowj/lHthmw5rXjWUAAz3BgYUCLzlGBttwwFTlmHbG6ZkxIQLX8N
 okP9Og==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48ur6frhek-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 Sep 2025 15:13:25 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id DD40540045;
 Wed,  3 Sep 2025 15:11:33 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D9020290800;
 Wed,  3 Sep 2025 15:10:43 +0200 (CEST)
Received: from [10.48.86.79] (10.48.86.79) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Wed, 3 Sep
 2025 15:10:43 +0200
Message-ID: <59f25804-d310-4492-b95f-19c42cf3cd42@foss.st.com>
Date: Wed, 3 Sep 2025 15:10:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Marc Kleine-Budde <mkl@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Chandrasekar Ramakrishnan
 <rcsekar@samsung.com>, Vincent Mailhol <mailhol.vincent@wanadoo.fr>
References: <20250807-stm32mp15-m_can-add-reset-v2-0-f69ebbfced1f@pengutronix.de>
 <20250807-stm32mp15-m_can-add-reset-v2-2-f69ebbfced1f@pengutronix.de>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20250807-stm32mp15-m_can-add-reset-v2-2-f69ebbfced1f@pengutronix.de>
X-Originating-IP: [10.48.86.79]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_07,2025-08-28_01,2025-03-28_01
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-can@vger.kernel.org, kernel@pengutronix.de,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 2/2] ARM: dts: stm32: add resets
 property to m_can nodes in the stm32mp153
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

Hi Marc

On 8/7/25 08:09, Marc Kleine-Budde wrote:
> On the STM32MP153 the m_cam IP cores (a.k.a. FDCAN) have an external
> shared reset in the RCC. Add the reset to both m_can nodes.
> 
> Signed-off-by: Marc Kleine-Budde <mkl@pengutronix.de>
> ---
>   arch/arm/boot/dts/st/stm32mp153.dtsi | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/st/stm32mp153.dtsi b/arch/arm/boot/dts/st/stm32mp153.dtsi
> index 4640dafb1598..92794b942ab2 100644
> --- a/arch/arm/boot/dts/st/stm32mp153.dtsi
> +++ b/arch/arm/boot/dts/st/stm32mp153.dtsi
> @@ -40,6 +40,7 @@ m_can1: can@4400e000 {
>   		interrupt-names = "int0", "int1";
>   		clocks = <&rcc CK_HSE>, <&rcc FDCAN_K>;
>   		clock-names = "hclk", "cclk";
> +		resets = <&rcc FDCAN_R>;
>   		bosch,mram-cfg = <0x0 0 0 32 0 0 2 2>;
>   		access-controllers = <&etzpc 62>;
>   		status = "disabled";
> @@ -54,6 +55,7 @@ m_can2: can@4400f000 {
>   		interrupt-names = "int0", "int1";
>   		clocks = <&rcc CK_HSE>, <&rcc FDCAN_K>;
>   		clock-names = "hclk", "cclk";
> +		resets = <&rcc FDCAN_R>;
>   		bosch,mram-cfg = <0x1400 0 0 32 0 0 2 2>;
>   		access-controllers = <&etzpc 62>;
>   		status = "disabled";
> 

How those reset are handled at driver side ?

regards
alex
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
