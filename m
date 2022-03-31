Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 577514EE9D8
	for <lists+linux-stm32@lfdr.de>; Fri,  1 Apr 2022 10:39:34 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0E5E6C5EC76;
	Fri,  1 Apr 2022 08:39:34 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 74FF8C60465
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 31 Mar 2022 02:27:33 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id bx5so22675615pjb.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Mar 2022 19:27:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=brGSPXAAKZq1zv7Rz5aMBtmTUSadoAJBmC11PEMAvD8=;
 b=nlbLJK1J/O6nYUq8evC9fJ339K6x4bHJN538DoapkFJy/VjamB+dwe1Px9feUd1F62
 AuQA+r+MLCydK2yozMl9JBakx4tVgx+dfV8Gdj/+JlJ2s2PcpC4CMNPP5jLvJ+K0I6D/
 58ZJKgDGq1VRIj1iby3BwAtIS+ZYXz1m49h/ISmaUaj8PnLMI0kAPXSIXPcLdRTC0j8J
 U6i3turNOHHTzB3JHSrY9OZO6U8/hg8niDEnBammYq4EML8DPZ5FMpqH75sa8up49yfJ
 k9LF6ybIF0vVv8TCzRBoa6wHQVGrUOF8KESVyx/8Ef7n7ki7hsvStej2Hwrh4SjR6gie
 b89Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=brGSPXAAKZq1zv7Rz5aMBtmTUSadoAJBmC11PEMAvD8=;
 b=a7XgULj9CF4hMxflknAQ1OFWR0SMh8VoThQCDZWoEFRvkAeyqhOuBuN30S6v8l2mYR
 LWqDSaovTsjCP10fPQVWQB4qRl+MgXjeSvL4jXdhXViKrR/m/JFKRa9MD5MuUnIV14W9
 nqrfL9bPG7ZUnr1wtxJRdIXJWRgZRa1tUe/hwOAznxmmn0pI69kxwH2Z85IQzCN7Zm1x
 c1pXbyF58S/xPyMrKe2/FTNMKMDAEr7YjrDaIbJ6MaFSYvRsqWuCeOyaZL4BGCXrQpas
 YojH5NP9x/1yWAUx0VLkwcau/IqwLIFep20wQOGNYuXiYS7BdEh12iH+Ztilrfb+53y6
 uYdA==
X-Gm-Message-State: AOAM5310MepppQyMlFw/5Zn46wZH0BFa86klUWlQQQemy3zFku+uobFZ
 MSfG4dfLHoQyB73P4pJECGg=
X-Google-Smtp-Source: ABdhPJyn/9RKDnn9ebHKMw2O6x7J/GpkAo9yaxB7FFrh7CXFQi1SCyOQyd83zRQ7s2yhmAiT/9wZaA==
X-Received: by 2002:a17:90b:4a48:b0:1c7:bb62:446c with SMTP id
 lb8-20020a17090b4a4800b001c7bb62446cmr3463303pjb.146.1648693651949; 
 Wed, 30 Mar 2022 19:27:31 -0700 (PDT)
Received: from MBP-98dd607d3435.dhcp.thefacebook.com
 ([2620:10d:c090:400::5:756c]) by smtp.gmail.com with ESMTPSA id
 f16-20020a056a00229000b004fabe756ba6sm27342617pfe.54.2022.03.30.19.27.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Mar 2022 19:27:31 -0700 (PDT)
Date: Wed, 30 Mar 2022 19:27:27 -0700
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
To: Roberto Sassu <roberto.sassu@huawei.com>
Message-ID: <20220331022727.ybj4rui4raxmsdpu@MBP-98dd607d3435.dhcp.thefacebook.com>
References: <20220328175033.2437312-1-roberto.sassu@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220328175033.2437312-1-roberto.sassu@huawei.com>
X-Mailman-Approved-At: Fri, 01 Apr 2022 08:39:33 +0000
Cc: ast@kernel.org, linux-kselftest@vger.kernel.org, daniel@iogearbox.net,
 corbet@lwn.net, netdev@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, kpsingh@kernel.org, zohar@linux.ibm.com,
 andrii@kernel.org, linux-security-module@vger.kernel.org,
 viro@zeniv.linux.org.uk, mcoquelin.stm32@gmail.com,
 linux-fsdevel@vger.kernel.org, linux-integrity@vger.kernel.org,
 bpf@vger.kernel.org, shuah@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
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

On Mon, Mar 28, 2022 at 07:50:15PM +0200, Roberto Sassu wrote:
> eBPF already allows programs to be preloaded and kept running without
> intervention from user space. There is a dedicated kernel module called
> bpf_preload, which contains the light skeleton of the iterators_bpf eBPF
> program. If this module is enabled in the kernel configuration, its loading
> will be triggered when the bpf filesystem is mounted (unless the module is
> built-in), and the links of iterators_bpf are pinned in that filesystem
> (they will appear as the progs.debug and maps.debug files).
> 
> However, the current mechanism, if used to preload an LSM, would not offer
> the same security guarantees of LSMs integrated in the security subsystem.
> Also, it is not generic enough to be used for preloading arbitrary eBPF
> programs, unless the bpf_preload code is heavily modified.
> 
> More specifically, the security problems are:
> - any program can be pinned to the bpf filesystem without limitations
>   (unless a MAC mechanism enforces some restrictions);
> - programs being executed can be terminated at any time by deleting the
>   pinned objects or unmounting the bpf filesystem.

So many things to untangle here.

The above paragraphs are misleading and incorrect.
The commit log sounds like there are security issues that this
patch set is fixing.
This is not true.
Looks like there is a massive misunderstanding on what bpffs is.
It's a file system to pin and get bpf objects with normal
file access permissions. Nothing else.
Do NOT use it to pin LSM or any other security sensitive bpf programs
and then complain that root can unpin them.
Yes. Root can and should be able to 'rm -rf' anything in bpffs instance.

> The usability problems are:
> - only a fixed amount of links can be pinned;

where do you see this limit?

> - only links can be pinned, other object types are not supported;

really? progs, maps can be pinned as well.

> - code to pin objects has to be written manually;

huh?

> Solve the security problems by mounting the bpf filesystem from the kernel,
> by preloading authenticated kernel modules (e.g. with module.sig_enforce)
> and by pinning objects to that filesystem. This particular filesystem
> instance guarantees that desired eBPF programs run until the very end of
> the kernel lifecycle, since even root cannot interfere with it.

No.

I suspect there is huge confusion on what these two "progs.debug"
and "maps.debug" files are in a bpffs instance.
They are debug files to pretty pring loaded maps and progs for folks who
like to use 'cat' to examine the state of the system instead of 'bpftool'.
The root can remove these files from bpffs.

There is no reason for kernel module to pin its bpf progs.
If you want to develop DIGLIM as a kernel module that uses light skeleton
just do:
#include <linux/init.h>
#include <linux/module.h>
#include "diglim.lskel.h"

static struct diglim_bpf *skel;

static int __init load(void)
{
        skel = diglim_bpf__open_and_load();
        err = diglim_bpf__attach(skel);
}
/* detach skel in __fini */

It's really that short.

Then you will be able to
- insmod diglim.ko -> will load and attach bpf progs.
- rmmod diglim -> will detach them.

Independantly from these two mistunderstandings of bpffs and light skel
we've been talking about auto exposing loaded bpf progs, maps, links
in a bpffs without incrementing refcnt of them.
When progs get unloaded the files will disappear.
Some folks believe that doing 'ls' in a directory and see one file
for each bpf prog loaded and then doing 'cat' on that file would be
useful for debugging. That idea wasn't rejected. We're still thinking
what would be the best way to auto-expose all bpf objects for debugging
and whether it's actually makes sense to do considering that
bpftool already has commands to list all progs, maps, links, etc
with great detail.
It's pretty much an argument between 'cat+ls' believers and
'bpftool' cmdline believers.
That discussion is orthogonal and should not be mixed with bpffs, lsm,
security or anything else.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
