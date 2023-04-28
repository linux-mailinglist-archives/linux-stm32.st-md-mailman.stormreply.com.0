Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A4EE16F203C
	for <lists+linux-stm32@lfdr.de>; Fri, 28 Apr 2023 23:46:11 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 67068C6A5E7;
	Fri, 28 Apr 2023 21:46:11 +0000 (UTC)
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com
 [209.85.167.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 29819C64107
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Apr 2023 21:46:10 +0000 (UTC)
Received: by mail-oi1-f180.google.com with SMTP id
 5614622812f47-38e2740958aso219646b6e.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Apr 2023 14:46:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682718369; x=1685310369;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RTM2mluHD/ZVuQ06t+XTsEI3ZhySwZO1SLbkiRH9asw=;
 b=lb1ytW3qgkjEA9rqQwSg7Bduv1sWTd96GS5+HsrGKgv4fw8ND8cfJUzaglvDRxeO5K
 Mg3XQ36s4PXuWXN90BHt+EfmXd1IWekoii8A7JIEZjSEPVoX/GhdzivKoyAXEhiap5XG
 IvbpdN+JaQIDNciSIxixn7G+IUu1uZYXAx3vMeQZ4Am0ldijRSm94LL5PGKxKUO5NKTT
 hmwjHGdIbfjFGMUF41M+ULNw68TOEiuKrZJp4z0THkwTy9B8XvdFlF0gvCmafskAcy9x
 1NxnCZn8Te0rso+fo8eZXIchisDhgFjJJl0GbLu74gax8YS1YSzk3Slc5Z3NLEybMY4t
 a80Q==
X-Gm-Message-State: AC+VfDzKqgNi2abwO6hoc/OM+EJEM2HahxxiDZYtspz6FfOghBnxWjS8
 K1Z0bo/OSdTov0TSutC+qg==
X-Google-Smtp-Source: ACHHUZ7ILd+pYQIPWPAv2XKRDwq6NaoGnAux7/JTHMWijMavD87BT+jKgyaPYW41sX29xC4se2bTCg==
X-Received: by 2002:a05:6808:915:b0:38e:ada4:4512 with SMTP id
 w21-20020a056808091500b0038eada44512mr3056225oih.20.1682718368863; 
 Fri, 28 Apr 2023 14:46:08 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 27-20020a4ae1bb000000b00541fbbbcd31sm7600624ooy.5.2023.04.28.14.46.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Apr 2023 14:46:08 -0700 (PDT)
Received: (nullmailer pid 332170 invoked by uid 1000);
 Fri, 28 Apr 2023 21:46:07 -0000
Date: Fri, 28 Apr 2023 16:46:07 -0500
From: Rob Herring <robh@kernel.org>
To: Valentin Caron <valentin.caron@foss.st.com>
Message-ID: <20230428214607.GA326858-robh@kernel.org>
References: <20230428121524.2125832-1-valentin.caron@foss.st.com>
 <20230428121524.2125832-5-valentin.caron@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230428121524.2125832-5-valentin.caron@foss.st.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 4/7] dt-bindings: spi: stm32: add bindings
 regarding stm32h7 spi slave
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

On Fri, Apr 28, 2023 at 02:15:21PM +0200, Valentin Caron wrote:
> From: Alain Volmat <alain.volmat@foss.st.com>
> 
> Update the spi-stm32 binding yaml regarding to the SPI slave support.

Why? What problem are you trying to solve.

> 
> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
> Signed-off-by: Valentin Caron <valentin.caron@foss.st.com>
> ---
>  Documentation/devicetree/bindings/spi/st,stm32-spi.yaml | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/spi/st,stm32-spi.yaml b/Documentation/devicetree/bindings/spi/st,stm32-spi.yaml
> index c599eb359d56..1d26fa2658c5 100644
> --- a/Documentation/devicetree/bindings/spi/st,stm32-spi.yaml
> +++ b/Documentation/devicetree/bindings/spi/st,stm32-spi.yaml
> @@ -27,6 +27,7 @@ allOf:
>      then:
>        properties:
>          st,spi-midi-ns: false
> +        spi-slave: false
>  
>  properties:
>    "#address-cells": true
> @@ -62,6 +63,13 @@ properties:
>        - const: rx
>        - const: tx
>  
> +  cs-gpios:
> +    description:
> +      In case of spi-slave not defined, cs-gpios behave as defined in
> +      spi-controller.yaml.
> +      In case of spi-slave defined, if <0>, indicate that SS should be
> +      detected via the dedicated HW pin

I don't understand. I though cs-gpios was for master mode. You want to 
define 'cs-gpios = <0>;'? How would that be different than just omitting 
cs-gpios?

Rob
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
