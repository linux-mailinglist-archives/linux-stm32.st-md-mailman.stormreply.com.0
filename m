Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 573FD63D1BE
	for <lists+linux-stm32@lfdr.de>; Wed, 30 Nov 2022 10:23:56 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F34A6C65E5D;
	Wed, 30 Nov 2022 09:23:55 +0000 (UTC)
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4A2F7C65E4C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Nov 2022 09:23:55 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 7DB6D660036C;
 Wed, 30 Nov 2022 09:23:53 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1669800234;
 bh=b/rlfin9Tu9Zg934405VE93p9gBOHlJBLcSBvPpyPXY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=TU92YAgRkOWnyIP3bvJqgwHT2x7OsuuBfGtxWnADsoddRRL8dVNwSOLIIq9iXGClu
 ZDyOpAR+4FH4w9JKcC44yCrAf4ixqxqnVDX5y+K75zqEWqfKgMip80ugRc6dDiETe/
 9zWuM7Na3x2jr/eQrOfmVK2+5Thg9HnFJ3w8hjUdULKHkDeHnNCs4Az1H4oJ0WlWNV
 UqX5DNxYmvAdcMmXYji0csNn9FYeBB0kM0zF4/9R/meuF9UXgo41Z+kOdQciVMRs4q
 yRajDFgWP2KaE6U/ctk5oMmNuB6ojJs5YGZigiTQW8HaZtO0YFNUeeqAjuRxQ/FBV2
 DBUYJpgsDmQEg==
Message-ID: <a1c556de-a9a4-5f90-1c46-a9e54daf463b@collabora.com>
Date: Wed, 30 Nov 2022 10:23:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Content-Language: en-US
To: "nathan.lu" <nathan.lu@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Matthias Brugger <matthias.bgg@gmail.com>
References: <20221129143503.16638-1-nathan.lu@mediatek.com>
 <20221129143503.16638-3-nathan.lu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221129143503.16638-3-nathan.lu@mediatek.com>
Cc: devicetree@vger.kernel.org, "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Rex-BC Chen <rex-bc.chen@mediatek.com>, Moudy Ho <moudy.ho@mediatek.com>,
 linux-mediatek@lists.infradead.org, CK Hu <ck.hu@mediatek.com>,
 lancelot.wu@mediatek.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 2/6] dt-bindings: mediatek: modify
 VDOSYS0 mmsys device tree Documentations for MT8188
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

Il 29/11/22 15:34, nathan.lu ha scritto:
> From: Nathan Lu <nathan.lu@mediatek.com>
> 
> modify VDOSYS0 mmsys device tree Documentations for MT8188.
> 
> Signed-off-by: Nathan Lu <nathan.lu@mediatek.com>
> ---
>   .../devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml      | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> index 0711f1834fbd..3e7fb33201c5 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> @@ -47,6 +47,10 @@ properties:
>             - const: mediatek,mt2701-mmsys
>             - const: syscon
>   
> +      - items:
> +          - const: mediatek,mt8188-vdosys0

The devicetree node will be like:
	something: something@somewhere {
		compatible = "mediatek,mt8188-vdosys0", "syscon";
		....
	};

....and will never get any additional compatible string, as when you'll add
vdosys1 support, we'll get a similar node like:

	something_else: something_else@somewhere_else {
		comaptible = "mediatek,mt8188-vdosys1", "syscon";
		....
	};

...so this should go upper in the enum that's listing all of the
mediatek,mtXXXX-mmsys compatibles, specifically after `mediatek,mt8186-mmsys`.

Please fix.

Regards,
Angelo

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
