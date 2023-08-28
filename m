Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 54DBD78D37E
	for <lists+linux-stm32@lfdr.de>; Wed, 30 Aug 2023 09:15:49 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EC179C6A613;
	Wed, 30 Aug 2023 07:15:48 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 70327C6A617
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Aug 2023 17:37:10 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4534A60CA0;
 Mon, 28 Aug 2023 17:37:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6DF1C433C8;
 Mon, 28 Aug 2023 17:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1693244228;
 bh=tga8GO4N/hA8gXfJc0T7Z7dk0eMHOrpO8lNUy4BnGRo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=X/99MDqJgzRohaiWSvPK4XgGM5jvLQCA3cdak6SM7D+NhIoxHdkAsn/Xyqgr//UBG
 gx/pG/lFtqkacmeFLQfgWcc34Gr6C0YVpRAsQDy2fhiej/iy9ukfYdpg0wdMHv8HPW
 Ot0j8XWnJ2tur5FdB/kmVPZawH8wal9sJ3/6Uz/ydzJuglyDwnbCZRZMt0ZgSk1Pwc
 88Vl54fsCASTbHgufLDLad9/yEVLfX5w6yJ5hwovFMNljaz3Nf7CDnMaNsdQcxVs4M
 iv3c7Kw9fqVmMg6zfCbl6YwG7ucmZaaD1fj7UlxZgMVOhf2Q6du9JpkUHJ1miqbHVx
 CAbAG7yOQCmIQ==
Date: Mon, 28 Aug 2023 18:37:28 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Message-ID: <20230828183728.3e1fbc24@jic23-huawei>
In-Reply-To: <20230808164137.66663-1-andriy.shevchenko@linux.intel.com>
References: <20230808164137.66663-1-andriy.shevchenko@linux.intel.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 30 Aug 2023 07:15:47 +0000
Cc: Lars-Peter Clausen <lars@metafoo.de>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v1 1/1] iio: dac: stm32-dac: Use correct
 header(s) instead of string_helpers.h
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

On Tue,  8 Aug 2023 19:41:37 +0300
Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:

> There is nothing from string_helpers.h used in the driver, correct
> the header inclusion block accordingly.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Applied

> ---
>  drivers/iio/dac/stm32-dac.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/iio/dac/stm32-dac.c b/drivers/iio/dac/stm32-dac.c
> index 15eb44075107..3cab28c7ee3b 100644
> --- a/drivers/iio/dac/stm32-dac.c
> +++ b/drivers/iio/dac/stm32-dac.c
> @@ -11,12 +11,13 @@
>  #include <linux/delay.h>
>  #include <linux/iio/iio.h>
>  #include <linux/kernel.h>
> +#include <linux/kstrtox.h>
>  #include <linux/module.h>
>  #include <linux/mod_devicetable.h>
>  #include <linux/of.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
> -#include <linux/string_helpers.h>
> +#include <linux/string_choices.h>
>  
>  #include "stm32-dac-core.h"
>  

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
