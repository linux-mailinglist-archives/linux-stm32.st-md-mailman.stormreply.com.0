Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CCD2D67D14D
	for <lists+linux-stm32@lfdr.de>; Thu, 26 Jan 2023 17:25:17 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 627FDC6905A;
	Thu, 26 Jan 2023 16:25:17 +0000 (UTC)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com
 [209.85.128.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9540DC69057
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 26 Jan 2023 16:25:16 +0000 (UTC)
Received: by mail-yw1-f180.google.com with SMTP id
 00721157ae682-4c24993965eso29756467b3.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 26 Jan 2023 08:25:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=rUFKXit/Slxp5jNkRtm2qJfbudUdkwg/5ym9L9/2xFg=;
 b=BrNExWGHbV1NeR+vu2Js5zAqwDKTAmFhHgoWjYZ0a3qbH7rru8W3QViuclznskZkVo
 6Q5eqrGX7jMOOdvE9K9lsVmJpHX9roidNQoqd4ah6qpZ3z5AR/LzfumpWsF7qxr+L/L7
 2EeJAw9MATGkA5VBf2UwOc7KCg21F0CUspP8pGqPmL78PHbmYrJgHGcDXuiJf+tpyEq5
 mYd3qiJmdB/mmqbT25mkgF6e/9yHOLIF4ZmJU2qiUjSg09+a1L9BOQF70sP/z/t1hEtG
 N3QguNCw23qX8RL/9XVLJb/vAzwIwx19tcG6Myly1SJ+d6fdbBsCbrW+Wp9iSE9SLjFe
 r7Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rUFKXit/Slxp5jNkRtm2qJfbudUdkwg/5ym9L9/2xFg=;
 b=Z4VAWGM6HOpdZ6j7O6jL+NZqyHoFSCgXLY2pjZVlCs/y0WFiEawaRj2cBdmj9SGdqA
 JJPGEyocoy1Qkg2PpCcKX6N/yAWK5m+IFymn6lWxjKwYbePHBZgxO9VO/vKa9fWlnpQE
 wXf45Iy9JNMMhj1Fz48CIHlWOoWKhkXi7UZ9scOxtTXVgrTEcYdRCFL1iY7VzJfGzHko
 5h8bhbZcyYqzQqMCdZE++QNhOEwCgA2yyL3iuqWF1WKgbX4JU6s2mxpQGO2whuK35fso
 AudIBMgqr9tLKkyWWqAZ1+U+F40dIafPgs+Jzm8FKApxdsqSGNzBi2xObl8mFY8/ZTZX
 sUpg==
X-Gm-Message-State: AFqh2kqwPs1Q/POuzg6IHRcD9C1DDq/05kBKT48FFKeG743UkIFaLmSn
 rI9icfFJbe9kzgxm+nbSSP6IJb3nAH/gn/JaQQIL9Q==
X-Google-Smtp-Source: AMrXdXvRVLeaIi85wIrJBS5zRkOyr5/BQ66PCe0y1aLe9hmWIu7jqHBlhyy2SYPoXbE9x4WotKo1j1aRHLVU6Hd1LsI=
X-Received: by 2002:a81:1b8b:0:b0:4ff:774b:7ffb with SMTP id
 b133-20020a811b8b000000b004ff774b7ffbmr3541685ywb.218.1674750315051; Thu, 26
 Jan 2023 08:25:15 -0800 (PST)
MIME-Version: 1.0
References: <20230125083851.27759-1-surenb@google.com>
 <20230125083851.27759-2-surenb@google.com>
 <Y9JFFYjfJf9uDijE@kernel.org> <Y9KTUw/04FmBVplw@kernel.org>
 <Y9KXjLaFFUvqqdd4@casper.infradead.org>
In-Reply-To: <Y9KXjLaFFUvqqdd4@casper.infradead.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Thu, 26 Jan 2023 08:25:03 -0800
Message-ID: <CAJuCfpHs4wvQpitiAYc+PQX3LnitF=wvm=zVX7CzMozzmnbcnw@mail.gmail.com>
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
 Mike Rapoport <rppt@kernel.org>, mhocko@suse.com, kvm@vger.kernel.org,
 mst@redhat.com, peterz@infradead.org, bigeasy@linutronix.de,
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

On Thu, Jan 26, 2023 at 7:09 AM Matthew Wilcox <willy@infradead.org> wrote:
>
> On Thu, Jan 26, 2023 at 04:50:59PM +0200, Mike Rapoport wrote:
> > On Thu, Jan 26, 2023 at 11:17:09AM +0200, Mike Rapoport wrote:
> > > On Wed, Jan 25, 2023 at 12:38:46AM -0800, Suren Baghdasaryan wrote:
> > > > +/* Use when VMA is not part of the VMA tree and needs no locking */
> > > > +static inline void init_vm_flags(struct vm_area_struct *vma,
> > > > +                          unsigned long flags)
> > >
> > > I'd suggest to make it vm_flags_init() etc.
> >
> > Thinking more about it, it will be even clearer to name these vma_flags_xyz()
>
> Perhaps vma_VERB_flags()?
>
> vma_init_flags()
> vma_reset_flags()
> vma_set_flags()
> vma_clear_flags()
> vma_mod_flags()

Due to excessive email bouncing I posted the v3 of this patchset using
the original per-VMA patchset's distribution list. That might have
dropped Mike from the list. Sorry about that Mike, I'll add you to my
usual list of suspects :)
The v3 is here:
https://lore.kernel.org/all/20230125233554.153109-1-surenb@google.com/
and Andrew did suggest the same renames, so I'll be posting v4 with
those changes later today.
Thanks for the feedback!

>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
