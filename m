Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CE5856A83DC
	for <lists+linux-stm32@lfdr.de>; Thu,  2 Mar 2023 14:53:47 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7A4B2C6A601;
	Thu,  2 Mar 2023 13:53:47 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DCB32C6A5FE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  2 Mar 2023 13:53:45 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id d30so67927482eda.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 02 Mar 2023 05:53:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677765225;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RZof/087BHj/A7Di0Gk0ZvGDmMzbyQKiyv3HZhGN3xw=;
 b=eIrtPDV/cG8h0VLLmJcXXTWUO8Jg3Qo6HxP4dQkg9P3u0Fn6CodkeQxrfuFSWYlIoj
 tfIZfDFPjIHCEBAJzzbDOFKm9caoaq/ph9xh8bmKh8AyGlpjlFEvOV4rXrtiIVXTIrBR
 23vID2oLuqovDF5EzpYqFN2O8vmNHGs8LJ7+7O0SiDuLFKL1Z13H4GCKPiglMKmMxeT2
 l2qcAWfjunTGjvlsMDG+mzt5qlHNipEcD9etIEHdgO3jpbgPMjeOtDMzFsCabgzjWJXa
 ABCSsGkpWfAjylMv7OyQ3r2TBByagPRD7uKsOEQQ+FMjkDfpcTP/qXCroIW86e/r98Cq
 E4ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677765225;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RZof/087BHj/A7Di0Gk0ZvGDmMzbyQKiyv3HZhGN3xw=;
 b=PBLlXVHJ6JrkatcuxR9qXI6Wqfrq6x/CNfjL6uMWm2RsC6sNHpGnRAew7FTwpEduYe
 r/M9HFtanNiSJtv+8kL2d/uAE6gjM6h9vy4g60rJDri/VQ+euBp+PRAhjdg9tg0lC4sw
 ugAnGAA2idv70l2xHPA/BPmiaOu1lZ+NOEGBQ50Mrg+E3+NWcWy+g4TlQ1w3RrikHl6Q
 kdlMWvqASLAVWomxL2ZiO7nE83RJQu3PXAWRLSUaN4Bf554xke3wV+YYc6OUL6s0r47k
 hQTVKeGY0sDOROIkwRf3DGL94slMFZoO6xw0NBzKy6vE/BijKYpWQMfSbSUDPlR64zfs
 uRHg==
X-Gm-Message-State: AO0yUKXamyom5LKyuQWYTHKggWXjSD1VG4QFYMFqQJ5hDEGGvKxupZgM
 C5LVk82EUmaXbRdnKVUe0hneGw==
X-Google-Smtp-Source: AK7set8qp/TQ+HJrn0Ii4dY4rTO5h8nKaJSn7kxrv2Kr+qtuoSVN+2tgswoIzGGoQ+TvT/Nh/UeqMA==
X-Received: by 2002:a17:906:dc90:b0:888:5d34:dc79 with SMTP id
 cs16-20020a170906dc9000b008885d34dc79mr14548417ejc.40.1677765225322; 
 Thu, 02 Mar 2023 05:53:45 -0800 (PST)
Received: from [192.168.1.20] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 z2-20020a5096c2000000b004bfc59042e5sm962328eda.61.2023.03.02.05.53.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Mar 2023 05:53:41 -0800 (PST)
Message-ID: <33edb557-f5c6-6ce1-2914-bcab2eca23c3@linaro.org>
Date: Thu, 2 Mar 2023 14:53:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: Yassine Oudjana <yassine.oudjana@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
References: <20230302133528.124113-1-y.oudjana@protonmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230302133528.124113-1-y.oudjana@protonmail.com>
Cc: devicetree@vger.kernel.org, Yassine Oudjana <y.oudjana@protonmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: display: mediatek:
	Compatible list cleanup
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

On 02/03/2023 14:35, Yassine Oudjana wrote:
> From: Yassine Oudjana <y.oudjana@protonmail.com>
> 
> Several DT bindings of MediaTek display blocks make unnecessary use of
> "oneOf" and "items", and have some enums with only 1 element. Remove
> unnecessary "oneOf" and "items", and replace enums that have 1 element
> with "const".	
> 
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
> ---
>  .../bindings/display/mediatek/mediatek,aal.yaml  |  3 +--
>  .../display/mediatek/mediatek,ccorr.yaml         | 10 ++++------
>  .../display/mediatek/mediatek,color.yaml         | 10 ++++------
>  .../display/mediatek/mediatek,dither.yaml        |  3 +--
>  .../bindings/display/mediatek/mediatek,dsc.yaml  |  4 +---
>  .../display/mediatek/mediatek,gamma.yaml         |  7 +++----
>  .../display/mediatek/mediatek,merge.yaml         |  8 +++-----
>  .../bindings/display/mediatek/mediatek,od.yaml   |  8 +++-----
>  .../display/mediatek/mediatek,ovl-2l.yaml        | 10 ++++------
>  .../bindings/display/mediatek/mediatek,ovl.yaml  | 16 ++++++----------
>  .../display/mediatek/mediatek,postmask.yaml      |  3 +--
>  .../bindings/display/mediatek/mediatek,rdma.yaml | 13 +++++--------
>  .../display/mediatek/mediatek,split.yaml         |  4 +---
>  .../bindings/display/mediatek/mediatek,ufoe.yaml |  4 +---
>  .../bindings/display/mediatek/mediatek,wdma.yaml |  4 +---
>  15 files changed, 39 insertions(+), 68 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
> index 92741486c24d..d8d78abd6c6c 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
> @@ -25,8 +25,7 @@ properties:
>            - mediatek,mt8173-disp-aal
>            - mediatek,mt8183-disp-aal
>        - items:
> -          - enum:
> -              - mediatek,mt2712-disp-aal
> +          - const: mediatek,mt2712-disp-aal

This was I think intentional - it will grow. The same in all other
one-enum cases, it might be unnecessary change which soon will be
reverted converting back to enum.

>            - const: mediatek,mt8173-disp-aal
>        - items:
>            - enum:
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
> index b04820c95b22..e72d2884bb49 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
> @@ -21,18 +21,16 @@ description: |
>  properties:
>    compatible:
>      oneOf:
> -      - items:
> -          - const: mediatek,mt8183-disp-ccorr
> -      - items:
> -          - const: mediatek,mt8192-disp-ccorr
> +      - enum:
> +          - mediatek,mt8183-disp-ccorr
> +          - mediatek,mt8192-disp-ccorr

Such changes are fine.



Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
