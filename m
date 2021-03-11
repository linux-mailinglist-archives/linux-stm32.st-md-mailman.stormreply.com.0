Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D5E94338192
	for <lists+linux-stm32@lfdr.de>; Fri, 12 Mar 2021 00:38:06 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7D443C5718B;
	Thu, 11 Mar 2021 23:38:06 +0000 (UTC)
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com
 [209.85.167.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 23CCDC56631
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Mar 2021 23:38:05 +0000 (UTC)
Received: by mail-oi1-f180.google.com with SMTP id w65so25005799oie.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Mar 2021 15:38:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=y7PZLngnSiOO6tUFoYHe7nczWb/djDzvqn8CynT2y7o=;
 b=b2rJ6NYdtpvRsYrTydu07Hbmx4KuucnrL02ilCVLMbWyGoSCM5JuPNA0SIk20Buxrw
 Oh7oUZvjjjC0iQHpcwiYsGwSmlZp3cPbWR34ABrpQwzFL/BM3NX+sV+8FPYzCPOw+ofi
 VzULisEMofG367pN45L/GSPzAd+IR9TP6WzLklrASPitwJGBnwKsB41AUiiYv8Af4Oag
 soqwhhbg7skLH9mj/+yzDctmKgkUlK/mjPc53IbweQF4YwS39hFqhrrVqT4JQC8twf9n
 tzySqGOhOX9aVvGEGiQM9cPpOxzOmfyLIsxdAoV+ujtciMM/eNpufnB5In28l9oJdP0X
 QWqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=y7PZLngnSiOO6tUFoYHe7nczWb/djDzvqn8CynT2y7o=;
 b=J9ZR60xLeo7B1JsEuyuHBupzhYFtMqMfcu+6lqnF7+LGqo5APW9ZbDrnAe4yePCyjd
 fcpt0r36XUbUaJ1u60nNX90z0gc8FppxXQLqHffQTNdXAyTnQ1/e5pOtNcgnG3esyvBz
 GscFS8pS49hyyIeiG/nwxvPEIQ0pNyOJeyQwrPF+VpdsNuIgMMqCrd8+n0JUJGbpbUg/
 TaeDF3Xgs2QBx6IBBy9Cl1cQ6+OeUz34YBjgCcB0K87KFi0yYEXGIYFF9WSunvsj+U+q
 vOt4FekgRxjXrpANqlwCMhd4oNFZniKYUADu/4uTNSPeB1Q4fgS6itp5i7mm5A9Wgve/
 f0jg==
X-Gm-Message-State: AOAM533T/PvbrxUyzhBv2MS4AYRvw0qo+W10HO3mLfyTAE0xilhC+CNe
 TaRE8rjxPLosp7cNAh93yhFmjw==
X-Google-Smtp-Source: ABdhPJy3trbQfPJf8Jw30MXwWRENujdAMmMOYHCnCoFk8D7mpra/ivKmRip+qDmcJtYBYf2nNtZqnw==
X-Received: by 2002:a05:6808:140e:: with SMTP id
 w14mr8230991oiv.176.1615505883760; 
 Thu, 11 Mar 2021 15:38:03 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id z8sm987590otp.14.2021.03.11.15.38.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Mar 2021 15:38:03 -0800 (PST)
Date: Thu, 11 Mar 2021 17:38:01 -0600
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Message-ID: <YEqp2US8OykaUAa/@builder.lan>
References: <20210311140413.31725-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210311140413.31725-1-arnaud.pouliquen@foss.st.com>
Cc: Ohad Ben-Cohen <ohad@wizery.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, linux-arm-msm@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Andy Gross <agross@kernel.org>, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH 0/6] rpmsg: enable the use of the
 rpmsg_char device for the Virtio backend
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

On Thu 11 Mar 08:04 CST 2021, Arnaud Pouliquen wrote:

> This series is the first step in the division of the series: 
> "Introduce a generic IOCTL interface for RPMsg channels management"[1]
> 
> The main goal here is to enable the RPMsg char interface for
> the virtio RPMsg backend. 
> 
> In addition some patches have been includes in order to document the
> interface and rename the rpmsg_char_init function.
> 
> It also includes Mathieu Poirier's comments made on [1]
> 
> Patchsets that should be the next steps:
>  - Extract the control part of the char dev and create the rpmsg_ctrl.c
>    file
>  - Introduce the RPMSG_CREATE_DEV_IOCTL IOCTL to instantiate RPMsg devices
> 
> 
> [1]: https://patchwork.kernel.org/project/linux-remoteproc/list/?series=435523
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> Arnaud Pouliquen (6):
>   rpmsg: char: Rename rpmsg_char_init to rpmsg_chrdev_init
>   rpmsg: Move RPMSG_ADDR_ANY in user API
>   rpmsg: Add short description of the IOCTL defined in UAPI.
>   rpmsg: char: Use rpmsg_sendto to specify the message destination
>     address
>   rpmsg: virtio: Register the rpmsg_char device
>   rpmsg: char: Return an error if device already open
> 
>  drivers/rpmsg/qcom_glink_native.c | 16 ++++++++
>  drivers/rpmsg/qcom_smd.c          | 16 ++++++++
>  drivers/rpmsg/rpmsg_char.c        | 11 ++++--
>  drivers/rpmsg/virtio_rpmsg_bus.c  | 62 ++++++++++++++++++++++++++++---
>  include/linux/rpmsg.h             |  3 +-
>  include/uapi/linux/rpmsg.h        | 13 ++++++-
>  6 files changed, 108 insertions(+), 13 deletions(-)
> 
> -- 
> 2.17.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
