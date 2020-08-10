Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F6EC241352
	for <lists+linux-stm32@lfdr.de>; Tue, 11 Aug 2020 00:43:12 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2E54AC36B26;
	Mon, 10 Aug 2020 22:43:12 +0000 (UTC)
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com
 [209.85.216.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 00177C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Aug 2020 22:43:09 +0000 (UTC)
Received: by mail-pj1-f66.google.com with SMTP id 2so839158pjx.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Aug 2020 15:43:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=BZRBvIO7zS3GhTZZrI/geBFN/+zTjp/Q6v4hCxIZSGU=;
 b=daq6B7hM6pw3A1WyKOGbx+M1g7vfSG+6pGFUO6gK6OdyWuF8WvtalMocXoQovYw+p4
 /lm0QHg1ntjX5+QWyibavky4SRbhmQbV4hGydqe2Qmio7rEB5pc/ag00xlNxHjFpv2dC
 xrs1cJ0uj7kmtPRyhCtidP+Z6H3CA3a/tiw1Wm7S4isXIqf/cNgqrw5Zz/FwBcF3i4Zu
 cY51BO8kT11zKzsPMLZ/fB9NF9vlJ3FgqED/v+VEvlFe7ICJno+UbXMFU5IJL9lMl+Tf
 zZz4r3AS5sp9ShvgVisIrk8OT5UX/SnA/6pRmdK4PqPdLxeRBCZheUQqxDF/vhcRjbZU
 yWhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=BZRBvIO7zS3GhTZZrI/geBFN/+zTjp/Q6v4hCxIZSGU=;
 b=a7jwBrJNmCrhq9XMQ9AWxBKVxz657GcODmSmOpYDPJ9+xyRII0LbQ5VJObRYo8yasi
 r619oRyBzLQAmeqsZ0jN/wJRcdVH4Nttnj3CBLjReb39rxpPCLeexwBuaGARGzpNEGvu
 cvWmx/nwIXRVo0nSkU+fRTK6lg/lk47InoDwTjGoZj3hu9uoJcFQ2R7TsVXhZVjS0apK
 Lqf4lHjO7hozHBA4rKf3tdU/M3D/khfZ7sdZTL0KtmNIpKqj3rhw/2wl2ryD5a5DV+5u
 HZPfQH9az/tXY8yULVkv7OAm3Lck/6ZZAMd4Xlsz6QEWIp1gmMtrr33RMpSsJUWVLcwT
 wN0A==
X-Gm-Message-State: AOAM533VQMshx4KExmuYEIfhRNozgWRo+HA/TbeYVuid0O2m0KuTu7w2
 JQLU6uqkULwjdy2kj5t/TMWotg==
X-Google-Smtp-Source: ABdhPJx6LGHWc2IoBS8/ZZN9+hyr66SqoaSz21Ur3pvFiSPK0WIdZ54bOdnr9dDQdJnGUD6lUY5rig==
X-Received: by 2002:a17:902:8609:: with SMTP id
 f9mr26697737plo.324.1597099388353; 
 Mon, 10 Aug 2020 15:43:08 -0700 (PDT)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
 by smtp.gmail.com with ESMTPSA id y10sm498949pjv.55.2020.08.10.15.43.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Aug 2020 15:43:07 -0700 (PDT)
Date: Mon, 10 Aug 2020 16:43:06 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Arnaud Pouliquen <arnaud.pouliquen@st.com>
Message-ID: <20200810224306.GF3223977@xps15>
References: <20200731074850.3262-1-arnaud.pouliquen@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200731074850.3262-1-arnaud.pouliquen@st.com>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [Linux-stm32] [PATCH] rpmsg: virtio: fix compilation warning
 for virtio_rpmsg_channel description
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

On Fri, Jul 31, 2020 at 09:48:50AM +0200, Arnaud Pouliquen wrote:
> Complete the virtio_rpmsg_channel structure description to fix a
> compilation warning with W=1 option:
> 
> drivers/rpmsg/virtio_rpmsg_bus.c:95: warning: Cannot understand
>  * @vrp: the remote processor this channel belongs to
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
> ---
>  drivers/rpmsg/virtio_rpmsg_bus.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

> 
> diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
> index 9006fc7f73d0..7d7ed4e5cce7 100644
> --- a/drivers/rpmsg/virtio_rpmsg_bus.c
> +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
> @@ -123,7 +123,12 @@ enum rpmsg_ns_flags {
>  };
>  
>  /**
> - * @vrp: the remote processor this channel belongs to
> + * struct virtio_rpmsg_channel - rpmsg channel descriptor
> + * @rpdev: the rpmsg channel device
> + * @vrp: the virtio remote processor device this channel belongs to
> + *
> + * This structure stores the channel that links the rpmsg device to the virtio
> + * remote processor device.
>   */
>  struct virtio_rpmsg_channel {
>  	struct rpmsg_device rpdev;
> -- 
> 2.17.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
