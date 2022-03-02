Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DD2D44CA5F1
	for <lists+linux-stm32@lfdr.de>; Wed,  2 Mar 2022 14:26:15 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 87B32C5F1EF;
	Wed,  2 Mar 2022 13:26:15 +0000 (UTC)
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8DD08C5F1D7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  2 Mar 2022 13:26:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id E9A591F44E0D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1646227574;
 bh=vIbI9aNzOb5Yz1Pb7B8zVtgYkA/gIFiYF+AyCtFN6y8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=mO/NL1EeZ7vpHaJLT+lciSlTguGF2C81AFnzhEdgFH6TC5y/Brb9oJ6+DxM9vmujM
 FELXibdgQSP7F7AtjgHoJDL3a4XzhsaWXLM0hEj0TqZsGocHvvvkbUH3sVZpNsS0x+
 za59oWN6X7M+SQN6r4hKc/wKjXYFI3u8I+wMcLcUyguRhVOLZIpg8dG0qBTnXDepfb
 Bb9vGfTK0Y28bV1ElQ5DZ5sdEh/ZV7RkRBvxL+zqLui/ITL7YP9aJVeJm8AHIUgL6s
 pKd95O0mBomkxpuTZEeNb4nwOVKA3E27bdgZwe0xPw0qyfPJLt7r6oThxqXyF1On7u
 DRtsfAzLL1KMA==
Message-ID: <f006d46c-8060-3bee-b589-5e39c1ebf768@collabora.com>
Date: Wed, 2 Mar 2022 14:26:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Content-Language: en-US
To: Jason-JH Lin <jason-jh.lin@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
References: <20220126071932.32615-1-jason-jh.lin@mediatek.com>
 <c73eefcbf85cbb1eb9d1278e675608f8d9775693.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <c73eefcbf85cbb1eb9d1278e675608f8d9775693.camel@mediatek.com>
Cc: devicetree@vger.kernel.org, Jitao shi <jitao.shi@mediatek.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, fshao@chromium.org,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 singo.chang@mediatek.com, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 roy-cw.yeh@mediatek.com, Project_Global_Chrome_Upstream_Group@mediatek.com,
 Fabien Parent <fparent@baylibre.com>, moudy.ho@mediatek.com,
 linux-mediatek@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>,
 hsinyi@chromium.org, CK Hu <ck.hu@mediatek.com>, nancy.lin@mediatek.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v15 00/12] Add Mediatek Soc DRM (vdosys0)
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Il 14/02/22 11:13, Jason-JH Lin ha scritto:
> Hello Matthias,
> 
> The DRM parts are all reviewed by Chun-Kuang.
> Can you spare some time to give us some suggestion for mmsys parts?
> 
> Or do you think we should separate the driver of mmsys related patches
> to another series and resend again?
> Would it be better to combine mmsys related patches from vdosys0 [1]
> and vdosys1 [2] series?
> 
> e.g.
> [v1,0/7] soc: mediatek: mmsys: add mt8195 mmsys support
> [v1,1/7] dt-bindings: arm: mediatek: mmsys: add power and gce
> properties
> [v1,2/7] dt-bindings: arm: mediatek: mmsys: add mt8195 SoC binding
> [v1,3/7] dt-bindings: reset: mt8195: add vdosys1 reset control bit
> [v1,4/7] soc: mediatek: mmsys: add mtk-mmsys support for mt8195 vdosys0
> [v1,5/7] soc: mediatek: mmsys: add mtk-mmsys support for mt8195 vdosys1
> [v1,6/7] soc: mediatek: mmsys: add mtk-mmsys config API for mt8195
> vdosys1
> [v1,7/7] soc: mediatek: mmsys: modify reset controller for MT8195
> vdosys1
> 
> ---
> [1] Add Mediatek Soc DRM (vdosys0) support for mt8195
> -
> https://patchwork.kernel.org/project/linux-mediatek/list/?series=608548
> [2] Add MediaTek SoC DRM (vdosys1) support for mt8195
> -
> https://patchwork.kernel.org/project/linux-mediatek/list/?series=604065
> ---
> 
> Regards,
> Jason-JH.Lin
> 

Hello everyone,

I think that all the drm/mediatek and soc/mediatek patches in this series
are safe and ready (and also tested for regressions on older SoCs).

Feel free to pick them in your trees.

Cheers,
Angelo


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
