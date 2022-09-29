Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 806C25EFF7E
	for <lists+linux-stm32@lfdr.de>; Thu, 29 Sep 2022 23:56:35 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 48406C64100;
	Thu, 29 Sep 2022 21:56:35 +0000 (UTC)
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com
 [209.85.160.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 429F7C640FE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Sep 2022 21:56:34 +0000 (UTC)
Received: by mail-oa1-f47.google.com with SMTP id
 586e51a60fabf-11e9a7135easo3423346fac.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Sep 2022 14:56:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=V9zVHpuWkh/i7x7TQRfGROzdebyc2nbt6mtcwCC/H2s=;
 b=XKtpRBiVCtMhNvccKz8O+lr/eEaa4u6ml7GfmzuRmOuODhP+AV8Zis5HYxkJz9KTAM
 YYwROAl+UGCZTfYZlZgZhVDh0g8c5k6t4qLFsBfbb6TRS3PdK8f++Fk31sCyYnVYFt+Z
 +KNcUXhIWdYV7bSO4lrOTZm1EfPVMx3h7HKyEdji1Aut+TMGAqXZzA4rVk5eRWFLEdQM
 ikst00l80QU5Ii1PAXSsl1R79NEIc7EWr33uNYcGcjpCpBBNXg0DkXhh/JX1F4dhh8CX
 rOj4exynY1UhOGvYXUYAplPTxM60kkweRI2oKJOVC0k/IS/HaQFgpFvg4qQhjxdl6/1S
 WR4g==
X-Gm-Message-State: ACrzQf0Qd20cp1LHovqEFqBmKYuPBTdw+9wo8F9/ndlKoHR3ihmq8qvE
 /imepEcHvTd+JZjR/Lpysg==
X-Google-Smtp-Source: AMsMyM4q8qqCa206penQyorIBTJoLeOZmP4X4ZijAKx++JcFwG/uTedysH1VCHoh4TMmaMzoMTADNw==
X-Received: by 2002:a05:6870:c391:b0:10c:a937:aaf1 with SMTP id
 g17-20020a056870c39100b0010ca937aaf1mr3062395oao.272.1664488593146; 
 Thu, 29 Sep 2022 14:56:33 -0700 (PDT)
Received: from macbook.herring.priv (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 o8-20020a056870524800b0013185365eb7sm235997oai.28.2022.09.29.14.56.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Sep 2022 14:56:32 -0700 (PDT)
Received: (nullmailer pid 2774818 invoked by uid 1000);
 Thu, 29 Sep 2022 21:56:32 -0000
Date: Thu, 29 Sep 2022 16:56:32 -0500
From: Rob Herring <robh@kernel.org>
To: Marek Vasut <marex@denx.de>
Message-ID: <166448859158.2774756.9828897136767131481.robh@kernel.org>
References: <20220926204735.381779-1-marex@denx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220926204735.381779-1-marex@denx.de>
Cc: devicetree@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>,
 linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: pinctrl: st,
 stm32: Document gpio-hog pattern property
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

On Mon, 26 Sep 2022 22:47:35 +0200, Marek Vasut wrote:
> Document gpio-hog pattern property and its subnodes.
> This fixes dtbs_check warnings when building current Linux DTs:
> 
> "
> arch/arm/boot/dts/stm32mp153c-dhcom-drc02.dtb: pinctrl@50002000: gpio@50003000: 'rs485-rx-en-hog' does not match any of the regexes: 'pinctrl-[0-9]+'
> "
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: linux-gpio@vger.kernel.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> To: linux-arm-kernel@lists.infradead.org
> ---
>  .../devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml       | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
