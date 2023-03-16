Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 35E226BC826
	for <lists+linux-stm32@lfdr.de>; Thu, 16 Mar 2023 09:04:37 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E43EFC6904F;
	Thu, 16 Mar 2023 08:04:36 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C260AC65043
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Mar 2023 08:04:35 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id r11so4168724edd.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Mar 2023 01:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678953875;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LYB052YukoVdHW+qtRSlTHvZr0e0YBjYSQAsxVr9fBE=;
 b=z1vfVSpJ6do8mfJMS+4lrkAz3tA2qhe1UIpap1YHopgEFIxrup8SNosmJSJDEI7tNs
 wFfDO3mGj4g4HmkuKDvl+My2rfs1R47oG59emGK26zJYJpe3oJ5QbK5L7a0KH0nNmbkT
 5YfqUKui3cWOkZ4qZezj/q79D5jEXBrhLrFCnrt3zLtNQ3xqzh+HfIHxUbddMvXGxFjd
 FkdLktkcLu8CLObIpI/8tGUr9zHgXExrsjGOFWNpw5KWk6jVwcvGqEkd+JHjJmbLIlUH
 +tjotKe1/1nMvqrnhgs9hLoBSygJ3nzEyE0MElFR8n+tfOgWu6mHzsqjJOAKbUl/adFb
 KaTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678953875;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LYB052YukoVdHW+qtRSlTHvZr0e0YBjYSQAsxVr9fBE=;
 b=mZhpWJW8ptyOrUxN+wZcnO+8ij768qtM2OEq47meJtWCoWwY880jE1ogU/UKbjMGD3
 1oszlP7KQmGSPuAoZTJQg9/2M99QkpkQ8PHsxxRvo6BpSJVbW2+qSHszOopSZRskrmvc
 l1qta3gnGfe3elsdh3M7QmRcVZYzCRHpaiNnGfEQLH/bNoQ4wNVVhPzXyCVsWfZ20uU1
 j5W9HIU/M+iHinP/dTijDIb3nyrm2Wbum3n7Wu3MKTfOW9O+MeorXefvwZAY28f/jRJP
 RkCiF1kT4yqCM1b6TU+ijTnNZj33xvstze/8MCE/u8G7cHO6tHw4DW/XoL3rCrWRHLAJ
 3raQ==
X-Gm-Message-State: AO0yUKULufSK9a5tIwEsQEx2jYT1n/pHaDj0fafcfagUxJ9s0GAy/Pet
 TVz3Mqdoggetlbq/zUbkj6bLSQ==
X-Google-Smtp-Source: AK7set8Ka9X8JPp0aKGg1LcB+NwytW8t2PaNfKlUoBo8WqOamHE19YTjKMWphrZondIJnlpijj3z8g==
X-Received: by 2002:a17:906:fe02:b0:930:a3a1:bede with SMTP id
 wy2-20020a170906fe0200b00930a3a1bedemr898911ejb.50.1678953875270; 
 Thu, 16 Mar 2023 01:04:35 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:9827:5f65:8269:a95f?
 ([2a02:810d:15c0:828:9827:5f65:8269:a95f])
 by smtp.gmail.com with ESMTPSA id
 cb15-20020a170906a44f00b009226f644a07sm3486809ejb.139.2023.03.16.01.04.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Mar 2023 01:04:34 -0700 (PDT)
Message-ID: <7b3ec8b5-f12b-fd29-96cb-7a1e1656eb42@linaro.org>
Date: Thu, 16 Mar 2023 09:04:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: Serge Semin <Sergey.Semin@baikalelectronics.ru>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20230313225103.30512-1-Sergey.Semin@baikalelectronics.ru>
 <20230313225103.30512-6-Sergey.Semin@baikalelectronics.ru>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230313225103.30512-6-Sergey.Semin@baikalelectronics.ru>
X-Topics: 
Cc: devicetree@vger.kernel.org, Biao Huang <biao.huang@mediatek.com>,
 netdev@vger.kernel.org, Richard Cochran <richardcochran@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Serge Semin <fancer.lancer@gmail.com>,
 Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
 Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
 Yang Yingliang <yangyingliang@huawei.com>,
 Christian Marangi <ansuelsmth@gmail.com>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 05/16] dt-bindings: net: dwmac:
 Elaborate snps, clk-csr description
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

On 13/03/2023 23:50, Serge Semin wrote:
> The property is utilized to set the CSR-MDC clock selector in the STMMAC
> driver. The specified value is used instead of auto-detecting the
> CSR/application clocks divider based on the reference clock rate. Let's
> add a more detailed description to clarify the property purpose and
> permitted values. In the later case the constraints are specified based on
> the DW *MAC CR registers permitted values.
> 
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> ---
>  Documentation/devicetree/bindings/net/snps,dwmac.yaml | 10 +++++


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
