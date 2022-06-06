Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E6EC53E590
	for <lists+linux-stm32@lfdr.de>; Mon,  6 Jun 2022 17:47:49 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E7AE8C0D2C2;
	Mon,  6 Jun 2022 15:47:48 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5A42CC0D2BF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  6 Jun 2022 15:47:47 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id fd25so19408671edb.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 06 Jun 2022 08:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jLpWvMlf+YUwu7qBpzspLbufy8yyDTs9EuJTxwHjhIs=;
 b=sAgL1HX3YrPvng7nckLZkM6PqZZq8RKPIRXtt7wwM4al/LJSnm1WAVNBbbzeQh4R2H
 Jq7/nQtKQuCFpgc0sv062DxA8dvn2F/t4f5EYYVz81sdhSFtwHdehGNkLnvoab3T1fwP
 YZSY2QPUMi83ez2/lssfP34+EvEtX5nx65of/XBbu3YJIBp4+O35V5RUeroJr0wl7/bS
 BTqZbvIrwzkeuYlBV0ekUNJg7WpdLF55ymyo794mVag6VrVpqKYFhUklQ17gZT+mipiB
 Z6xXhQoEDesesVKLQbxfUsgj0TSrARi9FwRMZDSczxSXkNoyBcUGA27qutTVyGgvlpyH
 riCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jLpWvMlf+YUwu7qBpzspLbufy8yyDTs9EuJTxwHjhIs=;
 b=RmCwmSQUcH31NnMF1mHVSAaI47Iqbgc3f21FlsORNjAafMZiMegUbUq+oZg4JflyKg
 Av1jkarGcqfhqGy5RkWv/vBn+0mJMocLMlodLTr1rO/+8r7aowk3RLx1ce2SkyYAjAE+
 EbMpOL+HJ7Liv3bZ9aw0BJI2A/2Eq+ThsLPWC7vmh2pbPbTDfsBC5wAkcH/csYnhxNXE
 U48Eoc3rx0dAHK1kO+GkZs1qhKUd+Eyg3h7ZNE2uX22hv6ukF5vpyzdBm78LYo3GDeG0
 OfimAYe9MiyfM7wTCqCWoAYfyIc8Viu7A0Yw+UH6tEFU7aDwUaqDq4P7oQQisIC4zv1e
 x2Lw==
X-Gm-Message-State: AOAM5303WEP+UDTmura6y2jBKhgr8v2mn5xMipVRXwCThvrv3Py8/snZ
 8AhXiEHbnFU0wJQ5lbG9N9jC7V3Zgs58OggQt8dvfA==
X-Google-Smtp-Source: ABdhPJziEwq+2TK54NAomosbKFoIgCbxKZ0vpPY7wD/35TTSTUyrCW2Y4sC6CD4fFotGJU9nupk9KF/eT9WvZshZfmE=
X-Received: by 2002:a05:6402:274a:b0:42d:dcd1:c847 with SMTP id
 z10-20020a056402274a00b0042ddcd1c847mr27773129edd.169.1654530466868; Mon, 06
 Jun 2022 08:47:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220406095446.1187968-1-arnaud.pouliquen@foss.st.com>
 <20220406095446.1187968-3-arnaud.pouliquen@foss.st.com>
 <20220601174159.GD531268@p14s>
 <b85c7526-80a4-35f2-7629-319d172bc734@foss.st.com>
In-Reply-To: <b85c7526-80a4-35f2-7629-319d172bc734@foss.st.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Mon, 6 Jun 2022 09:47:35 -0600
Message-ID: <CANLsYkzcgC3+pWSzyRKaRQuWEp=m_tML5W9hc1+fR9CLgMYHSQ@mail.gmail.com>
To: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, Bruce Ashfield <bruce.ashfield@xilinx.com>,
 Stefano Stabellini <stefanos@xilinx.com>, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [RFC PATCH v5 2/4] remoteproc: core: Introduce
 rproc_register_rvdev function
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

On Fri, 3 Jun 2022 at 05:54, Arnaud POULIQUEN
<arnaud.pouliquen@foss.st.com> wrote:
>
> Hello Mathieu,
>
> On 6/1/22 19:41, Mathieu Poirier wrote:
> > On Wed, Apr 06, 2022 at 11:54:44AM +0200, Arnaud Pouliquen wrote:
> >> The rproc structure contains a list of registered rproc_vdev structure.
> >
> > This should be rproc_rvdev.
>
> Thanks for your review!
>
> I will send a new version according to your comments except
> this one.
> The structure name rproc_vdev is the good one, or
> or maybe I'm missing something?
>

Structure rproc does not contain a list of rproc_vdev, it contains a
list of rproc_rvdev in rproc::rvdevs.

> Thanks,
> Arnaud
>
> >
> >> To be able to move the management of the rproc_vdev structure in
> >> remoteproc_virtio.c (i.e rproc_rvdev_add_device and
> >> rproc_rvdev_remove_device functions), introduce the rproc_register_rvdev
> >> and rproc_unregister_rvdev functions.
> >
> > The name of those functions doesn't match the content of the patch.
> >
> >>
> >> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> >> ---
> >>  drivers/remoteproc/remoteproc_core.c | 16 ++++++++++++++--
> >>  1 file changed, 14 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> >> index 3a469220ac73..081bea39daf4 100644
> >> --- a/drivers/remoteproc/remoteproc_core.c
> >> +++ b/drivers/remoteproc/remoteproc_core.c
> >> @@ -484,6 +484,18 @@ static int copy_dma_range_map(struct device *to, struct device *from)
> >>      return 0;
> >>  }
> >>
> >> +static void rproc_add_rvdev(struct rproc *rproc, struct rproc_vdev *rvdev)
> >> +{
> >> +    if (rvdev && rproc)
> >> +            list_add_tail(&rvdev->node, &rproc->rvdevs);
> >> +}
> >> +
> >> +static void rproc_remove_rvdev(struct rproc_vdev *rvdev)
> >> +{
> >> +    if (rvdev)
> >> +            list_del(&rvdev->node);
> >> +}
> >> +
> >>  static struct rproc_vdev *
> >>  rproc_rvdev_add_device(struct rproc *rproc, struct rproc_vdev_data *rvdev_data)
> >>  {
> >> @@ -547,7 +559,7 @@ rproc_rvdev_add_device(struct rproc *rproc, struct rproc_vdev_data *rvdev_data)
> >>                      goto unwind_vring_allocations;
> >>      }
> >>
> >> -    list_add_tail(&rvdev->node, &rproc->rvdevs);
> >> +    rproc_add_rvdev(rproc, rvdev);
> >>
> >>      rvdev->subdev.start = rproc_vdev_do_start;
> >>      rvdev->subdev.stop = rproc_vdev_do_stop;
> >> @@ -576,7 +588,7 @@ static void rproc_rvdev_remove_device(struct rproc_vdev *rvdev)
> >>      }
> >>
> >>      rproc_remove_subdev(rproc, &rvdev->subdev);
> >> -    list_del(&rvdev->node);
> >> +    rproc_remove_rvdev(rvdev);
> >
> > With the above:
> >
> > Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> >
> >>      device_unregister(&rvdev->dev);
> >>  }
> >>
> >> --
> >> 2.25.1
> >>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
