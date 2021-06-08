Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 432A939F908
	for <lists+linux-stm32@lfdr.de>; Tue,  8 Jun 2021 16:26:22 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EAEB2C57B79;
	Tue,  8 Jun 2021 14:26:21 +0000 (UTC)
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com
 [209.85.166.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5BF68C57B75
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  8 Jun 2021 14:26:19 +0000 (UTC)
Received: by mail-io1-f44.google.com with SMTP id f10so7896966iok.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 08 Jun 2021 07:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aFGcwQ3o2ZyrTCy4xvb08Po9MFGx7mRhjpeSf3SDVVM=;
 b=k2cO8sFl6AawwfKDwjqC7Cwa8kx2f1Of64WDhB/DVwxiJ1rlKaFs+eM+RJvkfpOg3j
 zO1VBpaq9q7wZy6zi9n5ICecHohLlqYxYi6tdhUwnSO+mMOnE5dUKWhUf/nGnCdyitq6
 nDb/ec39txb5V5dV64U8UDFIfQLhBEGS68/GNxKoBskr5cxVfo7fS0INvfFvTKEjLTu9
 A8M4GGzoQWaA74fiRzw6ZdY0rXKziGyRTaVypCM3Od1ST1EL4gReqZqpSQjVZLAxnWNy
 A9hD24P48HoK42afcyIcwpou9e4Xux2L++niw7SqMvjiw4ZLtQoJQrOZdQJzAJ3+YV7R
 jOGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aFGcwQ3o2ZyrTCy4xvb08Po9MFGx7mRhjpeSf3SDVVM=;
 b=P/zLXmR2Iw406KY92WBA0btFuYkqeXv873VyQF5HdhB3s54/aKP33aaAbrpIkcFjb0
 6p9FYI147EaqnLPxhb7t9TvJjRWgkKiSsrLTOX8mKfWFE24pa6tYCcA20HipgoQe1oMd
 6XbxSdL83GwosRqK7LkaLyRCSolH0L7ioUkjZBqMSWvq06RewyicQf9JCRfpfxhhGWyT
 pEJhjnDBlfY1EFpZOvWf7H/YL4Rqi/NuzHXOi/4BcwvnVa4rG4A7iVST4zAB11dqBnEA
 P/zNCRjLd/R5vexsNJnPiuz1ALUJ0+jkwLsiMw98PR4SeL43H5oJLXhoDvrznS1u6hTG
 lV8Q==
X-Gm-Message-State: AOAM5323xG7ugVuhcN0aklDlnFMT0mKY8ClEzV8H+Zbv4sL+FXKa1Kwd
 4MBzrXuX/J9XKolfMJY/MxOu9TI4JMAp2Dai+zpNMQ==
X-Google-Smtp-Source: ABdhPJxgnBqrzUUM4CgS/RA6oYYN9J2gy7q86i3Sr5vSb0wV/HtQgOPUlNfxKQ/Lnf3/EplJxZ6l4L++E7UQ5N87S94=
X-Received: by 2002:a05:6638:2a1:: with SMTP id
 d1mr21325888jaq.52.1623162377079; 
 Tue, 08 Jun 2021 07:26:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210607173032.30133-1-arnaud.pouliquen@foss.st.com>
In-Reply-To: <20210607173032.30133-1-arnaud.pouliquen@foss.st.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Tue, 8 Jun 2021 08:26:05 -0600
Message-ID: <CANLsYkxAXiKTD=KB-45O+V7DAY4dbzd_Q3WdPoDrd=UdFqtw4w@mail.gmail.com>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Julien Massot <julien.massot@iot.bzh>,
 linux-remoteproc <linux-remoteproc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH 0/4] rpmsg: char: introduce the rpmsg-raw
	channel
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

Between remoteproc/RPMSG and CoreSight, I have 6 patchsets to review
(including some of your work) before getting to this one.  As such it
will take a little while.

Thanks,
Mathieu

On Mon, 7 Jun 2021 at 11:30, Arnaud Pouliquen
<arnaud.pouliquen@foss.st.com> wrote:
>
> Purpose:
>   Allow the remote processor to instantiate a /dev/rpmsgX interface relying on the NS announcement
>   of the "rpmsg-raw" service.
>   This patchet is extracted from  the series [1] with rework to add rpmsg_create_default_ept helper.
>
>
> Aim:
>   There is no generic sysfs interface based on RPMsg that allows a user application to communicate
>   with a remote processor in a simple way.
>   The rpmsg_char dev solves a part of this problem by allowing an endpoint to be created on the
>   local side. But it does not take advantage of the NS announcement mechanism implemented for some
>   backends such as the virtio backend. So it is not possible to probe it from  a remote initiative.
>   Extending the char rpmsg device to support NS announcement makes the rpmsg_char more generic.
>   By announcing a "rpmg-raw" service, the firmware of a remote processor will be able to
>   instantiate a /dev/rpmsgX interface providing to the user application a basic link to communicate
>   with it without any knowledge of the rpmsg protocol.
>
> Implementation details:
>   - Register a rpmsg driver for the rpmsg_char driver, associated to the "rpmsg-raw" channel service.
>   - In case of rpmsg char device instantiated by the rpmsg bus (on NS announcement) manage the
>     channel default endpoint to ensure a stable default endpoint address, for communication with
>     the remote processor.
>
> How to test it:
>   - This series can be applied on git/andersson/remoteproc.git for-next branch (dc0e14fa833b)
>     + the "Restructure the rpmsg char to decorrelate the control part" series[2]
>
> [1] https://patchwork.kernel.org/project/linux-remoteproc/list/?series=475217
> [2] https://patchwork.kernel.org/project/linux-remoteproc/list/?series=483793
>
>
>
> Arnaud Pouliquen (4):
>   rpmsg: Introduce rpmsg_create_default_ept function
>   rpmsg: char: Add possibility to create and reuse default endpoint
>   rpmsg: char: Introduce the "rpmsg-raw" channel
>   rpmsg: char: Return error if user tries to destroy a default endpoint.
>
>  drivers/rpmsg/rpmsg_char.c | 92 +++++++++++++++++++++++++++++++++++---
>  drivers/rpmsg/rpmsg_core.c | 51 +++++++++++++++++++++
>  include/linux/rpmsg.h      | 14 ++++++
>  3 files changed, 151 insertions(+), 6 deletions(-)
>
> --
> 2.17.1
>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
