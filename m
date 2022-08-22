Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F265159B8D8
	for <lists+linux-stm32@lfdr.de>; Mon, 22 Aug 2022 07:50:50 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A21AEC64115;
	Mon, 22 Aug 2022 05:50:50 +0000 (UTC)
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9354AC64112
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Aug 2022 05:50:48 +0000 (UTC)
X-UUID: f256e3ec0ff74d9683367701e223e1ca-20220822
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=3ghN7VmVQnos4hPKWncaAnfXqQiRkXmmPVdQejnrLbs=; 
 b=jK7Ak6U8Xsd1GWww/FqDdtMlCYJqmRcM1d7+ggBng1vvdPMomBAsOkoan0fRPYaFp2P1JD4YQS4Imqus6OmC7IXZnTJhI6J/62FafFzoHBQ24iWXhxbqQHjoU34n8LpS37F3Chm2OnqD3k5oO3vmiE8G6G39lvn4mIwgiDVPsio=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10, REQID:c8e89d5b-3829-4b49-9a6b-52da75f9ba5a, OB:0,
 L
 OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_
 Ham,ACTION:release,TS:0
X-CID-META: VersionHash:84eae18, CLOUDID:b8c331cf-20bd-4e5e-ace8-00692b7ab380,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:11|1,File:
 nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: f256e3ec0ff74d9683367701e223e1ca-20220822
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 952053510; Mon, 22 Aug 2022 13:50:43 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Mon, 22 Aug 2022 13:50:41 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Mon, 22 Aug 2022 13:50:41 +0800
Message-ID: <805b7dd82e86e6c2297a5ffbd23be2c568ca29b3.camel@mediatek.com>
From: CK Hu <ck.hu@mediatek.com>
To: nathan.lu <nathan.lu@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, "David
 Airlie" <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>
Date: Mon, 22 Aug 2022 13:50:41 +0800
In-Reply-To: <20220822033213.15769-5-nathan.lu@mediatek.com>
References: <20220822033213.15769-1-nathan.lu@mediatek.com>
 <20220822033213.15769-5-nathan.lu@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
Cc: devicetree@vger.kernel.org, wsd_upstream@mediatek.com,
 srv_heupstream@mediatek.com, "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Moudy Ho <moudy.ho@mediatek.com>, linux-mediatek@lists.infradead.org,
 Rex-BC Chen <rex-bc.chen@mediatek.com>, lancelot.wu@mediatek.com,
 amy zhang <Amy.Zhang@mediatek.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [Linux-stm32] [PATCH v1 4/4] drm/mediatek: add mediatek-drm of
 vdosys0 support for mt8188
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

Hi, Nathan:

On Mon, 2022-08-22 at 11:32 +0800, nathan.lu wrote:
> From: Nathan Lu <nathan.lu@mediatek.com>
> 
> add driver data of mt8188 vdosys0 to mediatek-drm and the sub driver.
> 
> Signed-off-by: amy zhang <Amy.Zhang@mediatek.com>
> Signed-off-by: Nathan Lu <nathan.lu@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c | 30
> ++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> index d72263c8a621..260514006093 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -178,6 +178,18 @@ static const unsigned int mt8186_mtk_ddp_ext[] =
> {
>  	DDP_COMPONENT_DPI0,
>  };
>  
> +static const unsigned int mt8188_mtk_ddp_main[] = {
> +	DDP_COMPONENT_OVL0,
> +	DDP_COMPONENT_RDMA0,
> +	DDP_COMPONENT_COLOR0,
> +	DDP_COMPONENT_CCORR,
> +	DDP_COMPONENT_AAL0,
> +	DDP_COMPONENT_GAMMA,
> +	DDP_COMPONENT_POSTMASK0,
> +	DDP_COMPONENT_DITHER0,
> +	DDP_COMPONENT_DP_INTF0,
> +};
> +
>  static const unsigned int mt8192_mtk_ddp_main[] = {
>  	DDP_COMPONENT_OVL0,
>  	DDP_COMPONENT_OVL_2L0,
> @@ -323,6 +335,20 @@ static const struct mtk_mmsys_match_data
> mt8186_mmsys_match_data = {
>  	},
>  };
>  
> +static const struct mtk_mmsys_driver_data mt8188_vdosys0_driver_data
> = {
> +	.io_start = 0x1c01d000,

For only one mmsys, it's not necessary to set io_start.

Regards,
CK

> +	.main_path = mt8188_mtk_ddp_main,
> +	.main_len = ARRAY_SIZE(mt8188_mtk_ddp_main),
> +	.mmsys_dev_num = 1,
> +};
> +
> +static const struct mtk_mmsys_match_data mt8188_mmsys_match_data = {
> +	.num_drv_data = 1,
> +	.drv_data = {
> +		&mt8188_vdosys0_driver_data,
> +	},
> +};
> +
>  static const struct mtk_mmsys_driver_data mt8192_mmsys_driver_data =
> {
>  	.main_path = mt8192_mtk_ddp_main,
>  	.main_len = ARRAY_SIZE(mt8192_mtk_ddp_main),
> @@ -376,6 +402,8 @@ static const struct of_device_id mtk_drm_of_ids[]
> = {
>  	  .data = &mt8183_mmsys_match_data},
>  	{ .compatible = "mediatek,mt8186-mmsys",
>  	  .data = &mt8186_mmsys_match_data},
> +	{ .compatible = "mediatek,mt8188-mmsys",
> +	  .data = &mt8188_mmsys_match_data},
>  	{ .compatible = "mediatek,mt8192-mmsys",
>  	  .data = &mt8192_mmsys_match_data},
>  	{ .compatible = "mediatek,mt8195-mmsys",
> @@ -734,6 +762,8 @@ static const struct of_device_id
> mtk_ddp_comp_dt_ids[] = {
>  	  .data = (void *)MTK_DISP_MUTEX },
>  	{ .compatible = "mediatek,mt8186-disp-mutex",
>  	  .data = (void *)MTK_DISP_MUTEX },
> +	{ .compatible = "mediatek,mt8188-disp-mutex",
> +	  .data = (void *)MTK_DISP_MUTEX },
>  	{ .compatible = "mediatek,mt8192-disp-mutex",
>  	  .data = (void *)MTK_DISP_MUTEX },
>  	{ .compatible = "mediatek,mt8195-disp-mutex",

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
