Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CCD879B4EEF
	for <lists+linux-stm32@lfdr.de>; Tue, 29 Oct 2024 17:10:02 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7F1B8C71290;
	Tue, 29 Oct 2024 16:10:02 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 90DC9C6C855
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Oct 2024 16:09:55 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49TCNSpI003954;
 Tue, 29 Oct 2024 17:09:35 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 mlpdC8mFCPwe2o0w0fb76h8sou5C6CVNydIQ0/PBzC0=; b=Y9E/AM1WSAbbk9Dw
 BabgcvIpY+DAMb7QjytTXHzEJSngXLt+/i5D0W1Pj9JvPBOcCF4qIcm8789qOlTE
 w/B2ukCqqVfzG2W1puXme/Q1EkfJW4mwzP2ewVC1jKfc+lFvA1m/OU5hwblDe+v0
 IPh4bjUpfpGxYkdbrTpLLXfKk3h8WCB7JKYquxNmVwpWKHTpVb2kh78enIUPr1kS
 LlM36U1MIE8/ZsQhhECjBsdGfLxX2X1peION1pi0+ABd0PVzT5IQPx+Jotc0hnim
 u8mUNpSeHsTvlbnWLZK1oy3ehLto6VHA5RUoRlMGwdDXtTfsF2gZtKn3uZ3TP5Nd
 3hwE6g==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 42gqacqhhr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 29 Oct 2024 17:09:35 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 439A140073;
 Tue, 29 Oct 2024 17:08:19 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A8284268985;
 Tue, 29 Oct 2024 17:05:25 +0100 (CET)
Received: from [10.48.86.79] (10.48.86.79) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Tue, 29 Oct
 2024 17:05:24 +0100
Message-ID: <ecf451d3-8f9a-4e60-a36c-baa9a270f0c8@foss.st.com>
Date: Tue, 29 Oct 2024 17:05:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Gatien Chevallier <gatien.chevallier@foss.st.com>, Olivia Mackall
 <olivia@selenic.com>, Herbert Xu <herbert@gondor.apana.org.au>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Lionel
 Debieve <lionel.debieve@foss.st.com>, <marex@denx.de>
References: <20241016-rng-mp25-v2-v4-0-5dca590cb092@foss.st.com>
 <20241016-rng-mp25-v2-v4-4-5dca590cb092@foss.st.com>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20241016-rng-mp25-v2-v4-4-5dca590cb092@foss.st.com>
X-Originating-IP: [10.48.86.79]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v4 4/4] arm64: dts: st: add RNG node on
	stm32mp251
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

Dear Gatien

On 10/16/24 10:04, Gatien Chevallier wrote:
> Update the device-tree stm32mp251.dtsi by adding the Random Number
> Generator(RNG) node.
> 
> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
> Reviewed-by: Marek Vasut <marex@denx.de>
> ---
> Changes in V3
> 	-Applied Marek tag
> 
> Changes in V2
> 	-Renamed RNG clocks to "core" and "bus"
> ---
>   arch/arm64/boot/dts/st/stm32mp251.dtsi | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
> index 1167cf63d7e87aaa15c5c1ed70a9f6511fd818d4..273da5f62294422b587b13404b499b5ffe6c148e 100644
> --- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
> +++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
> @@ -493,6 +493,16 @@ uart8: serial@40380000 {
>   				status = "disabled";
>   			};
>   
> +			rng: rng@42020000 {
> +				compatible = "st,stm32mp25-rng";
> +				reg = <0x42020000 0x400>;
> +				clocks = <&clk_rcbsec>, <&rcc CK_BUS_RNG>;
> +				clock-names = "core", "bus";
> +				resets = <&rcc RNG_R>;
> +				access-controllers = <&rifsc 92>;
> +				status = "disabled";
> +			};
> +
>   			spi8: spi@46020000 {
>   				#address-cells = <1>;
>   				#size-cells = <0>;
> 

Applied on stm32-next.

regards
Alex
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
