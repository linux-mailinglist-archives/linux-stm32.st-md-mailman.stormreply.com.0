Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A942D19F073
	for <lists+linux-stm32@lfdr.de>; Mon,  6 Apr 2020 08:47:30 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 54B47C36B0B;
	Mon,  6 Apr 2020 06:47:30 +0000 (UTC)
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0AFC3C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  6 Apr 2020 06:47:28 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id 22so7059578pfa.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 05 Apr 2020 23:47:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=7IbKIaDYv+A6RC+8Z7mXi6t6xd0xICoZSFFChfwjGhs=;
 b=SlkYekdhHRkmDMtebWAZ4kHi24vIhUbGq/Pzcs6FC70yFE4n/BWvBsQe64NJw93klR
 8lOYIO16Pzo8sptdCkjDKz5dzojHcmymjosQ/J4/Wa8uKNkoakjexDLenSmw4T3frbTE
 8yKgzDq5wYXpasb4vFYoOB0uPd5Q2HmWVb3vYj4q4OTSBqt+kEn6Wu5u39OKDkwRJ2xQ
 dkW49QLFCdQYb7UJlslbKn1rfbyPqXSlrY1dump2wXolSJUdht9zjIC2FxEYePeAoLHu
 UxysWoUx+iB9S+ac2wNZ6mmzI1XUxzb470oobHkwP9BlhJFMLnwbw1MMD2eA1NgJMTId
 78JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=7IbKIaDYv+A6RC+8Z7mXi6t6xd0xICoZSFFChfwjGhs=;
 b=DSI0C0DzcHlWcnZJCqtHoFrp9mIQV45Uyc0XiaTfPy2UGxuuyZ83tNWlFqVVOek9f7
 1YLhVv19bcEFbYJyAlPWlYzcYs5mTgNa3fJZYYGi9s65IY0rX5SXmf5djWMlQpPTY3+O
 P/ykqIxAML0GJWjZ/a20XnWTknVuMC2WCezdwn91vGjuFyax2xo9SLakk8G22MDA/+JN
 Tm6MBRVQftSPyRdvaXD3x9pLSieWdT3tu3w/YV6MAGfG8KWHR9jSw5wyhyz5su+/6r9Q
 7T2DIIttWPs2r+gABimEmKFldMdBVbq2MQFNu8rtHmBO3t6QHlm4XZPFtZMC7Pr7Y8Mt
 xNAw==
X-Gm-Message-State: AGi0PuZKV/QPpDlLQgH7G5C9lBxPFZsBbhvluinXGkI4XIlks5XO675W
 gPOgeQe1q5kMMj4rcjBxoosa
X-Google-Smtp-Source: APiQypIiPabfsmyC0r/Ej0hIZMDFRtGEXLWo0N70ElIRI0xilj6DqQDSVD766uvUgCT8ey5IO9JHIg==
X-Received: by 2002:a63:f45:: with SMTP id 5mr19311831pgp.31.1586155646613;
 Sun, 05 Apr 2020 23:47:26 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:6e80:687d:9124:eff9:55e8:1727])
 by smtp.gmail.com with ESMTPSA id w24sm11302427pjn.14.2020.04.05.23.47.21
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 05 Apr 2020 23:47:25 -0700 (PDT)
Date: Mon, 6 Apr 2020 12:17:18 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Marek Vasut <marex@denx.de>
Message-ID: <20200406064718.GD2937@Mani-XPS-13-9360>
References: <20200401132237.60880-1-marex@denx.de>
 <20200401132237.60880-11-marex@denx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200401132237.60880-11-marex@denx.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Patrick Delaunay <patrick.delaunay@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH V4 10/22] ARM: dts: stm32: Add eMMC
 attached to SDMMC2 on AV96
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

On Wed, Apr 01, 2020 at 03:22:25PM +0200, Marek Vasut wrote:
> Add DT node describing the eMMC attached to SDMMC2 controller
> of the STM32MP1 on DHCOR SoM, which is the SoM soldered on AV96.
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
> V3: Connect Vcc to the enpirion output instead of 3v3 directly
>     Note that this patch now depends on:
>       mmc: mmci: Only call .post_sig_volt_switch if voltage switch happened
> V4: Rebase on stm32-next
> ---
>  arch/arm/boot/dts/stm32mp157a-avenger96.dts | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/stm32mp157a-avenger96.dts b/arch/arm/boot/dts/stm32mp157a-avenger96.dts
> index c824ff4e6127..df68768e8a12 100644
> --- a/arch/arm/boot/dts/stm32mp157a-avenger96.dts
> +++ b/arch/arm/boot/dts/stm32mp157a-avenger96.dts
> @@ -336,6 +336,22 @@ &sdmmc1 {
>  	status = "okay";
>  };
>  
> +&sdmmc2 {
> +	pinctrl-names = "default", "opendrain", "sleep";
> +	pinctrl-0 = <&sdmmc2_b4_pins_a &sdmmc2_d47_pins_b>;
> +	pinctrl-1 = <&sdmmc2_b4_od_pins_a &sdmmc2_d47_pins_b>;
> +	pinctrl-2 = <&sdmmc2_b4_sleep_pins_a &sdmmc2_d47_sleep_pins_b>;
> +	bus-width = <8>;
> +	mmc-ddr-1_8v;
> +	no-sd;
> +	no-sdio;
> +	non-removable;
> +	st,neg-edge;
> +	vmmc-supply = <&v3v3>;
> +	vqmmc-supply = <&vdd_io>;
> +	status = "okay";
> +};
> +
>  &uart4 {
>  	/* On Low speed expansion header */
>  	label = "LS-UART1";
> -- 
> 2.25.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
