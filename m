Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4067F198C66
	for <lists+linux-stm32@lfdr.de>; Tue, 31 Mar 2020 08:37:04 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 01AE6C36B0B;
	Tue, 31 Mar 2020 06:37:04 +0000 (UTC)
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
 [209.85.215.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0F5FAC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 31 Mar 2020 06:37:02 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id k191so9885161pgc.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Mar 2020 23:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=i+kZ1kB/oiPs26tQOXEu+SZlkkg0fl6X4bH+/zZzR/Y=;
 b=b0K14d1rtzslnDocfYlmGWDEoIFOYQrE9NfVQ12Fo8M2JNq2nTaCht0NJ2QV3EKTMA
 7xtrHz458av4TvoX8oZpmQpt4yt13/cKUHKEM7og+JfhABP0tKccYb96kdYtpGzj6oUg
 ezYIHsaouZQBMx++516zKtN8PJExU48jKvBsfc8UOAhC9bsvlLlC8wINSVb+2IE5TtXq
 wjNYAhLDm4sg98weDYq38lZ2rlR9nZtGJB8QEgIxSeArvtt2hrqy/L/HNejtnB1sJ16G
 hOm18EFStMwHCdSHkoTpNFoUk+nSPo3wmE4+uw1AC5DL7aJ77JQu8FT3NQQYfBJVCbjD
 x4Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=i+kZ1kB/oiPs26tQOXEu+SZlkkg0fl6X4bH+/zZzR/Y=;
 b=HIUcXIDmsbY+bJFGB+pT6YmDJKvLcg8vgBjlwfNxeHK7Lle2ooJi0uSizHTS1Y9TxB
 52Uf32D8KwDaxe97xanEH5GfK1LoGrLwR3eX3ciCXuysAor7fR1Ug1TuQgYwT9N0B5mK
 sGjIqvGdkkBPgKXr5Z/dmPPuIO6oBZ6q8mGtrGvam8LZZgbNQ+Oo3UKj7yh3F5sgkEAw
 WSMX6twV/3Pqrh41sm5ZWDldESg95WFq+b7i7fJrWgiy/WVQyMZjXsuLsG4CmE+lmzbU
 Pveq9830+pgXfSYhOycwLxDDkaAYksxPWtEA5hzm7b9m3OTeKzw9oJ4j6T4GgayhH2KJ
 BKiA==
X-Gm-Message-State: ANhLgQ3D013wsHn7GLIKN8ObK8ffQxv76V+YIqn239sKLX77jMw8uete
 14KA9mu2ghRepL52OoPKa7+z
X-Google-Smtp-Source: ADFU+vv7XyfV7ZrcsfD6d7bNSgeyCQGLaj+Go1NGZpWxtxuDBxUW9f7eq4YjFDviWXwlUHKYPcmIqQ==
X-Received: by 2002:a63:9043:: with SMTP id a64mr16654345pge.308.1585636620523; 
 Mon, 30 Mar 2020 23:37:00 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:630f:1337:c28:2530:7bf4:e941])
 by smtp.gmail.com with ESMTPSA id f5sm12136243pfq.63.2020.03.30.23.36.56
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 30 Mar 2020 23:36:59 -0700 (PDT)
Date: Tue, 31 Mar 2020 12:06:53 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Marek Vasut <marex@denx.de>
Message-ID: <20200331063653.GB17400@Mani-XPS-13-9360>
References: <20200331005701.283998-1-marex@denx.de>
 <20200331005701.283998-14-marex@denx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200331005701.283998-14-marex@denx.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Patrick Delaunay <patrick.delaunay@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH V2 13/22] ARM: dts: stm32: Enable GPU on
	AV96
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

On Tue, Mar 31, 2020 at 02:56:52AM +0200, Marek Vasut wrote:
> Enable the GPU present on the STM32MP1 populated on AV96.
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
>  arch/arm/boot/dts/stm32mp157a-avenger96.dts | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/stm32mp157a-avenger96.dts b/arch/arm/boot/dts/stm32mp157a-avenger96.dts
> index 3dfc51f65709..3aeb3afa37d9 100644
> --- a/arch/arm/boot/dts/stm32mp157a-avenger96.dts
> +++ b/arch/arm/boot/dts/stm32mp157a-avenger96.dts
> @@ -140,6 +140,10 @@ phy0: ethernet-phy@7 {
>  	};
>  };
>  
> +&gpu {
> +	status = "okay";
> +};
> +
>  &i2c1 {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&i2c1_pins_b>;
> -- 
> 2.25.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
