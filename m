Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9586D4E8D70
	for <lists+linux-stm32@lfdr.de>; Mon, 28 Mar 2022 07:03:20 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3C308C5C842;
	Mon, 28 Mar 2022 05:03:20 +0000 (UTC)
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B263EC01577
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Mar 2022 05:03:17 +0000 (UTC)
X-UUID: 2b307bab975443a6a66b130480b0a43c-20220328
X-UUID: 2b307bab975443a6a66b130480b0a43c-20220328
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by
 mailgw02.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2051279285; Mon, 28 Mar 2022 13:03:09 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 28 Mar 2022 13:03:07 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 28 Mar 2022 13:03:08 +0800
Message-ID: <a068f2c9b2111f3a7a20da19073ef5fdb7f4a91f.camel@mediatek.com>
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, "Philipp
 Zabel" <p.zabel@pengutronix.de>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>
Date: Mon, 28 Mar 2022 13:03:07 +0800
In-Reply-To: <20220307032859.3275-5-jason-jh.lin@mediatek.com>
References: <20220307032859.3275-1-jason-jh.lin@mediatek.com>
 <20220307032859.3275-5-jason-jh.lin@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
Cc: devicetree@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 fshao@chromium.org, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, singo.chang@mediatek.com,
 Fabien Parent <fparent@baylibre.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, roy-cw.yeh@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com, CK Hu <ck.hu@mediatek.com>,
 moudy.ho@mediatek.com, linux-mediatek@lists.infradead.org,
 Daniel Vetter <daniel@ffwll.ch>, hsinyi@chromium.org,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>, nancy.lin@mediatek.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v16 4/8] soc: mediatek: add mtk-mmsys
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Hi CK,

Thanks for the reviews.

On Mon, 2022-03-07 at 11:28 +0800, jason-jh.lin wrote:
> Add mt8195 vdosys0 clock driver name and routing table to
> the driver data of mtk-mmsys.
> 
> Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
> Acked-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>
> ---
> Impelmentation patch of vdosys1 can be refered to [1]
> 
> [1] soc: mediatek: add mtk-mmsys support for mt8195 vdosys1
> ---
>  drivers/soc/mediatek/mt8195-mmsys.h    | 130
> +++++++++++++++++++++++++
>  drivers/soc/mediatek/mtk-mmsys.c       |  11 +++
>  include/linux/soc/mediatek/mtk-mmsys.h |   9 ++
>  3 files changed, 150 insertions(+)
>  create mode 100644 drivers/soc/mediatek/mt8195-mmsys.h
> 
> diff --git a/drivers/soc/mediatek/mt8195-mmsys.h
> b/drivers/soc/mediatek/mt8195-mmsys.h
> new file mode 100644
> index 000000000000..24a3afe23bc8
> --- /dev/null
> +++ b/drivers/soc/mediatek/mt8195-mmsys.h
> @@ -0,0 +1,130 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#ifndef __SOC_MEDIATEK_MT8195_MMSYS_H
> +#define __SOC_MEDIATEK_MT8195_MMSYS_H
> +
> +#define MT8195_VDO0_OVL_MOUT_EN					
> 0xf14
> +#define MT8195_MOUT_DISP_OVL0_TO_DISP_RDMA0			BIT(0)
> +#define MT8195_MOUT_DISP_OVL0_TO_DISP_WDMA0			BIT(1)
>  
> Useless, so remove.
> 
> +#define MT8195_MOUT_DISP_OVL0_TO_DISP_OVL1			BIT(2)

> Ditto.Useless, so remove.

> Regards,
> CK

Although these definitions are not used, they represent the
functionality provided by this register.

I think we can show that we have these capabilities by defining them.

Can we keep these definitions?

Regards,
Jason-JH.Lin

> +#define MT8195_MOUT_DISP_OVL1_TO_DISP_RDMA1			BIT(4)
> +#define MT8195_MOUT_DISP_OVL1_TO_DISP_WDMA1			BIT(5)
> +#define MT8195_MOUT_DISP_OVL1_TO_DISP_OVL0			BIT(6)


[snip]

-- 
Jason-JH Lin <jason-jh.lin@mediatek.com>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
