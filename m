Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B601619F091
	for <lists+linux-stm32@lfdr.de>; Mon,  6 Apr 2020 09:06:00 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 70D7DC36B0B;
	Mon,  6 Apr 2020 07:06:00 +0000 (UTC)
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
 [209.85.215.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EB8C2C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  6 Apr 2020 07:05:58 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id o26so7092309pgc.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 06 Apr 2020 00:05:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=DDpQKxORmlKumoUF8G/6nT57ECq+/mjuSgf1G0iOMS4=;
 b=rsmrRGwEePctcyPVU9wPRvM1Vat/Zwzujp/tMrrTc2yR4i7cvJAAbk//2S6IhOznTM
 BJKpg1jmK65SmrlNYxrAosXw2Q5CAxUnLjMLudJybaaeVJTNXW36rYpd+XZi+1CMoEwd
 y6kaROlO0LFlyKeV706XjClNtsyMFYORo3LT9sQockGa8RZn1qAiVIWWn+7Hvda7ycxm
 qqlmrhLZJB4bZhMggsL8HslYbC4Uo2xVU3Q7UA3qbUtv02EKZ0ftlkNfahrJUftUeTAo
 7EXk5fHMkIvL8FPqZHas8y6id52R5+hDTQ12bXZz3CCaUfxncufua1Qyw+7Jb4B7aGTR
 te4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=DDpQKxORmlKumoUF8G/6nT57ECq+/mjuSgf1G0iOMS4=;
 b=OYuFa0OGB8vxTitRwzxn/NGeND76+5dJPEu+xQlbDGjEGmFa2dtwfkilUteNMYBak4
 bIU5MKzvzLIF8foTWPdnlg5gHdqwj+pSn9X+1TfBMLbDDgYYTmAzPehdWF/uAUjHsYkK
 3zTkKZpm2JCaSdRze2sp3wji8KE3hEaTnFqj9M397Ilon3Dwfs2MNyuI8OFYv2XgsMXb
 HVMH5jlM3b8xtteaFq4jjxTW1MByr096PSd4GXHLzhcJghagUXD0m4/Rrrt1eZtSzsaH
 2WwxT+kHHlpRBtp42cOrEua1NfhMbceXa8H9ypWAXNq0CEvflc8HSOoUF71sWa5tZTnu
 EUbg==
X-Gm-Message-State: AGi0PubNc+NKSPfZYT5bNaX8mcVfDxLAL6pqG4KHLDZSTZv1hRJc4MLQ
 SNA/NLnuHNz2psjH1rhh2of+
X-Google-Smtp-Source: APiQypKrNFjnlpd8RsFYzq4UArfG2/9dBM4zlXsO29A7kUzAgoT9dc+rlsWiPv1GPeX4qGKZKY/EPw==
X-Received: by 2002:a63:8041:: with SMTP id j62mr18833652pgd.273.1586156757220; 
 Mon, 06 Apr 2020 00:05:57 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:6e80:687d:9124:eff9:55e8:1727])
 by smtp.gmail.com with ESMTPSA id l22sm11339152pjq.15.2020.04.06.00.05.53
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 06 Apr 2020 00:05:56 -0700 (PDT)
Date: Mon, 6 Apr 2020 12:35:50 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Marek Vasut <marex@denx.de>
Message-ID: <20200406070550.GF2937@Mani-XPS-13-9360>
References: <20200401132237.60880-1-marex@denx.de>
 <20200401132237.60880-19-marex@denx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200401132237.60880-19-marex@denx.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Patrick Delaunay <patrick.delaunay@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH V4 18/22] ARM: dts: stm32: Add bindings
 for HDMI video on AV96
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

On Wed, Apr 01, 2020 at 03:22:33PM +0200, Marek Vasut wrote:
> Fill in the HDMI video pipeline from AV96 into the DT.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> Cc: Alexandre Torgue <alexandre.torgue@st.com>
> Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Patrice Chotard <patrice.chotard@st.com>
> Cc: Patrick Delaunay <patrick.delaunay@st.com>
> Cc: linux-stm32@st-md-mailman.stormreply.com
> To: linux-arm-kernel@lists.infradead.org
> ---
> V2: No change
> V3: No change
> V4: Rebase on stm32-next
>     Use renamed ltdc_*_pins_d
> ---
>  arch/arm/boot/dts/stm32mp157a-avenger96.dts | 79 +++++++++++++++++++++
>  1 file changed, 79 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/stm32mp157a-avenger96.dts b/arch/arm/boot/dts/stm32mp157a-avenger96.dts
> index faa9a5185ddd..756e79f2255a 100644
> --- a/arch/arm/boot/dts/stm32mp157a-avenger96.dts
> +++ b/arch/arm/boot/dts/stm32mp157a-avenger96.dts
> @@ -25,10 +25,28 @@ aliases {
>  		spi0 = &qspi;
>  	};
>  
> +	/* XTal Q1 */
> +	cec_clock: clk-cec-fixed {
> +		#clock-cells = <0>;
> +		compatible = "fixed-clock";
> +		clock-frequency = <24000000>;
> +	};
> +
>  	chosen {
>  		stdout-path = "serial0:115200n8";
>  	};
>  
> +	hdmi-out {
> +		compatible = "hdmi-connector";
> +		type = "a";
> +
> +		port {
> +			hdmi_con: endpoint {
> +				remote-endpoint = <&adv7513_out>;
> +			};
> +		};
> +	};
> +
>  	memory@c0000000 {
>  		device_type = "memory";
>  		reg = <0xc0000000 0x40000000>;
> @@ -300,6 +318,50 @@ watchdog {
>  		};
>  	};
>  
> +	hdmi-transmitter@3d {
> +		compatible = "adi,adv7513";
> +		reg = <0x3d>, <0x2d>, <0x4d>, <0x5d>;
> +		reg-names = "main", "cec", "edid", "packet";
> +		clocks = <&cec_clock>;
> +		clock-names = "cec";
> +
> +		avdd-supply = <&v3v3>;
> +		dvdd-supply = <&v3v3>;
> +		pvdd-supply = <&v3v3>;
> +		dvdd-3v-supply = <&v3v3>;
> +		bgvdd-supply = <&v3v3>;
> +
> +		interrupts = <9 IRQ_TYPE_EDGE_FALLING>;
> +		interrupt-parent = <&gpiog>;
> +
> +		status = "okay";
> +
> +		adi,input-depth = <8>;
> +		adi,input-colorspace = "rgb";
> +		adi,input-clock = "1x";
> +		adi,input-style = <1>;
> +		adi,input-justification = "evenly";
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +				adv7513_in: endpoint {
> +					remote-endpoint = <&ltdc_ep0_out>;
> +				};
> +			};
> +
> +			port@1 {
> +				reg = <1>;
> +				adv7513_out: endpoint {
> +					remote-endpoint = <&hdmi_con>;
> +				};
> +			};
> +		};
> +	};
> +
>  	eeprom@53 {
>  		compatible = "atmel,24c02";
>  		reg = <0x53>;
> @@ -312,6 +374,23 @@ &iwdg2 {
>  	status = "okay";
>  };
>  
> +&ltdc {
> +	pinctrl-names = "default", "sleep";
> +	pinctrl-0 = <&ltdc_pins_d>;
> +	pinctrl-1 = <&ltdc_sleep_pins_d>;
> +	status = "okay";
> +
> +	port {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		ltdc_ep0_out: endpoint@0 {
> +			reg = <0>;
> +			remote-endpoint = <&adv7513_in>;
> +		};
> +	};
> +};
> +
>  &pwr_regulators {
>  	vdd-supply = <&vdd_io>;
>  	vdd_3v3_usbfs-supply = <&vdd_usb>;
> -- 
> 2.25.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
