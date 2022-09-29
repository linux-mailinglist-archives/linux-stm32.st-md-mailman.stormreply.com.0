Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B3C05EFF78
	for <lists+linux-stm32@lfdr.de>; Thu, 29 Sep 2022 23:56:10 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 13B7CC64100;
	Thu, 29 Sep 2022 21:56:10 +0000 (UTC)
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com
 [209.85.160.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EAE59C640FE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Sep 2022 21:56:07 +0000 (UTC)
Received: by mail-oa1-f44.google.com with SMTP id
 586e51a60fabf-131c8ccae75so3414398fac.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Sep 2022 14:56:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=19hB2F57JLOkRO/nhyuWYiaI9Vqsr0sGfzDh4ehMbO8=;
 b=AmQNYzYfEJKK49dYgKPGT080R5KNM/ReQqWZb6oA+Tzz6NwcjJNg5Vp/V8yyU280Ey
 g5UflFeDD9vcZY6TbZFWYHJBSNy+wakK5ZHl+uB6IUyH2WOH5BlwBR/bfjaPVHf2j2LI
 GeMaQ/meF9eKkUhdl8NqJyXEzIhNZQQvLPrYPXkdhqcXM4irUiVzLs0DcoYBcYCiQAsR
 gg4skUXB1cSj8xCK4vDzqGSobu2FBjtKhdVByZ74DbuTeOcPT8z6Uba2H+Ib/RjFQe7H
 NT84m/LrQfj8g+b4uvJI0jxfaTMKgzeWRSdJYBKs2ClbOc3TKUFefZYlnN7+98ki9POw
 o8wA==
X-Gm-Message-State: ACrzQf0CecsAG9UqYc4LAMWZq3jFmUFkvfC445VAec88kTDq9s26qi1V
 M9QUpinSBmfpEHAKED8VEQ==
X-Google-Smtp-Source: AMsMyM7SuENX6lvCfV9rT7jPEOtdkrnuOKkw71aF6ZkHNDFP7Knct9531nfyCqgbqHCydPAtM2cB3g==
X-Received: by 2002:a05:6870:2110:b0:12c:cfd2:8178 with SMTP id
 f16-20020a056870211000b0012ccfd28178mr10146404oae.123.1664488566767; 
 Thu, 29 Sep 2022 14:56:06 -0700 (PDT)
Received: from macbook.herring.priv (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 g5-20020a9d6485000000b0063711d42df5sm197998otl.30.2022.09.29.14.56.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Sep 2022 14:56:06 -0700 (PDT)
Received: (nullmailer pid 2774081 invoked by uid 1000);
 Thu, 29 Sep 2022 21:56:05 -0000
Date: Thu, 29 Sep 2022 16:56:05 -0500
From: Rob Herring <robh@kernel.org>
To: Marek Vasut <marex@denx.de>
Message-ID: <166448856463.2774018.6148210751198203104.robh@kernel.org>
References: <20220926204653.381722-1-marex@denx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220926204653.381722-1-marex@denx.de>
Cc: devicetree@vger.kernel.org, Wolfram Sang <wsa@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, linux-i2c@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: i2c: st,
 stm32-i2c: Document wakeup-source property
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

On Mon, 26 Sep 2022 22:46:53 +0200, Marek Vasut wrote:
> Document wakeup-source property. This fixes dtbs_check warnings
> when building current Linux DTs:
> 
> "
> arch/arm/boot/dts/stm32mp153c-dhcom-drc02.dtb: i2c@40015000: Unevaluated properties are not allowed ('wakeup-source' was unexpected)
> "
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Alain Volmat <alain.volmat@foss.st.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Wolfram Sang <wsa@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: linux-i2c@vger.kernel.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> To: linux-arm-kernel@lists.infradead.org
> ---
>  Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
