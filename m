Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 78CE7665922
	for <lists+linux-stm32@lfdr.de>; Wed, 11 Jan 2023 11:38:12 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 268B3C65E59;
	Wed, 11 Jan 2023 10:38:12 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 11733C03FC3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 Jan 2023 10:38:09 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 k26-20020a05600c1c9a00b003d972646a7dso14000896wms.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 Jan 2023 02:38:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=jL8bdyRPY1NcExtbiegzjvNk1MnzQ71tWSU8fsf/VCg=;
 b=TMZ2c4LfuAn0iG1uB0odaHKYEIjH1TrkA59vsulAFrdwZlEPgcUg8WgUwJ+/r6EAEE
 7W0UNZ9UsGzLFRl/YFFmdaua4sub9Hv/UV1qcIpjUn4Y+7O04y+jM5Lg1RO8VCxLwLOn
 nD2XMr/LHL4TdMSbi4LME8nu7G3EqyxAgZEJx0hY/dsQ66QXsX6SkV19O10vslB5tK/a
 RLNwfjFfjYeeKj/rFOuln6dbYjkNWlBEXcDuCwEhK4dQbmCmYyoi6Hfm6YYfqWCKekSt
 JMEH/hRxCRgE0SXiN4q56yrGczFGzJ54dqF5uyb087kLZvjghmL2k8+rDxES8UWLTRF+
 V5kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jL8bdyRPY1NcExtbiegzjvNk1MnzQ71tWSU8fsf/VCg=;
 b=pg0ZFa/TUuZhk7ioCBcEKnkm2glTmvpfmq58grcC5jucHnmJsT/wFxaFPxMPUqirNS
 4kQH5gUXt6ZmeCsUDF78bhUtB1o1/idIjghm+l1EE0i+G6qh9jPvtvu8EjQ8lPZ4U1w2
 pZRs/r7jsV7fZgJsHyiDxaL9tPnX4ichWJmxWTwWKE4Ess6LIIeWtWycpEyIS1hENeVk
 yr8H5iqzIsHJblQrfQYhtVGkVeBJ5t1S0kLGCjhYCpJ3JHVG6D+hEcBhzrmvvIcABPHQ
 fAQafyaveyxBAhWJL8yQH+F3KDsYVAXcxzyMj7xTSXVDcUHAvLapfR1XRLt1QdzefKN4
 62jg==
X-Gm-Message-State: AFqh2kr3iy+xnRTokDe36VjmiUPfPwITCI3/oEu18aJuGWHi2hzHuGuM
 SudQ780OuZjMaDdYaM2vphkuPA==
X-Google-Smtp-Source: AMrXdXtMBZkDg5eU72KkLHfQX3lI/6XIjTLZFPJqac2B2TGmn77JlJmeUvXko1SMKMq8Pu25TunGIA==
X-Received: by 2002:a05:600c:ac8:b0:3d7:7cea:b410 with SMTP id
 c8-20020a05600c0ac800b003d77ceab410mr51917041wmr.33.1673433489574; 
 Wed, 11 Jan 2023 02:38:09 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 p9-20020a05600c358900b003cffd3c3d6csm19644020wmq.12.2023.01.11.02.38.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Jan 2023 02:38:09 -0800 (PST)
Message-ID: <98d2af06-8ef3-bb6b-1f29-4e33c1c748d6@linaro.org>
Date: Wed, 11 Jan 2023 11:38:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
To: Amelie Delaunay <amelie.delaunay@foss.st.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Fabien Dessenne <fabien.dessenne@foss.st.com>
References: <20230111100725.463136-1-amelie.delaunay@foss.st.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230111100725.463136-1-amelie.delaunay@foss.st.com>
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: Fix User button on
	stm32mp135f-dk
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

On 11/01/2023 11:07, Amelie Delaunay wrote:
> This patch fixes the following dtbs_check warning on stm32mp135f-dk:
> arch/arm/boot/dts/stm32mp135f-dk.dtb: gpio-keys: 'user-pa13' does not match any of the regexes: '^(button|event|key|switch|(button|event|key|switch)-[a-z0-9-]+|[a-z0-9-]+-(button|event|key|switch))$', 'pinctrl-[0-9]+'
> From schema: Documentation/devicetree/bindings/input/gpio-keys.yaml
> 
> It renames user-pa13 node into button-user so that it matches gpio-keys
> bindings.
> 
> Fixes: 57012d79fefd ("ARM: dts: stm32: add UserPA13 button on stm32mp135f-dk")
> 

No blank lines between the tags, but I would drop the Fixes anyway. This
is not a bug, but convention and coding style.

> Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
> ---
>  arch/arm/boot/dts/stm32mp135f-dk.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/stm32mp135f-dk.dts b/arch/arm/boot/dts/stm32mp135f-dk.dts
> index 9ff5a3eaf55b..931877d6ddb9 100644
> --- a/arch/arm/boot/dts/stm32mp135f-dk.dts
> +++ b/arch/arm/boot/dts/stm32mp135f-dk.dts
> @@ -40,7 +40,7 @@ optee@dd000000 {
>  	gpio-keys {
>  		compatible = "gpio-keys";
>  
> -		user-pa13 {
> +		button-user {

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
