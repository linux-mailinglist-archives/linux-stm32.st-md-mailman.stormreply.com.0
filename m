Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 514E4744D5C
	for <lists+linux-stm32@lfdr.de>; Sun,  2 Jul 2023 12:56:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EA642C6A611;
	Sun,  2 Jul 2023 10:56:29 +0000 (UTC)
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com
 [185.176.79.56])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BAF21C6A603
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  2 Jul 2023 10:56:28 +0000 (UTC)
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.200])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Qv5Y41bTFz6J6lR;
 Sun,  2 Jul 2023 18:54:48 +0800 (CST)
Received: from localhost (10.48.51.211) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Sun, 2 Jul
 2023 11:56:22 +0100
Date: Sun, 2 Jul 2023 18:56:18 +0800
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Olivier Moysan <olivier.moysan@foss.st.com>
Message-ID: <20230702185618.00002453@Huawei.com>
In-Reply-To: <20230623140944.2613002-1-olivier.moysan@foss.st.com>
References: <20230623140944.2613002-1-olivier.moysan@foss.st.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
X-Originating-IP: [10.48.51.211]
X-ClientProxiedBy: lhrpeml500004.china.huawei.com (7.191.163.9) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CFilter-Loop: Reflected
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Frank Rowand <frowand.list@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jonathan Cameron <jic23@kernel.org>
Subject: Re: [Linux-stm32] [RFC PATCH 0/7] iio: add iio backend device type
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

On Fri, 23 Jun 2023 16:09:36 +0200
Olivier Moysan <olivier.moysan@foss.st.com> wrote:

> This RFC re-opens an old discussion regarding channel scaling
> management in STM32 DFSDM driver [1]
> 
> The DFSDM is a peripheral provided by the STM32MP1x SoC family.
> One objective is also to prepare the introduction of its successor in
> the STM32MP12x SoC family: the MDF (Multi-function Digital Filter).
> The MDF driver will have the same requirements as the DFSDM regarding
> channel scaling management. So, the solution proposed here will apply
> also for the future MDF driver.
> 
> [1]
> https://patchwork.kernel.org/project/linux-iio/patch/20200204101008.11411-5-olivier.moysan@st.com/
> 
> As a short reminder of our previous discussion, the two main options
> emerging were the following ones:
> 
> - Option1: Use the DFSDM as an hardware accelerator and expose the
> scaled channels on SD modulator side.
> Drawbak: this solution is leading to an very complex datapath, especially
> for scan mode.
> 
> - Option2: Introduce a new IIO device type (so-called backend)
> Retrieve scaling information from SD modulator scaling to expose a single
> IIO device on DFSDM side. This solution is derivated from rcar-gyroadc
> example, but with a more standard approach.
> This was discussed in 
> https://lore.kernel.org/lkml/20210919191414.09270f4e@jic23-huawei/

Naming probably needs a rethink given the actual hardware we are talking about
here is normally called a frontend and so people will be confused...

I'm traveling at the moment, so only going to take a fairly superficial first
look at what you have here.

Jonathan

> 
> The patchset proposed in this RFC implements option2 (backend) solution.
> These patches provide a minimal API implemented as a template.
> The intented use of this API is illustrated through the DFSDM channel
> scaling support basic implementation.
> 
> For sake of simplicity I did not include the related DT binding
> in this serie. 
> 
> Below are some use case examples.
> 
> * DFSDM with SD modulator backend:
>   -------------------------------
> This use case corresponds to the example implemented in this RFC.
> The channel attributes are retrieved from backend by the dfsdm, and
> the resulting scaling is exposed through DFSDM IIO device sysfs
> 
> - Single channel:
> +-------------+  ch attr   +--------+  sysfs (compound scaling)
> | sd0 backend | ---------> | dfsdm0 | -------------------------->
> +-------------+            +--------+
> 
> - Scan mode:
> +-------------+  ch attr   +-------------+  sysfs (compound scaling)
> | sd1 backend | ---------> |   dfsdm1    | -------------------------->
> +-------------+            +-------------+
>                              ^
>                              |
> +-------------+  ch attr     |
> | sd2 backend |--------------+
> +-------------+
> 
> 
> * Voltage divider in front of an adc:
>   ----------------------------------
> By way of example, here is a comparison on scaling management with
> a iio-rescale device, and how it could be managed with a backend device.
> 
> - iio-rescale implementation
> Scaling is exposed both on ADC and iio-rescale IIO devices.
> On iio-rescale device we get the compound scaling
> 
> +---------------------------+  ch attr   +------+  sysfs
> |     iio-rescale (div)     | <--------- | adc0 | ------->
> +---------------------------+            +------+
>   |
>   | sysfs (compound scaling)
>   v
> 
> - Backend implementation:
> Compound scaling is exposed on ADC IIO device.
> No scaling exposed on backend device
> 
> +---------------+  ch attr   +------+  sysfs (compound scaling)
> | backend (div) | ---------> | adc0 | -------------------------->
> +---------------+            +------+
> 
> 
> * Cascaded backends:
>   -----------------
> Backends may be cascaded to allow computation of the whole chain scaling
> This is not part of this RFC, but it is identified as a potential
> future use case.
> 
> +---------------+  attr   +-------------+  attr   +--------+  sysfs
> | backend (div) | ------> | sd0 backend | ------> | dfsdm0 | ------->
> +---------------+         +-------------+         +--------+
> 
> Olivier Moysan (7):
>   iio: introduce iio backend device
>   of: property: add device link support for io-backends
>   iio: adc: stm32-dfsdm: manage dfsdm as a channel provider
>   iio: adc: stm32-dfsdm: adopt generic channel bindings
>   iio: adc: sd_adc_modulator: change to iio backend device
>   iio: adc: stm32-dfsdm: add scaling support to dfsdm
>   ARM: dts: stm32: add dfsdm iio suppport
> 
>  arch/arm/boot/dts/stm32mp157c-ev1.dts |  62 +++++++++
>  drivers/iio/Makefile                  |   2 +
>  drivers/iio/adc/sd_adc_modulator.c    |  92 +++++++++++---
>  drivers/iio/adc/stm32-dfsdm-adc.c     | 176 ++++++++++++++++----------
>  drivers/iio/industrialio-backend.c    |  59 +++++++++
>  drivers/of/property.c                 |   2 +
>  include/linux/iio/backend.h           |  29 +++++
>  7 files changed, 336 insertions(+), 86 deletions(-)
>  create mode 100644 drivers/iio/industrialio-backend.c
>  create mode 100644 include/linux/iio/backend.h
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
