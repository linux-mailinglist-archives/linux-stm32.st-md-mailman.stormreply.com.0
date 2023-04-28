Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7147A6F2032
	for <lists+linux-stm32@lfdr.de>; Fri, 28 Apr 2023 23:42:01 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 19998C6A5E7;
	Fri, 28 Apr 2023 21:42:01 +0000 (UTC)
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com
 [209.85.160.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 090E6C64107
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Apr 2023 21:41:59 +0000 (UTC)
Received: by mail-oa1-f46.google.com with SMTP id
 586e51a60fabf-18f4a6d2822so5062871fac.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Apr 2023 14:41:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682718119; x=1685310119;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IxtZnuIy0A7kqLFx2X9sGSOUm6gtVrEopxo0uafl4ms=;
 b=ITXiZxZQOWzT0lJ7NUPXWSyIllArRi5SWPhJv2omop/c+aslle+F1MJ0FibSA0c3NH
 gDaQc4WjErFgyQd78/8Z1Twki2T7cqQrbdclN/6tp0lVtNNYBHIAaMM4qLrAJnvlmn3O
 p+fsatKOE0U6moOv53f/pDnpZGWssV/lCh2oUuwjX8YeZGAxoMiyycyxxrJDTwcP0zHe
 sdAOdOsa+ST0JGvoC5xd7VODSQBk4wsmAKUtunIpjWIToMyxdDq/xBfBenW9EwXKsw7P
 MKOejhXMSdb/TKPfAYGHo33ekbIwUBwmUmCO5ytp5UvQ08lMon7lxW7FVgWL4LwICRLE
 xLQQ==
X-Gm-Message-State: AC+VfDwj/WtSvV+ufDBg0t7ve7ypZUyf0Qq0/0Rf5UhEHXDffn+xtwz+
 Ys7LEdttovHhOavNWlgiNw==
X-Google-Smtp-Source: ACHHUZ7ig/kRGrr3EBDJFMjrS7DQC209jAzc9ANKsoMDyT4ZiCAvOl0+vyGPxIeVYeEzqvF/Kp/Ovw==
X-Received: by 2002:aca:3257:0:b0:38e:32b5:cfba with SMTP id
 y84-20020aca3257000000b0038e32b5cfbamr4878446oiy.10.1682718118679; 
 Fri, 28 Apr 2023 14:41:58 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 e131-20020acab589000000b00383d9700294sm9272371oif.40.2023.04.28.14.41.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Apr 2023 14:41:58 -0700 (PDT)
Received: (nullmailer pid 326660 invoked by uid 1000);
 Fri, 28 Apr 2023 21:41:57 -0000
Date: Fri, 28 Apr 2023 16:41:57 -0500
From: Rob Herring <robh@kernel.org>
To: Valentin Caron <valentin.caron@foss.st.com>
Message-ID: <20230428214157.GA322525-robh@kernel.org>
References: <20230428121524.2125832-1-valentin.caron@foss.st.com>
 <20230428121524.2125832-2-valentin.caron@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230428121524.2125832-2-valentin.caron@foss.st.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/7] dt-bindings: spi: stm32: add
 address-cells and size-cells into yaml
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

On Fri, Apr 28, 2023 at 02:15:18PM +0200, Valentin Caron wrote:
> Theses properties need to be described to satisfy dtbs_check.

No, they are defined in spi-controller.yaml, so they should not be 
needed here.

> 
> Signed-off-by: Valentin Caron <valentin.caron@foss.st.com>
> ---
>  Documentation/devicetree/bindings/spi/st,stm32-spi.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/spi/st,stm32-spi.yaml b/Documentation/devicetree/bindings/spi/st,stm32-spi.yaml
> index 9ca1a843c820..c599eb359d56 100644
> --- a/Documentation/devicetree/bindings/spi/st,stm32-spi.yaml
> +++ b/Documentation/devicetree/bindings/spi/st,stm32-spi.yaml
> @@ -29,6 +29,9 @@ allOf:
>          st,spi-midi-ns: false
>  
>  properties:
> +  "#address-cells": true
> +  "#size-cells": true
> +
>    compatible:
>      enum:
>        - st,stm32f4-spi
> -- 
> 2.25.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
