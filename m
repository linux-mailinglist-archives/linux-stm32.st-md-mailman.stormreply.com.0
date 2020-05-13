Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BEA861D04BA
	for <lists+linux-stm32@lfdr.de>; Wed, 13 May 2020 04:19:37 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 78F0AC32E92;
	Wed, 13 May 2020 02:19:37 +0000 (UTC)
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
 [209.85.167.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F4218C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 May 2020 02:19:34 +0000 (UTC)
Received: by mail-oi1-f194.google.com with SMTP id c12so19130319oic.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 May 2020 19:19:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=hVIvDXLUWV7kCm1sjwCAhS0B4yNvu2YKfopgdqGQAZM=;
 b=WGdqkT6zOLzW3iT5FBSWi1+RByCSLPeU7HX3wlgbYBXOGc/JDHjxLMf7cwgeVT4EZS
 nG5kYLRgm1G0quECqwmjkgx6rGOhiB9UHVmr78ZuhWzY5gHaQpfLAgL/TnN9Fz6HkFTa
 xBoPJfYSRfFYOm3/K+IkCoou8iGGTRl9eXZCRggqF2Farrd+/nB+FelaIOkcAcZDmC2j
 kjmyTFwrWiaqY1H5pGRx6fHla9AZtFe2DAL2Paayc/zn3qwbzwxr28xasiUyknsnWl00
 Fw4wwCunKZdgl7tCjGVGWac4Gdr9WayZ0oZEcKk/ar/OE5eFphAIDCWKz9RS+jhVQ7Sv
 YXOw==
X-Gm-Message-State: AGi0PuZ7kSPoTy003kOh2k9InCR0I99pyWbwbFC+HE2sI6Hf3vmJybqf
 Dy2DxW0h7qZTREcBfB4Mmw==
X-Google-Smtp-Source: APiQypJpNb4ewDOcjTfOthSaYZtYSP9GLgvpWY9I43vl5aq8csUZu6D+yKwBUHo5BLkimepu0pqGvw==
X-Received: by 2002:a05:6808:24e:: with SMTP id
 m14mr24102696oie.116.1589336373601; 
 Tue, 12 May 2020 19:19:33 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id h24sm3910147otj.25.2020.05.12.19.19.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 May 2020 19:19:33 -0700 (PDT)
Received: (nullmailer pid 15333 invoked by uid 1000);
 Wed, 13 May 2020 02:19:32 -0000
Date: Tue, 12 May 2020 21:19:32 -0500
From: Rob Herring <robh@kernel.org>
To: Alain Volmat <alain.volmat@st.com>
Message-ID: <20200513021932.GA9172@bogus>
References: <1588657871-14747-1-git-send-email-alain.volmat@st.com>
 <1588657871-14747-4-git-send-email-alain.volmat@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1588657871-14747-4-git-send-email-alain.volmat@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, pierre-yves.mordret@st.com, wsa@kernel.org,
 linux-i2c@vger.kernel.org, mcoquelin.stm32@gmail.com, fabrice.gasnier@st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 3/4] dt-bindings: i2c-stm32: add SMBus
	Alert bindings
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

On Tue, May 05, 2020 at 07:51:10AM +0200, Alain Volmat wrote:
> Add a new binding of the i2c-stm32f7 driver to enable the handling
> of the SMBUS-Alert
> 
> Signed-off-by: Alain Volmat <alain.volmat@st.com>
> ---
>  Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml b/Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml
> index b50a2f420b36..04c0882c3661 100644
> --- a/Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml
> +++ b/Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml
> @@ -36,6 +36,10 @@ allOf:
>                  minItems: 3
>                  maxItems: 3
>  
> +        st,smbus-alert:
> +          description: Enable the SMBus Alert feature
> +          $ref: /schemas/types.yaml#/definitions/flag
> +

We already have smbus_alert interrupt. Can't you just check for this in 
the slave nodes and enable if found?

>    - if:
>        properties:
>          compatible:
> -- 
> 2.17.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
