Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 076E781B61D
	for <lists+linux-stm32@lfdr.de>; Thu, 21 Dec 2023 13:42:24 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A87B4C6DD70;
	Thu, 21 Dec 2023 12:42:23 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 941DCC6C820
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Dec 2023 12:40:45 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-40d3bebbf6eso5727495e9.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Dec 2023 04:40:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703162445; x=1703767245;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JWmqolZ/s9uaTTG3HahXfBKZE7l3nyr/50HE3h+LaaE=;
 b=EgtSgtvZQhIOOmaBASkOb/LS7xhkJIY3WJIS1Q2qtbGova2vrF9tAmLj1/XTNDW8YW
 ne1bLIupe5PaP8YSLOhd/ubhmWbU2HxiUmhkVCdIypAacZTNMH7y43vEvzUhjWOSjIIR
 +0z84dB+991ePA7gsWfl7vuhkE7I+63WdZ7e/o/sFx7l3xTzC8T71b3XkMTK/QzE5AgO
 upoFR1W60yBSvK3wzgOkggDQpyCBq6XIO6JttXPQrfmOJYLRVmw78F4SeX6ZVpaLv1qg
 CjSoQj8jR/efBGx85hGnkb4HNhedk5sbz9l/aU0/gZWuS9fSoFOP/dUM3EPXF2gTxKvF
 5NAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703162445; x=1703767245;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JWmqolZ/s9uaTTG3HahXfBKZE7l3nyr/50HE3h+LaaE=;
 b=ZUsLkqAL4tDBwyftHq2h0zztqC6Ld3ecITLx3a91C9JNQWTOb5urkNHGqLAPTVY9NF
 yRzvFrx1prNH0XSRFp8/QVj4qHjVoHnLGP7nsULQ3V2e5qfhmxmTxAyTMsLSi98GaRR0
 PKos5lgg6kYN5a/U98Dkyj5veqeNzsJKovNQo7E+K52xSAk3dWBk+vk76G0i+Z1aM9wV
 2SQWxtTLsT3ZLQeu4gjgnc1jDOziPrzvkPL+R4FWFgSG3rGG8v998+Au0HkGlxJQvgX8
 /NaztUe9Yh8uWHzr9517bEEJnqZSdhQjp4r0wUSmcNCQkGFg+HFKB++PbThPhrK5zVmJ
 tWjA==
X-Gm-Message-State: AOJu0YzCOppBpVbiexnHiioB5arWuqmcaOUgD+NUuVu3u6Yb3GwLDCEh
 nvu2urNAWtAFnl5GBpECVw==
X-Google-Smtp-Source: AGHT+IGkuybcFimpIs0LvZEOZjwVVUVzLxK10DvFGWw0XP9p/eXP37eHJM8+GsP1AmV508zKWNQi3w==
X-Received: by 2002:a05:600c:4583:b0:40d:177b:c3ac with SMTP id
 r3-20020a05600c458300b0040d177bc3acmr818914wmo.85.1703162444642; 
 Thu, 21 Dec 2023 04:40:44 -0800 (PST)
Received: from ?IPV6:2a02:810b:f40:4300:1c49:5d1e:f6f3:77a0?
 ([2a02:810b:f40:4300:1c49:5d1e:f6f3:77a0])
 by smtp.gmail.com with ESMTPSA id
 k13-20020a05600c1c8d00b0040d3dc52665sm2204319wms.21.2023.12.21.04.40.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Dec 2023 04:40:44 -0800 (PST)
Message-ID: <769a1510-f8d2-4095-9879-42f413141dee@gmail.com>
Date: Thu, 21 Dec 2023 13:40:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Hugues Fruchet <hugues.fruchet@foss.st.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>
References: <20231221084723.2152034-1-hugues.fruchet@foss.st.com>
Content-Language: en-US, de-DE
From: Alex Bee <knaerzche@gmail.com>
In-Reply-To: <20231221084723.2152034-1-hugues.fruchet@foss.st.com>
X-Mailman-Approved-At: Thu, 21 Dec 2023 12:42:22 +0000
Cc: Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Marco Felsch <m.felsch@pengutronix.de>, Hans Verkuil <hverkuil@xs4all.nl>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, Heiko Stuebner <heiko@sntech.de>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 linux-rockchip@lists.infradead.org,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Adam Ford <aford173@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [Linux-stm32] [PATCH v5 0/5] Add support for video hardware
 codec of STMicroelectronics STM32 SoC series
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

Hi Hugues, Hi Nicolas,

is there any specific reason I'm not understanding / seeing why this is 
added in two seperate vdec* / venc* files and not a single vpu* file? Is 
it only for the seperate clocks (-names) / irqs (-names) / callbacks? 
Those are defined per variant and perfectly fit in a single file holding 
one vdec and one venc variant.

Alex

Am 21.12.23 um 09:47 schrieb Hugues Fruchet:
> This patchset introduces support for VDEC video hardware decoder
> and VENC video hardware encoder of STMicroelectronics STM32MP25
> SoC series.
> 
> This initial support implements H264 decoding, VP8 decoding and
> JPEG encoding.
> 
> This has been tested on STM32MP257F-EV1 evaluation board.
> 
> ===========
> = history =
> ===========
> version 5:
>     - Precise that video decoding as been successfully tested up to full HD
>     - Add Nicolas Dufresne reviewed-by
> 
> version 4:
>     - Fix comments from Nicolas about dropping encoder raw steps
> 
> version 3:
>     - Fix remarks from Krzysztof Kozlowski:
>      - drop "items", we keep simple enum in such case
>      - drop second example - it is the same as the first
>     - Drop unused node labels as suggested by Conor Dooley
>     - Revisit min/max resolutions as suggested by Nicolas Dufresne
> 
> version 2:
>     - Fix remarks from Krzysztof Kozlowski on v1:
>      - single video-codec binding for both VDEC/VENC
>      - get rid of "-names"
>      - use of generic node name "video-codec"
> 
> version 1:
>    - Initial submission
> 
> Hugues Fruchet (5):
>    dt-bindings: media: Document STM32MP25 VDEC & VENC video codecs
>    media: hantro: add support for STM32MP25 VDEC
>    media: hantro: add support for STM32MP25 VENC
>    arm64: dts: st: add video decoder support to stm32mp255
>    arm64: dts: st: add video encoder support to stm32mp255
> 
>   .../media/st,stm32mp25-video-codec.yaml       |  50 ++++++++
>   arch/arm64/boot/dts/st/stm32mp251.dtsi        |  12 ++
>   arch/arm64/boot/dts/st/stm32mp255.dtsi        |  17 +++
>   drivers/media/platform/verisilicon/Kconfig    |  14 ++-
>   drivers/media/platform/verisilicon/Makefile   |   4 +
>   .../media/platform/verisilicon/hantro_drv.c   |   4 +
>   .../media/platform/verisilicon/hantro_hw.h    |   2 +
>   .../platform/verisilicon/stm32mp25_vdec_hw.c  |  92 ++++++++++++++
>   .../platform/verisilicon/stm32mp25_venc_hw.c  | 115 ++++++++++++++++++
>   9 files changed, 307 insertions(+), 3 deletions(-)
>   create mode 100644 Documentation/devicetree/bindings/media/st,stm32mp25-video-codec.yaml
>   create mode 100644 drivers/media/platform/verisilicon/stm32mp25_vdec_hw.c
>   create mode 100644 drivers/media/platform/verisilicon/stm32mp25_venc_hw.c
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
