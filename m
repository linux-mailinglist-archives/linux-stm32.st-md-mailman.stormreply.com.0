Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8485A43BBAB
	for <lists+linux-stm32@lfdr.de>; Tue, 26 Oct 2021 22:38:12 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0BBDCC5660B;
	Tue, 26 Oct 2021 20:38:12 +0000 (UTC)
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com
 [209.85.167.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BF146C0614D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Oct 2021 20:38:08 +0000 (UTC)
Received: by mail-oi1-f174.google.com with SMTP id r6so402013oiw.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Oct 2021 13:38:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=cQAy+ch/uXL0enK+MtdMfdJNuhvgB4pFrD8BNcOrG1A=;
 b=ReNOO64HYbOOrEiI8YiXMyN5hbxSzJsAYczGB8dWY6em1eg99Q4imqYsLm/t7e+0gz
 MklK+4a/rFSX7AjZ1fAasHq5KCxjsQgaZYxng25IlZHzGvM0YotsMN/9EC9U74i4aAPW
 0Xyns5FmsiJ8mHBW0TMuKVw4xFTyrmvoDBOcW0tL0saudb+gyC50hXKQvTZEgN3OvkmF
 xKkAEM/4HvpJxVFYc8iNYxTwMwk5q8UgSkF0MTb5/ItMqMAF04H0GCVxRaN7K4hAwDqQ
 clIDWfASIj9X2CFrYDMsZPe141bZQ5joolISwuDuhXK16pidUaBTvBAWKeVllvUJmYCF
 OXsQ==
X-Gm-Message-State: AOAM5323s6QBRV8hGFEWOz0UlVR0CusBTboOJLFJCK9PdaJwC8golgHs
 u6WQkPoOnyQVbJ2t1AKexg==
X-Google-Smtp-Source: ABdhPJzauTHPSFI/P4AXq1Lb+Cgj5u3xsLCqIk3BpGpme6R4fCMv6FXhMoQpXBkiuqzHK27I78Rb8g==
X-Received: by 2002:a05:6808:1cc:: with SMTP id
 x12mr780989oic.88.1635280687533; 
 Tue, 26 Oct 2021 13:38:07 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id c5sm935744oiw.13.2021.10.26.13.38.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 13:38:07 -0700 (PDT)
Received: (nullmailer pid 3202845 invoked by uid 1000);
 Tue, 26 Oct 2021 20:38:06 -0000
Date: Tue, 26 Oct 2021 15:38:06 -0500
From: Rob Herring <robh@kernel.org>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Message-ID: <YXhnLh9OYxUz8dIC@robh.at.kernel.org>
References: <1634144026-3326-1-git-send-email-fabrice.gasnier@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1634144026-3326-1-git-send-email-fabrice.gasnier@foss.st.com>
Cc: devicetree@vger.kernel.org, gregkh@linuxfoundation.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 alexandre.torgue@foss.st.com, hminas@synopsys.com,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: usb: dwc2: document the port
 when usb-role-switch is used
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

On Wed, Oct 13, 2021 at 06:53:46PM +0200, Fabrice Gasnier wrote:
> Document the "port" property, which is used with "usb-role-switch"
> to describe the bus connector.
> Definition is inspired from mediatek,mtu3.yaml.
> 
> This fixes some errors seen when running "make dtbs_check":
> ... 'port' does not match any of the regexes: 'pinctrl-[0-9]+'
>         From schema: ... Documentation/devicetree/bindings/usb/dwc2.yaml
> 
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> ---
>  Documentation/devicetree/bindings/usb/dwc2.yaml | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/dwc2.yaml b/Documentation/devicetree/bindings/usb/dwc2.yaml
> index 10c7d9b..7d1aa53 100644
> --- a/Documentation/devicetree/bindings/usb/dwc2.yaml
> +++ b/Documentation/devicetree/bindings/usb/dwc2.yaml
> @@ -130,6 +130,16 @@ properties:
>      description: If present indicates that we need to reset the PHY when we 
>        detect a wakeup. This is due to a hardware errata.
>  
> +  port:
> +    description:
> +      Any connector to the data bus of this controller should be modelled
> +      using the OF graph bindings specified, if the "usb-role-switch"
> +      property is used. See graph.txt

Drop 'See graph.txt'

> +    $ref: /schemas/graph.yaml#/properties/port
> +
> +dependencies:
> +  port: [ 'usb-role-switch' ]

usb-role-switch without port is valid or both must be present. In case 
of the latter, you need to add:

usb-role-switch: [ port ]

Also, you don't need quotes.

> +
>  required:
>    - compatible
>    - reg
> -- 
> 2.7.4
> 
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
