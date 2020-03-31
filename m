Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A7E7C19980A
	for <lists+linux-stm32@lfdr.de>; Tue, 31 Mar 2020 16:02:54 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5966BC36B0B;
	Tue, 31 Mar 2020 14:02:54 +0000 (UTC)
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
 [209.85.214.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D36CCC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 31 Mar 2020 14:02:51 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id t4so2196791plq.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 31 Mar 2020 07:02:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=SrwjxIomKacjVuH9ZWvU0jM634ggFzn8gQ8+caCpxHk=;
 b=yCCnRWY874MdmVCfdGtVIMs/+MdCSdyFV2eDQQkHv8t+tqVoJDGqhYSgg/RGuIt+Xn
 1RhPc30kIMlsEwKkxxnJ+gXVfUmtD+orza2tkdkA9TVTOANt9csNz2JZpq8/4i1HWWW7
 zATgl1w4zHNFIkov67yWlzsl5+dJLkrIVipvo4DYt6hPdZNQAYEmPd2gNhqQS0bL3hMH
 kPyNmuPXhnGSDSzmr5r4eiiZHSHnvSSe5bXqJZVobSxA0Ff1+ZQAqRfpl79U+0/oYx3s
 UmMIxsqHd0IfIiIKJiBjJ1vt5DS4A9oROak5vmXp+Ild9CvZxGovr4OTYtbqQRCIN+Fx
 2G2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=SrwjxIomKacjVuH9ZWvU0jM634ggFzn8gQ8+caCpxHk=;
 b=Jvj5bxon3Slc7GProYho55uHqVYkn5kQYL0T7DAKRz47b7aPd0phljb3vnuKuSg2cD
 9rPHz2ExI0Txxkb99N7cBP5BUB979JunD1i+bDr8d3M6j/x212c57/KuNi8jsVyux5Wk
 5QlSCbtbK3HhrkrFn/+ZySYFPgrDR1Jx3/10t+sED+g/Pkg6QAlVnAkxc89M+qLD8AjY
 wuVFq7jI2jh10aKQ26nrR+6XxqVS/R/riev6dHQp42o0ApZ7BhBg+nTjCYM2794ImszU
 78SrCtKRMoTw60YVIIldbkhk7ePBicTQ0LlN7zz0ufcsc9GrfWziVn7p6/ZLl4qtO3zc
 9zmA==
X-Gm-Message-State: AGi0PuZsagBX2lC4Lbh6b6rJTbbl5QaNtLZOKXx/1Sv81GOdoeFiGkQ3
 5dEjvk/GIB2Kxh3xRpS1DdW+
X-Google-Smtp-Source: APiQypJzcMrdeccvpeCvE9kPznLQ957EkEgffl0HiuDIi3h4rN/1OzYnGrMW/pxKfc4YOa5uyqEMJw==
X-Received: by 2002:a17:902:9682:: with SMTP id
 n2mr4388242plp.44.1585663370309; 
 Tue, 31 Mar 2020 07:02:50 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:630f:1337:c28:2530:7bf4:e941])
 by smtp.gmail.com with ESMTPSA id y29sm11655102pge.22.2020.03.31.07.02.46
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 31 Mar 2020 07:02:49 -0700 (PDT)
Date: Tue, 31 Mar 2020 19:32:43 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Marek Vasut <marex@denx.de>
Message-ID: <20200331140243.GB17755@Mani-XPS-13-9360>
References: <20200331005701.283998-1-marex@denx.de>
 <20200331005701.283998-7-marex@denx.de>
 <20200331043338.GH14274@Mani-XPS-13-9360>
 <4936af1c-6bdf-de5a-c86e-07e52417cdec@denx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4936af1c-6bdf-de5a-c86e-07e52417cdec@denx.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Patrick Delaunay <patrick.delaunay@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH V2 06/22] ARM: dts: stm32: Repair SDMMC1
	operation on AV96
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

On Tue, Mar 31, 2020 at 03:36:34PM +0200, Marek Vasut wrote:
> On 3/31/20 6:33 AM, Manivannan Sadhasivam wrote:
> > On Tue, Mar 31, 2020 at 02:56:45AM +0200, Marek Vasut wrote:
> >> The SD uses different pinmux for the D123DIRline, use such a pinmux,
> >> otherwise there is a pinmux collision on the AV96. Add missing SD
> >> voltage regulator switch.
> >>
> >> Signed-off-by: Marek Vasut <marex@denx.de>
> >> Cc: Alexandre Torgue <alexandre.torgue@st.com>
> >> Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> >> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> >> Cc: Patrice Chotard <patrice.chotard@st.com>
> >> Cc: Patrick Delaunay <patrick.delaunay@st.com>
> >> Cc: linux-stm32@st-md-mailman.stormreply.com
> >> To: linux-arm-kernel@lists.infradead.org
> >> ---
> >> V2: Disable SDR104, it seems unstable thus far
> >> ---
> >>  arch/arm/boot/dts/stm32mp157a-avenger96.dts | 21 ++++++++++++++++++---
> >>  1 file changed, 18 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/arch/arm/boot/dts/stm32mp157a-avenger96.dts b/arch/arm/boot/dts/stm32mp157a-avenger96.dts
> >> index e58653ccb60f..04280353fdbe 100644
> >> --- a/arch/arm/boot/dts/stm32mp157a-avenger96.dts
> >> +++ b/arch/arm/boot/dts/stm32mp157a-avenger96.dts
> >> @@ -77,6 +77,20 @@ led6 {
> >>  			default-state = "off";
> >>  		};
> >>  	};
> >> +
> >> +	sd_switch: regulator-sd_switch {
> >> +		compatible = "regulator-gpio";
> >> +		regulator-name = "sd_switch";
> >> +		regulator-min-microvolt = <1800000>;
> >> +		regulator-max-microvolt = <2900000>;
> >> +		regulator-type = "voltage";
> >> +		regulator-always-on;
> >> +
> >> +		gpios = <&gpioi 5 GPIO_ACTIVE_HIGH>;
> >> +		gpios-states = <0>;
> >> +		states = <1800000 0x1>,
> >> +			 <2900000 0x0>;
> >> +	};
> >>  };
> >>  
> >>  &ethernet0 {
> >> @@ -305,9 +319,9 @@ &rtc {
> >>  
> >>  &sdmmc1 {
> >>  	pinctrl-names = "default", "opendrain", "sleep";
> >> -	pinctrl-0 = <&sdmmc1_b4_pins_a &sdmmc1_dir_pins_a>;
> >> -	pinctrl-1 = <&sdmmc1_b4_od_pins_a>;
> >> -	pinctrl-2 = <&sdmmc1_b4_sleep_pins_a>;
> >> +	pinctrl-0 = <&sdmmc1_b4_pins_a &sdmmc1_dir_pins_b>;
> >> +	pinctrl-1 = <&sdmmc1_b4_od_pins_a &sdmmc1_dir_pins_b>;
> >> +	pinctrl-2 = <&sdmmc1_b4_sleep_pins_a &sdmmc1_dir_sleep_pins_b>;
> >>  	cd-gpios = <&gpioi 8 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
> > 
> > The "cd-gpios" change is not present in mainline. I think you can add it to
> > this patch as well with relevant commit description.
> 
> What change to cd-gpios ? This patch doesn't change cd-gpios.

This cd-gpios change is not present in mainline and also there seems to be few
other properties which got added (probably by another patch?). So this doesn't
apply on top of mainline/master.

Thanks,
Mani
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
