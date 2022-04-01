Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F11C64EFD46
	for <lists+linux-stm32@lfdr.de>; Sat,  2 Apr 2022 01:55:45 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AE093C5EC6C;
	Fri,  1 Apr 2022 23:55:45 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1E774C06F81
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  1 Apr 2022 23:55:44 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id bo5so4010693pfb.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 01 Apr 2022 16:55:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ITDDF7wJMqoC4D+CMFddkLEBVT+cz8yxZasDs7bEqHU=;
 b=lKGmW1uWP9QHlp4AUB8qvKmffBMuUV67+V/VNWVRF6rOOYUbY+74bGyNvz0/RaZGm0
 /6a1CNZPKF9XX8ufK2skUi/JsjqwRe6QpfBWIMc4Hugbu/pi7xgtDj+QZhrsm47b6P7e
 MOqTKbiXouVj0rKUrNmMDVRTSskLt1rtHCZgGPxPtO+6WMOtlhB0VeWkxpTII8BpF4Ar
 ZZYmaNBpe+zxwun2L8jgoYeVVLVEgsbprrzeDw5z0zV8K8N7UqRI1RkpiMq9kECPUC5M
 X+EyGGzgnmy6ExUyqWapnwBhOaROd4ahOlRCHdELR9gEp0stA9O6L/EGZyJY8XyOLX00
 1z1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ITDDF7wJMqoC4D+CMFddkLEBVT+cz8yxZasDs7bEqHU=;
 b=UNZzlePqHf4UkpLWXbBkAdlagMyE3cDpvLjwJNtyGsBvUKhbDsIRkAY/wZlVszfwRH
 KwEwfMD8SYn0X8keHm+WiC0T2g87eK375MsgCNhfUK67G88B2T6Ej/960bkiJPQbZeFd
 KnUoR627O/74TCUEVaux9Q1bSMQKfjdP7XKBsDakF9fzGHOff9nMuwpk2PoLr7d74xPr
 4KjfXPpzgYnLY16xRXvVhmeMbMpypwxJGPdYkgr6lmHyNKWaQUDhYOoSc8LyNWcIuTZw
 FTJimyM2wztEVg8QGTVHtOoePLPC9Mc/4vPEOA+vQMMX4edyOTrpcd0moifEmWT8gJ5b
 3q8w==
X-Gm-Message-State: AOAM530WEld6OOCWqexrRCTGYf588YK9VgJ38HPoAipjl7ehoXhAE3U1
 yD4Iper8hVrqR5XyqpREgf8=
X-Google-Smtp-Source: ABdhPJw5mHEx3OXRCJwg5BH/o7y2KBgiA/EPycjlEwRTxtui+XCnm3ENGoJTUYt+IJX/yfQbKijNJA==
X-Received: by 2002:a62:84d3:0:b0:4fa:72e2:1c64 with SMTP id
 k202-20020a6284d3000000b004fa72e21c64mr47407413pfd.29.1648857342449; 
 Fri, 01 Apr 2022 16:55:42 -0700 (PDT)
Received: from MBP-98dd607d3435.dhcp.thefacebook.com
 ([2620:10d:c090:400::5:fb6e]) by smtp.gmail.com with ESMTPSA id
 j7-20020a056a00130700b004b9f7cd94a4sm4230615pfu.56.2022.04.01.16.55.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Apr 2022 16:55:41 -0700 (PDT)
Date: Fri, 1 Apr 2022 16:55:37 -0700
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
To: Roberto Sassu <roberto.sassu@huawei.com>
Message-ID: <20220401235537.mwziwuo4n53m5cxp@MBP-98dd607d3435.dhcp.thefacebook.com>
References: <20220328175033.2437312-1-roberto.sassu@huawei.com>
 <20220331022727.ybj4rui4raxmsdpu@MBP-98dd607d3435.dhcp.thefacebook.com>
 <b9f5995f96da447c851f7c9db8232a9b@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b9f5995f96da447c851f7c9db8232a9b@huawei.com>
Cc: "ast@kernel.org" <ast@kernel.org>,
 "linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
 "daniel@iogearbox.net" <daniel@iogearbox.net>,
 "corbet@lwn.net" <corbet@lwn.net>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "kpsingh@kernel.org" <kpsingh@kernel.org>,
 "zohar@linux.ibm.com" <zohar@linux.ibm.com>,
 "andrii@kernel.org" <andrii@kernel.org>,
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

On Thu, Mar 31, 2022 at 08:25:22AM +0000, Roberto Sassu wrote:
> > From: Alexei Starovoitov [mailto:alexei.starovoitov@gmail.com]
> > Sent: Thursday, March 31, 2022 4:27 AM
> > On Mon, Mar 28, 2022 at 07:50:15PM +0200, Roberto Sassu wrote:
> > > eBPF already allows programs to be preloaded and kept running without
> > > intervention from user space. There is a dedicated kernel module called
> > > bpf_preload, which contains the light skeleton of the iterators_bpf eBPF
> > > program. If this module is enabled in the kernel configuration, its loading
> > > will be triggered when the bpf filesystem is mounted (unless the module is
> > > built-in), and the links of iterators_bpf are pinned in that filesystem
> > > (they will appear as the progs.debug and maps.debug files).
> > >
> > > However, the current mechanism, if used to preload an LSM, would not
> > offer
> > > the same security guarantees of LSMs integrated in the security
> > subsystem.
> > > Also, it is not generic enough to be used for preloading arbitrary eBPF
> > > programs, unless the bpf_preload code is heavily modified.
> > >
> > > More specifically, the security problems are:
> > > - any program can be pinned to the bpf filesystem without limitations
> > >   (unless a MAC mechanism enforces some restrictions);
> > > - programs being executed can be terminated at any time by deleting the
> > >   pinned objects or unmounting the bpf filesystem.
> > 
> > So many things to untangle here.
> 
> Hi Alexei
> 
> thanks for taking the time to provide such detailed
> explanation.
> 
> > The above paragraphs are misleading and incorrect.
> > The commit log sounds like there are security issues that this
> > patch set is fixing.
> > This is not true.
> 
> I reiterate the goal: enforce a mandatory policy with
> an out-of-tree LSM (a kernel module is fine), with the
> same guarantees of LSMs integrated in the security
> subsystem.

To make it 100% clear:
Any in-kernel feature that benefits out-of-tree module will be rejected.

> The root user is not part of the TCB (i.e. is untrusted),
> all the changes that user wants to make must be subject
> of decision by the LSM enforcing the mandatory policy.
> 
> I thought about adding support for LSMs from kernel
> modules via a new built-in LSM (called LoadLSM), but

Such approach will be rejected. See above.

> > I suspect there is huge confusion on what these two "progs.debug"
> > and "maps.debug" files are in a bpffs instance.
> > They are debug files to pretty pring loaded maps and progs for folks who
> > like to use 'cat' to examine the state of the system instead of 'bpftool'.
> > The root can remove these files from bpffs.
> > 
> > There is no reason for kernel module to pin its bpf progs.
> > If you want to develop DIGLIM as a kernel module that uses light skeleton
> > just do:
> > #include <linux/init.h>
> > #include <linux/module.h>
> > #include "diglim.lskel.h"
> > 
> > static struct diglim_bpf *skel;
> > 
> > static int __init load(void)
> > {
> >         skel = diglim_bpf__open_and_load();
> >         err = diglim_bpf__attach(skel);
> > }
> > /* detach skel in __fini */
> > 
> > It's really that short.
> > 
> > Then you will be able to
> > - insmod diglim.ko -> will load and attach bpf progs.
> > - rmmod diglim -> will detach them.
> 
> root can stop the LSM without consulting the security
> policy. The goal of having root untrusted is not achieved.

Out-of-tree module can do any hack.
For example:
1. don't do detach skel in __fini
  rmmod will remove the module, but bpf progs will keep running.
2. do module_get(THIS_MODULE) in __init
  rmmod will return EBUSY
  and have some out-of-band way of dropping mod refcnt.
3. hack into sys_delete_module. if module_name==diglem return EBUSY.
4. add proper LSM hook to delete_module

> My point was that pinning progs seems to be the
> recommended way of keeping them running. 

Not quite. bpf_link refcnt is what keeps progs attached.
bpffs is mainly used for:
- to pass maps/links from one process to another
when passing fd is not possible.
- to solve the case of crashing user space.
The user space agent will restart and will pick up where
it's left by reading map, link, prog FDs from bpffs.
- pinning bpf iterators that are later used to 'cat' such files.
That is what bpf_preload is doing by creating two debug
files "maps.debug" and "progs.debug".

> Pinning
> them to unreachable inodes intuitively looked the
> way to go for achieving the stated goal. 

We can consider inodes in bpffs that are not unlinkable by root
in the future, but certainly not for this use case.

> Or maybe I
> should just increment the reference count of links
> and don't decrement during an rmmod?

I suggest to abandon out-of-tree goal.
Only then we can help and continue this discussion.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
