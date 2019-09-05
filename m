Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A083AA684
	for <lists+linux-stm32@lfdr.de>; Thu,  5 Sep 2019 16:51:53 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C6594C35E01;
	Thu,  5 Sep 2019 14:51:52 +0000 (UTC)
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
 [209.85.166.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 51C36C36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  5 Sep 2019 14:42:20 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id s21so5465636ioa.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 05 Sep 2019 07:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bdAudQZ0HCJ8TRBm9ijNYepraRe/QpJqgeTn8uQsQX8=;
 b=BIontiK2DTv/qpkcw8bqo+nSW7AR/xoHc7DGBgv5kPqhit+aqYI4uEyMy/Ss6RSaK5
 hmWpjMQ9lfx7I0535vhSC3ozL00wKYYG5TSEaDh5y1MS7n/m0GkpcsbpLw+EjYfGS6rW
 +nHaGhOCacxctPQGekqTXVouPBMX5i4VlYb++4o/GQSyiogo2erqjE7dYL7ho0IOYQhe
 +1Bosh4NY01j5tPmU+lrHJkAyw2dMmGuI6RmMLaMrnc0UJMA5g4oCZ1xVHG4f1O1cG3N
 h5Kq7PuHfOedJ/uZYlRHf+nxz1eyncsLhwmH5eGZ7wO60AXazvUiqrC4F+QNc35/SPSu
 w3Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bdAudQZ0HCJ8TRBm9ijNYepraRe/QpJqgeTn8uQsQX8=;
 b=FppLVZ46tocvaa+kXx6c+mCS+6jyngUoy1PjKkD+POMzNPr0ZAzKyA2rDjd95+Aa+a
 3L2L6pMZGsEvFfOrO8OvYpqGC5et54uglkupunEYxz+2DloetphkLFad5yZDAV12czDe
 xMC8+1g7rb4L1x4CAIVdcQ3R3kSVtQoiOzJ7PdzxifIJgF5fX9zCY5FOnQZa1twO52Ul
 BHcKV4tUEAQN4A34+QeXsagF2Fm8Z3kIXTEFj+vX8IzVkDbDEsozhAO0kAfaI6gbJRvk
 Ymya/T3dy7fAaHiTITXmtUwWyUcT+eoqYepd6gNfoOy7PamelHe7l57Fu2s6IdGQBsoD
 ADBQ==
X-Gm-Message-State: APjAAAXhnSqoiIXo2AKkPTXP+VzZVhDa3Yv2rhRlQeWNyhMkB4v2jhJp
 yNAhZm8WW7e+DXTIJU7l1Tc1w1PBomoL53wVA2Q=
X-Google-Smtp-Source: APXvYqyX2pWhcTrhvray5HVD4t5UgZhCevIB50IwYtht6X5wox9aszGhaDh07sqZYAAepAbIq9CCwMnECTOlso4Ws3A=
X-Received: by 2002:a02:a90a:: with SMTP id n10mr4223757jam.140.1567694539038; 
 Thu, 05 Sep 2019 07:42:19 -0700 (PDT)
MIME-Version: 1.0
References: <1567693630-27544-1-git-send-email-arnaud.pouliquen@st.com>
 <1567693630-27544-2-git-send-email-arnaud.pouliquen@st.com>
In-Reply-To: <1567693630-27544-2-git-send-email-arnaud.pouliquen@st.com>
From: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date: Thu, 5 Sep 2019 08:42:08 -0600
Message-ID: <CAOCk7Nrja=31soMB+MhcrxhGHMT+bj9U+3_h6cTLo3+AAsFKqQ@mail.gmail.com>
To: Arnaud Pouliquen <arnaud.pouliquen@st.com>
X-Mailman-Approved-At: Thu, 05 Sep 2019 14:51:52 +0000
Cc: Ohad Ben-Cohen <ohad@wizery.com>, MSM <linux-arm-msm@vger.kernel.org>,
 linux-remoteproc@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>,
 Fabien DESSENNE <fabien.dessenne@st.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Suman Anna <s-anna@ti.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH 1/3] rpmsg: core: add API to get message
	length
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

On Thu, Sep 5, 2019 at 8:35 AM Arnaud Pouliquen <arnaud.pouliquen@st.com> wrote:
>
> Return the rpmsg buffer size for sending message, so rpmsg users
> can split a long message in several sub rpmsg buffers.
>
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
> ---
>  drivers/rpmsg/rpmsg_core.c       | 21 +++++++++++++++++++++
>  drivers/rpmsg/rpmsg_internal.h   |  2 ++
>  drivers/rpmsg/virtio_rpmsg_bus.c | 10 ++++++++++
>  include/linux/rpmsg.h            | 10 ++++++++++
>  4 files changed, 43 insertions(+)
>
> diff --git a/drivers/rpmsg/rpmsg_core.c b/drivers/rpmsg/rpmsg_core.c
> index e330ec4dfc33..a6ef54c4779a 100644
> --- a/drivers/rpmsg/rpmsg_core.c
> +++ b/drivers/rpmsg/rpmsg_core.c
> @@ -283,6 +283,27 @@ int rpmsg_trysend_offchannel(struct rpmsg_endpoint *ept, u32 src, u32 dst,
>  }
>  EXPORT_SYMBOL(rpmsg_trysend_offchannel);
>
> +/**
> + * rpmsg_get_mtu() - get maximum transmission buffer size for sending message.
> + * @ept: the rpmsg endpoint
> + *
> + * This function returns maximum buffer size available for a single message.
> + *
> + * Return: the maximum transmission size on success and an appropriate error
> + * value on failure.
> + */

What is the intent of this?

The term "mtu" is "maximum transfer unit" - ie the largest payload of
data that could possibly be sent, however at any one point in time,
that might not be able to be accommodated.

I don't think this is implemented correctly.  In GLINK and SMD, you've
not implemented MTU, you've implemented "how much can I send at this
point in time".  To me, this is not mtu.

In the case of SMD, you could get the fifo size and return that as the
mtu, but since you seem to be wanting to use this from the TTY layer
to determine how much can be sent at a particular point in time, I
don't think you actually want mtu.

For GLINK, I don't actually think you can get a mtu based on the
design, but I'm trying to remember from 5-6 years ago when we designed
it.  It would be possible that a larger intent would be made available
later.

I think you need to first determine if you are actually looking for
mtu, or "how much data can I send right now", because right now, it
isn't clear.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
