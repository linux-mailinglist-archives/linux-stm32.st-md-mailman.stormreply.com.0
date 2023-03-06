Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BA1F6AFF55
	for <lists+linux-stm32@lfdr.de>; Wed,  8 Mar 2023 08:00:29 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2AE8EC6B473;
	Wed,  8 Mar 2023 07:00:29 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2216FC57B6A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  6 Mar 2023 20:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678134512; x=1709670512;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=CA7BTCx5BD3LXUxERremA+1xEefI7Dn8mQX68Jkkois=;
 b=kxhvvNE/qME9b1xKfpwBTUsPXbW0LXOS5IOOf1MW90tzfB5TQoVXpZpO
 5sNdY6QdTA6tSHfM1T5hzMASvHA9/U5zrntCpBhFr/PJtHxCww6lXTa8F
 eNa3h2IyhSf0aRazySp4bmwIWUObj94Y5F0NNuv+okw4HkpdBDaOSdOZz
 s0cvyQekAzs1QaHokY0EWG+thO2Cw9fFIgeF+MgbN0iSEfAr2kPliLLQ5
 5H2DzNdLHsrgPbTfgF5Z/h14d6Shl+8Yb65nofpUTIb2KLXXsuLS2ECIJ
 HOi3RNNXNs6eX57w9YM9eu0jTYe1ZALjy30r+3df9HhXj/ekzBqGf75nO Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="316066548"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; d="scan'208";a="316066548"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2023 12:28:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="850432582"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; d="scan'208";a="850432582"
Received: from donaldjo-mobl.amr.corp.intel.com (HELO [10.212.158.155])
 ([10.212.158.155])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2023 12:28:29 -0800
Message-ID: <29e8ec12-4d16-748c-569a-dba5073e4819@linux.intel.com>
Date: Mon, 6 Mar 2023 12:28:29 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.2
Content-Language: en-US
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Schspa Shi <schspa@gmail.com>, Marc Zyngier <maz@kernel.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-pwm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 patches@opensource.cirrus.com
References: <20230306195556.55475-1-andriy.shevchenko@linux.intel.com>
 <20230306195556.55475-14-andriy.shevchenko@linux.intel.com>
From: Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>
In-Reply-To: <20230306195556.55475-14-andriy.shevchenko@linux.intel.com>
X-Mailman-Approved-At: Wed, 08 Mar 2023 07:00:24 +0000
Cc: Andy Shevchenko <andy@kernel.org>, Semi Malinen <semi.malinen@ge.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, Nandor Han <nandor.han@ge.com>,
 Doug Berger <opendmb@gmail.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [Linux-stm32] [PATCH v1 13/16] gpio: wcove: Utilize helpers
 from string_choices.h
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

Hi,

On 3/6/23 11:55 AM, Andy Shevchenko wrote:
> There are a few helpers available to convert a boolean variable
> to the dedicated string literals depending on the application.
> Use them in the driver.
> 
> While at, utilize specifier field for padding the strings where
> it's required.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Looks good to me.

Acked-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>

> ---
>  drivers/gpio/gpio-wcove.c | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-wcove.c b/drivers/gpio/gpio-wcove.c
> index c18b6b47384f..8d30fd04dede 100644
> --- a/drivers/gpio/gpio-wcove.c
> +++ b/drivers/gpio/gpio-wcove.c
> @@ -15,6 +15,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/regmap.h>
>  #include <linux/seq_file.h>
> +#include <linux/string_choices.h>
>  
>  /*
>   * Whiskey Cove PMIC has 13 physical GPIO pins divided into 3 banks:
> @@ -391,14 +392,14 @@ static void wcove_gpio_dbg_show(struct seq_file *s, struct gpio_chip *chip)
>  			break;
>  		}
>  
> -		seq_printf(s, " gpio-%-2d %s %s %s %s ctlo=%2x,%s %s\n",
> -			   gpio, ctlo & CTLO_DIR_OUT ? "out" : "in ",
> -			   ctli & 0x1 ? "hi" : "lo",
> -			   ctli & CTLI_INTCNT_NE ? "fall" : "    ",
> -			   ctli & CTLI_INTCNT_PE ? "rise" : "    ",
> +		seq_printf(s, " gpio-%-2d %-3.3s %-2.2s %-4.4s %-4.4s ctlo=%2x,%-6.6s %s\n",
> +			   gpio, str_out_in(ctlo & CTLO_DIR_OUT),
> +			   str_hi_lo(ctli & BIT(0)),
> +			   ctli & CTLI_INTCNT_NE ? "fall" : "",
> +			   ctli & CTLI_INTCNT_PE ? "rise" : "",
>  			   ctlo,
> -			   irq_mask & mask ? "mask  " : "unmask",
> -			   irq_status & mask ? "pending" : "       ");
> +			   irq_mask & mask ? "mask" : "unmask",
> +			   irq_status & mask ? "pending" : "");
>  	}
>  }
>  

-- 
Sathyanarayanan Kuppuswamy
Linux Kernel Developer
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
