Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B68204F111C
	for <lists+linux-stm32@lfdr.de>; Mon,  4 Apr 2022 10:43:13 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6E420C6049B;
	Mon,  4 Apr 2022 08:43:13 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7644FC5F1D5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  4 Apr 2022 07:45:26 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id g20so9962200edw.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 04 Apr 2022 00:45:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Tlai9C8cCZiFfKZnTMXZTtbcv2bOhWWExoRE23jJ3PQ=;
 b=hnpZqkQvRmhcgBpVq1K7rI1j3GvBGkZU/uMd3O9XQIvlRWmpAJ2xY9AdPT9g4u3G+A
 P7lEhSmfAdelj8ntCpmVIrCXpgVb/lguNVtMkyfAVq8btERTg+bgi7ZDBwKqJydzyvHE
 Y2qfyNt09y62V9e5Ouh5e5pKEC/gUUZc5b8W9ti8xscMHRMXyl/olrhO5ZlNyKfQrEZq
 Y/A0VvvlA0cR1O5pCB1k3dJUbPWEIHrUwNA/TqaAeN03DUwjmKKg+cRDsxls+RSL0bEy
 7aYIkTUGW7LgBiFNcNAPPU38W7jJq4lJZlBg/O7ztgO0XNlbCYMFvZtEeV74dvMrlXJt
 ynMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Tlai9C8cCZiFfKZnTMXZTtbcv2bOhWWExoRE23jJ3PQ=;
 b=6n+Sd6fNqnAhVHHmmPBTLxwzRzuPO3lnXv10RQfOKEROdhNNiNegihZlu2JRUkS7Ki
 FKeCFd2qZr8ZUZ1lWGN2uQYjJ9eXHqFcBpHTaB5/4AqL8ZYi20FH9qbN3KGRfKyxw9wD
 xtrxn5tmphzAq7hI0mtn28tnPtINC07dVs80hbS6YOUnuzzvTsId9rtozbLp/wk/ZmPG
 D6bXs/SSfFNjNqIqialufXZbDdjo6ml9CIGZvwgy77kG2ZtQZ9uTSUqgypeKG5aTbQza
 36iJ8TM9abv7tZGzT5Z/cQqDETClUHr2IGqtyi7hyvNuZlodng+YTacE1KruT0qS4sho
 57CQ==
X-Gm-Message-State: AOAM530w0K+SMswscQX7FJzgluD7AkdjUlesqlf/1Y1Nj9I3u6w9NX39
 +pFpEqxBct35EzKzVhnjpt+7VQWMARit59abeOIjrjXhLOHxbw==
X-Google-Smtp-Source: ABdhPJyWJ0a9eaELFNxUdBnwfDWskCppbdAyhqtxj0984BUGh7eK26sPOBWWPUumUd+bfO25fkAYIOEIoHyeCUw06E8=
X-Received: by 2002:aa7:c98c:0:b0:41c:bfbd:380 with SMTP id
 c12-20020aa7c98c000000b0041cbfbd0380mr6001495edt.313.1649058325913; Mon, 04
 Apr 2022 00:45:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220328175033.2437312-1-roberto.sassu@huawei.com>
 <20220331022727.ybj4rui4raxmsdpu@MBP-98dd607d3435.dhcp.thefacebook.com>
 <b9f5995f96da447c851f7c9db8232a9b@huawei.com>
 <20220401235537.mwziwuo4n53m5cxp@MBP-98dd607d3435.dhcp.thefacebook.com>
 <CACYkzJ5QgkucL3HZ4bY5Rcme4ey6U3FW4w2Gz-9rdWq0_RHvgA@mail.gmail.com>
In-Reply-To: <CACYkzJ5QgkucL3HZ4bY5Rcme4ey6U3FW4w2Gz-9rdWq0_RHvgA@mail.gmail.com>
From: Djalal Harouni <tixxdz@gmail.com>
Date: Mon, 4 Apr 2022 09:44:59 +0200
Message-ID: <CAEiveUcx1KHoJ421Cv+52t=0U+Uy2VF51VC_zfTSftQ4wVYOPw@mail.gmail.com>
To: KP Singh <kpsingh@kernel.org>
X-Mailman-Approved-At: Mon, 04 Apr 2022 08:43:12 +0000
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
 "daniel@iogearbox.net" <daniel@iogearbox.net>,
 "corbet@lwn.net" <corbet@lwn.net>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 Roberto Sassu <roberto.sassu@huawei.com>, "ast@kernel.org" <ast@kernel.org>,
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

On Sun, Apr 3, 2022 at 5:42 PM KP Singh <kpsingh@kernel.org> wrote:
>
> On Sat, Apr 2, 2022 at 1:55 AM Alexei Starovoitov
> <alexei.starovoitov@gmail.com> wrote:
...
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

Also, beside of the inode_unlink... and out of curiosity: making sysfs/bpffs/
readonly after pinning, then using bpf LSM hooks sb_mount|remount|unmount...
family combining bpf() LSM hook... isn't this enough to:
1. Restrict who can pin to bpffs without using a full MAC
2. Restrict who can delete or unmount bpf filesystem

?

-- 
https://djalal.opendz.org/
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
