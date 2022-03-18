Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D8094DD52C
	for <lists+linux-stm32@lfdr.de>; Fri, 18 Mar 2022 08:21:25 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 25DB8C6046B;
	Fri, 18 Mar 2022 07:21:25 +0000 (UTC)
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A6515C5EC56
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 18 Mar 2022 07:21:22 +0000 (UTC)
X-UUID: f90193d6fb3d4c5c920587fa9a5e3d76-20220318
X-UUID: f90193d6fb3d4c5c920587fa9a5e3d76-20220318
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 2140259070; Fri, 18 Mar 2022 15:21:15 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Fri, 18 Mar 2022 15:21:13 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 18 Mar 2022 15:21:13 +0800
Message-ID: <72e5b8ed21a796f6f756b0ee42b363c158f18cd3.camel@mediatek.com>
From: CK Hu <ck.hu@mediatek.com>
To: jason-jh.lin <jason-jh.lin@mediatek.com>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, "Chun-Kuang
 Hu" <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Date: Fri, 18 Mar 2022 15:21:13 +0800
In-Reply-To: <20220307032859.3275-6-jason-jh.lin@mediatek.com>
References: <20220307032859.3275-1-jason-jh.lin@mediatek.com>
 <20220307032859.3275-6-jason-jh.lin@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
Cc: devicetree@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 fshao@chromium.org, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, singo.chang@mediatek.com,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, roy-cw.yeh@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Fabien Parent <fparent@baylibre.com>, moudy.ho@mediatek.com,
 linux-mediatek@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>,
 hsinyi@chromium.org, Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 nancy.lin@mediatek.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v16 5/8] soc: mediatek: add mtk-mutex
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

Hi, Jason:

On Mon, 2022-03-07 at 11:28 +0800, jason-jh.lin wrote:
> Add mtk-mutex support for mt8195 vdosys0.
> 
> Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
> Acked-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>
> ---
>  drivers/soc/mediatek/mtk-mutex.c | 103
> ++++++++++++++++++++++++++++++-
>  1 file changed, 100 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/soc/mediatek/mtk-mutex.c
> b/drivers/soc/mediatek/mtk-mutex.c
> index aaf8fc1abb43..1c7ffcdadcea 100644
> --- a/drivers/soc/mediatek/mtk-mutex.c
> +++ b/drivers/soc/mediatek/mtk-mutex.c
> @@ -17,6 +17,9 @@
>  #define MT8183_MUTEX0_MOD0			0x30
>  #define MT8183_MUTEX0_SOF0			0x2c
>  
> +#define MT8195_DISP_MUTEX0_MOD0			0x30
> +#define MT8195_DISP_MUTEX0_SOF			0x2c
> +
>  #define DISP_REG_MUTEX_EN(n)			(0x20 + 0x20 * (n))
>  #define DISP_REG_MUTEX(n)			(0x24 + 0x20 * (n))
>  #define DISP_REG_MUTEX_RST(n)			(0x28 + 0x20 *
> (n))
> @@ -96,6 +99,36 @@
>  #define MT8173_MUTEX_MOD_DISP_PWM1		24
>  #define MT8173_MUTEX_MOD_DISP_OD		25
>  
> +#define MT8195_MUTEX_MOD_DISP_OVL0		0
> +#define MT8195_MUTEX_MOD_DISP_WDMA0		1
> +#define MT8195_MUTEX_MOD_DISP_RDMA0		2
> +#define MT8195_MUTEX_MOD_DISP_COLOR0		3
> +#define MT8195_MUTEX_MOD_DISP_CCORR0		4
> +#define MT8195_MUTEX_MOD_DISP_AAL0		5
> +#define MT8195_MUTEX_MOD_DISP_GAMMA0		6
> +#define MT8195_MUTEX_MOD_DISP_DITHER0		7
> +#define MT8195_MUTEX_MOD_DISP_DSI0		8
> +#define MT8195_MUTEX_MOD_DISP_DSC_WRAP0_CORE0	9
> +#define MT8195_MUTEX_MOD_DISP_OVL1		10
> +#define MT8195_MUTEX_MOD_DISP_WDMA1		11
> +#define MT8195_MUTEX_MOD_DISP_RDMA1		12
> +#define MT8195_MUTEX_MOD_DISP_COLOR1		13
> +#define MT8195_MUTEX_MOD_DISP_CCORR1		14
> +#define MT8195_MUTEX_MOD_DISP_AAL1		15
> +#define MT8195_MUTEX_MOD_DISP_GAMMA1		16
> +#define MT8195_MUTEX_MOD_DISP_DITHER1		17
> +#define MT8195_MUTEX_MOD_DISP_DSI1		18
> +#define MT8195_MUTEX_MOD_DISP_DSC_WRAP0_CORE1	19
> +#define MT8195_MUTEX_MOD_DISP_VPP_MERGE		20
> +#define MT8195_MUTEX_MOD_DISP_DP_INTF0		21
> +#define MT8195_MUTEX_MOD_DISP_VPP1_DL_RELAY0	22

Useless, remove.

> +#define MT8195_MUTEX_MOD_DISP_VPP1_DL_RELAY1	23

Ditto.

Regards,
CK

> +#define MT8195_MUTEX_MOD_DISP_VDO1_DL_RELAY2	24
> +#define MT8195_MUTEX_MOD_DISP_VDO0_DL_RELAY3	25
> +#define MT8195_MUTEX_MOD_DISP_VDO0_DL_RELAY4	26
> +#define MT8195_MUTEX_MOD_DISP_PWM0		27
> +#define MT8195_MUTEX_MOD_DISP_PWM1		28
> +
>  #define MT2712_MUTEX_MOD_DISP_PWM2		10
>  #define MT2712_MUTEX_MOD_DISP_OVL0		11
>  #define MT2712_MUTEX_MOD_DISP_OVL1		12
> @@ -132,9 +165,21 @@
>  #define MT8167_MUTEX_SOF_DPI1			3
>  #define MT8183_MUTEX_SOF_DSI0			1
>  #define MT8183_MUTEX_SOF_DPI0			2
> +#define MT8195_MUTEX_SOF_DSI0			1
> +#define MT8195_MUTEX_SOF_DSI1			2
> +#define MT8195_MUTEX_SOF_DP_INTF0		3
> +#define MT8195_MUTEX_SOF_DP_INTF1		4
> +#define MT8195_MUTEX_SOF_DPI0			6 /* for
> HDMI_TX */
> +#define MT8195_MUTEX_SOF_DPI1			5 /* for
> digital video out */
>  
>  #define MT8183_MUTEX_EOF_DSI0			(MT8183_MUTEX_S
> OF_DSI0 << 6)
>  #define MT8183_MUTEX_EOF_DPI0			(MT8183_MUTEX_S
> OF_DPI0 << 6)
> +#define MT8195_MUTEX_EOF_DSI0			(MT8195_MUTEX_S
> OF_DSI0 << 7)
> +#define MT8195_MUTEX_EOF_DSI1			(MT8195_MUTEX_S
> OF_DSI1 << 7)
> +#define MT8195_MUTEX_EOF_DP_INTF0		(MT8195_MUTEX_SOF_DP_IN
> TF0 << 7)
> +#define MT8195_MUTEX_EOF_DP_INTF1		(MT8195_MUTEX_SOF_DP_IN
> TF1 << 7)
> +#define MT8195_MUTEX_EOF_DPI0			(MT8195_MUTEX_S
> OF_DPI0 << 7)
> +#define MT8195_MUTEX_EOF_DPI1			(MT8195_MUTEX_S
> OF_DPI1 << 7)
>  
>  struct mtk_mutex {
>  	int id;
> @@ -149,6 +194,9 @@ enum mtk_mutex_sof_id {
>  	MUTEX_SOF_DPI1,
>  	MUTEX_SOF_DSI2,
>  	MUTEX_SOF_DSI3,
> +	MUTEX_SOF_DP_INTF0,
> +	MUTEX_SOF_DP_INTF1,
> +	DDP_MUTEX_SOF_MAX,
>  };
>  
>  struct mtk_mutex_data {
> @@ -270,7 +318,23 @@ static const unsigned int
> mt8192_mutex_mod[DDP_COMPONENT_ID_MAX] = {
>  	[DDP_COMPONENT_RDMA4] = MT8192_MUTEX_MOD_DISP_RDMA4,
>  };
>  
> -static const unsigned int mt2712_mutex_sof[MUTEX_SOF_DSI3 + 1] = {
> +static const unsigned int mt8195_mutex_mod[DDP_COMPONENT_ID_MAX] = {
> +	[DDP_COMPONENT_OVL0] = MT8195_MUTEX_MOD_DISP_OVL0,
> +	[DDP_COMPONENT_WDMA0] = MT8195_MUTEX_MOD_DISP_WDMA0,
> +	[DDP_COMPONENT_RDMA0] = MT8195_MUTEX_MOD_DISP_RDMA0,
> +	[DDP_COMPONENT_COLOR0] = MT8195_MUTEX_MOD_DISP_COLOR0,
> +	[DDP_COMPONENT_CCORR] = MT8195_MUTEX_MOD_DISP_CCORR0,
> +	[DDP_COMPONENT_AAL0] = MT8195_MUTEX_MOD_DISP_AAL0,
> +	[DDP_COMPONENT_GAMMA] = MT8195_MUTEX_MOD_DISP_GAMMA0,
> +	[DDP_COMPONENT_DITHER] = MT8195_MUTEX_MOD_DISP_DITHER0,
> +	[DDP_COMPONENT_MERGE0] = MT8195_MUTEX_MOD_DISP_VPP_MERGE,
> +	[DDP_COMPONENT_DSC0] = MT8195_MUTEX_MOD_DISP_DSC_WRAP0_CORE0,
> +	[DDP_COMPONENT_DSI0] = MT8195_MUTEX_MOD_DISP_DSI0,
> +	[DDP_COMPONENT_PWM0] = MT8195_MUTEX_MOD_DISP_PWM0,
> +	[DDP_COMPONENT_DP_INTF0] = MT8195_MUTEX_MOD_DISP_DP_INTF0,
> +};
> +
> +static const unsigned int mt2712_mutex_sof[DDP_MUTEX_SOF_MAX] = {
>  	[MUTEX_SOF_SINGLE_MODE] = MUTEX_SOF_SINGLE_MODE,
>  	[MUTEX_SOF_DSI0] = MUTEX_SOF_DSI0,
>  	[MUTEX_SOF_DSI1] = MUTEX_SOF_DSI1,
> @@ -280,7 +344,7 @@ static const unsigned int
> mt2712_mutex_sof[MUTEX_SOF_DSI3 + 1] = {
>  	[MUTEX_SOF_DSI3] = MUTEX_SOF_DSI3,
>  };
>  
> -static const unsigned int mt8167_mutex_sof[MUTEX_SOF_DSI3 + 1] = {
> +static const unsigned int mt8167_mutex_sof[DDP_MUTEX_SOF_MAX] = {
>  	[MUTEX_SOF_SINGLE_MODE] = MUTEX_SOF_SINGLE_MODE,
>  	[MUTEX_SOF_DSI0] = MUTEX_SOF_DSI0,
>  	[MUTEX_SOF_DPI0] = MT8167_MUTEX_SOF_DPI0,
> @@ -288,7 +352,7 @@ static const unsigned int
> mt8167_mutex_sof[MUTEX_SOF_DSI3 + 1] = {
>  };
>  
>  /* Add EOF setting so overlay hardware can receive frame done irq */
> -static const unsigned int mt8183_mutex_sof[MUTEX_SOF_DSI3 + 1] = {
> +static const unsigned int mt8183_mutex_sof[DDP_MUTEX_SOF_MAX] = {
>  	[MUTEX_SOF_SINGLE_MODE] = MUTEX_SOF_SINGLE_MODE,
>  	[MUTEX_SOF_DSI0] = MUTEX_SOF_DSI0 | MT8183_MUTEX_EOF_DSI0,
>  	[MUTEX_SOF_DPI0] = MT8183_MUTEX_SOF_DPI0 |
> MT8183_MUTEX_EOF_DPI0,
> @@ -300,6 +364,26 @@ static const unsigned int
> mt8186_mutex_sof[MUTEX_SOF_DSI3 + 1] = {
>  	[MUTEX_SOF_DPI0] = MT8186_MUTEX_SOF_DPI0 |
> MT8186_MUTEX_EOF_DPI0,
>  };
>  
> +/*
> + * To support refresh mode(video mode), DISP_REG_MUTEX_SOF should
> + * select the EOF source and configure the EOF plus timing from the
> + * module that provides the timing signal.
> + * So that MUTEX can not only send a STREAM_DONE event to GCE
> + * but also detect the error at end of frame(EAEOF) when EOF signal
> + * arrives.
> + */
> +static const unsigned int mt8195_mutex_sof[DDP_MUTEX_SOF_MAX] = {
> +	[MUTEX_SOF_SINGLE_MODE] = MUTEX_SOF_SINGLE_MODE,
> +	[MUTEX_SOF_DSI0] = MT8195_MUTEX_SOF_DSI0 |
> MT8195_MUTEX_EOF_DSI0,
> +	[MUTEX_SOF_DSI1] = MT8195_MUTEX_SOF_DSI1 |
> MT8195_MUTEX_EOF_DSI1,
> +	[MUTEX_SOF_DPI0] = MT8195_MUTEX_SOF_DPI0 |
> MT8195_MUTEX_EOF_DPI0,
> +	[MUTEX_SOF_DPI1] = MT8195_MUTEX_SOF_DPI1 |
> MT8195_MUTEX_EOF_DPI1,
> +	[MUTEX_SOF_DP_INTF0] =
> +		MT8195_MUTEX_SOF_DP_INTF0 | MT8195_MUTEX_EOF_DP_INTF0,
> +	[MUTEX_SOF_DP_INTF1] =
> +		MT8195_MUTEX_SOF_DP_INTF1 | MT8195_MUTEX_EOF_DP_INTF1,
> +};
> +
>  static const struct mtk_mutex_data mt2701_mutex_driver_data = {
>  	.mutex_mod = mt2701_mutex_mod,
>  	.mutex_sof = mt2712_mutex_sof,
> @@ -351,6 +435,13 @@ static const struct mtk_mutex_data
> mt8192_mutex_driver_data = {
>  	.mutex_sof_reg = MT8183_MUTEX0_SOF0,
>  };
>  
> +static const struct mtk_mutex_data mt8195_mutex_driver_data = {
> +	.mutex_mod = mt8195_mutex_mod,
> +	.mutex_sof = mt8195_mutex_sof,
> +	.mutex_mod_reg = MT8195_DISP_MUTEX0_MOD0,
> +	.mutex_sof_reg = MT8195_DISP_MUTEX0_SOF,
> +};
> +
>  struct mtk_mutex *mtk_mutex_get(struct device *dev)
>  {
>  	struct mtk_mutex_ctx *mtx = dev_get_drvdata(dev);
> @@ -423,6 +514,9 @@ void mtk_mutex_add_comp(struct mtk_mutex *mutex,
>  	case DDP_COMPONENT_DPI1:
>  		sof_id = MUTEX_SOF_DPI1;
>  		break;
> +	case DDP_COMPONENT_DP_INTF0:
> +		sof_id = MUTEX_SOF_DP_INTF0;
> +		break;
>  	default:
>  		if (mtx->data->mutex_mod[id] < 32) {
>  			offset = DISP_REG_MUTEX_MOD(mtx->data-
> >mutex_mod_reg,
> @@ -462,6 +556,7 @@ void mtk_mutex_remove_comp(struct mtk_mutex
> *mutex,
>  	case DDP_COMPONENT_DSI3:
>  	case DDP_COMPONENT_DPI0:
>  	case DDP_COMPONENT_DPI1:
> +	case DDP_COMPONENT_DP_INTF0:
>  		writel_relaxed(MUTEX_SOF_SINGLE_MODE,
>  			       mtx->regs +
>  			       DISP_REG_MUTEX_SOF(mtx->data-
> >mutex_sof_reg,
> @@ -587,6 +682,8 @@ static const struct of_device_id
> mutex_driver_dt_match[] = {
>  	  .data = &mt8186_mutex_driver_data},
>  	{ .compatible = "mediatek,mt8192-disp-mutex",
>  	  .data = &mt8192_mutex_driver_data},
> +	{ .compatible = "mediatek,mt8195-disp-mutex",
> +	  .data = &mt8195_mutex_driver_data},
>  	{},
>  };
>  MODULE_DEVICE_TABLE(of, mutex_driver_dt_match);

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
