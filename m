Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 904F85F0042
	for <lists+linux-stm32@lfdr.de>; Fri, 30 Sep 2022 00:31:15 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 50478C64100;
	Thu, 29 Sep 2022 22:31:15 +0000 (UTC)
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com
 [209.85.160.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E60E8C63324
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Sep 2022 22:31:13 +0000 (UTC)
Received: by mail-oa1-f54.google.com with SMTP id
 586e51a60fabf-131dda37dddso2521262fac.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Sep 2022 15:31:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=+ppqKUZekTxVrZE6//gc6FmK7Y2dgigVSPtRGAj8nKU=;
 b=jVfT/7q7ExTJBJ0f3AZA/indrtlDvapWEJDj9j5mMxP51Aie17YjorMMWanC7Gkb7F
 R7ymqefBqbZddSiGIFF87MZ/sadKeepky/VeBHz7c1zyNyCJg8ZmDbwNt4zjgzCB9f92
 qwLeM2dd9LNd9MTnvnr/CU/vU0OxBmu/Zc7sMHVrAzDf5nSmZ+Ke5DvSs9EN5g2g3lWt
 vqoobMRaiJvf7yjpTZ7RDpEA7zTjGlsBRSYnHa+Sxz6CdbYsz+ZDCjwH1FunDlC9kiZI
 X69tXBEYxRxNZuQgGc6Vs7RaxICIHC4pfExBLMbHvsLgJqiFB3HV+70ieK7f3gJrxrwS
 9IuA==
X-Gm-Message-State: ACrzQf0q9fdftyLlSsVVXyn6yeX5P6viaMKvSnlnQ7IPjguM/Z17LRyw
 6nvZtaqOAQ41xWEot0lZtA==
X-Google-Smtp-Source: AMsMyM6VPQStiQxDY3pOVC8hYCgC8vnsmw1bwW+gJ4KDrpxt0NpOa9gHUrAo8NDlWtbXSD65Hd6G9A==
X-Received: by 2002:a05:6870:55a4:b0:130:c298:46e5 with SMTP id
 n36-20020a05687055a400b00130c29846e5mr9872616oao.216.1664490672775; 
 Thu, 29 Sep 2022 15:31:12 -0700 (PDT)
Received: from macbook.herring.priv (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 u36-20020a056870702400b0013125e6a60fsm229085oae.58.2022.09.29.15.31.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Sep 2022 15:31:12 -0700 (PDT)
Received: (nullmailer pid 2882012 invoked by uid 1000);
 Thu, 29 Sep 2022 22:31:11 -0000
Date: Thu, 29 Sep 2022 17:31:11 -0500
From: Rob Herring <robh@kernel.org>
To: Marek Vasut <marex@denx.de>
Message-ID: <20220929223111.GA2880118-robh@kernel.org>
References: <20220927191736.299702-1-marex@denx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220927191736.299702-1-marex@denx.de>
Cc: devicetree@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
 linux-mmc@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 linux-stm32@st-md-mailman.stormreply.com, Andy Gross <agross@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-msm@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/3] dt-bindings: mmc: arm,
 pl18x: Document interrupt-names is ignored
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

On Tue, Sep 27, 2022 at 09:17:34PM +0200, Marek Vasut wrote:
> Due to inconsistency of existing DTs regarding the content of this IP
> interrupt-names DT property, document this such that interrupt-names
> is not used by this IP bindings.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Andy Gross <agross@kernel.org>
> Cc: Bjorn Andersson <andersson@kernel.org>
> Cc: Konrad Dybcio <konrad.dybcio@somainline.org>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Ulf Hansson <ulf.hansson@linaro.org>
> Cc: Yann Gautier <yann.gautier@foss.st.com>
> Cc: devicetree@vger.kernel.org
> Cc: linux-mmc@vger.kernel.org
> Cc: linux-arm-msm@vger.kernel.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> To: linux-arm-kernel@lists.infradead.org
> ---
>  Documentation/devicetree/bindings/mmc/arm,pl18x.yaml | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/mmc/arm,pl18x.yaml b/Documentation/devicetree/bindings/mmc/arm,pl18x.yaml
> index 1e69a5a42439b..a0ddf6495f85e 100644
> --- a/Documentation/devicetree/bindings/mmc/arm,pl18x.yaml
> +++ b/Documentation/devicetree/bindings/mmc/arm,pl18x.yaml
> @@ -95,7 +95,8 @@ properties:
>        PIO (polled I/O) interrupt and occurs when the FIFO needs to be
>        emptied as part of a bulk read from the card. Some variants have these
>        two interrupts wired into the same line (logic OR) and in that case
> -      only one interrupt may be provided.
> +      only one interrupt may be provided. The interrupt-names property is
> +      not used due to inconsistency of existing DTs regarding its content.
>      minItems: 1
>      maxItems: 2

       deprecated: false


>  
> -- 
> 2.35.1
> 
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
