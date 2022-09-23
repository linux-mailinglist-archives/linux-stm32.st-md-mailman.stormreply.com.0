Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EA0AF5E8190
	for <lists+linux-stm32@lfdr.de>; Fri, 23 Sep 2022 20:11:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 80441C0D2C1;
	Fri, 23 Sep 2022 18:11:36 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D4273C03FD6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Sep 2022 18:11:34 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id x29so962689ljq.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Sep 2022 11:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=bEsiJd/ABJ6GfZVhG9n8srep4jX5Ng0oqWanjXKMf3M=;
 b=wdf0UoY5ODBa65zXyvuXU6004RbmRtmAQtzkUjBFxlpQtsXPB6f8/sO1rqC0ZGgLp3
 4AMdVPtt9QHPuyI0VxvgIs+5MrEOgv6JoAB8AlLpxgFsMBIOnfWGqJCA6iLMwm3A9N5n
 ZIWhGGwWdLofl2d7Oa0JdtvK+ek0ZFgho+IdjF9Zua3H6P1m8VRuu/tO9eMrcsVF5l11
 CyOBznGHDjwORKYgfJR/Q4p4MPPirUKwQt2U7ZUq1syBcfAYIi47L3cQLBCIvD7tuIti
 xsWsttC3skEp4jaqH1xDk+E1USMXKtinN/Kps+8JXhGImmHsdG5MDsPXMIDqjiMzGcPq
 zmMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=bEsiJd/ABJ6GfZVhG9n8srep4jX5Ng0oqWanjXKMf3M=;
 b=IlmHgsNf+NCdfInHfVfGHxqIp8cGMdnGiPCHo//n6/zhzKtW6sGsmQg6tqTTcYGALc
 cC4R1RYAzDw+yn2ivusOu/FfzPLIu9rF2tFT/Y08KVCSXca1Mffi41x4BvEq+FmVUHHN
 oZRt4BZ0I5LIBX0DLqcYa/luvH4WCmVqHmRRsCfIq0Lf9XWJfVgqI6LTKsw33NtNRQ7V
 LIeW3qixWINTcgT6ACrr/khjQPAaHcyB3d7FJqtGGQjWvPIhXcnzdtKRRFsXEIzOm2Jo
 eGzmR4T+TVteH52UzY9cjMIx/7jCQ6Tu+MRH2Y/kM07W+pJoQpcJMBw9R2+5oZCV+QES
 l3DQ==
X-Gm-Message-State: ACrzQf2BB05X4Jm6KypYjCYdXMn+8J/212HwjeK4DKoormG2wGtpHQVe
 pH+9hCnfvUVVETm9BsNh9PAsdw==
X-Google-Smtp-Source: AMsMyM5zQjSLuWsd99Ofx6D2TOw4gAeQDb4AO5KB8bpsuR/rhKVETepxlLfDTlGOKwf2sWnZ2pYplA==
X-Received: by 2002:a2e:92c8:0:b0:25d:6ddf:e71d with SMTP id
 k8-20020a2e92c8000000b0025d6ddfe71dmr3229734ljh.170.1663956694123; 
 Fri, 23 Sep 2022 11:11:34 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 z12-20020a2eb52c000000b00261e2aab7c2sm1491057ljm.58.2022.09.23.11.11.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Sep 2022 11:11:33 -0700 (PDT)
Message-ID: <a215ae81-10de-7880-1a15-b7b08d0d80d7@linaro.org>
Date: Fri, 23 Sep 2022 20:11:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Content-Language: en-US
To: Jianguo Zhang <jianguo.zhang@mediatek.com>,
 "David S . Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
References: <20220923052828.16581-1-jianguo.zhang@mediatek.com>
 <20220923052828.16581-3-jianguo.zhang@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220923052828.16581-3-jianguo.zhang@mediatek.com>
Cc: devicetree@vger.kernel.org, Biao Huang <biao.huang@mediatek.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 linux-mediatek@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v5 2/4] dt-bindings: net: snps,
	dwmac: add clk_csr property
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

On 23/09/2022 07:28, Jianguo Zhang wrote:
> The clk_csr property is parsed in driver for generating MDC clock
> with correct frequency. A warning('clk_csr' was unexpeted) is reported
> when runing 'make_dtbs_check' because the clk_csr property
> has been not documented in the binding file.

Your subject is not accurate anymore. Maybe mention that instead of
existing clk_csr, you add a different property.

With commit msg fixes:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
