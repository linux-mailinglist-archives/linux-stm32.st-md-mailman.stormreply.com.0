Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AA3FEAD8545
	for <lists+linux-stm32@lfdr.de>; Fri, 13 Jun 2025 10:11:59 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5A621C36B31;
	Fri, 13 Jun 2025 08:11:59 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D4C6AC36B30
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Jun 2025 08:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=m4XILQdlyhOEuGIrG8GkhmJQpyqVphUns6R2oeWJu9E=; b=if3J+62JkNzeEHqPi1mxH/620g
 qbcmwRd9/sN2gu7fYdEieQ472dRs1NUjlLOrPe+LrNMaNOybKB9RJ5nrnr7JUciLzvr8yWDn5WPhd
 rjx68mKpzXFARN/1pSa0P3Hjh/ruZo3UBs7yEl6mKcKGqmuiQwA+oehZrJYblS8IHty47WnzTfpUQ
 aK6G7NQv89PMHFtnryrKWiKXkm0miAEO4njn+KucKk4gQdMqrpJ2Pgx/b6N0NaugMg1RZpmwXvhR3
 WKMgULs4MBp5Rbde8GCQaNGQJSHdTMEtTXgvNN8I6oW0AsGX1eM4FtI1HAHXX1V39luP1oOz+HxZO
 dQwXzi/g==;
Received: from
 2001-1c00-8d82-d000-266e-96ff-fe07-7dcc.cable.dynamic.v6.ziggo.nl
 ([2001:1c00:8d82:d000:266e:96ff:fe07:7dcc]
 helo=noisy.programming.kicks-ass.net)
 by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1uPzVw-00000002v6a-2GjE; Fri, 13 Jun 2025 08:11:52 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
 id DDD5E30BC59; Fri, 13 Jun 2025 10:11:50 +0200 (CEST)
Date: Fri, 13 Jun 2025 10:11:50 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Alexis =?iso-8859-1?Q?Lothor=E9_=28eBPF_Foundation=29?=
 <alexis.lothore@bootlin.com>
Message-ID: <20250613081150.GJ2273038@noisy.programming.kicks-ass.net>
References: <20250613-deny_trampoline_structs_on_stack-v1-0-5be9211768c3@bootlin.com>
 <20250613-deny_trampoline_structs_on_stack-v1-2-5be9211768c3@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250613-deny_trampoline_structs_on_stack-v1-2-5be9211768c3@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Alexei Starovoitov <ast@kernel.org>,
 Song Liu <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>,
 "H. Peter Anvin" <hpa@zytor.com>, Alexander Gordeev <agordeev@linux.ibm.com>,
 Shuah Khan <shuah@kernel.org>, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, Menglong Dong <imagedong@tencent.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Daniel Borkmann <daniel@iogearbox.net>,
 Michael Ellerman <mpe@ellerman.id.au>, x86@kernel.org,
 John Fastabend <john.fastabend@gmail.com>, Andrii Nakryiko <andrii@kernel.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 linux-stm32@st-md-mailman.stormreply.com, Ingo Molnar <mingo@redhat.com>,
 =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
 linux-arm-kernel@lists.infradead.org,
 Bastien Curutchet <bastien.curutchet@bootlin.com>,
 Mykola Lysenko <mykolal@fb.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, ebpf@linuxfoundation.org,
 Albert Ou <aou@eecs.berkeley.edu>, Puranjay Mohan <puranjay@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Naveen N Rao <naveen@kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>, KP Singh <kpsingh@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Pu Lehui <pulehui@huawei.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>,
 Hari Bathini <hbathini@linux.ibm.com>, Hao Luo <haoluo@google.com>,
 linux-kselftest@vger.kernel.org, Alexandre Ghiti <alex@ghiti.fr>,
 Stanislav Fomichev <sdf@fomichev.me>, David Ahern <dsahern@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Eduard Zingerman <eddyz87@gmail.com>,
 =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Sven Schnelle <svens@linux.ibm.com>,
 Jiri Olsa <jolsa@kernel.org>, netdev@vger.kernel.org, bpf@vger.kernel.org,
 Martin KaFai Lau <martin.lau@linux.dev>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH bpf 2/7] bpf/x86: prevent trampoline
 attachment when args location on stack is uncertain
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On Fri, Jun 13, 2025 at 09:37:11AM +0200, Alexis Lothor=E9 (eBPF Foundation=
) wrote:
> When the target function receives more arguments than available
> registers, the additional arguments are passed on stack, and so the
> generated trampoline needs to read those to prepare the bpf context,
> but also to prepare the target function stack when it is in charge of
> calling it. This works well for scalar types, but if the value is a
> struct, we can not know for sure the exact struct location, as it may
> have been packed or manually aligned to a greater value.

https://refspecs.linuxbase.org/elf/x86_64-abi-0.99.pdf

Has fairly clear rules on how arguments are encoded. Broadly speaking
for the kernel, if the structure exceeds 2 registers in size, it is
passed as a reference, otherwise it is passed as two registers.


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
