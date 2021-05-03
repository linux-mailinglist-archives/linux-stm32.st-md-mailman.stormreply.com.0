Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DB3B371ED7
	for <lists+linux-stm32@lfdr.de>; Mon,  3 May 2021 19:42:45 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EE251C59783;
	Mon,  3 May 2021 17:42:44 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A1256C32EA7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  3 May 2021 17:42:42 +0000 (UTC)
Received: by mail-pj1-f41.google.com with SMTP id
 fa21-20020a17090af0d5b0290157eb6b590fso2448924pjb.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 03 May 2021 10:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=YwS8hQU33H1/ZeBZdRBG9ZJ/sKIODEM23v4su4rhiCc=;
 b=dIevIsu+BecbCDIM9vCBTdsPIaXduatZL5c7A0AoUn5fKQ0NyNS3wvgxnmo+3iz1OB
 bv9uA4L1dDIlulUeRitvUnI+TG+9ndoRh1q3j5wywyfDcEg2EMWAZCsAkUZ0sktXgrMw
 gLDSgKJDMfHs6Y8JvuewH3RIv/4xjjbFKC1o3m7Nf5gEc0Qx5+78Ah6pO26iiV1NN/J6
 OwWCCVIFiE9wze5yMp5o769ro4M3+RI9gb9VTi/vesW1Ao2Dk/Qzd6cVttXI8yV1FpVu
 rd3DqiPKVvl9S3tNnIB4SjimSDxqyksXs8kqfHXp9AcQnXzjzH4KTvAX0gFJyATFhjC0
 yHQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=YwS8hQU33H1/ZeBZdRBG9ZJ/sKIODEM23v4su4rhiCc=;
 b=Ds1T7u5tTXTnyWSAEviNV68ADD5yGFk6idN01VLS90Gh5uEZM4RCcb61+ZI+qaC/bH
 K1OTnacRvhrXVrMwpY50djYgfSzaWXO58Aeo0bocIUbFBNcyrog6ld9EJQhvlUHTQrZM
 ySIrMXPbxlXWSLBIuzC3Acc54UmbjklcaE9My2skxALlCnnuw8TpHLToqIsPMcxgDBV1
 0pYpZfNAVOTwWIVAfbhQGPQXNVL+LiOYudHjAbVRhBGtnYqARyqdcC9Vpr/kk8oM805S
 SjL+19wKDzbVPshSKDC0eYfzncuVaibjya1JUORu/m2ADxuo2zmEPyrrHHQag1d8mbjf
 3xKA==
X-Gm-Message-State: AOAM531WbcV3bbWAe2obwD1lX98XsShVrU4NoUw7iFaE6jatJBSm4+05
 GCJmKqNLPJENoVDxC9AwPNkEMA==
X-Google-Smtp-Source: ABdhPJzTQEVa1Em9j/IFmpfCNW+75vCOby+/gmN3VVIzRlRGpxwsE43eZzakv3nxEXUiOCvj5fYExg==
X-Received: by 2002:a17:90a:9f02:: with SMTP id
 n2mr16264556pjp.190.1620063761016; 
 Mon, 03 May 2021 10:42:41 -0700 (PDT)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
 by smtp.gmail.com with ESMTPSA id u20sm194311pgl.27.2021.05.03.10.42.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 May 2021 10:42:40 -0700 (PDT)
Date: Mon, 3 May 2021 11:42:38 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Message-ID: <20210503174238.GD1699665@xps15>
References: <20210429080639.6379-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210429080639.6379-1-arnaud.pouliquen@foss.st.com>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [Linux-stm32] [PATCH] rpmsg: char: Remove useless includes
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

On Thu, Apr 29, 2021 at 10:06:39AM +0200, Arnaud Pouliquen wrote:
> Remove includes that are not requested to build the module.
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> ---
> applied without issue on Bjorn next branch (dc0e14fa833b)
> ---
>  drivers/rpmsg/rpmsg_char.c | 9 ---------
>  1 file changed, 9 deletions(-)
> 
> diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
> index 2bebc9b2d163..e4e54f515af6 100644
> --- a/drivers/rpmsg/rpmsg_char.c
> +++ b/drivers/rpmsg/rpmsg_char.c
> @@ -10,19 +10,10 @@
>   * was based on TI & Google OMX rpmsg driver.
>   */
>  #include <linux/cdev.h>
> -#include <linux/device.h>

This is where the declaration for struct device is along with other goodies like
get/put_device().

> -#include <linux/fs.h>

That is where struct file is declared.

> -#include <linux/idr.h>

This is where you get ida_simple_get() and ida_simple_remove() from.

>  #include <linux/kernel.h>
>  #include <linux/module.h>
> -#include <linux/poll.h>

This is where struct poll_table and poll_wait() comes from.

>  #include <linux/rpmsg.h>
>  #include <linux/skbuff.h>
> -#include <linux/slab.h>

This gives you kzalloc() and kfree().

> -#include <linux/uaccess.h>

This gives you copy_from_user().

> -#include <uapi/linux/rpmsg.h>

This gives you RPMSG_CREATE_EPT_IOCTL and RPMSG_DESTROY_EPT_IOCTL.

> -
> -#include "rpmsg_internal.h"

That one I agree with.

Thanks,
Mathieu

>  
>  #define RPMSG_DEV_MAX	(MINORMASK + 1)
>  
> -- 
> 2.17.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
