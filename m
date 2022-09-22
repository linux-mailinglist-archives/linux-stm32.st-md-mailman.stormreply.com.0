Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 808E65E6674
	for <lists+linux-stm32@lfdr.de>; Thu, 22 Sep 2022 17:07:37 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1CC98C04003;
	Thu, 22 Sep 2022 15:07:37 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 42C33C03FCD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 22 Sep 2022 15:07:35 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id s6so15183015lfo.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 22 Sep 2022 08:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=AICgMCTu4ugKZVgKKYZSCEgyNXOHBsTus/rL4+rxADE=;
 b=V6OmMtcM8HwjnmW517gvagdimCQzKh4oEk+jCZREpCpQaMRh+CUYlJnjHhWQjY+sn6
 O2EMQ4TmRPc0YWA2AXrfK9EAIppOKDmxGDrlHPoDNfxJVW3XtHnP0Fgo5W/reRLAdYHm
 UVYMEVijD6WYE+JDTgZ0vUoZrmyKJTJtPlgAIrAp/2bsvx+1/X6ph9K33pGARnN0DkAP
 AgfZpohHy0hyLAk3+mnfVrclwPJDWSjxwZWLrJM9tgAB6aNIiSgHd7ef4jFxWuZMDLPK
 KNeogYycbDYEqtFUykDyC8n5Xxzcz1p0neVIj97isWerTZuHph+kEpakzCtG+d2YcUpa
 pKIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=AICgMCTu4ugKZVgKKYZSCEgyNXOHBsTus/rL4+rxADE=;
 b=xm11FiCU5euiFQQX6JF/urouxN90BoAr7zPIUq/wLLon5ZRiTgP6Pb2mjxuCGL7joC
 coBIm/D+tV+IHQSbLsqMpOD/4bB6ZKPapkkm3scHe//7N7UlswdeaHnWaPVKjE5NL73s
 ZZOPqdUROAq45gh1hVFriM1NvkJrUkDJjh5iqLcjdz97FVH5lwKssh9JQilX81V2JVnl
 y6gJjeF57jaa44iFqaLfbQPWAVFJF5Enh9gNq38KhdjY4JHNKSuDEpxdb40YTWzzaYxY
 TxiJ8SYRAQi5Y/F7Fl8Ixsbj0QBNInE5aaRAXYppM3F1UEnyXJr/jPi8/GJ90lw6YH1P
 seqQ==
X-Gm-Message-State: ACrzQf3TlVaSH3iFD0Fpn4myx4ExhQdTuREKBeLiNWTXX73oOYkxcIUB
 YsogSyOPhtOqI7brPwEsSlGWSw==
X-Google-Smtp-Source: AMsMyM5wWu4phY9miXzBVbKKyNmCh/6w2BSelex3t5iKGlg/9o62Y81D5nF1RPEPAveTSBkz6dR4Ww==
X-Received: by 2002:ac2:4422:0:b0:49f:5c95:9525 with SMTP id
 w2-20020ac24422000000b0049f5c959525mr1506912lfl.1.1663859254520; 
 Thu, 22 Sep 2022 08:07:34 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 u6-20020a05651220c600b0049771081b10sm986478lfr.31.2022.09.22.08.07.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Sep 2022 08:07:33 -0700 (PDT)
Message-ID: <04b9e5ef-f3c7-3400-f9df-2f585a084c5d@linaro.org>
Date: Thu, 22 Sep 2022 17:07:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Content-Language: en-US
To: Jianguo Zhang <jianguo.zhang@mediatek.com>,
 "David S . Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
References: <20220922092743.22824-1-jianguo.zhang@mediatek.com>
 <20220922092743.22824-3-jianguo.zhang@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220922092743.22824-3-jianguo.zhang@mediatek.com>
Cc: devicetree@vger.kernel.org, Biao Huang <biao.huang@mediatek.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 linux-mediatek@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [resend PATCH v4 2/2] dt-bindings: net: snps,
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

On 22/09/2022 11:27, Jianguo Zhang wrote:
> The clk_csr property is parsed in driver for generating MDC clock
> with correct frequency. A warning('clk_csr' was unexpeted) is reported
> when runing 'make_dtbs_check' because the clk_csr property
> has been not documented in the binding file.
> 

You did not describe the case, but apparently this came with
81311c03ab4d ("net: ethernet: stmmac: add management of clk_csr
property") which never brought the bindings change.

Therefore the property was never part of bindings documentation and
bringing them via driver is not the correct process. It bypasses the
review and such bypass cannot be an argument to bring the property to
bindings. It's not how new properties can be added.

Therefore I don't agree. Please make it a property matching bindings, so
vendor prefix, no underscores in node names.

Driver and DTS need updates.

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
