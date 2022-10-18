Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D47126020A7
	for <lists+linux-stm32@lfdr.de>; Tue, 18 Oct 2022 03:56:26 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 892A2C64104;
	Tue, 18 Oct 2022 01:56:26 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com
 [209.85.222.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 39630C640F5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Oct 2022 01:56:25 +0000 (UTC)
Received: by mail-qk1-f180.google.com with SMTP id m6so7861328qkm.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Oct 2022 18:56:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cwnKiJHjgGODb7JZ57x/PI3J93dO3KCDNTmDBrZdsDc=;
 b=xflSfO3croZNnEFDdG7BOLArdMlmy+EU22He2ItcgDKF+cPzrW4GyqHfDn+EHI9zAN
 FtdDBSXhjYQV8JJmZVlWlPrOYWCBFm2F35En38JSnLi4GEB8FR+HJsn5CH/fJSe8tLiZ
 rZPdTlOaunKSdBCHtJ/Wh3FxNLQn/RGKWEW5siTVp7xYRUpfj53c/RPUrc+YwaZYUf3P
 ZBvApA9Gxu9brukx62hgnNia1ucmgNCdB4WTZzZh3dfaZAmEqgorXE3an33GUpbFl8Rj
 ePveOh+GWzORHhtyXYCDVUFTvM/kI6mFSBttrncVbBGF8Jpv72/iuyjSg8RV+tstvJvV
 lFHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cwnKiJHjgGODb7JZ57x/PI3J93dO3KCDNTmDBrZdsDc=;
 b=UqQyoW4T+G+FvandEqHf3tgwcpxe2OIXpdpssSuTSljzRBbPQ4VhHmivsosP4/GeC0
 dSj8nr6R262Q72HAr+/tTpkFhC/GDAu2TGGG/bwsIN6S3OxV+1VT+YZKPYRcx1ACZqqr
 UeQCiqZAXLSA7v18GhmUNnfdmsR4DyYR/uxz9OanOtAM+SJ+5vhq84MwjqyLUMSFD8LL
 gHXATgkkMwWclxDn4ctHeIlZW/vlRonGSXzGTqYnHSaDzmqCBL0YZgrg6/qSivcuylV4
 l1AwbJBmYl1FjfsgYTVaYphcDK41LCUFl2dVpYWySVSFtYBLU+viwEdzX79weBXoAbrh
 4T3g==
X-Gm-Message-State: ACrzQf1fAQpCVwStHcWFpsZxdt+E6BxQ8KZpRM1QFFaXcX3tbidtSXPz
 GersunSSUUDhcd55U6nQkLrphQ==
X-Google-Smtp-Source: AMsMyM5ocMIfY0aC8/+qBtf+hP1sxMYMg/Y2wsOOlblki8BnnPjo0vYAfLgMcatAAS2jP/FXcwSJYA==
X-Received: by 2002:a05:620a:1982:b0:6ee:c63f:f983 with SMTP id
 bm2-20020a05620a198200b006eec63ff983mr373977qkb.382.1666058184215; 
 Mon, 17 Oct 2022 18:56:24 -0700 (PDT)
Received: from [192.168.10.124] (pool-72-83-177-149.washdc.east.verizon.net.
 [72.83.177.149]) by smtp.gmail.com with ESMTPSA id
 s15-20020a05622a178f00b0035d432f5ba3sm1053661qtk.17.2022.10.17.18.56.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Oct 2022 18:56:23 -0700 (PDT)
Message-ID: <7ada410d-8d13-b29a-869c-3f5d032528bf@linaro.org>
Date: Mon, 17 Oct 2022 21:56:21 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>
References: <20221014172324.1.Ifc1812116ff63f5501f3edd155d3cf5c0ecc846c@changeid>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221014172324.1.Ifc1812116ff63f5501f3edd155d3cf5c0ecc846c@changeid>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: nvmem: add new stm32mp13
 compatible for stm32-romem
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

On 14/10/2022 11:23, Patrick Delaunay wrote:
> Add a new compatible for stm32mp13 support.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  Documentation/devicetree/bindings/nvmem/st,stm32-romem.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/nvmem/st,stm32-romem.yaml b/Documentation/devicetree/bindings/nvmem/st,stm32-romem.yaml
> index 448a2678dc62..16f4cad2fa55 100644
> --- a/Documentation/devicetree/bindings/nvmem/st,stm32-romem.yaml
> +++ b/Documentation/devicetree/bindings/nvmem/st,stm32-romem.yaml
> @@ -22,6 +22,7 @@ properties:
>    compatible:
>      enum:
>        - st,stm32f4-otp
> +      - st,stm32mp13-bsec
>        - st,stm32mp15-bsec

According to usage in DTS (separate patch for some reason), the devices
are compatible, so please describe them like that.

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
