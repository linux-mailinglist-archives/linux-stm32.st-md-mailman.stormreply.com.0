Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 273964EBC02
	for <lists+linux-stm32@lfdr.de>; Wed, 30 Mar 2022 09:44:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D42C7C6046A;
	Wed, 30 Mar 2022 07:44:46 +0000 (UTC)
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com
 [185.176.79.56])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F2337C60465
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Mar 2022 07:44:44 +0000 (UTC)
Received: from fraeml711-chm.china.huawei.com (unknown [172.18.147.226])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4KSz1R04W5z67gYW;
 Wed, 30 Mar 2022 15:42:51 +0800 (CST)
Received: from fraeml714-chm.china.huawei.com (10.206.15.33) by
 fraeml711-chm.china.huawei.com (10.206.15.60) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 30 Mar 2022 09:44:43 +0200
Received: from fraeml714-chm.china.huawei.com ([10.206.15.33]) by
 fraeml714-chm.china.huawei.com ([10.206.15.33]) with mapi id 15.01.2375.024;
 Wed, 30 Mar 2022 09:44:43 +0200
From: Roberto Sassu <roberto.sassu@huawei.com>
To: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Thread-Topic: [PATCH 05/18] bpf-preload: Generate static variables
Thread-Index: AQHYQsyWLcVpB05sakWRWVPVfsSzdqzW6LQAgACiZ4A=
Date: Wed, 30 Mar 2022 07:44:43 +0000
Message-ID: <4621def6171f4ca5948a59a7e714d25f@huawei.com>
References: <20220328175033.2437312-1-roberto.sassu@huawei.com>
 <20220328175033.2437312-6-roberto.sassu@huawei.com>
 <CAEf4BzY9d0pUP2TFkOY41dbjyYrsr5S+sNCpynPtg_9XZHFb-Q@mail.gmail.com>
In-Reply-To: <CAEf4BzY9d0pUP2TFkOY41dbjyYrsr5S+sNCpynPtg_9XZHFb-Q@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.81.209.190]
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Cc: Alexei Starovoitov <ast@kernel.org>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Jonathan Corbet <corbet@lwn.net>,
 Networking <netdev@vger.kernel.org>, Linux Doc
 Mailing List <linux-doc@vger.kernel.org>,
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

> From: Andrii Nakryiko [mailto:andrii.nakryiko@gmail.com]
> Sent: Wednesday, March 30, 2022 1:52 AM
> On Mon, Mar 28, 2022 at 10:52 AM Roberto Sassu
> <roberto.sassu@huawei.com> wrote:
> >
> > The first part of the preload code generation consists in generating the
> > static variables to be used by the code itself: the links and maps to be
> > pinned, and the skeleton. Generation of the preload variables and
> methods
> > is enabled with the option -P added to 'bpftool gen skeleton'.
> >
> > The existing variables maps_link and progs_links in bpf_preload_kern.c
> have
> > been renamed respectively to dump_bpf_map_link and
> dump_bpf_prog_link, to
> > match the name of the variables in the main structure of the light
> > skeleton.
> >
> > Signed-off-by: Roberto Sassu <roberto.sassu@huawei.com>
> > ---
> >  kernel/bpf/preload/bpf_preload_kern.c         |  35 +-
> >  kernel/bpf/preload/iterators/Makefile         |   2 +-
> >  .../bpf/preload/iterators/iterators.lskel.h   | 378 +++++++++---------
> >  .../bpf/bpftool/Documentation/bpftool-gen.rst |   5 +
> >  tools/bpf/bpftool/bash-completion/bpftool     |   2 +-
> >  tools/bpf/bpftool/gen.c                       |  27 ++
> >  tools/bpf/bpftool/main.c                      |   7 +-
> >  tools/bpf/bpftool/main.h                      |   1 +
> >  8 files changed, 254 insertions(+), 203 deletions(-)
> >
> 
> [...]
> 
> > +__attribute__((unused)) static void
> > +iterators_bpf__assert(struct iterators_bpf *s)
> > +{
> > +#ifdef __cplusplus
> > +#define _Static_assert static_assert
> > +#endif
> > +#ifdef __cplusplus
> > +#undef _Static_assert
> > +#endif
> > +}
> > +
> > +static struct bpf_link *dump_bpf_map_link;
> > +static struct bpf_link *dump_bpf_prog_link;
> > +static struct iterators_bpf *skel;
> 
> I don't understand what is this and what for? You are making an
> assumption that light skeleton can be instantiated just once, why? And
> adding extra bpftool option to light skeleton codegen just to save a
> bit of typing at the place where light skeleton is actually
> instantiated and used doesn't seems like a right approach.

True, iterator_bpf is simple. Writing the preloading code
for it is simple. But, what if you wanted to preload an LSM
with 10 hooks or more?

Ok, regarding where the preloading code should be, I will
try to move the generated code to the kernel module instead
of the light skeleton.

Thanks

Roberto

HUAWEI TECHNOLOGIES Duesseldorf GmbH, HRB 56063
Managing Director: Li Peng, Zhong Ronghua

> Further, even if this is the way to go, please split out bpftool
> changes from kernel changes. There is nothing requiring them to be
> coupled together.
> 
> [...]
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
