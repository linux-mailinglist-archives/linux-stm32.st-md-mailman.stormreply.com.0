Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E2C2D67BA95
	for <lists+linux-stm32@lfdr.de>; Wed, 25 Jan 2023 20:22:10 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8FA99C69057;
	Wed, 25 Jan 2023 19:22:10 +0000 (UTC)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com
 [209.85.219.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1ACBBC03FC3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Jan 2023 19:22:09 +0000 (UTC)
Received: by mail-yb1-f173.google.com with SMTP id u72so3673399ybi.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Jan 2023 11:22:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=azRxZ4iz/UmvW0JqPrqtZcKNmaFt9MhDUKzgc4KSKbs=;
 b=idbJO946IIJ5xclJl8K3ScrKphDS9TF1tg1AgsB8MPco32Ta3+qR61NnmqeUtsnx6v
 goCUeETP5lzAzmASwAR43MDdzy2mxaLRi4K6yZE3Q+T5C1FUbuWCmQDSDtqKn5s2e6iw
 g3L5+Ey8VBu5ZDVtB0a1Axssd66xmU+yYweeF+hE6jQwYilC1xMJq5jCj+NjIEVUsfL4
 tw7nY9DM/DzPYd8vrkO+1JZY6FVSYBMjhRJz+WIxF8k5j1BI+Qpdb88Is7APtmnyodC7
 tcl2VYHmnzhTEoT5QVoxpB++zHDpcXCuz10aLB8wrCQNw685txpV1MvZDG3GANSg7b1j
 9Xwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=azRxZ4iz/UmvW0JqPrqtZcKNmaFt9MhDUKzgc4KSKbs=;
 b=wy68rA7btHTO6yqoUbJiBkhqJHuv0tH5V/3y3QHd3G6/jfuNnXvvvlr4JsO9JjNFbV
 SNnrc9GkgGSwwsUcCmACuYVQjgz4KjuYW3fj3nq2FlpeEKLwu5fAIfDES+8CBxD4vwcm
 +Q58QvIRCiGhNglzYDYXfq5pj3SmSU03839NCb+kZcaPxlfj2y5R+SjW0nb9pmXKjDqk
 ZD4+FqC4qLrFiZ75wtX2Uuqj1y+5QiMlVWSiZmoHuJbPycY1UOFeMtZmC4XV+EVSd798
 K/4phB4E1up2oZqq03TwWJUn2+krwFAtQhO1lH/5L+cpcequ99mrC2xsuA+jnvmW63Xw
 ElJw==
X-Gm-Message-State: AO0yUKWQNi/PxcfwKFTS9D2GYgoZXkuVLVcnrCv5ftUDGzet65WRPAyg
 r1J0VyTo7wg2bbPT3PM3I+QgVbMWrNEqzC5NOewG0Q==
X-Google-Smtp-Source: AK7set9Keebho/efVX9+GO9rxFk2PCEOZWbQBvt6Ld/Tpsz3uuvCSMXu6oGPdxC/ITtQ87qnzhMkMAEzeywlAhveKx4=
X-Received: by 2002:a25:c247:0:b0:80b:6201:bee7 with SMTP id
 s68-20020a25c247000000b0080b6201bee7mr946541ybf.340.1674674527537; Wed, 25
 Jan 2023 11:22:07 -0800 (PST)
MIME-Version: 1.0
References: <20230125083851.27759-1-surenb@google.com>
 <20230125083851.27759-2-surenb@google.com>
 <Y9Dx0cPXF2yoLwww@hirez.programming.kicks-ass.net>
 <CAJuCfpEcVCZaCGzc-Wim25eaV5e6YG1YJAAdKwZ6JHViB0z8aw@mail.gmail.com>
 <Y9F28J9njAtwifuL@casper.infradead.org>
In-Reply-To: <Y9F28J9njAtwifuL@casper.infradead.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 25 Jan 2023 11:21:56 -0800
Message-ID: <CAJuCfpHO7g-5GZep0e7r=dFTBhVHpN3R_pHMGOqetgrKyYzMFQ@mail.gmail.com>
To: Matthew Wilcox <willy@infradead.org>
Cc: michel@lespinasse.org, nvdimm@lists.linux.dev, heiko@sntech.de,
 leewalsh@google.com, dri-devel@lists.freedesktop.org, perex@perex.cz,
 jglisse@google.com, arjunroy@google.com, m.szyprowski@samsung.com,
 linux-arch@vger.kernel.org, qianweili@huawei.com,
 linux-samsung-soc@vger.kernel.org, aneesh.kumar@linux.ibm.com,
 chenhuacai@kernel.org, kasan-dev@googlegroups.com, linux-acpi@vger.kernel.org,
 rientjes@google.com, xen-devel@lists.xenproject.org, devel@lists.orangefs.org,
 robdclark@gmail.com, minchan@google.com, robert.jarzmik@free.fr,
 linux-um@lists.infradead.org, etnaviv@lists.freedesktop.org, npiggin@gmail.com,
 alex.williamson@redhat.com, viro@zeniv.linux.org.uk, luto@kernel.org,
 gthelen@google.com, tglx@linutronix.de, ldufour@linux.ibm.com,
 linux-sgx@vger.kernel.org, martin.petersen@oracle.com,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, akpm@linux-foundation.org,
 linux-media@vger.kernel.org, freedreno@lists.freedesktop.org,
 joelaf@google.com, linux-aio@kvack.org, linux-fbdev@vger.kernel.org,
 linux-ia64@vger.kernel.org, david@redhat.com, dave.hansen@linux.intel.com,
 virtualization@lists.linux-foundation.org, edumazet@google.com,
 target-devel@vger.kernel.org, punit.agrawal@bytedance.com,
 linux-s390@vger.kernel.org, dave@stgolabs.net, deller@gmx.de, hughd@google.com,
 andrii@kernel.org, patrik.r.jakobsson@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-rockchip@lists.infradead.org,
 linux-graphics-maintainer@vmware.com, kernel-team@android.com,
 jayalk@intworks.biz, soheil@google.com, selinux@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, mripard@kernel.org, shakeelb@google.com,
 haojian.zhuang@gmail.com, loongarch@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, tytso@mit.edu, nico@fluxnic.net,
 muchun.song@linux.dev, hjc@rock-chips.com, mcoquelin.stm32@gmail.com,
 tatashin@google.com, mike.kravetz@oracle.com, songliubraving@fb.com,
 jasowang@redhat.com, alsa-devel@alsa-project.org, peterx@redhat.com,
 linux-tegra@vger.kernel.org, kraxel@redhat.com, will@kernel.org,
 dmaengine@vger.kernel.org, bhe@redhat.com, miklos@szeredi.hu,
 linux-rdma@vger.kernel.org, linux-staging@lists.linux.dev,
 amd-gfx@lists.freedesktop.org, gurua@google.com, dgilbert@interlog.com,
 xiang@kernel.org, pabeni@redhat.com, jejb@linux.ibm.com,
 quic_abhinavk@quicinc.com, bp@alien8.de, mchehab@kernel.org,
 linux-ext4@vger.kernel.org, tomba@kernel.org, hughlynch@google.com,
 sre@kernel.org, tfiga@chromium.org, linux-xfs@vger.kernel.org,
 zhangfei.gao@linaro.org, wangzhou1@hisilicon.com, netdev@vger.kernel.org,
 bpf@vger.kernel.org, linux-erofs@lists.ozlabs.org, davem@davemloft.net,
 mhocko@suse.com, kvm@vger.kernel.org, mst@redhat.com,
 Peter Zijlstra <peterz@infradead.org>, bigeasy@linutronix.de,
 dhowells@redhat.com, linux-mm@kvack.org, ray.huang@amd.com,
 adilger.kernel@dilger.ca, kuba@kernel.org, sparclinux@vger.kernel.org,
 airlied@gmail.com, anton.ivanov@cambridgegreys.com,
 herbert@gondor.apana.org.au, linux-scsi@vger.kernel.org, richard@nod.at,
 x86@kernel.org, vkoul@kernel.org, mingo@redhat.com, axelrasmussen@google.com,
 intel-gfx@lists.freedesktop.org, daniel@ffwll.ch, paulmck@kernel.org,
 jannh@google.com, chao@kernel.org, maarten.lankhorst@linux.intel.com,
 liam.howlett@oracle.com, hdegoede@redhat.com,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com, vbabka@suse.cz,
 dimitri.sivanich@hpe.com, posk@google.com, lstoakes@gmail.com,
 peterjung1337@gmail.com, yoshfuji@linux-ipv6.org,
 linuxppc-dev@lists.ozlabs.org, dsahern@kernel.org, kent.overstreet@linux.dev,
 kexec@lists.infradead.org, tiwai@suse.com, krzysztof.kozlowski@linaro.org,
 tzimmermann@suse.de, hannes@cmpxchg.org, dmitry.baryshkov@linaro.org,
 johannes@sipsolutions.net, mgorman@techsingularity.net,
 linux-accelerators@lists.ozlabs.org, l.stach@pengutronix.de
Subject: Re: [Linux-stm32] [PATCH v2 1/6] mm: introduce vma->vm_flags
	modifier functions
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

On Wed, Jan 25, 2023 at 10:37 AM Matthew Wilcox <willy@infradead.org> wrote:
>
> On Wed, Jan 25, 2023 at 08:49:50AM -0800, Suren Baghdasaryan wrote:
> > On Wed, Jan 25, 2023 at 1:10 AM Peter Zijlstra <peterz@infradead.org> wrote:
> > > > +     /*
> > > > +      * Flags, see mm.h.
> > > > +      * WARNING! Do not modify directly.
> > > > +      * Use {init|reset|set|clear|mod}_vm_flags() functions instead.
> > > > +      */
> > > > +     unsigned long vm_flags;
> > >
> > > We have __private and ACCESS_PRIVATE() to help with enforcing this.
> >
> > Thanks for pointing this out, Peter! I guess for that I'll need to
> > convert all read accesses and provide get_vm_flags() too? That will
> > cause some additional churt (a quick search shows 801 hits over 248
> > files) but maybe it's worth it? I think Michal suggested that too in
> > another patch. Should I do that while we are at it?
>
> Here's a trick I saw somewhere in the VFS:
>
>         union {
>                 const vm_flags_t vm_flags;
>                 vm_flags_t __private __vm_flags;
>         };
>
> Now it can be read by anybody but written only by those using
> ACCESS_PRIVATE.

Huh, this is quite nice! I think it does not save us from the cases
when vma->vm_flags is passed by a reference and modified indirectly,
like in ksm_madvise()? Though maybe such usecases are so rare (I found
only 2 cases) that we can ignore this?
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
