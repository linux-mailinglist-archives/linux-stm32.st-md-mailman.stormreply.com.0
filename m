Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 59816477D23
	for <lists+linux-stm32@lfdr.de>; Thu, 16 Dec 2021 21:15:18 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0D30FC5F1D9;
	Thu, 16 Dec 2021 20:15:18 +0000 (UTC)
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com
 [209.85.210.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 56339C5EC76
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Dec 2021 20:15:17 +0000 (UTC)
Received: by mail-ot1-f51.google.com with SMTP id
 a23-20020a9d4717000000b0056c15d6d0caso239746otf.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Dec 2021 12:15:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=NYmeLfLobnbzpDW1UJt55IT1E6sxaX+gTnLSdXFJ+9k=;
 b=sEsnjD1K7L4A9NfD4YzNWrK8F3r3vY0WcvyqU2s+KsqczoYqahW0HzudJWQUIL8COh
 B+A45VD5hb5e9GkqOnxDJtMhcf0PU0kKFm2JYL/9UzAwQZ1iRQ8rQfn9UBN3qJRSLhGM
 G9HcDrmUpciUpLVOJqqnfSK0oOwAZ47EQ71aLnn5c7gk5NnxlpRgIPEwOdmWze7CoHBh
 pCaNmPCZ9DuGkZDb8fzmpRrMnzzFOzfg1DhHYGAYr7kHSLyuFiDuauj/2as5/p00C0ge
 6ZmlJz4ZucxUyWR84SQrnxa8jCVWpu9AkPFbCVl8zRKa+D5qucBQwxwCaTV+aAPaZx4i
 fpPw==
X-Gm-Message-State: AOAM532Qbv5jRzEhWIRBzgSQ+i5R2xh6N+T/+rGd9vlUoMXvxWHErtUn
 5QXshaIMecvXvawxwFu1Kw==
X-Google-Smtp-Source: ABdhPJyvLCwGruPUfdr2lc9ZUCfmx7PigNZabGaqqj/UuuptIxAPkDUDcmqq8jNjbMJqpha7OmVvgQ==
X-Received: by 2002:a05:6830:44a1:: with SMTP id
 r33mr14012682otv.162.1639685715882; 
 Thu, 16 Dec 2021 12:15:15 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id e21sm1212688ote.72.2021.12.16.12.15.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 12:15:15 -0800 (PST)
Received: (nullmailer pid 681236 invoked by uid 1000);
 Thu, 16 Dec 2021 20:15:14 -0000
Date: Thu, 16 Dec 2021 14:15:14 -0600
From: Rob Herring <robh@kernel.org>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>
Message-ID: <YbueUmqyzwS9rOu5@robh.at.kernel.org>
References: <20211215105847.2328-1-alexandre.torgue@foss.st.com>
 <20211215105847.2328-2-alexandre.torgue@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211215105847.2328-2-alexandre.torgue@foss.st.com>
Cc: devicetree@vger.kernel.org, Marc Zyngier <maz@kernel.org>,
 linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 1/5] dt-bindings: interrupt-controller:
 Update STM32 EXTI interrupt controller
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

On Wed, Dec 15, 2021 at 11:58:43AM +0100, Alexandre Torgue wrote:
> Document new entry "st,exti-mapping" which links EXTI lines with GIC
> interrupt lines and add an include file to define EXTI interrupt type.
> 
> Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/st,stm32-exti.yaml b/Documentation/devicetree/bindings/interrupt-controller/st,stm32-exti.yaml
> index d19c881b4abc..e08bb51e97a8 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/st,stm32-exti.yaml
> +++ b/Documentation/devicetree/bindings/interrupt-controller/st,stm32-exti.yaml
> @@ -41,6 +41,17 @@ properties:
>      description:
>        Interrupts references to primary interrupt controller
>  
> +  st,exti-mapping:
> +    $ref: "/schemas/types.yaml#/definitions/uint32-matrix"
> +    description: |
> +            Define mapping between EXTI lines and GIC irq lines. Should be:
> +            st,exti-mapping = <EXTI_LINE GIC_IRQ EXTI_TYPE>, ...;
> +            With:
> +            - EXTI_LINE: EXTI line number.
> +            - GIC_IRQ: GIC IRQ associated to the EXTI line.
> +            - EXTI_TYPE: STM32_EXTI_TYPE_CONFIGURABLE or STM32_EXTI_TYPE_DIRECT.
> +              Defined in include/dt-bindings/interrupt-controller/stm32-exti.h

No custom properties for this. See[1][2][3].

Rob


[1] https://lore.kernel.org/all/20211122103032.517923-1-maz@kernel.org/
[2] https://lore.kernel.org/all/87k0g8jlmg.wl-maz@kernel.org/
[3] https://lore.kernel.org/all/CAL_JsqK2Shj6smam7HgNAmy3UG+vVQPkU3Q0OjyEHOEJB45n0A@mail.gmail.com/
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
