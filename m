Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 249714F206D
	for <lists+linux-stm32@lfdr.de>; Tue,  5 Apr 2022 02:00:42 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C9BE0C6047C;
	Tue,  5 Apr 2022 00:00:41 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7ABECC01577
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  5 Apr 2022 00:00:39 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3501A6177B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  5 Apr 2022 00:00:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11B42C34116
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  5 Apr 2022 00:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649116837;
 bh=zFyw1VrfGv7NEuMWOTezqzL8GubbV0WO1PDpwo/w7kk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=IzT8pKglPQrYQePYYNDTTvWosEy8MxZkq3wR0piD8u7iSz63ghJ7anCpsXVy8rPww
 h8sb6BeBAosTUPJfJSBf5tC/Uc9Zc7IhUFp3EN+3Y4bey3Juna89uPMBgdz3W6AXN8
 KvMFgfyNzawLqWgHmU50yAJKNxBLRXw3d+NWJeiFYcgugGX/GADSzk/5G8g9++kPxr
 OpF27iOsOSCNOr0NIjmDYXJCtgmcKH1aCT/Qss+bZqX0jw6YqWJZnXdaS1BIF6FzjI
 YW3kHL8sWBe0nwkHW+VswjM/Okte+nrlOhP3czPdm/y4SX3zE8ViE7mZZZHIzCb+Y/
 aCTsH/tzvnYAg==
Received: by mail-ed1-f41.google.com with SMTP id b15so12999100edn.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 04 Apr 2022 17:00:36 -0700 (PDT)
X-Gm-Message-State: AOAM532dSZnEyuR78NqnrwbyWOIuGnf09+tiA3245VWuKzuRK7AzIeQB
 v8ytleA+Ptm9lbjXOAyfah7iCOYkcqV9hR7lCMNdHQ==
X-Google-Smtp-Source: ABdhPJx00CBmV+NQNnGWVZ6pCbTPeYWoi7t9WNITl4M8WQe+QSjOqLEi5/uSRAkUXHVhCjpjoCKilOkyYU4kDA3K4zE=
X-Received: by 2002:aa7:c157:0:b0:418:f8e3:4c87 with SMTP id
 r23-20020aa7c157000000b00418f8e34c87mr671966edp.271.1649116835186; Mon, 04
 Apr 2022 17:00:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220328175033.2437312-1-roberto.sassu@huawei.com>
 <20220331022727.ybj4rui4raxmsdpu@MBP-98dd607d3435.dhcp.thefacebook.com>
 <b9f5995f96da447c851f7c9db8232a9b@huawei.com>
 <20220401235537.mwziwuo4n53m5cxp@MBP-98dd607d3435.dhcp.thefacebook.com>
 <CACYkzJ5QgkucL3HZ4bY5Rcme4ey6U3FW4w2Gz-9rdWq0_RHvgA@mail.gmail.com>
 <CAEiveUcx1KHoJ421Cv+52t=0U+Uy2VF51VC_zfTSftQ4wVYOPw@mail.gmail.com>
 <c2e57f10b62940eba3cfcae996e20e3c@huawei.com>
 <CAADnVQJSso+GSXC-QmNmj0GBPZzxRCRfqAcQbqD-6y0CtMSopQ@mail.gmail.com>
In-Reply-To: <CAADnVQJSso+GSXC-QmNmj0GBPZzxRCRfqAcQbqD-6y0CtMSopQ@mail.gmail.com>
From: KP Singh <kpsingh@kernel.org>
Date: Tue, 5 Apr 2022 02:00:24 +0200
X-Gmail-Original-Message-ID: <CACYkzJ7ZVbL2MG7ugmDEfogSPAHkYYMCHxRO_eBCJJmBZyn6Rw@mail.gmail.com>
Message-ID: <CACYkzJ7ZVbL2MG7ugmDEfogSPAHkYYMCHxRO_eBCJJmBZyn6Rw@mail.gmail.com>
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
 "daniel@iogearbox.net" <daniel@iogearbox.net>,
 "corbet@lwn.net" <corbet@lwn.net>, "shuah@kernel.org" <shuah@kernel.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 Roberto Sassu <roberto.sassu@huawei.com>, "ast@kernel.org" <ast@kernel.org>,
 "zohar@linux.ibm.com" <zohar@linux.ibm.com>,
 "andrii@kernel.org" <andrii@kernel.org>,
 "linux-security-module@vger.kernel.org"
 <linux-security-module@vger.kernel.org>,
 "viro@zeniv.linux.org.uk" <viro@zeniv.linux.org.uk>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 "linux-integrity@vger.kernel.org" <linux-integrity@vger.kernel.org>,
 "bpf@vger.kernel.org" <bpf@vger.kernel.org>, Djalal Harouni <tixxdz@gmail.com>,
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

On Tue, Apr 5, 2022 at 12:49 AM Alexei Starovoitov
<alexei.starovoitov@gmail.com> wrote:
>
> On Mon, Apr 4, 2022 at 10:21 AM Roberto Sassu <roberto.sassu@huawei.com> wrote:
> >
> > > From: Djalal Harouni [mailto:tixxdz@gmail.com]
> > > Sent: Monday, April 4, 2022 9:45 AM
> > > On Sun, Apr 3, 2022 at 5:42 PM KP Singh <kpsingh@kernel.org> wrote:
> > > >
> > > > On Sat, Apr 2, 2022 at 1:55 AM Alexei Starovoitov
> > > > <alexei.starovoitov@gmail.com> wrote:
> > > ...
> > > > >
> > > > > > Pinning
> > > > > > them to unreachable inodes intuitively looked the
> > > > > > way to go for achieving the stated goal.
> > > > >
> > > > > We can consider inodes in bpffs that are not unlinkable by root
> > > > > in the future, but certainly not for this use case.
> > > >
> > > > Can this not be already done by adding a BPF_LSM program to the
> > > > inode_unlink LSM hook?
> > > >
> > >
> > > Also, beside of the inode_unlink... and out of curiosity: making sysfs/bpffs/
> > > readonly after pinning, then using bpf LSM hooks
> > > sb_mount|remount|unmount...
> > > family combining bpf() LSM hook... isn't this enough to:
> > > 1. Restrict who can pin to bpffs without using a full MAC
> > > 2. Restrict who can delete or unmount bpf filesystem
> > >

I like this approach better, you will have to restrict the BPF, if you
want to implement MAC policy using BPF.

Can you please try implementing something using these hooks?

> > > ?
> >
> > I'm thinking to implement something like this.
> >
> > First, I add a new program flag called
> > BPF_F_STOP_ONCONFIRM, which causes the ref count
> > of the link to increase twice at creation time. In this way,
> > user space cannot make the link disappear, unless a
> > confirmation is explicitly sent via the bpf() system call.

I don't like this approach, this just sounds like an intentional
dangling reference, prone to refcounting errors and it does not
really solve the purpose you want to achieve.

And you will still need a policy around the BPF syscall,
so why not just use the LSM hooks as suggested above?

> >
> > Another advantage is that other LSMs can decide
> > whether or not they allow a program with this flag
> > (in the bpf security hook).
> >
> > This would work regardless of the method used to
> > load the eBPF program (user space or kernel space).
> >
> > Second, I extend the bpf() system call with a new
> > subcommand, BPF_LINK_CONFIRM_STOP, which
> > decreases the ref count for the link of the programs
> > with the BPF_F_STOP_ONCONFIRM flag. I will also
> > introduce a new security hook (something like
> > security_link_confirm_stop), so that an LSM has the
> > opportunity to deny the stop (the bpf security hook
> > would not be sufficient to determine exactly for
> > which link the confirmation is given, an LSM should
> > be able to deny the stop for its own programs).
> >
> > What do you think?
>
> Hack upon a hack? Makes no sense.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
