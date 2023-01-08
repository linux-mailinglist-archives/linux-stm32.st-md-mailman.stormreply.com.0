Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F3C6661544
	for <lists+linux-stm32@lfdr.de>; Sun,  8 Jan 2023 13:58:03 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C64DDC65E59;
	Sun,  8 Jan 2023 12:58:02 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 19971C035BC
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  8 Jan 2023 12:58:01 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A7B4160C63;
 Sun,  8 Jan 2023 12:57:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FD94C433EF;
 Sun,  8 Jan 2023 12:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673182679;
 bh=TxvREl6UDYmnCeKmIm1J8t4vc0IFfK/snhTTrx3rGQY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=V/nkC+C0lUnI/amaOQ28+jUx+I3BND94oxh4UPQ8py0HazQ/K/8fmSSHAHMztjwkI
 gTC0BkeJZR+z4BOjhA59pq9GHSTdwt9bSIeab/9Jfh46mSEEWHemGZ/c3sR06VUnLh
 bHBcmmPbth21RZ+lZI7Kbn1HDHlesu3/qyOcuLbUkUVYH9rsOGEDgMxAhMHL71jibe
 QLmzOXUTu9wFy1hKOXd82TSAV7mBrd5L606wluM6knLwmNHFe+CKR9frYOomM50yQN
 MqFOdo9UBWd1iQhsB8mUdiNhw5bZsCddgSEkjKE3Q40VDASLZM2JiD8cljWfvYoiHr
 ZS5mAlJZjYyQA==
Date: Sun, 8 Jan 2023 13:11:26 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Olivier Moysan <olivier.moysan@foss.st.com>
Message-ID: <20230108131126.39e15757@jic23-huawei>
In-Reply-To: <20230105125331.328275-1-olivier.moysan@foss.st.com>
References: <20230105125331.328275-1-olivier.moysan@foss.st.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.36; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: Lars-Peter Clausen <lars@metafoo.de>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2] iio: adc: stm32-dfsdm: add id
	registers support
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

On Thu, 5 Jan 2023 13:53:30 +0100
Olivier Moysan <olivier.moysan@foss.st.com> wrote:

> Add support of identification registers to STM32 DFSDM
> to allow hardware capabilities discovery and configuration check.
> The number of filters and channels, are read from registers,
> when they are available.
> 
> Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
One minor thing inline. I'll tweak it whilst applying.


Applied with that tweak to the togreg branch of iio.git and pushed out
as testing for 0-day etc to look at it.

Thanks,

Jonathan

> ---
> Changes in v2:
> - Add and update comments
> - Remove useless masks



> diff --git a/drivers/iio/adc/stm32-dfsdm.h b/drivers/iio/adc/stm32-dfsdm.h
> index 4afc1f528b78..b64cfb42c549 100644
> --- a/drivers/iio/adc/stm32-dfsdm.h
> +++ b/drivers/iio/adc/stm32-dfsdm.h
> @@ -13,25 +13,29 @@

...

>  /*
> @@ -231,6 +235,28 @@
>  #define DFSDM_AWCFR_AWHTF_MASK	GENMASK(15, 8)
>  #define DFSDM_AWCFR_AWHTF(v)	FIELD_PREP(DFSDM_AWCFR_AWHTF_MASK, v)
>  
> +/*
> + * Identification register definitions
> + */
> +#define DFSDM_HWCFGR		0x7F0
> +#define DFSDM_VERR		0x7F4
> +#define DFSDM_IPIDR		0x7F8
> +#define DFSDM_SIDR		0x7FC
> +
> +/* HWCFGR: Hardware configuration register */
> +#define DFSDM_HWCFGR_NBT_SHIFT	0

The _SHIFT macros don't add anything useful over using
the _MASK ones directly.  So drop them.

> +#define DFSDM_HWCFGR_NBT_MASK	GENMASK(7, 0)
> +#define DFSDM_HWCFGR_NBF_SHIFT	8
> +#define DFSDM_HWCFGR_NBF_MASK	GENMASK(15, 8)
> +
> +/* VERR: Version register */
> +#define DFSDM_VERR_MINREV_SHIFT	0
> +#define DFSDM_VERR_MINREV_MASK	GENMASK(3, 0)
> +#define DFSDM_VERR_MAJREV_SHIFT	4
> +#define DFSDM_VERR_MAJREV_MASK	GENMASK(7, 4)
> +
> +#define STM32MP15_IPIDR_NUMBER	0x00110031
> +
>  /* DFSDM filter order  */
>  enum stm32_dfsdm_sinc_order {
>  	DFSDM_FASTSINC_ORDER, /* FastSinc filter type */

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
