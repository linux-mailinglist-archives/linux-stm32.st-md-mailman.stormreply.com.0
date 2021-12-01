Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 12A01465946
	for <lists+linux-stm32@lfdr.de>; Wed,  1 Dec 2021 23:31:44 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B053DC5A4F8;
	Wed,  1 Dec 2021 22:31:43 +0000 (UTC)
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com
 [209.85.210.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B09F0C597B6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  1 Dec 2021 22:31:42 +0000 (UTC)
Received: by mail-ot1-f43.google.com with SMTP id
 h19-20020a9d3e53000000b0056547b797b2so37367373otg.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 01 Dec 2021 14:31:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=T5dDFTbqoVtVfAAIqapjKcFefz1Su1Y3Jb3TmXDSfLM=;
 b=U/UiRO+T794v5Ozs1PKoK3IYks0nmPBhOF5Ctcp/uplWZGbieyHFgFmtuSUXmX/lVD
 MbLPfTy1RrrYS8I0FMIhv+oAlxlUrt6udV5dLUx/YYOBoxxAzS2aQWpOd1DzxXvGNdnr
 cuEonmx+xlHVAw72smD3geUatRb2UCuMsLQkX+FaAUQ1zte28iqiQ2uyJlz5UtWa7+Gn
 LjZ5MNcnUWzIXtu2K9CySxfivYv0kVXRt7YSuRcE+Ki5+Q9A1T2OKYxbhR46y96GJqVN
 O4Y4ryqRQhCAAeT5xjNB9wCMg4kf1ChFq6ng8McHpbfQLeooBChgA5LlEq4zTg36Fk9I
 RbmA==
X-Gm-Message-State: AOAM531ubHbr8neM+d1B4Vc0XJKPd3Y8wJ8QD35GTgOvZsE1Ko3TN0Uy
 b7WO811LDmNiuPByeng5ow==
X-Google-Smtp-Source: ABdhPJy8bnGR48W/xJpn01QnF07dEzkJUHFVw79LlhkqiRr6++P/Ysr9/PjH2SDv8XKQNdKBo6V6lg==
X-Received: by 2002:a05:6830:2aa7:: with SMTP id
 s39mr8424157otu.151.1638397901599; 
 Wed, 01 Dec 2021 14:31:41 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id bi20sm592910oib.29.2021.12.01.14.31.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Dec 2021 14:31:40 -0800 (PST)
Received: (nullmailer pid 2899335 invoked by uid 1000);
 Wed, 01 Dec 2021 22:31:39 -0000
Date: Wed, 1 Dec 2021 16:31:39 -0600
From: Rob Herring <robh@kernel.org>
To: Olivier Moysan <olivier.moysan@foss.st.com>
Message-ID: <Yaf3yy3tiTOaNBDY@robh.at.kernel.org>
References: <20211125144053.774-1-olivier.moysan@foss.st.com>
 <20211125144053.774-3-olivier.moysan@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211125144053.774-3-olivier.moysan@foss.st.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, alain.volmat@foss.st.com,
 arnaud.pouliquen@foss.st.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 2/4] ASoC: dt-bindings: stm32: i2s:
 allow additional properties.
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

On Thu, Nov 25, 2021 at 03:40:51PM +0100, Olivier Moysan wrote:
> The STM32 SPI peripheral supports both SPI and I2S protocols.
> In the SoC device tree the node describes the peripheral as an
> SPI peripheral by default. This default configuration can be
> overwritten in board device tree to use the IP as an I2S peripheral.
> In this case the address-cells and size-cells properties from
> SoC DT SPI node should not be checked against STM32 I2S bindings.
> Set additionalProperties to "true" to allow these extra properties.
> 
> Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
> ---
>  Documentation/devicetree/bindings/sound/st,stm32-i2s.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/st,stm32-i2s.yaml b/Documentation/devicetree/bindings/sound/st,stm32-i2s.yaml
> index 64b70ac539f8..33ba15363c0f 100644
> --- a/Documentation/devicetree/bindings/sound/st,stm32-i2s.yaml
> +++ b/Documentation/devicetree/bindings/sound/st,stm32-i2s.yaml
> @@ -73,7 +73,7 @@ required:
>    - dmas
>    - dma-names
>  
> -additionalProperties: false
> +additionalProperties: true

This is only allowed for schemas that are incomplete collections of 
properties such as common bindings.

Rob
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
