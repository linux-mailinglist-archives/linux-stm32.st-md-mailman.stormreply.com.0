Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BACF14EBB8D
	for <lists+linux-stm32@lfdr.de>; Wed, 30 Mar 2022 09:15:21 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 787FAC628A1;
	Wed, 30 Mar 2022 07:15:21 +0000 (UTC)
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com
 [209.85.166.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EB98DC5AB61
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Mar 2022 23:51:44 +0000 (UTC)
Received: by mail-io1-f51.google.com with SMTP id r2so22909615iod.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Mar 2022 16:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RDogiJksgjzBWpwHPtzcTuV6/G2WximRelWOGofFAwA=;
 b=eE9f8EWWk2jX0JwQUKtnzgRnYi2N0AvWuh6ToR3VtYtAx9khkdxlw7CLNFueZZ06Fw
 chf2vahBcCfJ9ZH0fsDoguL9rhNY6DywAtKvL9L8/mA9DksssSdIG/c4/Dctl3QfUNl2
 VBa2XOM1p4dCRF+peXurjcOqOZ93XNZMmiXDaUGkG2nC94q6ppM3k9Z0W2mnHl2EgOdh
 /eTdjPoEguFRuIJiq67YBKc1oIN7XJnYo1J8OJwRMaO/Z8IrqAHxAjfV9KegXGfRoBqU
 GRaq1Xbb6J7KLMqTWqjAKhiAhDWpX2GxM95KbLx8RT0RozT4+ho3+VIxYmK6S2YXVU+N
 MChA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RDogiJksgjzBWpwHPtzcTuV6/G2WximRelWOGofFAwA=;
 b=4ODd5oUP5M7yJO/b23lmN9nRoXFkoUSBSoONFKZESdakAopkQL/+2FzWkHlOU5B5qV
 DcupRm+Onj9vV43qjdWKhFaHkPWX6/OQuiKSXOQtAQz3nH1mqSZIUk9Uy0cWARF2fzin
 SPezCPkm87E+afeYFIu4S5sQqGbXAqfMAHs0lYsDDqR8w13RWRM6ChnktG3LHOQH9xWC
 sjCPUrU287Up9vAV2xdjhhEtCelFoddtChqlsoJ/g0+xGc53wPlMbqlALEemKXebyA88
 CvSo7Yak8PBuQlqFzDQCq9shYZczEftJvlbrYUHTAmh5AkGJkVBBg8Rl3oN5ya6iOA/L
 +ecA==
X-Gm-Message-State: AOAM532pMd2OTEtBmNFyFMZFV/hj/jxb+DOo02cHcQ51Pw+op/omahye
 umX/R+TyVNqoCz/vuC0pej7lIgFAdva/bPqtH94=
X-Google-Smtp-Source: ABdhPJyeOFDxVD5tZQV3SlV4JtXzW4tlmY2Yr1iyvweyD/ph7Dk90xBFCNcaXZEuGWOqIT4nYr/YPbiOeF0msD+cjC0=
X-Received: by 2002:a05:6638:3395:b0:323:8a00:7151 with SMTP id
 h21-20020a056638339500b003238a007151mr2661460jav.93.1648597903968; Tue, 29
 Mar 2022 16:51:43 -0700 (PDT)
MIME-Version: 1.0
References: <20220328175033.2437312-1-roberto.sassu@huawei.com>
 <20220328175033.2437312-6-roberto.sassu@huawei.com>
In-Reply-To: <20220328175033.2437312-6-roberto.sassu@huawei.com>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Tue, 29 Mar 2022 16:51:32 -0700
Message-ID: <CAEf4BzY9d0pUP2TFkOY41dbjyYrsr5S+sNCpynPtg_9XZHFb-Q@mail.gmail.com>
To: Roberto Sassu <roberto.sassu@huawei.com>
X-Mailman-Approved-At: Wed, 30 Mar 2022 07:15:19 +0000
Cc: Alexei Starovoitov <ast@kernel.org>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Jonathan Corbet <corbet@lwn.net>,
 Networking <netdev@vger.kernel.org>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>, KP Singh <kpsingh@kernel.org>,
 Mimi Zohar <zohar@linux.ibm.com>, Andrii Nakryiko <andrii@kernel.org>,
 linux-security-module@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>,
 mcoquelin.stm32@gmail.com, linux-fsdevel@vger.kernel.org,
 linux-integrity@vger.kernel.org, bpf <bpf@vger.kernel.org>,
 Shuah Khan <shuah@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
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

On Mon, Mar 28, 2022 at 10:52 AM Roberto Sassu <roberto.sassu@huawei.com> wrote:
>
> The first part of the preload code generation consists in generating the
> static variables to be used by the code itself: the links and maps to be
> pinned, and the skeleton. Generation of the preload variables and methods
> is enabled with the option -P added to 'bpftool gen skeleton'.
>
> The existing variables maps_link and progs_links in bpf_preload_kern.c have
> been renamed respectively to dump_bpf_map_link and dump_bpf_prog_link, to
> match the name of the variables in the main structure of the light
> skeleton.
>
> Signed-off-by: Roberto Sassu <roberto.sassu@huawei.com>
> ---
>  kernel/bpf/preload/bpf_preload_kern.c         |  35 +-
>  kernel/bpf/preload/iterators/Makefile         |   2 +-
>  .../bpf/preload/iterators/iterators.lskel.h   | 378 +++++++++---------
>  .../bpf/bpftool/Documentation/bpftool-gen.rst |   5 +
>  tools/bpf/bpftool/bash-completion/bpftool     |   2 +-
>  tools/bpf/bpftool/gen.c                       |  27 ++
>  tools/bpf/bpftool/main.c                      |   7 +-
>  tools/bpf/bpftool/main.h                      |   1 +
>  8 files changed, 254 insertions(+), 203 deletions(-)
>

[...]

> +__attribute__((unused)) static void
> +iterators_bpf__assert(struct iterators_bpf *s)
> +{
> +#ifdef __cplusplus
> +#define _Static_assert static_assert
> +#endif
> +#ifdef __cplusplus
> +#undef _Static_assert
> +#endif
> +}
> +
> +static struct bpf_link *dump_bpf_map_link;
> +static struct bpf_link *dump_bpf_prog_link;
> +static struct iterators_bpf *skel;

I don't understand what is this and what for? You are making an
assumption that light skeleton can be instantiated just once, why? And
adding extra bpftool option to light skeleton codegen just to save a
bit of typing at the place where light skeleton is actually
instantiated and used doesn't seems like a right approach.

Further, even if this is the way to go, please split out bpftool
changes from kernel changes. There is nothing requiring them to be
coupled together.

[...]
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
