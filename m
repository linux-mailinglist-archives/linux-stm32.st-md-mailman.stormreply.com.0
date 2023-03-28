Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C715E6CC36B
	for <lists+linux-stm32@lfdr.de>; Tue, 28 Mar 2023 16:53:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3BC91C6905A;
	Tue, 28 Mar 2023 14:53:47 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 835AAC03FC1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Mar 2023 14:53:45 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id w9so50916883edc.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Mar 2023 07:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680015225;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ntLeAvwYo13KTBL/y3l0lVOyzh8Kzne6sGlhIyPSqF8=;
 b=PXvhstG7uj98LaXH//8Mek02Wg4U3UZ8zfWHZSNsOZd8YJ4UxzaxecApgTd4fjZ3bj
 Bbyx2nHV5Jkki3PUzUCenleDE4DicrZVJbxFuqg6V0VUSSuywv7I2S8SHztMCn1otkQQ
 COj9zRgbEEh1Uy6oA/0mPXK+peu0cCCbTfRYpVKcZLw4HfVDCdzN9yho8QsoqWKlFcCm
 BhwEXX2U+uUUXKEzzfOKG5bqGYXPJWh/vKncrAAmds6Y6ejr52/Cesq1aSjEpg4UpMqu
 SOsS3fulziPQ74G83lOibK3hS1iAX/CYFRexVyORkzvtGJNoNR0s+D7VZEdxHUO9OF1/
 EIVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680015225;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ntLeAvwYo13KTBL/y3l0lVOyzh8Kzne6sGlhIyPSqF8=;
 b=wHZkZGsWhiiX1Aycgk9z5YSN7/fkSpco25CdorPPMgy9Hk9XAXvV+S/FD5ieH1gpqW
 m7+orLMc8oOoZJqdMDzXnhxII+MDjiMM3B7jgSPQ91uGpLgjFjcsgYkIBIu2JIsxG1v/
 o2MBcruAM0ySGhnWSuQwdXp7YLi95Scgm7JiZbOd62a77p9vf+8zehxvvCcUsnkQSFzh
 nvOizvXNSY20RsSFdgzrXamfgGABCcHtuo2bZHRXlZ/T+R3Bw/ED0+JfLX8FM6zG2eg7
 +D6F+Hll2jIiOA1gzKXrbwbaOkQCC+2ozgcT1s6EcDxbodT/Yj99fc1w1Eki7wsUcdfx
 1CEA==
X-Gm-Message-State: AAQBX9elQ63Ml3Mt/LyDv3Bs6PZTg4c9xlgnbWrRpqKxQjE/SBEsIr78
 FO5Yh3ODNODoluyub1956OUkMg==
X-Google-Smtp-Source: AKy350ZSEV0js3KfJtOUIg3AsvSN0lpPFcekKk98Ii0WXFpPSUOeYbhZinzigEa1AusquOGm8BnhLg==
X-Received: by 2002:aa7:d815:0:b0:4fd:2533:f56 with SMTP id
 v21-20020aa7d815000000b004fd25330f56mr15055439edq.39.1680015225030; 
 Tue, 28 Mar 2023 07:53:45 -0700 (PDT)
Received: from [10.105.135.205] ([88.128.92.162])
 by smtp.gmail.com with ESMTPSA id
 x21-20020a50d615000000b004bb810e0b87sm16032493edi.39.2023.03.28.07.53.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Mar 2023 07:53:44 -0700 (PDT)
Message-ID: <fc0738f5-0494-6142-56a4-ae3d0182a903@linaro.org>
Date: Tue, 28 Mar 2023 16:53:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-US
To: Christophe Kerello <christophe.kerello@foss.st.com>, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, alexandre.torgue@foss.st.com
References: <20230328122606.191211-1-christophe.kerello@foss.st.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230328122606.191211-1-christophe.kerello@foss.st.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: stm32: add FMC support on
	STM32MP13x SoC family
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On 28/03/2023 14:26, Christophe Kerello wrote:
> This patch adds the FMC support on STM32MP13x SoC family.

Do not use "This commit/patch", but imperative mood. See:
https://elixir.bootlin.com/linux/v5.17.1/source/Documentation/process/submitting-patches.rst#L95

> 
> Signed-off-by: Christophe Kerello <christophe.kerello@foss.st.com>
> ---
>  arch/arm/boot/dts/stm32mp131.dtsi | 34 +++++++++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/stm32mp131.dtsi b/arch/arm/boot/dts/stm32mp131.dtsi
> index 5949473cbbfd..7af3eb15c204 100644
> --- a/arch/arm/boot/dts/stm32mp131.dtsi
> +++ b/arch/arm/boot/dts/stm32mp131.dtsi
> @@ -1137,6 +1137,40 @@ mdma: dma-controller@58000000 {
>  			dma-requests = <48>;
>  		};
>  
> +		fmc: memory-controller@58002000 {
> +			#address-cells = <2>;
> +			#size-cells = <1>;
> +			compatible = "st,stm32mp1-fmc2-ebi";
> +			reg = <0x58002000 0x1000>;


compatible is first, reg is second. ranges if present should be third.

> +			clocks = <&rcc FMC_K>;
> +			resets = <&rcc FMC_R>;
> +			status = "disabled";
> +
> +			ranges = <0 0 0x60000000 0x04000000>, /* EBI CS 1 */

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
