Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F5AC170430
	for <lists+linux-stm32@lfdr.de>; Wed, 26 Feb 2020 17:21:32 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 09009C36B0B;
	Wed, 26 Feb 2020 16:21:32 +0000 (UTC)
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
 [209.85.167.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 55543C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Feb 2020 16:21:30 +0000 (UTC)
Received: by mail-oi1-f196.google.com with SMTP id v19so9223oic.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Feb 2020 08:21:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=R8CgB5ofq/CEo+Bbd71eYLol0DUjIXGKdAp6HQA/9d8=;
 b=VE+cHYEjXTWJCwSctWVcZNdQZzigpPxS3fkeQxPUM/f9SjMolnnHFPqpxzQjGzsImd
 V9TICxFfzONw7REYs4VQWKnphzmVEtLy/EFhz3ukDYBLf3AB58ncj+Q9DPT//YjiOt49
 GGkeBtqTqzaaJG8/CCk6lGNY2mIG7rccclB5ggFGsEXsiunrRkCuiJCurgbdamT19dIo
 03z/NWLR6H773n4+lANd+Frec/+Ul1LNvAn6mKXaYZQz2AC825OOQdLAlPiLU1x9EfSv
 gyT4Nsm7EkHVWkNvv2VTGfy2pZWb5PUDwI8wS9b+8fl1P6+SDMxEETE6iYbdn2/3CPop
 rCCA==
X-Gm-Message-State: APjAAAW5s7Nz3aTe5cUzjnk2WILgPL03WpllP6B5/Zba+UxvvmFZcVkI
 rMQk3SBSQhmuF93+uXj8og==
X-Google-Smtp-Source: APXvYqx4y3t8f8l9YMHa0dnaCosRY7xiR2vi0DCieSBpahLqPG+tzB/Y2iH6dVgGLzxAw9q3lrEIRA==
X-Received: by 2002:aca:ab53:: with SMTP id u80mr3693789oie.94.1582734089012; 
 Wed, 26 Feb 2020 08:21:29 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id t20sm939037oij.19.2020.02.26.08.21.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Feb 2020 08:21:26 -0800 (PST)
Received: (nullmailer pid 13405 invoked by uid 1000);
 Wed, 26 Feb 2020 16:21:25 -0000
Date: Wed, 26 Feb 2020 10:21:25 -0600
From: Rob Herring <robh@kernel.org>
To: Benjamin Gaignard <benjamin.gaignard@st.com>
Message-ID: <20200226162125.GA13349@bogus>
References: <20200220162246.8334-1-benjamin.gaignard@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200220162246.8334-1-benjamin.gaignard@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: mark.rutland@arm.co, devicetree@vger.kernel.org, linus.walleij@linaro.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, robh+dt@kernel.org,
 lee.jones@linaro.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3] dt-bindings: mfd: Convert stmfx
 bindings to json-schema
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

On Thu, 20 Feb 2020 17:22:46 +0100, Benjamin Gaignard wrote:
> Convert stmfx bindings to json-schema
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
> ---
>  .../devicetree/bindings/mfd/st,stmfx.yaml          | 124 +++++++++++++++++++++
>  Documentation/devicetree/bindings/mfd/stmfx.txt    |  28 -----
>  .../devicetree/bindings/pinctrl/pinctrl-stmfx.txt  | 116 -------------------
>  3 files changed, 124 insertions(+), 144 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/mfd/st,stmfx.yaml
>  delete mode 100644 Documentation/devicetree/bindings/mfd/stmfx.txt
>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-stmfx.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
