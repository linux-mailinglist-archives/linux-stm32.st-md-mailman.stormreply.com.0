Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F2CE191474
	for <lists+linux-stm32@lfdr.de>; Tue, 24 Mar 2020 16:31:29 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E186EC36B0B;
	Tue, 24 Mar 2020 15:31:28 +0000 (UTC)
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
 [209.85.166.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7C00DC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Mar 2020 15:31:27 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id v3so18455740iot.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Mar 2020 08:31:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TvsXpRudrZXefQZMYk6cuc0cWu2RbTQ4gqZzuO1RbrE=;
 b=BjHea3wsg4pgRhuX5WvEm0e9slsyWVMuRNw2u5Xiba9mrWowe3NHzi4SMiyOfhRZl2
 VHDjDIl3XwbleetS0cuDb3fDQmZNs4rtS5UMl6A/IqxHlA8aVz2dgfdAnwibWW3zHMJO
 n2aHiBktj1ddQWYVNRo/NJaqEgppcrEZFUixzc7tqvXoNjZCCbBfSXvlXCxi0tSpDzgn
 PnB0zxefpTre2CedKpmwwlVJvSdiN/tui9ky+kB2VGxExJ2YYcZvF97AiqIUV1iHsU44
 8PeuvVizzF3Lv/O2Bjg/nLDrz3V3einDnFaD6unLfWe0DvAjH7zUFur458nDcdXefd/A
 OWMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TvsXpRudrZXefQZMYk6cuc0cWu2RbTQ4gqZzuO1RbrE=;
 b=e9msosKu0HYbGPYAjdj3ZdGxw8AXy3BQ525R/BJbWrLFkwhP1tdl+p07l1hY98g10P
 Lv0q8Kwok8rjnHh9mfJ/uV35xr9YfO96T5JXb+tn2CHYVlLk7UQPvsZt6m4v5lHL6ZV8
 oEWfYh1LAeC/0h1HUtlfamrDPHd9zjQu2iPMcKbYNJrb/FxGOKIkoXbsAw8JD3eF2S1v
 WA3s+QpOHe1xxwnc2LWYI/kCghimCEzxEFzm1onGd4fIGp94wV7CYDWItMDUGMwMBYe6
 oLblCFK7V/b57zGENuJe1KAO1W3mirYm0mNqT5DxOsukIdjLNBYdOor+J6INEY6XMU+e
 iuyg==
X-Gm-Message-State: ANhLgQ32a7rBQSeodjYr1DE370Qdnh2isyZNj5zN/d7pfGMDKvFzbJmc
 /Qv8H7NjEdEM1uF2VYMlX0qWykOGbSA4UWXA/NFbQQ==
X-Google-Smtp-Source: ADFU+vuvx4HnHO0hvtSOlMwQMQBrgQYOkwH/y5TjDGcYLA1l6gQGvtVy1A0STfXLgY8fOuyRtSObqclduiOLIK8p0pg=
X-Received: by 2002:a6b:ed17:: with SMTP id n23mr24380151iog.165.1585063886297; 
 Tue, 24 Mar 2020 08:31:26 -0700 (PDT)
MIME-Version: 1.0
References: <20200324042213.GA10452@asgard.redhat.com>
In-Reply-To: <20200324042213.GA10452@asgard.redhat.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Tue, 24 Mar 2020 09:31:15 -0600
Message-ID: <CANLsYkwVybRG9L6gDJTzZ=eXut66vJYfuEtOfLzaYaVpdybT1A@mail.gmail.com>
To: Eugene Syromiatnikov <esyr@redhat.com>
Cc: Michael Williams <michael.williams@arm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Chunyan Zhang <zhang.chunyan@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "Dmitry V. Levin" <ldv@altlinux.org>, Pratik Patel <pratikp@codeaurora.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH] coresight: do not use the BIT() macro in
	the UAPI header
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

On Mon, 23 Mar 2020 at 22:22, Eugene Syromiatnikov <esyr@redhat.com> wrote:
>
> The BIT() macro definition is not available for the UAPI headers
> (moreover, it can be defined differently in the user space); replace
> its usage with the _BITUL() macro that is defined in <linux/const.h>.
>
> Fixes: 237483aa5cf4 ("coresight: stm: adding driver for CoreSight STM component")
> Signed-off-by: Eugene Syromiatnikov <esyr@redhat.com>
> ---
>  include/uapi/linux/coresight-stm.h | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/include/uapi/linux/coresight-stm.h b/include/uapi/linux/coresight-stm.h
> index aac550a..8847dbf 100644
> --- a/include/uapi/linux/coresight-stm.h
> +++ b/include/uapi/linux/coresight-stm.h
> @@ -2,8 +2,10 @@
>  #ifndef __UAPI_CORESIGHT_STM_H_
>  #define __UAPI_CORESIGHT_STM_H_
>
> -#define STM_FLAG_TIMESTAMPED   BIT(3)
> -#define STM_FLAG_GUARANTEED    BIT(7)
> +#include <linux/const.h>
> +
> +#define STM_FLAG_TIMESTAMPED   _BITUL(3)
> +#define STM_FLAG_GUARANTEED    _BITUL(7)

Greg, if you want to pick this up right away:

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

Otherwise let me know and I'll add it to my next tree.

Thanks,
Mathieu

>
>  /*
>   * The CoreSight STM supports guaranteed and invariant timing
> --
> 2.1.4
>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
