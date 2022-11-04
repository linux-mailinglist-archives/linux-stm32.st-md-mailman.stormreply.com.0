Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F1DD561967D
	for <lists+linux-stm32@lfdr.de>; Fri,  4 Nov 2022 13:47:14 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B9213C65040;
	Fri,  4 Nov 2022 12:47:14 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com
 [209.85.222.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D3E4DC035BD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  4 Nov 2022 12:47:12 +0000 (UTC)
Received: by mail-qk1-f178.google.com with SMTP id k26so2954128qkg.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 04 Nov 2022 05:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=37mgEruhzOSlqZ+AcYORFybB/gGWQo+VZHLBQmJiMoM=;
 b=BVPbR9YsKWOme9ZskiqPQIIYzkD0tcEbm0Ea2nXnJVjjtKtLQKQVwbHTWyguqA8GeE
 ZwozPyIy5A6dk/u/qj7ncM6caMoIYS+anC+qd8K4yYooPBO3lEU4UUCYi4FdTnJoDZ4p
 fuGN0x0M3TmDKalqBjCWwUpo+uBDOYiRF2t0sXDbsHO2i2yFaVh3gQjOV9S4FW/BQNaK
 2uUjMcAb8hs30Xwlsccpbiqja6C8yUEnkWLorpi4B7hVzwitqjZqV6N9HM2OkINh/lYN
 FazpP+Md6bRPr3+V4fAdSp1r8YblbiO8T2MY0/nUhgNGJZJU1yxXv7CNdOIqYfK0XPoe
 9KIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=37mgEruhzOSlqZ+AcYORFybB/gGWQo+VZHLBQmJiMoM=;
 b=fsORA1NtCCNtQM2v1eoEVg/65pZJ2n8ROrHp6/cZf5hPV9310jBUJKucUyUtEI6w7O
 WBSyvbLqjx4AeAI6GxD7P41TwddDEsaqt8QIZoOW1vvnf6/JXVaUljBRbySjHk+Tbrqq
 xc4Swl+Cus9BkBtuEcZmppjILMgmuZJCeqbiF6Em8XfycUlCQWMRGseNZpm6MeJjljNe
 bp/f9ijKq3GhdF7GZgzmd3UKM+ltVv30P/gZWxznjYBt33J/JPnhn48GtR+sp1XSQafP
 brAQM90arRhwiWanb69jac2MaU8ZnFEI2lSLrHgurHqRYhU562Bl6G45Qe3PyLEAEy3l
 ZHgw==
X-Gm-Message-State: ACrzQf0b/IrdFe2OjEHzhLaU8oPgHgOp9qyy4A8+gkX7QyXdzJde72U6
 84P7Dlq6lgwHNRt7IWUAC6ONFg==
X-Google-Smtp-Source: AMsMyM4Nvwfygk8PY62m55LKV09JKXF4xGrl6XXRn5kN1Ai92ahoM1HKa+1rJFx5/fpc8z08WJIEpg==
X-Received: by 2002:a05:620a:138d:b0:6fa:2e05:6083 with SMTP id
 k13-20020a05620a138d00b006fa2e056083mr20187243qki.287.1667566031861; 
 Fri, 04 Nov 2022 05:47:11 -0700 (PDT)
Received: from ?IPV6:2601:586:5000:570:aad6:acd8:4ed9:299b?
 ([2601:586:5000:570:aad6:acd8:4ed9:299b])
 by smtp.gmail.com with ESMTPSA id
 bi11-20020a05620a318b00b006eeca296c00sm2770054qkb.104.2022.11.04.05.47.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Nov 2022 05:47:11 -0700 (PDT)
Message-ID: <9fca87df-c879-828c-84c3-a870bbd87038@linaro.org>
Date: Fri, 4 Nov 2022 08:47:09 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To: Sriranjani P <sriranjani.p@samsung.com>, peppe.cavallaro@st.com,
 alexandre.torgue@foss.st.com, joabreu@synopsys.com, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, richardcochran@gmail.com
References: <20221104120517.77980-1-sriranjani.p@samsung.com>
 <CGME20221104115902epcas5p209442971ba9f4cb001a933bda3c50b25@epcas5p2.samsung.com>
 <20221104120517.77980-4-sriranjani.p@samsung.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221104120517.77980-4-sriranjani.p@samsung.com>
Cc: devicetree@vger.kernel.org, Jayati Sahu <jayati.sahu@samsung.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Pankaj Dubey <pankaj.dubey@samsung.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 3/4] arm64: dts: fsd: Add Ethernet support
 for FSYS0 Block of FSD SoC
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

On 04/11/2022 08:05, Sriranjani P wrote:
> The FSD SoC contains two instances of Synopsys DWC QoS Ethernet IP, one
> in FSYS0 block and other in PERIC block.
> 
> Adds device tree node for Ethernet in FSYS0 Block and enables the same for
> FSD platform.
> 
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> Cc: Richard Cochran <richardcochran@gmail.com>
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
> Signed-off-by: Jayati Sahu <jayati.sahu@samsung.com>
> Signed-off-by: Sriranjani P <sriranjani.p@samsung.com>
> ---

Please use scripts/get_maintainers.pl to get a list of necessary people
and lists to CC.  It might happen, that command when run on an older
kernel, gives you outdated entries.  Therefore please be sure you base
your patches on recent Linux kernel.

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
