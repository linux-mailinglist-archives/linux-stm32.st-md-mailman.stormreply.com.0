Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 96EA368D969
	for <lists+linux-stm32@lfdr.de>; Tue,  7 Feb 2023 14:33:23 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5A451C6A5E8;
	Tue,  7 Feb 2023 13:33:23 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D06D9C035BB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 Feb 2023 13:33:21 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id i5so6393028wrc.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 07 Feb 2023 05:33:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:reply-to:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=4Gnj8mx6BQv+P/VZTc2ZRvZ4cPWBzn/d/g1R6N3t1SY=;
 b=sywB6VKP5uMO4iMwIfYWNewUXqdyUmfAHNyhyo3OrdI4w9hMA/do0JdT6XDgbayfL+
 hioKOeqNB9gmBTeOJ+GEqRzkacs91bBLXr18APnsVAUBpOFSSsRR/mPgDw2PAZiSngST
 GHN3F7C6RRw0zyStZrcDu6HUwZTZEJW9//HKZNnFr8pbdBYO0ZeQTSQ1wJUc9qr39WDw
 RAZprI560qB9/D7SJ2L2mhHzMzvqn4IkElOgb3RhfyiCRKxMOqVm8can1xTMfSUuQzTl
 3d/Otz4g9TJG3uwzIfUqVNKE0lVe3mXM4bFnaRqiGH/VF2JhF06rxIQG2kcu+KI3CJbC
 UTcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:reply-to:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4Gnj8mx6BQv+P/VZTc2ZRvZ4cPWBzn/d/g1R6N3t1SY=;
 b=eHWhZhn8IhWQfKALywf9nR7ifFV9hZrmFtFz2aKAoWw8x76O55V6PD+RO32m1DOPep
 6jhdA9I3Wlr9sjc1xukiXGoEnL54Ovk8p1NOBy+i5ts1uMlwUqW9VlA3kjSfSgHenecH
 Yg/vk0+fH+Y+3ux4v+xZEcvGBz5AMDNLhq3wHoc0PKOJE4IgIpN9Fk6KnLsOawxAz7QE
 r4SwvkwBELwlVKm+cDiaWsNub8cAdc+DvJyZo5L3UBTae3Gipdq0qH6KhX7Cvye7j7ML
 ySJU2wbmkse1R3RZTLXFK0rjx3guHz7zJRztkeb1JgjymdAgat7VR6voSVcDeCG1ic6v
 cfvg==
X-Gm-Message-State: AO0yUKUzqqX5duAx5SRGKb6cl1Qiv6YqWC9i8sWbu4jsbe5fWWpfH7EG
 q3x/cGQE+12hIOU1Id9J9T2qGA==
X-Google-Smtp-Source: AK7set9tflq7m2WGhWzU48ho/FGtJPjdoU4DUvNTQOyFDfwfzYJ/cgrUGOgVxSNmGa0o1E+FD6YRHA==
X-Received: by 2002:a05:6000:1b0f:b0:2c3:ea4d:3f01 with SMTP id
 f15-20020a0560001b0f00b002c3ea4d3f01mr2338118wrz.27.1675776801421; 
 Tue, 07 Feb 2023 05:33:21 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:c58c:fc5c:67d6:e5f3?
 ([2a01:e0a:982:cbb0:c58c:fc5c:67d6:e5f3])
 by smtp.gmail.com with ESMTPSA id
 t1-20020a5d4601000000b002bdfe3aca17sm11241983wrq.51.2023.02.07.05.33.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Feb 2023 05:33:21 -0800 (PST)
Message-ID: <e8e983a7-5dac-507d-414e-0fdc1082644a@linaro.org>
Date: Tue, 7 Feb 2023 14:33:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-US
To: Daniel Lezcano <daniel.lezcano@linaro.org>, rafael.j.wysocki@intel.com
References: <20230206153432.1017282-1-daniel.lezcano@linaro.org>
From: Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20230206153432.1017282-1-daniel.lezcano@linaro.org>
Cc: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>,
 Amit Kucheria <amitk@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Guillaume La Roque <glaroque@baylibre.com>,
 Minghao Chi <chi.minghao@zte.com.cn>, Alim Akhtar <alim.akhtar@samsung.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 Fabio Estevam <festevam@gmail.com>, "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "open list:RENESAS R-CAR THERMAL DRIVERS" <linux-renesas-soc@vger.kernel.org>,
 Florian Fainelli <f.fainelli@gmail.com>, Haowen Bai <baihaowen@meizu.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Ricardo Neri <ricardo.neri-calderon@linux.intel.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Andy Gross <agross@kernel.org>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 NXP Linux Team <linux-imx@nxp.com>, ye xingchen <ye.xingchen@zte.com.cn>,
 Zhang Rui <rui.zhang@intel.com>, Thara Gopinath <thara.gopinath@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-pm@vger.kernel.org,
 Ray Jui <rjui@broadcom.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 "open list:SAMSUNG THERMAL DRIVER" <linux-samsung-soc@vger.kernel.org>,
 "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE"
 <linux-rpi-kernel@lists.infradead.org>,
 "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>,
 "open list:THERMAL DRIVER FOR AMLOGIC SOCS"
 <linux-amlogic@lists.infradead.org>,
 "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, Scott Branden <sbranden@broadcom.com>,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>,
 Shawn Guo <shawnguo@kernel.org>
Subject: Re: [Linux-stm32] [PATCH] thermal: Remove core header inclusion
	from drivers
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
Reply-To: neil.armstrong@linaro.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On 06/02/2023 16:34, Daniel Lezcano wrote:
> As the name states "thermal_core.h" is the header file for the core
> components of the thermal framework.
> 
> Too many drivers are including it. Hopefully the recent cleanups
> helped to self encapsulate the code a bit more and prevented the
> drivers to need this header.
> 
> Remove this inclusion in every place where it is possible.
> 
> Some other drivers did a confusion with the core header and the one
> exported in linux/thermal.h. They include the former instead of the
> latter. The changes also fix this.
> 
> The tegra/soctherm driver still remains as it uses an internal
> function which need to be replaced.
> 
> The Intel HFI driver uses the netlink internal framework core and
> should be changed to prevent to deal with the internals.
> 
> No functional changes
> 
> [ Applies to thermal/linux-next or linux-pm/linux-next ]
> 
> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
> ---
>   drivers/thermal/amlogic_thermal.c           | 1 -
>   drivers/thermal/armada_thermal.c            | 2 --
>   drivers/thermal/broadcom/bcm2835_thermal.c  | 1 -
>   drivers/thermal/hisi_thermal.c              | 3 +--
>   drivers/thermal/imx8mm_thermal.c            | 1 -
>   drivers/thermal/imx_sc_thermal.c            | 1 -
>   drivers/thermal/intel/intel_hfi.c           | 3 ++-
>   drivers/thermal/qcom/qcom-spmi-temp-alarm.c | 1 -
>   drivers/thermal/qoriq_thermal.c             | 1 -
>   drivers/thermal/rcar_gen3_thermal.c         | 1 -
>   drivers/thermal/samsung/exynos_tmu.c        | 3 +--
>   drivers/thermal/st/stm_thermal.c            | 1 -
>   drivers/thermal/tegra/tegra30-tsensor.c     | 1 -
>   drivers/thermal/uniphier_thermal.c          | 2 --
>   14 files changed, 4 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/thermal/amlogic_thermal.c b/drivers/thermal/amlogic_thermal.c
> index d30cb791e63c..9235fda4ec1e 100644
> --- a/drivers/thermal/amlogic_thermal.c
> +++ b/drivers/thermal/amlogic_thermal.c
> @@ -28,7 +28,6 @@
>   #include <linux/regmap.h>
>   #include <linux/thermal.h>
>   
> -#include "thermal_core.h"
>   #include "thermal_hwmon.h"
>   
>   #define TSENSOR_CFG_REG1			0x4

For Amlogic:

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

<snip>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
