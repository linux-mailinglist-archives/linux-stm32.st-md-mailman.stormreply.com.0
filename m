Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F1D5E5BF8F9
	for <lists+linux-stm32@lfdr.de>; Wed, 21 Sep 2022 10:22:14 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9DA6DC62D6D;
	Wed, 21 Sep 2022 08:22:14 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 76B45C03FC3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Sep 2022 08:22:13 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id s6so7932324lfo.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Sep 2022 01:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=sB76DvFVE7IoDtHgGLfADV4D3rsHaGzCUZQyyMAbRJ4=;
 b=I+4l9Es944m1QBpXCsvmQvEV/hnSjHG1mHw/gswSIsmekL9qx5vJ/D9XjVL/iLlZ6G
 qQvOi/U/5S8MSX0fcRj7MJE9Ue01fVMisGHnd1sFm/RiNNQPJQA+gABA4WOOYpQvZw00
 Al6X3eahOdURAtG18Mw9h0fqBRTemBIlQUe3jzogV+oYXhHwYlbLpMiy2Z7mAK+HCSA4
 rDueUD9b4ahZN/UmD6avo6cv6vWNVqen1s9aGtZchNSbMd0wN9XZLwH9oNRu2DHSb1DB
 dqFfH7BjGjKtDr23fbGS08woQ2gbTmrZWcTJwjyagr15FVeEgQiQh3djkJj679cKr9tl
 nWdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=sB76DvFVE7IoDtHgGLfADV4D3rsHaGzCUZQyyMAbRJ4=;
 b=wOz3EQBMR/jibdgPXC4IB/kOnkpKOfu3112Jkzgm5lHLYlGi6SORdpUsVQuaBEK0fd
 2dts19g6QypbFGweBAgCMST+V1VllQBOIovdsvLfVuEeBqdm3gvRvXREyqrFAoK0KjhQ
 rc5+rgSPe9x823730viZQ9/LvHCk8qiWQYJR/2kzZdGldOtX7neNvEF0y0odiTxqRqRa
 2yU5cv0JPzeUi4G/f4NiG+yo3d5iB0MkzKeOX8f5jrpejxPpf55tKyMRGG01zZLuTkAg
 ItTdOEB+wRBtQWPUIFO3vSRHGDXg+TdkWcXKjd3tId1/na+kDQFNxGwPNl2mux+fu5uz
 OQyQ==
X-Gm-Message-State: ACrzQf0EkN6b+Z7GNpkFane/ilYCUo4jXEYT0cFT8CZbwMNZxvYK2UDt
 /pHQesV/S3cPtYmshDQrViSMKQ==
X-Google-Smtp-Source: AMsMyM6JwwU18E3xHzfxTzTabWpYuZyhkSkwuHDOwJS7/6E0M0rElGOe+Kp6p6P+Lxy5jlM9m+G1FQ==
X-Received: by 2002:a05:6512:32c6:b0:49b:9680:5a78 with SMTP id
 f6-20020a05651232c600b0049b96805a78mr10053136lfg.397.1663748532701; 
 Wed, 21 Sep 2022 01:22:12 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 l10-20020a056512110a00b0049f9c732858sm325068lfg.254.2022.09.21.01.22.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Sep 2022 01:22:11 -0700 (PDT)
Message-ID: <82b246bc-86c5-2395-44a3-535d4f022dcc@linaro.org>
Date: Wed, 21 Sep 2022 10:22:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: Jianguo Zhang <jianguo.zhang@mediatek.com>,
 "David S . Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
References: <20220921070721.19516-1-jianguo.zhang@mediatek.com>
 <20220921070721.19516-2-jianguo.zhang@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220921070721.19516-2-jianguo.zhang@mediatek.com>
Cc: devicetree@vger.kernel.org, Biao Huang <biao.huang@mediatek.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 linux-mediatek@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 1/2] dt-bindings: net: mediatek-dwmac:
 add support for mt8188
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

On 21/09/2022 09:07, Jianguo Zhang wrote:
> Add binding document for the ethernet on mt8188
> 
> Signed-off-by: Jianguo Zhang <jianguo.zhang@mediatek.com>
> ---
>  .../devicetree/bindings/net/mediatek-dwmac.yaml        | 10 ++++++++--


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
