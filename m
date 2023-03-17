Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2400A6BF331
	for <lists+linux-stm32@lfdr.de>; Fri, 17 Mar 2023 21:56:10 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DC28DC6907C;
	Fri, 17 Mar 2023 20:56:09 +0000 (UTC)
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com
 [209.85.166.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 266D4C69053
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Mar 2023 20:56:08 +0000 (UTC)
Received: by mail-io1-f52.google.com with SMTP id o12so2860288iow.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Mar 2023 13:56:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679086567;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BsmT8NNfgtZ1PRYiAmAwLcJbWZcQsKoINOi+pi4N8hw=;
 b=WPH0961PLpus6cpcpCnzP+HsA0qGrSKLhBij7Cxnm5dAI3KIhi6dM1fJZrn/xsbh2n
 DWBwLRISf9m02JExRpBl6xkkBZI77w5Ygb58AhFLP9O7rKLB4zS3yMrsz6EK32LUL/Rz
 t11OPDiuA+LBDyzSN2ZB2lWWvix/bcJbLzWcwbJz5JYQP1fiergU6/e9I42bCEybAg1Y
 vZ3v1mJV91edo5wdI2YQ46DdqYVIQEa2zP3CrukxFbyFNGTMLuYDs1PfDVIbvkPZzY7C
 PNdqUF1mB3y+ObyBWuij7IqpqTpefPrO6K0GvYTW44JmOI+eNz9y36SMN2qE7I13QOrO
 oQjQ==
X-Gm-Message-State: AO0yUKWcUx1u+ZANA1VPYzt/ZXWHc3+G+w8mvvFGAapYiRuG3WUDvxbL
 qqNFB5WEC9W0dLeOvpz+gA==
X-Google-Smtp-Source: AK7set+ToKO0PixBlYFJyzo1fXru242mTxE/nxzBaShob3BSkATM7RWthimVc23v51gN8LFcASQXtw==
X-Received: by 2002:a5e:950b:0:b0:74c:91c3:3837 with SMTP id
 r11-20020a5e950b000000b0074c91c33837mr505432ioj.18.1679086566973; 
 Fri, 17 Mar 2023 13:56:06 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.249])
 by smtp.gmail.com with ESMTPSA id
 d65-20020a026244000000b004062d749099sm1011915jac.51.2023.03.17.13.56.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Mar 2023 13:56:06 -0700 (PDT)
Received: (nullmailer pid 2787143 invoked by uid 1000);
 Fri, 17 Mar 2023 20:56:04 -0000
Date: Fri, 17 Mar 2023 15:56:04 -0500
From: Rob Herring <robh@kernel.org>
To: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Message-ID: <20230317205604.GA2723387-robh@kernel.org>
References: <20230313225103.30512-1-Sergey.Semin@baikalelectronics.ru>
 <20230313225103.30512-16-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230313225103.30512-16-Sergey.Semin@baikalelectronics.ru>
X-Topics: 
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Biao Huang <biao.huang@mediatek.com>, netdev@vger.kernel.org,
 Richard Cochran <richardcochran@gmail.com>,
 Yang Yingliang <yangyingliang@huawei.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Serge Semin <fancer.lancer@gmail.com>,
 Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
 Christian Marangi <ansuelsmth@gmail.com>, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 15/16] dt-bindings: net: dwmac:
 Simplify MTL queue props dependencies
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

On Tue, Mar 14, 2023 at 01:51:02AM +0300, Serge Semin wrote:
> Currently the Tx/Rx queues properties interdependencies are described by
> means of the pattern: "if: required: X, then: properties: Y: false, Z:
> false, etc". Due to very unfortunate MTL Tx/Rx queue DT-node design the
> resultant sub-nodes schemas look very bulky and thus hard to read. The
> situation can be improved by using the "allOf:/oneOf: required: X,
> required: Y, etc" pattern instead thus getting shorter and a bit easier to
> comprehend constructions.
> 
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> 
> ---

Reviewed-by: Rob Herring <robh@kernel.org>

> 
> Note the solution can be shortened out a bit further by replacing the
> single-entry allOf statements with just the "not: required: etc" pattern.
> But in order to do that the DT-schema validation tool must be fixed like
> this:
> 
> --- a/meta-schemas/nodes.yaml	2021-02-08 14:20:56.732447780 +0300
> +++ b/meta-schemas/nodes.yaml	2021-02-08 14:21:00.736492245 +0300
> @@ -22,6 +22,7 @@
>      - unevaluatedProperties
>      - deprecated
>      - required
> +    - not
>      - allOf
>      - anyOf
>      - oneOf

This should be added regardless. Can you send a patch to devicetree-spec 
or a GH PR. But I'd skip using that here for now because then we require 
a new version of dtschema.

Rob
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
