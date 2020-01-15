Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A6CB13C625
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Jan 2020 15:35:29 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DADCAC36B0F;
	Wed, 15 Jan 2020 14:35:28 +0000 (UTC)
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
 [209.85.167.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 360FAC36B0D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Jan 2020 14:35:26 +0000 (UTC)
Received: by mail-oi1-f195.google.com with SMTP id n16so15520243oie.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Jan 2020 06:35:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=vmc4LTv9UhARNZilVqDisUzXdxxex8ZA0E5+WbrzhDk=;
 b=ixDBwVrfQatM0JrgFgoODctO7IoYAZZf7q85mbLJijLRfz070h9jKaUNAumw4TJs2Z
 73lS+y5kFgoKbYsejUFZMpOHjT8dwx6mX+cfF8sKX/BM7W7jt71UPKv2ObAFGWyga4jd
 UTZ4LZ2EyHWaLEuX+W41UEmBvyAdFhG2YtfK4fR1Irlfrd1EkCE9gTczSirWbwdx4hMQ
 e+N/sgL17sL/jE4v4nfEyjojZNG7zIq8OC00yXIX/tzWAfYZNGWW+HtRsUhMUTQqwnJK
 vadPKtQyITHo/Y+Gici8pmWxfRIv5CRkF1iLkmOWoI4Y3lIDutZsGSRBMqrMgzp4DQnF
 PTVQ==
X-Gm-Message-State: APjAAAWjNtO2fGkrfpN5HOhp98JRCgJsxToeeCGyfpg8ZwBxPXEyONMS
 BQ0CelBxG2/8vylV+sbZvRd/88c=
X-Google-Smtp-Source: APXvYqwe9ah4whwCZ9uNdSScuJiCRShAe+DMvOvYhTtNePGscXiVdB0NjUpzAGUhppuSfFinih3qJA==
X-Received: by 2002:aca:c493:: with SMTP id u141mr56336oif.62.1579098924237;
 Wed, 15 Jan 2020 06:35:24 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id h1sm6610025otn.6.2020.01.15.06.35.22
 for <linux-stm32@st-md-mailman.stormreply.com>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jan 2020 06:35:23 -0800 (PST)
Received: from rob (uid 1000) (envelope-from rob@rob-hp-laptop) id 22040c
 by rob-hp-laptop (DragonFly Mail Agent v0.11);
 Wed, 15 Jan 2020 08:35:21 -0600
Date: Wed, 15 Jan 2020 08:35:21 -0600
From: Rob Herring <robh@kernel.org>
To: Benjamin Gaignard <benjamin.gaignard@st.com>
Message-ID: <20200115143521.GA15099@bogus>
References: <20200109145333.12260-1-benjamin.gaignard@st.com>
 <20200109145333.12260-2-benjamin.gaignard@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200109145333.12260-2-benjamin.gaignard@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, daniel.lezcano@linaro.org,
 linux@armlinux.org.uk, p.paillet@st.com, mcoquelin.stm32@gmail.com,
 tglx@linutronix.de, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/3] dt-bindings: timer: Add STM32 Low
 Power Timer bindings
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

On Thu, Jan 09, 2020 at 03:53:31PM +0100, Benjamin Gaignard wrote:
> Document STM32 Low Power bindings.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
> ---
>  .../bindings/timer/st,stm32-lp-timer.yaml          | 44 ++++++++++++++++++++++
>  1 file changed, 44 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/timer/st,stm32-lp-timer.yaml
> 
> diff --git a/Documentation/devicetree/bindings/timer/st,stm32-lp-timer.yaml b/Documentation/devicetree/bindings/timer/st,stm32-lp-timer.yaml
> new file mode 100644
> index 000000000000..ca040b96dc47
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/timer/st,stm32-lp-timer.yaml

Use the compatible for the filename.

> @@ -0,0 +1,44 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/timer/st,stm32-lp-timer.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: STMicroelectronics STM32 Low Power 16 bits timers bindings
> +
> +maintainers:
> +  - Benjamin Gaignard <benjamin.gaignard@st.com>
> +
> +properties:
> +  compatible:
> +    const: st,stm32-lptimer-clkevent

'clkevent' is a h/w name? Seems redundant and abusing compatible to 
bind to a specific Linux driver. 

> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/stm32mp1-clks.h>
> +    clkevent: clkevent@40009000 {

timer@...

> +      compatible = "st,stm32-lptimer-clkevent";
> +      reg = <0x40009000 0x400>;
> +      clocks = <&rcc LPTIM1_K>;
> +      interrupts = <GIC_SPI 93 IRQ_TYPE_LEVEL_HIGH>;
> +    };
> +
> +...
> -- 
> 2.15.0
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
