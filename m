Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 13E6C667AC7
	for <lists+linux-stm32@lfdr.de>; Thu, 12 Jan 2023 17:28:42 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 97FDAC65E45;
	Thu, 12 Jan 2023 16:28:41 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C72E0C6334A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Jan 2023 16:28:40 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 7134985405;
 Thu, 12 Jan 2023 17:28:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1673540920;
 bh=EN/egfl+RWRqGe9kuXZHtWvRoQNrYeHrMo8CDmwf6F4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=0Q4jfY2yYtG5HdyWahg+92OTb31gYfMv6vcvF64Pd/GI0aBfwgtWZKuKRLeYJJjun
 fgjMv12XeRP4lG0iIwhaEHmY3AvDDwxhzIYYdHpMG6DvgwLpRY49M+gHZbBCqS9sqb
 s/GfevAwIngULX4SiKMm8r0Njs1KI9Hke6JWQ2zf3U9KQ+S2l946D/vVIdqLMoS5tS
 S1JJHanv2zVO5582Sd9ffX35Br0+r7T8JlRqqBde0i9lIRUkYNLnYCeO5EQDwOSKpu
 9Q3S5zBweUXKbeesZSzvfdJyrPDkYEjvw6jAkjR29OZPOoSdysIBsuq2QvWLVhkqoS
 5x/szUwajA8bg==
Message-ID: <bc75d243-b2dc-6192-1b93-0a15d3fe5639@denx.de>
Date: Thu, 12 Jan 2023 15:28:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
To: Olivier Moysan <olivier.moysan@foss.st.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
References: <20230112104446.1140551-1-olivier.moysan@foss.st.com>
 <20230112104446.1140551-7-olivier.moysan@foss.st.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20230112104446.1140551-7-olivier.moysan@foss.st.com>
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Cc: devicetree@vger.kernel.org, kernel@dh-electronics.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 06/10] ARM: dts: stm32: adopt generic iio
 bindings for adc channels on avenger96
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

On 1/12/23 11:44, Olivier Moysan wrote:
> Use STM32 ADC generic bindings instead of legacy bindings on
> Avenger96 board.
> 
> The STM32 ADC specific binding to declare channels has been deprecated,
> hence adopt the generic IIO channels bindings, instead.
> The STM32MP151 device tree now exposes internal channels using the
> generic binding. This makes the change mandatory here to avoid a mixed
> use of legacy and generic binding, which is not supported by the driver.
> 
> Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
> ---
>   .../boot/dts/stm32mp15xx-dhcor-avenger96.dtsi | 28 ++++++++++++++++---
>   1 file changed, 24 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/stm32mp15xx-dhcor-avenger96.dtsi b/arch/arm/boot/dts/stm32mp15xx-dhcor-avenger96.dtsi
> index 50af4a27d6be..62efb550ae64 100644
> --- a/arch/arm/boot/dts/stm32mp15xx-dhcor-avenger96.dtsi
> +++ b/arch/arm/boot/dts/stm32mp15xx-dhcor-avenger96.dtsi
> @@ -113,15 +113,35 @@ &adc {
>   	status = "okay";
>   
>   	adc1: adc@0 {
> -		st,adc-channels = <0 1 6>;
> -		st,min-sample-time-nsecs = <5000>;

U-Boot drivers/adc/stm32-adc.c depends on these properties , so if you 
drop them here and U-Boot DTs gets synced with Linux, the ADC driver 
there will start failing. Can you update the U-Boot ADC driver too ?

Maybe the easiest way would be to retain the old properties for now with 
a comment, and add the new properties ?
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
