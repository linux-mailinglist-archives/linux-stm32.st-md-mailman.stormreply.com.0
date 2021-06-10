Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 49A4A3A31C5
	for <lists+linux-stm32@lfdr.de>; Thu, 10 Jun 2021 19:10:58 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0FE0EC58D5B;
	Thu, 10 Jun 2021 17:10:58 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D2A06C57B79
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Jun 2021 17:10:56 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id
 x21-20020a17090aa395b029016e25313bfcso4254857pjp.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Jun 2021 10:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=fGe4DY8mKKnygk1FE1mf6upUstyZmptYOrEfvpk5Mh4=;
 b=mdhUfAb6YifrK82K1uc/PcW7Zxwk4vR3l4dsm8mWZeEkgaENHt8dNJfm9RlVGfAeFg
 HXWfyBTRkCAA8Sw4IU5MahyfcRsTv/7i7ZCIWQYC3dG698lzzVo/PsMeIyKPMhZEfBsb
 BteICrFlQFZxM6TsPbdHKk39bzZo97p/pLGzdq0hMwTd3yHSqFH0PS9iTeMImIX2OL8k
 kJkfTNlkVynbsIoVk10EyMZr7Y25M4buoHWx/ITZV395lRP6gJktiI3zgSmSUMMqFbaC
 3ZqEqdOqRYCsDJ8OWLH2tGhy++wUmUBZrwymWmqSBguSYnRrQZPQhIyIP334l1g9wSxW
 MC4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=fGe4DY8mKKnygk1FE1mf6upUstyZmptYOrEfvpk5Mh4=;
 b=BFzc6oZCJS0WtQHgJqzhlKDlNhYDIe6OY5LOdDrrCzTTOhYhZ8K19xPShQ81EeLcLS
 AYyYK5j5BCeeuXoAl6q+EE+ae7oHG4/oh77Ba8V11T1oOZABl4m/+L8nhroZhnHhaObP
 csrgbcwCKgIpSHTmt8qADqXxfSOzFRVQnpViGHT9xGAQ3lsMF3MS8/8vFF/awg+vstlu
 19H+Q6znC848ln+pC1lTbeAYHPo9TWfMpCbr7m+sRq7fJX6lj36kLsCp0SVs34bGYvPj
 C8eKtvGrvsYVi8tbhXUkyHoFk5GH3wliSh4zk8uq1a7ikNZFM40jg0RgSg5xiajnflCy
 g5Dw==
X-Gm-Message-State: AOAM531oxRBxxGL/+VJjy8uOl3mi9mN69Tw9/Ku6rgQNrSsNK0c78uWx
 nuz0559vvDpivbp6RfsvmqPKVw==
X-Google-Smtp-Source: ABdhPJz7u6AlNLguXb+LpDc0K2GTrwuNFStkzdToNRbtHqF0bLOWIe1cPg3HAR319u2Dk5WLeiBA0g==
X-Received: by 2002:a17:90a:7c02:: with SMTP id
 v2mr4377021pjf.118.1623345055266; 
 Thu, 10 Jun 2021 10:10:55 -0700 (PDT)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
 by smtp.gmail.com with ESMTPSA id g6sm3010793pfq.110.2021.06.10.10.10.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jun 2021 10:10:53 -0700 (PDT)
Date: Thu, 10 Jun 2021 11:10:52 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Message-ID: <20210610171052.GF34238@p14s>
References: <20210604160549.2122-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210604160549.2122-1-arnaud.pouliquen@foss.st.com>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [Linux-stm32] [PATCH] rpmsg: Fix rpmsg_create_ept return when
 RPMSG config is not defined
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

On Fri, Jun 04, 2021 at 06:05:49PM +0200, Arnaud Pouliquen wrote:
> This is a minor fix.
> 
> According to the description of the rpmsg_create_ept in rpmsg_core.c
> the function should return NULL on error.
> 

You are correct, and none of the client return an error code either.

> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> ---
>  include/linux/rpmsg.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/linux/rpmsg.h b/include/linux/rpmsg.h
> index d97dcd049f18..a8dcf8a9ae88 100644
> --- a/include/linux/rpmsg.h
> +++ b/include/linux/rpmsg.h
> @@ -231,7 +231,7 @@ static inline struct rpmsg_endpoint *rpmsg_create_ept(struct rpmsg_device *rpdev
>  	/* This shouldn't be possible */
>  	WARN_ON(1);
>  
> -	return ERR_PTR(-ENXIO);
> +	return NULL;

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

>  }
>  
>  static inline int rpmsg_send(struct rpmsg_endpoint *ept, void *data, int len)
> -- 
> 2.17.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
