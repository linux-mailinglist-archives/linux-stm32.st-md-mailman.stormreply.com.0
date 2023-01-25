Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DA82367B73E
	for <lists+linux-stm32@lfdr.de>; Wed, 25 Jan 2023 17:50:06 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6F81FC69057;
	Wed, 25 Jan 2023 16:50:06 +0000 (UTC)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com
 [209.85.128.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9C18CC03FC3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Jan 2023 16:50:04 +0000 (UTC)
Received: by mail-yw1-f176.google.com with SMTP id
 00721157ae682-4c131bede4bso271896747b3.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Jan 2023 08:50:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=9oBkpwDuDP6Raat/HRHsNpx8MqzIjjZSJojQEumXoyE=;
 b=telMSbMEB1I/JdT8E+AOlYPkvLPDxj1UCnywL1f/zz+GxB6zyzUgN+Q3Q48l8AYc8X
 qS5rmRFlzboD9JIVNM4srPZju+Dc0OvfYTnyPjpp4sHdEutwmKfLXtqzcN+4YmFBRVgu
 A3oTpxaFO/E/7LaM1iu3pe6Iv0CmRV+MC10+sbVUAqr2eeBPD17IhS27buTMH3bCJoMu
 fEQq5XzvwDAqtF1fp8r2H4g3vh98tijISo+CkjBRkXWvZWGfdkjpWZzF8VgIKtCc5sLs
 +bZFNae0CmrxcmnBVuga8Dg0CQRlWnW+6m8p+riuFjzQ8BSrHATHKU3+MoO2RS3dWuby
 cPfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9oBkpwDuDP6Raat/HRHsNpx8MqzIjjZSJojQEumXoyE=;
 b=Lg+sjaT9tsXx2qm6YV84M+SQh+p+qIQ+cHwecmTd6xoKPt58vGmK53P5Nas01ANvTL
 wMd8ZiKrJPUWwcAEwyz8TVCRUtqBE1XrX0zab2BNpd1VwEJ8gXImdMHHNmHk8PlPEwYc
 h7t/T+FNw3cm84vLkkwxaWyK59erlYK4yR3DICis1GdBNfb62pjzwwzL3TP9qpGA8eHc
 uQDB3VDWS62vlYwV4OwJblNRTAzp+xe1XR/+ZFjsmC9Quz22SRqeOyUetbqNjf4XNUkk
 dIfT/Sqgki2LLdDilSjNllEVsAUk+scKCcZsF5m+jXlv9kOasbccj1Kknb5jpHHcwmgN
 vSPQ==
X-Gm-Message-State: AFqh2kphar5TIc8S8GAAv2UGbr4eLhvTyr2zsLuIxbsGXiYU25O7YzMr
 KhWfsrEZEq4VekPr/7vu+5Yo9Vc2S1+ZlwaL+uYEew==
X-Google-Smtp-Source: AMrXdXsah5c2WKVW38d6ZSr7pPop+n/mEJC53KDRGLQOXrHcU20AK6F0ktCN8HrtzVAtxjIN7wyafP19A/nGyLOtNU8=
X-Received: by 2002:a81:1d2:0:b0:433:f1c0:3f1c with SMTP id
 201-20020a8101d2000000b00433f1c03f1cmr4401576ywb.438.1674665403087; Wed, 25
 Jan 2023 08:50:03 -0800 (PST)
MIME-Version: 1.0
References: <20230125083851.27759-1-surenb@google.com>
 <20230125083851.27759-2-surenb@google.com>
 <Y9Dx0cPXF2yoLwww@hirez.programming.kicks-ass.net>
In-Reply-To: <Y9Dx0cPXF2yoLwww@hirez.programming.kicks-ass.net>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 25 Jan 2023 08:49:50 -0800
Message-ID: <CAJuCfpEcVCZaCGzc-Wim25eaV5e6YG1YJAAdKwZ6JHViB0z8aw@mail.gmail.com>
To: Peter Zijlstra <peterz@infradead.org>
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
 linux-rdma@vger.kernel.org, linux-staging@lists.linux.dev, willy@infradead.org,
 dgilbert@interlog.com, xiang@kernel.org, pabeni@redhat.com, jejb@linux.ibm.com,
 quic_abhinavk@quicinc.com, bp@alien8.de, mchehab@kernel.org,
 linux-ext4@vger.kernel.org, tomba@kernel.org, hughlynch@google.com,
 sre@kernel.org, tfiga@chromium.org, linux-xfs@vger.kernel.org,
 zhangfei.gao@linaro.org, wangzhou1@hisilicon.com, netdev@vger.kernel.org,
 bpf@vger.kernel.org, linux-erofs@lists.ozlabs.org, davem@davemloft.net,
 mhocko@suse.com, kvm@vger.kernel.org, mst@redhat.com, gurua@google.com,
 bigeasy@linutronix.de, dhowells@redhat.com, linux-mm@kvack.org,
 ray.huang@amd.com, adilger.kernel@dilger.ca, kuba@kernel.org,
 sparclinux@vger.kernel.org, airlied@gmail.com, anton.ivanov@cambridgegreys.com,
 herbert@gondor.apana.org.au, linux-scsi@vger.kernel.org, richard@nod.at,
 x86@kernel.org, vkoul@kernel.org, mingo@redhat.com, axelrasmussen@google.com,
 intel-gfx@lists.freedesktop.org, daniel@ffwll.ch, paulmck@kernel.org,
 jannh@google.com, chao@kernel.org, maarten.lankhorst@linux.intel.com,
 liam.howlett@oracle.com, hdegoede@redhat.com,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com, vbabka@suse.cz,
 dimitri.sivanich@hpe.com, amd-gfx@lists.freedesktop.org, posk@google.com,
 lstoakes@gmail.com, peterjung1337@gmail.com, yoshfuji@linux-ipv6.org,
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

On Wed, Jan 25, 2023 at 1:10 AM Peter Zijlstra <peterz@infradead.org> wrote:
>
> On Wed, Jan 25, 2023 at 12:38:46AM -0800, Suren Baghdasaryan wrote:
>
> > diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
> > index 2d6d790d9bed..6c7c70bf50dd 100644
> > --- a/include/linux/mm_types.h
> > +++ b/include/linux/mm_types.h
> > @@ -491,7 +491,13 @@ struct vm_area_struct {
> >        * See vmf_insert_mixed_prot() for discussion.
> >        */
> >       pgprot_t vm_page_prot;
> > -     unsigned long vm_flags;         /* Flags, see mm.h. */
> > +
> > +     /*
> > +      * Flags, see mm.h.
> > +      * WARNING! Do not modify directly.
> > +      * Use {init|reset|set|clear|mod}_vm_flags() functions instead.
> > +      */
> > +     unsigned long vm_flags;
>
> We have __private and ACCESS_PRIVATE() to help with enforcing this.

Thanks for pointing this out, Peter! I guess for that I'll need to
convert all read accesses and provide get_vm_flags() too? That will
cause some additional churt (a quick search shows 801 hits over 248
files) but maybe it's worth it? I think Michal suggested that too in
another patch. Should I do that while we are at it?

>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
