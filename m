Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 56DAD9BF20E
	for <lists+linux-stm32@lfdr.de>; Wed,  6 Nov 2024 16:47:16 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3B2F2C6DD9D;
	Wed,  6 Nov 2024 15:47:15 +0000 (UTC)
Received: from mx3.securetransport.de (mx3.securetransport.de [116.203.31.6])
 (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EEF97C6B45B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  6 Nov 2024 15:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dh-electronics.com;
 s=dhelectronicscom; t=1730907995;
 bh=SUpD/adQtI0xP3Z1yxQhyvJ0tZgMbldcwT+hDS7al44=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=GKZH8J+CWD9n4KGgUxQjBUJ9zbTEmLJo0ZN15EQ1OU5WE9/3xZYSqjYouGrDUc+m3
 jgz1UH0MMhXmeggB+DvW4IvgBYMU7Bm44/n9j6kXymm5jF9HOu1E58ciljEiuJWYru
 6d1BditNMtUF90cSnHyzoGyjGC3iKh81vYu5mtaqGTh/FS8dB4JtNRs9vW6NXFxb2y
 48pWo4OsCfWBUy7/rhnEG6PLKKs96rwfm4zE6OEvWG97s/8L3xW8ndXKP4AyZd/ekQ
 1o6cT1ZQ+sLymt9Dn37y6o2xU08rE4FWgCy+38DlnZNyVkW6XMWg4+z3DFX64dGpOT
 Xam3zz1cpC5NQ==
X-secureTransport-forwarded: yes
From: Christoph Niedermaier <cniedermaier@dh-electronics.com>
Complaints-To: abuse@cubewerk.de
To: Marek Vasut <marex@denx.de>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>
Thread-Topic: [PATCH] ARM: dts: stm32: Deduplicate serial aliases and chosen
 node for STM32MP15xx DHCOM SoM
Thread-Index: AQHbL9rCDR++m5XnwEia1oSEi4J2B7KqZhfA
Date: Wed, 6 Nov 2024 15:46:32 +0000
Message-ID: <c4e579b989ed4a93bf6270175abd1869@dh-electronics.com>
References: <20241105233026.161463-1-marex@denx.de>
In-Reply-To: <20241105233026.161463-1-marex@denx.de>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 kernel <kernel@dh-electronics.com>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: stm32: Deduplicate serial
 aliases and chosen node for STM32MP15xx DHCOM SoM
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

> From: Marek Vasut <marex@denx.de>
> Sent: Wednesday, November 6, 2024 12:30 AM
> Deduplicate /aliases { serialN = ... } and /chosen node into
> stm32mp15xx-dhcom-som.dtsi , since the content is identical
> on all carrier boards using the STM32MP15xx DHCOM SoM. No
> functional change.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: kernel@dh-electronics.com
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> ---
>  arch/arm/boot/dts/st/stm32mp15xx-dhcom-drc02.dtsi   | 12 ------------
>  arch/arm/boot/dts/st/stm32mp15xx-dhcom-pdk2.dtsi    | 10 ----------
>  arch/arm/boot/dts/st/stm32mp15xx-dhcom-picoitx.dtsi | 10 ----------
>  arch/arm/boot/dts/st/stm32mp15xx-dhcom-som.dtsi     |  7 +++++++
>  4 files changed, 7 insertions(+), 32 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/st/stm32mp15xx-dhcom-drc02.dtsi
> b/arch/arm/boot/dts/st/stm32mp15xx-dhcom-drc02.dtsi
> index bb4f8a0b937f3..abe2dfe706364 100644
> --- a/arch/arm/boot/dts/st/stm32mp15xx-dhcom-drc02.dtsi
> +++ b/arch/arm/boot/dts/st/stm32mp15xx-dhcom-drc02.dtsi
> @@ -6,18 +6,6 @@
>  #include <dt-bindings/input/input.h>
>  #include <dt-bindings/pwm/pwm.h>
> 
> -/ {
> -       aliases {
> -               serial0 = &uart4;
> -               serial1 = &usart3;
> -               serial2 = &uart8;
> -       };
> -
> -       chosen {
> -               stdout-path = "serial0:115200n8";
> -       };
> -};
> -
>  &adc {
>         status = "disabled";
>  };
> diff --git a/arch/arm/boot/dts/st/stm32mp15xx-dhcom-pdk2.dtsi
> b/arch/arm/boot/dts/st/stm32mp15xx-dhcom-pdk2.dtsi
> index 171d7c7658fa8..0fb4e55843b9d 100644
> --- a/arch/arm/boot/dts/st/stm32mp15xx-dhcom-pdk2.dtsi
> +++ b/arch/arm/boot/dts/st/stm32mp15xx-dhcom-pdk2.dtsi
> @@ -7,16 +7,6 @@
>  #include <dt-bindings/pwm/pwm.h>
> 
>  / {
> -       aliases {
> -               serial0 = &uart4;
> -               serial1 = &usart3;
> -               serial2 = &uart8;
> -       };
> -
> -       chosen {
> -               stdout-path = "serial0:115200n8";
> -       };
> -
>         clk_ext_audio_codec: clock-codec {
>                 compatible = "fixed-clock";
>                 #clock-cells = <0>;
> diff --git a/arch/arm/boot/dts/st/stm32mp15xx-dhcom-picoitx.dtsi
> b/arch/arm/boot/dts/st/stm32mp15xx-dhcom-picoitx.dtsi
> index b5bc53accd6b2..01c693cc03446 100644
> --- a/arch/arm/boot/dts/st/stm32mp15xx-dhcom-picoitx.dtsi
> +++ b/arch/arm/boot/dts/st/stm32mp15xx-dhcom-picoitx.dtsi
> @@ -7,16 +7,6 @@
>  #include <dt-bindings/pwm/pwm.h>
> 
>  / {
> -       aliases {
> -               serial0 = &uart4;
> -               serial1 = &usart3;
> -               serial2 = &uart8;
> -       };
> -
> -       chosen {
> -               stdout-path = "serial0:115200n8";
> -       };
> -
>         led {
>                 compatible = "gpio-leds";
> 
> diff --git a/arch/arm/boot/dts/st/stm32mp15xx-dhcom-som.dtsi
> b/arch/arm/boot/dts/st/stm32mp15xx-dhcom-som.dtsi
> index 74a11ccc5333f..086d3a60ccce2 100644
> --- a/arch/arm/boot/dts/st/stm32mp15xx-dhcom-som.dtsi
> +++ b/arch/arm/boot/dts/st/stm32mp15xx-dhcom-som.dtsi
> @@ -14,6 +14,13 @@ aliases {
>                 ethernet1 = &ksz8851;
>                 rtc0 = &hwrtc;
>                 rtc1 = &rtc;
> +               serial0 = &uart4;
> +               serial1 = &usart3;
> +               serial2 = &uart8;
> +       };
> +
> +       chosen {
> +               stdout-path = "serial0:115200n8";
>         };
> 
>         memory@c0000000 {

Reviewed-by: Christoph Niedermaier <cniedermaier@dh-electronics.com>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
