Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E0529198B5C
	for <lists+linux-stm32@lfdr.de>; Tue, 31 Mar 2020 06:36:42 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9F228C36B0B;
	Tue, 31 Mar 2020 04:36:42 +0000 (UTC)
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
 [209.85.215.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 310CEC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 31 Mar 2020 04:36:41 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id d17so9788821pgo.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Mar 2020 21:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=ZePJ6gF3l6jA5xPHqluqpOczdHl6/t615VhrfHAgMe4=;
 b=Uifxm67MlSIdTzbTDENp/is6Uhp9Fv1gHIUuCvDde1wMd5t5sjX4lWes0EFOJcfPxR
 woVMa2yKrqMD1KXLh9e3rcy9j+75qoJ15erxtOM5zkn0ZkbrqNdouNo96qc03j9b8gIT
 Bab2JZ7grhxPjf5tD4eeglhwKpLkTp2h10oqt81t6cyx5CRPfXBWkZ1dBFhqewphwqBS
 s/03Pgb+4arRtZAiv2um5UUPeMtrlxcVI8B6cXgjz1wZtpDJPF0n2YDk0FpOBv9nGIzr
 RwVBXPTPJ/ZPHxS7o6woON2rH8nqMpz1xGW+XmBivUvdgN8m6UCuGxSoWzx5eODRPO88
 ljMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ZePJ6gF3l6jA5xPHqluqpOczdHl6/t615VhrfHAgMe4=;
 b=MZKFDQSA4S/Xp/3npPLRSNgAkWkG4+FkHD54VhMhtxBmFfbsaghYaEuZQvgEhTtzfh
 s7ia8FwSZ9ayxXiHaR39Z5Htwjq8nPMupWKxCilONosc1LigvW4aMlAcpCdXPdAjJxEM
 dymyLENgF+fV3JdJpNtbPF10jFHBCvbdNi7NUEwInvygcV98jhSv5SASEObOEcYY3ssQ
 F6whRV59E7+mVhZb3nONDQBVR+LwxczHpUCwtKu9wNienUHn6xGmMALNCxQUUuMpjsgM
 QXimi7UvtTQPEZvuIUWeNP9+1EfkLCPotAMDdgKKO5QsDB7jgzEUhx1o0/WvDqr8Z8My
 OSSQ==
X-Gm-Message-State: ANhLgQ3FWmkzbJ0+yIvgf0dm8bo+J9t8VgWaGlFynS5Ks/0d0bfHX+t4
 DkkM0oH+OP/39Y2JbTVWqcCB
X-Google-Smtp-Source: ADFU+vuABsMzcs+3bgdTq7M7oj4+j90hTyn6BzihSaf9D4S6Qt/+7ZRsgYisjIgTuC8qTFyZDhQSoA==
X-Received: by 2002:a63:ea4e:: with SMTP id l14mr15741062pgk.431.1585629399496; 
 Mon, 30 Mar 2020 21:36:39 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:630f:1337:c28:2530:7bf4:e941])
 by smtp.gmail.com with ESMTPSA id e7sm11476211pfj.97.2020.03.30.21.36.34
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 30 Mar 2020 21:36:38 -0700 (PDT)
Date: Tue, 31 Mar 2020 10:06:32 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Marek Vasut <marex@denx.de>
Message-ID: <20200331043632.GI14274@Mani-XPS-13-9360>
References: <20200331005701.283998-1-marex@denx.de>
 <20200331005701.283998-8-marex@denx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200331005701.283998-8-marex@denx.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Patrick Delaunay <patrick.delaunay@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH V2 07/22] ARM: dts: stm32: Add alternate
 pinmux for SDMMC2 pins 4-7
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

On Tue, Mar 31, 2020 at 02:56:46AM +0200, Marek Vasut wrote:
> Add another mux option for SDMMC2 pins 4..7, this is used on AV96 board.
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
>  arch/arm/boot/dts/stm32mp15-pinctrl.dtsi | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi b/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi
> index 8ac534c5bdf6..ec3621e0ff08 100644
> --- a/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi
> +++ b/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi
> @@ -1062,6 +1062,27 @@ pins {
>  		};
>  	};
>  
> +	sdmmc2_d47_pins_b: sdmmc2-d47-1 {
> +		pins {
> +			pinmux = <STM32_PINMUX('A', 8, AF9)>, /* SDMMC2_D4 */
> +				 <STM32_PINMUX('A', 15, AF9)>, /* SDMMC2_D5 */
> +				 <STM32_PINMUX('C', 6, AF10)>, /* SDMMC2_D6 */
> +				 <STM32_PINMUX('C', 7, AF10)>; /* SDMMC2_D7 */
> +			slew-rate = <1>;
> +			drive-push-pull;
> +			bias-pull-up;
> +		};
> +	};
> +
> +	sdmmc2_d47_sleep_pins_b: sdmmc2-d47-sleep-1 {
> +		pins {
> +			pinmux = <STM32_PINMUX('A', 8, ANALOG)>, /* SDMMC2_D4 */
> +				 <STM32_PINMUX('A', 15, ANALOG)>, /* SDMMC2_D5 */
> +				 <STM32_PINMUX('C', 6, ANALOG)>, /* SDMMC2_D6 */
> +				 <STM32_PINMUX('C', 7, ANALOG)>; /* SDMMC2_D7 */
> +		};
> +	};
> +
>  	sdmmc3_b4_pins_a: sdmmc3-b4-0 {
>  		pins1 {
>  			pinmux = <STM32_PINMUX('F', 0, AF9)>, /* SDMMC3_D0 */
> -- 
> 2.25.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
