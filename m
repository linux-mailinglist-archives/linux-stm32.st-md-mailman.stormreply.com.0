Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D69CB338F4
	for <lists+linux-stm32@lfdr.de>; Mon, 25 Aug 2025 10:32:09 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 31810C36B29;
	Mon, 25 Aug 2025 08:32:09 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A333AC36B1F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 Aug 2025 08:32:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 639504324A;
 Mon, 25 Aug 2025 08:32:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 833F4C4CEED;
 Mon, 25 Aug 2025 08:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756110726;
 bh=YtLquqnrZFkL+9TrwMrCafRYQgPgCKY67KeGNrtiSPY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=rp2A+/RyJolPR8cWUJlVT1SQ5O2QvNnnBaXZpgc497a4bqRfsfnGKyxRWXVaF2z5h
 sKfZZFcYCUiY1AQue7/udSAtjsA/YV9MuvSmc2Xod0WF/RKgS8xp/cCXZIZaMvwsTJ
 iPder646D5Cpcm/lqe30SdiEAH+3vnj2lUa2bfUNCs+B7Qibul7iawHSm3czGpw/7D
 NnMxGWMXaCUgA0HQ/wgLNUlN/ceKbTio9Ox8LCT0jiH3txBkvCUIzbH8i5Uol8oYhK
 qr1wlTV4h0/W/maZJdovsHVQSIYrNd3cnXuRq3tKN0qPoP2Zd9uUbkFkU9lTYAcuWb
 tBQTB0fVzNq0g==
Date: Mon, 25 Aug 2025 09:31:50 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Dixit Parmar <dixitparmar19@gmail.com>
Message-ID: <20250825093150.3ba23f2a@jic23-huawei>
In-Reply-To: <20250822-enomam_logs-v1-0-db87f2974552@gmail.com>
References: <20250822-enomam_logs-v1-0-db87f2974552@gmail.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: imx@lists.linux.dev, Crt Mori <cmo@melexis.com>, linux-iio@vger.kernel.org,
 Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Haibo Chen <haibo.chen@nxp.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Lars-Peter Clausen <lars@metafoo.de>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 David Lechner <dlechner@baylibre.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>, Ray Jui <rjui@broadcom.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-samsung-soc@vger.kernel.org,
 Cai Huoqing <cai.huoqing@linux.dev>, Andreas Klinger <ak@it-klinger.de>,
 linux-arm-kernel@lists.infradead.org, Andy Shevchenko <andy@kernel.org>,
 Support Opensource <support.opensource@diasemi.com>,
 Scott Branden <sbranden@broadcom.com>, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Shawn Guo <shawnguo@kernel.org>
Subject: Re: [Linux-stm32] [PATCH 00/10] iio: Drop unnecessary -ENOMEM
	messages
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

On Fri, 22 Aug 2025 09:19:48 +0530
Dixit Parmar <dixitparmar19@gmail.com> wrote:

> The drivers do not require their own error messages for error
> -ENOMEM, memory allocation failures. So remove the dev_err
> messages from the probe().
> With these patches, all the iio drivers now has uniform handling
> of the -ENOMEM while device_allocation and trigger_allocation
> calls.
> 
> Signed-off-by: Dixit Parmar <dixitparmar19@gmail.com>
Series looks fine to me, after the minor tweaks to commit messages
that Andy requested.  However as it touches a lot of drivers
I'd like to leave it on list a little longer.

Thanks,

Jonathan

> ---
> Dixit Parmar (10):
>       iio: accel: Drop unnecessary -ENOMEM messages
>       iio: adc: Drop unnecessary -ENOMEM messages
>       iio: dac: Drop unnecessary -ENOMEM messages
>       iio: health: Drop unnecessary -ENOMEM messages
>       iio: humidity: Drop unnecessary -ENOMEM messages
>       iio: light: Drop unnecessary -ENOMEM messages
>       iio: potentiostat: Drop unnecessary -ENOMEM messages
>       iio: pressure: Drop unnecessary -ENOMEM messages
>       iio: proximity: Drop unnecessary -ENOMEM messages
>       iio: temperature: Drop unnecessary -ENOMEM messages
> 
>  drivers/iio/accel/bma220_spi.c      | 4 +---
>  drivers/iio/accel/dmard06.c         | 4 +---
>  drivers/iio/accel/dmard09.c         | 4 +---
>  drivers/iio/accel/dmard10.c         | 4 +---
>  drivers/iio/accel/mc3230.c          | 4 +---
>  drivers/iio/accel/mma7660.c         | 4 +---
>  drivers/iio/accel/stk8312.c         | 4 +---
>  drivers/iio/accel/stk8ba50.c        | 4 +---
>  drivers/iio/adc/ad7949.c            | 4 +---
>  drivers/iio/adc/bcm_iproc_adc.c     | 4 +---
>  drivers/iio/adc/cpcap-adc.c         | 6 ++----
>  drivers/iio/adc/da9150-gpadc.c      | 5 ++---
>  drivers/iio/adc/dln2-adc.c          | 9 +++------
>  drivers/iio/adc/exynos_adc.c        | 4 +---
>  drivers/iio/adc/imx7d_adc.c         | 4 +---
>  drivers/iio/adc/imx8qxp-adc.c       | 4 +---
>  drivers/iio/adc/mxs-lradc-adc.c     | 4 +---
>  drivers/iio/adc/palmas_gpadc.c      | 4 +---
>  drivers/iio/adc/rn5t618-adc.c       | 4 +---
>  drivers/iio/adc/stm32-dfsdm-adc.c   | 4 +---
>  drivers/iio/adc/stmpe-adc.c         | 4 +---
>  drivers/iio/adc/ti-adc084s021.c     | 4 +---
>  drivers/iio/adc/ti-ads131e08.c      | 8 ++------
>  drivers/iio/adc/ti_am335x_adc.c     | 5 ++---
>  drivers/iio/adc/twl4030-madc.c      | 4 +---
>  drivers/iio/adc/viperboard_adc.c    | 4 +---
>  drivers/iio/dac/ad5380.c            | 4 +---
>  drivers/iio/dac/ad5764.c            | 4 +---
>  drivers/iio/dac/ds4424.c            | 4 +---
>  drivers/iio/dac/ti-dac7311.c        | 4 +---
>  drivers/iio/dac/vf610_dac.c         | 4 +---
>  drivers/iio/health/afe4403.c        | 4 +---
>  drivers/iio/health/afe4404.c        | 4 +---
>  drivers/iio/humidity/am2315.c       | 4 +---
>  drivers/iio/humidity/dht11.c        | 4 +---
>  drivers/iio/light/stk3310.c         | 4 +---
>  drivers/iio/potentiostat/lmp91000.c | 4 +---
>  drivers/iio/pressure/dlhl60d.c      | 4 +---
>  drivers/iio/proximity/ping.c        | 4 +---
>  drivers/iio/proximity/srf04.c       | 4 +---
>  drivers/iio/temperature/mlx90632.c  | 4 +---
>  41 files changed, 47 insertions(+), 130 deletions(-)
> ---
> base-commit: d7b8f8e20813f0179d8ef519541a3527e7661d3a
> change-id: 20250822-enomam_logs-f66642957fb3
> 
> Best regards,

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
