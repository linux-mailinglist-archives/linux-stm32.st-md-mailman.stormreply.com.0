Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E6B2487544
	for <lists+linux-stm32@lfdr.de>; Fri,  7 Jan 2022 11:14:38 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DF5DFC60470;
	Fri,  7 Jan 2022 10:14:37 +0000 (UTC)
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EDD44C60460
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  7 Jan 2022 10:14:34 +0000 (UTC)
X-UUID: 6e2fedbe09f247149fd8eb5b66f92ce2-20220107
X-UUID: 6e2fedbe09f247149fd8eb5b66f92ce2-20220107
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw02.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1181225386; Fri, 07 Jan 2022 18:14:28 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Fri, 7 Jan 2022 18:14:26 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 7 Jan 2022 18:14:26 +0800
From: jason-jh.lin <jason-jh.lin@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, "Philipp
 Zabel" <p.zabel@pengutronix.de>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>
Date: Fri, 7 Jan 2022 18:14:13 +0800
Message-ID: <20220107101425.6917-1-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
Cc: devicetree@vger.kernel.org, Jitao shi <jitao.shi@mediatek.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, fshao@chromium.org,
 David Airlie <airlied@linux.ie>, "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 singo.chang@mediatek.com, Fabien Parent <fparent@baylibre.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, roy-cw.yeh@mediatek.com,
 linux-kernel@vger.kernel.org, CK
 Hu <ck.hu@mediatek.com>, moudy.ho@mediatek.com,
 linux-mediatek@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>,
 hsinyi@chromium.org, Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 nancy.lin@mediatek.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v14 00/12] Add Mediatek Soc DRM (vdosys0)
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

Change in v14:
- rebase on mediatek-drm-next-5.17
- rebase on "Add mmsys and mutex support for MDP" series
  https://patchwork.kernel.org/project/linux-mediatek/list/?series=602528
- rebase on "media: mediatek: support mdp3 on mt8183 platform" series
  https://patchwork.kernel.org/project/linux-mediatek/list/?series=602834

Change in v13:
- remove dts patch
- rebase on kernel-5.16-rc1
- rebase on mediatek-drm-next

Change in v12:
- add clock-names property to merge yaml
- using BIT(nr) macro to define the settings of mmsys routing table
- fix clk_get and clk_prepare_enable error handling issue

Change in v11:
- rebase on kernel-5.15-rc1
- change mbox label to gce0 for dts node of vdosys0
- change ovl compatibale to mt8192 to set smi_id_en=true in driver data
- move common module from display folder to common folder,
  such as AAL, COCLOR, CCORR and MUTEX

Change in v10:
- rebase on "drm/mediatek: add support for mediatek SOC MT8192" series
  https://patchwork.kernel.org/project/linux-mediatek/list/?series=529489
- rebase on "soc: mediatek: mmsys: add mt8192 mmsys support" series
  https://patchwork.kernel.org/project/linux-mediatek/list/?series=524857
- fix some typo and "mediatek" start with capital in every dt-bindings
- move mutex yaml from dfisplay folder to soc folder
- separate merge additional propoerties to an individual dt-bindings patch

Change in v9:
- separate power and gce properties of mmsys into another dt-binding patch
- rebase on "Separate aal module" series
  https://patchwork.kernel.org/project/linux-mediatek/list/?series=516463
- keep mtk_ddp_clk_enable/disable in the same place
- change mtk_dsc_start config register to mtk_drm_ddp_write_mask
- remove the 0 setting of merge fifo config function
- add CCORR driver data for mt8195

Change in v8:
- add DP_INTF0 mux into mmsys routing table
- add DP_INTF0 mutex mod and enum into add/remove comp function
- remove bypass DSC enum in mtk_ddp_comp_init

Change in v7:
- add dt=binding of mmsys and disp path into this series
- separate th modidfication of alphabetic order, remove unused define and
  rename the define of register offset to individual patch
- add comment for MERGE ultra and preultra setting

Change in v6:
- adjust alphabetic order for mediatek-drm
- move the patch that add mt8195 support for mediatek-drm as
  the lastest patch
- add MERGE define for const varriable 

Change in v5:
- add power-domain property into vdosys0 and vdosys1 dts node.
- add MT8195 prifix and remove unused VDO1 define in mt8195-mmsys.h

Change in v4:
- extract dt-binding patches to another patch series
  https://patchwork.kernel.org/project/linux-mediatek/list/?series=519597
- squash DSC module into mtk_drm_ddp_comp.c
- add coment and simplify MERGE config function

Change in v3:
- change mmsys and display dt-bindings document from txt to yaml
- add MERGE additional description in display dt-bindings document
- fix mboxes-cells number of vdosys0 node in dts
- drop mutex eof convert define
- remove pm_runtime apis in DSC and MERGE
- change DSC and MERGE enum to alphabetic order

Change in v2:
- add DSC yaml file
- add mt8195 drm driver porting parts in to one patch
- remove useless define, variable, structure member and function
- simplify DSC and MERGE file and switch threre order

jason-jh.lin (12):
  dt-bindings: arm: mediatek: mmsys: add power and gce properties
  dt-bindings: arm: mediatek: mmsys: add mt8195 SoC binding
  dt-bindings: display: mediatek: disp: split each block to individual
    yaml
  dt-bindings: display: mediatek: dsc: add yaml for mt8195 SoC binding
  dt-bindings: display: mediatek: merge: add additional prop for mt8195
  dt-bindings: display: mediatek: add mt8195 SoC binding for vdosys0
  dt-bindings: arm: mediatek: move out common module from display folder
  soc: mediatek: add mtk-mmsys support for mt8195 vdosys0
  soc: mediatek: add mtk-mutex support for mt8195 vdosys0
  drm/mediatek: add DSC support for mediatek-drm
  drm/mediatek: add MERGE support for mediatek-drm
  drm/mediatek: add mediatek-drm of vdosys0 support for mt8195

 .../bindings/arm/mediatek/mediatek,mmsys.yaml |  32 ++-
 .../display/mediatek/mediatek,disp.txt        | 219 ----------------
 .../display/mediatek/mediatek,dither.yaml     |  76 ++++++
 .../display/mediatek/mediatek,dsc.yaml        |  71 +++++
 .../display/mediatek/mediatek,gamma.yaml      |  77 ++++++
 .../display/mediatek/mediatek,merge.yaml      | 106 ++++++++
 .../display/mediatek/mediatek,od.yaml         |  53 ++++
 .../display/mediatek/mediatek,ovl-2l.yaml     |  88 +++++++
 .../display/mediatek/mediatek,ovl.yaml        | 103 ++++++++
 .../display/mediatek/mediatek,postmask.yaml   |  69 +++++
 .../display/mediatek/mediatek,rdma.yaml       | 117 +++++++++
 .../display/mediatek/mediatek,split.yaml      |  58 +++++
 .../display/mediatek/mediatek,ufoe.yaml       |  61 +++++
 .../bindings/soc/mediatek/mediatek,aal.yaml   |  72 +++++
 .../bindings/soc/mediatek/mediatek,ccorr.yaml |  46 +++-
 .../bindings/soc/mediatek/mediatek,color.yaml |  81 ++++++
 .../bindings/soc/mediatek/mediatek,mutex.yaml |  77 ++++++
 .../bindings/soc/mediatek/mediatek,wdma.yaml  |  47 +++-
 drivers/gpu/drm/mediatek/Makefile             |   1 +
 drivers/gpu/drm/mediatek/mtk_disp_drv.h       |   8 +
 drivers/gpu/drm/mediatek/mtk_disp_merge.c     | 246 ++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c      |   6 +
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c   |  63 +++++
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h   |   2 +
 drivers/gpu/drm/mediatek/mtk_drm_drv.c        |  32 ++-
 drivers/gpu/drm/mediatek/mtk_drm_drv.h        |   1 +
 drivers/soc/mediatek/mt8195-mmsys.h           | 220 ++++++++++++++++
 drivers/soc/mediatek/mtk-mmsys.c              |  11 +
 drivers/soc/mediatek/mtk-mutex.c              |  95 ++++++-
 include/linux/soc/mediatek/mtk-mmsys.h        |   9 +
 30 files changed, 1914 insertions(+), 233 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,dsc.yaml
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,merge.yaml
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,od.yaml
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,ovl-2l.yaml
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,postmask.yaml
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,split.yaml
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,ufoe.yaml
 create mode 100644 Documentation/devicetree/bindings/soc/mediatek/mediatek,aal.yaml
 create mode 100644 Documentation/devicetree/bindings/soc/mediatek/mediatek,color.yaml
 create mode 100644 Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml
 create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_merge.c
 create mode 100644 drivers/soc/mediatek/mt8195-mmsys.h

-- 
2.18.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
