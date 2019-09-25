Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B175BE934
	for <lists+linux-stm32@lfdr.de>; Thu, 26 Sep 2019 01:49:34 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4270CC35E01;
	Wed, 25 Sep 2019 23:49:34 +0000 (UTC)
Received: from mail-yb1-f193.google.com (mail-yb1-f193.google.com
 [209.85.219.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3B107C36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Sep 2019 23:49:32 +0000 (UTC)
Received: by mail-yb1-f193.google.com with SMTP id v6so99213ybe.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Sep 2019 16:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=k9mLt3xvBGQYqXgvvuQtbv73TYKlfgFjBjUgVp0qnQw=;
 b=Mz6cTUt84IXGgN7GfbtlAUT3P8OZ4XIjQsUqjicxykyuBsc/2+eKucFV2n7wBOek5d
 hDv6yELVsr93aswKiKh6beCWKN8KxGzQBFSz5l96eLf366E8/U5yJgkF2onOLEzYuGpy
 MmqUd83SpWPMlbOiClqh7uF+xJLtaYqHE9kf9PLonOfFzjLkOqHPrhry9UaKNfh4FKdt
 UlI1a1E3Jks+g635OnXG/EIMyRUidmRSooforLC0eH4yh1FVK1vwNVh5/1runhUUkqRq
 d4coagceYif32HrnlJUericT2nGAVxG6WhJHXsT7p2UdxrYY2lxgSMdeBiNs0EUU/RGT
 ZVUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=k9mLt3xvBGQYqXgvvuQtbv73TYKlfgFjBjUgVp0qnQw=;
 b=Me5QnD45LXgPeBLNxvuKN5ISTS3a5diOJZsMULqeW1GturT2qTSfQs9MbrXmJXPifr
 csoU8uRMHTb64q6aYkQfX9Ey+8G6gvO3D2kKJp7Lj1cK6NZxt4SycWiz+Ugj871wHdcn
 C4ElLw9QXzX/ZvI//mIeP4nRKbp4scPmfBLXsoXKkphVsNmuMsvGeQzEBYsBdHChqfhO
 Nix9hZ8QIZUraK7oCKlZ2BBgudF75LIylcY7wNaq/vU+t5JeEgKuSPvPschmCKY3ithg
 9HlVN7+cE9/+zCVrvzSZatZb6gt1WMhpcX6NRy4NjU9RuDWA10OHb6y6oxj8X9BfqP9R
 Ay+w==
X-Gm-Message-State: APjAAAXOaiDQIDAJkJoFV12x/xlCfY4p8hT15jn3hCE4yEKlGq4pHJfq
 P4vWb0ZH140KCkcO0cLVlnE/HQXD
X-Google-Smtp-Source: APXvYqwR/caITcJ282u+zi2PrD7+FaXW9ELk/UeVSqScZoBfsW21TB7udKc9KZYQBZ1Bf/aHmdEpfw==
X-Received: by 2002:a25:e0d4:: with SMTP id x203mr157687ybg.131.1569455370860; 
 Wed, 25 Sep 2019 16:49:30 -0700 (PDT)
Received: from icarus (072-189-084-142.res.spectrum.com. [72.189.84.142])
 by smtp.gmail.com with ESMTPSA id i14sm56666ywe.107.2019.09.25.16.49.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Sep 2019 16:49:29 -0700 (PDT)
Date: Wed, 25 Sep 2019 19:49:27 -0400
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: Fabrice Gasnier <fabrice.gasnier@st.com>, jic23@jic23.retrosnub.co.uk
Message-ID: <20190925234927.GB14133@icarus>
References: <1568809323-26079-1-git-send-email-fabrice.gasnier@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1568809323-26079-1-git-send-email-fabrice.gasnier@st.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, jic23@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] counter: stm32-timer-cnt: fix a
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

On Wed, Sep 18, 2019 at 02:22:03PM +0200, Fabrice Gasnier wrote:
> Fix the following warning when documentation is built:
> drivers/counter/stm32-timer-cnt.c:37: warning: cannot understand function
> prototype: 'enum stm32_count_function'
> 
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
> ---
>  drivers/counter/stm32-timer-cnt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/counter/stm32-timer-cnt.c b/drivers/counter/stm32-timer-cnt.c
> index 644ba18..e425dd1 100644
> --- a/drivers/counter/stm32-timer-cnt.c
> +++ b/drivers/counter/stm32-timer-cnt.c
> @@ -28,7 +28,7 @@ struct stm32_timer_cnt {
>  };
>  
>  /**
> - * stm32_count_function - enumerates stm32 timer counter encoder modes
> + * enum stm32_count_function - enumerates stm32 timer counter encoder modes
>   * @STM32_COUNT_SLAVE_MODE_DISABLED: counts on internal clock when CEN=1
>   * @STM32_COUNT_ENCODER_MODE_1: counts TI1FP1 edges, depending on TI2FP2 level
>   * @STM32_COUNT_ENCODER_MODE_2: counts TI2FP2 edges, depending on TI1FP1 level
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
