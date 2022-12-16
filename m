Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 19F4E64EB7A
	for <lists+linux-stm32@lfdr.de>; Fri, 16 Dec 2022 13:38:29 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D04FFC65E46;
	Fri, 16 Dec 2022 12:38:28 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C30B6C64109
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 16 Dec 2022 12:38:27 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 ay2-20020a05600c1e0200b003d22e3e796dso1694406wmb.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 16 Dec 2022 04:38:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Lao9rYbp3jaFrYZTl4u8VT5iiT2JXYCWdbPZpYAQt0U=;
 b=BMepz24nDZZivPME5G/0rC1h5CJlQGZ54ruWBy6dX64Uk4SGIMuaySv/EHqCMmDFlm
 Yt9nWGzwjDylHxA/fIa2fvjPi6RXfFyVUAIQolxl5XVaWYg1gM+KXekgc8Neuxg7UImG
 Q1/TALmidY2sa0We5LCCnwckFy8EU3QcGgZ77y2K4z44V9M8HzAvZ56MfbmVIWN86HOr
 ZfQGtdlBVm0Mb1IhxMtSuqxX3apL13OZa167PAtE2JL2UdUXPcVrcjtTMTz8z1sHDyrV
 dsnyRfEDInrgB2XauxVK2QY8R9RSBu26Y3CKnrjUhLrJPqvcU7Yhr6de6bMR0FDNlfrP
 ezLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Lao9rYbp3jaFrYZTl4u8VT5iiT2JXYCWdbPZpYAQt0U=;
 b=zVwyfNyYk0vkP4JgwvSDp3xdxA2laLIK2hkDAqYeDcrAiqsB12iODaqp6nYE82jY1L
 8cmyhHVwJqzsqxO9ESpN51M1cousvImWQk27yzvFtZmi5z9ontB3weD69u79eVm8v+YE
 X4fyXJAslwS17EvJZjzN74GfrP8LRikGnOT9DxFtEliHzHhduNfwvAB9B5qXSvYLfKUP
 6pmW2bWBpqKQa5EiBfaPwSUrx1SzuO6hWNSWxdcxtzUxQqWnoPfbUWUKm4X4QzczQPHR
 NTws3cdmt4LrCK+cNLa43U0Q65lt5u/8DImZ9JQJICCnHtAyLZCudvV9lJX1/CqVG4dT
 vTeQ==
X-Gm-Message-State: ANoB5pl6Uqdw5IQwd7ijZRicEyUIlXTOztiQJVmTdQEK5sM96zcJHOU5
 72ruZjTDtIbOfAQ+aWM1VVo=
X-Google-Smtp-Source: AA0mqf4IPAGnw9/UVoqBz48bhA1Ot5/RTaWfHDozeIuCkpkpk9odgAvJId8q9jxV10vVOZPzlZhGJw==
X-Received: by 2002:a05:600c:34cb:b0:3d1:f16d:5848 with SMTP id
 d11-20020a05600c34cb00b003d1f16d5848mr24918840wmq.26.1671194307387; 
 Fri, 16 Dec 2022 04:38:27 -0800 (PST)
Received: from [192.168.1.132] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 cl4-20020a5d5f04000000b00242209dd1ffsm2259107wrb.41.2022.12.16.04.38.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Dec 2022 04:38:26 -0800 (PST)
Message-ID: <9a839b69-d798-0957-bb94-7d009fdcceec@gmail.com>
Date: Fri, 16 Dec 2022 13:38:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Content-Language: en-US
To: "nathan.lu" <nathan.lu@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>
References: <20221206020046.11333-1-nathan.lu@mediatek.com>
 <20221206020046.11333-7-nathan.lu@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20221206020046.11333-7-nathan.lu@mediatek.com>
Cc: devicetree@vger.kernel.org, "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Rex-BC Chen <rex-bc.chen@mediatek.com>, Moudy Ho <moudy.ho@mediatek.com>,
 linux-mediatek@lists.infradead.org, CK Hu <ck.hu@mediatek.com>,
 lancelot.wu@mediatek.com, amy zhang <Amy.Zhang@mediatek.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [Linux-stm32] [PATCH v4 6/6] drm/mediatek: add mediatek-drm of
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>



On 06/12/2022 03:00, nathan.lu wrote:
> From: Nathan Lu <nathan.lu@mediatek.com>
> 
> add driver data of mt8188 vdosys0 to mediatek-drm and the sub driver.
> 
> Signed-off-by: amy zhang <Amy.Zhang@mediatek.com>
> Signed-off-by: Nathan Lu <nathan.lu@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   drivers/gpu/drm/mediatek/mtk_drm_drv.c | 21 +++++++++++++++++++++
>   1 file changed, 21 insertions(+)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> index b12e5b977c50..8058a5ec2f1d 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -176,6 +176,18 @@ static const enum mtk_ddp_comp_id mt8186_mtk_ddp_ext[] = {
>   	DDP_COMPONENT_DPI0,
>   };
>   
> +static const enum mtk_ddp_comp_id mt8188_mtk_ddp_main[] = {
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
>   static const enum mtk_ddp_comp_id mt8192_mtk_ddp_main[] = {
>   	DDP_COMPONENT_OVL0,
>   	DDP_COMPONENT_OVL_2L0,
> @@ -259,6 +271,11 @@ static const struct mtk_mmsys_driver_data mt8186_mmsys_driver_data = {
>   	.ext_len = ARRAY_SIZE(mt8186_mtk_ddp_ext),
>   };
>   
> +static const struct mtk_mmsys_driver_data mt8188_vdosys0_driver_data = {
> +	.main_path = mt8188_mtk_ddp_main,
> +	.main_len = ARRAY_SIZE(mt8188_mtk_ddp_main),
> +};
> +
>   static const struct mtk_mmsys_driver_data mt8192_mmsys_driver_data = {
>   	.main_path = mt8192_mtk_ddp_main,
>   	.main_len = ARRAY_SIZE(mt8192_mtk_ddp_main),
> @@ -516,6 +533,8 @@ static const struct of_device_id mtk_ddp_comp_dt_ids[] = {
>   	  .data = (void *)MTK_DISP_MUTEX },
>   	{ .compatible = "mediatek,mt8186-disp-mutex",
>   	  .data = (void *)MTK_DISP_MUTEX },
> +	{ .compatible = "mediatek,mt8188-disp-mutex",
> +	  .data = (void *)MTK_DISP_MUTEX },
>   	{ .compatible = "mediatek,mt8192-disp-mutex",
>   	  .data = (void *)MTK_DISP_MUTEX },
>   	{ .compatible = "mediatek,mt8195-disp-mutex",
> @@ -600,6 +619,8 @@ static const struct of_device_id mtk_drm_of_ids[] = {
>   	  .data = &mt8183_mmsys_driver_data},
>   	{ .compatible = "mediatek,mt8186-mmsys",
>   	  .data = &mt8186_mmsys_driver_data},
> +	{ .compatible = "mediatek,mt8188-vdosys0",
> +	  .data = &mt8188_vdosys0_driver_data},
>   	{ .compatible = "mediatek,mt8192-mmsys",
>   	  .data = &mt8192_mmsys_driver_data},
>   	{ .compatible = "mediatek,mt8195-mmsys",
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
