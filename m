Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 43C149EAA75
	for <lists+linux-stm32@lfdr.de>; Tue, 10 Dec 2024 09:20:39 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 064D0C78006;
	Tue, 10 Dec 2024 08:20:39 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B5548C6DD6D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Dec 2024 08:20:37 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BA1j9qH011970;
 Tue, 10 Dec 2024 09:20:17 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 07Fd8DkwCPGnXqaDXNFNioTlMvSHdNYm3+AlnpXUsyU=; b=j8KEIdASWSUHpF4z
 jd0uFUpTuHZ18OSkyat11UB6tfPsMrMuYGGVefLXkbjNPdkOJlaLHNaADNpHHZrV
 PT/H2yE7F+qOO8HfMwMb9mc/miQ/CyoqqrkBTxZPNnqxzRHLlRjCgyrbxRwofIc+
 UFAFGkhxXdBKslAFP3OwbefvLfZ+sq/7kE38n4D/iY0v7Ye9P7RvhlLPBUXWBE72
 aoh80H6uULVoUf8MARzXouXotk6os6qnU6YlxQ1CFaP+oJUYHJ5lafrfycCxYZii
 ejodAnpCvshi4bjjrYW817twNqgzU29y/nxCSLdlXqLc4vswmScUScL9P/bXjTi1
 4tCzxg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 43e2w9jwp4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 Dec 2024 09:20:17 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 6214E40044;
 Tue, 10 Dec 2024 09:18:52 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 953E422AA44;
 Tue, 10 Dec 2024 09:16:00 +0100 (CET)
Received: from [10.48.86.79] (10.48.86.79) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Tue, 10 Dec
 2024 09:16:00 +0100
Message-ID: <ce05c6db-7baa-4268-96c5-fbefeee2e77f@foss.st.com>
Date: Tue, 10 Dec 2024 09:15:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Fabien
 Dessenne <fabien.dessenne@foss.st.com>
References: <20241206171759.135342-1-arnaud.pouliquen@foss.st.com>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20241206171759.135342-1-arnaud.pouliquen@foss.st.com>
X-Originating-IP: [10.48.86.79]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: stm32: Fix IPCC EXTI
	declaration on stm32mp151
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

Hi Arnaud

On 12/6/24 18:17, Arnaud Pouliquen wrote:
> The GIC IRQ type used for IPCC RX should be IRQ_TYPE_LEVEL_HIGH.
> Replacing the interrupt with the EXTI event changes the type to
> the numeric value 1, meaning IRQ_TYPE_EDGE_RISING.
> 
> The issue is that EXTI event 61 is a direct event.The IRQ type of
> direct events is not used by EXTI and is propagated to the parent
> IRQ controller of EXTI, the GIC.
> 
> Align the IRQ type to the value expected by the GIC by replacing
> the second parameter "1" with IRQ_TYPE_LEVEL_HIGH.
> 
> Fixes: 7d9802bb0e34 ("ARM: dts: stm32: remove the IPCC "wakeup" IRQ on stm32mp151")
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> ---
>   arch/arm/boot/dts/st/stm32mp151.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/st/stm32mp151.dtsi b/arch/arm/boot/dts/st/stm32mp151.dtsi
> index b28dc90926bd..e7e3ce8066ec 100644
> --- a/arch/arm/boot/dts/st/stm32mp151.dtsi
> +++ b/arch/arm/boot/dts/st/stm32mp151.dtsi
> @@ -129,7 +129,7 @@ ipcc: mailbox@4c001000 {
>   			reg = <0x4c001000 0x400>;
>   			st,proc-id = <0>;
>   			interrupts-extended =
> -				<&exti 61 1>,
> +				<&exti 61 IRQ_TYPE_LEVEL_HIGH>,
>   				<&intc GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>;
>   			interrupt-names = "rx", "tx";
>   			clocks = <&rcc IPCC>;

Applied on stm32-next.

Alex
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
