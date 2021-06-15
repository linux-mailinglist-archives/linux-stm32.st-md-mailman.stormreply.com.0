Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D5913A8804
	for <lists+linux-stm32@lfdr.de>; Tue, 15 Jun 2021 19:48:30 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 59A19C597AE;
	Tue, 15 Jun 2021 17:48:30 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 37893C3FADC
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Jun 2021 17:48:29 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id h12so8857076plf.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Jun 2021 10:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=1zxWWH5viqfAr6sUMJsjqthPFquxVNQ/+2gZK8GZHEU=;
 b=W1KDjeJo1cBehCZp2FSA8WVvWq4LYFsAmqIeEOVO58/J/QguNi9YAWBPsskjFVIbpx
 0LPXzEcxwXLZ+tgAuxVMYfJXbBeQXUCUZUqWn/U9K9TDHIL/WCN1Ho1sBP7WyqZSgZPo
 WlV48EsL9I0E2wgh0EEHPKDyn/eqvJXS8jAiMfnl+I+2dZjS5MiGV71YSVpY+R0JQTtE
 6VXYyI9ol518Gak+0Q/+2iZ6VlubHQxfIfDdA9ZkJW1Nho8mZxglpB5/FK/XdZCaPdZM
 m81n9n8dF/h4dWf4QILpUcpHShIEB/nIoy0jdLM088PCEh0Y8r3FZlx5PhGgYnwj+rq+
 B+OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=1zxWWH5viqfAr6sUMJsjqthPFquxVNQ/+2gZK8GZHEU=;
 b=rEXbHT/JrYR1c3OjDos9XCC3sD38sDumtAEClrdvtfvjvoTD0W5MACj5txoSFVXiYO
 GUD80oB8yu/6pSnLxPSzcG4Qg1dT9yteQHeO3S/fzwRZyOuJrsgONgS74q5eDpxyWxlK
 Qr7XuazI8E6xRIkxQ6KzzIrOfdwa2rgg1fhzJ1GDwJDrKnmuOHUNwBjcwYA49UwTVWIZ
 +YY0lkhoxHebNpjD6DOKLp1LCVojQPqJiPel1rGbaphfjgAOq0Avgk0jUNBVqvhOkUoM
 DT7qfWoQOFJJHp2zNyCQqDU6pQcLNrgtXTtEREV/sHU8d8nXd/w/I3iC7jQA+nyUekPP
 jnrQ==
X-Gm-Message-State: AOAM530ZfV3e2m61JrmtyNJ07M6AGHWzEMq+jzWUcgQ7QzlkGPfz9Lu/
 QbFpgAdF8d/idbHfyKT0m9nwWA==
X-Google-Smtp-Source: ABdhPJyszR7HGXp7Wtg+9mMiJpdT9xu41oqbEma8mNjUvAEcaTvlZie+cr1iuLr904fwvWGPoqFQww==
X-Received: by 2002:a17:90a:5998:: with SMTP id
 l24mr358719pji.169.1623779307427; 
 Tue, 15 Jun 2021 10:48:27 -0700 (PDT)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
 by smtp.gmail.com with ESMTPSA id 11sm16696147pge.57.2021.06.15.10.48.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jun 2021 10:48:26 -0700 (PDT)
Date: Tue, 15 Jun 2021 11:48:24 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Message-ID: <20210615174824.GC604521@p14s>
References: <20210604091406.15901-1-arnaud.pouliquen@foss.st.com>
 <20210604091406.15901-5-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210604091406.15901-5-arnaud.pouliquen@foss.st.com>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [Linux-stm32] [PATCH 4/4] rpmsg: Add a removable attribute to
	the rpmsg device
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

On Fri, Jun 04, 2021 at 11:14:06AM +0200, Arnaud Pouliquen wrote:
> Adds a new attribute to the rpmsg device to expose in sysfs the
> the removability of an rpmsg device.
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> ---
>  drivers/rpmsg/rpmsg_core.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/rpmsg/rpmsg_core.c b/drivers/rpmsg/rpmsg_core.c
> index e5daee4f9373..b2543ef4a92f 100644
> --- a/drivers/rpmsg/rpmsg_core.c
> +++ b/drivers/rpmsg/rpmsg_core.c
> @@ -413,6 +413,7 @@ rpmsg_show_attr(src, src, "0x%x\n");
>  rpmsg_show_attr(dst, dst, "0x%x\n");
>  rpmsg_show_attr(announce, announce ? "true" : "false", "%s\n");
>  rpmsg_string_attr(driver_override, driver_override);
> +rpmsg_show_attr(removable, us_removable ? "true" : "false", "%s\n");
>  
>  static ssize_t modalias_show(struct device *dev,
>  			     struct device_attribute *attr, char *buf)
> @@ -435,6 +436,7 @@ static struct attribute *rpmsg_dev_attrs[] = {
>  	&dev_attr_src.attr,
>  	&dev_attr_announce.attr,
>  	&dev_attr_driver_override.attr,
> +	&dev_attr_removable.attr,

And this patch shouldn't be needed if we move forward with my recommendation on
patch 3/4.

>  	NULL,
>  };
>  ATTRIBUTE_GROUPS(rpmsg_dev);
> -- 
> 2.17.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
