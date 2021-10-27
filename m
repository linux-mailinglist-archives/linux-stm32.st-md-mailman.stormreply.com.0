Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F94643C478
	for <lists+linux-stm32@lfdr.de>; Wed, 27 Oct 2021 09:57:40 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 14C5AC5E2A7;
	Wed, 27 Oct 2021 07:57:40 +0000 (UTC)
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1CDC1C5E2A5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 27 Oct 2021 07:57:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 190771F43DC8
To: "jason-jh.lin" <jason-jh.lin@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
References: <20211026155911.17651-1-jason-jh.lin@mediatek.com>
 <20211026155911.17651-10-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <2a82666d-0ad2-90a6-056a-b1684e2287e0@collabora.com>
Date: Wed, 27 Oct 2021 09:57:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211026155911.17651-10-jason-jh.lin@mediatek.com>
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
Subject: Re: [Linux-stm32] [PATCH v12 09/16] soc: mediatek: add mtk-mmsys
 support for mt8195 vdosys0
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
> Add mt8195 vdosys0 clock driver name and routing table to
> the driver data of mtk-mmsys.
> 
> Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>

Acked-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
> This patch is base on [1]
> [1] soc: mediatek: mmsys: add mt8192 mmsys support
> - https://patchwork.kernel.org/project/linux-mediatek/list/?series=524857
> 
> The vdosys1 impelmentation patch [2]
> [2] soc: mediatek: add mtk-mmsys support for mt8195 vdosys1
> - https://patchwork.kernel.org/project/linux-mediatek/patch/20210906071539.12953-7-nancy.lin@mediatek.com/
> ---
>   drivers/soc/mediatek/mt8195-mmsys.h    | 220 +++++++++++++++++++++++++
>   drivers/soc/mediatek/mtk-mmsys.c       |  11 ++
>   include/linux/soc/mediatek/mtk-mmsys.h |   9 +
>   3 files changed, 240 insertions(+)
>   create mode 100644 drivers/soc/mediatek/mt8195-mmsys.h
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
