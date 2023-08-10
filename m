Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7264F777C92
	for <lists+linux-stm32@lfdr.de>; Thu, 10 Aug 2023 17:47:59 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3A992C6B469;
	Thu, 10 Aug 2023 15:47:59 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 79131C6B45B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Aug 2023 15:47:58 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 37AAhdPr010790; Thu, 10 Aug 2023 17:47:49 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=+8oaslCT+ySloCGvSRBA72rt/I5W3Gy/eqUNGcDpjY4=; b=S4
 ESgDcOUV/vvzFpDYofdLK7wyaj61BfVY6W3oG2wrqXb0CiPi7iGqwAHj/gabhSae
 iOTRa0m8+KIidXqZ2DMOeWb8zIeQFZOMI0msj9fQlnHRzHzdqQHsJZzODMTI5GZc
 qW8xtprJSJMyPvTtAUqFnyYOWgMJiyX1sZoFm/8O3+75f1m4qodpPMn6LgFpulXS
 cwsupm1ib5SkPGGIgzqD9QYcyBY6aHl8a9UOVrcKnmPIx7yO2rcdNtA6wcaHQ8/+
 mSm3uo9SrP/n3cEUsareM/ylp2hjel5scFli8u2oGF6GL0sP44+K0aNcLtpZCaWS
 4jGFcclmSVMLod1Dg2mg==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3sctu3u8hf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Aug 2023 17:47:49 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 71ABE100053;
 Thu, 10 Aug 2023 17:47:48 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node4.st.com [10.75.129.133])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6623421862A;
 Thu, 10 Aug 2023 17:47:48 +0200 (CEST)
Received: from [10.201.21.122] (10.201.21.122) by EQNDAG1NODE4.st.com
 (10.75.129.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Thu, 10 Aug
 2023 17:47:47 +0200
Message-ID: <e5281c0b-371e-156b-9bed-09ef3b6df4a1@foss.st.com>
Date: Thu, 10 Aug 2023 17:47:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Linus Walleij
 <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Patrice Chotard <patrice.chotard@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>
References: <20230730174954.5293-1-krzysztof.kozlowski@linaro.org>
 <20230730174954.5293-2-krzysztof.kozlowski@linaro.org>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20230730174954.5293-2-krzysztof.kozlowski@linaro.org>
X-Originating-IP: [10.201.21.122]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To EQNDAG1NODE4.st.com
 (10.75.129.133)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-10_13,2023-08-10_01,2023-05-22_02
Subject: Re: [Linux-stm32] [PATCH v2 2/4] ARM: dts: st: stm32mp157c-emstamp:
 correct regulator-active-discharge
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

On 7/30/23 19:49, Krzysztof Kozlowski wrote:
> The "regulator-active-discharge" property is uint32, not boolean:
> 
>    stm32mp157c-emsbc-argon.dtb: stpmic@33: regulators:pwr_sw1:regulator-active-discharge: True is not of type 'array'
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Changes in v2:
> 1. None
> ---
>   arch/arm/boot/dts/st/stm32mp157c-emstamp-argon.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/st/stm32mp157c-emstamp-argon.dtsi b/arch/arm/boot/dts/st/stm32mp157c-emstamp-argon.dtsi
> index f8e9980ed3d4..009209ca673b 100644
> --- a/arch/arm/boot/dts/st/stm32mp157c-emstamp-argon.dtsi
> +++ b/arch/arm/boot/dts/st/stm32mp157c-emstamp-argon.dtsi
> @@ -320,7 +320,7 @@ bst_out: boost {
>   			vbus_otg: pwr_sw1 {
>   				regulator-name = "vbus_otg";
>   				interrupts = <IT_OCP_OTG 0>;
> -				regulator-active-discharge;
> +				regulator-active-discharge = <1>;
>   			};
>   
>   			vbus_usbh: pwr_sw2 {

Applied on stm32-next.

Thanks.
Alex
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
