Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7129F915EFF
	for <lists+linux-stm32@lfdr.de>; Tue, 25 Jun 2024 08:40:31 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0B74CC71287;
	Tue, 25 Jun 2024 06:40:31 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3FC3EC5E2D2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Jun 2024 06:40:23 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45P63AAd000769;
 Tue, 25 Jun 2024 08:40:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 PVmaRvuRdNjcyteecKUb2n20H04bvA0NxajNSqThrBc=; b=WuXZAjJWJxiw/5JB
 8g+TupB2fQEKu0nYqJIl6+DNZ7yne3Du8rjDqX84u4oufLs+TVu0wzfjNtg+j63M
 mBuYq1yz2w1Iqkxut2fll/64T0OZ0QQEiOqUhI8j6cv3/PJMtGQex46C45PJJSMu
 3R/bUW2oOFx6OVWmZQvTxOD/W6KHHuN1CkW6pSqHJ6bu/tcViTrlxs3IyrjKux7W
 wXevFl3oFJW5+9Xl/gecmH5lKWQW13n7ZjYbfVi2Zsg+7U1wsWxHIXWaTWbEc6vp
 qQnUzaLczg/Cq+FiT+SCLxht1fsbNHnKvhSKKxh9R+unrVO8jhVft45HHGo8EmfD
 67R7dw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ywnxxa3ea-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 Jun 2024 08:40:11 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id A479A40047;
 Tue, 25 Jun 2024 08:40:06 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 680402115FB;
 Tue, 25 Jun 2024 08:39:11 +0200 (CEST)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 25 Jun
 2024 08:39:10 +0200
Message-ID: <604bfb55-f30d-47c5-80a0-c0ba889b2542@foss.st.com>
Date: Tue, 25 Jun 2024 08:39:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Raphael Gallais-Pou <rgallaispou@gmail.com>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui
 <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
References: <20240518-thermal-v1-0-7dfca3ed454b@gmail.com>
 <20240518-thermal-v1-2-7dfca3ed454b@gmail.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20240518-thermal-v1-2-7dfca3ed454b@gmail.com>
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-25_03,2024-06-24_01,2024-05-17_01
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-pm@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 2/3] thermal: sti: depend on THERMAL_OF
	subsystem
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



On 5/18/24 14:12, Raphael Gallais-Pou wrote:
> Switch to thermal_of_zone to handle thermal-zones. Replace
> thermal_zone_device_register() by devm_thermal_of_zone_register() and
> remove ops st_thermal_get_trip_type, st_thermal_get_trip_temp.
> 
> Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
> ---
>  drivers/thermal/st/Kconfig      |  1 +
>  drivers/thermal/st/st_thermal.c | 20 ++++++++++----------
>  2 files changed, 11 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/thermal/st/Kconfig b/drivers/thermal/st/Kconfig
> index ecbdf4ef00f4..2d08147876ee 100644
> --- a/drivers/thermal/st/Kconfig
> +++ b/drivers/thermal/st/Kconfig
> @@ -5,6 +5,7 @@
>  
>  config ST_THERMAL
>  	tristate "Thermal sensors on STMicroelectronics STi series of SoCs"
> +	depends on THERMAL_OF
>  	help
>  	  Support for thermal sensors on STMicroelectronics STi series of SoCs.
>  
> diff --git a/drivers/thermal/st/st_thermal.c b/drivers/thermal/st/st_thermal.c
> index 5f33543a3a54..60e70de724d4 100644
> --- a/drivers/thermal/st/st_thermal.c
> +++ b/drivers/thermal/st/st_thermal.c
> @@ -12,6 +12,7 @@
>  #include <linux/of_device.h>
>  
>  #include "st_thermal.h"
> +#include "../thermal_hwmon.h"
>  
>  /* The Thermal Framework expects millidegrees */
>  #define mcelsius(temp)			((temp) * 1000)
> @@ -203,23 +204,21 @@ int st_thermal_register(struct platform_device *pdev,
>  	trip.type = THERMAL_TRIP_CRITICAL;
>  
>  	sensor->thermal_dev =
> -		thermal_zone_device_register_with_trips(dev_name(dev), &trip, 1, sensor,
> -							&st_tz_ops, NULL, 0, polling_delay);
> +		devm_thermal_of_zone_register(dev, 0, sensor, &st_tz_ops);

The struct trip becomes no more used, it can be removed.



>  	if (IS_ERR(sensor->thermal_dev)) {
> -		dev_err(dev, "failed to register thermal zone device\n");
> +		dev_err(dev, "failed to register thermal of zone\n");
>  		ret = PTR_ERR(sensor->thermal_dev);
>  		goto sensor_off;
>  	}
> -	ret = thermal_zone_device_enable(sensor->thermal_dev);
> -	if (ret)
> -		goto tzd_unregister;
>  
>  	platform_set_drvdata(pdev, sensor);
>  
> -	return 0;
> +	/*
> +	 * devm_thermal_of_zone_register() doesn't enable hwmon by default
> +	 * Enable it here
> +	 */
> +	return devm_thermal_add_hwmon_sysfs(dev, sensor->thermal_dev);
>  
> -tzd_unregister:
> -	thermal_zone_device_unregister(sensor->thermal_dev);
>  sensor_off:
>  	st_thermal_sensor_off(sensor);
>  
> @@ -232,7 +231,8 @@ void st_thermal_unregister(struct platform_device *pdev)
>  	struct st_thermal_sensor *sensor = platform_get_drvdata(pdev);
>  
>  	st_thermal_sensor_off(sensor);
> -	thermal_zone_device_unregister(sensor->thermal_dev);
> +	thermal_remove_hwmon_sysfs(sensor->thermal_dev);
> +	devm_thermal_of_zone_unregister(sensor->dev, sensor->thermal_dev);
>  }
>  EXPORT_SYMBOL_GPL(st_thermal_unregister);
>  
> 



_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
