Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B378259E3F6
	for <lists+linux-stm32@lfdr.de>; Tue, 23 Aug 2022 14:51:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4A87BC640F3;
	Tue, 23 Aug 2022 12:51:41 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 900FDC03FC7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 23 Aug 2022 12:51:40 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id l23so2364532lji.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 23 Aug 2022 05:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=2CjazNJKWxawIRrAspwhPS6UmjSbXOY3YGzYB4E+Plc=;
 b=PPLvIhXyebaOzt5ZAgHRARuDpjE3QXcTZv8jgbNY3zvBxdR5T0KE8RXbL3ML0vLwwB
 utCyLkgq11HaiFzWK0PFjwBSeIkes+bOWEYJ3CaofriBJbCbD9Qhx0lN8j5/GtjKwYYb
 m2K9YR+tgW5R1pBYPlAQJkVPKATZjYOH/NCSBf2RhfXcTCWroHyMVa6FoWqCo3dP3inn
 CjTL8urZ46DjEbFoimD1Pr29eOLhWBHVc5d6dIC6RNja2OZ8AZ2wUPeQ61HgB2f6EfKk
 PETJTyGEGsqOX15mWMZcrVeKFaWM0VtdOfIdJzvG0XJ0xpUUwCviiqf1gi1dVUDnqb17
 Os5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=2CjazNJKWxawIRrAspwhPS6UmjSbXOY3YGzYB4E+Plc=;
 b=DSq9MkVTCvsQl69p7BSXwYnyZk6VPCV54dAdf1waDx0CmNa6StyfDApyxYLNsQjt7z
 TDlYyYP0NwOqwR81V0NOarYujlbx5ksD4GofTP6iu8rPYftHUPTQtgZo2NNfnp4Ou7a4
 lLAu3LAuLJeOSArX2X3N/ngHURLqzWXUsrd/F2R6Qgk86D2dCK/ipAmuah56XpLtvY1o
 UAm538HntBwkjZMcYbwKaICS+PZ4IdBEY4/w3WQKmFGRLydKaEnefX1q3mCBUOSna7R1
 XLOJSF67yIKwRmnp9mRQY5M6cwHXhyTt9XlO6n5TpjdSXtbIIu0kGackvA9xBK/RKCO3
 Ln+w==
X-Gm-Message-State: ACgBeo122ga+ZPJ80fMegKNB5+mPkdWm4UxFXA7SW7qdpRJadNoZAZtE
 2X5nEJeXnQUZy6DP95KCJQF1qg==
X-Google-Smtp-Source: AA6agR58Hgvt7z3DYujhjrD2ZnvOcvvv4OymBiELF8Edk9l9F6qF62D2kPrhZN7V9Fcd3PvG3QDT+A==
X-Received: by 2002:a05:651c:b29:b0:261:d351:9dc4 with SMTP id
 b41-20020a05651c0b2900b00261d3519dc4mr1840748ljr.409.1661259099827; 
 Tue, 23 Aug 2022 05:51:39 -0700 (PDT)
Received: from [192.168.0.11] (89-27-92-210.bb.dnainternet.fi. [89.27.92.210])
 by smtp.gmail.com with ESMTPSA id
 e9-20020a05651236c900b00492e148365fsm1234663lfs.294.2022.08.23.05.51.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Aug 2022 05:51:38 -0700 (PDT)
Message-ID: <05f99396-f6e9-a315-7264-c659e3ec507c@linaro.org>
Date: Tue, 23 Aug 2022 15:51:37 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-US
To: "nathan.lu" <nathan.lu@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Matthias Brugger <matthias.bgg@gmail.com>
References: <20220822033213.15769-1-nathan.lu@mediatek.com>
 <20220822033213.15769-2-nathan.lu@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220822033213.15769-2-nathan.lu@mediatek.com>
Cc: Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 wsd_upstream@mediatek.com, srv_heupstream@mediatek.com,
 devicetree@vger.kernel.org, "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rex-BC Chen <rex-bc.chen@mediatek.com>, Moudy Ho <moudy.ho@mediatek.com>,
 linux-mediatek@lists.infradead.org, CK Hu <ck.hu@mediatek.com>,
 lancelot.wu@mediatek.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [Linux-stm32] [PATCH v1 1/4] dt-bindings: mediatek: modify
 VDOSYS0 device tree Documentations for MT8188
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

On 22/08/2022 06:32, nathan.lu wrote:
> From: Nathan Lu <nathan.lu@mediatek.com>
> 
> modify VDOSYS0 device tree Documentations for MT8188.

(...)

> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml
> index 0882ae86e6c4..d0e6c0dd4dfb 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml
> @@ -30,6 +30,8 @@ properties:
>        - items:
>            - const: mediatek,mt8183-disp-rdma
>        - items:
> +          - enum:
> +              - mediatek,mt8188-disp-rdma
>            - const: mediatek,mt8195-disp-rdma

Why do you change existing bindings?

Best regards,
Krzysztof
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
