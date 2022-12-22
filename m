Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F79F653E4D
	for <lists+linux-stm32@lfdr.de>; Thu, 22 Dec 2022 11:30:27 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5267BC6904C;
	Thu, 22 Dec 2022 10:30:27 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 69CFFC69048
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 22 Dec 2022 10:30:25 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D2F13B81CF9;
 Thu, 22 Dec 2022 10:30:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 988A2C433D2;
 Thu, 22 Dec 2022 10:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1671705023;
 bh=vUcSd9J2/pd1O0FG8ub/N5/m3MO3FZNyWwtsGOBo2Ww=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=JJlDCVl2gTQ5OkZojlxa+xBwc1t19Hs+3PB2smEQ6GYOOZmoeQ2Yh00SE9ZqGvj32
 rXZphqCK/ZRYj/NUVTpMWGb2MvZL6cUUKCuVypiS+S171wVj8wJt7+3XL6s6tFWeFO
 Q+REsvNpj+th4kooz1Att2S+2BDdyAYhBnNjmcbgvz/nsz//NL99xKZykvodqslrl6
 Jm35ssvPtb77Z/BzIWZFSt7q9goQAFfaD1VuQpimS7XpiEf30P6H4OYqeLYnWaQQ7p
 qCV0Pv8kvO57I5pjPD63mut1owm7i5oKV11HFMY904xn/P1IuviL3hkUsZP3YTZHCC
 3+ij9OO/A+2KQ==
Message-ID: <2e7c901c-e322-ded6-b170-6d2436d74c0f@kernel.org>
Date: Thu, 22 Dec 2022 11:30:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: en-US
To: Gatien Chevallier <gatien.chevallier@foss.st.com>,
 alexandre.torgue@foss.st.com, robh+dt@kernel.org,
 Oleksii_Moisieiev@epam.com, linus.walleij@linaro.org,
 gregkh@linuxfoundation.org
References: <20221221173055.11719-1-gatien.chevallier@foss.st.com>
 <20221221173055.11719-7-gatien.chevallier@foss.st.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20221221173055.11719-7-gatien.chevallier@foss.st.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, arnd@arndb.de,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [RFC PATCH 6/7] ARM: dts: stm32: add ETZPC as a
 system bus for STM32MP15x boards
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

On 21/12/2022 18:30, Gatien Chevallier wrote:
> The STM32 System Bus is an internal bus on which devices are connected.
> ETZPC is a peripheral overseeing the firewall bus that configures
> and control access to the peripherals connected on it.
> 
> For more information on which peripheral is securable, please read
> the STM32MP15 reference manual.
> 
> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
> ---
>  arch/arm/boot/dts/stm32mp151.dtsi | 2737 +++++++++++++++--------------
>  1 file changed, 1406 insertions(+), 1331 deletions(-)
>  
> -		lptimer1: timer@40009000 {
> +		etzpc: etzpc@5c007000 {

Node names should be generic.
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation

> +			compatible = "st,stm32mp15-sys-bus";
> +			reg = <0x5c007000 0x400>;
>  			#address-cells = <1>;
> -			#size-cells = <0>;
> -			compatible = "st,stm32-lptimer";
> -			reg = <0x40009000 0x400>;
> -			interrupts-extended = <&exti 47 IRQ_TYPE_LEVEL_HIGH>;
> -			clocks = <&rcc LPTIM1_K>;
> -			clock-names = "mux";
> -			wakeup-source;
> -			status = "disabled";

Why entire bus is disabled? What resources do you miss?

> +			#size-cells = <1>;
> +			feature-domain-controller;
> +			#feature-domain-cells = <2>;
> +			ranges;
>  
Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
