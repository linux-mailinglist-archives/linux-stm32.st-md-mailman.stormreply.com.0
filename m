Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5285A892C34
	for <lists+linux-stm32@lfdr.de>; Sat, 30 Mar 2024 18:52:36 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 02F73C6C855;
	Sat, 30 Mar 2024 17:52:36 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E11A9C69066
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 30 Mar 2024 17:52:34 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id
 a640c23a62f3a-a465ddc2c09so160579566b.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 30 Mar 2024 10:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711821154; x=1712425954;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Dd1Ju+LCh2MPv5vAR1VJsB6sgx1pw4Hx1J299NMUFnM=;
 b=Eh3S/++spC+kPm42rClHhQd+WSF2x+thE0y2r6/CmPA3BBVd17SSJXQNF4UO5S3/en
 RMycFS2arombqFZ1SM2TTT/4KOftCRWdUKJ/YVn1Lflqe1YD7NCmsPmcIZqhi+uKOMrD
 7CwF6Yj7VfZ/N+07s01JJIMNfffoMN4uRHFD34ghZdJQpDV5p6TKbN34GVsY/NCPxAHt
 Ns1kWMTFjyXkzWkEEbNxJP28d4L4aU5VvhM64AAHDMMuwOh3CIY1oll9MZw8GlTzKqKc
 t/wI++t7bzs+dnNQfLvQqB2mC4vUueDLjkD40n3zygIMTo65BNkoKuhz3fxECzoiZuaH
 rTOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711821154; x=1712425954;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Dd1Ju+LCh2MPv5vAR1VJsB6sgx1pw4Hx1J299NMUFnM=;
 b=SP16S1SW87JuO5Zz+6Hzgbk80NFVAC6lLmHGOTn5ipFCXO6WtYiQvcOFqcqauNRTxD
 VNehf8ITbizP5WB4aCWLA+YNF0zX3FjbbGKQju0LV3cCfCJjF1zbQDTvhNvjKuyrBwY5
 Gb3Ayqu0XGTlh6eTjVPaJzCZWlnpR7oryWHjVkTT9+1aBJJKxDdZZ/90kFFGHQoizaL3
 yJdWkR7mOmKyEpGS+NQsK1fx2TBFbzKLly+krzV7C8+kgm1oeXcFBT8cwGUiyFyOTg5X
 5vgMSrTa8YXJjK/7ubMOuOX+nfrO3TVQ+GqfBAqDNIiCnFSw5M8mbfxM2mwQFRsbjtHM
 I+rQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX87aDb2dDUWHeWmRD48WXT2dhsqgMuReXQCSKFULyGaISzEpfj4O0U7o3Byb+Vk1WD0ids+/aTRVjv+jSFA6NMEc4At8abRn0QeSUHansjXg5kRjPUlG5V
X-Gm-Message-State: AOJu0Yz0r45q2NXumsoTDJh45ppkYgoT8iSM+GFb1TsGNqyLMuRELQ3B
 7kA0qpxh5MUTwRucAR5ZJlZaHsdf8mvqtLeu1ns5or0MmwEnOhn5
X-Google-Smtp-Source: AGHT+IEGAmf0kvvH3dm+5STvdXDGmaMLsXGzvzIXptUqdCRcniCaiSzPtCwt9Qd53mlg93swhXFVXQ==
X-Received: by 2002:a50:8ad9:0:b0:566:b09e:8d24 with SMTP id
 k25-20020a508ad9000000b00566b09e8d24mr4080922edk.12.1711821153955; 
 Sat, 30 Mar 2024 10:52:33 -0700 (PDT)
Received: from krava (ip-94-113-247-30.net.vodafone.cz. [94.113.247.30])
 by smtp.gmail.com with ESMTPSA id
 b20-20020aa7cd14000000b0056bf9b4ec32sm3516637edw.78.2024.03.30.10.52.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Mar 2024 10:52:33 -0700 (PDT)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Sat, 30 Mar 2024 18:52:30 +0100
To: Steven Rostedt <rostedt@goodmis.org>
Message-ID: <ZghRXtc8ZiTOKMR3@krava>
References: <CAADnVQJ_ZCzMmT1aBsNXEBFfYNSVBdBXmLocjR0PPEWtYQrQFw@mail.gmail.com>
 <CALz3k9icPePb0c4FE67q=u1U0hrePorN9gDpQrKTR_sXbLMfDA@mail.gmail.com>
 <CAADnVQLwgw8bQ7OHBbqLhcPJ2QpxiGw3fkMFur+2cjZpM_78oA@mail.gmail.com>
 <CALz3k9g9k7fEwdTZVLhrmGoXp8CE47Q+83r-AZDXrzzuR+CjVA@mail.gmail.com>
 <CAADnVQLHpi3J6cBJ0QBgCQ2aY6fWGnVvNGdfi3W-jmoa9d1eVQ@mail.gmail.com>
 <CALz3k9g-U8ih=ycJPRbyU9x_9cp00fNkU3PGQ6jP0WJ+=uKmqQ@mail.gmail.com>
 <CALz3k9jG5Jrqw=BGjt05yMkEF-1u909GbBYrV-02W0dQtm6KQQ@mail.gmail.com>
 <20240328111330.194dcbe5@gandalf.local.home>
 <CAEf4BzYgzOti+Hfdn3SUCjuofGedXRSGApVDD+K2TdG6oNE-pw@mail.gmail.com>
 <20240330082755.1cbeb8c6@rorschach.local.home>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240330082755.1cbeb8c6@rorschach.local.home>
Cc: "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, Alexei Starovoitov <ast@kernel.org>,
 Song Liu <song@kernel.org>, Stanislav Fomichev <sdf@google.com>,
 Yonghong Song <yonghong.song@linux.dev>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Alexei Starovoitov <alexei.starovoitov@gmail.com>,
 linux-s390 <linux-s390@vger.kernel.org>,
 =?utf-8?B?5qKm6b6Z6JGj?= <dongmenglong.8@bytedance.com>,
 Daniel Borkmann <daniel@iogearbox.net>, X86 ML <x86@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>, Andrii Nakryiko <andrii@kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Quentin Monnet <quentin@isovalent.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 linux-trace-kernel@vger.kernel.org, KP Singh <kpsingh@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Hao Luo <haoluo@google.com>, Network Development <netdev@vger.kernel.org>,
 David Ahern <dsahern@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 Eddy Z <eddyz87@gmail.com>, Sven Schnelle <svens@linux.ibm.com>,
 bpf <bpf@vger.kernel.org>, Andrii Nakryiko <andrii.nakryiko@gmail.com>,
 Martin KaFai Lau <martin.lau@linux.dev>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [External] Re: [PATCH bpf-next v2 1/9] bpf:
 tracing: add support to record and check the accessed args
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

On Sat, Mar 30, 2024 at 08:27:55AM -0400, Steven Rostedt wrote:
> On Fri, 29 Mar 2024 16:28:33 -0700
> Andrii Nakryiko <andrii.nakryiko@gmail.com> wrote:
> 
> > I thought I'll just ask instead of digging through code, sorry for
> > being lazy :) Is there any way to pass pt_regs/ftrace_regs captured
> > before function execution to a return probe (fexit/kretprobe)? I.e.,
> > how hard is it to pass input function arguments to a kretprobe? That's
> > the biggest advantage of fexit over kretprobe, and if we can make
> > these original pt_regs/ftrace_regs available to kretprobe, then
> > multi-kretprobe will effectively be this multi-fexit.
> 
> This should be possible with the updates that Masami is doing with the
> fgraph code.

yes, I have bpf kprobe-multi link support for that [0] (it's on top of
Masami's fprobe-over-fgraph changes) we discussed that in [1]

jirka

[0] https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git/log/?h=bpf/session_data
[1] https://lore.kernel.org/bpf/20240228090242.4040210-1-jolsa@kernel.org/
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
