Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 77FEE4C8F30
	for <lists+linux-stm32@lfdr.de>; Tue,  1 Mar 2022 16:35:34 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 093D2C5F1F1;
	Tue,  1 Mar 2022 15:35:34 +0000 (UTC)
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com
 [209.85.210.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 78B60C23E53
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  1 Mar 2022 15:35:32 +0000 (UTC)
Received: by mail-ot1-f41.google.com with SMTP id
 s1-20020a056830148100b005acfdcb1f4bso12479064otq.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 01 Mar 2022 07:35:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=p9+B3rwm2FRmUHYugNPrh2s7Ox5TZPPsbWIJUn8Olyk=;
 b=ZlGzVNlj4doyI/4i0+3LkCX3ZcDkCe9zHJMoe6BPa/U5hBIiGR+LQZsufwZKFNmKuk
 EagDIEfe5oz5/fFBLAKOLoKU2lsjH4MRvuiLpoSOB838zPogCyyVP9m0+h3vFxyDu2hg
 W6Jnc4z++3JFYaUTX85rWjYDE0+2xQ3aDp2T7dVE9PYdSe8YX2+/kC2QZyeMWg1oZ8IO
 2E2eY/oTfItAlc037KtClnhfaa8NExbZdWKFl/HgApp3krBQKwFsSEogAWcNVM6S3l3g
 vPes0yA5PQuKVmehfqolBfViYF57IpNVDETFOCfLbfgjn14qlWSpBoWXG4CUvQ6Gzvi4
 wcTw==
X-Gm-Message-State: AOAM531HJYAF863XUa1jzkefIZyM0NbPo/EsUyltviNQdOUAKb8Y7yi+
 /zlrngAMJjKCLqfXGBDEjA==
X-Google-Smtp-Source: ABdhPJzIu/fU31pUN2P41QKbMEvoWDJQcVzYI8t7f9ROGjwBDYoLMhHNIvqlVXC1duTP29Vytk+2Lw==
X-Received: by 2002:a05:6830:1687:b0:5ad:4b8f:a3bf with SMTP id
 k7-20020a056830168700b005ad4b8fa3bfmr12511602otr.365.1646148931167; 
 Tue, 01 Mar 2022 07:35:31 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213]) by smtp.gmail.com with ESMTPSA id
 a69-20020a4a4c48000000b0031bec1608fbsm6359117oob.17.2022.03.01.07.35.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Mar 2022 07:35:30 -0800 (PST)
Received: (nullmailer pid 1289289 invoked by uid 1000);
 Tue, 01 Mar 2022 15:35:29 -0000
Date: Tue, 1 Mar 2022 09:35:29 -0600
From: Rob Herring <robh@kernel.org>
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Message-ID: <Yh49QXQ2phIoIFJp@robh.at.kernel.org>
References: <20220227224845.27348-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220227224845.27348-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Chris Brandt <chris.brandt@renesas.com>,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Biju Das <biju.das.jz@bp.renesas.com>, Thomas Gleixner <tglx@linutronix.de>,
 Prabhakar <prabhakar.csengg@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: timer: renesas: ostm:
 Document Renesas RZ/V2L OSTM
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

On Sun, 27 Feb 2022 22:48:44 +0000, Lad Prabhakar wrote:
> Document the General Timer Module(a.k.a OSTM) found on the RZ/V2L SoC.
> OSTM module is identical to one found RZ/G2L SoC. No driver changes are
> required as generic compatible string "renesas,ostm" will be used as a
> fallback.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> DTSI changes have been posted as part of series [0]
> 
> [0] https://patchwork.kernel.org/project/linux-renesas-soc/patch/
> 20220227203744.18355-8-prabhakar.mahadev-lad.rj@bp.renesas.com/
> ---
>  Documentation/devicetree/bindings/timer/renesas,ostm.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Applied, thanks!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
