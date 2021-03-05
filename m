Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 99C0032F33A
	for <lists+linux-stm32@lfdr.de>; Fri,  5 Mar 2021 19:53:53 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 33CC4C57B7C;
	Fri,  5 Mar 2021 18:53:53 +0000 (UTC)
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com
 [209.85.210.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ADEAAC57182
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 Mar 2021 18:53:51 +0000 (UTC)
Received: by mail-ot1-f44.google.com with SMTP id j8so2814268otc.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 05 Mar 2021 10:53:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=fneTq2063McDFfTPtwQtaMOm7W8A1xMYIqx5C0mAJsk=;
 b=dHp6KRR8c4GhwqVMu6qRzZUwEjPcuRb95V1jOolmIiWDPKH/mXtEwv49jNhjydt2dz
 vAdTnn3tAITzVghNvTDcfOBSDGqg3Bq++WroELB3nruU1GH0hOHV7USS8b1VclxGpkQG
 2FOM2stezvLIitxCqdkXBmjMNI0oPPb9Ix0Am2lJBYdWyWT1Yg11W86h+mi+YrLm3DEA
 6aK1m75pENzbg3i9JoVpXv4n4MyHU3ZwJ+hHx4CiL7DBEdbKCTEqm+ID9biU/LQjHDOs
 ZU9fhDwIK2QtkkPM9R4Fq9X02s8VjtnNOJ//Vt39p8DNS5Se0+BWiLhLQzVKqXEWGmGK
 efEw==
X-Gm-Message-State: AOAM531V+Plmmfvde2LXRn2iQyrA4QOfMtsTaFy8vJIfPuUBGToZ3BqU
 eScaZ5p9l5JWXS4v/gEfhQ==
X-Google-Smtp-Source: ABdhPJx2eP3/GWFcePScRRMJu4lNsYmW8oQimLQi+5KHkY5RbcmejQsXuc9T1SCDS/k9iNKR7cLyrA==
X-Received: by 2002:a9d:73ce:: with SMTP id m14mr8673721otk.57.1614970430386; 
 Fri, 05 Mar 2021 10:53:50 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id h20sm765795otr.2.2021.03.05.10.53.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Mar 2021 10:53:49 -0800 (PST)
Received: (nullmailer pid 468180 invoked by uid 1000);
 Fri, 05 Mar 2021 18:53:47 -0000
Date: Fri, 5 Mar 2021 12:53:47 -0600
From: Rob Herring <robh@kernel.org>
To: Valentin Caron <valentin.caron@foss.st.com>
Message-ID: <20210305185347.GA466473@robh.at.kernel.org>
References: <20210209095948.15889-1-valentin.caron@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210209095948.15889-1-valentin.caron@foss.st.com>
Cc: devicetree@vger.kernel.org, linux-serial@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: serial: stm32: add examples
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

On Tue, Feb 09, 2021 at 10:59:48AM +0100, Valentin Caron wrote:
> From: Valentin Caron <valentin.caron@st.com>
> 
> Add examples to show more use cases :
>  - uart2 with hardware flow control
>  - uart4 without flow control

Why do I need these? I can go read your dts files if I need more 
examples.

> 
> Signed-off-by: Valentin Caron <valentin.caron@foss.st.com>
> ---
>  .../bindings/serial/st,stm32-uart.yaml        | 20 +++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/serial/st,stm32-uart.yaml b/Documentation/devicetree/bindings/serial/st,stm32-uart.yaml
> index 06d5f251ec88..3a4aab5d1862 100644
> --- a/Documentation/devicetree/bindings/serial/st,stm32-uart.yaml
> +++ b/Documentation/devicetree/bindings/serial/st,stm32-uart.yaml
> @@ -82,6 +82,26 @@ additionalProperties: false
>  examples:
>    - |
>      #include <dt-bindings/clock/stm32mp1-clks.h>
> +
> +    usart4: serial@40004c00 {
> +      compatible = "st,stm32-uart";
> +      reg = <0x40004c00 0x400>;
> +      interrupts = <52>;
> +      clocks = <&clk_pclk1>;
> +      pinctrl-names = "default";
> +      pinctrl-0 = <&pinctrl_usart4>;
> +    };
> +
> +    usart2: serial@40004400 {
> +      compatible = "st,stm32-uart";
> +      reg = <0x40004400 0x400>;
> +      interrupts = <38>;
> +      clocks = <&clk_pclk1>;
> +      st,hw-flow-ctrl;
> +      pinctrl-names = "default";
> +      pinctrl-0 = <&pinctrl_usart2 &pinctrl_usart2_rtscts>;
> +    };
> +
>      usart1: serial@40011000 {
>        compatible = "st,stm32-uart";
>        reg = <0x40011000 0x400>;
> -- 
> 2.17.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
