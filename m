Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A4BD4198B05
	for <lists+linux-stm32@lfdr.de>; Tue, 31 Mar 2020 06:13:48 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6FB05C36B0B;
	Tue, 31 Mar 2020 04:13:48 +0000 (UTC)
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8195BC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 31 Mar 2020 04:13:46 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id 22so9701948pfa.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Mar 2020 21:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=+ODykTNEoBMWwVXP1vOeSL96MgW7tpodAAuNHsUQlnk=;
 b=whPdBgQ9hFqwgiqzwvs5i4j/QOVecoOCW85Z1n2BdfG4/XnspJ7yfz6Ofa6qln1F2v
 nO5JCTQULNzSfV0QU+TWYrraEwP0dWdQwJpkYXAUy5uYCBfCNpocIBcraCXqBZuSFnQ/
 pVrgqA+Ha8HGcvSUIa4j8o86lQAGbpJ8CCkuoiTl5b+SyHRzJpvRcIVIBxb/VwTLQqVs
 Pr1tj1CP3u08E9rlLftL5DDmoX+uHxg4MxNt9x6MNV++IH8OSMkR7EXTifpOfT6IKHL6
 KBK7UAb4fTfrBB9EAANbIwAk6SFE/CSsYAZjNyuRE+lbtZcWk2uyRLWtrxuArN8AF10w
 cn3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=+ODykTNEoBMWwVXP1vOeSL96MgW7tpodAAuNHsUQlnk=;
 b=iXbSlYrhAkWfVqkI964vFsH2QyERdn3qoBT4BFiHtj5CZBQXC90eVYmvNYNZsktDdw
 NCg1T/8rmNzDRiXOcJMF/gB/NMqUjkSzSei7/EqX9mOL4BBN9QA10LH72J1nToARHfxM
 RYINUkcnQ28Ai0CKZNblWSiJ0wZuWhtN37QRt9MbDFfw5aWP1c8TMymWppI643K/zTCY
 zbxnfeYsIkizO1/jGDkxiCfmVmOV1EHlmnIpyPgsy8ysQylrPoEghArXHiSMEdYaYd9L
 O5UaZYs8vHLUh5dOJyiUeFwatLSUYWwJKFvEQHY1EeVyqV/uBGH/mZj9iRoavnHEvUZa
 Bl0Q==
X-Gm-Message-State: ANhLgQ3NoKqua4m4gpcfB+ja6h+94u3MF2v+AkuaYgVpi4wcjze9rpIh
 nDZxRqyCxei2wD//744/ftGg
X-Google-Smtp-Source: ADFU+vsqzv9wupOqpQbUTu1IRhMLgXm0mDboWAweGnwsj+zoFbF67byp1UCzsu5STXagHn8fiuckCA==
X-Received: by 2002:a62:55c2:: with SMTP id
 j185mr16923836pfb.318.1585628025005; 
 Mon, 30 Mar 2020 21:13:45 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:630f:1337:c28:2530:7bf4:e941])
 by smtp.gmail.com with ESMTPSA id g30sm10893171pgn.40.2020.03.30.21.13.39
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 30 Mar 2020 21:13:44 -0700 (PDT)
Date: Tue, 31 Mar 2020 09:43:36 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Marek Vasut <marex@denx.de>
Message-ID: <20200331041336.GD14274@Mani-XPS-13-9360>
References: <20200331005701.283998-1-marex@denx.de>
 <20200331005701.283998-3-marex@denx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200331005701.283998-3-marex@denx.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Patrick Delaunay <patrick.delaunay@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH V2 02/22] ARM: dts: stm32: Repair ethernet
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

On Tue, Mar 31, 2020 at 02:56:41AM +0200, Marek Vasut wrote:
> The AV96 RGMII uses different pinmux for ETH_RGMII_TXD0, ETH_RGMII_RXD2
> and ETH_RGMII_TX_CTL. Use the correct pinmux to make ethernet operational.
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
> ---
>  arch/arm/boot/dts/stm32mp157a-avenger96.dts | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/stm32mp157a-avenger96.dts b/arch/arm/boot/dts/stm32mp157a-avenger96.dts
> index 425175f7d83c..1d15b745feeb 100644
> --- a/arch/arm/boot/dts/stm32mp157a-avenger96.dts
> +++ b/arch/arm/boot/dts/stm32mp157a-avenger96.dts
> @@ -81,8 +81,8 @@ led6 {
>  
>  &ethernet0 {
>  	status = "okay";
> -	pinctrl-0 = <&ethernet0_rgmii_pins_a>;
> -	pinctrl-1 = <&ethernet0_rgmii_pins_sleep_a>;
> +	pinctrl-0 = <&ethernet0_rgmii_pins_b>;
> +	pinctrl-1 = <&ethernet0_rgmii_pins_sleep_b>;
>  	pinctrl-names = "default", "sleep";
>  	phy-mode = "rgmii";
>  	max-speed = <1000>;
> -- 
> 2.25.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
