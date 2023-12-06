Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 151C3807321
	for <lists+linux-stm32@lfdr.de>; Wed,  6 Dec 2023 15:56:49 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BC91BC6DD6A;
	Wed,  6 Dec 2023 14:56:48 +0000 (UTC)
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com
 [209.85.210.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6F038C64110
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  6 Dec 2023 14:56:47 +0000 (UTC)
Received: by mail-ot1-f42.google.com with SMTP id
 46e09a7af769-6d9a1dd6fdcso467570a34.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 06 Dec 2023 06:56:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701874606; x=1702479406;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dMFxTkt+APt9VkSo60/Rj4cKZLAsbnVIJIMVqJP/nRI=;
 b=wwXW4KHrxgc9TOqpFCscWIUu+36OTW5ie3Eq+mUyuUAanTB5sAiZL9Xfj+J5PbQY3d
 WaG/mvF2zWcuWbrZg/o898KqSw+CCGoS4t2tv+ZI+8gyPf+ZhIeP69ze8c0peom87iYG
 gAMmKwTHrfG6UbH8aeuoSWL7/0gR4vW9VrFD8CbcMmT2TKlKWDQLhFEaVwQpLZXqgKEN
 W24SBCAe3czm/P6YZv7jUew5oFLZB1tUXRnI2q+XiWG4FglaxTI3q0JIaMzddqn2QKCa
 ZrI64oasOufS8bzsINQH/MLTflhtQj8fKz9r2JB3iLCGYRCu7IFfkgjJLUioeQC94Yfo
 an3w==
X-Gm-Message-State: AOJu0Yw53VDJMtOpc4xIB5ERff57b2zUs2jrRP6wBHmVot3vg5DSJ+Xp
 nv84n9BYXVkTpkYAlfk+Hw==
X-Google-Smtp-Source: AGHT+IGo7Nw4yr8MZn9UYM3es1DB4fV7+KFr86PkrLstPfPuNnxjgC+QKtK0LxxDfWXey61y9+S+nQ==
X-Received: by 2002:a05:6830:c89:b0:6d8:74f0:30d3 with SMTP id
 bn9-20020a0568300c8900b006d874f030d3mr1429643otb.29.1701874606223; 
 Wed, 06 Dec 2023 06:56:46 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 m2-20020a9d4c82000000b006d879b8e68csm1880241otf.69.2023.12.06.06.56.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Dec 2023 06:56:45 -0800 (PST)
Received: (nullmailer pid 2138604 invoked by uid 1000);
 Wed, 06 Dec 2023 14:56:44 -0000
Date: Wed, 6 Dec 2023 08:56:44 -0600
From: Rob Herring <robh@kernel.org>
To: Alain Volmat <alain.volmat@foss.st.com>
Message-ID: <20231206145644.GA2133904-robh@kernel.org>
References: <20231129125920.1702497-1-alain.volmat@foss.st.com>
 <20231129125920.1702497-4-alain.volmat@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231129125920.1702497-4-alain.volmat@foss.st.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 3/7] dt-bindings: i2c: document st,
 stm32mp25-i2c compatible
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

On Wed, Nov 29, 2023 at 01:59:12PM +0100, Alain Volmat wrote:
> Add a new compatible st,stm32mp25-i2c for the STM32MP25 series which
> has only one interrupt line for both events and errors and differs in
> term of handling of FastModePlus.
> 
> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
> ---
>  .../devicetree/bindings/i2c/st,stm32-i2c.yaml | 49 +++++++++++++++----
>  1 file changed, 39 insertions(+), 10 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml b/Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml
> index 94b75d9f66cd..6a69bb6de23e 100644
> --- a/Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml
> +++ b/Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml
> @@ -19,6 +19,7 @@ allOf:
>                - st,stm32f7-i2c
>                - st,stm32mp13-i2c
>                - st,stm32mp15-i2c
> +              - st,stm32mp25-i2c
>      then:
>        properties:
>          i2c-scl-rising-time-ns:
> @@ -41,6 +42,43 @@ allOf:
>          clock-frequency:
>            enum: [100000, 400000]
>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - st,stm32f4-i2c
> +              - st,stm32f7-i2c
> +              - st,stm32mp13-i2c
> +              - st,stm32mp15-i2c
> +    then:
> +      properties:
> +        interrupts:
> +          items:
> +            - description: interrupt ID for I2C event
> +            - description: interrupt ID for I2C error
> +
> +        interrupt-names:
> +          items:
> +            - const: event
> +            - const: error
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - st,stm32mp25-i2c
> +    then:
> +      properties:
> +        interrupts:
> +          items:
> +            - description: common interrupt for events and errors
> +
> +        interrupt-names:
> +          items:
> +            - const: event
> +
>  properties:
>    compatible:
>      enum:
> @@ -48,20 +86,11 @@ properties:
>        - st,stm32f7-i2c
>        - st,stm32mp13-i2c
>        - st,stm32mp15-i2c
> +      - st,stm32mp25-i2c
>  
>    reg:
>      maxItems: 1
>  
> -  interrupts:
> -    items:
> -      - description: interrupt ID for I2C event
> -      - description: interrupt ID for I2C error
> -
> -  interrupt-names:
> -    items:
> -      - const: event
> -      - const: error

No this should remain. You are duplicating defining the names otherwise. 
Add 'minItems: 1' here. Then the if/then schemas should just have 
'maxItems: 1' or 'minItems: 2'.

Rob
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
