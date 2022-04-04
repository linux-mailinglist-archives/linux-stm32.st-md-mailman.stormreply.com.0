Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F1B6D4F1993
	for <lists+linux-stm32@lfdr.de>; Mon,  4 Apr 2022 19:21:02 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 90BBFC60464;
	Mon,  4 Apr 2022 17:21:02 +0000 (UTC)
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com
 [185.176.79.56])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 10DD6C5F1D5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  4 Apr 2022 17:21:01 +0000 (UTC)
Received: from fraeml714-chm.china.huawei.com (unknown [172.18.147.226])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4KXHYv3f92z67MtS;
 Tue,  5 Apr 2022 01:18:59 +0800 (CST)
Received: from fraeml714-chm.china.huawei.com (10.206.15.33) by
 fraeml714-chm.china.huawei.com (10.206.15.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Mon, 4 Apr 2022 19:20:59 +0200
Received: from fraeml714-chm.china.huawei.com ([10.206.15.33]) by
 fraeml714-chm.china.huawei.com ([10.206.15.33]) with mapi id 15.01.2375.024;
 Mon, 4 Apr 2022 19:20:59 +0200
From: Roberto Sassu <roberto.sassu@huawei.com>
To: Djalal Harouni <tixxdz@gmail.com>, KP Singh <kpsingh@kernel.org>
Thread-Topic: [PATCH 00/18] bpf: Secure and authenticated preloading of eBPF
 programs
Thread-Index: AQHYQsxoL5kXhl8+JE6PJPNWV+NOTqzYppqAgABrSsCAAo7zgIAAEt0AgAOU8YCAALoz0A==
Date: Mon, 4 Apr 2022 17:20:59 +0000
Message-ID: <c2e57f10b62940eba3cfcae996e20e3c@huawei.com>
References: <20220328175033.2437312-1-roberto.sassu@huawei.com>
 <20220331022727.ybj4rui4raxmsdpu@MBP-98dd607d3435.dhcp.thefacebook.com>
 <b9f5995f96da447c851f7c9db8232a9b@huawei.com>
 <20220401235537.mwziwuo4n53m5cxp@MBP-98dd607d3435.dhcp.thefacebook.com>
 <CACYkzJ5QgkucL3HZ4bY5Rcme4ey6U3FW4w2Gz-9rdWq0_RHvgA@mail.gmail.com>
 <CAEiveUcx1KHoJ421Cv+52t=0U+Uy2VF51VC_zfTSftQ4wVYOPw@mail.gmail.com>
In-Reply-To: <CAEiveUcx1KHoJ421Cv+52t=0U+Uy2VF51VC_zfTSftQ4wVYOPw@mail.gmail.com>
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
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
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
 Alexei Starovoitov <alexei.starovoitov@gmail.com>,
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

> From: Djalal Harouni [mailto:tixxdz@gmail.com]
> Sent: Monday, April 4, 2022 9:45 AM
> On Sun, Apr 3, 2022 at 5:42 PM KP Singh <kpsingh@kernel.org> wrote:
> >
> > On Sat, Apr 2, 2022 at 1:55 AM Alexei Starovoitov
> > <alexei.starovoitov@gmail.com> wrote:
> ...
> > >
> > > > Pinning
> > > > them to unreachable inodes intuitively looked the
> > > > way to go for achieving the stated goal.
> > >
> > > We can consider inodes in bpffs that are not unlinkable by root
> > > in the future, but certainly not for this use case.
> >
> > Can this not be already done by adding a BPF_LSM program to the
> > inode_unlink LSM hook?
> >
> 
> Also, beside of the inode_unlink... and out of curiosity: making sysfs/bpffs/
> readonly after pinning, then using bpf LSM hooks
> sb_mount|remount|unmount...
> family combining bpf() LSM hook... isn't this enough to:
> 1. Restrict who can pin to bpffs without using a full MAC
> 2. Restrict who can delete or unmount bpf filesystem
> 
> ?

I'm thinking to implement something like this.

First, I add a new program flag called
BPF_F_STOP_ONCONFIRM, which causes the ref count
of the link to increase twice at creation time. In this way,
user space cannot make the link disappear, unless a
confirmation is explicitly sent via the bpf() system call.

Another advantage is that other LSMs can decide
whether or not they allow a program with this flag
(in the bpf security hook).

This would work regardless of the method used to
load the eBPF program (user space or kernel space).

Second, I extend the bpf() system call with a new
subcommand, BPF_LINK_CONFIRM_STOP, which
decreases the ref count for the link of the programs
with the BPF_F_STOP_ONCONFIRM flag. I will also
introduce a new security hook (something like
security_link_confirm_stop), so that an LSM has the
opportunity to deny the stop (the bpf security hook
would not be sufficient to determine exactly for
which link the confirmation is given, an LSM should
be able to deny the stop for its own programs).

What do you think?

Thanks

Roberto

HUAWEI TECHNOLOGIES Duesseldorf GmbH, HRB 56063
Managing Director: Li Peng, Zhong Ronghua
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
