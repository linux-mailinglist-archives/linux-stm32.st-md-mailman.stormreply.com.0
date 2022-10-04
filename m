Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BB4A55F46DB
	for <lists+linux-stm32@lfdr.de>; Tue,  4 Oct 2022 17:43:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 601ACC63327;
	Tue,  4 Oct 2022 15:43:19 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B96BEC5C829
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 Oct 2022 15:43:17 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id AAB39614CD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 Oct 2022 15:43:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15D1EC4347C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 Oct 2022 15:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1664898196;
 bh=U2O60j6He/sEtxkTg/pc2RUdeKrZgNPr8GmnSXcVjpc=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=YJK0uXIA48/3+m4FpB503xW0BRolVhOp+O6En1YVcupkiHqr1fozqu9fJZjm2lNYI
 uCula0RnHqTJJRRfqsZIKQpobcYl6RrojD0uTjPSIKV7dDbWykWHrlBSZ/fJUpySp3
 t+NRLGPCjyGn9h/GlvjhXTXznXwJKuvQ9/jjQUW4CJnpd1bY8Ub+3+cPXpotwlimMC
 YKbT7GuRcdbvbmmTDnuExQjDStNoeu9r2Zv36+x9SMdtFxgTlwPRqghYvPlpyyI1rI
 kO/i/0wSj8Vx2CDz3BoKd2ah3Uciqdwiza0o8Sqmx4uWDNkwqhZiXEC0l+OMzq55bM
 f6EzyPVFrznQQ==
Received: by mail-vk1-f181.google.com with SMTP id r193so7215423vke.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 04 Oct 2022 08:43:16 -0700 (PDT)
X-Gm-Message-State: ACrzQf1FLohDu3cABfv0/bOFaH1YXCbxDecAlh6K3AGPtnUZDBHJsmQs
 I1JtMgxaK8ivH7oduc17ksTT0XsaDIP7ZVMxww==
X-Google-Smtp-Source: AMsMyM52y1ai9U24ODhDkBQO22dd37N5gJM6JrMe7fLZoeFCJP2r7l1LCfAUUFY6JOorsGnC8MKpSQ575X4CRjgX3Q4=
X-Received: by 2002:a1f:16c4:0:b0:3aa:58a9:5d33 with SMTP id
 187-20020a1f16c4000000b003aa58a95d33mr4834165vkw.35.1664898195002; Tue, 04
 Oct 2022 08:43:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220921135044.917140-1-arnaud.pouliquen@foss.st.com>
 <20220921135044.917140-5-arnaud.pouliquen@foss.st.com>
 <20221004143954.GA1479221-robh@kernel.org>
 <fa229aa5-5fb7-eb18-3b8a-59d8a98ccaba@foss.st.com>
In-Reply-To: <fa229aa5-5fb7-eb18-3b8a-59d8a98ccaba@foss.st.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 4 Oct 2022 10:43:04 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLnm7+YQAiSeCk5Db1oNcg=rwJd4Fnve4j+-ssC-dZOHQ@mail.gmail.com>
Message-ID: <CAL_JsqLnm7+YQAiSeCk5Db1oNcg=rwJd4Fnve4j+-ssC-dZOHQ@mail.gmail.com>
To: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Cc: Stefano Stabellini <stefanos@xilinx.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Bruce Ashfield <bruce.ashfield@xilinx.com>,
 Bjorn Andersson <andersson@kernel.org>, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Christoph Hellwig <hch@lst.de>
Subject: Re: [Linux-stm32] [PATCH v9 4/4] remoteproc: virtio: Create
	platform device for the remoteproc_virtio
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

On Tue, Oct 4, 2022 at 10:18 AM Arnaud POULIQUEN
<arnaud.pouliquen@foss.st.com> wrote:
>
> Hello Rob,
>
> On 10/4/22 16:39, Rob Herring wrote:
> > On Wed, Sep 21, 2022 at 03:50:44PM +0200, Arnaud Pouliquen wrote:
> >> Define a platform driver to manage the remoteproc virtio device as
> >> a platform devices.
> >>
> >> The platform device allows to pass rproc_vdev_data platform data to
> >> specify properties that are stored in the rproc_vdev structure.
> >>
> >> Such approach will allow to preserve legacy remoteproc virtio device
> >> creation but also to probe the device using device tree mechanism.
> >>
> >> remoteproc_virtio.c update:
> >>   - Add rproc_virtio_driver platform driver. The probe ops replaces
> >>     the rproc_rvdev_add_device function.
> >>   - All reference to the rvdev->dev has been updated to rvdev-pdev->dev.
> >>   - rproc_rvdev_release is removed as associated to the rvdev device.
> >>   - The use of rvdev->kref counter is replaced by get/put_device on the
> >>     remoteproc virtio platform device.
> >>   - The vdev device no longer increments rproc device counter.
> >>     increment/decrement is done in rproc_virtio_probe/rproc_virtio_remove
> >>     function in charge of the vrings allocation/free.
> >>
> >> remoteproc_core.c update:
> >>   Migrate from the rvdev device to the rvdev platform device.
> >>   From this patch, when a vdev resource is found in the resource table
> >>   the remoteproc core register a platform device.
> >>
> >> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> >> Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> >> ---
> >>  drivers/remoteproc/remoteproc_core.c     |  12 +-
> >>  drivers/remoteproc/remoteproc_internal.h |   2 -
> >>  drivers/remoteproc/remoteproc_virtio.c   | 143 ++++++++++++-----------
> >>  include/linux/remoteproc.h               |   6 +-
> >>  4 files changed, 82 insertions(+), 81 deletions(-)
> >
> > [...]
> >
> >> +/* Platform driver */
> >> +static const struct of_device_id rproc_virtio_match[] = {
> >> +    { .compatible = "virtio,rproc" },
> >
> > This is not documented. Add a binding schema if you need DT support.
>
>
> Mathieu also pointed this out to me in V8, you can see the discussion here [1]
>
> Here is an extract:
> "Yes I saw the warning, but for this first series it is not possible to declare
> the associated "rproc-virtio" device in device tree.
> So at this step it seems not make senses to create the devicetree bindings file.
> More than that I don't know how I could justify the properties in bindings if
> there is not driver code associated.
>
> So i would be in favor of not adding the bindings in this series but to define
> bindings in the first patch of my "step 2" series; as done on my github:
> https://github.com/arnopo/linux/commit/9616d89a4f478cf78865a244efcde108d900f69f
> "

Okay, since I only just started checking this (in a more reliable way
than checkpatch does).

But why do you need the DT match entry if it is not usable yet? You
could just add that in later when the binding is defined. Review of
the binding could say that 'virtio,rproc' should be something else and
you'd have to change it.

Rob
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
