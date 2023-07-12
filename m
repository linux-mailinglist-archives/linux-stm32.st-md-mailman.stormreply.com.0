Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0277A7502AC
	for <lists+linux-stm32@lfdr.de>; Wed, 12 Jul 2023 11:18:01 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A29DEC6B459;
	Wed, 12 Jul 2023 09:18:00 +0000 (UTC)
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 74142C6B442
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Jul 2023 09:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com; 
 s=default2211;
 h=To:References:Message-Id:Content-Transfer-Encoding:Cc:Date:
 In-Reply-To:From:Subject:Mime-Version:Content-Type:Sender:Reply-To:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID; bh=0KG+9/Us+bQr0mX8moldHf2l/y7AhroiqVYntd3LSiE=; 
 b=lE4TE/gmRdZIbwdU8PKbM2Jp8KQ0th2Wdtmpqw7CS5Ap1osRPv/EvHnOgU1QUINDpHpClPhKJux
 hqFNzYBKCxPIAiVIcdwxn0pbuQ31FaWPb9fPx350yMtC0YGz5xt+ICjvbFslRDc8XwegO1mgngvQ3
 UekS9SrDLbgHFoaeVMyP9tnpV+WXXp2Bdz+ETrTOqDv9M/ojRBCbpwKQQwAynsyePre5kw6W9ziUk
 nwleGtFOlrdysbpihXE92PVQoy7RaWYr7BEy9L/FoB4p5mL2u4LXrXrbPW5+/KIcfxv4FUD8F+cTy
 wOgUcpLOGWcpFEJ0u9WcnibfwbQzprFmwUoA==;
Received: from sslproxy02.your-server.de ([78.47.166.47])
 by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.94.2) (envelope-from <sean@geanix.com>)
 id 1qJVys-000Fjb-1k; Wed, 12 Jul 2023 11:17:54 +0200
Received: from [2a06:4004:10df:0:6cc7:3173:9f32:f330] (helo=smtpclient.apple)
 by sslproxy02.your-server.de with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92)
 (envelope-from <sean@geanix.com>)
 id 1qJVyr-000PhP-AB; Wed, 12 Jul 2023 11:17:53 +0200
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.600.7\))
From: Sean Nyekjaer <sean@geanix.com>
In-Reply-To: <219612e4-f306-9ce3-c75c-33195f1167f2@linaro.org>
Date: Wed, 12 Jul 2023 11:17:42 +0200
Message-Id: <4AE6040B-5F3F-4CBE-9D2E-ABBD1B5605F6@geanix.com>
References: <20230712062954.2194505-1-sean@geanix.com>
 <20230712062954.2194505-8-sean@geanix.com>
 <219612e4-f306-9ce3-c75c-33195f1167f2@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: Apple Mail (2.3731.600.7)
X-Authenticated-Sender: sean@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.8/26967/Wed Jul 12 09:28:32 2023)
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Arnd Bergmann <arnd@arndb.de>, dantuguf14105@gmail.com,
 linux-kernel@vger.kernel.org, soc@kernel.org, Rob Herring <robh+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Olof Johansson <olof@lixom.net>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 8/8] ARM: dts: stm32: Add Octavo
	OSD32MP1-RED board
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



> On 12 Jul 2023, at 10.34, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:
> 
> On 12/07/2023 08:29, Sean Nyekjaer wrote:
>> Add support for the Octavo OSD32MP1-RED development board.
>> 
>> General features:
>> - STM32MP157C
>> - 512MB DDR3
>> - CAN-FD
>> - HDMI
>> - USB-C OTG
>> - UART
>> 
> 
> ...
> 
>> +
>> +&i2c1 {
>> + pinctrl-names = "default", "sleep";
>> + pinctrl-0 = <&i2c1_pins_a>;
>> + pinctrl-1 = <&i2c1_sleep_pins_a>;
>> + status = "okay";
>> + i2c-scl-rising-time-ns = <100>;
>> + i2c-scl-falling-time-ns = <7>;
>> + /delete-property/dmas;
>> + /delete-property/dma-names;
> 
> You should explain it with comment, unless it is quite common for all
> STM32 boards to disable DMA for I2C...

Quite common for all STM32 boards, but I will add a comment anyway :)

> 
>> +
>> + hdmi-transmitter@39 {
>> + compatible = "sil,sii9022";
>> + reg = <0x39>;
>> + reset-gpios = <&gpiog 0 GPIO_ACTIVE_LOW>;
>> + interrupts = <1 IRQ_TYPE_EDGE_FALLING>;
>> + interrupt-parent = <&gpiog>;
>> + pinctrl-names = "default", "sleep";
>> + pinctrl-0 = <&ltdc_pins_e>;
>> + pinctrl-1 = <&ltdc_sleep_pins_e>;
>> + status = "okay";
> 
> Did anything disable this node?

No will remove.

> 
>> +
>> + ports {
>> + #address-cells = <1>;
>> + #size-cells = <0>;
>> +
>> + port@0 {
>> + reg = <0>;
>> + sii9022_in: endpoint {
>> + remote-endpoint = <&ltdc_ep0_out>;
>> + };
>> + };
>> +
>> + port@1 {
>> + reg = <1>;
>> + sii9022_tx_endpoint: endpoint {
>> + remote-endpoint = <&i2s2_endpoint>;
>> + };
>> + };
>> + };
>> + };
>> +};
>> +
>> +&i2s2 {
>> + clocks = <&rcc SPI2>, <&rcc SPI2_K>, <&rcc CK_PER>, <&rcc PLL3_R>;
>> + clock-names = "pclk", "i2sclk", "x8k", "x11k";
>> + pinctrl-names = "default", "sleep";
>> + pinctrl-0 = <&i2s2_pins_b>;
>> + pinctrl-1 = <&i2s2_sleep_pins_b>;
>> + status = "okay";
>> +
>> + i2s2_port: port {
>> + i2s2_endpoint: endpoint {
>> + remote-endpoint = <&sii9022_tx_endpoint>;
>> + format = "i2s";
>> + mclk-fs = <256>;
>> + };
>> + };
>> +};
>> +
>> +&ltdc {
>> + status = "okay";
>> +
>> + port {
>> + ltdc_ep0_out: endpoint@0 {
>> + reg = <0>;
>> + remote-endpoint = <&sii9022_in>;
>> + };
>> + };
>> +};
>> +
>> +&m_can1 {
>> + pinctrl-names = "default", "sleep";
>> + pinctrl-0 = <&m_can1_pins_d>;
>> + pinctrl-1 = <&m_can1_sleep_pins_d>;
>> + status = "okay";
>> +};
>> +
>> +&pwr_regulators {
>> + vdd-supply = <&vdd>;
>> + vdd_3v3_usbfs-supply = <&vdd_usb>;
>> +};
>> +
>> +&rtc {
>> + status = "okay";
>> +};
>> +
>> +&sdmmc1 {
>> + pinctrl-names = "default", "opendrain", "sleep";
>> + pinctrl-0 = <&sdmmc1_b4_pins_a>;
>> + pinctrl-1 = <&sdmmc1_b4_od_pins_a>;
>> + pinctrl-2 = <&sdmmc1_b4_sleep_pins_a>;
>> + cd-gpios = <&gpioe 7 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
>> + disable-wp;
>> + st,neg-edge;
>> + bus-width = <4>;
>> + vmmc-supply = <&v3v3>;
>> + status = "okay";
>> +};
>> +
>> +&sdmmc2 {
>> + pinctrl-names = "default", "opendrain", "sleep";
>> + pinctrl-0 = <&sdmmc2_b4_pins_a &sdmmc2_d47_pins_d>;
>> + pinctrl-1 = <&sdmmc2_b4_od_pins_a>;
>> + pinctrl-2 = <&sdmmc2_b4_sleep_pins_a &sdmmc2_d47_sleep_pins_d>;
>> + non-removable;
>> + no-sd;
>> + no-sdio;
>> + st,neg-edge;
>> + bus-width = <8>;
>> + vmmc-supply = <&v3v3>;
>> + vqmmc-supply = <&vdd>;
>> + mmc-ddr-3_3v;
>> + status = "okay";
>> +};
>> +
>> +&uart4 {
>> + pinctrl-names = "default", "sleep", "idle";
>> + pinctrl-0 = <&uart4_pins_a>;
>> + pinctrl-1 = <&uart4_sleep_pins_a>;
>> + pinctrl-2 = <&uart4_idle_pins_a>;
>> + /delete-property/dmas;
>> + /delete-property/dma-names;
> 
> Same concerns.

Thanks for the review Krzysztof.

/Sean

> 
> Best regards,
> Krzysztof
> 


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
