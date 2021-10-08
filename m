Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EF74427417
	for <lists+linux-stm32@lfdr.de>; Sat,  9 Oct 2021 01:19:29 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D6F15C5C824;
	Fri,  8 Oct 2021 23:19:28 +0000 (UTC)
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com
 [209.85.210.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A7A67C57189
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  8 Oct 2021 23:19:25 +0000 (UTC)
Received: by mail-ot1-f41.google.com with SMTP id
 g62-20020a9d2dc4000000b0054752cfbc59so13557174otb.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 08 Oct 2021 16:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=x738ufZ26qwkomPQn+MfcJAOvsbxWorDBI+ovCJWAwQ=;
 b=Q9QQAxS64wz/rk0hjJJp3RwiQQhf4XHpzAcJec/2dyG0OiD3EyShl6WQuS9Gj4WrXs
 vLgfkhdQmchuR7yrGpntQrB+2ZPkof/7+DkIdy84Ny9kxgMZxdQPDw4o00YmDBYu4e7l
 qKgst6bpVxYBnb/sDf7S/4xZFcCEzTGWgMk5IrLnKqnxzx9KTMH08xZY8FZIO0Gc+gTl
 /qlYlv5Lvdrkq49dxuIdItdBzg4qTW7glw4U8FASrxAjLk8pijAONeL9u0mmBCqn3zxb
 J8UfFnmpM84XTCCvBiik1XtBFydG8rwAERohf0dVsJKi7xsM9AvZHudi0Zt3hrr37Pvn
 kbJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=x738ufZ26qwkomPQn+MfcJAOvsbxWorDBI+ovCJWAwQ=;
 b=Rvm4VZwUlPqdGoPbfaGiD7x6e9ImSYQWB02vzuzuw6elvFI6kk74pr97n+ZlSHHbV4
 vYrPEJdUNpMA0XUZpbL8MTl5J5bgXW9fSeX3zhOt4EPkSZh3L1dzsyNtbjRGsbiT2RQd
 PXxg+w/274pHxijvxxjelXwnuujQu+smC2LsRVcJighH1uEW6zORhUfx8hd9ae+qw7K0
 FFIWo6c2ZHLNZfWvXYEbFl61xi/l9tuXNvl4C+Dicza/YDpbPwvMSBCQKMEFDyYtVS4w
 Z5KiAgqCCnVpsMFiBjU+jn9ujuVrfi5EXYPVSv51kIbcBiC0xgJLbBcLE2gU8sPqhTIL
 n4kA==
X-Gm-Message-State: AOAM531xHL4yICkWfAsPvbzxe1vhfiSdOiy+PMTQxBLeWKzCgmG7gRzE
 /Za4Awt17FXkHhw5B6qyGcgCww==
X-Google-Smtp-Source: ABdhPJxY3pRS9QcITX6jzHIIwjpjFrwSORH5JXMYWCXknB5wISu9iN0QhmvY3K1bSk/MpqHp/n6gpg==
X-Received: by 2002:a05:6830:2a0c:: with SMTP id
 y12mr5549935otu.377.1633735164504; 
 Fri, 08 Oct 2021 16:19:24 -0700 (PDT)
Received: from ripper ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
 by smtp.gmail.com with ESMTPSA id h17sm140754oog.17.2021.10.08.16.19.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Oct 2021 16:19:24 -0700 (PDT)
Date: Fri, 8 Oct 2021 16:21:02 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Message-ID: <YWDSXu/MDOwOLDg0@ripper>
References: <20210712123752.10449-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210712123752.10449-1-arnaud.pouliquen@foss.st.com>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Mathieu Poirier <mathieu.poirier@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v5 0/4] Restructure the rpmsg char to
 decorrelate the control part.
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

On Mon 12 Jul 05:37 PDT 2021, Arnaud Pouliquen wrote:

> Main update from V4 [1] 
>  - complete commit messages with Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
>  - rebased on kernel V.14-rc1.
> 
> This series can be applied and tested on "Linux 5.14-rc1"(e73f0f0ee754) branch
> 
> Series description:
> This series is the second step in the division of the series [2]: 
> "Introducing a Generic IOCTL Interface for RPMsg Channel Management".
> 
> The purpose of this patchset is to split the code related to the control
> and the endpoint. The code related to the control part is moved in the rpmsg_ctrl.c.

I'm not convinced about the merits for this refactoring, you're creating
yet another kernel module which is fairly tightly coupled with
the rpmsg_char kernel module and the only case I can see where this
would be useful is if you want to be able to create reach
RPMSG_CREATE_DEV_IOCTL and RPMSG_DESTROY_EPT_IOCTL without having to
include the rpmsg_char part in your kernel.

> This split is an intermediate step to extend the controls to allow user applications to
> instantiate rpmsg devices.
>     

Can you give a concrete example of when this would be used?

Per our previous discussions I believe you intend to use this to bind
your rpmsg_tty driver to arbitrary channels in runtime, which to me
sounds like you're reinventing the bind/unbind sysfs attrs.

Regards,
Bjorn

> Notice that this patchset does not modify the behavior for using the RPMSG_CREATE_EPT_IOCTL
> and RPMSG_DESTROY_EPT_IOCTL controls.
>   
> The next step should be to add the capability to:
> - instantiate rpmsg_chrdev from the remote side (NS announcement),
> - instantiate rpmsg_chrdev from local user application by introducing the
>   IOCTLs RPMSG_CREATE_DEV_IOCTL and RPMSG_DESTROY_DEV_IOCTL to instantiate the rpmsg devices,
> - send a NS announcement to the remote side on rpmsg_chrdev local instantiation.
> 
> [1]: https://patchwork.kernel.org/project/linux-remoteproc/list/?series=483793
> [2]: https://patchwork.kernel.org/project/linux-remoteproc/list/?series=435523
> 
> Arnaud Pouliquen (4):
>   rpmsg: char: Remove useless include
>   rpmsg: char: Export eptdev create an destroy functions
>   rpmsg: Move the rpmsg control device from rpmsg_char to rpmsg_ctrl
>   rpmsg: Update rpmsg_chrdev_register_device function
> 
>  drivers/rpmsg/Kconfig             |   9 ++
>  drivers/rpmsg/Makefile            |   1 +
>  drivers/rpmsg/qcom_glink_native.c |   2 +-
>  drivers/rpmsg/qcom_smd.c          |   2 +-
>  drivers/rpmsg/rpmsg_char.c        | 184 ++-----------------------
>  drivers/rpmsg/rpmsg_char.h        |  51 +++++++
>  drivers/rpmsg/rpmsg_ctrl.c        | 215 ++++++++++++++++++++++++++++++
>  drivers/rpmsg/rpmsg_internal.h    |   8 +-
>  drivers/rpmsg/virtio_rpmsg_bus.c  |   2 +-
>  9 files changed, 293 insertions(+), 181 deletions(-)
>  create mode 100644 drivers/rpmsg/rpmsg_char.h
>  create mode 100644 drivers/rpmsg/rpmsg_ctrl.c
> 
> -- 
> 2.17.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
