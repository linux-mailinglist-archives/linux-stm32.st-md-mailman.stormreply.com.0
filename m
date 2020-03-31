Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 63E42198B51
	for <lists+linux-stm32@lfdr.de>; Tue, 31 Mar 2020 06:29:05 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 178A9C36B0B;
	Tue, 31 Mar 2020 04:29:05 +0000 (UTC)
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
 [209.85.216.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AEAEFC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 31 Mar 2020 04:29:02 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id q16so608460pje.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Mar 2020 21:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=5+VD0VICqUDZ03RMPOJuD7+hulAAX+AM3uc7ye10aKA=;
 b=GsimS701sIzESQKuziB6u9ixVUwAmnldR4qeoklJbr0E8sJx2719bbNv+QUdDND4oR
 srlPN3NAC0gQaTuo5XKI08fZONnJjzT0BfXFRzXiQMUsPhKdNzm2Ih6DWWNqujxZsXnw
 QVPvHRu50ZYRFqUFJKuzdWBCN6zTvzg2QCopKyGlx6DsyVitx/OSbWIejNWwDqqwScLt
 pFNt/P2i+sZ1Ff0VKHaU1NntDtDoDNLfu7EBz4FbL+Qu6AlIKwmdzDG//Tv6AyzNor5i
 IMSnju/Jmje5HIU6QcM0cG4BQNpHQH1L3XGE3RtG6/AohUEAlBLyJ3nS7nZlOIuLC/XN
 l89A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=5+VD0VICqUDZ03RMPOJuD7+hulAAX+AM3uc7ye10aKA=;
 b=MZMV6aof2HkH62v77Py0KPaqklV1gA5XD2tDSnryjY61eP4lNHJgJCUiIz4jbQ9Hgi
 DRlJjeyvY14nQpEYI7IPeFoL5Rmv7muMMJbHpcqCdSBzmPaEDx2bgC7GOBtuGRnBvumq
 wgc4Dfjg1AoPW+px6uI8P73/mN5lom6f033XlU0fFS0uYgTrOOFVExasTaPhJ04ZzmaL
 PuppWtANPQqOk2ZcrY+S63kVXxcXXO4+Q36z/IFtfseD4uu3XRhulHxWJ1avyx82N6ZF
 0FGbtpwel8U1lWeP1rZ+z/fva2ciQeRDUb7txUWDCfO+KUHN6nok4DL8y7vC+blw/Mxx
 vLNA==
X-Gm-Message-State: AGi0PuZuo5U7G6sRraImEkzvUE9g/vxeGqaO3gmMaveOWvB3t4Ta4RC9
 M/aGjKWqb6RtFRDAwBVojHjj
X-Google-Smtp-Source: APiQypLlBEVTSevpSbON9G/e7tnribMpmdu34SknCXBWtlzGH9m9Giq4JH+LY9Z256zMD9nqb7pfKA==
X-Received: by 2002:a17:902:b682:: with SMTP id
 c2mr2415794pls.36.1585628941054; 
 Mon, 30 Mar 2020 21:29:01 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:630f:1337:c28:2530:7bf4:e941])
 by smtp.gmail.com with ESMTPSA id 21sm10837668pgf.41.2020.03.30.21.28.56
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 30 Mar 2020 21:29:00 -0700 (PDT)
Date: Tue, 31 Mar 2020 09:58:53 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Marek Vasut <marex@denx.de>
Message-ID: <20200331042853.GG14274@Mani-XPS-13-9360>
References: <20200331005701.283998-1-marex@denx.de>
 <20200331005701.283998-6-marex@denx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200331005701.283998-6-marex@denx.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Patrick Delaunay <patrick.delaunay@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH V2 05/22] ARM: dts: stm32: Add alternate
 pinmux for SDMMC1 direction pins
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

On Tue, Mar 31, 2020 at 02:56:44AM +0200, Marek Vasut wrote:
> Add another mux option for SDMMC1 direction pins, in particular
> SDMMC1_D123DIR, this is used on AV96 board.
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
> V2: Fix SDMMC1_D123DIR AF, should be AF11
> ---
>  arch/arm/boot/dts/stm32mp15-pinctrl.dtsi | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi b/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi
> index 4569dc16e5a1..8ac534c5bdf6 100644
> --- a/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi
> +++ b/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi
> @@ -920,6 +920,30 @@ pins {
>  		};
>  	};
>  
> +	sdmmc1_dir_pins_b: sdmmc1-dir-1 {
> +		pins1 {
> +			pinmux = <STM32_PINMUX('F', 2, AF11)>, /* SDMMC1_D0DIR */
> +				 <STM32_PINMUX('E', 14, AF11)>, /* SDMMC1_D123DIR */
> +				 <STM32_PINMUX('B', 9, AF11)>; /* SDMMC1_CDIR */
> +			slew-rate = <1>;
> +			drive-push-pull;
> +			bias-pull-up;
> +		};
> +		pins2{
> +			pinmux = <STM32_PINMUX('E', 4, AF8)>; /* SDMMC1_CKIN */
> +			bias-pull-up;
> +		};
> +	};
> +
> +	sdmmc1_dir_sleep_pins_b: sdmmc1-dir-sleep-1 {
> +		pins {
> +			pinmux = <STM32_PINMUX('F', 2, ANALOG)>, /* SDMMC1_D0DIR */
> +				 <STM32_PINMUX('E', 14, ANALOG)>, /* SDMMC1_D123DIR */
> +				 <STM32_PINMUX('B', 9, ANALOG)>, /* SDMMC1_CDIR */
> +				 <STM32_PINMUX('E', 4, ANALOG)>; /* SDMMC1_CKIN */
> +		};
> +	};
> +
>  	sdmmc2_b4_pins_a: sdmmc2-b4-0 {
>  		pins1 {
>  			pinmux = <STM32_PINMUX('B', 14, AF9)>, /* SDMMC2_D0 */
> -- 
> 2.25.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
