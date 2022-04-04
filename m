Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 445074F199B
	for <lists+linux-stm32@lfdr.de>; Mon,  4 Apr 2022 19:41:56 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DBB1EC60464;
	Mon,  4 Apr 2022 17:41:55 +0000 (UTC)
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com
 [185.176.79.56])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 47D86C5EC56
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  4 Apr 2022 17:41:55 +0000 (UTC)
Received: from fraeml713-chm.china.huawei.com (unknown [172.18.147.206])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4KXJ2M5Zdkz683S6;
 Tue,  5 Apr 2022 01:40:11 +0800 (CST)
Received: from fraeml714-chm.china.huawei.com (10.206.15.33) by
 fraeml713-chm.china.huawei.com (10.206.15.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Mon, 4 Apr 2022 19:41:53 +0200
Received: from fraeml714-chm.china.huawei.com ([10.206.15.33]) by
 fraeml714-chm.china.huawei.com ([10.206.15.33]) with mapi id 15.01.2375.024;
 Mon, 4 Apr 2022 19:41:53 +0200
From: Roberto Sassu <roberto.sassu@huawei.com>
To: KP Singh <kpsingh@kernel.org>, Alexei Starovoitov
 <alexei.starovoitov@gmail.com>
Thread-Topic: [PATCH 00/18] bpf: Secure and authenticated preloading of eBPF
 programs
Thread-Index: AQHYQsxoL5kXhl8+JE6PJPNWV+NOTqzYppqAgABrSsCAAo7zgIAAEt0AgARYGMA=
Date: Mon, 4 Apr 2022 17:41:53 +0000
Message-ID: <b702f57ee63640d987055438ec77a016@huawei.com>
References: <20220328175033.2437312-1-roberto.sassu@huawei.com>
 <20220331022727.ybj4rui4raxmsdpu@MBP-98dd607d3435.dhcp.thefacebook.com>
 <b9f5995f96da447c851f7c9db8232a9b@huawei.com>
 <20220401235537.mwziwuo4n53m5cxp@MBP-98dd607d3435.dhcp.thefacebook.com>
 <CACYkzJ5QgkucL3HZ4bY5Rcme4ey6U3FW4w2Gz-9rdWq0_RHvgA@mail.gmail.com>
In-Reply-To: <CACYkzJ5QgkucL3HZ4bY5Rcme4ey6U3FW4w2Gz-9rdWq0_RHvgA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.81.208.245]
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
 "daniel@iogearbox.net" <daniel@iogearbox.net>,
 "corbet@lwn.net" <corbet@lwn.net>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "andrii@kernel.org" <andrii@kernel.org>,
 "zohar@linux.ibm.com" <zohar@linux.ibm.com>, "ast@kernel.org" <ast@kernel.org>,
 "linux-security-module@vger.kernel.org"
 <linux-security-module@vger.kernel.org>,
 "viro@zeniv.linux.org.uk" <viro@zeniv.linux.org.uk>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 "linux-integrity@vger.kernel.org" <linux-integrity@vger.kernel.org>,
 "bpf@vger.kernel.org" <bpf@vger.kernel.org>,
 "shuah@kernel.org" <shuah@kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
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

> From: KP Singh [mailto:kpsingh@kernel.org]
> Sent: Saturday, April 2, 2022 3:03 AM
> On Sat, Apr 2, 2022 at 1:55 AM Alexei Starovoitov
> <alexei.starovoitov@gmail.com> wrote:
> >
> > On Thu, Mar 31, 2022 at 08:25:22AM +0000, Roberto Sassu wrote:
> > > > From: Alexei Starovoitov [mailto:alexei.starovoitov@gmail.com]
> > > > Sent: Thursday, March 31, 2022 4:27 AM
> > > > On Mon, Mar 28, 2022 at 07:50:15PM +0200, Roberto Sassu wrote:
> > > > > eBPF already allows programs to be preloaded and kept running
> without
> > > > > intervention from user space. There is a dedicated kernel module
> called
> > > > > bpf_preload, which contains the light skeleton of the iterators_bpf
> eBPF
> > > > > program. If this module is enabled in the kernel configuration, its
> loading
> > > > > will be triggered when the bpf filesystem is mounted (unless the
> module is
> > > > > built-in), and the links of iterators_bpf are pinned in that filesystem
> > > > > (they will appear as the progs.debug and maps.debug files).
> > > > >
> > > > > However, the current mechanism, if used to preload an LSM, would
> not
> > > > offer
> > > > > the same security guarantees of LSMs integrated in the security
> > > > subsystem.
> > > > > Also, it is not generic enough to be used for preloading arbitrary eBPF
> > > > > programs, unless the bpf_preload code is heavily modified.
> > > > >
> > > > > More specifically, the security problems are:
> > > > > - any program can be pinned to the bpf filesystem without limitations
> > > > >   (unless a MAC mechanism enforces some restrictions);
> > > > > - programs being executed can be terminated at any time by deleting
> the
> > > > >   pinned objects or unmounting the bpf filesystem.
> > > >
> > > > So many things to untangle here.
> > >
> > > Hi Alexei
> > >
> > > thanks for taking the time to provide such detailed
> > > explanation.
> > >
> > > > The above paragraphs are misleading and incorrect.
> > > > The commit log sounds like there are security issues that this
> > > > patch set is fixing.
> > > > This is not true.
> 
> +1 these are not security issues. They are limitations of your MAC policy.
> 
> > >
> > > I reiterate the goal: enforce a mandatory policy with
> > > an out-of-tree LSM (a kernel module is fine), with the
> > > same guarantees of LSMs integrated in the security
> > > subsystem.
> >
> > To make it 100% clear:
> > Any in-kernel feature that benefits out-of-tree module will be rejected.
> >
> > > The root user is not part of the TCB (i.e. is untrusted),
> > > all the changes that user wants to make must be subject
> > > of decision by the LSM enforcing the mandatory policy.
> > >
> > > I thought about adding support for LSMs from kernel
> > > modules via a new built-in LSM (called LoadLSM), but
> 
> Kernel modules cannot implement LSMs, this has already been
> proposed on the lists and has been rejected.

Looking at commit cb80ddc67152 ("bpf: Convert bpf_preload.ko
to use light skeleton."), I got that it is the most efficient way
to load an eBPF program (does not even require libbpf).

Another advantage was that we get integrity verification
from the module infrastructure. This would have been the
optimal solution in terms of dependencies. Enforcing
integrity could be turned on with the module.sig_enforce
kernel option.

If we switch to user space, the choice would be IMA.
However, in my use case (DIGLIM) it would be used just
for the purpose of doing integrity verifications pre-init.

Thinking which policy could be implemented for such purpose,
maybe something like appraise every process that is not linked
to an executable? And since there are no xattrs in the initial
ram disk, could I append a module signature to an ELF binary?

Thanks

Roberto

HUAWEI TECHNOLOGIES Duesseldorf GmbH, HRB 56063
Managing Director: Li Peng, Zhong Ronghua

> > Such approach will be rejected. See above.
> >
> > > > I suspect there is huge confusion on what these two "progs.debug"
> > > > and "maps.debug" files are in a bpffs instance.
> > > > They are debug files to pretty pring loaded maps and progs for folks
> who
> > > > like to use 'cat' to examine the state of the system instead of 'bpftool'.
> > > > The root can remove these files from bpffs.
> > > >
> > > > There is no reason for kernel module to pin its bpf progs.
> > > > If you want to develop DIGLIM as a kernel module that uses light
> skeleton
> > > > just do:
> > > > #include <linux/init.h>
> > > > #include <linux/module.h>
> > > > #include "diglim.lskel.h"
> > > >
> > > > static struct diglim_bpf *skel;
> > > >
> > > > static int __init load(void)
> > > > {
> > > >         skel = diglim_bpf__open_and_load();
> > > >         err = diglim_bpf__attach(skel);
> > > > }
> > > > /* detach skel in __fini */
> > > >
> > > > It's really that short.
> > > >
> > > > Then you will be able to
> > > > - insmod diglim.ko -> will load and attach bpf progs.
> > > > - rmmod diglim -> will detach them.
> > >
> > > root can stop the LSM without consulting the security
> > > policy. The goal of having root untrusted is not achieved.
> 
> Ofcourse, this is an issue, if you are using BPF to define a MAC
> policy, the policy
> needs to be comprehensive to prevent itself from being overridden. This is
> why
> We have so many LSM hooks. If you think some are missing, let's add them.
> 
> This is why implementing a policy is not trivial, but we need to allow
> users to build
> such policies with the help from the kernel and not by using
> out-of-tree modules.
> 
> I do think we can add some more helpers (e.g. for modifying xattrs
> from BPF) that
> would help us build complex policies.
> 
> >
> > Out-of-tree module can do any hack.
> > For example:
> > 1. don't do detach skel in __fini
> >   rmmod will remove the module, but bpf progs will keep running.
> > 2. do module_get(THIS_MODULE) in __init
> >   rmmod will return EBUSY
> >   and have some out-of-band way of dropping mod refcnt.
> > 3. hack into sys_delete_module. if module_name==diglem return EBUSY.
> > 4. add proper LSM hook to delete_module
> 
> +1 I recommend this (but not from an out of tree module)
> 
> >
> > > My point was that pinning progs seems to be the
> > > recommended way of keeping them running.
> >
> > Not quite. bpf_link refcnt is what keeps progs attached.
> > bpffs is mainly used for:
> > - to pass maps/links from one process to another
> > when passing fd is not possible.
> > - to solve the case of crashing user space.
> > The user space agent will restart and will pick up where
> > it's left by reading map, link, prog FDs from bpffs.
> > - pinning bpf iterators that are later used to 'cat' such files.
> > That is what bpf_preload is doing by creating two debug
> > files "maps.debug" and "progs.debug".
> >
> > > Pinning
> > > them to unreachable inodes intuitively looked the
> > > way to go for achieving the stated goal.
> >
> > We can consider inodes in bpffs that are not unlinkable by root
> > in the future, but certainly not for this use case.
> 
> Can this not be already done by adding a BPF_LSM program to the
> inode_unlink LSM hook?
> 
> >
> > > Or maybe I
> > > should just increment the reference count of links
> > > and don't decrement during an rmmod?
> >
> > I suggest to abandon out-of-tree goal.
> > Only then we can help and continue this discussion.
> 
> +1
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
