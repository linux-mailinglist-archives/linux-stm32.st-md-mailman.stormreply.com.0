Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C2FBF476575
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Dec 2021 23:13:05 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7936DC5E2C5;
	Wed, 15 Dec 2021 22:13:05 +0000 (UTC)
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com
 [209.85.210.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7369FC597BA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Dec 2021 22:13:03 +0000 (UTC)
Received: by mail-ot1-f49.google.com with SMTP id
 v15-20020a9d604f000000b0056cdb373b82so26654793otj.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Dec 2021 14:13:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ITxrC42cpEdFPF3axFsIeZiANWHi83eE7MbTcA8W+gg=;
 b=s0KHcFsAzmnaoyOkZJVPiruGNbNGDwI8DfdOepOa7POSbgDX6z7p0r/ti8dFRGOHW3
 /x5Rf6SuOyjXOMaGLgDLhRjBZtQio+1rj5tQO8oOQk65+g33cHgrAxFsBzIX6D8ql4ND
 qsOqxL57TFwMI65kOj8map9xyfLv8VQWJ+OoDaux3DMrxAv9Pc79W7ZcitVNw2TZ0Ui3
 a46QHGcU7WFSZM2OFxSEIBR/LbYxQGWtsjx2/bD1J2yFXktMxENg5HPqoHtURrXugwAs
 QDja1+3zgNsv+5MggUyKdRL66ubE8r3rqM6pPtntjJzlEUIShK8GA+QfqJGAPrBkcNHs
 ag9A==
X-Gm-Message-State: AOAM533sWf5h8D0Y2H8dm8O8EIs8tDNUJV4H+Ks+H4MXYL8tDTniSBfq
 7m71JxChgShr5FdJTdciZg==
X-Google-Smtp-Source: ABdhPJwaDEcWGo2pJ8CHSx9viVOHay+ZBu3YGBOyUvT6TDJu7jRsraMtVM63nT7+QEIcvGrQCS8ePw==
X-Received: by 2002:a05:6830:1092:: with SMTP id
 y18mr10206759oto.119.1639606382307; 
 Wed, 15 Dec 2021 14:13:02 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id t18sm698156ott.2.2021.12.15.14.13.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Dec 2021 14:13:01 -0800 (PST)
Received: (nullmailer pid 1932976 invoked by uid 1000);
 Wed, 15 Dec 2021 22:13:00 -0000
Date: Wed, 15 Dec 2021 16:13:00 -0600
From: Rob Herring <robh@kernel.org>
To: Biao Huang <biao.huang@mediatek.com>
Message-ID: <YbpobIscSDPKuxxY@robh.at.kernel.org>
References: <20211215021652.7270-1-biao.huang@mediatek.com>
 <20211215021652.7270-7-biao.huang@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211215021652.7270-7-biao.huang@mediatek.com>
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
Subject: Re: [Linux-stm32] [PATCH net-next v9 6/6] net: dt-bindings: dwmac:
 add support for mt8195
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

On Wed, Dec 15, 2021 at 10:16:52AM +0800, Biao Huang wrote:
> Add binding document for the ethernet on mt8195.
> 
> Signed-off-by: Biao Huang <biao.huang@mediatek.com>
> ---
>  .../bindings/net/mediatek-dwmac.yaml          | 42 ++++++++++++++-----
>  1 file changed, 32 insertions(+), 10 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml b/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml
> index 8ad6e19661b8..44d55146def4 100644
> --- a/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml
> @@ -19,6 +19,7 @@ select:
>        contains:
>          enum:
>            - mediatek,mt2712-gmac
> +          - mediatek,mt8195-gmac
>    required:
>      - compatible
>  
> @@ -27,26 +28,37 @@ allOf:
>  
>  properties:
>    compatible:
> -    items:
> -      - enum:
> -          - mediatek,mt2712-gmac
> -      - const: snps,dwmac-4.20a
> +    oneOf:
> +      - items:
> +          - enum:
> +              - mediatek,mt2712-gmac
> +          - const: snps,dwmac-4.20a
> +      - items:
> +          - enum:
> +              - mediatek,mt8195-gmac
> +          - const: snps,dwmac-5.10a
>  
>    clocks:
> +    minItems: 5

As before, you need 'minItems: 4' in the previous patch.

If you aren't clear what's needed, run 'make dtbs_checks' yourself 
before submitting again.

>      items:
>        - description: AXI clock
>        - description: APB clock
>        - description: MAC Main clock
>        - description: PTP clock
>        - description: RMII reference clock provided by MAC
> +      - description: MAC clock gate
>  
>    clock-names:
> -    items:
> -      - const: axi
> -      - const: apb
> -      - const: mac_main
> -      - const: ptp_ref
> -      - const: rmii_internal
> +    minItems: 5
> +    maxItems: 6
> +    contains:

No, you just threw out the order requirements. And this schema will be 
true with just 1 of the strings below plus any other strings. For 
example, this will pass:

clock-names = "foo", "bar", "axi", "baz", "rob";

> +      enum:
> +        - axi
> +        - apb
> +        - mac_main
> +        - ptp_ref
> +        - rmii_internal
> +        - mac_cg
>  
>    mediatek,pericfg:
>      $ref: /schemas/types.yaml#/definitions/phandle
> @@ -61,6 +73,8 @@ properties:
>        or will round down. Range 0~31*170.
>        For MT2712 RMII/MII interface, Allowed value need to be a multiple of 550,
>        or will round down. Range 0~31*550.
> +      For MT8195 RGMII/RMII/MII interface, Allowed value need to be a multiple of 290,
> +      or will round down. Range 0~31*290.
>  
>    mediatek,rx-delay-ps:
>      description:
> @@ -69,6 +83,8 @@ properties:
>        or will round down. Range 0~31*170.
>        For MT2712 RMII/MII interface, Allowed value need to be a multiple of 550,
>        or will round down. Range 0~31*550.
> +      For MT8195 RGMII/RMII/MII interface, Allowed value need to be a multiple
> +      of 290, or will round down. Range 0~31*290.
>  
>    mediatek,rmii-rxc:
>      type: boolean
> @@ -102,6 +118,12 @@ properties:
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
