Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DAC2333171C
	for <lists+linux-stm32@lfdr.de>; Mon,  8 Mar 2021 20:20:46 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 94360C57195;
	Mon,  8 Mar 2021 19:20:46 +0000 (UTC)
Received: from mail-il1-f175.google.com (mail-il1-f175.google.com
 [209.85.166.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 15B57C5718B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  8 Mar 2021 19:20:43 +0000 (UTC)
Received: by mail-il1-f175.google.com with SMTP id i18so9847306ilq.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 08 Mar 2021 11:20:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=1L6btlnZFWT2wUztSO9tevXV6NJv+ZeIlELKczZZaFw=;
 b=I0iymfGeJznwVQOt3TEprn7VUXnOlBBgKfO/k146h6NwO0NXEjBLhvxUWkI45znXb2
 ZA9QvNxtwuDfjV+e5tgaBuJBxaPrQBCZi+Z6no3pSnljiwR21lplmZq5TzGtTyNzm/wG
 PR46qDy+eoXY275BWZaTwnAFfkTcNz6CI9hVbdW1XkYWMpEDX53M7327P7BLDDsUo3No
 +LEX629lDA6obsSOlkA5lDe84YZjb0rLcG9Qsw0gkUKnphyrhc8G0+uoj/s2EUHJsRNP
 8rdKg+cplv4of9fDvlmCoZqVJF0cCc4SUOqm5KiohvlNAE6goWdfhM7BC6d1HuAz47Xc
 GEqQ==
X-Gm-Message-State: AOAM5304EgicDcZDr0/k7F29o2t0gfqxKH90XvTBJaB2otH3snoiaojp
 GT+LS0Bmehveph6cZ0Khxg==
X-Google-Smtp-Source: ABdhPJxNZi/akTGS5KF27FuIlkC3rfNJTzbmnPnH89Rfz7vgq18ujwtUCYa7gJdG40A1z3VSgdqRRA==
X-Received: by 2002:a92:c102:: with SMTP id p2mr21010388ile.227.1615231242427; 
 Mon, 08 Mar 2021 11:20:42 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id a4sm3426705iow.55.2021.03.08.11.20.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Mar 2021 11:20:41 -0800 (PST)
Received: (nullmailer pid 2816246 invoked by uid 1000);
 Mon, 08 Mar 2021 19:20:40 -0000
Date: Mon, 8 Mar 2021 12:20:40 -0700
From: Rob Herring <robh@kernel.org>
To: Martin Devera <devik@eaxlabs.cz>
Message-ID: <20210308192040.GA2807217@robh.at.kernel.org>
References: <aeefa74e-fa19-6c31-5240-0f14fca89298@foss.st.com>
 <20210302190303.28630-1-devik@eaxlabs.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210302190303.28630-1-devik@eaxlabs.cz>
Cc: devicetree@vger.kernel.org, Alexandre Torgue <alexandre.torgue@st.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-serial@vger.kernel.org,
 Jiri Slaby <jirislaby@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 Le Ray <erwan.leray@st.com>
Subject: Re: [Linux-stm32] [PATCH v4 1/2] dt-bindings: serial: Add
	rx-tx-swap to stm32-usart
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

On Tue, Mar 02, 2021 at 08:03:02PM +0100, Martin Devera wrote:
> Add new rx-tx-swap property to allow for RX & TX pin swapping.
> 
> Signed-off-by: Martin Devera <devik@eaxlabs.cz>
> ---
>  .../devicetree/bindings/serial/st,stm32-uart.yaml  | 32 +++++++++++++++-------
>  1 file changed, 22 insertions(+), 10 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/serial/st,stm32-uart.yaml b/Documentation/devicetree/bindings/serial/st,stm32-uart.yaml
> index 8631678283f9..6eab2debebb5 100644
> --- a/Documentation/devicetree/bindings/serial/st,stm32-uart.yaml
> +++ b/Documentation/devicetree/bindings/serial/st,stm32-uart.yaml
> @@ -9,9 +9,6 @@ maintainers:
>  
>  title: STMicroelectronics STM32 USART bindings
>  
> -allOf:
> -  - $ref: rs485.yaml
> -
>  properties:
>    compatible:
>      enum:
> @@ -40,6 +37,10 @@ properties:
>  
>    uart-has-rtscts: true
>  
> +  rx-tx-swap:
> +    type: boolean
> +    maxItems: 1

Type is boolean, but 'maxItems' applies to arrays.

In any case, this is already defined in serial.yaml, so just 
'rx-tx-swap: true' here.

> +
>    dmas:
>      minItems: 1
>      maxItems: 2
> @@ -66,13 +67,24 @@ properties:
>    linux,rs485-enabled-at-boot-time: true
>    rs485-rx-during-tx: true
>  
> -if:
> -  required:
> -    - st,hw-flow-ctrl
> -then:
> -  properties:
> -    cts-gpios: false
> -    rts-gpios: false
> +allOf:

And add '- $ref: serial.yaml#' here.

> +  - $ref: rs485.yaml
> +  - if:
> +      required:
> +        - st,hw-flow-ctrl
> +    then:
> +      properties:
> +        cts-gpios: false
> +        rts-gpios: false
> +  - if:
> +      required:
> +        - rx-tx-swap
> +    then:
> +      properties:
> +        compatible:
> +          enum:
> +            - st,stm32f7-uart
> +            - st,stm32h7-uart

The normal pattern is the 'if' has compatible. You can put the other 
compatible strings in the if, and then 'then' is:

then:
  properties:
    rx-tx-swap: false


Rob
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
