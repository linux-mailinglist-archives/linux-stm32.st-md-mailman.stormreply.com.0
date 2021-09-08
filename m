Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C9C13403454
	for <lists+linux-stm32@lfdr.de>; Wed,  8 Sep 2021 08:39:47 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7ABAEC597AA;
	Wed,  8 Sep 2021 06:39:47 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B02DBC56630
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  8 Sep 2021 06:39:45 +0000 (UTC)
Received: from lupine.hi.pengutronix.de
 ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1mNrF7-000821-T7; Wed, 08 Sep 2021 08:39:33 +0200
Received: from pza by lupine with local (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1mNrF3-00031K-86; Wed, 08 Sep 2021 08:39:29 +0200
Message-ID: <5ffef736524f3d7fb69f97332576ee9913032bcd.camel@pengutronix.de>
From: Philipp Zabel <p.zabel@pengutronix.de>
To: "jason-jh.lin" <jason-jh.lin@mediatek.com>, Rob Herring
 <robh+dt@kernel.org>,  Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 08 Sep 2021 08:39:29 +0200
In-Reply-To: <20210908060312.24007-8-jason-jh.lin@mediatek.com>
References: <20210908060312.24007-1-jason-jh.lin@mediatek.com>
 <20210908060312.24007-8-jason-jh.lin@mediatek.com>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: devicetree@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 fshao@chromium.org, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, singo.chang@mediatek.com,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 dri-devel@lists.freedesktop.org, Yongqiang Niu <yongqiang.niu@mediatek.com>,
 nancy.lin@mediatek.com, linux-mediatek@lists.infradead.org,
 Daniel Vetter <daniel@ffwll.ch>, hsinyi@chromium.org,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v10 07/17] dt-bindings: display: mediatek:
 merge: add additional prop for mt8195
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

Hi Jason,

On Wed, 2021-09-08 at 14:03 +0800, jason-jh.lin wrote:
> add MERGE additional properties description for mt8195:
> 1. async clock
> 2. fifo setting enable
> 3. reset controller
> 
> Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
> ---
>  .../display/mediatek/mediatek,merge.yaml      | 30 +++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,merge.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,merge.yaml
> index 75beeb207ceb..0fe204d9ad2c 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,merge.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,merge.yaml
> @@ -38,6 +38,19 @@ properties:
>    clocks:
>      items:
>        - description: MERGE Clock
> +      - description: MERGE Async Clock
> +          Controlling the synchronous process between MERGE and other display
> +          function blocks cross clock domain.
> +
> +  mediatek,merge-fifo-en:
> +    description:
> +      The setting of merge fifo is mainly provided for the display latency
> +      buffer to ensure that the back-end panel display data will not be
> +      underrun, a little more data is needed in the fifo.
> +      According to the merge fifo settings, when the water level is detected
> +      to be insufficient, it will trigger RDMA sending ultra and preulra
> +      command to SMI to speed up the data rate.
> +    type: boolean
>  
>    mediatek,gce-client-reg:
>      description:
> @@ -50,6 +63,10 @@ properties:
>      $ref: /schemas/types.yaml#/definitions/phandle-array
>      maxItems: 1
>  
> +  resets:
> +    description: reset controller
> +      See Documentation/devicetree/bindings/reset/reset.txt for details.

From the example this looks like it could have a maxItems: 1.

> +
>  required:
>    - compatible
>    - reg

Should the resets property be required for "mediatek,mt8195-disp-merge"?

> @@ -67,3 +84,16 @@ examples:
>          power-domains = <&spm MT8173_POWER_DOMAIN_MM>;
>          clocks = <&mmsys CLK_MM_DISP_MERGE>;
>      };
> +
> +    merge5: disp_vpp_merge5@1c110000 {
> +        compatible = "mediatek,mt8195-disp-merge";
> +        reg = <0 0x1c110000 0 0x1000>;
> +        interrupts = <GIC_SPI 507 IRQ_TYPE_LEVEL_HIGH 0>;
> +        clocks = <&vdosys1 CLK_VDO1_VPP_MERGE4>,
> +                 <&vdosys1 CLK_VDO1_MERGE4_DL_ASYNC>;
> +        clock-names = "merge","merge_async";
> +        power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS1>;
> +        mediatek,gce-client-reg = <&gce1 SUBSYS_1c11XXXX 0x0000 0x1000>;
> +        mediatek,merge-fifo-en = <1>;
> +        resets = <&vdosys1 MT8195_VDOSYS1_SW0_RST_B_MERGE4_DL_ASYNC>;
> +    };

regards
Philipp
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
