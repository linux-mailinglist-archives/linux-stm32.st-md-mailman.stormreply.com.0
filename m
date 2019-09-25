Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C45ACBE93A
	for <lists+linux-stm32@lfdr.de>; Thu, 26 Sep 2019 01:51:18 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 69104C35E01;
	Wed, 25 Sep 2019 23:51:17 +0000 (UTC)
Received: from mail-yb1-f193.google.com (mail-yb1-f193.google.com
 [209.85.219.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BD858C36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Sep 2019 23:51:16 +0000 (UTC)
Received: by mail-yb1-f193.google.com with SMTP id z7so256333ybg.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Sep 2019 16:51:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=HftsytVFMDTMjOvjkbAMtOhlArps9/JX9Jjmc9dLKZQ=;
 b=aRlz1iQuE+DjKNGAM7trfsPQap93p8t0nJittzSw4bImFRHDIPK/liL5FFSH4YeMQj
 vHILMM2idG5jniZtDrdJwOeYc4fXDlsUIgOHIuZYBnDVLGMnjFG9Pco+v30nyJhbfKXV
 7UOwOhQA1di5+a5aHFLllQDKIw6Cy0cXW74hEhU0exHySTBzlIAk6QYTZkvemxUGz1RQ
 Mzz9+EhJRX1UeSC3i+UowJKRdzfw1p17ibcL+AVmaGOQxtTYr1DKbZTW2QnKw/vftMbJ
 894qarwDx0379RAILnV8XbCaHnNDLhMrRgvD92UEixSTyZtACQJ6Tz+SShy5oAOx9a8F
 AqTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=HftsytVFMDTMjOvjkbAMtOhlArps9/JX9Jjmc9dLKZQ=;
 b=gpFOB0HynXyAfz0ZXIT3pvQj+6w2aHxKKeWZsRg2piKf4x0CGUR2L/uTGvFPnuGQ0A
 y9gROt7xc4KLlZW6SlXWffMcjcu8JnI60YCQtYfkm9/Cy1QPuFzATkFyEqem1DneNDrP
 r9W3hrfO7BM/+1P8L4mH9oWSIqo2dAGUBlTIyzmVMqH8EgkrO6Wdq/EV80PhIoLLoleD
 GXy3eiKZ8rOCfMoR8wtN0glIWXguuWGhd24+2Sqa6WH/29U1i0NkvhXl0FfJx1189J6R
 p9aUKY1yt5ISlSbwuV7Fy6qTpgGVdOdp02Bo/Fx29SqXpILBjEuLQV7nNcse36kIB2jd
 +s4A==
X-Gm-Message-State: APjAAAURNwxwQrE5p0Lq6PauXw34CFG8bilq+ts1FYUjh9At4awwygF6
 EuvKjM6EtmzInHtp42UhTPQ=
X-Google-Smtp-Source: APXvYqypcMHL6DNYe5cgfBsTpZAtPJ4UmiYZB77bn3AlK9hPiQ22hhfSjd8Qceo0JYVvlFvvpD/+6A==
X-Received: by 2002:a25:a246:: with SMTP id b64mr174608ybi.187.1569455475601; 
 Wed, 25 Sep 2019 16:51:15 -0700 (PDT)
Received: from icarus (072-189-084-142.res.spectrum.com. [72.189.84.142])
 by smtp.gmail.com with ESMTPSA id p204sm58674ywp.110.2019.09.25.16.51.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Sep 2019 16:51:14 -0700 (PDT)
Date: Wed, 25 Sep 2019 19:51:12 -0400
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: Fabrice Gasnier <fabrice.gasnier@st.com>, jic23@jic23.retrosnub.co.uk
Message-ID: <20190925235112.GC14133@icarus>
References: <1568809361-26157-1-git-send-email-fabrice.gasnier@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1568809361-26157-1-git-send-email-fabrice.gasnier@st.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, jic23@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] counter: stm32-lptimer-cnt: fix a
	kernel-doc warning
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

On Wed, Sep 18, 2019 at 02:22:41PM +0200, Fabrice Gasnier wrote:
> Fix the following warnings when documentation is built:
> drivers/counter/stm32-lptimer-cnt.c:354: warning: cannot understand
> function prototype: 'enum stm32_lptim_cnt_function'
> 
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
> ---
>  drivers/counter/stm32-lptimer-cnt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/counter/stm32-lptimer-cnt.c b/drivers/counter/stm32-lptimer-cnt.c
> index bbc930a..28b6364 100644
> --- a/drivers/counter/stm32-lptimer-cnt.c
> +++ b/drivers/counter/stm32-lptimer-cnt.c
> @@ -347,7 +347,7 @@ static const struct iio_chan_spec stm32_lptim_cnt_channels = {
>  };
>  
>  /**
> - * stm32_lptim_cnt_function - enumerates stm32 LPTimer counter & encoder modes
> + * enum stm32_lptim_cnt_function - enumerates LPTimer counter & encoder modes
>   * @STM32_LPTIM_COUNTER_INCREASE: up count on IN1 rising, falling or both edges
>   * @STM32_LPTIM_ENCODER_BOTH_EDGE: count on both edges (IN1 & IN2 quadrature)
>   */
> -- 
> 2.7.4

Fixes: 597f55e3f36c ("counter: stm32-lptimer: add counter device")

Jonathan, please pick this fix up through IIO.

Thanks,

William Breathitt Gray
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
