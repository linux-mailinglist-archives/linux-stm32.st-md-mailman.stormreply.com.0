Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 35AB864EB83
	for <lists+linux-stm32@lfdr.de>; Fri, 16 Dec 2022 13:39:20 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EA974C65E46;
	Fri, 16 Dec 2022 12:39:19 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 42975C64109
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 16 Dec 2022 12:39:19 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id f18so2362962wrj.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 16 Dec 2022 04:39:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1C1t7Qhw/4Y/cukYlXL7QXYS7VSdfs0nLzx2PMLsJKc=;
 b=FWlOPhXmYQIcPI01pZmsrS90gM78wa1c7zAhnU7K4ckWoyxWCz/PG2DUXkon6ww3Dk
 Njwe/v/XAIX18vJuwZxeJT0OOXe4gVS5e8ZcL1HHSBktsBO+AloCjabNe1RE3liQnx9S
 FTOmIGO5MV8tlwtU9ZnP/u5teQbNvAs9Jk0Q7wvworT+0vLCs6NeG93Uj8UBuZGO+Vg4
 F6NawSUF2FTrO8DGv7xyjRnMZqnE33rCTzdcX3KCc7Mv7gP1ljwMuHQCC6OyDzJy5WnK
 RrBs1AI2D9B5uLMdeCEzRvVJ54q9CR53BWEmERsonL4C2kqB/IpSmK1prrWDD0MrGH7D
 FNCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1C1t7Qhw/4Y/cukYlXL7QXYS7VSdfs0nLzx2PMLsJKc=;
 b=gLh5ohH3obNQKlbn7H4J25hj03dQzmVVP9akHyNyLMwT2Qe6T/XO1PNXoQ0U37lrS6
 dBTgwVMQxCvuoIS1DuHJAYxUCbyWMPEThfl0aQiIPhQ98TneZTyxaysXuzQT55WS2KCd
 RUa63loLQ+AHGuldTM83BUVR6kH7QrHQylizsA3hECTH5Y7usQfMMxw9DAmvuUYKoKBI
 kfNN/X8Xtznzs3N4resYO/QfQaxt44/uwiR3oEiKetQ0wisDxC15KiVGjXMuEHfxvUfY
 X70n1W6SXAA8SQgQFCQbDZwS2LGaIw7Uh17DfFQ5D7tUMVrbg0fbqoyLiPsJJIkd1/I3
 vPoA==
X-Gm-Message-State: ANoB5pn9R9mx8TNEfVA/Tt7UZWjiLypWppzwbg4g1erRryzjtsi5+JEt
 h3M1XiPlKoJKuXXVYh7KyFA=
X-Google-Smtp-Source: AA0mqf4pMaLKkzaoevxB+rOSsPa++2dY506eWmzPr35JFyeRLluIAvbS+LVqLNgYdPE8mCAYon0LPg==
X-Received: by 2002:adf:de06:0:b0:242:1277:925b with SMTP id
 b6-20020adfde06000000b002421277925bmr20332500wrm.59.1671194358648; 
 Fri, 16 Dec 2022 04:39:18 -0800 (PST)
Received: from [192.168.1.132] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 m2-20020a5d4a02000000b0022ae0965a8asm2193502wrq.24.2022.12.16.04.39.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Dec 2022 04:39:17 -0800 (PST)
Message-ID: <83aee145-17dc-45fe-dde5-324602dde0f9@gmail.com>
Date: Fri, 16 Dec 2022 13:39:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Content-Language: en-US
To: "nathan.lu" <nathan.lu@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>
References: <20221206020046.11333-1-nathan.lu@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20221206020046.11333-1-nathan.lu@mediatek.com>
Cc: devicetree@vger.kernel.org, "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Rex-BC Chen <rex-bc.chen@mediatek.com>, Moudy Ho <moudy.ho@mediatek.com>,
 linux-mediatek@lists.infradead.org, CK Hu <ck.hu@mediatek.com>,
 lancelot.wu@mediatek.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [Linux-stm32] [PATCH v4 0/6] Add first version mt8188 vdosys0
	driver
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

Applied patches 2,3,4,5
The rest will go through the DRM driver tree.

Thanks!

On 06/12/2022 03:00, nathan.lu wrote:
> From: Nathan Lu <nathan.lu@mediatek.com>
> 
> This patch is to add first version mt8188 vdosys0 driver
> Modify and add new files include:
> 1. bindings documents
> 2. mtk mmsys
> 3. mtk mutex
> 4. mtk drm driver
> 
> Change in V4:
> - based on [1]
> [1] Change mmsys compatible for mt8195 mediatek-drm
>      - https://patchwork.kernel.org/project/linux-mediatek/list/?series=699386
> - Modify mediatek,mmsys.yaml, move mt8188-vdosys0 to ****mmsys
> - Modify mt8188_mmsysy.h DSI mux setting
> 
> Change in V3:
> - based on [1]
> [1] Change mmsys compatible for mt8195 mediatek-drm
>      - https://patchwork.kernel.org/project/linux-mediatek/list/?series=699386
> - Modify mediatek,mmsys.yaml mt8188-mmsys name to mt8188-vdosys0
> - Modify mtk-mmsys.c compatible name to mt8188-vdosys0
> - Add DSI mutex in mtk-mutex.c
> - Modify mtk_drm_drv.c mt8188-mmsysy name to mt8188-vdosys0
> 
> 
> Change in V2:
> - based on [2] and [3]
> [2] Add MediaTek SoC(vdosys1) support for mt8195
>      - https://patchwork.kernel.org/project/linux-mediatek/list/?series=658416
> [3] Add MediaTek SoC DRM (vdosys1) support for mt8195
>      - https://patchwork.kernel.org/project/linux-mediatek/list/?series=665269
> - Seperate bindings doucment into mmsys/mutex/display 3 parts
> - Remove redundent char in mediatek,gamma.yaml
> - Add another mediatek,mt8188-disp-rdma in mediatek,rdma.yaml
> - Remove io_start variable setting in mtk_drm_drv.c and mtk_mmsys.c
> 
> Nathan Lu (6):
>    dt-bindings: mediatek: modify VDOSYS0 display device tree
>      Documentations for MT8188
>    dt-bindings: mediatek: modify VDOSYS0 mmsys device tree Documentations
>      for MT8188
>    dt-bindings: mediatek: modify VDOSYS0 mutex device tree Documentations
>      for MT8188
>    soc: mediatek: add mtk-mmsys support for mt8188 vdosys0
>    soc: mediatek: add mtk-mutex support for mt8188 vdosys0
>    drm/mediatek: add mediatek-drm of vdosys0 support for mt8188
> 
>   .../bindings/arm/mediatek/mediatek,mmsys.yaml |   1 +
>   .../display/mediatek/mediatek,aal.yaml        |   1 +
>   .../display/mediatek/mediatek,ccorr.yaml      |   1 +
>   .../display/mediatek/mediatek,color.yaml      |   1 +
>   .../display/mediatek/mediatek,dither.yaml     |   1 +
>   .../display/mediatek/mediatek,gamma.yaml      |   1 +
>   .../display/mediatek/mediatek,ovl.yaml        |   1 +
>   .../display/mediatek/mediatek,postmask.yaml   |   1 +
>   .../display/mediatek/mediatek,rdma.yaml       |   4 +
>   .../bindings/soc/mediatek/mediatek,mutex.yaml |   1 +
>   drivers/gpu/drm/mediatek/mtk_drm_drv.c        |  21 +++
>   drivers/soc/mediatek/mt8188-mmsys.h           | 149 ++++++++++++++++++
>   drivers/soc/mediatek/mtk-mmsys.c              |  11 ++
>   drivers/soc/mediatek/mtk-mutex.c              |  53 +++++++
>   14 files changed, 247 insertions(+)
>   create mode 100644 drivers/soc/mediatek/mt8188-mmsys.h
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
