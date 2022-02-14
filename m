Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ED02E4B48F5
	for <lists+linux-stm32@lfdr.de>; Mon, 14 Feb 2022 11:13:47 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B62F0C5F1F2;
	Mon, 14 Feb 2022 10:13:47 +0000 (UTC)
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0DD31C5A4FE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 14 Feb 2022 10:13:45 +0000 (UTC)
X-UUID: a02423ef2b37497a8f891e820ec547c7-20220214
X-UUID: a02423ef2b37497a8f891e820ec547c7-20220214
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw02.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 578940322; Mon, 14 Feb 2022 18:13:40 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 14 Feb 2022 18:13:39 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 14 Feb 2022 18:13:39 +0800
Message-ID: <c73eefcbf85cbb1eb9d1278e675608f8d9775693.camel@mediatek.com>
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, "Philipp
 Zabel" <p.zabel@pengutronix.de>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>
Date: Mon, 14 Feb 2022 18:13:39 +0800
In-Reply-To: <20220126071932.32615-1-jason-jh.lin@mediatek.com>
References: <20220126071932.32615-1-jason-jh.lin@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
Cc: devicetree@vger.kernel.org, Jitao shi <jitao.shi@mediatek.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, fshao@chromium.org,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 singo.chang@mediatek.com, Fabien Parent <fparent@baylibre.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, roy-cw.yeh@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com, CK Hu <ck.hu@mediatek.com>,
 moudy.ho@mediatek.com, linux-mediatek@lists.infradead.org,
 Daniel Vetter <daniel@ffwll.ch>, hsinyi@chromium.org,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>, nancy.lin@mediatek.com,
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Hello Matthias,

The DRM parts are all reviewed by Chun-Kuang.
Can you spare some time to give us some suggestion for mmsys parts?

Or do you think we should separate the driver of mmsys related patches
to another series and resend again?
Would it be better to combine mmsys related patches from vdosys0 [1]
and vdosys1 [2] series?

e.g.
[v1,0/7] soc: mediatek: mmsys: add mt8195 mmsys support 
[v1,1/7] dt-bindings: arm: mediatek: mmsys: add power and gce
properties
[v1,2/7] dt-bindings: arm: mediatek: mmsys: add mt8195 SoC binding
[v1,3/7] dt-bindings: reset: mt8195: add vdosys1 reset control bit
[v1,4/7] soc: mediatek: mmsys: add mtk-mmsys support for mt8195 vdosys0
[v1,5/7] soc: mediatek: mmsys: add mtk-mmsys support for mt8195 vdosys1
[v1,6/7] soc: mediatek: mmsys: add mtk-mmsys config API for mt8195
vdosys1
[v1,7/7] soc: mediatek: mmsys: modify reset controller for MT8195
vdosys1

---
[1] Add Mediatek Soc DRM (vdosys0) support for mt8195
- 
https://patchwork.kernel.org/project/linux-mediatek/list/?series=608548
[2] Add MediaTek SoC DRM (vdosys1) support for mt8195
- 
https://patchwork.kernel.org/project/linux-mediatek/list/?series=604065
---

Regards,
Jason-JH.Lin


On Wed, 2022-01-26 at 15:19 +0800, jason-jh.lin wrote:
> Change in v15:
> - remove mt8195-mmsys.h comment for mux settings
> - define the mask macro to replace using value as mask
>   to fix zero mask problem
> - add EOF setting comment for MUTEX sof register
> 
> Change in v14:
> - rebase on mediatek-drm-next-5.17
> - rebase on "Add mmsys and mutex support for MDP" series
>   
> https://patchwork.kernel.org/project/linux-mediatek/list/?series=602528
> - rebase on "media: mediatek: support mdp3 on mt8183 platform" series
>   
> https://patchwork.kernel.org/project/linux-mediatek/list/?series=602834
> 
[snip]
...
> 
> jason-jh.lin (12):
>   dt-bindings: arm: mediatek: mmsys: add power and gce properties
>   dt-bindings: arm: mediatek: mmsys: add mt8195 SoC binding
>   dt-bindings: display: mediatek: disp: split each block to
> individual
>     yaml
>   dt-bindings: display: mediatek: dsc: add yaml for mt8195 SoC
> binding
>   dt-bindings: display: mediatek: merge: add additional prop for
> mt8195
>   dt-bindings: display: mediatek: add mt8195 SoC binding for vdosys0
>   dt-bindings: arm: mediatek: move out common module from display
> folder
>   soc: mediatek: add mtk-mmsys support for mt8195 vdosys0
>   soc: mediatek: add mtk-mutex support for mt8195 vdosys0
>   drm/mediatek: add DSC support for mediatek-drm
>   drm/mediatek: add MERGE support for mediatek-drm
>   drm/mediatek: add mediatek-drm of vdosys0 support for mt8195
> 
>  .../bindings/arm/mediatek/mediatek,mmsys.yaml |  32 ++-
>  .../display/mediatek/mediatek,disp.txt        | 219 ----------------
>  .../display/mediatek/mediatek,dither.yaml     |  76 ++++++
>  .../display/mediatek/mediatek,dsc.yaml        |  71 +++++
>  .../display/mediatek/mediatek,gamma.yaml      |  77 ++++++
>  .../display/mediatek/mediatek,merge.yaml      | 106 ++++++++
>  .../display/mediatek/mediatek,od.yaml         |  53 ++++
>  .../display/mediatek/mediatek,ovl-2l.yaml     |  88 +++++++
>  .../display/mediatek/mediatek,ovl.yaml        | 103 ++++++++
>  .../display/mediatek/mediatek,postmask.yaml   |  69 +++++
>  .../display/mediatek/mediatek,rdma.yaml       | 117 +++++++++
>  .../display/mediatek/mediatek,split.yaml      |  58 +++++
>  .../display/mediatek/mediatek,ufoe.yaml       |  61 +++++
>  .../bindings/soc/mediatek/mediatek,aal.yaml   |  72 +++++
>  .../bindings/soc/mediatek/mediatek,ccorr.yaml |  46 +++-
>  .../bindings/soc/mediatek/mediatek,color.yaml |  81 ++++++
>  .../bindings/soc/mediatek/mediatek,mutex.yaml |  77 ++++++
>  .../bindings/soc/mediatek/mediatek,wdma.yaml  |  47 +++-
>  drivers/gpu/drm/mediatek/Makefile             |   1 +
>  drivers/gpu/drm/mediatek/mtk_disp_drv.h       |   8 +
>  drivers/gpu/drm/mediatek/mtk_disp_merge.c     | 246
> ++++++++++++++++++
>  drivers/gpu/drm/mediatek/mtk_disp_rdma.c      |   6 +
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c   |  63 +++++
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h   |   2 +
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c        |  32 ++-
>  drivers/gpu/drm/mediatek/mtk_drm_drv.h        |   1 +
>  drivers/soc/mediatek/mt8195-mmsys.h           | 130 +++++++++
>  drivers/soc/mediatek/mtk-mmsys.c              |  11 +
>  drivers/soc/mediatek/mtk-mutex.c              | 103 +++++++-
>  include/linux/soc/mediatek/mtk-mmsys.h        |   9 +
>  30 files changed, 1832 insertions(+), 233 deletions(-)
>  delete mode 100644
> Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
>  create mode 100644
> Documentation/devicetree/bindings/display/mediatek/mediatek,dither.ya
> ml
>  create mode 100644
> Documentation/devicetree/bindings/display/mediatek/mediatek,dsc.yaml
>  create mode 100644
> Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yam
> l
>  create mode 100644
> Documentation/devicetree/bindings/display/mediatek/mediatek,merge.yam
> l
>  create mode 100644
> Documentation/devicetree/bindings/display/mediatek/mediatek,od.yaml
>  create mode 100644
> Documentation/devicetree/bindings/display/mediatek/mediatek,ovl-
> 2l.yaml
>  create mode 100644
> Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
>  create mode 100644
> Documentation/devicetree/bindings/display/mediatek/mediatek,postmask.
> yaml
>  create mode 100644
> Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml
>  create mode 100644
> Documentation/devicetree/bindings/display/mediatek/mediatek,split.yam
> l
>  create mode 100644
> Documentation/devicetree/bindings/display/mediatek/mediatek,ufoe.yaml
>  create mode 100644
> Documentation/devicetree/bindings/soc/mediatek/mediatek,aal.yaml
>  create mode 100644
> Documentation/devicetree/bindings/soc/mediatek/mediatek,color.yaml
>  create mode 100644
> Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml
>  create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_merge.c
>  create mode 100644 drivers/soc/mediatek/mt8195-mmsys.h
> 
-- 
Jason-JH Lin <jason-jh.lin@mediatek.com>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
