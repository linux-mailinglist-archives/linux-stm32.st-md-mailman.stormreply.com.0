Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BF8D67B85A
	for <lists+linux-stm32@lfdr.de>; Wed, 25 Jan 2023 18:22:38 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EEDFDC69057;
	Wed, 25 Jan 2023 17:22:37 +0000 (UTC)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com
 [209.85.219.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 89BD2C03FC3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Jan 2023 17:22:36 +0000 (UTC)
Received: by mail-yb1-f172.google.com with SMTP id t16so19244019ybk.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Jan 2023 09:22:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=IqJXv+IInDU1mKTOWecSjx46uIp9RhIiEah7PjvPLrg=;
 b=QlZyecSvRJAlH7daZiVbTmdMCDJawwIkjqybbPcYd50INvCOOFwycJjGFsDCENBvPF
 JeBM9yeOQDknmaZC6LT0p7wlzLAJo3QYgAn7K1xQNCTJjPrh6oinOxgRNGwGedAqUfeH
 4EF6oknHwKU0N6BIZOc0CJi1hrgM4W0zxm3gicvvOuEGF7JC9HCNICDdMPEAz6Lz/B5y
 FN2dpyuojKkpe3r7ipsFxRIyHaJ4nJmkiiUGkQy6aOsuBhBZ3WzwUsGkq0uXDlGTKFEH
 iRh4N/trPN148wcbBUC1DmqB3ErHQLF9n9pkmMXooLK6oXyXf0aS41iIJv2buhnN7zSu
 X8Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IqJXv+IInDU1mKTOWecSjx46uIp9RhIiEah7PjvPLrg=;
 b=e3vDYTLeC4XAJZaAgwqsfN+nRyaEO13pnSks579NK29DG2SDk7DFZDcYgop/k0s0Ok
 G9rS/o5/P+pyAfauHi6JRyTQHlwHP13YlW1rE+wlf5MKr/TdW2VqSsaCMjrDrgvMjyic
 qBLZ82W77y9nIwXP+WIpUlLDPFoqRydESUllXG54p9Jgv4WhxnKNUZUPOOgHcqe5MTTy
 8gZ0Y/dfyIeu/WXio0aZa6GoVdArHiD/9vkJWOfoIFWDGWMxozmJ/6L34MSdcLHbz/MS
 dCLUPm2d/jLOFEk6RWSxlwG/qz2bAQYPmW3lYsAXVIi64TmF7lOF07Z3kJmoI6dy6LQr
 BH/A==
X-Gm-Message-State: AFqh2korY/RxYcw5U3kYTnBm9YTYxYEvZf+qc5EoiRtQcQRTSmfYfKMV
 sCJeSrivqCqNq35iFARt2UxIahb/tSLSBV/taBuKAw==
X-Google-Smtp-Source: AMrXdXv634nY3BrnZ3PlTUGlyUi8i7L3YenO2gMgxW5qJ4tF6Xha6yZp+2FFeWeU8OQrXrCFeHpomo5nr++haHZW7UI=
X-Received: by 2002:a25:a408:0:b0:800:28d4:6936 with SMTP id
 f8-20020a25a408000000b0080028d46936mr2303639ybi.431.1674667354997; Wed, 25
 Jan 2023 09:22:34 -0800 (PST)
MIME-Version: 1.0
References: <20230125083851.27759-1-surenb@google.com>
 <20230125083851.27759-5-surenb@google.com>
 <Y9D4rWEsajV/WfNx@dhcp22.suse.cz>
 <CAJuCfpGd2eG0RSMte9OVgsRVWPo+Sj7+t8EOo8o_iKzZoh1MXA@mail.gmail.com>
 <Y9Fh9joU3vTCwYbX@dhcp22.suse.cz>
In-Reply-To: <Y9Fh9joU3vTCwYbX@dhcp22.suse.cz>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 25 Jan 2023 09:22:23 -0800
Message-ID: <CAJuCfpEJ1U2UHBNhLx4gggN3PLZKP5RejiZL_U5ZLxU_wdviVg@mail.gmail.com>
To: Michal Hocko <mhocko@suse.com>
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
 gurua@google.com, dgilbert@interlog.com, xiang@kernel.org, pabeni@redhat.com,
 jejb@linux.ibm.com, quic_abhinavk@quicinc.com, bp@alien8.de,
 mchehab@kernel.org, linux-ext4@vger.kernel.org, tomba@kernel.org,
 hughlynch@google.com, sre@kernel.org, tfiga@chromium.org,
 linux-xfs@vger.kernel.org, zhangfei.gao@linaro.org, wangzhou1@hisilicon.com,
 netdev@vger.kernel.org, bpf@vger.kernel.org, linux-erofs@lists.ozlabs.org,
 davem@davemloft.net, kvm@vger.kernel.org, mst@redhat.com, peterz@infradead.org,
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
Subject: Re: [Linux-stm32] [PATCH v2 4/6] mm: replace vma->vm_flags indirect
	modification in ksm_madvise
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

On Wed, Jan 25, 2023 at 9:08 AM Michal Hocko <mhocko@suse.com> wrote:
>
> On Wed 25-01-23 08:57:48, Suren Baghdasaryan wrote:
> > On Wed, Jan 25, 2023 at 1:38 AM 'Michal Hocko' via kernel-team
> > <kernel-team@android.com> wrote:
> > >
> > > On Wed 25-01-23 00:38:49, Suren Baghdasaryan wrote:
> > > > Replace indirect modifications to vma->vm_flags with calls to modifier
> > > > functions to be able to track flag changes and to keep vma locking
> > > > correctness. Add a BUG_ON check in ksm_madvise() to catch indirect
> > > > vm_flags modification attempts.
> > >
> > > Those BUG_ONs scream to much IMHO. KSM is an MM internal code so I
> > > gueess we should be willing to trust it.
> >
> > Yes, but I really want to prevent an indirect misuse since it was not
> > easy to find these. If you feel strongly about it I will remove them
> > or if you have a better suggestion I'm all for it.
>
> You can avoid that by making flags inaccesible directly, right?

Ah, you mean Peter's suggestion of using __private? I guess that would
cover it. I'll drop these BUG_ONs in the next version. Thanks!

>
> --
> Michal Hocko
> SUSE Labs
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
