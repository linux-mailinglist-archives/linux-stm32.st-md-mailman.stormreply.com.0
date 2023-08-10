Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DF85C777893
	for <lists+linux-stm32@lfdr.de>; Thu, 10 Aug 2023 14:36:11 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9807CC6B469;
	Thu, 10 Aug 2023 12:36:11 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E5375C6907A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Aug 2023 12:36:10 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 37ACFZBp017767; Thu, 10 Aug 2023 14:35:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=0T7Rg2lU27wBJcvPApX+ZRcZnKoy8Ze8aqeV+poDlHY=; b=j0
 6NU18S0325zaon9+rfW7FxRZfYjtk9zPfqUM6I5HXMfAbpqaHotlFcB4PZ7rHLxo
 TneY88iXFZQI5IO15l6PG/+waGNrd36IzYjArdRU46gC8VgLQ/qk8CsWu+8VL9BL
 U1SHNL4Z8lrwdDxVtzKpjdZFwxYlwmIYM8NCvvplmA2xo+JZjEhHLKYjUi7WdQ77
 3h160UPCMU57/Cvl2ixEalxYyvnp5bKAWUbBiW/uNVqMB0ZyMT8L6i9iVwh7sRrD
 ABiw3x7dQ3C0nIANzbVDPjCW4SSdLFrIdoDAxqC99CTjoGfSQ86DnLtZmM/SPByb
 5Ya4i6R8VOiheJ+xPhxw==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3scdvdp3bj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Aug 2023 14:35:58 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BA25E100057;
 Thu, 10 Aug 2023 14:35:57 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node4.st.com [10.75.129.133])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id AFFCE2194E6;
 Thu, 10 Aug 2023 14:35:57 +0200 (CEST)
Received: from [10.201.21.122] (10.201.21.122) by EQNDAG1NODE4.st.com
 (10.75.129.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Thu, 10 Aug
 2023 14:35:57 +0200
Message-ID: <4da65f77-c170-f82d-efa7-1727a470bc9f@foss.st.com>
Date: Thu, 10 Aug 2023 14:35:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: <p.paillet@foss.st.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20230717134627.2064553-1-p.paillet@foss.st.com>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20230717134627.2064553-1-p.paillet@foss.st.com>
X-Originating-IP: [10.201.21.122]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To EQNDAG1NODE4.st.com
 (10.75.129.133)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-10_10,2023-08-10_01,2023-05-22_02
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: stm32: fix dts check warnings
	on stm32mp15-scmi
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

On 7/17/23 15:46, p.paillet@foss.st.com wrote:
> From: Pascal Paillet <p.paillet@foss.st.com>
> 
> Fix dts check warnings on stm32mp15-scmi reported by
> arm,scmi.yaml.
> 
> Signed-off-by: Pascal Paillet <p.paillet@foss.st.com>
> ---

No more YAML issue on ST SCMI boards. Thanks!

Applied on stm32-next.

Thanks.
Alex


>   arch/arm/boot/dts/st/stm32mp15-scmi.dtsi | 7 +++----
>   1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/st/stm32mp15-scmi.dtsi b/arch/arm/boot/dts/st/stm32mp15-scmi.dtsi
> index ad2584213d99..dc3b09f2f2af 100644
> --- a/arch/arm/boot/dts/st/stm32mp15-scmi.dtsi
> +++ b/arch/arm/boot/dts/st/stm32mp15-scmi.dtsi
> @@ -34,22 +34,21 @@ scmi_reguls: regulators {
>   					#address-cells = <1>;
>   					#size-cells = <0>;
>   
> -					scmi_reg11: reg11@0 {
> +					scmi_reg11: regulator@0 {
>   						reg = <0>;
>   						regulator-name = "reg11";
>   						regulator-min-microvolt = <1100000>;
>   						regulator-max-microvolt = <1100000>;
>   					};
>   
> -					scmi_reg18: reg18@1 {
> -						voltd-name = "reg18";
> +					scmi_reg18: regulator@1 {
>   						reg = <1>;
>   						regulator-name = "reg18";
>   						regulator-min-microvolt = <1800000>;
>   						regulator-max-microvolt = <1800000>;
>   					};
>   
> -					scmi_usb33: usb33@2 {
> +					scmi_usb33: regulator@2 {
>   						reg = <2>;
>   						regulator-name = "usb33";
>   						regulator-min-microvolt = <3300000>;

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
