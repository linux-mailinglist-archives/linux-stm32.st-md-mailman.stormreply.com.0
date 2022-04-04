Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5984A4F1F57
	for <lists+linux-stm32@lfdr.de>; Tue,  5 Apr 2022 00:49:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 13FC6C6047C;
	Mon,  4 Apr 2022 22:49:23 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 07C95C5EC56
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  4 Apr 2022 22:49:21 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id d15so4008683pll.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 04 Apr 2022 15:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DiZpMTn/EVNY/pnuPoizyqHMne6cPx1y5mye2ibx/ok=;
 b=bgnp+RZ4/8nfeh0NMWErXmEtEshX86JerNFp8dq/RD44FxWiFAl972gOEJDqV++XyA
 By4VZtAU4QVALrso+XOALjElN48YFB3TiZeU9RcQxb+9XSdszdEltEwvn9K8oecLmXTQ
 TQQfzdCYgQyp4jsdjY5EwU/Uh3faCKJvnJbzu8VpGOGyjkhm+VjdOWOKNFg2CdC9WIHu
 9qKlg3mhSFcqJlntThMyi4VG3ISf3oNk+2Ry4A/oRGT+IxjxU5e24QVPCkZiEspbB6Ae
 CcLSJd1INuQNNkvMz1KILSOVf2EODqUP+szWpO3DLZgvPGzGiBVeiL6R9WCUXhOUmtMv
 ed7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DiZpMTn/EVNY/pnuPoizyqHMne6cPx1y5mye2ibx/ok=;
 b=juO36Hgyctu5ViFQmlBcsz1tn97LyFo9CviuRDPNAysQKSwdX0QQIyA06+3eTXQ5+W
 R0S0YPaG7UdjlbudslMHyra8TsLeER3oZ1HMr0FVt8WXp/rlRT0ptxOQWJQDg6erBtkT
 0EiUdPtE1hSfEJSOTdfiwgI7MwZZWD/dnpzwiA9jw9CcIfkNiP53N3ptk3oH5PvDknh1
 EUKlo5SpDGUqcBYP9OJMnyvULBazC1D2zK18BmI+pRuW7NXKW3+BLo8AXUIb50gpFV08
 79a3Frtt3iBvNlyBpl/kVJCD98+a3HPfc/j5nxmW6JHsOe5k1gqgweUyxgIjzX8A/cx4
 YQoA==
X-Gm-Message-State: AOAM530z0l+V1rbScWsmvGkrdgrpy6QgFxi6X6SbhdZDXD2aDQ20YNXU
 k6hzBxhoH/03oHMg1rnOBb3mRPum2eVdFi3WqLo=
X-Google-Smtp-Source: ABdhPJw6yLez+Pola3pnCcu1X++dRI9Dtud1fwRlNqRru6KsE9kQoMKYHIIF+h1m/5FNxuqFspqfjNyXq2uiHfs7URQ=
X-Received: by 2002:a17:902:ba83:b0:154:727e:5fc5 with SMTP id
 k3-20020a170902ba8300b00154727e5fc5mr475882pls.55.1649112560582; Mon, 04 Apr
 2022 15:49:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220328175033.2437312-1-roberto.sassu@huawei.com>
 <20220331022727.ybj4rui4raxmsdpu@MBP-98dd607d3435.dhcp.thefacebook.com>
 <b9f5995f96da447c851f7c9db8232a9b@huawei.com>
 <20220401235537.mwziwuo4n53m5cxp@MBP-98dd607d3435.dhcp.thefacebook.com>
 <CACYkzJ5QgkucL3HZ4bY5Rcme4ey6U3FW4w2Gz-9rdWq0_RHvgA@mail.gmail.com>
 <CAEiveUcx1KHoJ421Cv+52t=0U+Uy2VF51VC_zfTSftQ4wVYOPw@mail.gmail.com>
 <c2e57f10b62940eba3cfcae996e20e3c@huawei.com>
In-Reply-To: <c2e57f10b62940eba3cfcae996e20e3c@huawei.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Mon, 4 Apr 2022 15:49:09 -0700
Message-ID: <CAADnVQJSso+GSXC-QmNmj0GBPZzxRCRfqAcQbqD-6y0CtMSopQ@mail.gmail.com>
To: Roberto Sassu <roberto.sassu@huawei.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
 "daniel@iogearbox.net" <daniel@iogearbox.net>,
 "corbet@lwn.net" <corbet@lwn.net>, "shuah@kernel.org" <shuah@kernel.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "ast@kernel.org" <ast@kernel.org>, "zohar@linux.ibm.com" <zohar@linux.ibm.com>,
 KP Singh <kpsingh@kernel.org>, "andrii@kernel.org" <andrii@kernel.org>,
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

On Mon, Apr 4, 2022 at 10:21 AM Roberto Sassu <roberto.sassu@huawei.com> wrote:
>
> > From: Djalal Harouni [mailto:tixxdz@gmail.com]
> > Sent: Monday, April 4, 2022 9:45 AM
> > On Sun, Apr 3, 2022 at 5:42 PM KP Singh <kpsingh@kernel.org> wrote:
> > >
> > > On Sat, Apr 2, 2022 at 1:55 AM Alexei Starovoitov
> > > <alexei.starovoitov@gmail.com> wrote:
> > ...
> > > >
> > > > > Pinning
> > > > > them to unreachable inodes intuitively looked the
> > > > > way to go for achieving the stated goal.
> > > >
> > > > We can consider inodes in bpffs that are not unlinkable by root
> > > > in the future, but certainly not for this use case.
> > >
> > > Can this not be already done by adding a BPF_LSM program to the
> > > inode_unlink LSM hook?
> > >
> >
> > Also, beside of the inode_unlink... and out of curiosity: making sysfs/bpffs/
> > readonly after pinning, then using bpf LSM hooks
> > sb_mount|remount|unmount...
> > family combining bpf() LSM hook... isn't this enough to:
> > 1. Restrict who can pin to bpffs without using a full MAC
> > 2. Restrict who can delete or unmount bpf filesystem
> >
> > ?
>
> I'm thinking to implement something like this.
>
> First, I add a new program flag called
> BPF_F_STOP_ONCONFIRM, which causes the ref count
> of the link to increase twice at creation time. In this way,
> user space cannot make the link disappear, unless a
> confirmation is explicitly sent via the bpf() system call.
>
> Another advantage is that other LSMs can decide
> whether or not they allow a program with this flag
> (in the bpf security hook).
>
> This would work regardless of the method used to
> load the eBPF program (user space or kernel space).
>
> Second, I extend the bpf() system call with a new
> subcommand, BPF_LINK_CONFIRM_STOP, which
> decreases the ref count for the link of the programs
> with the BPF_F_STOP_ONCONFIRM flag. I will also
> introduce a new security hook (something like
> security_link_confirm_stop), so that an LSM has the
> opportunity to deny the stop (the bpf security hook
> would not be sufficient to determine exactly for
> which link the confirmation is given, an LSM should
> be able to deny the stop for its own programs).
>
> What do you think?

Hack upon a hack? Makes no sense.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
