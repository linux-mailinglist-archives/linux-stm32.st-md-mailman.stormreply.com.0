Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 440CA198B24
	for <lists+linux-stm32@lfdr.de>; Tue, 31 Mar 2020 06:22:36 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0FB22C36B0B;
	Tue, 31 Mar 2020 04:22:36 +0000 (UTC)
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9383EC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 31 Mar 2020 04:22:34 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id 22so9711329pfa.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Mar 2020 21:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=K25kdwUJcBgot3xI/Fo/RXxUOUW30/HWq7xi5HWBpBg=;
 b=VG9Myz+HLLWJWNvFmKQbCzAFHo6AGuGzzU2zoN/qW/wvqUHc2AEiSlM/JX1oDzIbCK
 Yr1pkNrD6NClX6ffF2LkgYQf52zvGzxugc0X1j1CZJKXhxb4K4t6OmAcSw4Lx/wvKGPz
 BAP9/+Rmr4xaGo4JWqY6kIGYfKhKuKjHV4WpQ6Gvrdnh4Y9JO2dB4JazhElwji5z2TPX
 tmhLO59cdHIP68iRlkVYGTUmgTreNzHBSjBtE3dZrJUahtS/G9G4xTolscrMSJ5eKg/h
 5RL+1CKY7tFq1395IRNi0OU76VBvRU5bldubCOnEi8ghYAzTcOjnX9c7xH3Ku7uDN9C7
 x+6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=K25kdwUJcBgot3xI/Fo/RXxUOUW30/HWq7xi5HWBpBg=;
 b=gz3+rR9myHgs7Bd4NxQPgvyUMtMQYjMVyEKmo+FxR1dE5Vq3ac6k1CATmksr68lVD4
 Evn/o65WhamFTtomnjWS0qlzfOKHqRRAflPA9ou9W3OHTtgIZzQ6nfTkO2W0Hkq7IJfz
 wD2WENQvhWvxAiSs6XT58eObnXJyjU93NqXST1Xhl2IIVb6l4HJktgDRdEaamUvJGqyR
 03pNOZOppZ6CiIr7g4a8fX9WuBSn+JY/qmNHQCJKMrQPcmb3xGur+3MrdfWjjJn1NmOo
 blGDP1qXlaNDRFO+yfl3DNl2GvK4uO54eZv+g70efnFRZOId7E+z6lgtEumkVulg9wAZ
 UkjQ==
X-Gm-Message-State: AGi0PuYWD6lpS/YW1iT7y0JgmXYCMteGMA9p3RMY8k8AUfKyzGaEwoUs
 dOb2X1tUYKydJ22j4wXmHa9x
X-Google-Smtp-Source: APiQypKyrcd55/sX4Gjlmr+UJBnz2TCP2GbWTtQzYH+HuxEM9tpEkD71MNKqLnCPpe4Ud+wmCXOppA==
X-Received: by 2002:a63:2263:: with SMTP id t35mr12545007pgm.253.1585628553100; 
 Mon, 30 Mar 2020 21:22:33 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:630f:1337:c28:2530:7bf4:e941])
 by smtp.gmail.com with ESMTPSA id x4sm831960pjf.23.2020.03.30.21.22.29
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 30 Mar 2020 21:22:32 -0700 (PDT)
Date: Tue, 31 Mar 2020 09:52:26 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Marek Vasut <marex@denx.de>
Message-ID: <20200331042226.GF14274@Mani-XPS-13-9360>
References: <20200331005701.283998-1-marex@denx.de>
 <20200331005701.283998-5-marex@denx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200331005701.283998-5-marex@denx.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Patrick Delaunay <patrick.delaunay@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH V2 04/22] ARM: dts: stm32: Add missing
 ethernet PHY skews on AV96
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

On Tue, Mar 31, 2020 at 02:56:43AM +0200, Marek Vasut wrote:
> The KS9031 PHY supports configurable PHY skews to compensate for
> the board routing. Fill in the correct values.
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
>  arch/arm/boot/dts/stm32mp157a-avenger96.dts | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/stm32mp157a-avenger96.dts b/arch/arm/boot/dts/stm32mp157a-avenger96.dts
> index a568d3824cb0..e58653ccb60f 100644
> --- a/arch/arm/boot/dts/stm32mp157a-avenger96.dts
> +++ b/arch/arm/boot/dts/stm32mp157a-avenger96.dts
> @@ -96,6 +96,20 @@ mdio0 {
>  		compatible = "snps,dwmac-mdio";
>  		phy0: ethernet-phy@7 {
>  			reg = <7>;
> +
> +			rxc-skew-ps = <1500>;
> +			rxdv-skew-ps = <540>;
> +			rxd0-skew-ps = <420>;
> +			rxd1-skew-ps = <420>;
> +			rxd2-skew-ps = <420>;
> +			rxd3-skew-ps = <420>;
> +
> +			txc-skew-ps = <1440>;
> +			txen-skew-ps = <540>;
> +			txd0-skew-ps = <420>;
> +			txd1-skew-ps = <420>;
> +			txd2-skew-ps = <420>;
> +			txd3-skew-ps = <420>;
>  		};
>  	};
>  };
> -- 
> 2.25.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
