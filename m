Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ED774CE667
	for <lists+linux-stm32@lfdr.de>; Sat,  5 Mar 2022 19:35:08 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 20D60C60493;
	Sat,  5 Mar 2022 18:35:08 +0000 (UTC)
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 54C4CC6046D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  5 Mar 2022 18:35:05 +0000 (UTC)
X-UUID: f4bb02b4348442a490919c7c3bc193f3-20220306
X-UUID: f4bb02b4348442a490919c7c3bc193f3-20220306
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw02.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1204001000; Sun, 06 Mar 2022 02:34:58 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 6 Mar 2022 02:34:57 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sun, 6 Mar 2022 02:34:57 +0800
Message-ID: <84e2bb5d7047fc1291d765131ce3f6b265a5304e.camel@mediatek.com>
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 <chunkuang.hu@kernel.org>
Date: Sun, 6 Mar 2022 02:34:57 +0800
In-Reply-To: <20220304095458.12409-4-angelogioacchino.delregno@collabora.com>
References: <20220304095458.12409-1-angelogioacchino.delregno@collabora.com>
 <20220304095458.12409-4-angelogioacchino.delregno@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
Cc: devicetree@vger.kernel.org, jitao.shi@mediatek.com, daniel@ffwll.ch,
 krzysztof.kozlowski@canonical.com, airlied@linux.ie,
 alexandre.torgue@foss.st.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, ck.hu@mediatek.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, mcoquelin.stm32@gmail.com,
 matthias.bgg@gmail.com, p.zabel@pengutronix.de,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 3/3] dt-bindings: display: mediatek: Fix
 examples on new bindings
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

Hi Angelo,

Thanks you very much for fixing them all.
I really appreciate it :-)

I tested these patches and found some small problem.


On Fri, 2022-03-04 at 10:54 +0100, AngeloGioacchino Del Regno wrote:
> To avoid failure of dt_binding_check perform a slight refactoring
> of the examples: the main block is kept, but that required fixing
> the address and size cells, plus the inclusion of missing dt-bindings
> headers, required to parse some of the values assigned to various
> properties.
> 
> Fixes: 4ed545e7d100 ("dt-bindings: display: mediatek: disp: split
> each block to individual yaml")
> Signed-off-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>
> ---
>  .../display/mediatek/mediatek,aal.yaml        | 24 +++--
>  .../display/mediatek/mediatek,ccorr.yaml      | 23 +++--
>  .../display/mediatek/mediatek,color.yaml      | 23 +++--
>  .../display/mediatek/mediatek,dither.yaml     | 23 +++--
>  .../display/mediatek/mediatek,dpi.yaml        |  3 +-
>  .../display/mediatek/mediatek,dsc.yaml        | 23 +++--
>  .../display/mediatek/mediatek,ethdr.yaml      | 99 ++++++++++-------
> --
>  .../display/mediatek/mediatek,gamma.yaml      | 23 +++--
>  .../display/mediatek/mediatek,merge.yaml      | 49 +++++----
>  .../display/mediatek/mediatek,mutex.yaml      | 25 +++--
>  .../display/mediatek/mediatek,od.yaml         | 14 ++-
>  .../display/mediatek/mediatek,ovl-2l.yaml     | 26 +++--
>  .../display/mediatek/mediatek,ovl.yaml        | 26 +++--
>  .../display/mediatek/mediatek,postmask.yaml   | 23 +++--
>  .../display/mediatek/mediatek,rdma.yaml       | 28 ++++--
>  .../display/mediatek/mediatek,split.yaml      | 17 +++-
>  .../display/mediatek/mediatek,ufoe.yaml       | 19 ++--
>  .../display/mediatek/mediatek,wdma.yaml       | 26 +++--
>  18 files changed, 316 insertions(+), 178 deletions(-)

[snip]

> diff --git
> a/Documentation/devicetree/bindings/display/mediatek/mediatek,ethdr.y
> aml
> b/Documentation/devicetree/bindings/display/mediatek/mediatek,ethdr.y
> aml
> index 131eed5eeeb7..e16deca0dc2b 100644
> ---
> a/Documentation/devicetree/bindings/display/mediatek/mediatek,ethdr.y
> aml
> +++
> b/Documentation/devicetree/bindings/display/mediatek/mediatek,ethdr.y
> aml
> @@ -97,51 +97,62 @@ additionalProperties: false
>  
>  examples:
>    - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/mt8195-clk.h>
> +    #include <dt-bindings/gce/mt8195-gce.h>
> +    #include <dt-bindings/memory/mt8195-memory-port.h>

This header file should base on [1].
[1] dt-bindings: mediatek: mt8195: Add binding for MM IOMMU

https://patchwork.kernel.org/project/linux-mediatek/patch/20220217113453.13658-2-yong.wu@mediatek.com/

> +    #include <dt-bindings/power/mt8195-power.h>
> +    #include <dt-bindings/reset/mt8195-resets.h>
>  
> -    disp_ethdr@1c114000 {
> -            compatible = "mediatek,mt8195-disp-ethdr";
> -            reg = <0 0x1c114000 0 0x1000>,
> -                  <0 0x1c115000 0 0x1000>,
> -                  <0 0x1c117000 0 0x1000>,
> -                  <0 0x1c119000 0 0x1000>,
> -                  <0 0x1c11A000 0 0x1000>,
> -                  <0 0x1c11B000 0 0x1000>,
> -                  <0 0x1c11C000 0 0x1000>;
> -            reg-names = "mixer", "vdo_fe0", "vdo_fe1", "gfx_fe0",
> "gfx_fe1",
> -                        "vdo_be", "adl_ds";
> -            mediatek,gce-client-reg = <&gce0 SUBSYS_1c11XXXX 0x4000
> 0x1000>,
> -                                      <&gce0 SUBSYS_1c11XXXX 0x5000
> 0x1000>,
> -                                      <&gce0 SUBSYS_1c11XXXX 0x7000
> 0x1000>,
> -                                      <&gce0 SUBSYS_1c11XXXX 0x9000
> 0x1000>,
> -                                      <&gce0 SUBSYS_1c11XXXX 0xA000
> 0x1000>,
> -                                      <&gce0 SUBSYS_1c11XXXX 0xB000
> 0x1000>,
> -                                      <&gce0 SUBSYS_1c11XXXX 0xC000
> 0x1000>;
> -            clocks = <&vdosys1 CLK_VDO1_DISP_MIXER>,
> -                     <&vdosys1 CLK_VDO1_HDR_VDO_FE0>,
> -                     <&vdosys1 CLK_VDO1_HDR_VDO_FE1>,
> -                     <&vdosys1 CLK_VDO1_HDR_GFX_FE0>,
> -                     <&vdosys1 CLK_VDO1_HDR_GFX_FE1>,
> -                     <&vdosys1 CLK_VDO1_HDR_VDO_BE>,
> -                     <&vdosys1 CLK_VDO1_26M_SLOW>,
> -                     <&vdosys1 CLK_VDO1_HDR_VDO_FE0_DL_ASYNC>,
> -                     <&vdosys1 CLK_VDO1_HDR_VDO_FE1_DL_ASYNC>,
> -                     <&vdosys1 CLK_VDO1_HDR_GFX_FE0_DL_ASYNC>,
> -                     <&vdosys1 CLK_VDO1_HDR_GFX_FE1_DL_ASYNC>,
> -                     <&vdosys1 CLK_VDO1_HDR_VDO_BE_DL_ASYNC>,
> -                     <&topckgen CLK_TOP_ETHDR_SEL>;
> -            clock-names = "mixer", "vdo_fe0", "vdo_fe1", "gfx_fe0",
> "gfx_fe1",
> -                          "vdo_be", "adl_ds", "vdo_fe0_async",
> "vdo_fe1_async",
> -                          "gfx_fe0_async",
> "gfx_fe1_async","vdo_be_async",
> -                          "ethdr_top";
> -            power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS1>;
> -            iommus = <&iommu_vpp M4U_PORT_L3_HDR_DS>,
> -                     <&iommu_vpp M4U_PORT_L3_HDR_ADL>;
> -            interrupts = <GIC_SPI 517 IRQ_TYPE_LEVEL_HIGH 0>; /*
> disp mixer */
> -            resets = <&vdosys1
> MT8195_VDOSYS1_SW1_RST_B_HDR_VDO_FE0_DL_ASYNC>,
> -                     <&vdosys1
> MT8195_VDOSYS1_SW1_RST_B_HDR_VDO_FE1_DL_ASYNC>,
> -                     <&vdosys1
> MT8195_VDOSYS1_SW1_RST_B_HDR_GFX_FE0_DL_ASYNC>,
> -                     <&vdosys1
> MT8195_VDOSYS1_SW1_RST_B_HDR_GFX_FE1_DL_ASYNC>,
> -                     <&vdosys1
> MT8195_VDOSYS1_SW1_RST_B_HDR_VDO_BE_DL_ASYNC>;
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        disp_ethdr@1c114000 {
> +                compatible = "mediatek,mt8195-disp-ethdr";
> +                reg = <0 0x1c114000 0 0x1000>,
> +                      <0 0x1c115000 0 0x1000>,
> +                      <0 0x1c117000 0 0x1000>,
> +                      <0 0x1c119000 0 0x1000>,
> +                      <0 0x1c11A000 0 0x1000>,
> +                      <0 0x1c11B000 0 0x1000>,
> +                      <0 0x1c11C000 0 0x1000>;
> +                reg-names = "mixer", "vdo_fe0", "vdo_fe1",
> "gfx_fe0", "gfx_fe1",
> +                            "vdo_be", "adl_ds";
> +                mediatek,gce-client-reg = <&gce0 SUBSYS_1c11XXXX
> 0x4000 0x1000>,
> +                                          <&gce0 SUBSYS_1c11XXXX
> 0x5000 0x1000>,
> +                                          <&gce0 SUBSYS_1c11XXXX
> 0x7000 0x1000>,
> +                                          <&gce0 SUBSYS_1c11XXXX
> 0x9000 0x1000>,
> +                                          <&gce0 SUBSYS_1c11XXXX
> 0xA000 0x1000>,
> +                                          <&gce0 SUBSYS_1c11XXXX
> 0xB000 0x1000>,
> +                                          <&gce0 SUBSYS_1c11XXXX
> 0xC000 0x1000>;
> +                clocks = <&vdosys1 CLK_VDO1_DISP_MIXER>,
> +                         <&vdosys1 CLK_VDO1_HDR_VDO_FE0>,
> +                         <&vdosys1 CLK_VDO1_HDR_VDO_FE1>,
> +                         <&vdosys1 CLK_VDO1_HDR_GFX_FE0>,
> +                         <&vdosys1 CLK_VDO1_HDR_GFX_FE1>,
> +                         <&vdosys1 CLK_VDO1_HDR_VDO_BE>,
> +                         <&vdosys1 CLK_VDO1_26M_SLOW>,
> +                         <&vdosys1 CLK_VDO1_HDR_VDO_FE0_DL_ASYNC>,
> +                         <&vdosys1 CLK_VDO1_HDR_VDO_FE1_DL_ASYNC>,
> +                         <&vdosys1 CLK_VDO1_HDR_GFX_FE0_DL_ASYNC>,
> +                         <&vdosys1 CLK_VDO1_HDR_GFX_FE1_DL_ASYNC>,
> +                         <&vdosys1 CLK_VDO1_HDR_VDO_BE_DL_ASYNC>,
> +                         <&topckgen CLK_TOP_ETHDR>;
> +                clock-names = "mixer", "vdo_fe0", "vdo_fe1",
> "gfx_fe0", "gfx_fe1",
> +                              "vdo_be", "adl_ds", "vdo_fe0_async",
> "vdo_fe1_async",
> +                              "gfx_fe0_async",
> "gfx_fe1_async","vdo_be_async",
> +                              "ethdr_top";
> +                power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS1>;
> +                iommus = <&iommu_vpp M4U_PORT_L3_HDR_DS>,
> +                         <&iommu_vpp M4U_PORT_L3_HDR_ADL>;
> +                interrupts = <GIC_SPI 517 IRQ_TYPE_LEVEL_HIGH 0>; /*
> disp mixer */
> +                resets = <&vdosys1
> MT8195_VDOSYS1_SW1_RST_B_HDR_VDO_FE0_DL_ASYNC>,
> +                         <&vdosys1
> MT8195_VDOSYS1_SW1_RST_B_HDR_VDO_FE1_DL_ASYNC>,
> +                         <&vdosys1
> MT8195_VDOSYS1_SW1_RST_B_HDR_GFX_FE0_DL_ASYNC>,
> +                         <&vdosys1
> MT8195_VDOSYS1_SW1_RST_B_HDR_GFX_FE1_DL_ASYNC>,
> +                         <&vdosys1
> MT8195_VDOSYS1_SW1_RST_B_HDR_VDO_BE_DL_ASYNC>;

These define should base on [2].
[2] dt-bindings: reset: mt8195: add vdosys1 reset control bit

https://patchwork.kernel.org/project/linux-mediatek/patch/20220222100741.30138-5-nancy.lin@mediatek.com/

+        };
>      };
>  

[snip]

> diff --git
> a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl-
> 2l.yaml
> b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl-
> 2l.yaml
> index e3cef99d0f98..25d2ac2a4f05 100644
> ---
> a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl-
> 2l.yaml
> +++
> b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl-
> 2l.yaml
> @@ -66,13 +66,23 @@ additionalProperties: false
>  
>  examples:
>    - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/mt8173-clk.h>
> +    #include <dt-bindings/power/mt8173-power.h>
> +    #include <dt-bindings/gce/mt8173-gce.h>
> +    #include <dt-bindings/memory/mt8173-larb-port.h>

These should be mt8183 header files.

#include <dt-bindings/clock/mt8183-clk.h>
#include <dt-bindings/power/mt8183-power.h>
#include <dt-bindings/gce/mt8183-gce.h>
#include <dt-bindings/memory/mt8183-larb-port.h>

> -    ovl_2l0: ovl@14009000 {
> -        compatible = "mediatek,mt8183-disp-ovl-2l";
> -        reg = <0 0x14009000 0 0x1000>;
> -        interrupts = <GIC_SPI 226 IRQ_TYPE_LEVEL_LOW>;
> -        power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
> -        clocks = <&mmsys CLK_MM_DISP_OVL0_2L>;
> -        iommus = <&iommu M4U_PORT_DISP_2L_OVL0_LARB0>;
> -        mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0x9000
> 0x1000>;
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        ovl_2l0: ovl@14009000 {
> +            compatible = "mediatek,mt8183-disp-ovl-2l";
> +            reg = <0 0x14009000 0 0x1000>;
> +            interrupts = <GIC_SPI 226 IRQ_TYPE_LEVEL_LOW>;
> +            power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
> +            clocks = <&mmsys CLK_MM_DISP_OVL0_2L>;
> +            iommus = <&iommu M4U_PORT_DISP_2L_OVL0_LARB0>;
> +            mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0x9000
> 0x1000>;
> +        };
>      };

[snip]

Thanks again! 
Tested-by: Jason-JH.Lin <jason-jh.lin@medaitek.com>

Regards,
Jason-JH.Lin

-- 
Jason-JH Lin <jason-jh.lin@mediatek.com>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
