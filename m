Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DDAC919F0B1
	for <lists+linux-stm32@lfdr.de>; Mon,  6 Apr 2020 09:22:54 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 969B6C36B0B;
	Mon,  6 Apr 2020 07:22:54 +0000 (UTC)
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
 [209.85.216.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 69C96C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  6 Apr 2020 07:22:51 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id cp9so2642242pjb.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 06 Apr 2020 00:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=/3mgukCJPVclytiBycxVoZY3c0drdjNGA56Om2cy7nQ=;
 b=u55nKoHrnz1Z62lbfqqc09adL0yYk+m2FjS8nCvuD78nBnV/+96MsJ6vM5neSefx8B
 H/2QjVbVLEwtvygPghD98xOTSjMrdgMqa9dzlBnwdgLntnA9l6XqNqsnSGw7r8f0P6QP
 HW3QbJ9GqBOsMd/r6h8T/syYsBIFde7te26TzB6w/i/K6A/c+l1lXSrEzQ2SqYVtofbl
 DtZmO2QQLcFVhE+11Bj9EumdI6bpIpj92lYN/OuLBSdRByvadAWDG4kKPivZt3+LxBDh
 7k3PQeVLKKckZnesaL8Qwco+bmmOPcYZCDkYplIcoRLpYVHYae8u8N7/0z2g2hsASOop
 zwOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=/3mgukCJPVclytiBycxVoZY3c0drdjNGA56Om2cy7nQ=;
 b=XVWup9i1rwO3Ncp6JPv/c85uBoNoJHx2JlWOwOcP1NilpxcWNPvzmYG6D7xrqvUUzr
 I/ukpS+DxzhTGiSYItV5s8FX8gXTmmCetlWJFMchcmxQOpbTXxs+VIHwHE5cPmmFcwhL
 eWRyWNtMz1GeuiMvI/ADsv1BQ47wow75DCubamHBvLaWXo38SRSWmke0ooblzGtt4S0o
 14ZAN9Fnz6RTuQnlV27DxgHDtlGGR4XF7o8GQIMZbFv/lAjGssf5F0XxntFTnsldP6Lb
 bQdxydmCaLVhGlRUjrLJbcz5/WBD9UqwKhoG1X/mIbArIaWtZBp5lI2NH6H2ICzDauVK
 IMGg==
X-Gm-Message-State: AGi0PuZDBKrZ63XoKVzXndq7sABjGeaz8kfSXGsf/CTPdSp1Grji1rxg
 heyK7rqLkvTL1bfYe2ujjawu
X-Google-Smtp-Source: APiQypIJb8R3WLBu2lHBPBtV3glHu5GcUccn1AdlbpVTRzwbduTKcUpR7FhEfkGxZwu211KNeew9Aw==
X-Received: by 2002:a17:902:720a:: with SMTP id
 ba10mr20272477plb.323.1586157769685; 
 Mon, 06 Apr 2020 00:22:49 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:6e80:687d:9124:eff9:55e8:1727])
 by smtp.gmail.com with ESMTPSA id f69sm10725457pfa.124.2020.04.06.00.22.45
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 06 Apr 2020 00:22:48 -0700 (PDT)
Date: Mon, 6 Apr 2020 12:52:42 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Marek Vasut <marex@denx.de>
Message-ID: <20200406072242.GG2937@Mani-XPS-13-9360>
References: <20200401132237.60880-1-marex@denx.de>
 <20200401132237.60880-22-marex@denx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200401132237.60880-22-marex@denx.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Patrick Delaunay <patrick.delaunay@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH V4 21/22] ARM: dts: stm32: Add bindings
	for USB on AV96
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

On Wed, Apr 01, 2020 at 03:22:36PM +0200, Marek Vasut wrote:
> Fill in the bindings for USB host and gadget on AV96.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>

I can't get the USB B-Micro OTG port to work with this patch. Do I need to
enable any configs other than PHY and USB DWC2 drivers?

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
> ---
>  arch/arm/boot/dts/stm32mp157a-avenger96.dts | 31 +++++++++++++++++++++
>  1 file changed, 31 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/stm32mp157a-avenger96.dts b/arch/arm/boot/dts/stm32mp157a-avenger96.dts
> index 2f5a53e1b50d..31f23e60629f 100644
> --- a/arch/arm/boot/dts/stm32mp157a-avenger96.dts
> +++ b/arch/arm/boot/dts/stm32mp157a-avenger96.dts
> @@ -544,3 +544,34 @@ bluetooth {
>  		shutdown-gpios = <&gpioz 6 GPIO_ACTIVE_HIGH>;
>  	};
>  };
> +
> +&usbh_ehci {
> +	phys = <&usbphyc_port0>;
> +	phy-names = "usb";
> +	status = "okay";
> +};
> +
> +&usbotg_hs {
> +	pinctrl-0 = <&usbotg_hs_pins_a>;
> +	pinctrl-names = "default";
> +	phy-names = "usb2-phy";
> +	phys = <&usbphyc_port1 0>;
> +	status = "okay";
> +	vbus-supply = <&vbus_otg>;
> +};
> +
> +&usbphyc {
> +	status = "okay";
> +};
> +
> +&usbphyc_port0 {
> +	phy-supply = <&vdd_usb>;
> +	vdda1v1-supply = <&reg11>;
> +	vdda1v8-supply = <&reg18>;
> +};
> +
> +&usbphyc_port1 {
> +	phy-supply = <&vdd_usb>;
> +	vdda1v1-supply = <&reg11>;
> +	vdda1v8-supply = <&reg18>;
> +};
> -- 
> 2.25.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
