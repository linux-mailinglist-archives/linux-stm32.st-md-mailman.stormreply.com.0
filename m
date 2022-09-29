Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EA545EFF81
	for <lists+linux-stm32@lfdr.de>; Thu, 29 Sep 2022 23:56:51 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 578B1C64100;
	Thu, 29 Sep 2022 21:56:51 +0000 (UTC)
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com
 [209.85.160.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CF891C640FE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Sep 2022 21:56:50 +0000 (UTC)
Received: by mail-oa1-f54.google.com with SMTP id
 586e51a60fabf-131ea99262dso1124933fac.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Sep 2022 14:56:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=EJen2ttDhFxOc16LaWiBXDkrf31fuKODtOYbjKdt6ns=;
 b=EvTdLBtdFrJTPXdRwR4YaTDUYSKvYbHPDT93H1Wq1yvECtfCKGWbiui9x4136e0JTC
 pfzzX4rlz1URGxhpVsRTUpDVoPjl3/zg2E2g/iUnqDnPm92rzWRyrQd2dpOIiMbIapO5
 8Lx0W/mrLayPlWtlcGkWUv6tDVhFoKg5V3vTFqnVkXzVRdfO05K284HJcKzuHNQ6z4bR
 W4NMnuLk5cfXym7M5+wUvSJ6sWj6lRcAaEdpk/O1VHwfuIlp54iBOQbH4z76RyBwmDPL
 VGbfamedoWjhDgegZTBH5bm2dDd9xN2ew00vIKsE3NashwSy23DSsGVH6K6XlVgdIGyh
 LefQ==
X-Gm-Message-State: ACrzQf1ovxtUjNI6PtLeAehQ+WoL0WmD9edNyWxRDZaT47Z+i1WdsJbU
 7mkb2BEcLOgvVeXV+vxh/kn6qnoO4w==
X-Google-Smtp-Source: AMsMyM47C0YmzwZluUIw8W3m576jCvxFl3M9CN/HsBS7NJTg3YWg1qmkyc+v/BX9cx6f5EXgyQzgJQ==
X-Received: by 2002:a05:6870:b508:b0:12d:1c59:90d9 with SMTP id
 v8-20020a056870b50800b0012d1c5990d9mr9785566oap.199.1664488609670; 
 Thu, 29 Sep 2022 14:56:49 -0700 (PDT)
Received: from macbook.herring.priv (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 t7-20020a9d66c7000000b00636d0984f5asm205815otm.11.2022.09.29.14.56.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Sep 2022 14:56:49 -0700 (PDT)
Received: (nullmailer pid 2775235 invoked by uid 1000);
 Thu, 29 Sep 2022 21:56:48 -0000
Date: Thu, 29 Sep 2022 16:56:48 -0500
From: Rob Herring <robh@kernel.org>
To: Marek Vasut <marex@denx.de>
Message-ID: <166448860809.2775190.4452882592081127280.robh@kernel.org>
References: <20220926204752.381798-1-marex@denx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220926204752.381798-1-marex@denx.de>
Cc: devicetree@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>,
 linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: pinctrl: st,
 stm32: Document interrupt-controller property
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

On Mon, 26 Sep 2022 22:47:52 +0200, Marek Vasut wrote:
> Document interrupt-controller property and its interrupt-cells.
> This fixes dtbs_check warnings when building current Linux DTs:
> 
> "
> arch/arm/boot/dts/stm32mp153c-dhcom-drc02.dtb: pinctrl@50002000: gpio@5000a000: '#interrupt-cells', 'interrupt-controller' do not match any of the regexes: 'pinctrl-[0-9]+'
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
>  .../devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml          | 3 +++
>  1 file changed, 3 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
