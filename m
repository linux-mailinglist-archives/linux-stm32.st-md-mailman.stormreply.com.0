Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 565064C65FC
	for <lists+linux-stm32@lfdr.de>; Mon, 28 Feb 2022 10:47:47 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F1984C5F1F1;
	Mon, 28 Feb 2022 09:47:46 +0000 (UTC)
Received: from smtp-relay-internal-1.canonical.com
 (smtp-relay-internal-1.canonical.com [185.125.188.123])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 443F2C5EC47
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Feb 2022 09:47:46 +0000 (UTC)
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 281163F1B7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Feb 2022 09:47:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1646041664;
 bh=0JbmlSAA0fNwnIooIgqlcG+0ARF2DXlxIL3bhnCTrKE=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=PrrGRHzBMfHObCvYQqig8k+EJydyl3OkKyYtFAxhlxp9U0Ywv4gmoKSdGAZQwJswA
 wUoPeIkulNudVxJUL6emfzWAAXHXW/W2EHmFI0onycKcqEsnDr1GSKSF23DysKAOIk
 TpgGQDE/1FjTkf4pJpICekHkCezxYXnk86omqTpvhokiRMREGDdzBT9VK26IsYfMOe
 bS7Oz3CDtRGNcAtaYUpxsNGJ5ishWXmIHTUVjdp9CzkfOLy49k7nC/CfsB2cmWIlwx
 dikjMDTtgTPLpMEacOi62Rr5BXItt6eYBbzJJd6Z3aMAZAbbhpRnoU5nnm0Rd6qmNT
 T5IQNnv/Ga7Yw==
Received: by mail-wr1-f72.google.com with SMTP id
 t15-20020adfdc0f000000b001ef93643476so594435wri.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Feb 2022 01:47:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=0JbmlSAA0fNwnIooIgqlcG+0ARF2DXlxIL3bhnCTrKE=;
 b=mwX3vlJewK/uOVK88Y0QJUCx2mvYAkbTBDWSIFQTJnASGxao+HzqA8dj1lSR4PyRCB
 +BryTElqsGYW/H2nb+Guba4yfUMvU4TXuhR3NQ3Dn5mL8Fm/285vmjKdK3PUWYs+iJp2
 XNR5KOAhaisQGUvQUNoWcCxd3BAuhmoI5flx2CKq7UxaxPpaC3MxBBEMupJPMBDI670C
 1JQ/wWbefDkKIGbS0Y0dya5KPSy7Mn0z3ATEsq+6n6h2BsZ6jLNeqNDtcIAGTfudEQDv
 S/uVWccNVl23MJkqRQJUkbAiMrwo9KfQ6HmjFZjNDt9M9EPog5oGc9Xo4ibMDUsXwaX+
 Uzrg==
X-Gm-Message-State: AOAM532B3aENGKxgbQwux/jxa93kjSxVTKp4kngMLSMCliWc9rXGaqKr
 VqkQqgpN7i6yFDanDCaLs9E5yipiA/umvo00RxZjcGEBps7P6TUDtKgFoSyovxG/NF5Q/C2TntX
 7GUVjTUsVYTDZ6HhIB4PXHs6D9H1WnW42EnunK+VvtmkLudlpvQQT4kxV+w==
X-Received: by 2002:a05:600c:4615:b0:381:c68:e8f8 with SMTP id
 m21-20020a05600c461500b003810c68e8f8mr12570752wmo.117.1646041663883; 
 Mon, 28 Feb 2022 01:47:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyYFWnSTQN2LNmgpLVDrQRcbyyaUOEPgYrj2AvMI2hTg1YmU0CB7RgwzVxUe1zibUvQepHT0w==
X-Received: by 2002:a05:600c:4615:b0:381:c68:e8f8 with SMTP id
 m21-20020a05600c461500b003810c68e8f8mr12570736wmo.117.1646041663731; 
 Mon, 28 Feb 2022 01:47:43 -0800 (PST)
Received: from [192.168.0.133] (xdsl-188-155-181-108.adslplus.ch.
 [188.155.181.108]) by smtp.gmail.com with ESMTPSA id
 i6-20020adfaac6000000b001e7f9a9498asm10267833wrc.50.2022.02.28.01.47.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Feb 2022 01:47:43 -0800 (PST)
Message-ID: <b584b58f-a17a-e866-3054-64366dc7fec4@canonical.com>
Date: Mon, 28 Feb 2022 10:47:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Chris Brandt <chris.brandt@renesas.com>
References: <20220227224845.27348-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220227224845.27348-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
 Prabhakar <prabhakar.csengg@gmail.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
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

On 27/02/2022 23:48, Lad Prabhakar wrote:
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


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
