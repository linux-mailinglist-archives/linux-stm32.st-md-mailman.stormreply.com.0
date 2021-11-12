Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 60C1044E0B6
	for <lists+linux-stm32@lfdr.de>; Fri, 12 Nov 2021 04:14:49 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 178FFC5EC71;
	Fri, 12 Nov 2021 03:14:49 +0000 (UTC)
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com
 [209.85.210.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 55022C5660B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Nov 2021 03:14:47 +0000 (UTC)
Received: by mail-ot1-f41.google.com with SMTP id
 h12-20020a056830034c00b0055c8458126fso11985168ote.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Nov 2021 19:14:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=FhkP3DqyQXh5RMUcdf21YAJZtHtRc6ehAtBhoS54R60=;
 b=rC7H1Cq/UwVTVFr9oBDpvB1UiugYImqdP20pdQg/L+7rANgfKhZKwZX8j3qsCGK+bt
 J5KUNGN+8x3Tp+n5XPcUmnivW/WTEMAbk4jIi/QGy0br0X08J4RlSPIzoYHYC71Who4g
 eJRDQT4UBv/p/79zOraplCaLdux82NMyf3X9H8Of6EVJXkGQAKE2+RDEtdir8Pf9q3LY
 r2o6ulMOwawXnLSeHBMbskmHcIEokbNo2e5EMntrYCfmiCAAHQaz57pud7aNQzsuTG2o
 oSoBNNXgxnRt/9Dwfy4kE5JWctkM1kmrRpKdefjpEmS+FqbBTqVEbqgmRsFUQdEUWmWv
 1p4A==
X-Gm-Message-State: AOAM530YdtlKXRCZSG6pPShSSg+cs7wdkzfB0z33L+yyQcziiXDKt9En
 gWgWlqZTm4unmt4Xh3cJpA==
X-Google-Smtp-Source: ABdhPJxnY5O0cEKzuWXi7lcuRysab5RQjF26ANiZ53Y0PdC4u9Y+5lzakJ/OFSJKr8zDNBVstn+TbA==
X-Received: by 2002:a05:6830:1da:: with SMTP id
 r26mr9840805ota.73.1636686886205; 
 Thu, 11 Nov 2021 19:14:46 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id o26sm993950otj.14.2021.11.11.19.14.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Nov 2021 19:14:45 -0800 (PST)
Received: (nullmailer pid 621132 invoked by uid 1000);
 Fri, 12 Nov 2021 03:14:44 -0000
From: Rob Herring <robh@kernel.org>
To: Jagan Teki <jagan@amarulasolutions.com>
In-Reply-To: <20211111154557.852637-2-jagan@amarulasolutions.com>
References: <20211111154557.852637-1-jagan@amarulasolutions.com>
 <20211111154557.852637-2-jagan@amarulasolutions.com>
Date: Thu, 11 Nov 2021 21:14:44 -0600
Message-Id: <1636686884.626655.621131.nullmailer@robh.at.kernel.org>
Cc: devicetree@vger.kernel.org, Matteo Lisi <matteo.lisi@engicam.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-amarula@amarulasolutions.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 2/3] dt-bindings: arm: stm32: Add Engicam
	i.Core STM32MP1 C.TOUCH 2.0 10.1" OF
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On Thu, 11 Nov 2021 21:15:56 +0530, Jagan Teki wrote:
> i.Core STM32MP1 is an EDIMM SoM based on STM32MP157A from Engicam.
> 
> C.TOUCH 2.0 is a general purpose carrier board with capacitive
> touch interface support.
> 
> 10.1" OF is a capacitive touch 10.1" Open Frame panel solutions.
> 
> i.Core STM32MP1 needs to mount on top of C.TOUCH 2.0 carrier with
> pluged 10.1" OF for creating complete i.Core STM32MP1 C.TOUCH 2.0
> 10.1" Open Frame board.
> 
> Add bindings for it.
> 
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
>  Documentation/devicetree/bindings/arm/stm32/stm32.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/arm/stm32/stm32.yaml:76:111: [warning] line too long (116 > 110 characters) (line-length)

dtschema/dtc warnings/errors:

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1553999

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
