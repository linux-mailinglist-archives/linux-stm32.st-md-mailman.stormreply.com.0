Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5933B198AF3
	for <lists+linux-stm32@lfdr.de>; Tue, 31 Mar 2020 06:09:45 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1C15EC36B0B;
	Tue, 31 Mar 2020 04:09:45 +0000 (UTC)
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com
 [209.85.216.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E77D8C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 31 Mar 2020 04:09:42 +0000 (UTC)
Received: by mail-pj1-f66.google.com with SMTP id m15so526238pje.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Mar 2020 21:09:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Ob7R2tyj6Le9Ag0UNt/tDhzAJi2KJtq2sjdVNkJwIEk=;
 b=j4b8WaDIvsftb0lwtK4le7R/u+VUpClHpWO56JPV3PMUz4RMn18487PRG3URvvNDt7
 5JvbIm6+qWZjhAqzT46p6S285lS+01Ila8n8so4C5U4pHYyzGNkqDKHhxXqQoWecF6Vx
 wNGnnRGA0TJgKKH7qDxOVYEvo1fkg/m56mglkQlncTUMoogBsRQizmQ517KfVUicxXWu
 kFc962zpvKQfmj0bUbyv1JtZWuDlKc2kvE0Osd4xlBamJefrQ6Kp+E2xbgGX5NvOlMlR
 J2Jskom4D0YagXX7Mhh27LCHjFZR+VQadCCVD2hF/cjgzMXCcPojTKr22H/LKIowYLn5
 JOuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Ob7R2tyj6Le9Ag0UNt/tDhzAJi2KJtq2sjdVNkJwIEk=;
 b=kAItJcgjY/G7RRZTHEqwDhmXQhbQTtNJs22w8kGJNiqxi9CpplsQynjjRzFirK2+ud
 BRlVwIeNVI1wFYbKG22mOq04LQlds27xM2ZBOFizLHnvjG0ZIl67oDJhbdpwFNgIPqPh
 sHY3xgvpgQfsysQ9FPcQLCpv4jZxwUldEiy427D1HpgQo02I7YS/xT3qIbw6PhSu3uOP
 bUUzk5RWo7levxJLjlVPnZK8ljbMNWxmT7983rIkXAYRMPkC4ngb6/3igkIpqadj7pnQ
 i1dcKE070z7tUDUiraSoGwIh/yQpD9JArOoP2xugTEeyNi9hwmXt0p+AS87gaE5HnNP6
 SEcA==
X-Gm-Message-State: AGi0PubqGoIQ7O7yaA1IiadcX+peIdY+QS4wpeVQQ7+g6oCE4Wt7S1eM
 4blFaGoLYLa3rzAksheYM14N
X-Google-Smtp-Source: APiQypLh0XhUTHvCgvzJXfbCv95toTr56iDmTAVPFVwF1XuqI/P2vEGs0oilL2j7wT2xaJ3hsnXyQg==
X-Received: by 2002:a17:90a:1a03:: with SMTP id
 3mr1625344pjk.136.1585627781350; 
 Mon, 30 Mar 2020 21:09:41 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:630f:1337:c28:2530:7bf4:e941])
 by smtp.gmail.com with ESMTPSA id y9sm11891159pfo.135.2020.03.30.21.09.37
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 30 Mar 2020 21:09:40 -0700 (PDT)
Date: Tue, 31 Mar 2020 09:39:35 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Marek Vasut <marex@denx.de>
Message-ID: <20200331040935.GB14274@Mani-XPS-13-9360>
References: <20200331005701.283998-1-marex@denx.de>
 <20200331005701.283998-23-marex@denx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200331005701.283998-23-marex@denx.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Patrick Delaunay <patrick.delaunay@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH V2 22/22] ARM: dts: stm32: Rename LEDs to
 match silkscreen on AV96
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

On Tue, Mar 31, 2020 at 02:57:01AM +0200, Marek Vasut wrote:
> The LED labels do not match the silkscreen on the board, fix it.
> 

Yikes, sorry for missing this earlier.

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> Signed-off-by: Marek Vasut <marex@denx.de>
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
>  arch/arm/boot/dts/stm32mp157a-avenger96.dts | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/stm32mp157a-avenger96.dts b/arch/arm/boot/dts/stm32mp157a-avenger96.dts
> index b6cb3b2d8c78..4291a97cc05f 100644
> --- a/arch/arm/boot/dts/stm32mp157a-avenger96.dts
> +++ b/arch/arm/boot/dts/stm32mp157a-avenger96.dts
> @@ -55,21 +55,21 @@ memory@c0000000 {
>  	led {
>  		compatible = "gpio-leds";
>  		led1 {
> -			label = "green:user1";
> +			label = "green:user0";
>  			gpios = <&gpioz 7 GPIO_ACTIVE_HIGH>;
>  			linux,default-trigger = "heartbeat";
>  			default-state = "off";
>  		};
>  
>  		led2 {
> -			label = "green:user2";
> +			label = "green:user1";
>  			gpios = <&gpiof 3 GPIO_ACTIVE_HIGH>;
>  			linux,default-trigger = "mmc0";
>  			default-state = "off";
>  		};
>  
>  		led3 {
> -			label = "green:user3";
> +			label = "green:user2";
>  			gpios = <&gpiog 0 GPIO_ACTIVE_HIGH>;
>  			linux,default-trigger = "mmc1";
>  			default-state = "off";
> -- 
> 2.25.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
