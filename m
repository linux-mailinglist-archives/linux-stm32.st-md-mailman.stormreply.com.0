Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 30344559EEB
	for <lists+linux-stm32@lfdr.de>; Fri, 24 Jun 2022 19:04:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D32D5C03FC7;
	Fri, 24 Jun 2022 17:04:18 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com
 [209.85.215.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5C068C03FC3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Jun 2022 17:04:17 +0000 (UTC)
Received: by mail-pg1-f176.google.com with SMTP id r66so2975239pgr.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Jun 2022 10:04:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=px0NDP+xMP/FC6x3oq/ZqsG3as1hiZ0Zx10SR0gFPhw=;
 b=Kfjbdfkm0W6Zdy+6MK69FVKokZMdg9L72sU5ZFsa3Erau208+5AqAmdwvFMsFY55I+
 s/scJ1Bj7SkUJSLUVnKzH+nf0Vclteum+FaY3IvrLOvQlNoTvkZ+dKuuKLhfm254o0iL
 Fy3Oy5yEY20TL784MKYQC2IZOxnrb+OgU/TBvKGOS8n6HcIu4fM97s1Q4RjevgLokS16
 yDaTUEX/MqXSl+En9pAv1A2/V8fehscmUhps2kAEf5p8CFQ9EfZnqVij1IuMdFrWMNd+
 wLlHqBOOZZrlZ3JqsHL7dQfmilNLsCTrnlhbEQRmr1lRCp0pZluh6lYDpkAnSFk1t9Eb
 0r3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=px0NDP+xMP/FC6x3oq/ZqsG3as1hiZ0Zx10SR0gFPhw=;
 b=ZkeANvrNUP4DaEIRZ4HQtF1se8BlRs2j43bxjbIwZ6hzm0/gLrNxtxMUBW3k1mFWFR
 MKmNIjl2qeYcvuQ0XXKdHakOd5P44wF5FUcbkfm1hU+TE0UWRVeXopZzs9AO9Yp+22hd
 27mwOKwSf6wwXa0NOhKTYIlUt/2x+eNLK5kfzqLjRPE7DaT2xJvSQb/zQOJP12zMaqu/
 XtrPfILjJvndn37e4cHtKLAxcA9W/vW/a7GwVdTasTT/gkmrnouIdPPoFOH4RCcBINaV
 bhmVusrpoYd294Jst9+RqASn46vaHvHb7KIWqyfxRgNUTNaRcHuADpiOx5DTxls1iD7/
 fRqw==
X-Gm-Message-State: AJIora8T1YfL6VI4aXYLOrp7hVaVrnSjHkAlxbCatQNF83ICSqnmyKkc
 7dorGkyZE8T02XPrcDzClOs/6Q==
X-Google-Smtp-Source: AGRyM1sOrG404HSLruVfY9X5ggzvzt4b2Sj0s8owzQLffqnbgAWCJjQShwdIzThq4iEnPG37oxJ3SQ==
X-Received: by 2002:a62:4ed3:0:b0:525:5a10:d5ac with SMTP id
 c202-20020a624ed3000000b005255a10d5acmr8721428pfb.65.1656090255892; 
 Fri, 24 Jun 2022 10:04:15 -0700 (PDT)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
 by smtp.gmail.com with ESMTPSA id
 k63-20020a632442000000b003fd3a3db089sm1839687pgk.11.2022.06.24.10.04.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jun 2022 10:04:11 -0700 (PDT)
Date: Fri, 24 Jun 2022 11:04:07 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Message-ID: <20220624170407.GB1736477@p14s>
References: <20220425071723.774050-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220425071723.774050-1-arnaud.pouliquen@foss.st.com>
Cc: linux-stm32@st-md-mailman.stormreply.com, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [Linux-stm32] [PATCH] rpmsg: Fix parameter naming for
 announce_create/destroy ops.
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

On Mon, Apr 25, 2022 at 09:17:23AM +0200, Arnaud Pouliquen wrote:
> The parameter associated to the announce_create and
> announce_destroy ops functions is not an endpoint but a rpmsg device.
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> ---
> No fixed sha1 indicated in commit message as issue is present since a
> while, it does not fix a specific sha1.
> 
> git blame highlight the sha1 [1], but issue was present before.
> The commit [1] just moves declaration from rpmsg.h to rpmsg_internal.
> 
> [1] fade037e0fd5 ("rpmsg: Hide rpmsg indirection tables")

This patch is not a candidate for the stable kernel and as such a "Fixes" tag
isn't needed.

> ---
>  drivers/rpmsg/rpmsg_internal.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/rpmsg/rpmsg_internal.h b/drivers/rpmsg/rpmsg_internal.h
> index d4b23fd019a8..ff0b12122235 100644
> --- a/drivers/rpmsg/rpmsg_internal.h
> +++ b/drivers/rpmsg/rpmsg_internal.h
> @@ -41,8 +41,8 @@ struct rpmsg_device_ops {
>  					    rpmsg_rx_cb_t cb, void *priv,
>  					    struct rpmsg_channel_info chinfo);
>  
> -	int (*announce_create)(struct rpmsg_device *ept);
> -	int (*announce_destroy)(struct rpmsg_device *ept);
> +	int (*announce_create)(struct rpmsg_device *rpdev);
> +	int (*announce_destroy)(struct rpmsg_device *rpdev);

I have applied this patch.

Thanks,
Mathieu

>  };
>  
>  /**
> -- 
> 2.24.3
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
