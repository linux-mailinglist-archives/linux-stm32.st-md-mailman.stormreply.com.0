Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7245F4C416C
	for <lists+linux-stm32@lfdr.de>; Fri, 25 Feb 2022 10:28:25 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0F6EAC60491;
	Fri, 25 Feb 2022 09:28:25 +0000 (UTC)
Received: from smtp-relay-internal-1.canonical.com
 (smtp-relay-internal-1.canonical.com [185.125.188.123])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8B90DC57B6C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 25 Feb 2022 09:28:24 +0000 (UTC)
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 83FC53F1D9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 25 Feb 2022 09:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1645781302;
 bh=kGwkKU8L/fn7aVH4SNRnVpay291DKpyh1Xqm8qPEDW0=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=X7Eg2X55/6TfKmAePi5LbGiJOvzXiB2eyV8u4Pd228JsAQywYyzW3rdkrg7weCAnc
 TmCEUljOpWfeX3foDevNn+ztUCK0cM6cYSxjK4XZRxWuKxcV3c4TdkK1wU6K9hLHdN
 sEr2G2L4T9CaAyvT3fu/eDt+Je0breL1Sp+BB7UlbwsnDxm09QIQK8W8Ip9O/Pv7mR
 +eHXWqFLSOA6hFVTm/URHGAx0S5pGSQx7IBLhf/mtfv6Cvn0g9isA4ygzLXpqfr0t+
 DeJ63obxsHG0yurkvp8Fi3g2gqKnFEw5S+p8b3YH4iTdR/JtcRavoyYUJ4Po0nRD0P
 wDuVAl1bgpEkA==
Received: by mail-ej1-f70.google.com with SMTP id
 qf24-20020a1709077f1800b006ce8c140d3dso2384927ejc.18
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 25 Feb 2022 01:28:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=kGwkKU8L/fn7aVH4SNRnVpay291DKpyh1Xqm8qPEDW0=;
 b=Xpu8aOFazH5YNeXwmMkTLr8vMY6+V4tYxSVkuY7eDPN9djidWXtNpac+2BG2xJHbvg
 MzTIuS/KFTpHGyNe/Z9ojh+A6muQ61xna7K0Z2FM8CEzNzvNC1hnOj3q4rsb+o1ZLNC4
 9H2FwmwYMTT50tTLQv9xX0er5C1IQmMH5dVF9SUI8EqtItapbcv9ASlqsP5zlj+nmxyj
 FeTWJrckC/uM+UXxab6wPKALEwKQ0zXMqc/W6R2dQGpVzkmoW0M0PAzJxvL/Sq7URtaX
 G5UwVpaVcquTbc1BKo74EMTU/bqagCu/T4dvTq9ZJhqcZX/ibgj2RHlf4T7klox2THY7
 1ucg==
X-Gm-Message-State: AOAM530wYuUq4ccyJEX5oG4X9PYkda2sNbY4Xq2QUz3CKpWd14HI8BGX
 rDBkGZ48QHIz2taPSpTB91JrhJNCnAWFGfsAt8Os1Zr9abeLXfM9ghAM/SWi2P4VyS7GWwODTls
 3lGnThNglwp8e94h9D0ddcFdDr8mWbQ2BGDHjKWLmu3kFrIKG9ARylpUGPA==
X-Received: by 2002:a17:906:4d51:b0:6b8:78e0:565a with SMTP id
 b17-20020a1709064d5100b006b878e0565amr5351327ejv.587.1645781302266; 
 Fri, 25 Feb 2022 01:28:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz8c3ZhY7jr+/X0AvJodZEzeopQeOKXYiLB34QdycL3m21MYR4q1dg62gQBFvoYHXY7gyalew==
X-Received: by 2002:a17:906:4d51:b0:6b8:78e0:565a with SMTP id
 b17-20020a1709064d5100b006b878e0565amr5351308ejv.587.1645781302107; 
 Fri, 25 Feb 2022 01:28:22 -0800 (PST)
Received: from [192.168.0.130] (xdsl-188-155-181-108.adslplus.ch.
 [188.155.181.108]) by smtp.gmail.com with ESMTPSA id
 d8-20020a170906304800b006cdf8a1e146sm770803ejd.217.2022.02.25.01.28.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Feb 2022 01:28:21 -0800 (PST)
Message-ID: <f77b2f7d-9a22-3e1f-a5f4-90766bdc232f@canonical.com>
Date: Fri, 25 Feb 2022 10:28:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: gabriel.fernandez@foss.st.com, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Philipp Zabel <p.zabel@pengutronix.de>
References: <20220224160141.455881-1-gabriel.fernandez@foss.st.com>
 <20220224160141.455881-2-gabriel.fernandez@foss.st.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220224160141.455881-2-gabriel.fernandez@foss.st.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH 01/13] dt-bindings: rcc: stm32: add new
 compatible for STM32MP13 SoC
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

On 24/02/2022 17:01, gabriel.fernandez@foss.st.com wrote:
> From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> 
> New compatible to manage clock and reset of STM32MP13 SoC.
> 
> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> ---
>  .../bindings/clock/st,stm32mp1-rcc.yaml       |   2 +
>  include/dt-bindings/clock/stm32mp13-clks.h    | 229 ++++++++++++++++++
>  include/dt-bindings/reset/stm32mp13-resets.h  | 100 ++++++++
>  3 files changed, 331 insertions(+)
>  create mode 100644 include/dt-bindings/clock/stm32mp13-clks.h
>  create mode 100644 include/dt-bindings/reset/stm32mp13-resets.h
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
