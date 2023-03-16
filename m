Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B99C76BC83B
	for <lists+linux-stm32@lfdr.de>; Thu, 16 Mar 2023 09:07:41 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 79227C6904F;
	Thu, 16 Mar 2023 08:07:41 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 02F32C6904A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Mar 2023 08:07:40 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id h8so4135980ede.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Mar 2023 01:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678954059;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7bLCnphtCoYaOUO/XmDnUvbleV00dxya2UA7xOdtlvI=;
 b=u+eyp6tx+NTpuXn9TcIwnNCAck2h5Llecsjso31eMXyMw55rTgUAJjbxIfx+4TSBFT
 UerMzwj+URTf+h3ZeZlH9UodIHFViAIDtRxcpag1TFBBD/XirFhXki9EAHP6ualP6h5V
 eKZ83H+h/c8l+dooQTR62EfkpIVVCq5fvL1YqVWEiYu1axk+x09kIyH6Xy1Il3EDjI1F
 wqk7QYCu2BDUIz5sjqHPS6Ii0Wyt1ZbYc3Rvh9PseXP3Odau93L66r8pAoN2rm5F61vv
 WwpLAsOfcXazaPQ2TRVl+eqc1W/caEl8RE2VqEKDULsDDup+ZHLtVRQ2YvhS+2nXs7tJ
 l+Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678954059;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7bLCnphtCoYaOUO/XmDnUvbleV00dxya2UA7xOdtlvI=;
 b=JVu0PPyAbZtSKzfnVMGt5XK6pvhAcKpHqkv/znsr5KmYVLUX97gq27U+vfpqf0b8/W
 zFxJsjoTLQgAm6SEpWMjOeEu+cuE6oeInsuHn95zWRJ4Tsv66aHIWqFT3T9hsIJcI1C1
 +ZSTq6B0pMrXOBlOSogjr2N5kW+d8k8fC88zsQhUlFu3J9Ev/hfSlFxJOX6avKYzGzCO
 8D75m6lAzvpvvvUfMrAhtrUsSJ+0U24mg+SadsEZdosN8vmKXMyeoQ7f4XydgV5JZirO
 8JE2AC0ZV2AC4J3iO9NxQh1YY1sc5kt88KORoEWwSR+0Vf77iTrqRN1djNdkhYtTfDzL
 VBbw==
X-Gm-Message-State: AO0yUKWpoH93AR90Xr9sxSVM6SleR1CyiMw30dx3DsTA22RAB43xV3iM
 +T88PjAL/tCPBj47khfW0ljjRw==
X-Google-Smtp-Source: AK7set9E8pty3V37QE7on6sEyxDO7T6KMKBPBTC0gYLiXURZICca8Wpt50shKAdyoNuvMjlI8HEp2A==
X-Received: by 2002:a17:906:bc8f:b0:8e8:602f:847a with SMTP id
 lv15-20020a170906bc8f00b008e8602f847amr9762171ejb.24.1678954059599; 
 Thu, 16 Mar 2023 01:07:39 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:9827:5f65:8269:a95f?
 ([2a02:810d:15c0:828:9827:5f65:8269:a95f])
 by smtp.gmail.com with ESMTPSA id
 z17-20020a1709064e1100b008b69aa62efcsm3527336eju.62.2023.03.16.01.07.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Mar 2023 01:07:39 -0700 (PDT)
Message-ID: <543fe511-5d04-f3d9-503e-968d3b1a6f6a@linaro.org>
Date: Thu, 16 Mar 2023 09:07:37 +0100
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
 <20230313225103.30512-12-Sergey.Semin@baikalelectronics.ru>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230313225103.30512-12-Sergey.Semin@baikalelectronics.ru>
X-Topics: 
Cc: devicetree@vger.kernel.org, Biao Huang <biao.huang@mediatek.com>,
 netdev@vger.kernel.org, Richard Cochran <richardcochran@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Serge Semin <fancer.lancer@gmail.com>,
 Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
 Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
 Yang Yingliang <yangyingliang@huawei.com>,
 Christian Marangi <ansuelsmth@gmail.com>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 11/16] dt-bindings: net: dwmac:
 Add MTL Rx Queue properties constraints
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
> Currently none of the MTL Rx Queues QoS-related DT-properties have been
> equipped with the proper constraints. Meanwhile they can be specified at
> least based on the corresponding CSR field sizes or the DW (x|xG)MAC
> IP-core synthesize parameter constraints. Let's do that:
> + snps,rx-queues-to-use - number of Rx queues to utilise is limited w

(...)

> +
>            snps,route-avcp:
>              type: boolean
>              description: AV Untagged Control packets
> @@ -166,6 +173,9 @@ properties:
>            snps,priority:
>              $ref: /schemas/types.yaml#/definitions/uint32
>              description: Bitmask of the tagged frames priorities assigned to the queue
> +            minimum: 0
> +            maximum: 0xFF
> +

lowercase hex

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
