Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B3C4A43C476
	for <lists+linux-stm32@lfdr.de>; Wed, 27 Oct 2021 09:57:35 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 73AE3C5E2A4;
	Wed, 27 Oct 2021 07:57:35 +0000 (UTC)
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 61D4BC5660B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 27 Oct 2021 07:57:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 22D991F43DAD
To: "jason-jh.lin" <jason-jh.lin@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
References: <20211026155911.17651-1-jason-jh.lin@mediatek.com>
 <20211026155911.17651-16-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <7a077be9-10a3-f076-2a3a-f57aacd6d876@collabora.com>
Date: Wed, 27 Oct 2021 09:57:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211026155911.17651-16-jason-jh.lin@mediatek.com>
Content-Language: en-US
Cc: devicetree@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 fshao@chromium.org, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, singo.chang@mediatek.com,
 Yongqiang Niu <yongqiang.niu@mediatek.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, roy-cw.yeh@mediatek.com,
 Fabien Parent <fparent@baylibre.com>, moudy.ho@mediatek.com,
 linux-mediatek@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>,
 hsinyi@chromium.org, nancy.lin@mediatek.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v12 15/16] drm/mediatek: add MERGE support
 for mediatek-drm
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

Il 26/10/21 17:59, jason-jh.lin ha scritto:
> Add MERGE engine file:
> MERGE module is used to merge two slice-per-line inputs
> into one side-by-side output.
> 
> Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>

Acked-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
> rebase on series [1]
> 
> [1] drm/mediatek: add support for mediatek SOC MT8192
> - https://patchwork.kernel.org/project/linux-mediatek/list/?series=529489
> ---
>   drivers/gpu/drm/mediatek/Makefile           |   1 +
>   drivers/gpu/drm/mediatek/mtk_disp_drv.h     |   8 +
>   drivers/gpu/drm/mediatek/mtk_disp_merge.c   | 246 ++++++++++++++++++++
>   drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c |  16 ++
>   drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |   1 +
>   drivers/gpu/drm/mediatek/mtk_drm_drv.c      |   4 +-
>   drivers/gpu/drm/mediatek/mtk_drm_drv.h      |   1 +
>   7 files changed, 276 insertions(+), 1 deletion(-)
>   create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_merge.c
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
