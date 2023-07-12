Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 258DD7501A2
	for <lists+linux-stm32@lfdr.de>; Wed, 12 Jul 2023 10:34:18 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C7E20C6B459;
	Wed, 12 Jul 2023 08:34:17 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 142D5C6B44C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Jul 2023 08:34:16 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id
 4fb4d7f45d1cf-51e28cac164so1049607a12.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Jul 2023 01:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689150856; x=1691742856;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Gw27ptvuG8lMdIU4QvHj9aUx5djZyyv5FcntfKmvWEc=;
 b=GMGWxEaDJN6EB6DlvlQUWdbIVLki4hjMs6tHczqzLqR+ppGupUv1OD1p5BKUBRm6xb
 wEHNEupA0AttmOfvZbsKMiV+a6n2ge7ta6q8STIYTssNN5bHiNChjuwgv+eEoIKXsO0R
 aL+GK2U23/O9LsNwPnyvsK1CBtU+BK4xQg+E02OXxi+NpX5hteTpMT23RpxjQba0t125
 Q6+O5LgOtJIT5yBy0d9biNHXNrmpCJ2ljIhymG/7jitmFIklv5tNRep7WEa+EhUi0jV2
 XVFaO0KdQ56BMSEiftipPRaVG69z+ckvCxlDXovwT58X6Nbq8uDYfCzY/5yfVCLtQomD
 og0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689150856; x=1691742856;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Gw27ptvuG8lMdIU4QvHj9aUx5djZyyv5FcntfKmvWEc=;
 b=HugAC83hSdtp+pOq9tcKalpfYD0vtSKGRuyw8SSOF/CCMWi2qZdjQl5by0QfCZIgba
 DpkIJol06U5Z+w/pQ6pnqgubz8gCeToyg7GgSs4oIJFEopU2m9j3zoFrPT8kh0aQfFl/
 rLYPLprrPcN1fYACKZ7BArfLJdUlHnWTqXDLWVvYqJWT2SGLR06+7h347DavJy8ORis9
 tnolpiBaEb3caSOE3prmtua3LjmhsgXBDiIQwlQfGlV33hutZVpdOcVzuTaajdMW2PCL
 ZHDvbDstRbPQk8JOsaDlrAlQbGIBC7IFu45asI7rj2ud2iM0Ye1ZMehT+anUaBtFQekf
 zMYQ==
X-Gm-Message-State: ABy/qLbeaXwo2bU4bBHFoury26ghSi97CB/2C8WMxbLMPCxRoGGsdeeI
 jQqmJnmArsddZ2r3ShxLzBHmSA==
X-Google-Smtp-Source: APBJJlGjlwAMSGUpe3P1If/RhiTdHwxpWCorgsmh3ZIGmV4Y4Iek+OEt2O/yoetDsECExurTk7dugQ==
X-Received: by 2002:a17:906:778a:b0:989:450:e565 with SMTP id
 s10-20020a170906778a00b009890450e565mr1518907ejm.23.1689150856412; 
 Wed, 12 Jul 2023 01:34:16 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
 by smtp.gmail.com with ESMTPSA id
 dc21-20020a170906c7d500b00988b86d6c7csm2207376ejb.132.2023.07.12.01.34.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Jul 2023 01:34:15 -0700 (PDT)
Message-ID: <219612e4-f306-9ce3-c75c-33195f1167f2@linaro.org>
Date: Wed, 12 Jul 2023 10:34:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Sean Nyekjaer <sean@geanix.com>, a.fatoum@pengutronix.de,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 soc@kernel.org
References: <20230712062954.2194505-1-sean@geanix.com>
 <20230712062954.2194505-8-sean@geanix.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230712062954.2194505-8-sean@geanix.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dantuguf14105@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
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

On 12/07/2023 08:29, Sean Nyekjaer wrote:
> Add support for the Octavo OSD32MP1-RED development board.
> 
> General features:
>  - STM32MP157C
>  - 512MB DDR3
>  - CAN-FD
>  - HDMI
>  - USB-C OTG
>  - UART
> 

...

> +
> +&i2c1 {
> +	pinctrl-names = "default", "sleep";
> +	pinctrl-0 = <&i2c1_pins_a>;
> +	pinctrl-1 = <&i2c1_sleep_pins_a>;
> +	status = "okay";
> +	i2c-scl-rising-time-ns = <100>;
> +	i2c-scl-falling-time-ns = <7>;
> +	/delete-property/dmas;
> +	/delete-property/dma-names;

You should explain it with comment, unless it is quite common for all
STM32 boards to disable DMA for I2C...

> +
> +	hdmi-transmitter@39 {
> +		compatible = "sil,sii9022";
> +		reg = <0x39>;
> +		reset-gpios = <&gpiog 0 GPIO_ACTIVE_LOW>;
> +		interrupts = <1 IRQ_TYPE_EDGE_FALLING>;
> +		interrupt-parent = <&gpiog>;
> +		pinctrl-names = "default", "sleep";
> +		pinctrl-0 = <&ltdc_pins_e>;
> +		pinctrl-1 = <&ltdc_sleep_pins_e>;
> +		status = "okay";

Did anything disable this node?

> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +				sii9022_in: endpoint {
> +					remote-endpoint = <&ltdc_ep0_out>;
> +				};
> +			};
> +
> +			port@1 {
> +				reg = <1>;
> +				sii9022_tx_endpoint: endpoint {
> +					remote-endpoint = <&i2s2_endpoint>;
> +				};
> +			};
> +		};
> +	};
> +};
> +
> +&i2s2 {
> +	clocks = <&rcc SPI2>, <&rcc SPI2_K>, <&rcc CK_PER>, <&rcc PLL3_R>;
> +	clock-names = "pclk", "i2sclk", "x8k", "x11k";
> +	pinctrl-names = "default", "sleep";
> +	pinctrl-0 = <&i2s2_pins_b>;
> +	pinctrl-1 = <&i2s2_sleep_pins_b>;
> +	status = "okay";
> +
> +	i2s2_port: port {
> +		i2s2_endpoint: endpoint {
> +			remote-endpoint = <&sii9022_tx_endpoint>;
> +			format = "i2s";
> +			mclk-fs = <256>;
> +		};
> +	};
> +};
> +
> +&ltdc {
> +	status = "okay";
> +
> +	port {
> +		ltdc_ep0_out: endpoint@0 {
> +			reg = <0>;
> +			remote-endpoint = <&sii9022_in>;
> +		};
> +	};
> +};
> +
> +&m_can1 {
> +	pinctrl-names = "default", "sleep";
> +	pinctrl-0 = <&m_can1_pins_d>;
> +	pinctrl-1 = <&m_can1_sleep_pins_d>;
> +	status = "okay";
> +};
> +
> +&pwr_regulators {
> +	vdd-supply = <&vdd>;
> +	vdd_3v3_usbfs-supply = <&vdd_usb>;
> +};
> +
> +&rtc {
> +	status = "okay";
> +};
> +
> +&sdmmc1 {
> +	pinctrl-names = "default", "opendrain", "sleep";
> +	pinctrl-0 = <&sdmmc1_b4_pins_a>;
> +	pinctrl-1 = <&sdmmc1_b4_od_pins_a>;
> +	pinctrl-2 = <&sdmmc1_b4_sleep_pins_a>;
> +	cd-gpios = <&gpioe 7 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
> +	disable-wp;
> +	st,neg-edge;
> +	bus-width = <4>;
> +	vmmc-supply = <&v3v3>;
> +	status = "okay";
> +};
> +
> +&sdmmc2 {
> +	pinctrl-names = "default", "opendrain", "sleep";
> +	pinctrl-0 = <&sdmmc2_b4_pins_a &sdmmc2_d47_pins_d>;
> +	pinctrl-1 = <&sdmmc2_b4_od_pins_a>;
> +	pinctrl-2 = <&sdmmc2_b4_sleep_pins_a &sdmmc2_d47_sleep_pins_d>;
> +	non-removable;
> +	no-sd;
> +	no-sdio;
> +	st,neg-edge;
> +	bus-width = <8>;
> +	vmmc-supply = <&v3v3>;
> +	vqmmc-supply = <&vdd>;
> +	mmc-ddr-3_3v;
> +	status = "okay";
> +};
> +
> +&uart4 {
> +	pinctrl-names = "default", "sleep", "idle";
> +	pinctrl-0 = <&uart4_pins_a>;
> +	pinctrl-1 = <&uart4_sleep_pins_a>;
> +	pinctrl-2 = <&uart4_idle_pins_a>;
> +	/delete-property/dmas;
> +	/delete-property/dma-names;

Same concerns.

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
