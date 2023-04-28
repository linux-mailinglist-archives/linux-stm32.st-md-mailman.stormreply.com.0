Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 68EE46F204C
	for <lists+linux-stm32@lfdr.de>; Fri, 28 Apr 2023 23:56:45 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 184F9C6A5E7;
	Fri, 28 Apr 2023 21:56:45 +0000 (UTC)
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com
 [209.85.160.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8919FC64107
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Apr 2023 21:56:43 +0000 (UTC)
Received: by mail-oa1-f50.google.com with SMTP id
 586e51a60fabf-187ba2311b7so471631fac.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Apr 2023 14:56:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682719002; x=1685311002;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5nFjavnBxbro/fiUVf4O04xlVdcIJiqIT9b+HFjtLWg=;
 b=OHs7TwuNZKW83Mwg16QNEosb3KcsgrvnwHzaO82j62Vz25PFGnlJ3cGhB9wIsC/PSv
 Bohy2us5ClUmvv4g8PPmsAjJMGgL4+LoTKcrUCcmbXlShIOL+sGYefaqh1HwalRIfJHv
 FY0soimP+FPhU57Vwu3wfWNbM7rZ8jjRW3h7dIBvHTxIyz9359f1ReYhhrV2C+OtHuKb
 U91wgUyyKWI0mlI67RJr8o87gAjtDxxMS46e0PgzKXtwLoAfXzZn2VV2DZlkNTfY2Pp4
 0vmsB8lYf33oQzf80SiMx7bJBxUGSm9WKb3VxbiDFb2UuOJtO4Yupq80sraH73OsjoZw
 GKxQ==
X-Gm-Message-State: AC+VfDyXJdmg0eWiZNB/eh2fs0gSbpKpzXFoJGia6TiNFSPr1GDHDw4g
 S7Pe6Tp6QbpPcVqWgXvlIQ==
X-Google-Smtp-Source: ACHHUZ5OJNT5MsgdOGP6dVEQb4gbp242DVRGaHiNkTBgEHOBX2g6mFXeDDn4UrNam06kfjQ2PIi7Sw==
X-Received: by 2002:a05:6870:d8af:b0:180:3225:b33b with SMTP id
 dv47-20020a056870d8af00b001803225b33bmr3139192oab.34.1682719002252; 
 Fri, 28 Apr 2023 14:56:42 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 i4-20020a056870864400b0018e996a507esm6031489oal.31.2023.04.28.14.56.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Apr 2023 14:56:41 -0700 (PDT)
Received: (nullmailer pid 345861 invoked by uid 1000);
 Fri, 28 Apr 2023 21:56:41 -0000
Date: Fri, 28 Apr 2023 16:56:41 -0500
From: Rob Herring <robh@kernel.org>
To: Valentin Caron <valentin.caron@foss.st.com>
Message-ID: <20230428215641.GA332435-robh@kernel.org>
References: <20230428121524.2125832-1-valentin.caron@foss.st.com>
 <20230428121524.2125832-7-valentin.caron@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230428121524.2125832-7-valentin.caron@foss.st.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 6/7] dt-bindings: spi: stm32: add stm32h7
 st, spi-slave-underrun property
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

On Fri, Apr 28, 2023 at 02:15:23PM +0200, Valentin Caron wrote:
> This property is used to enable and configure stm32h7 SPI controller to
> handle underrun that could appear in slave mode.
> 
> Signed-off-by: Valentin Caron <valentin.caron@foss.st.com>
> ---
>  .../devicetree/bindings/spi/st,stm32-spi.yaml     |  8 ++++++++
>  MAINTAINERS                                       |  1 +
>  include/dt-bindings/spi/spi-stm32.h               | 15 +++++++++++++++
>  3 files changed, 24 insertions(+)
>  create mode 100644 include/dt-bindings/spi/spi-stm32.h
> 
> diff --git a/Documentation/devicetree/bindings/spi/st,stm32-spi.yaml b/Documentation/devicetree/bindings/spi/st,stm32-spi.yaml
> index 1d26fa2658c5..e946ea71a247 100644
> --- a/Documentation/devicetree/bindings/spi/st,stm32-spi.yaml
> +++ b/Documentation/devicetree/bindings/spi/st,stm32-spi.yaml
> @@ -28,6 +28,7 @@ allOf:
>        properties:
>          st,spi-midi-ns: false
>          spi-slave: false
> +        st,spi-slave-underrun: false
>  
>  properties:
>    "#address-cells": true
> @@ -70,6 +71,13 @@ properties:
>        In case of spi-slave defined, if <0>, indicate that SS should be
>        detected via the dedicated HW pin
>  
> +  st,spi-slave-underrun:
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    description:
> +      First parameter enables and selects slave underrun reaction.
> +      Refer to "dt-bindings/spi/spi-stm32.h" for the supported values.
> +      Second parameter is the pattern in case of SPI_SEND_PATTERN mode.

So, max 2 cells? Then:

minItems: 1
maxItems: 2

Though I don't really think this belongs in DT. The driver implementing 
the SPI slave function defines all the rest of the protocol the slave 
implements. Why not this little bit? Perhaps there is no way for a SPI 
slave driver to tell the SPI controller which controller specific mode 
to use, so you abuse DT to configure the SPI controller. Also, with a 
controller specific response, then the slave driver is coupled to that 
SPI controller which isn't great either.

Rob
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
