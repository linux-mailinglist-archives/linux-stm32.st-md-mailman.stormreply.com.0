Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C798C51067E
	for <lists+linux-stm32@lfdr.de>; Tue, 26 Apr 2022 20:15:11 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8F501C6046D;
	Tue, 26 Apr 2022 18:15:11 +0000 (UTC)
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com
 [209.85.160.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 965B1C5F1F2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Apr 2022 18:15:09 +0000 (UTC)
Received: by mail-oa1-f53.google.com with SMTP id
 586e51a60fabf-e68392d626so15162396fac.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Apr 2022 11:15:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=SuszhkzwVSvuIjdf0zLmtdsA7PD3kNJt5NhF6kgFDew=;
 b=RZKyXbT4VwrfS6BakJll1rrz7CkCFQblJf9O3hyBL+IHOPiRk9Zl+KrFdSqRTLS8HP
 r9gxkskIZSBcEX7rNuGBKUkeXo5fsSt/JPf7xGV8cOI76UEsioSQD/L5eBEC+GY+Gr8h
 UnQPKf0HB+eMy9cnHciqqAna7kzWjGuyXJTvO58Cldec70PQQIo0MwS/wSJLxm5ba2Nv
 24dn7jJYwngft9cAGKonl48uu0xzBaGQpHWF1nN4yadQoDuatnLbOa8AmN9tf12MoJ0G
 l4p1JTDXKrj7C+gKZ4dmVVGOlqjOXCdVN8wvES/Uq9EeGGu59cq5HMPD3zLzSlGmiFvS
 kGsQ==
X-Gm-Message-State: AOAM530vyL/Arb4lS5enQhT/Ktj60gq+yPmkJRhXcmlzCMICx2eFVbWi
 yG3GYfXV4aenkKaCmJmyBw==
X-Google-Smtp-Source: ABdhPJzxRzSuI14j7y1LkGIg6AiDNSYupXj9Vua8a/EnRksjvbi5hGsenSTH5vuHGxtGykm3KZEhsQ==
X-Received: by 2002:a05:6870:c14f:b0:e9:144a:8b46 with SMTP id
 g15-20020a056870c14f00b000e9144a8b46mr7099500oad.69.1650996908435; 
 Tue, 26 Apr 2022 11:15:08 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 b20-20020a4a3414000000b00339e0afec88sm5907649ooa.31.2022.04.26.11.15.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 11:15:08 -0700 (PDT)
Received: (nullmailer pid 2289122 invoked by uid 1000);
 Tue, 26 Apr 2022 18:15:07 -0000
Date: Tue, 26 Apr 2022 13:15:07 -0500
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Message-ID: <Ymg2q/nO0vWbJwMA@robh.at.kernel.org>
References: <20220425140436.332467-1-krzysztof.kozlowski@linaro.org>
 <20220425140436.332467-2-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220425140436.332467-2-krzysztof.kozlowski@linaro.org>
Cc: devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-kernel@vger.kernel.org, Oleksij Rempel <o.rempel@pengutronix.de>,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 2/2] dt-bindings: arm: stm32: correct
	blank lines
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

On Mon, 25 Apr 2022 16:04:36 +0200, Krzysztof Kozlowski wrote:
> Correct blank lines to precesily separate entries.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  Documentation/devicetree/bindings/arm/stm32/stm32.yaml | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
