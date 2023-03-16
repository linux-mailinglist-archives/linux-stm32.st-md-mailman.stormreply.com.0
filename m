Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 861896BC837
	for <lists+linux-stm32@lfdr.de>; Thu, 16 Mar 2023 09:06:36 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 45B87C6904F;
	Thu, 16 Mar 2023 08:06:36 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C10B8C6904A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Mar 2023 08:06:34 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id cn21so4368703edb.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Mar 2023 01:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678953994;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KZkYtSR+YFrQLhjFXxMBdPgks/5EamNF6JACsG0aG5I=;
 b=MZyWQTzvPjgcuXcNYT/yQuy4ao0cb9lt1XOBPuBy/LGocjOIgUnBTqrQrapFtA6C5E
 AGe9t2b3JcQHb3Q0v31fRCNeKoqIgB7uxmG4eUHu6PVn7YXwLKvofq1IsrNhzIQ5Ig5L
 G47IzFDjVpaYokKqTGsVn5LsAe2j9nVg+gL3gFJb2RBUQ/fJqO+x/XbJ3fW4DQcZliwU
 2eUuZbzvtg+tchztjsUboLm+FqCFo08EcEwtrqlxVmR2ZcECbx4rwrcx1fBjxjsLkdUt
 yKxW9Om5vG01d/pnvBq5Fk53TFajpGZVA36Mz47lJtM3a1KHEpphS9VYczFs/+gzUbIi
 cl2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678953994;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KZkYtSR+YFrQLhjFXxMBdPgks/5EamNF6JACsG0aG5I=;
 b=ufdhMMHeRji0qjhx1wKH4kZe3DGD1pQtVgdp6u31MFpkDBWnBhvsID91WckVJV/YAW
 I9rSuGx0RgobfvG5Uk2rcuPxe1HY2qMDWMfqmgt41vQulMYRHBpMs4fWMQ0XBbDh+rm5
 zh/I4ILKlFmK0Rtlg2v66j8TeU9r98ZQ1OLzfUvfxFt6iEhBXYBJWNq3fRT7NM6hAOvV
 1rGEhUOyPvxq0IiDC2KmK1kQHkHfqjXRxVlhuCG+oYWs10loEN9ZlvmXPHw2ftNwwzvh
 n72H45AKoBj4M9tqX8jrYnXmh2tfWU0d5NAtmeJWBlTNXt1hS4T7r4J3cKTY8IWUYa0I
 0Eng==
X-Gm-Message-State: AO0yUKW33hoc3UTm22cNyq4eaSUZqZEI0ipr+aLF8BvhdnF10h5srUER
 8rgGAcmSVuh21r7BoqBqS5POvg==
X-Google-Smtp-Source: AK7set816JtppXD+OBP7Q2nHJWHyKFcPf9wNBzn6R33ibzuPGNNFWGvEWVf1ckoXJyxR+9WOJERVLA==
X-Received: by 2002:a17:906:b17:b0:8b1:7857:2331 with SMTP id
 u23-20020a1709060b1700b008b178572331mr8990750ejg.65.1678953994419; 
 Thu, 16 Mar 2023 01:06:34 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:9827:5f65:8269:a95f?
 ([2a02:810d:15c0:828:9827:5f65:8269:a95f])
 by smtp.gmail.com with ESMTPSA id
 oq12-20020a170906cc8c00b0092fdb0b2e5dsm938055ejb.93.2023.03.16.01.06.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Mar 2023 01:06:34 -0700 (PDT)
Message-ID: <c9577e01-b6a0-48d9-173e-2eddffd8019c@linaro.org>
Date: Thu, 16 Mar 2023 09:06:32 +0100
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
 <20230313225103.30512-11-Sergey.Semin@baikalelectronics.ru>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230313225103.30512-11-Sergey.Semin@baikalelectronics.ru>
X-Topics: 
Cc: devicetree@vger.kernel.org, Biao Huang <biao.huang@mediatek.com>,
 netdev@vger.kernel.org, Richard Cochran <richardcochran@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Serge Semin <fancer.lancer@gmail.com>,
 Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
 Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
 Yang Yingliang <yangyingliang@huawei.com>,
 Christian Marangi <ansuelsmth@gmail.com>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 10/16] dt-bindings: net: dwmac:
 Add AXI-bus properties constraints
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
> Currently none of the AXI-bus non-boolean DT-properties have constraints
> defined meanwhile they can be specified at least based on the
> corresponding device configs. Let's do that:
> + snps,wr_osr_lm/snps,rd_osr_lmt - maximum number of outstanding AXI-bus
> read/write requests is limited with the IP-core synthesize parameter
> AXI_MAX_{RD,WR}_REQ. DW MAC/GMAC: <= 16, DW Eth QoS: <= 32, DW xGMAC: <=
> 64. The least restrictive constraint is defined since the DT-schema is
> common for all IP-cores.
> + snps,blen - array of the burst lengths supported by the AXI-bus. Values
> are limited by the AXI3/4 bus standard, available AXI/System bus CSR flags
> and the AXI-bus IP-core synthesize config . All DW *MACs support setting
> the burst length within the set: 4, 8, 16, 32, 64, 128, 256. If some burst
> length is unsupported a zero value can be specified instead in the array.
> 
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>


>  
>        snps,kbbe:
>          $ref: /schemas/types.yaml#/definitions/uint32
> @@ -501,6 +507,8 @@ properties:
>            this is a vector of supported burst length.
>          minItems: 7
>          maxItems: 7
> +        items:
> +          enum: [256, 128, 64, 32, 16, 8, 4, 0]

Increasing order.

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
