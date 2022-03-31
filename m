Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CC0474ED83F
	for <lists+linux-stm32@lfdr.de>; Thu, 31 Mar 2022 13:10:07 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 846D6C60490;
	Thu, 31 Mar 2022 11:10:07 +0000 (UTC)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com
 [209.85.219.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 15888C5E2CC
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 31 Mar 2022 11:10:06 +0000 (UTC)
Received: by mail-qv1-f49.google.com with SMTP id jo24so19468748qvb.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 31 Mar 2022 04:10:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=LZri1QmIwLg+DYDniyH354wuZz2jQq8wnmWC2f+UvNk=;
 b=CGA6tXQogr4P9WKRr+lZhqp9py7WDO3T3bGcSQVl7FIa5pnDzCYtWC4wHcwuV2hTV1
 +ZDKRpFgLDI9okt/43VRNMa5ebU4XgNYZ6jsAPb77ZpH3NPV/reG8xbY/OKpoeqtyiNK
 TYl69QUr2tU6KLvcA/9p5nU8OXC934lN9frhCpTckQkAJIPnLegbA2D85x/k+qJtdraJ
 gJyjzUrpbLdIdm1ykbgclDVuFm2dFAiBCHNlyDtKF0Sa6KNrUMk1YwSWIyiY9mk2EMgZ
 +6vEotV7tobYGVQULCJMTDbelNBDszml1TuvdqJvx7opxStcOyAMWjRijl4ousBWvBc1
 Dk7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=LZri1QmIwLg+DYDniyH354wuZz2jQq8wnmWC2f+UvNk=;
 b=gj5Jrusb+wL1gs0qCMJT2UmZL/G1Hogk/jvyjCK/Ng7aowAiuWE7dwtcjd+8yOqeuF
 +b/6PnBqkbtPzWnJp5yLq9A12DIG7mvFdCEIPPz2U61bqBpaHYLkVDyXASnJWtJJRdXk
 I0bPXjn7CTOPSanU/2aIzfP0GgAgHXyEI/AR41y7PqEGQpzQWR+gnJNWnlSLkQY1KBBy
 1pI0ro7ABQ9Ep0GU7fsorARruy7IOBuKhhT0xhRk4RuePtV7f/dmUNngAw2lHJraKjQL
 SdWePKlRNsjlX0onbchSuK+dnx5yxPfRfGEhBc0NtB7ocELvae7WunYxvLeS4FFA9lWC
 zd7Q==
X-Gm-Message-State: AOAM5325w0GX2DSw2GDC2YkL2plUH6ws3al3RGmYFjAqmLNPg5ciLzXo
 1+lZl83VqsnjSAAMgBD90/c=
X-Google-Smtp-Source: ABdhPJwbMO7Mb+rcF4NaO4plvZQNRBr0+sy+UcxUK021eXZb5rKWyrXmPYZFiMSqbvKzXOVrKS/fcQ==
X-Received: by 2002:a05:6214:d4e:b0:441:18d8:8366 with SMTP id
 14-20020a0562140d4e00b0044118d88366mr3464915qvr.46.1648725004854; 
 Thu, 31 Mar 2022 04:10:04 -0700 (PDT)
Received: from [192.168.1.145] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 z203-20020a3765d4000000b0067b48d49c65sm12142999qkb.95.2022.03.31.04.10.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Mar 2022 04:10:03 -0700 (PDT)
Message-ID: <258d7152-326e-4f0a-859f-5864f01fd212@gmail.com>
Date: Thu, 31 Mar 2022 13:09:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: "jason-jh.lin" <jason-jh.lin@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
References: <20220307032859.3275-1-jason-jh.lin@mediatek.com>
 <20220307032859.3275-3-jason-jh.lin@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220307032859.3275-3-jason-jh.lin@mediatek.com>
Cc: devicetree@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 fshao@chromium.org, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, singo.chang@mediatek.com,
 Fabien Parent <fparent@baylibre.com>, roy-cw.yeh@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com, CK Hu <ck.hu@mediatek.com>,
 moudy.ho@mediatek.com, linux-mediatek@lists.infradead.org,
 Daniel Vetter <daniel@ffwll.ch>, hsinyi@chromium.org,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>, nancy.lin@mediatek.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v16 2/8] dt-bindings: arm: mediatek:
 mmsys: add power and gce properties
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>



On 07/03/2022 04:28, jason-jh.lin wrote:
> Power:
> 1. Add description for power-domains property.
> 
> GCE:
> 1. Add description for mboxes property.
> 2. Add description for mediatek,gce-client-reg property.
> 

As you have to resend the series anyway, would you mind to make the commit 
message more sound with whole phrases? Other then that, the patch looks good.

Thanks,
Matthias

> Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
> ---
>   .../bindings/arm/mediatek/mediatek,mmsys.yaml | 31 +++++++++++++++++++
>   1 file changed, 31 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> index b31d90dc9eb4..6c2c3edcd443 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> @@ -41,6 +41,30 @@ properties:
>     reg:
>       maxItems: 1
>   
> +  power-domains:
> +    description:
> +      A phandle and PM domain specifier as defined by bindings
> +      of the power controller specified by phandle. See
> +      Documentation/devicetree/bindings/power/power-domain.yaml for details.
> +
> +  mboxes:
> +    description:
> +      Using mailbox to communicate with GCE, it should have this
> +      property and list of phandle, mailbox specifiers. See
> +      Documentation/devicetree/bindings/mailbox/mtk-gce.txt for details.
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +
> +  mediatek,gce-client-reg:
> +    description:
> +      The register of client driver can be configured by gce with 4 arguments
> +      defined in this property, such as phandle of gce, subsys id,
> +      register offset and size.
> +      Each subsys id is mapping to a base address of display function blocks
> +      register which is defined in the gce header
> +      include/dt-bindings/gce/<chip>-gce.h.
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    maxItems: 1
> +
>     "#clock-cells":
>       const: 1
>   
> @@ -56,9 +80,16 @@ additionalProperties: false
>   
>   examples:
>     - |
> +    #include <dt-bindings/power/mt8173-power.h>
> +    #include <dt-bindings/gce/mt8173-gce.h>
> +
>       mmsys: syscon@14000000 {
>           compatible = "mediatek,mt8173-mmsys", "syscon";
>           reg = <0x14000000 0x1000>;
> +        power-domains = <&spm MT8173_POWER_DOMAIN_MM>;
>           #clock-cells = <1>;
>           #reset-cells = <1>;
> +        mboxes = <&gce 0 CMDQ_THR_PRIO_HIGHEST>,
> +                 <&gce 1 CMDQ_THR_PRIO_HIGHEST>;
> +        mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0 0x1000>;
>       };
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
