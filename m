Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 99D053879C5
	for <lists+linux-stm32@lfdr.de>; Tue, 18 May 2021 15:21:26 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4E89DC57B74;
	Tue, 18 May 2021 13:21:26 +0000 (UTC)
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com
 [209.85.167.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 57888C57B5F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 May 2021 13:21:24 +0000 (UTC)
Received: by mail-oi1-f175.google.com with SMTP id v22so9739287oic.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 May 2021 06:21:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=u+wN1H4CiOq/deGj0uJD8MCy7BhsRO561PN/y6kBixo=;
 b=CpvVoNmvelCS6viSUe7UXg5/RW0WASs1oazPtFVA+pr5dBeOvCqK7BdpXWNdhRwxiv
 LwKt2XTdwgCrgIBzxiumTBc9Jug2hsoWsERS0jGqLBp8JxObeBZA8uEx0+Je3QNkyqGf
 Hl7Z+iLJHbWIr6l0GZgXq4DI8UtXBvmohCp938c7nsgp/56gg0YTguVFJt7vyoQLlt3e
 GQcjz3SDo5B+X29crZvR8gocmg4bJ+P3rCwvLfD2zTAp+a/Q9hWQND84tgIiXQNSSloh
 qMyA/WyEsfx9jcUDgO+lCIsCnUYosf6gf2VkBD6Xr+caxEdEyCzgJEaE4L0Hp3FFkPzd
 urUw==
X-Gm-Message-State: AOAM531oRgYwUaKU1rk6ou1GXQB8qQd2+WczFDfLe7KeK3hSLWbAJ+Jj
 bvLIExLGsQjLaxBpANrJgQ==
X-Google-Smtp-Source: ABdhPJzfBHQ7VoQgiEFOmE1+YMwi0t+QqNadLu2n4/RcHyI1SltKiBCKlWZ2rzE8A8SXpn01ZUuu2w==
X-Received: by 2002:a05:6808:8cd:: with SMTP id
 k13mr3997317oij.156.1621344081680; 
 Tue, 18 May 2021 06:21:21 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id d185sm3413682oib.25.2021.05.18.06.21.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 06:21:21 -0700 (PDT)
Received: (nullmailer pid 526193 invoked by uid 1000);
 Tue, 18 May 2021 13:21:19 -0000
Date: Tue, 18 May 2021 08:21:19 -0500
From: Rob Herring <robh@kernel.org>
To: Marek Vasut <marex@denx.de>
Message-ID: <20210518132119.GA492897@robh.at.kernel.org>
References: <20210515204317.366967-1-marex@denx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210515204317.366967-1-marex@denx.de>
Cc: devicetree@vger.kernel.org, Benjamin Gaignard <benjamin.gaignard@st.com>,
 Antonio Borneo <antonio.borneo@st.com>, Vincent Abriou <vincent.abriou@st.com>,
 Philippe Cornu <philippe.cornu@st.com>, dri-devel@lists.freedesktop.org,
 Yannick Fertre <yannick.fertre@st.com>, Andrzej Hajda <a.hajda@samsung.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Biju Das <biju.das.jz@bp.renesas.com>, Sam Ravnborg <sam@ravnborg.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 ch@denx.de
Subject: Re: [Linux-stm32] [PATCH V4 1/2] dt-bindings: display: bridge:
 lvds-codec: Document pixel data sampling edge select
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

On Sat, May 15, 2021 at 10:43:15PM +0200, Marek Vasut wrote:
> The OnSemi FIN3385 Parallel-to-LVDS encoder has a dedicated input line to
> select input pixel data sampling edge. Add DT property "pclk-sample", not
> the same as the one used by display timings but rather the same as used by
> media, to define the pixel data sampling edge.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Alexandre Torgue <alexandre.torgue@st.com>
> Cc: Andrzej Hajda <a.hajda@samsung.com>
> Cc: Antonio Borneo <antonio.borneo@st.com>
> Cc: Benjamin Gaignard <benjamin.gaignard@st.com>
> Cc: Biju Das <biju.das.jz@bp.renesas.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Philippe Cornu <philippe.cornu@st.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Vincent Abriou <vincent.abriou@st.com>
> Cc: Yannick Fertre <yannick.fertre@st.com>
> Cc: devicetree@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> To: dri-devel@lists.freedesktop.org
> ---
> V4: New patch split from combined V3
> ---
>  .../bindings/display/bridge/lvds-codec.yaml    | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml b/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
> index 304a1367faaa..f4dd16bd69d2 100644
> --- a/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
> @@ -64,6 +64,14 @@ properties:
>        - port@0
>        - port@1
>  
> +  pclk-sample:
> +    description:
> +      Data sampling on rising or falling edge.
> +    enum:
> +      - 0  # Falling edge
> +      - 1  # Rising edge
> +    default: 0

This is already defined in video-interfaces.yaml, why are you redefining 
it here?

It's also defined to be an endpoint property, so move it there and 
reference video-interfaces.yaml.

> +
>    powerdown-gpios:
>      description:
>        The GPIO used to control the power down line of this device.
> @@ -71,6 +79,16 @@ properties:
>  
>    power-supply: true
>  
> +if:
> +  not:
> +    properties:
> +      compatible:
> +        contains:
> +          const: lvds-encoder
> +then:
> +  properties:
> +    pclk-sample: false

This constraint would be difficult to express with the property in an 
endpoint. I'd just drop it.

Rob
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
