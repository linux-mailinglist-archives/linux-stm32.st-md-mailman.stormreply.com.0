Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DF4684F3CA4
	for <lists+linux-stm32@lfdr.de>; Tue,  5 Apr 2022 18:37:59 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8C4A9C6048F;
	Tue,  5 Apr 2022 16:37:59 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9992EC60479
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  5 Apr 2022 16:37:57 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6E938618B4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  5 Apr 2022 16:37:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 106FEC385B5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  5 Apr 2022 16:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649176675;
 bh=Godeb1QF1XaLrnNDs3lSu+RGeizZyertdC0hYAIHClw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Yu6iJOgByni16xc1pZ6bNBjAeQxQqcTuh8UKL3qI0gplsZ+8nNmFn1SKThC9FuxN4
 u34E1aUA4n2FU907IP7rNdM9/W/IUVWPsUAHOC9JAsZEyGh80oZzqmGL96ilHd7Sbu
 WUA65ocB+C7/WAgR5eYriY7oSzvDourQ0S1hAm7WGWKc9TOc9gkHJD1+6svOgIk5Qz
 vPEvbcZ49dRQ1Gu6eRN0JjgqEy8ECUIqzV5pL2Ye1wUW20zvKfEwOFYL9CeIBZ0wwr
 5WNMCE6QkkXOKsZZldvORIw/sUvgOIPJJAeWoGHwDSLxfkQjOM09FT4bH/eMbwLt0h
 zAFPwI7MN/0ZA==
Received: by mail-ej1-f42.google.com with SMTP id dr20so27729492ejc.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 05 Apr 2022 09:37:54 -0700 (PDT)
X-Gm-Message-State: AOAM5325PT7w9luztCtvt1KE5CMnmt25KU/OhXVvUjZ7MpZ5fFNEONVc
 o79HUEhnIo1zFzMNA4pXKI24loMrez6JXE6uGhF+Nw==
X-Google-Smtp-Source: ABdhPJzKjYrImTJI9WyByUp50Mj9PCG8J06DWt1ucdJTqdDxCPRpsxJHnkt2Vhm9WUOmFxdnESIK5CAyDWTZbEBHta8=
X-Received: by 2002:a17:907:6089:b0:6db:a3d7:3fa9 with SMTP id
 ht9-20020a170907608900b006dba3d73fa9mr4556278ejc.593.1649176672844; Tue, 05
 Apr 2022 09:37:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220328175033.2437312-1-roberto.sassu@huawei.com>
 <20220331022727.ybj4rui4raxmsdpu@MBP-98dd607d3435.dhcp.thefacebook.com>
 <b9f5995f96da447c851f7c9db8232a9b@huawei.com>
 <20220401235537.mwziwuo4n53m5cxp@MBP-98dd607d3435.dhcp.thefacebook.com>
 <CACYkzJ5QgkucL3HZ4bY5Rcme4ey6U3FW4w2Gz-9rdWq0_RHvgA@mail.gmail.com>
 <CAEiveUcx1KHoJ421Cv+52t=0U+Uy2VF51VC_zfTSftQ4wVYOPw@mail.gmail.com>
 <c2e57f10b62940eba3cfcae996e20e3c@huawei.com>
 <385e4cf4-4cd1-8f41-5352-ea87a1f419ad@schaufler-ca.com>
 <0497bb46586c4f37b9bd01950ba9e6a5@huawei.com>
 <fb804242-da2c-4213-9dc3-f09ea42f0355@schaufler-ca.com>
In-Reply-To: <fb804242-da2c-4213-9dc3-f09ea42f0355@schaufler-ca.com>
From: KP Singh <kpsingh@kernel.org>
Date: Tue, 5 Apr 2022 18:37:42 +0200
X-Gmail-Original-Message-ID: <CACYkzJ4KwWykYjb0DJ1SHe9syiefqgfjDB8om7RNx10vZ3UiKg@mail.gmail.com>
Message-ID: <CACYkzJ4KwWykYjb0DJ1SHe9syiefqgfjDB8om7RNx10vZ3UiKg@mail.gmail.com>
To: Casey Schaufler <casey@schaufler-ca.com>
Cc: "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "zohar@linux.ibm.com" <zohar@linux.ibm.com>,
 "linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
 "shuah@kernel.org" <shuah@kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "daniel@iogearbox.net" <daniel@iogearbox.net>,
 "corbet@lwn.net" <corbet@lwn.net>, "andrii@kernel.org" <andrii@kernel.org>,
 Alexei Starovoitov <alexei.starovoitov@gmail.com>,
 "ast@kernel.org" <ast@kernel.org>,
 "viro@zeniv.linux.org.uk" <viro@zeniv.linux.org.uk>,
 Djalal Harouni <tixxdz@gmail.com>, "bpf@vger.kernel.org" <bpf@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 Roberto Sassu <roberto.sassu@huawei.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-security-module@vger.kernel.org"
 <linux-security-module@vger.kernel.org>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 "linux-integrity@vger.kernel.org" <linux-integrity@vger.kernel.org>
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

On Tue, Apr 5, 2022 at 6:22 PM Casey Schaufler <casey@schaufler-ca.com> wrote:
>
> On 4/5/2022 8:29 AM, Roberto Sassu wrote:
> >> From: Casey Schaufler [mailto:casey@schaufler-ca.com]
> >> Sent: Tuesday, April 5, 2022 4:50 PM
> >> On 4/4/2022 10:20 AM, Roberto Sassu wrote:
> >>>> From: Djalal Harouni [mailto:tixxdz@gmail.com]
> >>>> Sent: Monday, April 4, 2022 9:45 AM
> >>>> On Sun, Apr 3, 2022 at 5:42 PM KP Singh <kpsingh@kernel.org> wrote:
> >>>>> On Sat, Apr 2, 2022 at 1:55 AM Alexei Starovoitov
> >>>>> <alexei.starovoitov@gmail.com> wrote:
> >>>> ...
> >>>>>>> Pinning
> >>>>>>> them to unreachable inodes intuitively looked the
> >>>>>>> way to go for achieving the stated goal.
> >>>>>> We can consider inodes in bpffs that are not unlinkable by root
> >>>>>> in the future, but certainly not for this use case.
> >>>>> Can this not be already done by adding a BPF_LSM program to the
> >>>>> inode_unlink LSM hook?
> >>>>>
> >>>> Also, beside of the inode_unlink... and out of curiosity: making
> >> sysfs/bpffs/
> >>>> readonly after pinning, then using bpf LSM hooks
> >>>> sb_mount|remount|unmount...
> >>>> family combining bpf() LSM hook... isn't this enough to:
> >>>> 1. Restrict who can pin to bpffs without using a full MAC
> >>>> 2. Restrict who can delete or unmount bpf filesystem
> >>>>
> >>>> ?
> >>> I'm thinking to implement something like this.
> >>>
> >>> First, I add a new program flag called
> >>> BPF_F_STOP_ONCONFIRM, which causes the ref count
> >>> of the link to increase twice at creation time. In this way,
> >>> user space cannot make the link disappear, unless a
> >>> confirmation is explicitly sent via the bpf() system call.
> >>>
> >>> Another advantage is that other LSMs can decide
> >>> whether or not they allow a program with this flag
> >>> (in the bpf security hook).
> >>>
> >>> This would work regardless of the method used to
> >>> load the eBPF program (user space or kernel space).
> >>>
> >>> Second, I extend the bpf() system call with a new
> >>> subcommand, BPF_LINK_CONFIRM_STOP, which
> >>> decreasres the ref count for the link of the programs
> >>> with the BPF_F_STOP_ONCONFIRM flag. I will also
> >>> introduce a new security hook (something like
> >>> security_link_confirm_stop), so that an LSM has the
> >>> opportunity to deny the stop (the bpf security hook
> >>> would not be sufficient to determine exactly for
> >>> which link the confirmation is given, an LSM should
> >>> be able to deny the stop for its own programs).
> >> Would you please stop referring to a set of eBPF programs
> >> loaded into the BPF LSM as an LSM? Call it a BPF security
> >> module (BSM) if you must use an abbreviation. An LSM is a
> >> provider of security_ hooks. In your case that is BPF. When
> >> you call the set of eBPF programs an LSM it is like calling
> >> an SELinux policy an LSM.
> > An eBPF program could be a provider of security_ hooks
> > too.
>
> No, it can't. If I look in /sys/kernel/security/lsm what
> you see is "bpf". The LSM is BPF. What BPF does in its
> hooks is up to it and its responsibility.
>
> >   The bpf LSM is an aggregator, similarly to your
> > infrastructure to manage built-in LSMs. Maybe, calling
> > it second-level LSM or secondary LSM would better
> > represent this new class.
>
> It isn't an LSM, and adding a qualifier doesn't make it
> one and only adds to the confusion.
>
> > The only differences are the registration method, (SEC
> > directive instead of DEFINE_LSM), and what the hook
> > implementation can access.
>
> Those two things pretty well define what an LSM is.
>
> > The implementation of a security_ hook via eBPF can
> > follow the same structure of built-in LSMs, i.e. it can be
> > uniquely responsible for enforcing and be policy-agnostic,
> > and can retrieve the decisions based on a policy from a
> > component implemented somewhere else.
>
> The BPF LSM provides mechanism. The eBPF programs provide policy.

Yeah, let's stick what we call an LSM in the kernel, Here,
"bpf" is the LSM like selinux,apparmor and this is what you set in
CONFIG_LSM or pass on cmdline as lsm= and can be seen
in /sys/kernel/security/lsm

Calling your BPF programs an LSM will just confuse people.

>
> >
> > Hopefully, I understood the basic principles correctly.
> > I let the eBPF maintainers comment on this.
> >
> > Thanks
> >
> > Roberto
> >
> > HUAWEI TECHNOLOGIES Duesseldorf GmbH, HRB 56063
> > Managing Director: Li Peng, Zhong Ronghua
> >
> >>> What do you think?
> >>>
> >>> Thanks
> >>>
> >>> Roberto
> >>>
> >>> HUAWEI TECHNOLOGIES Duesseldorf GmbH, HRB 56063
> >>> Managing Director: Li Peng, Zhong Ronghua
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
