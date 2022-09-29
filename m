Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 716025EFF7B
	for <lists+linux-stm32@lfdr.de>; Thu, 29 Sep 2022 23:56:20 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 36E6FC64100;
	Thu, 29 Sep 2022 21:56:20 +0000 (UTC)
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com
 [209.85.167.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C5E55C640FE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Sep 2022 21:56:17 +0000 (UTC)
Received: by mail-oi1-f175.google.com with SMTP id d64so2967358oia.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Sep 2022 14:56:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=D8Kzu6/oUlXFxvg+6E7aKSySK9Mlh0ChMnK2mROPKCE=;
 b=W7QGE1PKKK2402mho+GP1MmIXK29qJ2yf750qlKBz/OVt8qO0J8R9R1Uo1SapBPnBZ
 xEDIrovOeIFXFn617Sqsc6AsImE5WVELghUjO2a5ik/kypSJDxpzK9wE2sdiFQq1tck7
 zMogsTnFGs7egexqkd8vsSMuRNNS8vWJ8jXiiDl1zJl3ePF2KmdpXpRnyCItsgHW9lV9
 pWkkWu5neoHG4MGQvc/8wLXiUl47iX8AXzclW7MAdGE5gkmQGKm7bhLl+yt+vWhiYnKh
 ZP0t382JCepe/PkD33o2ZV48Cj+Eo++d9BN/nOBEYD2R1tiLHktqiynC4WuuMpGn6L1P
 EiuA==
X-Gm-Message-State: ACrzQf14yddHCYuX8Yqv2Ag6ylMfPubq0bm4ZTx561yv3JaU57cYk7Hi
 +qifEybDvrDTseL54BkjYA==
X-Google-Smtp-Source: AMsMyM6vkT/2Iy7WkSiRvFEP9tOdvyNHCt/e98BoJAO+18wdaCWPiS6KSTW4OzCKS/X9LylcQX5ajA==
X-Received: by 2002:a05:6808:3012:b0:351:3f4:d060 with SMTP id
 ay18-20020a056808301200b0035103f4d060mr8127189oib.241.1664488576681; 
 Thu, 29 Sep 2022 14:56:16 -0700 (PDT)
Received: from macbook.herring.priv (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 r63-20020acaf342000000b00342d18cc2fdsm112068oih.53.2022.09.29.14.56.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Sep 2022 14:56:16 -0700 (PDT)
Received: (nullmailer pid 2774408 invoked by uid 1000);
 Thu, 29 Sep 2022 21:56:15 -0000
Date: Thu, 29 Sep 2022 16:56:15 -0500
From: Rob Herring <robh@kernel.org>
To: Marek Vasut <marex@denx.de>
Message-ID: <166448857513.2774347.13258639802949517982.robh@kernel.org>
References: <20220926204724.381760-1-marex@denx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220926204724.381760-1-marex@denx.de>
Cc: devicetree@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>,
 linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: pinctrl: st,
	stm32: Document gpio-line-names
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

On Mon, 26 Sep 2022 22:47:24 +0200, Marek Vasut wrote:
> Document gpio-line-names property as valid property.
> This fixes dtbs_check warnings when building current Linux DTs:
> 
> "
> arch/arm/boot/dts/stm32mp153c-dhcom-drc02.dtb: pinctrl@50002000: gpio@50009000: 'gpio-line-names' does not match any of the regexes: 'pinctrl-[0-9]+'
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
>  Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
