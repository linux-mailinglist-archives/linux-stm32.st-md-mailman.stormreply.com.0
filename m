Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 567F521DE2C
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Jul 2020 19:05:49 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1ADA2C36B29;
	Mon, 13 Jul 2020 17:05:49 +0000 (UTC)
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
 [209.85.166.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4CE69C36B0C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Jul 2020 17:05:46 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id i4so14234993iov.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Jul 2020 10:05:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=4jl0UjbzV2OAP2EmSX4iuTz5iJINBRO38hYrgQ/UX/A=;
 b=Fp5+hKY5JGmm3ZdIvu+oy6lo8okugQmPBfOqfC4PWNLn8oP8g/gnrVvLst31dG5bMv
 GLJqEoggTn/gjvkmfGtz7pikK/PzAUUOx+VbSsNsdOJ/d8dON4M/Ss0sPFPA2mpCoUyX
 53XE9iElHMEHbNp6aoYw/Nkuy+bSoS4CAAjJPK+lhUYK6s7kDz9lT9q4HzR8VAvF+cDQ
 wy0GMe/309uEnHPdH3tlFM0Vm/OpvzXZ/sBP3+01iom3v5MgfYFjOEiZ8ZrOPNt7skVT
 nDYGJ1cvrtmVgnNNKbOoSSz5Sg45+UtYVG8gSyTzoMtO3RD1/jjswxSujkxcEqAJKWfg
 /1Rg==
X-Gm-Message-State: AOAM531jx9JK462CJe+3sqdL4YAeD70vIqXVZ2p1xaMA3oEluMAibaxE
 3PXcn5YXfVLQdoq0Sek1dQ==
X-Google-Smtp-Source: ABdhPJxDEcwhz0IyGNmYp/NGGAlbzEHgUbeYWUqbdxP7AUUJu+FPa/ebrtJU6dD/xdg72XlVTipxwQ==
X-Received: by 2002:a6b:1496:: with SMTP id 144mr758347iou.6.1594659944828;
 Mon, 13 Jul 2020 10:05:44 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
 by smtp.gmail.com with ESMTPSA id b6sm493310iow.35.2020.07.13.10.05.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jul 2020 10:05:44 -0700 (PDT)
Received: (nullmailer pid 390110 invoked by uid 1000);
 Mon, 13 Jul 2020 17:05:42 -0000
Date: Mon, 13 Jul 2020 11:05:42 -0600
From: Rob Herring <robh@kernel.org>
To: Benjamin Gaignard <benjamin.gaignard@st.com>
Message-ID: <20200713170542.GA384390@bogus>
References: <20200701132523.32533-1-benjamin.gaignard@st.com>
 <20200701132523.32533-4-benjamin.gaignard@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200701132523.32533-4-benjamin.gaignard@st.com>
Cc: devicetree@vger.kernel.org, gregkh@linuxfoundation.org,
 linus.walleij@linaro.org, linux-kernel@vger.kernel.org, tomase@xilinx.com,
 mcoquelin.stm32@gmail.com, stefano.stabellini@xilinx.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v4 3/5] dt-bindings: bus: Add STM32 ETZPC
 firewall controller
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

On Wed, Jul 01, 2020 at 03:25:21PM +0200, Benjamin Gaignard wrote:
> Document STM32 ETZPC firewall controller bindings
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
> ---
>  .../bindings/bus/stm32/st,stm32-etzpc.yaml         | 46 ++++++++++++++++++++++
>  1 file changed, 46 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/bus/stm32/st,stm32-etzpc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/bus/stm32/st,stm32-etzpc.yaml b/Documentation/devicetree/bindings/bus/stm32/st,stm32-etzpc.yaml
> new file mode 100644
> index 000000000000..d92865fda40c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/bus/stm32/st,stm32-etzpc.yaml
> @@ -0,0 +1,46 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/bus/stm32/st,stm32-etzpc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: STM32 Extended TrustZone Protection controller
> +
> +maintainers:
> +  - Benjamin Gaignard <benjamin.gaignard@st.com>
> +
> +description: STMicroelectronics's STM32 firewall bus controller implementation
> +
> +allOf:
> +  - $ref: "firewall-provider.yaml#"
> +  - $ref: /schemas/simple-bus.yaml#

Your bus has controls/setup, it's not a simple-bus.

Do you expect an old kernel or one with support for "st,stm32-etzpc-bus" 
disabled to work? How's it going to know if certain nodes can't be 
accessed without that support? 

> +
> +properties:
> +  compatible:
> +    contains:
> +      enum:
> +        - st,stm32-etzpc-bus
> +
> +  reg:
> +   maxItems: 1
> +
> +  '#firewall-cells':
> +    const: 2
> +
> +required:
> +  - compatible
> +  - reg
> +  - '#firewall-cells'
> +
> +examples:
> +  - |
> +    soc@5c007000 {
> +      compatible = "st,stm32-etzpc-bus", "simple-bus";
> +      reg = <0x5c007000 0x400>;
> +      #firewall-cells = <2>;
> +      #address-cells = <1>;
> +      #size-cells = <1>;
> +      ranges;
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
