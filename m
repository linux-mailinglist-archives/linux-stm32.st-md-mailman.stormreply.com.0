Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 85FF23907AA
	for <lists+linux-stm32@lfdr.de>; Tue, 25 May 2021 19:29:23 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1FA98C5978C;
	Tue, 25 May 2021 17:29:23 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 82134C59789
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 May 2021 17:29:21 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id e17so13545665pfl.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 May 2021 10:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=c1te1fmETHKIo/3PXTYiGotWvN1fuCwdsljvLwzWe+U=;
 b=mJmGP2FKoCUVm6+tCyuoComU94tA6XL0a4R+34I0aN641K+/qGPNewC70RrBwNYeLS
 fzv5aUMrbTS+o+sTSkPJ+mePf1s3kP9cIS9JcAgZIdfDCH1BDFhtpwVNMMRanzz8zQq0
 BbSdOT7QAE5ZkobtNdILsQe1pVvb6KR9fEOYFeT649qVlSJa0F0ZWXgOkE0IZi5qgpY9
 1PNRPwGlZa1b0nSIYqvGjO9xR/+eZP30wZ4wodXz2Nli7p7CcNTWakLxdari5xT7rctB
 e4dSh+BLHefbAGtvH59WKXDneoOTgh0pBNm9Y0QBlXFQrlbqaU1fUN999MT6TP/6dAyi
 XBOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=c1te1fmETHKIo/3PXTYiGotWvN1fuCwdsljvLwzWe+U=;
 b=LU+KaRw9sb6xbRXyNpL4kohVJv/RaNdnEj0LemuzzunPEEDX6ZvLXWJHYPNnJQsjX6
 NEuO9XGhsHl/EkWHi6t0GRxG1O545LLkGRNbGw97a0yANh+zjeCBfPK5mEzPFDulXEZ1
 W01keubnAao291HzSU/05pMrl6PAkawDgR5mW0YoowHKavWgP4EXPjDYWQ9VMfJgQIoW
 Wl8O9BBDPASu9EcuCTrYlzRNZwdQDdA5u4IVjAR+U7z+gm0pba4fXpx32MN/YbxeQk9w
 W2x5BKHLicara2FTU1V/ZW0JdM95cjF6uDVCxKAa+q55tvdAVvSOyDIUP5x55f0Z1+Fv
 8s+Q==
X-Gm-Message-State: AOAM5306ocSehS5YGHTODjCmjwguJj2eiLU4y2Xm2EvYVcqa77XTB4PC
 mc+rS2BuKFsX77pINFir2gsGTw==
X-Google-Smtp-Source: ABdhPJzTx6EvBIS+w3v6j8IhihjLGhwWbR+/AvLMKzy9ad3ht9mD5pnphdwupzdU8DBi2XWRaTYd+w==
X-Received: by 2002:a63:3c0e:: with SMTP id j14mr20301393pga.427.1621963759884; 
 Tue, 25 May 2021 10:29:19 -0700 (PDT)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
 by smtp.gmail.com with ESMTPSA id ge5sm2681961pjb.45.2021.05.25.10.29.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 10:29:18 -0700 (PDT)
Date: Tue, 25 May 2021 11:29:17 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Message-ID: <20210525172917.GA1113058@xps15>
References: <20210517171531.21205-1-arnaud.pouliquen@foss.st.com>
 <20210517171531.21205-2-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210517171531.21205-2-arnaud.pouliquen@foss.st.com>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [Linux-stm32] [PATCH v4 1/4] rpmsg: char: Remove useless include
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

On Mon, May 17, 2021 at 07:15:28PM +0200, Arnaud Pouliquen wrote:
> No facility requests the include of rpmsg_internal.h header file.
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> ---
>  drivers/rpmsg/rpmsg_char.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
> index 2bebc9b2d163..b5907b80727c 100644
> --- a/drivers/rpmsg/rpmsg_char.c
> +++ b/drivers/rpmsg/rpmsg_char.c
> @@ -22,8 +22,6 @@
>  #include <linux/uaccess.h>
>  #include <uapi/linux/rpmsg.h>
>  
> -#include "rpmsg_internal.h"
> -
>  #define RPMSG_DEV_MAX	(MINORMASK + 1)

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

>  
>  static dev_t rpmsg_major;
> -- 
> 2.17.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
