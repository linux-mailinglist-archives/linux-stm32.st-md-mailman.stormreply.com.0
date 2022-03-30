Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 96FA94EBBA1
	for <lists+linux-stm32@lfdr.de>; Wed, 30 Mar 2022 09:21:07 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3B7EDC628A2;
	Wed, 30 Mar 2022 07:21:07 +0000 (UTC)
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com
 [185.176.79.56])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5ACA9C628A0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Mar 2022 07:21:05 +0000 (UTC)
Received: from fraeml710-chm.china.huawei.com (unknown [172.18.147.200])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4KSyV73jh2z67ZHP;
 Wed, 30 Mar 2022 15:19:11 +0800 (CST)
Received: from fraeml714-chm.china.huawei.com (10.206.15.33) by
 fraeml710-chm.china.huawei.com (10.206.15.59) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 30 Mar 2022 09:21:03 +0200
Received: from fraeml714-chm.china.huawei.com ([10.206.15.33]) by
 fraeml714-chm.china.huawei.com ([10.206.15.33]) with mapi id 15.01.2375.024;
 Wed, 30 Mar 2022 09:21:03 +0200
From: Roberto Sassu <roberto.sassu@huawei.com>
To: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Thread-Topic: [PATCH 00/18] bpf: Secure and authenticated preloading of eBPF
 programs
Thread-Index: AQHYQsxoL5kXhl8+JE6PJPNWV+NOTqzW6KkAgACTnqA=
Date: Wed, 30 Mar 2022 07:21:03 +0000
Message-ID: <7574e95fb2304db7b8d64be5d2553b20@huawei.com>
References: <20220328175033.2437312-1-roberto.sassu@huawei.com>
 <CAEf4BzZNs-DYzQcE5LPxNzXDa+9A7QFszw99fnd2=cq9SuWsLg@mail.gmail.com>
In-Reply-To: <CAEf4BzZNs-DYzQcE5LPxNzXDa+9A7QFszw99fnd2=cq9SuWsLg@mail.gmail.com>
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
Subject: Re: [Linux-stm32] [PATCH 00/18] bpf: Secure and authenticated
 preloading of eBPF programs
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
> Sent: Wednesday, March 30, 2022 1:51 AM
> On Mon, Mar 28, 2022 at 10:51 AM Roberto Sassu
> <roberto.sassu@huawei.com> wrote:

[...]

> > Patches 1-2 export some definitions, to build out-of-tree kernel modules
> > with eBPF programs to preload. Patches 3-4 allow eBPF programs to pin
> > objects by themselves. Patches 5-10 automatically generate the methods
> for
> > preloading in the light skeleton. Patches 11-14 make it possible to preload
> > multiple eBPF programs. Patch 15 automatically generates the kernel
> module
> > for preloading an eBPF program, patch 16 does a kernel mount of the bpf
> > filesystem, and finally patches 17-18 test the functionality introduced.
> >
> 
> This approach of moving tons of pretty generic code into codegen of
> lskel seems suboptimal. Why so much code has to be codegenerated?
> Especially that tiny module code?

Hi Andrii

the main goal of this patch set is to use the preloading
mechanism to plug in securely LSMs implemented as eBPF
programs.

I have a use case, I want to plug in my eBPF program,
DIGLIM eBPF.

I started to modify the preloading code manually, and
I realized how complicated the process is if you want
to add something more than the existing iterators_bpf
program.

First, you have to look at which objects you want to
preload, then write code for each of them. This process
is repetitive and deterministic, this is why I immediately
thought that it is a good case for automatic code
generation.

My idea is that, if this mechanism is accepted, an
implementer of an LSM wishing to be preloaded at
the very beginning, only has to write his eBPF code,
the kernel and bpftool take care of the rest.
Generation of the preloading code is optional, and
need to be enabled with the -P option, in addition to -L.

The light skeleton of DIGLIM eBPF looks like:

https://github.com/robertosassu/linux/blob/bpf-preload-v1/kernel/bpf/preload/diglim/diglim.lskel.h

The preloading interface is very similar to the one used
by the security subsystem: an ordered list of eBPF
programs to preload set in the kernel configuration,
that can be overwritten with the kernel option
bpf_preload_list=.

The changes that would be required to preload DIGLIM
eBPF look like:

https://github.com/robertosassu/linux/commit/c07e1a78584ee688aeb812f07dc7ab3060ac6152

Thanks

Roberto

HUAWEI TECHNOLOGIES Duesseldorf GmbH, HRB 56063
Managing Director: Li Peng, Zhong Ronghua
 
> Can you please elaborate on why it can't be done in a way that doesn't
> require such extensive light skeleton codegen changes?
> 
> 
> > Roberto Sassu (18):
> >   bpf: Export bpf_link_inc()
> >   bpf-preload: Move bpf_preload.h to include/linux
> >   bpf-preload: Generalize object pinning from the kernel
> >   bpf-preload: Export and call bpf_obj_do_pin_kernel()
> >   bpf-preload: Generate static variables
> >   bpf-preload: Generate free_objs_and_skel()
> >   bpf-preload: Generate preload()
> >   bpf-preload: Generate load_skel()
> >   bpf-preload: Generate code to pin non-internal maps
> >   bpf-preload: Generate bpf_preload_ops
> >   bpf-preload: Store multiple bpf_preload_ops structures in a linked
> >     list
> >   bpf-preload: Implement new registration method for preloading eBPF
> >     programs
> >   bpf-preload: Move pinned links and maps to a dedicated directory in
> >     bpffs
> >   bpf-preload: Switch to new preload registration method
> >   bpf-preload: Generate code of kernel module to preload
> >   bpf-preload: Do kernel mount to ensure that pinned objects don't
> >     disappear
> >   bpf-preload/selftests: Add test for automatic generation of preload
> >     methods
> >   bpf-preload/selftests: Preload a test eBPF program and check pinned
> >     objects
> 
> please use proper prefixes: bpf (for kernel-side changes), libbpf,
> bpftool, selftests/bpf, etc
> 
> 
> >
> >  .../admin-guide/kernel-parameters.txt         |   8 +
> >  fs/namespace.c                                |   1 +
> >  include/linux/bpf.h                           |   5 +
> >  include/linux/bpf_preload.h                   |  37 ++
> >  init/main.c                                   |   2 +
> >  kernel/bpf/inode.c                            | 295 +++++++++--
> >  kernel/bpf/preload/Kconfig                    |  25 +-
> >  kernel/bpf/preload/bpf_preload.h              |  16 -
> >  kernel/bpf/preload/bpf_preload_kern.c         |  85 +---
> >  kernel/bpf/preload/iterators/Makefile         |   9 +-
> >  .../bpf/preload/iterators/iterators.lskel.h   | 466 +++++++++++-------
> >  kernel/bpf/syscall.c                          |   1 +
> >  .../bpf/bpftool/Documentation/bpftool-gen.rst |  13 +
> >  tools/bpf/bpftool/bash-completion/bpftool     |   6 +-
> >  tools/bpf/bpftool/gen.c                       | 331 +++++++++++++
> >  tools/bpf/bpftool/main.c                      |   7 +-
> >  tools/bpf/bpftool/main.h                      |   1 +
> >  tools/testing/selftests/bpf/Makefile          |  32 +-
> >  .../bpf/bpf_testmod_preload/.gitignore        |   7 +
> >  .../bpf/bpf_testmod_preload/Makefile          |  20 +
> >  .../gen_preload_methods.expected.diff         |  97 ++++
> >  .../bpf/prog_tests/test_gen_preload_methods.c |  27 +
> >  .../bpf/prog_tests/test_preload_methods.c     |  69 +++
> >  .../selftests/bpf/progs/gen_preload_methods.c |  23 +
> >  24 files changed, 1246 insertions(+), 337 deletions(-)
> >  create mode 100644 include/linux/bpf_preload.h
> >  delete mode 100644 kernel/bpf/preload/bpf_preload.h
> >  create mode 100644
> tools/testing/selftests/bpf/bpf_testmod_preload/.gitignore
> >  create mode 100644
> tools/testing/selftests/bpf/bpf_testmod_preload/Makefile
> >  create mode 100644
> tools/testing/selftests/bpf/prog_tests/gen_preload_methods.expected.diff
> >  create mode 100644
> tools/testing/selftests/bpf/prog_tests/test_gen_preload_methods.c
> >  create mode 100644
> tools/testing/selftests/bpf/prog_tests/test_preload_methods.c
> >  create mode 100644
> tools/testing/selftests/bpf/progs/gen_preload_methods.c
> >
> > --
> > 2.32.0
> >
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
