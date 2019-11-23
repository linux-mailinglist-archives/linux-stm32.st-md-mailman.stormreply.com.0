Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FB1E107F68
	for <lists+linux-stm32@lfdr.de>; Sat, 23 Nov 2019 17:43:40 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CAEFBC36B0B;
	Sat, 23 Nov 2019 16:43:39 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4E01DC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 23 Nov 2019 16:43:38 +0000 (UTC)
Received: from archlinux (cpc149474-cmbg20-2-0-cust94.5-4.cable.virginm.net
 [82.4.196.95])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AADCC2070E;
 Sat, 23 Nov 2019 16:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1574527416;
 bh=NYF7myKhi5RYq2ICOWgPxRYnz2JyYw4d7NLCuexs998=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Nk/sJIrTSqES6rCOA8bglankx0REQQdcXsEMCLyYqPnw4Hjru0nxhRm4SgI96tbxJ
 4Wo63N+9hQULsupg1AmR1hIhtfG66+RoPnkRYAyqaLYZx7hiscYe35iGW5PENVQ/YT
 OOuEY95+uYU0uvtX9WeVRI0j3amoh2qRGZI+ZDW8=
Date: Sat, 23 Nov 2019 16:43:30 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Fabrice Gasnier <fabrice.gasnier@st.com>
Message-ID: <20191123164330.04785b93@archlinux>
In-Reply-To: <1574334317-30014-1-git-send-email-fabrice.gasnier@st.com>
References: <1574334317-30014-1-git-send-email-fabrice.gasnier@st.com>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: lars@metafoo.de, linux-iio@vger.kernel.org, pmeerw@pmeerw.net,
 linux-kernel@vger.kernel.org, mcoquelin.stm32@gmail.com, knaack.h@gmx.de,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] iio: trigger: stm32-timer: remove
 unnecessary update event
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

On Thu, 21 Nov 2019 12:05:17 +0100
Fabrice Gasnier <fabrice.gasnier@st.com> wrote:

> There is no need to explicitly generate update event to update
> timer master mode.
> 
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
Applied to the togreg branch of iio.git and pushed out as testing
for the autobuilders to poke at it

Thanks,

Jonathan

> ---
>  drivers/iio/trigger/stm32-timer-trigger.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/iio/trigger/stm32-timer-trigger.c b/drivers/iio/trigger/stm32-timer-trigger.c
> index a5dfe65..2e0d32a 100644
> --- a/drivers/iio/trigger/stm32-timer-trigger.c
> +++ b/drivers/iio/trigger/stm32-timer-trigger.c
> @@ -297,9 +297,6 @@ static ssize_t stm32_tt_store_master_mode(struct device *dev,
>  			     strlen(master_mode_table[i]))) {
>  			regmap_update_bits(priv->regmap, TIM_CR2, mask,
>  					   i << shift);
> -			/* Make sure that registers are updated */
> -			regmap_update_bits(priv->regmap, TIM_EGR,
> -					   TIM_EGR_UG, TIM_EGR_UG);
>  			return len;
>  		}
>  	}

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
