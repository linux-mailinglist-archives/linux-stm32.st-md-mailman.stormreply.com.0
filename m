Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B1B9A460B5F
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Nov 2021 01:05:20 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 68AECC57B6F;
	Mon, 29 Nov 2021 00:05:20 +0000 (UTC)
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com
 [209.85.210.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C4109C56630
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Nov 2021 00:05:18 +0000 (UTC)
Received: by mail-ot1-f47.google.com with SMTP id
 v15-20020a9d604f000000b0056cdb373b82so23078376otj.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 28 Nov 2021 16:05:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=iwSIflfW61r4qMMe5AGMgQ3tkWLIXXhLm1LxJgz7nQY=;
 b=fl+ovP0yXYuLaSly7qZJzV9AnXGxCIpE4GMa/lt7R2ijQrggpAiAjwZzPk3T8VLyWl
 eOrFJciOcSd7dj+myD0915KBjcE11hc6bU5Dis700K2DTkmMylQ/XgdOy/kfS1T0uzow
 zg1mAj6bUBfMWHRXaMUZPBantprEbLBx5qH30CNamefegSIu6VGn+THX+m+yKB9J2ynz
 WZE9dvtdujzL/x03chiPqotbjMHns4GlRV6Ck3/qxJdjLvm/+UIfdZ+256ab5zOmb3qJ
 5tYiRmm+jw7vW5D06a9AuD5rM17Nf+5JqOXUA/bTgNzF9WI81TBur8tqbXicAxPH1I8I
 4EcQ==
X-Gm-Message-State: AOAM533EjWNP2lwBD0Jodh9cPFhs72tZfXrpbEPRneVbkG4NQYWmur5b
 iLOhrcP+gPJpm4EUH7tsFQ==
X-Google-Smtp-Source: ABdhPJyAFWt39rMuurc002tPJegnuR2ShMHjadX/k8wY8gGlpo0V3+AB6mJ1nMYec4g9/fhbKE478A==
X-Received: by 2002:a9d:2002:: with SMTP id n2mr41519471ota.95.1638144317562; 
 Sun, 28 Nov 2021 16:05:17 -0800 (PST)
Received: from robh.at.kernel.org ([172.58.99.242])
 by smtp.gmail.com with ESMTPSA id w22sm2050772ooc.47.2021.11.28.16.05.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Nov 2021 16:05:17 -0800 (PST)
Received: (nullmailer pid 2854097 invoked by uid 1000);
 Mon, 29 Nov 2021 00:05:13 -0000
Date: Sun, 28 Nov 2021 18:05:13 -0600
From: Rob Herring <robh@kernel.org>
To: Biao Huang <biao.huang@mediatek.com>
Message-ID: <YaQZOS54BawtWkGO@robh.at.kernel.org>
References: <20211112093918.11061-1-biao.huang@mediatek.com>
 <20211112093918.11061-8-biao.huang@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211112093918.11061-8-biao.huang@mediatek.com>
Cc: devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-kernel@vger.kernel.org,
 dkirjanov@suse.de, Jose Abreu <joabreu@synopsys.com>,
 linux-mediatek@lists.infradead.org, macpaul.lin@mediatek.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com
Subject: Re: [Linux-stm32] [PATCH v3 7/7] net-next: dt-bindings: dwmac: add
 support for mt8195
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

On Fri, Nov 12, 2021 at 05:39:18PM +0800, Biao Huang wrote:
> Add binding document for the ethernet on mt8195.
> 
> Signed-off-by: Biao Huang <biao.huang@mediatek.com>
> ---
>  .../bindings/net/mediatek-dwmac.yaml          | 86 +++++++++++++++----
>  1 file changed, 70 insertions(+), 16 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml b/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml
> index 2eb4781536f7..b27566ed01c6 100644
> --- a/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml
> @@ -19,12 +19,68 @@ select:
>        contains:
>          enum:
>            - mediatek,mt2712-gmac
> +          - mediatek,mt8195-gmac
>    required:
>      - compatible
>  
>  allOf:
>    - $ref: "snps,dwmac.yaml#"
>    - $ref: "ethernet-controller.yaml#"
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - mediatek,mt2712-gmac
> +
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 5
> +          items:
> +            - description: AXI clock
> +            - description: APB clock
> +            - description: MAC Main clock
> +            - description: PTP clock
> +            - description: RMII reference clock provided by MAC
> +
> +        clock-names:
> +          minItems: 5
> +          items:
> +            - const: axi
> +            - const: apb
> +            - const: mac_main
> +            - const: ptp_ref
> +            - const: rmii_internal
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - mediatek,mt8195-gmac
> +
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 6
> +          items:
> +            - description: AXI clock
> +            - description: APB clock
> +            - description: MAC clock gate
> +            - description: MAC Main clock
> +            - description: PTP clock
> +            - description: RMII reference clock provided by MAC

Put mac_cg at the end and then the difference is just 5 or 6 clocks and 
you don't have to duplicate everything.


> +
> +        clock-names:
> +          minItems: 6
> +          items:
> +            - const: axi
> +            - const: apb
> +            - const: mac_cg
> +            - const: mac_main
> +            - const: ptp_ref
> +            - const: rmii_internal
>  
>  properties:
>    compatible:
> @@ -33,22 +89,10 @@ properties:
>            - enum:
>                - mediatek,mt2712-gmac
>            - const: snps,dwmac-4.20a
> -
> -  clocks:
> -    items:
> -      - description: AXI clock
> -      - description: APB clock
> -      - description: MAC Main clock
> -      - description: PTP clock
> -      - description: RMII reference clock provided by MAC
> -
> -  clock-names:
> -    items:
> -      - const: axi
> -      - const: apb
> -      - const: mac_main
> -      - const: ptp_ref
> -      - const: rmii_internal
> +      - items:
> +          - enum:
> +              - mediatek,mt8195-gmac
> +          - const: snps,dwmac-5.10a
>  
>    mediatek,pericfg:
>      $ref: /schemas/types.yaml#/definitions/phandle
> @@ -63,6 +107,8 @@ properties:
>        or will round down. Range 0~31*170.
>        For MT2712 RMII/MII interface, Allowed value need to be a multiple of 550,
>        or will round down. Range 0~31*550.
> +      For MT8195 RGMII/RMII/MII interface, Allowed value need to be a multiple of 290,
> +      or will round down. Range 0~31*290.
>  
>    mediatek,rx-delay-ps:
>      description:
> @@ -71,6 +117,8 @@ properties:
>        or will round down. Range 0~31*170.
>        For MT2712 RMII/MII interface, Allowed value need to be a multiple of 550,
>        or will round down. Range 0~31*550.
> +      For MT8195 RGMII/RMII/MII interface, Allowed value need to be a multiple
> +      of 290, or will round down. Range 0~31*290.
>  
>    mediatek,rmii-rxc:
>      type: boolean
> @@ -104,6 +152,12 @@ properties:
>        3. the inside clock, which be sent to MAC, will be inversed in RMII case when
>           the reference clock is from MAC.
>  
> +  mediatek,mac-wol:
> +    type: boolean
> +    description:
> +      If present, indicates that MAC supports WOL(Wake-On-LAN), and MAC WOL will be enabled.
> +      Otherwise, PHY WOL is perferred.
> +
>  required:
>    - compatible
>    - reg
> -- 
> 2.25.1
> 
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
