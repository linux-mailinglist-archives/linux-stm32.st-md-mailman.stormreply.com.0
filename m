Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E2EBBAD85B2
	for <lists+linux-stm32@lfdr.de>; Fri, 13 Jun 2025 10:32:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9549FC36B31;
	Fri, 13 Jun 2025 08:32:41 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 996E9C36B30
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Jun 2025 08:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=ceyQVU1s/TeC1A0uuWSXGNuCFCVzbMABPNZsJKr21a4=; b=ZRWi8pCIRln6gDBwDpL5TpDfHk
 niUGHnvaDU0AKjQp3zTX54Kw4vhPB112ARtEB3A3tsfHGDPm6te2aBSu7kQtFjcx3+kRZgROg+c7W
 kS7pt8ASyk3TCFFxhiEm6kPTIZMPPiU8dnfjrPAPRbBVgSDRNGvQTO0GcSsXKkLM7uvdZc9X4Otcr
 A50grAGUwhRNlVjkB6SSJaMvazcQwGoFc0/VziikYdX2zpo1f5E8Gom7g2W12Se9sFjjSftOPGhfM
 tDyo0kZ13bbnUwgZboISoP0egP9ZHd1TSEPBzLl/kwGBrm/dWyTWo/out4wopH6YyoR9cHDgoastf
 /btuiUCQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252]
 helo=noisy.programming.kicks-ass.net)
 by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1uPzpy-00000002viF-2jCO; Fri, 13 Jun 2025 08:32:34 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
 id 94D9E300969; Fri, 13 Jun 2025 10:32:32 +0200 (CEST)
Date: Fri, 13 Jun 2025 10:32:32 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Alexis =?iso-8859-1?Q?Lothor=E9?= <alexis.lothore@bootlin.com>
Message-ID: <20250613083232.GL2273038@noisy.programming.kicks-ass.net>
References: <20250613-deny_trampoline_structs_on_stack-v1-0-5be9211768c3@bootlin.com>
 <20250613-deny_trampoline_structs_on_stack-v1-2-5be9211768c3@bootlin.com>
 <20250613081150.GJ2273038@noisy.programming.kicks-ass.net>
 <DAL9GRMH74F4.2IV0HN0NGU65X@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <DAL9GRMH74F4.2IV0HN0NGU65X@bootlin.com>
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

On Fri, Jun 13, 2025 at 10:26:37AM +0200, Alexis Lothor=E9 wrote:
> Hi Peter,
> =

> On Fri Jun 13, 2025 at 10:11 AM CEST, Peter Zijlstra wrote:
> > On Fri, Jun 13, 2025 at 09:37:11AM +0200, Alexis Lothor=E9 (eBPF Founda=
tion) wrote:
> >> When the target function receives more arguments than available
> >> registers, the additional arguments are passed on stack, and so the
> >> generated trampoline needs to read those to prepare the bpf context,
> >> but also to prepare the target function stack when it is in charge of
> >> calling it. This works well for scalar types, but if the value is a
> >> struct, we can not know for sure the exact struct location, as it may
> >> have been packed or manually aligned to a greater value.
> >
> > https://refspecs.linuxbase.org/elf/x86_64-abi-0.99.pdf
> >
> > Has fairly clear rules on how arguments are encoded. Broadly speaking
> > for the kernel, if the structure exceeds 2 registers in size, it is
> > passed as a reference, otherwise it is passed as two registers.
> =

> Maybe my commit wording is not precise enough, but indeed, there's not
> doubt about whether the struct value is passed on the stack or through a
> register/a pair of registers. The doubt is rather about the struct locati=
on
> when it is passed _by value_ and _on the stack_: the ABI indeed clearly
> states that "Structures and unions assume the alignment of their most
> strictly aligned component" (p.13), but this rule is "silently broken" wh=
en
> a struct has an __attribute__((packed)) or and __attribute__((aligned(X))=
),
> and AFAICT this case can not be detected at runtime with current BTF info.

Ah, okay. So it is a failure of BTF. That was indeed not clear.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
