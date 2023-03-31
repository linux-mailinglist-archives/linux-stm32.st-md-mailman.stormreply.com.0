Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E56506D27EE
	for <lists+linux-stm32@lfdr.de>; Fri, 31 Mar 2023 20:37:00 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 93864C69069;
	Fri, 31 Mar 2023 18:37:00 +0000 (UTC)
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com
 [209.85.160.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 02710C65E42
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Mar 2023 18:36:58 +0000 (UTC)
Received: by mail-oa1-f47.google.com with SMTP id
 586e51a60fabf-177ca271cb8so24135751fac.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Mar 2023 11:36:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680287818;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+bjD1EcJNKzAi8wncOI0Nv9d4Dm2eSpivDuCUZ0uj+Q=;
 b=wuGFjHlIJ6f4eJCeZLrEEwwUdkagagrTH/dVdnwhym3lx/ItbwwRvZTFjG8nLb+DAi
 XGXuFBoJxqGcJbOFo/QUsX6UB2RFssacPZJYSiCgkx0ugqM6mYXPkeSxtED0dxEYz+SD
 VBvLvTdnyl/K3aI5fxdKJV80zZp0PkFCozTmYnw/+vM/WL7SwEdTEqROd/GD9VcW/AJk
 8h0lnFD76vFEPmePyaVuEdg6jXQpmYnOIyYSEdG+aG5WMXiAbJ8gHKPqdkW2Trj+saWK
 Re58VqmrGBySY0mEmsOAAaSIhp/7a0Mnux1RuORUEo7sse5KGGgItMOBtXKCsoOo37CY
 00aQ==
X-Gm-Message-State: AAQBX9d5xcg3Q+cnAwWrg8/J02LYR+Wls7gIdtjg5sQUgQ9vqh3WL6G+
 EYWbJs2+mq+fTZI5IaH41w==
X-Google-Smtp-Source: AKy350Y886xOZ+2ooL5E3zJvqqPPH1/c5nOufsJ+DfqnVrTuBrB0nKcCnpq/FFcxJ0fp42lzvWwBTg==
X-Received: by 2002:a05:6870:d191:b0:177:a92e:ee6 with SMTP id
 a17-20020a056870d19100b00177a92e0ee6mr17583742oac.54.1680287817716; 
 Fri, 31 Mar 2023 11:36:57 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 k24-20020a056830169800b0069f95707335sm1369913otr.69.2023.03.31.11.36.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Mar 2023 11:36:57 -0700 (PDT)
Received: (nullmailer pid 1920516 invoked by uid 1000);
 Fri, 31 Mar 2023 18:36:56 -0000
Date: Fri, 31 Mar 2023 13:36:56 -0500
From: Rob Herring <robh@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Message-ID: <168028781598.1920458.10411321215956149029.robh@kernel.org>
References: <20230323185112.13855-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230323185112.13855-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-kernel@vger.kernel.org,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 linux-renesas-soc@vger.kernel.org, Chris Brandt <chris.brandt@renesas.com>,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Biju Das <biju.das.jz@bp.renesas.com>, Thomas Gleixner <tglx@linutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: timer: renesas: ostm:
	Document RZ/Five SoC
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


On Thu, 23 Mar 2023 18:51:12 +0000, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> The OSTM block on the RZ/Five SoC is identical to one found on the RZ/G2UL
> SoC. "renesas,r9a07g043-ostm" compatible string will be used on the
> RZ/Five SoC so to make this clear, update the comment to include RZ/Five
> SoC.
> 
> No driver changes are required as generic compatible string
> "renesas,ostm" will be used as a fallback on RZ/Five SoC.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  Documentation/devicetree/bindings/timer/renesas,ostm.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
