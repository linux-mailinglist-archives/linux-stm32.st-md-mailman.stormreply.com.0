Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 843BC50EA8E
	for <lists+linux-stm32@lfdr.de>; Mon, 25 Apr 2022 22:31:03 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2FD0AC60462;
	Mon, 25 Apr 2022 20:31:03 +0000 (UTC)
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com
 [209.85.210.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1EE9AC5F1EB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 Apr 2022 20:31:02 +0000 (UTC)
Received: by mail-ot1-f42.google.com with SMTP id
 s21-20020a0568301e1500b006054da8e72dso11625481otr.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 Apr 2022 13:31:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=UElAjPl3ZBi7MmMofrkEG57iZKnOHfN6jBd4SrYOjFU=;
 b=eiODnqVGVwfTfQRsoeohebX2Re69kEHjIkPH4Fw00Eb2RxO5gbIUaDHfjE6XzvL+rc
 sD+8uyDV4f75FY5TpcqmU0fVAZOc7NK+JNMkTdzVKpgSlbvmH5R+AgYZM0C7HW+vGoh9
 aReVn8Q4/taIYomy6hLnVJ8FwsyjorpYZ7ynH8r/OqfyNtadvzde0a1X8j0id/jI657F
 pYPsVOuvGGsmnXHxfzTj1mU/xvR0K7k0cpTzJ5S0Z8rMu92uwkVAX/6p3/bXb/QbhA47
 mEiosfR+ydgJSAEMyz/f+j352IIJFrbwhP6kkflab76l2+4xgcPCq+dWLM+HdirJTtOD
 1RFA==
X-Gm-Message-State: AOAM533wOyjNxo0h1obAnwJOrjSghvVrNfofZ81NSsowTE4fbLYFw5wL
 Hhr65IbbK2E9y6dmJPMXPQ==
X-Google-Smtp-Source: ABdhPJxrn8XpXmqHx65aTT2qLKNc7o5kKD8kVm9Z0t/pjjxtvXb6aaA2fbtCwtiuAAPGquB6dCUWEg==
X-Received: by 2002:a9d:482:0:b0:5cd:57a1:8082 with SMTP id
 2-20020a9d0482000000b005cd57a18082mr7248433otm.360.1650918660912; 
 Mon, 25 Apr 2022 13:31:00 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 y22-20020a056870389600b000e93d386d97sm82239oan.31.2022.04.25.13.30.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Apr 2022 13:31:00 -0700 (PDT)
Received: (nullmailer pid 220583 invoked by uid 1000);
 Mon, 25 Apr 2022 20:30:59 -0000
Date: Mon, 25 Apr 2022 15:30:59 -0500
From: Rob Herring <robh@kernel.org>
To: Biju Das <biju.das.jz@bp.renesas.com>
Message-ID: <YmcFAzRmmMiKIA2c@robh.at.kernel.org>
References: <20220425141828.197321-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220425141828.197321-1-biju.das.jz@bp.renesas.com>
Cc: devicetree@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Biju Das <biju.das@bp.renesas.com>,
 linux-renesas-soc@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Chris Brandt <chris.brandt@renesas.com>, Rob Herring <robh+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2] dt-bindings: timer: renesas: ostm:
 Document Renesas RZ/G2UL OSTM
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

On Mon, 25 Apr 2022 15:18:28 +0100, Biju Das wrote:
> Document the General Timer Module(a.k.a OSTM) found on the RZ/G2UL SoC.
> OSTM module is identical to one found RZ/G2L SoC. No driver changes are
> required as generic compatible string "renesas,ostm" will be used as a
> fallback.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v1->v2:
>  * Make the resets property required on RZ/G2UL SoC
>  * Added Ack from Krzysztof Kozlowski
>  * Added Rb tag from Geert
> ---
>  Documentation/devicetree/bindings/timer/renesas,ostm.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Applied, thanks!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
