Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 284AF4CB5DC
	for <lists+linux-stm32@lfdr.de>; Thu,  3 Mar 2022 05:25:33 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CEAA8C5F1EE;
	Thu,  3 Mar 2022 04:25:32 +0000 (UTC)
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 65E04C5F1D7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  3 Mar 2022 04:25:31 +0000 (UTC)
X-UUID: 41a62b34967343a9a14196e1b7e3a13b-20220303
X-UUID: 41a62b34967343a9a14196e1b7e3a13b-20220303
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2019322865; Thu, 03 Mar 2022 12:25:24 +0800
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 3 Mar 2022 12:25:22 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 3 Mar 2022 12:25:22 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 3 Mar 2022 12:25:22 +0800
Message-ID: <c103927d7dbc3217431c83dc22a44c656c561228.camel@mediatek.com>
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>
Date: Thu, 3 Mar 2022 12:25:22 +0800
In-Reply-To: <CAL_Jsq+6k5EqouAO2Xm=GpBz3Pi-wfB-ixGwfyC+Y+qOrjUFTg@mail.gmail.com>
References: <20220126071932.32615-1-jason-jh.lin@mediatek.com>
 <CAL_Jsq+6k5EqouAO2Xm=GpBz3Pi-wfB-ixGwfyC+Y+qOrjUFTg@mail.gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
Cc: Fei Shao <fshao@chromium.org>, David Airlie <airlied@linux.ie>,
 singo.chang@mediatek.com, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Fabien Parent <fparent@baylibre.com>, devicetree@vger.kernel.org, "moderated
 list:ARM/STM32 ARCHITECTURE" <linux-stm32@st-md-mailman.stormreply.com>,
 "roy-cw.yeh" <roy-cw.yeh@mediatek.com>, CK Hu <ck.hu@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Jitao shi <jitao.shi@mediatek.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, nancy.lin@mediatek.com,
 "moderated
 list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, Hsin-Yi
 Wang <hsinyi@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Moudy Ho <moudy.ho@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>
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

Hi Rob,

Thanks for the reviews.

On Wed, 2022-03-02 at 17:50 -0600, Rob Herring wrote:
> On Wed, Jan 26, 2022 at 1:19 AM jason-jh.lin <
> jason-jh.lin@mediatek.com> wrote:
> > 

[snip]

> > jason-jh.lin (12):
> >   dt-bindings: arm: mediatek: mmsys: add power and gce properties
> >   dt-bindings: arm: mediatek: mmsys: add mt8195 SoC binding
> >   dt-bindings: display: mediatek: disp: split each block to
> > individual
> >     yaml
> >   dt-bindings: display: mediatek: dsc: add yaml for mt8195 SoC
> > binding
> >   dt-bindings: display: mediatek: merge: add additional prop for
> > mt8195
> >   dt-bindings: display: mediatek: add mt8195 SoC binding for
> > vdosys0
> >   dt-bindings: arm: mediatek: move out common module from display
> > folder
> >   soc: mediatek: add mtk-mmsys support for mt8195 vdosys0
> >   soc: mediatek: add mtk-mutex support for mt8195 vdosys0
> >   drm/mediatek: add DSC support for mediatek-drm
> >   drm/mediatek: add MERGE support for mediatek-drm
> >   drm/mediatek: add mediatek-drm of vdosys0 support for mt8195
> > 
> >  .../bindings/arm/mediatek/mediatek,mmsys.yaml |  32 ++-
> >  .../display/mediatek/mediatek,disp.txt        | 219 --------------
> > --
> >  .../display/mediatek/mediatek,dither.yaml     |  76 ++++++
> >  .../display/mediatek/mediatek,dsc.yaml        |  71 +++++
> >  .../display/mediatek/mediatek,gamma.yaml      |  77 ++++++
> >  .../display/mediatek/mediatek,merge.yaml      | 106 ++++++++
> >  .../display/mediatek/mediatek,od.yaml         |  53 ++++
> >  .../display/mediatek/mediatek,ovl-2l.yaml     |  88 +++++++
> >  .../display/mediatek/mediatek,ovl.yaml        | 103 ++++++++
> >  .../display/mediatek/mediatek,postmask.yaml   |  69 +++++
> >  .../display/mediatek/mediatek,rdma.yaml       | 117 +++++++++
> >  .../display/mediatek/mediatek,split.yaml      |  58 +++++
> >  .../display/mediatek/mediatek,ufoe.yaml       |  61 +++++
> >  .../bindings/soc/mediatek/mediatek,aal.yaml   |  72 +++++
> >  .../bindings/soc/mediatek/mediatek,ccorr.yaml |  46 +++-
> >  .../bindings/soc/mediatek/mediatek,color.yaml |  81 ++++++
> >  .../bindings/soc/mediatek/mediatek,mutex.yaml |  77 ++++++
> >  .../bindings/soc/mediatek/mediatek,wdma.yaml  |  47 +++-
> >  drivers/gpu/drm/mediatek/Makefile             |   1 +
> >  drivers/gpu/drm/mediatek/mtk_disp_drv.h       |   8 +
> >  drivers/gpu/drm/mediatek/mtk_disp_merge.c     | 246
> > ++++++++++++++++++
> >  drivers/gpu/drm/mediatek/mtk_disp_rdma.c      |   6 +
> >  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c   |  63 +++++
> >  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h   |   2 +
> >  drivers/gpu/drm/mediatek/mtk_drm_drv.c        |  32 ++-
> >  drivers/gpu/drm/mediatek/mtk_drm_drv.h        |   1 +
> >  drivers/soc/mediatek/mt8195-mmsys.h           | 130 +++++++++
> >  drivers/soc/mediatek/mtk-mmsys.c              |  11 +
> >  drivers/soc/mediatek/mtk-mutex.c              | 103 +++++++-
> >  include/linux/soc/mediatek/mtk-mmsys.h        |   9 +
> >  30 files changed, 1832 insertions(+), 233 deletions(-)
> >  delete mode 100644
> > Documentation/devicetree/bindings/display/mediatek/mediatek,disp.tx
> > t
> >  create mode 100644
> > Documentation/devicetree/bindings/display/mediatek/mediatek,dither.
> > yaml
> >  create mode 100644
> > Documentation/devicetree/bindings/display/mediatek/mediatek,dsc.yam
> > l
> >  create mode 100644
> > Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.y
> > aml
> >  create mode 100644
> > Documentation/devicetree/bindings/display/mediatek/mediatek,merge.y
> > aml
> >  create mode 100644
> > Documentation/devicetree/bindings/display/mediatek/mediatek,od.yaml
> >  create mode 100644
> > Documentation/devicetree/bindings/display/mediatek/mediatek,ovl-
> > 2l.yaml
> >  create mode 100644
> > Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yam
> > l
> >  create mode 100644
> > Documentation/devicetree/bindings/display/mediatek/mediatek,postmas
> > k.yaml
> >  create mode 100644
> > Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.ya
> > ml
> >  create mode 100644
> > Documentation/devicetree/bindings/display/mediatek/mediatek,split.y
> > aml
> >  create mode 100644
> > Documentation/devicetree/bindings/display/mediatek/mediatek,ufoe.ya
> > ml
> >  create mode 100644
> > Documentation/devicetree/bindings/soc/mediatek/mediatek,aal.yaml
> >  create mode 100644
> > Documentation/devicetree/bindings/soc/mediatek/mediatek,color.yaml
> >  create mode 100644
> > Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml
> >  create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_merge.c
> >  create mode 100644 drivers/soc/mediatek/mt8195-mmsys.h
> 
> Looks like this is in linux-next and now:
> 
> Error:
> Documentation/devicetree/bindings/display/mediatek/mediatek,aal.examp
> le.dts:27.27-28
> syntax error
> FATAL ERROR: Unable to parse input tree
> make[1]: *** [scripts/Makefile.lib:386:
> Documentation/devicetree/bindings/display/mediatek/mediatek,aal.examp
> le.dt.yaml]
> Error 1
> Error:
> Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.exam
> ple.dts:27.27-28
> syntax error
> FATAL ERROR: Unable to parse input tree
> make[1]: *** [scripts/Makefile.lib:386:
> Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.exam
> ple.dt.yaml]
> Error 1
> Error:
> Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.exa
> mple.dts:27.27-28
> syntax error
> FATAL ERROR: Unable to parse input tree
> make[1]: *** [scripts/Makefile.lib:386:
> Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.exa
> mple.dt.yaml]
> Error 1
> Error:
> Documentation/devicetree/bindings/display/mediatek/mediatek,dither.ex
> ample.dts:27.27-28
> syntax error
> FATAL ERROR: Unable to parse input tree
> make[1]: *** [scripts/Makefile.lib:386:
> Documentation/devicetree/bindings/display/mediatek/mediatek,dither.ex
> ample.dt.yaml]
> Error 1
> Error:
> Documentation/devicetree/bindings/display/mediatek/mediatek,postmask.
> example.dts:27.27-28
> syntax error
> FATAL ERROR: Unable to parse input tree
> make[1]: *** [scripts/Makefile.lib:386:
> Documentation/devicetree/bindings/display/mediatek/mediatek,postmask.
> example.dt.yaml]
> Error 1
> Error:
> Documentation/devicetree/bindings/display/mediatek/mediatek,ufoe.exam
> ple.dts:27.27-28
> syntax error
> FATAL ERROR: Unable to parse input tree
> make[1]: *** [scripts/Makefile.lib:386:
> Documentation/devicetree/bindings/display/mediatek/mediatek,ufoe.exam
> ple.dt.yaml]
> Error 1
> Error:
> Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.exa
> mple.dts:27.27-28
> syntax error
> FATAL ERROR: Unable to parse input tree
> make[1]: *** [scripts/Makefile.lib:386:
> Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.exa
> mple.dt.yaml]
> Error 1
> Error:
> Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.exam
> ple.dts:27.27-28
> syntax error
> FATAL ERROR: Unable to parse input tree
> make[1]: *** [scripts/Makefile.lib:386:
> Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.exam
> ple.dt.yaml]
> Error 1
> Error:
> Documentation/devicetree/bindings/display/mediatek/mediatek,od.exampl
> e.dts:24.30-31
> syntax error
> FATAL ERROR: Unable to parse input tree
> make[1]: *** [scripts/Makefile.lib:386:
> Documentation/devicetree/bindings/display/mediatek/mediatek,od.exampl
> e.dt.yaml]
> Error 1
> Error:
> Documentation/devicetree/bindings/display/mediatek/mediatek,color.exa
> mple.dts:27.27-28
> syntax error
> FATAL ERROR: Unable to parse input tree
> make[1]: *** [scripts/Makefile.lib:386:
> Documentation/devicetree/bindings/display/mediatek/mediatek,color.exa
> mple.dt.yaml]
> Error 1
> Error:
> Documentation/devicetree/bindings/display/mediatek/mediatek,ethdr.exa
> mple.dts:35.50-51
> syntax error
> FATAL ERROR: Unable to parse input tree
> make[1]: *** [scripts/Makefile.lib:386:
> Documentation/devicetree/bindings/display/mediatek/mediatek,ethdr.exa
> mple.dt.yaml]
> Error 1
> Error:
> Documentation/devicetree/bindings/display/mediatek/mediatek,split.exa
> mple.dts:24.35-36
> syntax error
> FATAL ERROR: Unable to parse input tree
> make[1]: *** [scripts/Makefile.lib:386:
> Documentation/devicetree/bindings/display/mediatek/mediatek,split.exa
> mple.dt.yaml]
> Error 1
> Error:
> Documentation/devicetree/bindings/display/mediatek/mediatek,merge.exa
> mple.dts:27.35-36
> syntax error
> FATAL ERROR: Unable to parse input tree
> make[1]: *** [scripts/Makefile.lib:386:
> Documentation/devicetree/bindings/display/mediatek/mediatek,merge.exa
> mple.dt.yaml]
> Error 1
> Error:
> Documentation/devicetree/bindings/display/mediatek/mediatek,mutex.exa
> mple.dts:27.27-28
> syntax error
> FATAL ERROR: Unable to parse input tree
> make[1]: *** [scripts/Makefile.lib:386:
> Documentation/devicetree/bindings/display/mediatek/mediatek,mutex.exa
> mple.dt.yaml]
> Error 1
> Error:
> Documentation/devicetree/bindings/display/mediatek/mediatek,dsc.examp
> le.dts:27.27-28
> syntax error
> FATAL ERROR: Unable to parse input tree
> make[1]: *** [scripts/Makefile.lib:386:
> Documentation/devicetree/bindings/display/mediatek/mediatek,dsc.examp
> le.dt.yaml]
> Error 1
> Error:
> Documentation/devicetree/bindings/display/mediatek/mediatek,ovl-
> 2l.example.dts:27.27-28
> syntax error
> FATAL ERROR: Unable to parse input tree
> make[1]: *** [scripts/Makefile.lib:386:
> Documentation/devicetree/bindings/display/mediatek/mediatek,ovl-
> 2l.example.dt.yaml]
> Error 1
> Error:
> Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.examp
> le.dts:27.27-28
> syntax error
> FATAL ERROR: Unable to parse input tree
> make[1]: *** [scripts/Makefile.lib:386:
> Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.examp
> le.dt.yaml]
> Error 1
> 
> Please fix 'make dt_binding_check'.
> 
> Rob
-- 

I'll fix it at the next version.

Jason-JH Lin <jason-jh.lin@mediatek.com>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
