Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6409F8CB282
	for <lists+linux-stm32@lfdr.de>; Tue, 21 May 2024 18:53:55 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1F146C6B47E;
	Tue, 21 May 2024 16:53:55 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
 [209.85.210.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EF156C6B47A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 May 2024 16:53:46 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id
 d2e1a72fcca58-6f47787a0c3so601552b3a.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 May 2024 09:53:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716310425; x=1716915225;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=1mM1g0xrjA2+TMpOMuz+nMei8rdJzFNTaJUyTE9ff1o=;
 b=RDzrWnc4I3lGWTsWTMQ8MYhWzoRa/WWqzTo5sZePJ6VWZHkokWCyxVeu8H++UY2ULS
 OB56NSZ9eTIUJ2Dgnts9Q8dajhwCmiG+FBIjXoAvniuh0AVa1rgEhn7zc3DgvFctGD13
 +gbp6iyYmWvgAd3dyiRYrrLADzR1ot/NOexg5xvCwXoJqkRheP2fQlvgNFW0PfSq25qc
 EAWGLDgebkXnXhlJQwijChiSH7AUgvzMEx6MJh1FKe87WCLpHKMxfYS1aDC7OO+oAx7s
 cl/H9S43aEBBmm6GC97f0XCUKqv1+n+WMmeOlPyp7pyj2Xwok7QpS8ZA6PYo+TxH7egu
 ZQnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716310425; x=1716915225;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1mM1g0xrjA2+TMpOMuz+nMei8rdJzFNTaJUyTE9ff1o=;
 b=f5ltlw8XCJi77n2X1kUDM9WMR7DRjVQsIpoHKU3VHcPUDBAv/5fqs7hy2VKJ4xIYtM
 dYyzKs9KqqxrXzJKhXe1feAvKy5Iy/67nzv54T5EBb/zJcNS9D0fgLHZEaoFMjcrKcyz
 be1oHz2EJ57FTXgjbE1NoPwPXIcAb/aD+MVN5blVTJBVYMwjO/jDXtqxqFfrN7U7SROE
 5tTXZ+dw/vRlNxzQY+Y0qRw0ybL6aYq/H7A9XxrnIBCNhalXmycMYiBN0oBax4OCOd2F
 xk2R1JUmcwyBjx7tkn7yuok9ThzhImo1ih0fx+HkXzKwzQuam7JtI//p8odcY3uQ8dLc
 DjSw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVeq61MMxIyL5qi3NXl/pRwtjE1YsmqIa2SbA+HqkyjZl/gtk/o9168N+FpOrx0eva9JuGsHhcaKhWaXTlb9gq+08c//TZwcrd3anvS78FUdEksKTnEQUsN
X-Gm-Message-State: AOJu0YygINn+yjvbtaUKqOxpFvEYQhZ9q95hTYrFg2cJFUKV1pzFEKO9
 fAWbdST+EjGuH7Krm7904nMyiOROtc4mJQXshcyUqrKklxlBYVs2c4st4LhFspI=
X-Google-Smtp-Source: AGHT+IHhV0gEhBAlCrDzmhUFkEADtc9n6dtJk4+JERFEyQ+wIpi754KQsmFo/JDNnXvh6Bc3efJ+Pg==
X-Received: by 2002:a05:6a00:10c9:b0:6f3:f447:5861 with SMTP id
 d2e1a72fcca58-6f4e026b8f2mr33863693b3a.5.1716310425549; 
 Tue, 21 May 2024 09:53:45 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:df1a:22de:40b2:f110])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-634103f80absm21017394a12.65.2024.05.21.09.53.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 May 2024 09:53:45 -0700 (PDT)
Date: Tue, 21 May 2024 10:53:42 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Message-ID: <ZkzRljZlpCFDOyBx@p14s>
References: <20240517165654.427746-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240517165654.427746-1-arnaud.pouliquen@foss.st.com>
Cc: Bjorn Andersson <andersson@kernel.org>, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] rpmsg: char: fix rpmsg_eptdev structure
	documentation
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

On Fri, May 17, 2024 at 06:56:54PM +0200, Arnaud Pouliquen wrote:
> Add missing @ tags for some rpmsg_eptdev structure parameters.
> 
> This fixes warning messages on build:
> drivers/rpmsg/rpmsg_char.c:75: warning: Function parameter or struct member 'remote_flow_restricted' not described in 'rpmsg_eptdev'
> drivers/rpmsg/rpmsg_char.c:75: warning: Function parameter or struct member 'remote_flow_updated' not described in 'rpmsg_eptdev'
> 
> Fixes: 5550201c0fe2 ("rpmsg: char: Add RPMSG GET/SET FLOWCONTROL IOCTL support")
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> ---
>  drivers/rpmsg/rpmsg_char.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
> index 1cb8d7474428..98d95ce5b6fb 100644
> --- a/drivers/rpmsg/rpmsg_char.c
> +++ b/drivers/rpmsg/rpmsg_char.c
> @@ -52,8 +52,8 @@ static DEFINE_IDA(rpmsg_minor_ida);
>   * @readq:	wait object for incoming queue
>   * @default_ept: set to channel default endpoint if the default endpoint should be re-used
>   *              on device open to prevent endpoint address update.
> - * remote_flow_restricted: to indicate if the remote has requested for flow to be limited
> - * remote_flow_updated: to indicate if the flow control has been requested
> + * @remote_flow_restricted: to indicate if the remote has requested for flow to be limited
> + * @remote_flow_updated: to indicate if the flow control has been requested

I will apply this patch next week when rc1 comes out.

Thanks,
Mathieu

>   */
>  struct rpmsg_eptdev {
>  	struct device dev;
> -- 
> 2.25.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
