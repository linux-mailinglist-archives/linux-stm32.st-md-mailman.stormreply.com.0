Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 936395FF1EC
	for <lists+linux-stm32@lfdr.de>; Fri, 14 Oct 2022 18:01:15 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 499C8C65040;
	Fri, 14 Oct 2022 16:01:15 +0000 (UTC)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com
 [209.85.160.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B25CEC6411E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Oct 2022 16:01:13 +0000 (UTC)
Received: by mail-qt1-f179.google.com with SMTP id bb5so3913378qtb.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Oct 2022 09:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CkC/MGqITsH4ItvGl9rSsBp9Fg2z5jG2MWsc8Iemckw=;
 b=Fr5ayiTWxddqFsx5wxbR4O7/MzrPceGCim5Bu0T3ZNdH+eeFpd+WW9DBm67SYsd7+4
 mmzc+e7wLneSvWfIVHZWqpE05QB9p7mTRtSZuieAIghZgoGUSYx9rCZNwdru2jltw57w
 Nby7nk1gjpE8AysVdtUOEa/qs+RkzVNLiPaSho4yb5EM8nchwkQ1R9G+i6V/hS28CgvG
 OEL5gNgAC4FOp2g5q6KxoYvJdkJt7nVsbdPffTS0ECrbYePn976vDxCQLh6siJXxeNdV
 TkuG9It2RIPs/biTcebqBC2RgsdMmQvfwHMexQ+dssKtDEgA13di+KqS03w95zY+m8wa
 SAHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CkC/MGqITsH4ItvGl9rSsBp9Fg2z5jG2MWsc8Iemckw=;
 b=y1jcBx8qZ7fd53WTPSt/ner8vUgpvQ9cPG5SY4vsYZGiTq/bFNxl4Jn46XBbQtJAMH
 i6AIL4ahNeYkEN8zEDPL40WPjpXlY9340IjB7YYP+synykXWOtx0wTSGC/hQLHwauh8i
 MzIRxC2dCHi5N6glhh47UZdjH9kfEX5r6PlWSSmxPfly5KiSxZf7FGBmlnztiBeb77OZ
 uPzvn78qB6k24jBvrzFbsuC9fwLVLMa6lNV5cQQv/MeeGyRbsMfU/1OYGJZUH3M1gQf/
 6skMm3+9u/jByos8CkHZ+byTSgKzC7ztuOIPJa+EhqK46LCeczpc8wJvpZ5pAb6kyemX
 vuoA==
X-Gm-Message-State: ACrzQf0Wj9iGeUryYziX9IV7oWyWy0v7n27Yxi1YWB2e2aRD4OTFOTIN
 8dFwOfk0x4osEFfyzbnF721xhw==
X-Google-Smtp-Source: AMsMyM7CLKUeBtX1XegI5DUhv6wTLsUYKd53nK0+892VZERVqDOsE6ABLVGZyQ0DrZ6RmVBxMvoc3Q==
X-Received: by 2002:ac8:5f51:0:b0:35d:1a4c:9eaa with SMTP id
 y17-20020ac85f51000000b0035d1a4c9eaamr4685049qta.198.1665763272437; 
 Fri, 14 Oct 2022 09:01:12 -0700 (PDT)
Received: from [192.168.48.77] ([172.58.235.135])
 by smtp.gmail.com with ESMTPSA id
 v17-20020a05620a441100b006ce813bb306sm3095238qkp.125.2022.10.14.09.01.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Oct 2022 09:01:11 -0700 (PDT)
Message-ID: <cc7289ac-b75a-62e3-4b58-fc018715c068@linaro.org>
Date: Fri, 14 Oct 2022 12:01:09 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
To: Marek Vasut <marex@denx.de>, linux-arm-kernel@lists.infradead.org
References: <20221013221242.218808-1-marex@denx.de>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221013221242.218808-1-marex@denx.de>
Cc: devicetree@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
 linux-mmc@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, Rob Herring <robh+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, Andy Gross <agross@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-msm@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [Linux-stm32] [PATCH v2 1/3] dt-bindings: mmc: arm,
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

On 13/10/2022 18:12, Marek Vasut wrote:
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
> V2: Add deprecated:false to interrupts: description
> ---
>  Documentation/devicetree/bindings/mmc/arm,pl18x.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/mmc/arm,pl18x.yaml b/Documentation/devicetree/bindings/mmc/arm,pl18x.yaml
> index 1e69a5a42439b..1c96da04f0e53 100644
> --- a/Documentation/devicetree/bindings/mmc/arm,pl18x.yaml
> +++ b/Documentation/devicetree/bindings/mmc/arm,pl18x.yaml
> @@ -95,7 +95,9 @@ properties:
>        PIO (polled I/O) interrupt and occurs when the FIFO needs to be
>        emptied as part of a bulk read from the card. Some variants have these
>        two interrupts wired into the same line (logic OR) and in that case
> -      only one interrupt may be provided.
> +      only one interrupt may be provided. The interrupt-names property is
> +      not used due to inconsistency of existing DTs regarding its content.
> +    deprecated: false

Why do you add deprecated false? All properties are not deprecated by
default. Did any other referenced schema make it deprecated?


Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
