Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 28013532D9A
	for <lists+linux-stm32@lfdr.de>; Tue, 24 May 2022 17:34:49 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CBBABC03FDB;
	Tue, 24 May 2022 15:34:48 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CAFE6C035BF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 May 2022 15:34:47 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id rs12so24386102ejb.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 May 2022 08:34:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XKQgP4gZTvt4b++ZSM+DxjPg9J0TxcLJRrQHC/0hh0s=;
 b=qOWSHVyq0qvKCiLV6FRf5dYPoK4I2LWG04bQZX9Ixs9fvAkWtsiP4M4uyKV4L3Owf6
 oo/24gsZWsamGHpZduBebduOB08KFZ6VWJ5T4Rc6++e7D2kmtb3TldiP+fsuOoCb58kX
 unaIW9RfOgVRVfnTffoALlAAFpef3zWYDaCnut6LN7Ch51bKU0ykTNcCwHKcazddwjEY
 mI7Th1MC7eFPDtnWbOTS4Yw1UAF9wvJhofUEuwNpDEWy24GA4Kld0vjqW4Ejm7tj1c5N
 JYFsZNb30Nm8y7zM5MZDVk71xzFwlaxKIBdjayG81cNBu82apnYDEGFurYH+1lNSailj
 Xheg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XKQgP4gZTvt4b++ZSM+DxjPg9J0TxcLJRrQHC/0hh0s=;
 b=3oeHO5gSSM6rWBt30NkxqZSYW9BIpjTQxM9PwoHmtDymDRE4OlQIx/4G8dH5QlJJfi
 JPeHwZc6FpfLKdYl6XOWFRYFq9HbjoED94257zcExpzCo8RcHMlpPxd4y47QM/oIPGvS
 sj9H5uRL9e/xdzCRGQLtpvk+GbEP/DEuXmwY8vVvAs35r7p7CaTaUuvzOWvVT6NJ2mOS
 9zaV3aSfnp8NEE3S9i+aSHukEWKFH3wtysKQh/leHJOQyJWrhzNSAVWWAb4yJFabz+FA
 x5cH3A1QNTR5k0ZQSeUlFfM6L8bwbT+H1Unk0GAb0mQu0JLbgezuZ/FyFM97qFJ4hd1X
 pbgw==
X-Gm-Message-State: AOAM533AGbbLBs9wwaGSXehm2unRks/8MDzGc+GIuOjJjESD3rlCP+Zt
 wuW/dbitHN/mrhPSOPunAyc3/a7tVMRJfijL8NTEKQ==
X-Google-Smtp-Source: ABdhPJyKYl8sTqnTGs974NhxolD0105jjPI+EMpfcxAqya5Yq62Twbhixcyf3O4P7dAR/BlHaFghgyOw2QYDKA6UwPg=
X-Received: by 2002:a17:907:160e:b0:6f4:54c0:657e with SMTP id
 hb14-20020a170907160e00b006f454c0657emr25501932ejc.253.1653406487255; Tue, 24
 May 2022 08:34:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220520082940.2984914-1-arnaud.pouliquen@foss.st.com>
In-Reply-To: <20220520082940.2984914-1-arnaud.pouliquen@foss.st.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Tue, 24 May 2022 09:34:36 -0600
Message-ID: <CANLsYkw7wjfVPTvA7SniMV8tBommm5E5w2FA0KMyRYn0BKVDyA@mail.gmail.com>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Deepak Kumar Singh <quic_deesin@quicinc.com>,
 Chris Lew <quic_clew@quicinc.com>, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [RFC PATCH 00/10] Introduction of rpmsg flow
	control service
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

Hi Arnaud,

I added your patchset to my review list.  Unfortunately it sits behind
a sizable backlog and as such I won't be able to get to it for some
time.

Thanks,
Mathieu

On Fri, 20 May 2022 at 02:30, Arnaud Pouliquen
<arnaud.pouliquen@foss.st.com> wrote:
>
> This series proposes an implementation for the rpmsg virtio transport
> backend, of the signaling API proposed by Deepak Kumar Singh:
> "rpmsg and glink signaling API support" [1]
>
> The aim of the series is to offer the possibility for an endpoint to inform
> a remote endpoint about its state, based on a software flow control[2].
>
> For this a new rpmsg service( with a fixed address 64) is proposed.
> It is responsible for:
> - transmitting local endpoint flow control information to the remote side,
> - informing a local endpoint about a remote endpoint flow control.
>
> For the rpmsg virtio transport layer the service is negotiated thanks to the
> virtio feature flag: VIRTIO_RPMSG_F_FC
>
> Notice that this pull request introduces new feature in the rpmsg protocol,
> So it has to be aligned with OpenAMP implementation.
> Pending OpenAMP pull request is available here:
> https://github.com/OpenAMP/open-amp/pull/394
>
>
> [1]https://lkml.org/lkml/2022/1/18/867
> [2]https://en.wikipedia.org/wiki/Software_flow_control
>
> Arnaud Pouliquen (8):
>   rpmsg: core: Add rpmsg device remote flow control announcement ops
>   rpmsg: virtio: Implement the announce_remote_fc ops
>   rpmsg: Introduce flow control channel driver
>   rpmsg: virtio: Add support of the VIRTIO_RPMSG_F_FC feature
>   rpmsg: virtio: Implement the set_flow_control ops
>   rpmsg: Add the destination address in rpmsg_set_flow_control
>   rpmsg: tty : Add the support of the flow control
>   rpmsg: virtio: Set default dst address on flow control
>
> Deepak Kumar Singh (2):
>   rpmsg: core: Add signal API support
>   rpmsg: char: Add TIOCMGET/TIOCMSET ioctl support
>
>  drivers/rpmsg/Kconfig            |  11 +++
>  drivers/rpmsg/Makefile           |   1 +
>  drivers/rpmsg/rpmsg_char.c       |  56 +++++++++++++--
>  drivers/rpmsg/rpmsg_core.c       |  47 +++++++++++++
>  drivers/rpmsg/rpmsg_fc.c         | 113 +++++++++++++++++++++++++++++++
>  drivers/rpmsg/rpmsg_internal.h   |   9 +++
>  drivers/rpmsg/virtio_rpmsg_bus.c | 111 +++++++++++++++++++++++++++++-
>  drivers/tty/rpmsg_tty.c          |  50 ++++++++++++++
>  include/linux/rpmsg.h            |  15 ++++
>  include/linux/rpmsg/fc.h         |  51 ++++++++++++++
>  10 files changed, 456 insertions(+), 8 deletions(-)
>  create mode 100644 drivers/rpmsg/rpmsg_fc.c
>  create mode 100644 include/linux/rpmsg/fc.h
>
> --
> 2.25.1
>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
