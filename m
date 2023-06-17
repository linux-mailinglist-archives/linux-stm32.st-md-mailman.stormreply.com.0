Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5311A733F5F
	for <lists+linux-stm32@lfdr.de>; Sat, 17 Jun 2023 10:04:13 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 085F4C6A61A;
	Sat, 17 Jun 2023 08:04:13 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7AC3EC6A60D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 17 Jun 2023 08:04:10 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-987accb4349so40111566b.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 17 Jun 2023 01:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686989050; x=1689581050;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JskatFucMmAeLdfnFCEkpDxKlTgR0k+Wi7MQ3LzyqlE=;
 b=olYtqBvXhj2eKwZADpIRHO8dazWhRSBP/tCJtpoDYyDDVmhEDF0TB+NvCPLMGD4WHV
 7nvMuE66b4sIY5fkHjfyVyDw/sUoN7iUcwOPjQLHXUeiB5abyGuMZE69eZ7NKiFZCiT1
 XPHSFGYUkCNherRbPgj83LB77/wHo0Gc8G151opIYyhPNBp8VpNM0ISAf/4NYk7rX6/o
 Q80TEGfTdXJU1J4Ez9wqFGMIBNI7uVT9N6SG8jCGL7zjG2HsHjR5BcI8havwN1vUSLJg
 abiAh1Cgosi89RPA+CAQAIlynRtS2tFYFMvq0ReWWtBbidr13hRBc7gLQyB26Vu73/fq
 x2sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686989050; x=1689581050;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JskatFucMmAeLdfnFCEkpDxKlTgR0k+Wi7MQ3LzyqlE=;
 b=MEWgyLAhhDP7PwqzeSEzYy2StmZ9hOdRAz2BTmrMv2cqY8034q+y0sWcxp29W1pzNZ
 0j7TgEXhv1pU72vCQ4WBEq3NbZabWFg0AOiNR+cQNyAslU0DeI2htqY4s3H/fRoe8Tau
 99vyD+ibfrJ0JzJ+8wFaDStHy4+Q6ltjHCBxTg+DRwtHQRwkC+nmJij5UdB8dDyv918A
 Iz2x3QI1R+EMgJqFkahUSLbjO0Mz+a/tq2TRtDBuTBlXegbumjJZRKJjJmCbQm3UlQs4
 BTSDf2vckQuCbW1MbFiHJ5u1FUJ5zKbijPCI3Alf/TLzXoIi4kGnj7F0Y3Z8+05HxVZs
 GBxw==
X-Gm-Message-State: AC+VfDzrkcFMNhttjw4Qc4yBOX6za+3NpT95n8wxVuq5OfNUwOOSTBDl
 3oW3haHftIWnO2W1b1r1PWC2LA==
X-Google-Smtp-Source: ACHHUZ7kZqKBEMLNLGBMJ8yGHStlrG8Dg/LXVr7TO3CkwsYIX8auZF1/tEu6GqnbYv+WO0MdC2nQ6A==
X-Received: by 2002:a17:907:3188:b0:966:5a6c:752d with SMTP id
 xe8-20020a170907318800b009665a6c752dmr4045542ejb.20.1686989050183; 
 Sat, 17 Jun 2023 01:04:10 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
 by smtp.gmail.com with ESMTPSA id
 z8-20020a17090655c800b009828bc469a4sm3813170ejp.103.2023.06.17.01.04.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 17 Jun 2023 01:04:09 -0700 (PDT)
Message-ID: <fd07ea29-0b9d-4955-0f1b-2879c8b3442f@linaro.org>
Date: Sat, 17 Jun 2023 10:04:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
To: Yann Gautier <yann.gautier@foss.st.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-mmc@vger.kernel.org, devicetree@vger.kernel.org
References: <20230615092001.1213132-1-yann.gautier@foss.st.com>
 <20230615092001.1213132-2-yann.gautier@foss.st.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230615092001.1213132-2-yann.gautier@foss.st.com>
Cc: Marek Vasut <marex@denx.de>, Conor Dooley <conor+dt@kernel.org>,
 Xiang wangx <wangxiang@cdjrlc.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, Russell King <linux@armlinux.org.uk>,
 linux-kernel@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>,
 Yang Yingliang <yangyingliang@huawei.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/6] dt-bindings: mmc: mmci: Add st,
 stm32mp25-sdmmc2 compatible
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

On 15/06/2023 11:19, Yann Gautier wrote:
> For STM32MP25, we'll need to distinguish how is managed the delay block.
> This is done through a new comptible dedicated for this SoC, as the
> delay block registers are located in SYSCFG peripheral.
> 
> Signed-off-by: Yann Gautier <yann.gautier@foss.st.com>
> ---
>  Documentation/devicetree/bindings/mmc/arm,pl18x.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mmc/arm,pl18x.yaml b/Documentation/devicetree/bindings/mmc/arm,pl18x.yaml
> index 1c96da04f0e53..e47b3418b6c77 100644
> --- a/Documentation/devicetree/bindings/mmc/arm,pl18x.yaml
> +++ b/Documentation/devicetree/bindings/mmc/arm,pl18x.yaml
> @@ -59,6 +59,12 @@ properties:
>            - const: st,stm32-sdmmc2
>            - const: arm,pl18x
>            - const: arm,primecell
> +      - description: Entry for STMicroelectronics variant of PL18x for
> +          STM32MP25. This dedicated compatible is used by bootloaders.
> +        items:
> +          - const: st,stm32mp25-sdmmc2

Except what's said, this looks like can be part of previous entry via enum.

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
