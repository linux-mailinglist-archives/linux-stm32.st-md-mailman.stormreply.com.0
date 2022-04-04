Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 313C54F0D35
	for <lists+linux-stm32@lfdr.de>; Mon,  4 Apr 2022 02:22:52 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D3FEBC6047D;
	Mon,  4 Apr 2022 00:22:51 +0000 (UTC)
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com
 [209.85.166.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2A12FC5F1D5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  4 Apr 2022 00:22:50 +0000 (UTC)
Received: by mail-io1-f51.google.com with SMTP id k25so9453274iok.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 03 Apr 2022 17:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aRWK0On/yQrY9JPjv44yF0LPcIjibwFg2byMQWbxmME=;
 b=m7QLUo7hQJc1gPKTRFWKJMyYxQRJoEUmN6fETczH5jCn8d4R/oKkYo4UWK5g0IY8VI
 p3ASRZ02UvqPNVj+uwGFqGiODMN6dX6xYvtxF/oHx0i35GLATYzqXnBFSkFxu9M+VwmT
 xb3/PdwR/s2kmyLi8ZTlpA/KcTv06dxnrjjglAUHXQxajJSS8bnqhbz2FmR6/t8zypGb
 rWAs86RwysW+2t2E+czeksUfo2S/bXGIkEc033ZcgZqbViqFeZFRNYHaiLflYRTwulO1
 ZWtK+SF68AjzHfD8eqQz6vsUP5GICjDbkWh+xyUyzHSFtaNFAsqcM27Y0U6kks0IQu+2
 Mq4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aRWK0On/yQrY9JPjv44yF0LPcIjibwFg2byMQWbxmME=;
 b=fXncGs8H4rlMJaQMno28FRpv33Wc5jrRQOiUHB14e87ike6KZ+u+FRz8fVesFx0sjM
 8VMKFOyRltl70bhR7toa7vJjRpmZ2/k17i8sV5+2u0GAeICgvl5UcEPFOn4PB+bkFH8W
 hxRo0uiNarusOc/QXTtBQzzigjjqCJSTWysTzHDW7IRPuL8r8pzlD+Xuew9OEEIWnaW/
 89FZb/SAm2V174lV4QDjtbt9ZBUVI4XFDEQgWOQ0bHa7577gVvG8ewE0RMVw1kr6Y9t4
 PmtSOA5HwD1titns7EhT5xcup2eowdtyhKD+pKZFys0aWYhnQlXltS8MAOVXCWcNY0OB
 Munw==
X-Gm-Message-State: AOAM531nHP+D/JrkphgkL/fSuU/JefwnIPKkIHArHnh92dfOH3kb6OHx
 odzjadE2fSDWg1cK1rqM273dxVbrI2qCcZEyjzY=
X-Google-Smtp-Source: ABdhPJw3GVx6VRlTw8pIT6ieOqU7bki+fDz8/uu6pPoGbccqm8oEHB/k+fnnlta0vSZ4NcUV23zKg08MWe65dXoOuPU=
X-Received: by 2002:a05:6638:2105:b0:323:68db:2e4e with SMTP id
 n5-20020a056638210500b0032368db2e4emr11000299jaj.234.1649031768898; Sun, 03
 Apr 2022 17:22:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220328175033.2437312-1-roberto.sassu@huawei.com>
 <20220328175033.2437312-6-roberto.sassu@huawei.com>
 <CAEf4BzY9d0pUP2TFkOY41dbjyYrsr5S+sNCpynPtg_9XZHFb-Q@mail.gmail.com>
 <4621def6171f4ca5948a59a7e714d25f@huawei.com>
In-Reply-To: <4621def6171f4ca5948a59a7e714d25f@huawei.com>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Sun, 3 Apr 2022 17:22:38 -0700
Message-ID: <CAEf4BzZB=aLA23xysFBm50AKZ72p0PBDeL5j1d0mmNCGW2VKwA@mail.gmail.com>
To: Roberto Sassu <roberto.sassu@huawei.com>
Cc: Alexei Starovoitov <ast@kernel.org>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Jonathan Corbet <corbet@lwn.net>,
 Networking <netdev@vger.kernel.org>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>, KP Singh <kpsingh@kernel.org>,
 Mimi Zohar <zohar@linux.ibm.com>, Andrii Nakryiko <andrii@kernel.org>,
 "linux-security-module@vger.kernel.org"
 <linux-security-module@vger.kernel.org>, Al Viro <viro@zeniv.linux.org.uk>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 "linux-integrity@vger.kernel.org" <linux-integrity@vger.kernel.org>,
 bpf <bpf@vger.kernel.org>, Shuah Khan <shuah@kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH 05/18] bpf-preload: Generate static
	variables
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

On Wed, Mar 30, 2022 at 12:44 AM Roberto Sassu <roberto.sassu@huawei.com> wrote:
>
> > From: Andrii Nakryiko [mailto:andrii.nakryiko@gmail.com]
> > Sent: Wednesday, March 30, 2022 1:52 AM
> > On Mon, Mar 28, 2022 at 10:52 AM Roberto Sassu
> > <roberto.sassu@huawei.com> wrote:
> > >
> > > The first part of the preload code generation consists in generating the
> > > static variables to be used by the code itself: the links and maps to be
> > > pinned, and the skeleton. Generation of the preload variables and
> > methods
> > > is enabled with the option -P added to 'bpftool gen skeleton'.
> > >
> > > The existing variables maps_link and progs_links in bpf_preload_kern.c
> > have
> > > been renamed respectively to dump_bpf_map_link and
> > dump_bpf_prog_link, to
> > > match the name of the variables in the main structure of the light
> > > skeleton.
> > >
> > > Signed-off-by: Roberto Sassu <roberto.sassu@huawei.com>
> > > ---
> > >  kernel/bpf/preload/bpf_preload_kern.c         |  35 +-
> > >  kernel/bpf/preload/iterators/Makefile         |   2 +-
> > >  .../bpf/preload/iterators/iterators.lskel.h   | 378 +++++++++---------
> > >  .../bpf/bpftool/Documentation/bpftool-gen.rst |   5 +
> > >  tools/bpf/bpftool/bash-completion/bpftool     |   2 +-
> > >  tools/bpf/bpftool/gen.c                       |  27 ++
> > >  tools/bpf/bpftool/main.c                      |   7 +-
> > >  tools/bpf/bpftool/main.h                      |   1 +
> > >  8 files changed, 254 insertions(+), 203 deletions(-)
> > >
> >
> > [...]
> >
> > > +__attribute__((unused)) static void
> > > +iterators_bpf__assert(struct iterators_bpf *s)
> > > +{
> > > +#ifdef __cplusplus
> > > +#define _Static_assert static_assert
> > > +#endif
> > > +#ifdef __cplusplus
> > > +#undef _Static_assert
> > > +#endif
> > > +}
> > > +
> > > +static struct bpf_link *dump_bpf_map_link;
> > > +static struct bpf_link *dump_bpf_prog_link;
> > > +static struct iterators_bpf *skel;
> >
> > I don't understand what is this and what for? You are making an
> > assumption that light skeleton can be instantiated just once, why? And
> > adding extra bpftool option to light skeleton codegen just to save a
> > bit of typing at the place where light skeleton is actually
> > instantiated and used doesn't seems like a right approach.
>
> True, iterator_bpf is simple. Writing the preloading code
> for it is simple. But, what if you wanted to preload an LSM
> with 10 hooks or more?

I suppose you'd write a straightforward code to do pinning ten times
for ten different programs to ten different paths. But with this you
don't have to establish a random set of conventions that might not
apply in all the situations to anyone that would try to use this
feature.

Worst case, light skeleton can be extended to provide a way to iterate
all programs programmatically.

>
> Ok, regarding where the preloading code should be, I will
> try to move the generated code to the kernel module instead
> of the light skeleton.
>
> Thanks
>
> Roberto
>
> HUAWEI TECHNOLOGIES Duesseldorf GmbH, HRB 56063
> Managing Director: Li Peng, Zhong Ronghua
>
> > Further, even if this is the way to go, please split out bpftool
> > changes from kernel changes. There is nothing requiring them to be
> > coupled together.
> >
> > [...]
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
