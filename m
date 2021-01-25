Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 680C4302E14
	for <lists+linux-stm32@lfdr.de>; Mon, 25 Jan 2021 22:40:48 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 21B9CC5663B;
	Mon, 25 Jan 2021 21:40:48 +0000 (UTC)
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com
 [209.85.210.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D335BC56639
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 Jan 2021 21:40:46 +0000 (UTC)
Received: by mail-ot1-f51.google.com with SMTP id e70so14245482ote.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 Jan 2021 13:40:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=jFvGGF+GApXU3mEuRZRMts4wWuIR4lLZDNcLcWjS4Os=;
 b=s820kHzt9bvLdDndmCep/TJu1bSdcc0VZrfIBMnpBPr4w0QeZgzE6SMXSJWcw7Kudz
 FBqsBarzj9bLaFGbhCT13cM9pe43Qe9Pflt9RW6pwwcTTs7cSOz3SBgHR3ct1exUVONX
 /LFNcfCe87XkzFjnsBfBGSUW+LgFoFrxcMGq2s02gbWvK/GWIjrc8LlXvTSf2ntjV/yM
 cmd5iThsJl34Iv9bOG6xoIbQxDbU9d/9+CiGTn5XXOifGJUDFqzy3bP7OE3pRuqraODS
 yXJi7KHCVbjKCwKPpygfh69RxeBF4cQQdHpm3B/zJWTLakYlLqd1Mpa+5ehBZxMUP/Ux
 03dg==
X-Gm-Message-State: AOAM533y87DH0fQOnjFlXEwDnqDOg5Nu4Hy8/O2efcWasLV4OXepYViG
 Xr0uLwo1119IWK3d46S6fQ==
X-Google-Smtp-Source: ABdhPJzZDgcSoRHUG+fj06W9B8eAhd0yh8E5shntkS8AUWYZc/Zr9QKzD38zD0jd0vq74wHnVHC4iA==
X-Received: by 2002:a05:6830:1589:: with SMTP id
 i9mr1772550otr.127.1611610844768; 
 Mon, 25 Jan 2021 13:40:44 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id t65sm3726614oie.25.2021.01.25.13.40.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jan 2021 13:40:43 -0800 (PST)
Received: (nullmailer pid 1053015 invoked by uid 1000);
 Mon, 25 Jan 2021 21:40:42 -0000
Date: Mon, 25 Jan 2021 15:40:42 -0600
From: Rob Herring <robh@kernel.org>
To: Amelie Delaunay <amelie.delaunay@foss.st.com>
Message-ID: <20210125214042.GA1049362@robh.at.kernel.org>
References: <20210114171314.18946-1-amelie.delaunay@foss.st.com>
 <20210114171314.18946-2-amelie.delaunay@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210114171314.18946-2-amelie.delaunay@foss.st.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Vinod Koul <vkoul@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Kishon Vijay Abraham I <kishon@ti.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 1/2] dt-bindings: phy:
 phy-stm32-usbphyc: add #clock-cells required property
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

On Thu, Jan 14, 2021 at 06:13:13PM +0100, Amelie Delaunay wrote:
> usbphyc provides a unique clock called ck_usbo_48m.
> STM32 USB OTG needs a 48Mhz clock (utmifs_clk48) for Full-Speed operation.
> ck_usbo_48m is a possible parent clock for USB OTG 48Mhz clock.
> 
> ck_usbo_48m is available as soon as the PLL is enabled.
> 
> Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
> ---
> No change in v2.
> ---
>  .../devicetree/bindings/phy/phy-stm32-usbphyc.yaml          | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/phy-stm32-usbphyc.yaml b/Documentation/devicetree/bindings/phy/phy-stm32-usbphyc.yaml
> index 46df6786727a..4e4da64b8e01 100644
> --- a/Documentation/devicetree/bindings/phy/phy-stm32-usbphyc.yaml
> +++ b/Documentation/devicetree/bindings/phy/phy-stm32-usbphyc.yaml
> @@ -51,6 +51,10 @@ properties:
>    vdda1v8-supply:
>      description: regulator providing 1V8 power supply to the PLL block
>  
> +  '#clock-cells':
> +    description: number of clock cells for ck_usbo_48m consumer
> +    const: 0
> +
>  #Required child nodes:
>  
>  patternProperties:
> @@ -102,6 +106,7 @@ required:
>    - "#size-cells"
>    - vdda1v1-supply
>    - vdda1v8-supply
> +  - '#clock-cells'

You can't really make new properties required as it's not backwards 
compatible. If things can never work without or the binding has never 
been used, then you can. You just need to spell this out in the commit 
msg.

>    - usb-phy@0
>    - usb-phy@1
>  
> @@ -120,6 +125,7 @@ examples:
>          vdda1v8-supply = <&reg18>;
>          #address-cells = <1>;
>          #size-cells = <0>;
> +        #clock-cells = <0>;
>  
>          usbphyc_port0: usb-phy@0 {
>              reg = <0>;
> -- 
> 2.17.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
