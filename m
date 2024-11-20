Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F15C59D3FA4
	for <lists+linux-stm32@lfdr.de>; Wed, 20 Nov 2024 17:04:24 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9D502C78021;
	Wed, 20 Nov 2024 16:04:24 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 174B6C71292
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 20 Nov 2024 16:04:17 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id
 4fb4d7f45d1cf-5d0062e9c80so241394a12.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 20 Nov 2024 08:04:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732118656; x=1732723456;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=OnybE9QCu9YjR+AlgSDdsYdZNq3wPb3NxMHboXiHWhU=;
 b=ChpKBPlDmmXa+DBMIKoTjqmYC6d++kqXDL/rrMLg4pSwEGlNMJIpqWxdj/qCULUQ9J
 m9NPyZH8yUjxLa2sDPgMbPqCEGfoG+0EgHQenNkllETBW6e61D/SraeWOGMxvgoxrq9h
 TFTaViZ1CBWtGYKv390EU6Qd4qsfSFYRgXEUZzrqj0mP1mV+pLgnVkbPLauXL+L3x6UL
 vnXOgIqKfyifkjeE/8cQsUX04XwDklrNAFO+lXUyUne9O023XS//J14jipPLtgQVXnwa
 ygHXiPXd40rRdx5UNywLxfSaVbhQNsAHasPNWS9XXsy7d6DZuDr0TS4bMtu2qhX7Wg1i
 OXVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732118656; x=1732723456;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OnybE9QCu9YjR+AlgSDdsYdZNq3wPb3NxMHboXiHWhU=;
 b=tFOOFCyNifEHQYD+FdNvitdmmroL8L1btRLw3qdvFTBpxhMG06GZvPSo4ZevbZyt+z
 yhM/3fcBTurpuDjXbLb5iqNPpzQtOX1TmRSV1yVsSGAV+34PhOQRVHwO9CmzOrx9tXsV
 hN/Zg0IfnH9VdvJs2REeBbnp3CbwmcYBmDJug8Hjjf9K5bRBlT69yX22XDC7BseCQahD
 xA6Mvm6tQ2Vn5jZnU6/ypjvgrf3iunyFod/5a7jZ+7YquaV2ypw4BJYWrr+gYCbfZe55
 jmdLhzA6HAM51vu3yq/Ij6LRBDd69hZYC8ShAE5VGnYaba5zHVKVxPlnBWQateHq4Q15
 zpyw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXluSLk4yWgPJxSigyo1EGbaM2U6aAKTroYkqIXMtK0Rg13Rq+v4YucwiOoeWhoTJq850ZFGyK8Q2InSg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyngsPfPhPM+X2yRdlRHeWTJdDvPKCDCE6FsCL0FrQnNPSbCu/I
 FaVsXF5FFhQJ5pvH6mr8yN0oEXMgOse3FeTq2wQlHPnUnX5OV5kCeGdSzuy3+CREC3+AaT7nKSd
 EmVLo2wofbkUILbLKv9+24YArHoM2T+0XpSRZUg==
X-Google-Smtp-Source: AGHT+IEezToTFcoX5Xms/RtQNmq3YRhKxr9Pb8q85vlLo+drb3zJ5gE/CYUXZHS4Gz0odg4pA6FKIoe9SJMmNxotd3g=
X-Received: by 2002:a05:6402:1e89:b0:5cf:d333:eb75 with SMTP id
 4fb4d7f45d1cf-5cff4cd134amr2866973a12.27.1732118656340; Wed, 20 Nov 2024
 08:04:16 -0800 (PST)
MIME-Version: 1.0
References: <20241104133515.256497-1-arnaud.pouliquen@foss.st.com>
 <20241104133515.256497-5-arnaud.pouliquen@foss.st.com> <Zzt+7NBdNjyzWZIb@p14s>
 <0d9075cd-68c2-49ec-9b9c-4315aa8c8517@foss.st.com>
 <CANLsYkxvTuLv8Omw-UeyPaA9g9QokmtMaMYD0eoUPo20wUuONQ@mail.gmail.com>
In-Reply-To: <CANLsYkxvTuLv8Omw-UeyPaA9g9QokmtMaMYD0eoUPo20wUuONQ@mail.gmail.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Wed, 20 Nov 2024 09:04:05 -0700
Message-ID: <CANLsYkwPDFvJxgXrAV=92w+sT8tXB=-=K8Qs8eRVKm2C2v+0aA@mail.gmail.com>
To: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 op-tee@lists.trustedfirmware.org, Bjorn Andersson <andersson@kernel.org>,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jens Wiklander <jens.wiklander@linaro.org>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v13 4/7] remoteproc: Introduce release_fw
	optional operation
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

On Tue, 19 Nov 2024 at 13:38, Mathieu Poirier
<mathieu.poirier@linaro.org> wrote:
>
> On Tue, 19 Nov 2024 at 11:14, Arnaud POULIQUEN
> <arnaud.pouliquen@foss.st.com> wrote:
> >
> > Hello Mathieu,
> >
> > On 11/18/24 18:52, Mathieu Poirier wrote:
> > > On Mon, Nov 04, 2024 at 02:35:12PM +0100, Arnaud Pouliquen wrote:
> > >> This patch updates the rproc_ops struct to include an optional
> > >> release_fw function.
> > >>
> > >> The release_fw ops is responsible for releasing the remote processor
> > >> firmware image. The ops is called in the following cases:
> > >>
> > >>  - An error occurs in rproc_start() between the loading of the segments and
> > >>       the start of the remote processor.
> > >>  - after stopping the remote processor.
> > >>
> > >> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> > >> ---
> > >> Updates from version V11:
> > >> - fix typo in @release_fw comment
> > >> ---
> > >>  drivers/remoteproc/remoteproc_core.c | 5 +++++
> > >>  include/linux/remoteproc.h           | 3 +++
> > >>  2 files changed, 8 insertions(+)
> > >>
> > >> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> > >> index 7694817f25d4..46863e1ca307 100644
> > >> --- a/drivers/remoteproc/remoteproc_core.c
> > >> +++ b/drivers/remoteproc/remoteproc_core.c
> > >> @@ -1258,6 +1258,9 @@ static int rproc_alloc_registered_carveouts(struct rproc *rproc)
> > >>
> > >>  static void rproc_release_fw(struct rproc *rproc)
> > >>  {
> > >> +    if (rproc->ops->release_fw)
> > >> +            rproc->ops->release_fw(rproc);
> > >> +
> > >>      /* Free the copy of the resource table */
> > >>      kfree(rproc->cached_table);
> > >>      rproc->cached_table = NULL;
> > >> @@ -1377,6 +1380,8 @@ static int rproc_start(struct rproc *rproc, const struct firmware *fw)
> > >>  unprepare_subdevices:
> > >>      rproc_unprepare_subdevices(rproc);
> > >>  reset_table_ptr:
> > >> +    if (rproc->ops->release_fw)
> > >> +            rproc->ops->release_fw(rproc);
> > >>      rproc->table_ptr = rproc->cached_table;
> > >
> > > I suggest the following:
> > >
> > > 1) Create two new functions, i.e rproc_load_fw() and rproc_release_fw().  The
> > > only thing those would do is call rproc->ops->load_fw() and
> > > rproc->ops->release_fw(), if they are present.  When a TEE interface is
> > > available, ->load_fw() and ->release_fw() become rproc_tee_load_fw() and
> > > rproc_tee_release_fw().
> >
> >
> > I'm wondering if it should be ->preload_fw() instead of ->load_fw() ops, as the
> > ->load() op already exists.
> >
>
> I agree that ->load() and ->load_fw() will lead to confusion.  I would
> support ->preload_fw() but there is no obvious antonyme.
>
> Since we already have rproc_ops::prepare() and rproc_prepare_device()
> I suggest rproc_ops::prepare_fw() and rproc_prepare_fw().  The
> corollary would be rproc_ops::unprepare_fw() and rproc_unprepare_fm().
> That said, I'm open to other ideas should you be interested in finding
> other alternatives.
>

Actually...  A better approach might to rename rproc::load to
rproc::load_segments.  That way we can use rproc::load_fw() and
rproc_load_fw() without confusion.

> > >
> > > 2) Call rproc_load_fw() in rproc_boot(), just before rproc_fw_boot().  If the
> > > call to rproc_fw_boot() fails, call rproc_release_fw().
> > >
> > > 3) The same logic applies to rproc_boot_recovery(), i.e call rproc_load_fw()
> > > before rproc_start() and call rproc_release_fw() if rproc_start() fails.
> >
> >
> > I implemented this and I'm currently testing it.
> > Thise second part requires a few adjustments to work. The ->load() ops needs to
> > becomes optional to not be called if the "->preload_fw()" is used.
> >
> > For that, I propose to return 0 in rproc_load_segments if rproc->ops->load is
> > NULL and compensate by checking that at least "->preload_fw()" or ->load() is
> > non-null in rproc_alloc_ops.
> >
>
> I agree.
>
> > Thanks,
> > Arnaud
> >
> >
> > >
> > > 4) Take rproc_tee_load_fw() out of rproc_tee_parse_fw().  It will now be called
> > > in rproc_load_fw().
> > >
> > > 5) As stated above function rproc_release_fw() now calls rproc_tee_release_fw().
> > > The former is already called in rproc_shutdown() so we are good in that front.
> > >
> > > With the above the cached_table management within the core remains the same and
> > > we can get rid of patch 3.7.
> >
> > >
> > > Thanks,
> > > Mathieu
> > >
> > >>
> > >>      return ret;
> > >> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> > >> index 2e0ddcb2d792..08e0187a84d9 100644
> > >> --- a/include/linux/remoteproc.h
> > >> +++ b/include/linux/remoteproc.h
> > >> @@ -381,6 +381,8 @@ enum rsc_handling_status {
> > >>   * @panic:  optional callback to react to system panic, core will delay
> > >>   *          panic at least the returned number of milliseconds
> > >>   * @coredump:         collect firmware dump after the subsystem is shutdown
> > >> + * @release_fw:     optional function to release the firmware image from ROM memories.
> > >> + *          This function is called after stopping the remote processor or in case of an error
> > >>   */
> > >>  struct rproc_ops {
> > >>      int (*prepare)(struct rproc *rproc);
> > >> @@ -403,6 +405,7 @@ struct rproc_ops {
> > >>      u64 (*get_boot_addr)(struct rproc *rproc, const struct firmware *fw);
> > >>      unsigned long (*panic)(struct rproc *rproc);
> > >>      void (*coredump)(struct rproc *rproc);
> > >> +    void (*release_fw)(struct rproc *rproc);
> > >>  };
> > >>
> > >>  /**
> > >> --
> > >> 2.25.1
> > >>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
