Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3505D668929
	for <lists+linux-stm32@lfdr.de>; Fri, 13 Jan 2023 02:30:37 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DDE50C65E45;
	Fri, 13 Jan 2023 01:30:36 +0000 (UTC)
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com
 [209.85.160.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5DFAFC6334A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Jan 2023 01:30:36 +0000 (UTC)
Received: by mail-oa1-f54.google.com with SMTP id
 586e51a60fabf-1442977d77dso20869135fac.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Jan 2023 17:30:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BHEg0Tu4T0FTdfDnr1uHsTuZiO21FEsCK3FYFxVcWdA=;
 b=pS2TgapMnsyUXHDGA4o8P253lL9lfPpnFYsMx55qw5J0r6PqYxgJvzzsdMvj884tmK
 Taw7oXjXUY7PAkFKUcgNvZBVJ13hOSksIazjg2Tn2jrx97iSYaV71nMREJFiPMieM5rV
 hAgWh8b3d3wLGnNOmQjVe7fRc6Aa+Vgz3C2FuMGrr1OlinRUm+NGfJTKeXmhfwaZ4WDR
 xqF+jnynGA9V4/vU/FOgZBg+qZOv8sk4vij7nGZc5gL2trCXPgU4M+x3hnk6UsiBk2MN
 ZqStWsZpfaLAm2F4PdAL8H+ysuVd8YMNJmC4E0qYC8Fp3DitkGzZntawQmIULV8dL4jv
 doWw==
X-Gm-Message-State: AFqh2kqT5Lv34idgdJZzbP9/S9T2QPHRs/vv9pc3X/b1XgVx+U5/wAqp
 gKuJ+aiFnnKPcG6XYnWqGg==
X-Google-Smtp-Source: AMrXdXu/Y+DQPo4vCrgC2MrR0FQ8VB5gdtOfweqbYceUwefQolDBA2xCqxSt8+XnoA9uaACqeriVOw==
X-Received: by 2002:a05:6871:4408:b0:14f:9e41:7dbe with SMTP id
 nd8-20020a056871440800b0014f9e417dbemr4578946oab.10.1673573435159; 
 Thu, 12 Jan 2023 17:30:35 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 m26-20020a4abc9a000000b004a0aac2d28fsm9025181oop.35.2023.01.12.17.30.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Jan 2023 17:30:34 -0800 (PST)
Received: (nullmailer pid 589937 invoked by uid 1000);
 Fri, 13 Jan 2023 01:30:34 -0000
Date: Thu, 12 Jan 2023 19:30:34 -0600
From: Rob Herring <robh@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Message-ID: <167357343355.589882.8533297538415386387.robh@kernel.org>
References: <20221227-ux500-stm32-hash-v2-0-bc443bc44ca4@linaro.org>
 <20221227-ux500-stm32-hash-v2-1-bc443bc44ca4@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221227-ux500-stm32-hash-v2-1-bc443bc44ca4@linaro.org>
Cc: devicetree@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh+dt@kernel.org>,
 linux-crypto@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 1/6] dt-bindings: crypto: Let STM32
	define Ux500 HASH
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


On Tue, 10 Jan 2023 20:19:12 +0100, Linus Walleij wrote:
> This adds device tree bindings for the Ux500 HASH block
> as a compatible in the STM32 HASH bindings.
> 
> The Ux500 HASH binding has been used for ages in the kernel
> device tree for Ux500 but was never documented, so fill in
> the gap by making it a sibling of the STM32 HASH block,
> which is what it is.
> 
> The relationship to the existing STM32 HASH block is pretty
> obvious when looking at the register map, and I have written
> patches to reuse the STM32 HASH driver on the Ux500.
> 
> The main difference from the outside is that the Ux500 HASH
> lacks the interrupt line, so some special if-clauses are
> needed to accomodate this in the binding.
> 
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v1->v2:
> - Use an else construction instead of if/if not.
> ---
>  .../devicetree/bindings/crypto/st,stm32-hash.yaml  | 23 +++++++++++++++++++++-
>  1 file changed, 22 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
