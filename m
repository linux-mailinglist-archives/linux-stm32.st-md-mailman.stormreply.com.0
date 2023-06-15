Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 227157319C4
	for <lists+linux-stm32@lfdr.de>; Thu, 15 Jun 2023 15:20:53 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CE675C65E58;
	Thu, 15 Jun 2023 13:20:52 +0000 (UTC)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com
 [209.85.128.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4912BC5E2C2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Jun 2023 13:20:51 +0000 (UTC)
Received: by mail-yw1-f171.google.com with SMTP id
 00721157ae682-5701810884aso15098807b3.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Jun 2023 06:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686835250; x=1689427250;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=aX97xCToWV5//RvNXLNZC2c3J5Dbjde6RJhRL1H+eSE=;
 b=Z7Vt+tJ6ZXAT2LMJTiuoQ4nJjIelvhefnByDBbvXpt8TZcUd8RDeuFg7udKdaqRbAV
 coYNEisPjOGrp1ArWfKkeAS3dltxJqa+Tx6R5v5/Qvp28sHYnb8CRmoeUU9KzGP78y2k
 n5lY8y00Gbrvp9tbOl++/Gzhg2y1yzHKXLW/2vYk9TuxbAzc2FKUoCcgukT2W32nvTGc
 jP5iNG7m4UeqYq5dp4oLbAUfWWoTh/lnVvssrjTWwhP8hBHxlgJSktu+kllPHlxZRPNM
 tczsTr+tYWs81+5oGtdledEpN+aCpaUeem933gLMQYq3B5vY7kICltVUUKcq22ZR9nB5
 jF6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686835250; x=1689427250;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aX97xCToWV5//RvNXLNZC2c3J5Dbjde6RJhRL1H+eSE=;
 b=jSVt94oenABpYPtgIIW1TaAGNwBnD0iE1On2BiRouyu5VQ5rlV4c6+kxYUpSFefggM
 XAjTPJmIU1CqceeN8Zmttxpc8GV+ZL7Ztr3KGBglx3BbNHPwYEK7GVHyTfbHlWV9PB7A
 4FPP7VSQ89kHeyXMVvOjbPpX5bDmVden1pwsYNaZy4fehVBXuDZOQ4P/eJH2ojHH7xWs
 YJSxRnN/v6MD/pr74Q8nQz/aA+YfUYtr4MOjk9DLy09QZx9WR1/pgXG48ZGKwX1sOLl4
 do/BBXPitzt4qYjk5WI5HCktFngnYWxrqsAWVbe3r4LDYLiyvKulAI1DJfzVFISqFNyF
 UNBw==
X-Gm-Message-State: AC+VfDyBvNmUcjZd9TDuWN91hTk6kALgcEy0o3bkCae2SbIw52UYahkm
 CgBw43SSiHNtbf73ZE+Kvey9jBm5Y4At40LAqurqeg==
X-Google-Smtp-Source: ACHHUZ7cc7qLuWFlmewZHndMeTGJ1lCp7+tWMjE+IKpjzV597WRvXEOfvUA5tnyK2rMjzUksHUpC1md88NP3KWhBAFU=
X-Received: by 2002:a81:a50d:0:b0:56d:278:fea0 with SMTP id
 u13-20020a81a50d000000b0056d0278fea0mr4849499ywg.7.1686835250160; Thu, 15 Jun
 2023 06:20:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230615092001.1213132-1-yann.gautier@foss.st.com>
 <20230615092001.1213132-2-yann.gautier@foss.st.com>
In-Reply-To: <20230615092001.1213132-2-yann.gautier@foss.st.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 15 Jun 2023 15:20:14 +0200
Message-ID: <CAPDyKFqJsqmNzeRg8hj55yUEMSycOWsmKVKsMWk4Qu7Y8_dNzg@mail.gmail.com>
To: Yann Gautier <yann.gautier@foss.st.com>
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Xiang wangx <wangxiang@cdjrlc.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Linus Walleij <linus.walleij@linaro.org>, linux-mmc@vger.kernel.org,
 Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Yang Yingliang <yangyingliang@huawei.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
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

On Thu, 15 Jun 2023 at 11:20, Yann Gautier <yann.gautier@foss.st.com> wrote:
>
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

What does this last sentence mean? Can we drop it?

> +        items:
> +          - const: st,stm32mp25-sdmmc2
> +          - const: arm,pl18x
> +          - const: arm,primecell
>
>    clocks:
>      description: One or two clocks, the "apb_pclk" and the "MCLK"
> --
> 2.25.1
>

Kind regards
Uffe
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
