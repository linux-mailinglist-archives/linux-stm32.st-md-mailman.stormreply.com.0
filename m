Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 25AB553E5B0
	for <lists+linux-stm32@lfdr.de>; Mon,  6 Jun 2022 18:20:55 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BBFEFC0D2C2;
	Mon,  6 Jun 2022 16:20:54 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 787E8C0D2BF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  6 Jun 2022 16:20:53 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id gl15so16087572ejb.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 06 Jun 2022 09:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=12UkLhNWmn2NlSuxlr6S4i7rRJBFRzlnkvu5nBhtCdk=;
 b=DFflpyIFsZnXHHqmPDg2ed5oqgbXienQBXEPLAaCN/Rw/SD9GDpUQKli40bGJQrMvW
 d+mCUp9VxvOfdf5J0RrlUNq7WdkjaSStwDF4au+pvldwh621urWTtklhLgROAMxL6Zb0
 /12gojX0eluv6wl7sIV3Cb+6xpuA68WDLF4eopEzoDyz1FilA1N40+ZRysXVjgyBZ3my
 ydGPh5FvCWvFpOCLtzcbqk1eabc01zfqE3A8+cy9O7r2XTkvpDje1arAnkuTEpgT1OSO
 yFNMJa5+XiBnHZB/lCCWXGKcmG1hqtTH6eIHfuRHNkrVZDoQFvKPEhqaMSY6JBMtn0pc
 3Hng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=12UkLhNWmn2NlSuxlr6S4i7rRJBFRzlnkvu5nBhtCdk=;
 b=67XhDF2pstpf6a0NURhathXOv/pw6SM4HUB0vjR0ihPc2RYmx1u60Cr7Uzu8TUyCmM
 TQpXyw7sR4qM6hj3Nk7rDaYhtELZ+VTFNYDgnodmFN72p7jDdzZ6tu0zoWhzWS8i3WIE
 9SCPFEckK0yzH2ZSgo6zA2BRAp+jSHAznBhokAPw5IERtP5Pv+0FxpuHRgQ7geGLAtVq
 M1oouvNtsWj1eK4xoKEPjVFuKf7sOO7JlSxV0UhAYRx6wwzfiygJS6onBmrXspLgJMf8
 XLVIFrprmk/LcuZFNC1vIulX9HZM48iXlgivCFMc7DUppxYx18hw7RGBbDZSwcddhKGR
 qOUg==
X-Gm-Message-State: AOAM530jHn0AHKypATUj5hBUK0yFD8X1EhstFOLmLVWAdw4YZi6tdKlW
 vs/fL8jgCQC4C7wQZJes8aMGnkvOxu2ZoViA04XeCQ==
X-Google-Smtp-Source: ABdhPJySZx0kslKEfNGrGcdenQ/vGoHfPvIpIIerAHQ96ovYKU6gs5Xm9U68o1ARI3U9vVrPknGE2fegJ/Nwqo5tf6g=
X-Received: by 2002:a17:907:c22:b0:711:dc95:3996 with SMTP id
 ga34-20020a1709070c2200b00711dc953996mr396834ejc.62.1654532453015; Mon, 06
 Jun 2022 09:20:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220406095446.1187968-1-arnaud.pouliquen@foss.st.com>
 <20220406095446.1187968-3-arnaud.pouliquen@foss.st.com>
 <20220601174159.GD531268@p14s>
 <b85c7526-80a4-35f2-7629-319d172bc734@foss.st.com>
In-Reply-To: <b85c7526-80a4-35f2-7629-319d172bc734@foss.st.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Mon, 6 Jun 2022 10:20:41 -0600
Message-ID: <CANLsYkwsqoKVoYSj7bWxT+t=rMp3dhsrpMYaWm6DhFKHvMSEKw@mail.gmail.com>
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

You are correct - I had the name of the variable, i.e rvdev, found in
rproc_handle_vdev() in my head.  You can forget this comment.

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
