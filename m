Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B99924F111D
	for <lists+linux-stm32@lfdr.de>; Mon,  4 Apr 2022 10:43:13 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5CA8CC6047D;
	Mon,  4 Apr 2022 08:43:13 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ADC30C5EC56
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  2 Apr 2022 01:03:22 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 76F6561BA0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  2 Apr 2022 01:03:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D85B7C3410F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  2 Apr 2022 01:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648861400;
 bh=IbghA2dqiYhWXecxL6uJJ7n1Ce58U1f1jXhOOf0w2DA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=vAIzBnKXBjkeXqgXBaPgMiPUaPgf+f2Wc94lViHqPJcUATx47nFskhlEoPxVHs4W7
 i5tCbG/1HfR/mVZmfbTztKsYeyHJcVhOzj03u0WMQD5ZBUShfBTc0sPu3teA/HUx/O
 Y7peNfbAJTHHt+UWuoC4cTvqS7pkM6l85HvvYcAQ52a4pP2zBP6DTEiFiQw5hFWY9E
 y8U0hW/E6MK0UR6QclYT20cszQaSNE4rmH6ve9AGmykefODtvNc4MZUk3C6DOh5t68
 TLzAFGTlLGmRI6txiRwltPP6bWvpQ/TV4oAg8pLq6kUaD+e0f0FEOVg1FlsTOgTQLX
 zsf4ODyR5GG1A==
Received: by mail-ej1-f45.google.com with SMTP id lr4so9118321ejb.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 01 Apr 2022 18:03:20 -0700 (PDT)
X-Gm-Message-State: AOAM533tAeaCwzX3Fzcq5BL3a2eBlV0j18aHDker4DeTxICwuLD+mdxf
 bueEYCnZUBDRGK02agne70Qtk9merYnohh2eZwuuxw==
X-Google-Smtp-Source: ABdhPJzC1xfADMf8KlFXGnU+O10yqjuLNdQMD6B8hDbX9K5RYwHPXDVlmYgGwvXzZmJ1+ZDG91LG6SDOelwAvnQH2J4=
X-Received: by 2002:a17:907:3f9e:b0:6da:842e:873e with SMTP id
 hr30-20020a1709073f9e00b006da842e873emr2038636ejc.383.1648861399066; Fri, 01
 Apr 2022 18:03:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220328175033.2437312-1-roberto.sassu@huawei.com>
 <20220331022727.ybj4rui4raxmsdpu@MBP-98dd607d3435.dhcp.thefacebook.com>
 <b9f5995f96da447c851f7c9db8232a9b@huawei.com>
 <20220401235537.mwziwuo4n53m5cxp@MBP-98dd607d3435.dhcp.thefacebook.com>
In-Reply-To: <20220401235537.mwziwuo4n53m5cxp@MBP-98dd607d3435.dhcp.thefacebook.com>
From: KP Singh <kpsingh@kernel.org>
Date: Sat, 2 Apr 2022 03:03:08 +0200
X-Gmail-Original-Message-ID: <CACYkzJ5QgkucL3HZ4bY5Rcme4ey6U3FW4w2Gz-9rdWq0_RHvgA@mail.gmail.com>
Message-ID: <CACYkzJ5QgkucL3HZ4bY5Rcme4ey6U3FW4w2Gz-9rdWq0_RHvgA@mail.gmail.com>
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
X-Mailman-Approved-At: Mon, 04 Apr 2022 08:43:12 +0000
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
 "daniel@iogearbox.net" <daniel@iogearbox.net>,
 "corbet@lwn.net" <corbet@lwn.net>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 Roberto Sassu <roberto.sassu@huawei.com>,
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

On Sat, Apr 2, 2022 at 1:55 AM Alexei Starovoitov
<alexei.starovoitov@gmail.com> wrote:
>
> On Thu, Mar 31, 2022 at 08:25:22AM +0000, Roberto Sassu wrote:
> > > From: Alexei Starovoitov [mailto:alexei.starovoitov@gmail.com]
> > > Sent: Thursday, March 31, 2022 4:27 AM
> > > On Mon, Mar 28, 2022 at 07:50:15PM +0200, Roberto Sassu wrote:
> > > > eBPF already allows programs to be preloaded and kept running without
> > > > intervention from user space. There is a dedicated kernel module called
> > > > bpf_preload, which contains the light skeleton of the iterators_bpf eBPF
> > > > program. If this module is enabled in the kernel configuration, its loading
> > > > will be triggered when the bpf filesystem is mounted (unless the module is
> > > > built-in), and the links of iterators_bpf are pinned in that filesystem
> > > > (they will appear as the progs.debug and maps.debug files).
> > > >
> > > > However, the current mechanism, if used to preload an LSM, would not
> > > offer
> > > > the same security guarantees of LSMs integrated in the security
> > > subsystem.
> > > > Also, it is not generic enough to be used for preloading arbitrary eBPF
> > > > programs, unless the bpf_preload code is heavily modified.
> > > >
> > > > More specifically, the security problems are:
> > > > - any program can be pinned to the bpf filesystem without limitations
> > > >   (unless a MAC mechanism enforces some restrictions);
> > > > - programs being executed can be terminated at any time by deleting the
> > > >   pinned objects or unmounting the bpf filesystem.
> > >
> > > So many things to untangle here.
> >
> > Hi Alexei
> >
> > thanks for taking the time to provide such detailed
> > explanation.
> >
> > > The above paragraphs are misleading and incorrect.
> > > The commit log sounds like there are security issues that this
> > > patch set is fixing.
> > > This is not true.

+1 these are not security issues. They are limitations of your MAC policy.

> >
> > I reiterate the goal: enforce a mandatory policy with
> > an out-of-tree LSM (a kernel module is fine), with the
> > same guarantees of LSMs integrated in the security
> > subsystem.
>
> To make it 100% clear:
> Any in-kernel feature that benefits out-of-tree module will be rejected.
>
> > The root user is not part of the TCB (i.e. is untrusted),
> > all the changes that user wants to make must be subject
> > of decision by the LSM enforcing the mandatory policy.
> >
> > I thought about adding support for LSMs from kernel
> > modules via a new built-in LSM (called LoadLSM), but

Kernel modules cannot implement LSMs, this has already been
proposed on the lists and has been rejected.

>
> Such approach will be rejected. See above.
>
> > > I suspect there is huge confusion on what these two "progs.debug"
> > > and "maps.debug" files are in a bpffs instance.
> > > They are debug files to pretty pring loaded maps and progs for folks who
> > > like to use 'cat' to examine the state of the system instead of 'bpftool'.
> > > The root can remove these files from bpffs.
> > >
> > > There is no reason for kernel module to pin its bpf progs.
> > > If you want to develop DIGLIM as a kernel module that uses light skeleton
> > > just do:
> > > #include <linux/init.h>
> > > #include <linux/module.h>
> > > #include "diglim.lskel.h"
> > >
> > > static struct diglim_bpf *skel;
> > >
> > > static int __init load(void)
> > > {
> > >         skel = diglim_bpf__open_and_load();
> > >         err = diglim_bpf__attach(skel);
> > > }
> > > /* detach skel in __fini */
> > >
> > > It's really that short.
> > >
> > > Then you will be able to
> > > - insmod diglim.ko -> will load and attach bpf progs.
> > > - rmmod diglim -> will detach them.
> >
> > root can stop the LSM without consulting the security
> > policy. The goal of having root untrusted is not achieved.

Ofcourse, this is an issue, if you are using BPF to define a MAC
policy, the policy
needs to be comprehensive to prevent itself from being overridden. This is why
We have so many LSM hooks. If you think some are missing, let's add them.

This is why implementing a policy is not trivial, but we need to allow
users to build
such policies with the help from the kernel and not by using
out-of-tree modules.

I do think we can add some more helpers (e.g. for modifying xattrs
from BPF) that
would help us build complex policies.

>
> Out-of-tree module can do any hack.
> For example:
> 1. don't do detach skel in __fini
>   rmmod will remove the module, but bpf progs will keep running.
> 2. do module_get(THIS_MODULE) in __init
>   rmmod will return EBUSY
>   and have some out-of-band way of dropping mod refcnt.
> 3. hack into sys_delete_module. if module_name==diglem return EBUSY.
> 4. add proper LSM hook to delete_module

+1 I recommend this (but not from an out of tree module)

>
> > My point was that pinning progs seems to be the
> > recommended way of keeping them running.
>
> Not quite. bpf_link refcnt is what keeps progs attached.
> bpffs is mainly used for:
> - to pass maps/links from one process to another
> when passing fd is not possible.
> - to solve the case of crashing user space.
> The user space agent will restart and will pick up where
> it's left by reading map, link, prog FDs from bpffs.
> - pinning bpf iterators that are later used to 'cat' such files.
> That is what bpf_preload is doing by creating two debug
> files "maps.debug" and "progs.debug".
>
> > Pinning
> > them to unreachable inodes intuitively looked the
> > way to go for achieving the stated goal.
>
> We can consider inodes in bpffs that are not unlinkable by root
> in the future, but certainly not for this use case.

Can this not be already done by adding a BPF_LSM program to the
inode_unlink LSM hook?

>
> > Or maybe I
> > should just increment the reference count of links
> > and don't decrement during an rmmod?
>
> I suggest to abandon out-of-tree goal.
> Only then we can help and continue this discussion.

+1
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
