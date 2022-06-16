Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FD9B54E8F5
	for <lists+linux-stm32@lfdr.de>; Thu, 16 Jun 2022 19:58:04 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 06869C57B6C;
	Thu, 16 Jun 2022 17:58:04 +0000 (UTC)
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com
 [209.85.166.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 52E03C03FC8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Jun 2022 17:58:03 +0000 (UTC)
Received: by mail-il1-f182.google.com with SMTP id s1so1463153ilj.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Jun 2022 10:58:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Vzh2Zm4AVli9IvG1hRT6/9kSvoSMME7E4kKTDugolos=;
 b=EG6NBkAhrhoFiVnkPs6CG747Tl8+RIKajUSy0uzsO20J7j1hXjzXK42JUKx2reHMU3
 1AXybg6RDyC1pk+SejnBGjNLppv5VEuyZRzFLdES2bl6pKffN+7b66N4zIoUxjkwnlgl
 ygsQkx926M2YP6S4cFB6YreK04qQDgkSElHZTSJH+BLDB9rleblQyMph35J0YdcwHYuB
 Sjl/LOllkatSvKrVS/EytiEOFnft2z8L23rv5mAZWwRD5rZOY7/hYfWsCsABXC9WaV/I
 W9RFiv2sWMXznTPXcqW+S+wHn4I3vmUfYw8gIXGWLxpx2lI9gLFP4/3F/S4pnedWI/eO
 yKdQ==
X-Gm-Message-State: AJIora8Kv+QYrq8Hy+p0REexbX+pAoI/tPyAplgjnoiOmSa1OAm7IboU
 sdRH5C7DSkMG0LPkEMnR2w==
X-Google-Smtp-Source: AGRyM1sVbtvnP0A8utta8zz6lTur5lT+U7sLerXzx10ITGxVc5NJfom9jFeeT9hnYKnW14CPgT5FmA==
X-Received: by 2002:a05:6e02:168f:b0:2d3:c51d:7f69 with SMTP id
 f15-20020a056e02168f00b002d3c51d7f69mr3622386ila.64.1655402282173; 
 Thu, 16 Jun 2022 10:58:02 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.251])
 by smtp.gmail.com with ESMTPSA id
 c4-20020a6bcc04000000b006696754eef5sm1414438iog.13.2022.06.16.10.58.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jun 2022 10:58:01 -0700 (PDT)
Received: (nullmailer pid 3725093 invoked by uid 1000);
 Thu, 16 Jun 2022 17:58:00 -0000
Date: Thu, 16 Jun 2022 11:58:00 -0600
From: Rob Herring <robh@kernel.org>
To: Marek Vasut <marex@denx.de>
Message-ID: <20220616175800.GA3721641-robh@kernel.org>
References: <20220613095328.5661-1-marex@denx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220613095328.5661-1-marex@denx.de>
Cc: devicetree@vger.kernel.org, Alexandre Torgue <alexandre.torgue@st.com>,
 Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/7] dt-bindings: arm: stm32: Add
 compatible string for DH electronics DHCOR DRC Compact
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

On Mon, Jun 13, 2022 at 11:53:22AM +0200, Marek Vasut wrote:
> Add DT compatible string for DH electronics STM32MP15xx DHCOR on DRC Compact
> carrier board into YAML DT binding document. This system is a general purpose
> DIN Rail Controller design.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Alexandre Torgue <alexandre.torgue@st.com>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Patrice Chotard <patrice.chotard@st.com>
> Cc: Patrick Delaunay <patrick.delaunay@st.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> To: linux-arm-kernel@lists.infradead.org
> ---
>  Documentation/devicetree/bindings/arm/stm32/stm32.yaml | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
> index 8b31565fee591..17366d9cf15bf 100644
> --- a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
> +++ b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
> @@ -61,8 +61,12 @@ properties:
>  
>        - description: DH STM32MP153 SoM based Boards
>          items:
> -          - const: dh,stm32mp153c-dhcom-drc02
> -          - const: dh,stm32mp153c-dhcom-som
> +          - enum:
> +              - dh,stm32mp153c-dhcom-drc02
> +              - dh,stm32mp153c-dhcor-drc-compact
> +          - enum:
> +              - dh,stm32mp153c-dhcom-som
> +              - dh,stm32mp153c-dhcor-som

Seems like dh,stm32mp153c-dhcor-som should be a new entry? Unless that 
plus dh,stm32mp153c-dhcom-drc02 is valid?

>            - const: st,stm32mp153
>  
>        - items:
> -- 
> 2.35.1
> 
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
