Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AAFC19D2FA0
	for <lists+linux-stm32@lfdr.de>; Tue, 19 Nov 2024 21:39:12 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4FAC8C78F9B;
	Tue, 19 Nov 2024 20:39:12 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3C07BC78F9B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Nov 2024 20:39:05 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-53d9ff92b14so1723587e87.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Nov 2024 12:39:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732048744; x=1732653544;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=sDfh97UAGy7PQC6vVLeHyLfQ6w8qUE9SWMRtfhKq9aY=;
 b=buTIv7ee5dgvUDgsCIFHG+at1RQ3bajzkccC18kfxFQ7Om1K/92EP82ABnMJaEcPQX
 e+zWdTPvHA5Lzu9UCPkEymPG0En/qJwvDS+cLjUn63ZO1MYEUzJQkh6Qrl1pOxQ904dn
 F89n5q3/mi7HKy5QK8wOy6T1HysAWaIM4K5oYsLRp6nWAbMJSn8WLCueizfvb1kd46nd
 LOcltFGmK+f1S68gX2QInyUubI+eI7LzWgnHJawtCkSktBnoI4mvr+Q4MdzOz5c23FFB
 +HSFzkbBt6u178YOcSI9OT6crsLAZrKjgj6SvmYB+SYu7n2k4Yt98sMRLB6b4fONVem6
 DWyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732048744; x=1732653544;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sDfh97UAGy7PQC6vVLeHyLfQ6w8qUE9SWMRtfhKq9aY=;
 b=PUD6GAaRdqOV84B3ZndiQiAbYeYOpDyFgb5D2k66NqB3LjJYayrWgAFIqut7ro4lVe
 GaZh+X7QkEIZLiWfk2zdY+qK/98MsyhWW+YIMZqEKlnVGRab7HV1t7oYWXG9SnToWXGp
 MunzqMJqUDfeCtq9E2QgDgrVp8g5IKWhONKaA/fj/UQjVy5sjyXHxxduZpqdS/3L87Pd
 o0xV9JgJAtXFTrxr6d5PRrDUp+jCkmjOeKYCJtKjb+BwsZhvVcqsTC+ECsu2znuH3+6d
 2AdPQ+fEm/rnMa7UE6YOV7oiTxYgqASNFd4rou2DRvQusF+N9I8HNVNKhgfmQzrY5e6f
 YmWQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX0qf/XVoY+3Bkq4QNEtVe+Zpc4gv3N3dtpKx6jGm/7qFrPf/AhJgTAny0d6BbzxeLBWtZj0gDA/hmFPA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yz+vRXdprq4+hk/c/0psouBGIPVWsdQEQegQ7/BFr/PIqn5lU0m
 a6xC1Q7S0CoJAkMJ/wVVbdZVS7mNSS94Lp7njzFijLp+tD4OQ6Cl5OTfXt1w3pGLEq59f1Yc/Q8
 tfrzTwSY2uwoIfhxzEYjX3JNfhw9UYrBgc3eanQ==
X-Google-Smtp-Source: AGHT+IGFzizseTaJgxdRGvtF7EQdP6G2Yicvf95WCYB9ehjF/h2LCbevBuMy713pgLF3P76zayFHLmDXWWo4/tcOtxc=
X-Received: by 2002:a05:6512:3b9c:b0:53d:a546:7111 with SMTP id
 2adb3069b0e04-53dc13670fbmr28892e87.37.1732048744338; Tue, 19 Nov 2024
 12:39:04 -0800 (PST)
MIME-Version: 1.0
References: <20241104133515.256497-1-arnaud.pouliquen@foss.st.com>
 <20241104133515.256497-5-arnaud.pouliquen@foss.st.com> <Zzt+7NBdNjyzWZIb@p14s>
 <0d9075cd-68c2-49ec-9b9c-4315aa8c8517@foss.st.com>
In-Reply-To: <0d9075cd-68c2-49ec-9b9c-4315aa8c8517@foss.st.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Tue, 19 Nov 2024 13:38:53 -0700
Message-ID: <CANLsYkxvTuLv8Omw-UeyPaA9g9QokmtMaMYD0eoUPo20wUuONQ@mail.gmail.com>
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

On Tue, 19 Nov 2024 at 11:14, Arnaud POULIQUEN
<arnaud.pouliquen@foss.st.com> wrote:
>
> Hello Mathieu,
>
> On 11/18/24 18:52, Mathieu Poirier wrote:
> > On Mon, Nov 04, 2024 at 02:35:12PM +0100, Arnaud Pouliquen wrote:
> >> This patch updates the rproc_ops struct to include an optional
> >> release_fw function.
> >>
> >> The release_fw ops is responsible for releasing the remote processor
> >> firmware image. The ops is called in the following cases:
> >>
> >>  - An error occurs in rproc_start() between the loading of the segments and
> >>       the start of the remote processor.
> >>  - after stopping the remote processor.
> >>
> >> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> >> ---
> >> Updates from version V11:
> >> - fix typo in @release_fw comment
> >> ---
> >>  drivers/remoteproc/remoteproc_core.c | 5 +++++
> >>  include/linux/remoteproc.h           | 3 +++
> >>  2 files changed, 8 insertions(+)
> >>
> >> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> >> index 7694817f25d4..46863e1ca307 100644
> >> --- a/drivers/remoteproc/remoteproc_core.c
> >> +++ b/drivers/remoteproc/remoteproc_core.c
> >> @@ -1258,6 +1258,9 @@ static int rproc_alloc_registered_carveouts(struct rproc *rproc)
> >>
> >>  static void rproc_release_fw(struct rproc *rproc)
> >>  {
> >> +    if (rproc->ops->release_fw)
> >> +            rproc->ops->release_fw(rproc);
> >> +
> >>      /* Free the copy of the resource table */
> >>      kfree(rproc->cached_table);
> >>      rproc->cached_table = NULL;
> >> @@ -1377,6 +1380,8 @@ static int rproc_start(struct rproc *rproc, const struct firmware *fw)
> >>  unprepare_subdevices:
> >>      rproc_unprepare_subdevices(rproc);
> >>  reset_table_ptr:
> >> +    if (rproc->ops->release_fw)
> >> +            rproc->ops->release_fw(rproc);
> >>      rproc->table_ptr = rproc->cached_table;
> >
> > I suggest the following:
> >
> > 1) Create two new functions, i.e rproc_load_fw() and rproc_release_fw().  The
> > only thing those would do is call rproc->ops->load_fw() and
> > rproc->ops->release_fw(), if they are present.  When a TEE interface is
> > available, ->load_fw() and ->release_fw() become rproc_tee_load_fw() and
> > rproc_tee_release_fw().
>
>
> I'm wondering if it should be ->preload_fw() instead of ->load_fw() ops, as the
> ->load() op already exists.
>

I agree that ->load() and ->load_fw() will lead to confusion.  I would
support ->preload_fw() but there is no obvious antonyme.

Since we already have rproc_ops::prepare() and rproc_prepare_device()
I suggest rproc_ops::prepare_fw() and rproc_prepare_fw().  The
corollary would be rproc_ops::unprepare_fw() and rproc_unprepare_fm().
That said, I'm open to other ideas should you be interested in finding
other alternatives.

> >
> > 2) Call rproc_load_fw() in rproc_boot(), just before rproc_fw_boot().  If the
> > call to rproc_fw_boot() fails, call rproc_release_fw().
> >
> > 3) The same logic applies to rproc_boot_recovery(), i.e call rproc_load_fw()
> > before rproc_start() and call rproc_release_fw() if rproc_start() fails.
>
>
> I implemented this and I'm currently testing it.
> Thise second part requires a few adjustments to work. The ->load() ops needs to
> becomes optional to not be called if the "->preload_fw()" is used.
>
> For that, I propose to return 0 in rproc_load_segments if rproc->ops->load is
> NULL and compensate by checking that at least "->preload_fw()" or ->load() is
> non-null in rproc_alloc_ops.
>

I agree.

> Thanks,
> Arnaud
>
>
> >
> > 4) Take rproc_tee_load_fw() out of rproc_tee_parse_fw().  It will now be called
> > in rproc_load_fw().
> >
> > 5) As stated above function rproc_release_fw() now calls rproc_tee_release_fw().
> > The former is already called in rproc_shutdown() so we are good in that front.
> >
> > With the above the cached_table management within the core remains the same and
> > we can get rid of patch 3.7.
>
> >
> > Thanks,
> > Mathieu
> >
> >>
> >>      return ret;
> >> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> >> index 2e0ddcb2d792..08e0187a84d9 100644
> >> --- a/include/linux/remoteproc.h
> >> +++ b/include/linux/remoteproc.h
> >> @@ -381,6 +381,8 @@ enum rsc_handling_status {
> >>   * @panic:  optional callback to react to system panic, core will delay
> >>   *          panic at least the returned number of milliseconds
> >>   * @coredump:         collect firmware dump after the subsystem is shutdown
> >> + * @release_fw:     optional function to release the firmware image from ROM memories.
> >> + *          This function is called after stopping the remote processor or in case of an error
> >>   */
> >>  struct rproc_ops {
> >>      int (*prepare)(struct rproc *rproc);
> >> @@ -403,6 +405,7 @@ struct rproc_ops {
> >>      u64 (*get_boot_addr)(struct rproc *rproc, const struct firmware *fw);
> >>      unsigned long (*panic)(struct rproc *rproc);
> >>      void (*coredump)(struct rproc *rproc);
> >> +    void (*release_fw)(struct rproc *rproc);
> >>  };
> >>
> >>  /**
> >> --
> >> 2.25.1
> >>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
