Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E3D3768C414
	for <lists+linux-stm32@lfdr.de>; Mon,  6 Feb 2023 18:00:56 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 992C7C65E62;
	Mon,  6 Feb 2023 17:00:56 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 604A1C6506E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  6 Feb 2023 17:00:55 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id fi26so12333844edb.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 06 Feb 2023 09:00:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ragnatech-se.20210112.gappssmtp.com; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=a6q/V+E4w1GCT3UIo80p/1jk/eyzfrAH7kZCB3dF6EI=;
 b=uCfTnrbkPsLAWL6gOh5JY9TMsdhSIK82e1NiuB7IshsdmrWsM5Hjr6FwUqZDOfVwE5
 pvNIBn/sDzqqN32lvfDoOmAh45PK1wSUkPZLuoc6AEvpCgbhlvhcegjr+D6AEUDXeYYW
 crvJhRIWcpDQskPdi0OoQGliNpJBpBY6VIzwBot4iZgUgiUf3fIUlETRkLbLODtr4PhJ
 3TWSPMBYPdaLTxs1wac12U00iQXUDjiSDIkJN5Elr/OcQAIapmSRlT2ChNGZoaEjoLvI
 /JAvT3ybEZlwj5jOQ0L0qHFxsB/XJq0OisD0eI8mYh3MtxQWHtEUbqVsfi2Ox0lT3Rd+
 Q6tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=a6q/V+E4w1GCT3UIo80p/1jk/eyzfrAH7kZCB3dF6EI=;
 b=ddapSN7x0C+24boKsgmfQqjLAt5W+2fRO/ve5/PExk/ILz7bffkz5A+c/er/MghUpG
 9onmUBERqWhLFDGkrmUk/r9TT/S3OeQmxfxJfwWt82eBVl5kzBLAwb3AVEn2hTI2vz/U
 ukkGF3wyuHIWnBWL0OgUT/BYhpxJTktrf+TjxDbVef7p1Ug6XWkGTZgbdS1VsGjMbUzt
 uRilmhNdOPoi7Xg3iNnk2xVJFMu6Hq2MtCqsLCUYwpuub3bj9flV97czgruJixbgSdGk
 POIzpNUBTTRZ/Pho89ABVsQwJHrT177lWv+B6A1uE4ksODQTbh+6bVeHH94uY2jghSum
 EbsA==
X-Gm-Message-State: AO0yUKXM+LBp7yS+Yf0BhYSR54XGv1J6eq40DiVNtprXKK7BQCrYkPSh
 KNGldOr+klEOYhEwXvwx4cpTWg==
X-Google-Smtp-Source: AK7set9cQX60hct3CmrqQYLoS0zKl3hJEZ9KOOgC/H19Hq6SMdqrMyY4g16B+aPSjyDEPbDCn8cC1A==
X-Received: by 2002:a50:9ea9:0:b0:4a0:e323:d59c with SMTP id
 a38-20020a509ea9000000b004a0e323d59cmr246400edf.20.1675702854925; 
 Mon, 06 Feb 2023 09:00:54 -0800 (PST)
Received: from localhost (h-46-59-89-207.A463.priv.bahnhof.se. [46.59.89.207])
 by smtp.gmail.com with ESMTPSA id
 c5-20020a50d645000000b004aaa656887esm2668878edj.96.2023.02.06.09.00.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Feb 2023 09:00:54 -0800 (PST)
Date: Mon, 6 Feb 2023 18:00:53 +0100
From: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <Y+EyRb9klmwwHGjn@oden.dyn.berto.se>
References: <20230206153432.1017282-1-daniel.lezcano@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
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
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, rafael.j.wysocki@intel.com,
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Hi Daniel,

Thanks for your work.

On 2023-02-06 16:34:29 +0100, Daniel Lezcano wrote:
> As the name states "thermal_core.h" is the header file for the core
> components of the thermal framework.
> =

> Too many drivers are including it. Hopefully the recent cleanups
> helped to self encapsulate the code a bit more and prevented the
> drivers to need this header.
> =

> Remove this inclusion in every place where it is possible.
> =

> Some other drivers did a confusion with the core header and the one
> exported in linux/thermal.h. They include the former instead of the
> latter. The changes also fix this.
> =

> The tegra/soctherm driver still remains as it uses an internal
> function which need to be replaced.
> =

> The Intel HFI driver uses the netlink internal framework core and
> should be changed to prevent to deal with the internals.
> =

> No functional changes
> =

> [ Applies to thermal/linux-next or linux-pm/linux-next ]
> =

> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
> ---
>  drivers/thermal/amlogic_thermal.c           | 1 -
>  drivers/thermal/armada_thermal.c            | 2 --
>  drivers/thermal/broadcom/bcm2835_thermal.c  | 1 -
>  drivers/thermal/hisi_thermal.c              | 3 +--
>  drivers/thermal/imx8mm_thermal.c            | 1 -
>  drivers/thermal/imx_sc_thermal.c            | 1 -
>  drivers/thermal/intel/intel_hfi.c           | 3 ++-
>  drivers/thermal/qcom/qcom-spmi-temp-alarm.c | 1 -
>  drivers/thermal/qoriq_thermal.c             | 1 -
>  drivers/thermal/rcar_gen3_thermal.c         | 1 -

For R-Car,

Reviewed-by: Niklas S=F6derlund <niklas.soderlund+renesas@ragnatech.se>

>  drivers/thermal/samsung/exynos_tmu.c        | 3 +--
>  drivers/thermal/st/stm_thermal.c            | 1 -
>  drivers/thermal/tegra/tegra30-tsensor.c     | 1 -
>  drivers/thermal/uniphier_thermal.c          | 2 --
>  14 files changed, 4 insertions(+), 18 deletions(-)
> =

> diff --git a/drivers/thermal/amlogic_thermal.c b/drivers/thermal/amlogic_=
thermal.c
> index d30cb791e63c..9235fda4ec1e 100644
> --- a/drivers/thermal/amlogic_thermal.c
> +++ b/drivers/thermal/amlogic_thermal.c
> @@ -28,7 +28,6 @@
>  #include <linux/regmap.h>
>  #include <linux/thermal.h>
>  =

> -#include "thermal_core.h"
>  #include "thermal_hwmon.h"
>  =

>  #define TSENSOR_CFG_REG1			0x4
> diff --git a/drivers/thermal/armada_thermal.c b/drivers/thermal/armada_th=
ermal.c
> index 83a4080bffc7..36653f692c80 100644
> --- a/drivers/thermal/armada_thermal.c
> +++ b/drivers/thermal/armada_thermal.c
> @@ -19,8 +19,6 @@
>  #include <linux/regmap.h>
>  #include <linux/interrupt.h>
>  =

> -#include "thermal_core.h"
> -
>  /* Thermal Manager Control and Status Register */
>  #define PMU_TDC0_SW_RST_MASK		(0x1 << 1)
>  #define PMU_TM_DISABLE_OFFS		0
> diff --git a/drivers/thermal/broadcom/bcm2835_thermal.c b/drivers/thermal=
/broadcom/bcm2835_thermal.c
> index 3d0710c6e004..23918bb76ae6 100644
> --- a/drivers/thermal/broadcom/bcm2835_thermal.c
> +++ b/drivers/thermal/broadcom/bcm2835_thermal.c
> @@ -18,7 +18,6 @@
>  #include <linux/platform_device.h>
>  #include <linux/thermal.h>
>  =

> -#include "../thermal_core.h"
>  #include "../thermal_hwmon.h"
>  =

>  #define BCM2835_TS_TSENSCTL			0x00
> diff --git a/drivers/thermal/hisi_thermal.c b/drivers/thermal/hisi_therma=
l.c
> index 45226cab466e..62c67942293e 100644
> --- a/drivers/thermal/hisi_thermal.c
> +++ b/drivers/thermal/hisi_thermal.c
> @@ -16,8 +16,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/io.h>
>  #include <linux/of_device.h>
> -
> -#include "thermal_core.h"
> +#include <linux/thermal.h>
>  =

>  #define HI6220_TEMP0_LAG			(0x0)
>  #define HI6220_TEMP0_TH				(0x4)
> diff --git a/drivers/thermal/imx8mm_thermal.c b/drivers/thermal/imx8mm_th=
ermal.c
> index d247b48696cb..72b5d6f319c1 100644
> --- a/drivers/thermal/imx8mm_thermal.c
> +++ b/drivers/thermal/imx8mm_thermal.c
> @@ -17,7 +17,6 @@
>  #include <linux/slab.h>
>  #include <linux/thermal.h>
>  =

> -#include "thermal_core.h"
>  #include "thermal_hwmon.h"
>  =

>  #define TER			0x0	/* TMU enable */
> diff --git a/drivers/thermal/imx_sc_thermal.c b/drivers/thermal/imx_sc_th=
ermal.c
> index 378f574607f7..f32e59e74623 100644
> --- a/drivers/thermal/imx_sc_thermal.c
> +++ b/drivers/thermal/imx_sc_thermal.c
> @@ -13,7 +13,6 @@
>  #include <linux/slab.h>
>  #include <linux/thermal.h>
>  =

> -#include "thermal_core.h"
>  #include "thermal_hwmon.h"
>  =

>  #define IMX_SC_MISC_FUNC_GET_TEMP	13
> diff --git a/drivers/thermal/intel/intel_hfi.c b/drivers/thermal/intel/in=
tel_hfi.c
> index 6e604bda2b93..c69db6c90869 100644
> --- a/drivers/thermal/intel/intel_hfi.c
> +++ b/drivers/thermal/intel/intel_hfi.c
> @@ -40,10 +40,11 @@
>  =

>  #include <asm/msr.h>
>  =

> -#include "../thermal_core.h"
>  #include "intel_hfi.h"
>  #include "thermal_interrupt.h"
>  =

> +#include "../thermal_netlink.h"
> +
>  /* Hardware Feedback Interface MSR configuration bits */
>  #define HW_FEEDBACK_PTR_VALID_BIT		BIT(0)
>  #define HW_FEEDBACK_CONFIG_HFI_ENABLE_BIT	BIT(0)
> diff --git a/drivers/thermal/qcom/qcom-spmi-temp-alarm.c b/drivers/therma=
l/qcom/qcom-spmi-temp-alarm.c
> index e2429676d0d2..101c75d0e13f 100644
> --- a/drivers/thermal/qcom/qcom-spmi-temp-alarm.c
> +++ b/drivers/thermal/qcom/qcom-spmi-temp-alarm.c
> @@ -15,7 +15,6 @@
>  #include <linux/regmap.h>
>  #include <linux/thermal.h>
>  =

> -#include "../thermal_core.h"
>  #include "../thermal_hwmon.h"
>  =

>  #define QPNP_TM_REG_DIG_MAJOR		0x01
> diff --git a/drivers/thermal/qoriq_thermal.c b/drivers/thermal/qoriq_ther=
mal.c
> index d111e218f362..431c29c0898a 100644
> --- a/drivers/thermal/qoriq_thermal.c
> +++ b/drivers/thermal/qoriq_thermal.c
> @@ -13,7 +13,6 @@
>  #include <linux/thermal.h>
>  #include <linux/units.h>
>  =

> -#include "thermal_core.h"
>  #include "thermal_hwmon.h"
>  =

>  #define SITES_MAX		16
> diff --git a/drivers/thermal/rcar_gen3_thermal.c b/drivers/thermal/rcar_g=
en3_thermal.c
> index 4ef927437842..0fd2fd077638 100644
> --- a/drivers/thermal/rcar_gen3_thermal.c
> +++ b/drivers/thermal/rcar_gen3_thermal.c
> @@ -17,7 +17,6 @@
>  #include <linux/sys_soc.h>
>  #include <linux/thermal.h>
>  =

> -#include "thermal_core.h"
>  #include "thermal_hwmon.h"
>  =

>  /* Register offsets */
> diff --git a/drivers/thermal/samsung/exynos_tmu.c b/drivers/thermal/samsu=
ng/exynos_tmu.c
> index 37465af59262..527d1eb0663a 100644
> --- a/drivers/thermal/samsung/exynos_tmu.c
> +++ b/drivers/thermal/samsung/exynos_tmu.c
> @@ -20,11 +20,10 @@
>  #include <linux/of_irq.h>
>  #include <linux/platform_device.h>
>  #include <linux/regulator/consumer.h>
> +#include <linux/thermal.h>
>  =

>  #include <dt-bindings/thermal/thermal_exynos.h>
>  =

> -#include "../thermal_core.h"
> -
>  /* Exynos generic registers */
>  #define EXYNOS_TMU_REG_TRIMINFO		0x0
>  #define EXYNOS_TMU_REG_CONTROL		0x20
> diff --git a/drivers/thermal/st/stm_thermal.c b/drivers/thermal/st/stm_th=
ermal.c
> index e7834ccc7976..735401958f01 100644
> --- a/drivers/thermal/st/stm_thermal.c
> +++ b/drivers/thermal/st/stm_thermal.c
> @@ -19,7 +19,6 @@
>  #include <linux/platform_device.h>
>  #include <linux/thermal.h>
>  =

> -#include "../thermal_core.h"
>  #include "../thermal_hwmon.h"
>  =

>  /* DTS register offsets */
> diff --git a/drivers/thermal/tegra/tegra30-tsensor.c b/drivers/thermal/te=
gra/tegra30-tsensor.c
> index 0ffe37ce7df7..b3218b71b6d9 100644
> --- a/drivers/thermal/tegra/tegra30-tsensor.c
> +++ b/drivers/thermal/tegra/tegra30-tsensor.c
> @@ -28,7 +28,6 @@
>  =

>  #include <soc/tegra/fuse.h>
>  =

> -#include "../thermal_core.h"
>  #include "../thermal_hwmon.h"
>  =

>  #define TSENSOR_SENSOR0_CONFIG0				0x0
> diff --git a/drivers/thermal/uniphier_thermal.c b/drivers/thermal/uniphie=
r_thermal.c
> index f8ab2ca76184..47801841b3f5 100644
> --- a/drivers/thermal/uniphier_thermal.c
> +++ b/drivers/thermal/uniphier_thermal.c
> @@ -17,8 +17,6 @@
>  #include <linux/regmap.h>
>  #include <linux/thermal.h>
>  =

> -#include "thermal_core.h"
> -
>  /*
>   * block registers
>   * addresses are the offset from .block_base
> -- =

> 2.34.1
> =


-- =

Kind Regards,
Niklas S=F6derlund
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
