Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A3A23128BDB
	for <lists+linux-stm32@lfdr.de>; Sun, 22 Dec 2019 00:27:52 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 42C66C36B0C;
	Sat, 21 Dec 2019 23:27:52 +0000 (UTC)
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
 [209.85.215.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DEC6AC36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 21 Dec 2019 23:27:50 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id x8so6856912pgk.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 21 Dec 2019 15:27:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=joelfernandes.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=HEmZZukzj2SW5GPtr7DXQtejZIIVJMFpYqi+rGbIeHc=;
 b=qCRXjEvK3FW59zErd5qNjoropEEmHyOByBkC6gLLJEKM/tbqmfCDxExpAjsYDuo2cK
 ZDrYTc1+CvI1vWS0dH5wqQhEgDnkhJUMKyko6t7w9wpbHItBNelMLeA6DsxKfdNz0NWe
 9IMtO6GpcvUgZgLyR15gOz068sDit9g+Degp4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=HEmZZukzj2SW5GPtr7DXQtejZIIVJMFpYqi+rGbIeHc=;
 b=Eoz71AIwpZpXZrEL35b7qmSnsGpWbIekAruJi05fXPMcP2mdWdDHVYaCfYZQBCL5Xb
 nAb5IzPeNRz5sPmFnj6Tj53KRZ+NT0PnnrllYgIj7+ldOTQ9qqH3ReTJBpR0CIxEVCoj
 RwEN+wouINrdnA0wocOuzfv+qMFBvMqoQwjcolmofcGZ45mZoitFROsET8009bPIGr0T
 C648n1BzIAKJpns4zPraEZ4qYElrBPT+bDV6WQlPWYsj/h59PwkFKcM5d/efD/K60J+R
 XxgVm6ebfpSyw9R/422KdzBY6TxNhiXpH1+Di/BxYD1CKCP7MCcqHCGboZ9+sqojTrl4
 NNwg==
X-Gm-Message-State: APjAAAUNmgkajg0vwr4pzuC0c1dQkv/IOUwhG7kBYKz5CEhrKYGe6dgM
 B9U0NADyZivrWNfv0aVtk/Wfew==
X-Google-Smtp-Source: APXvYqyiARfhrneCiqBALllYbrSMObMCjhtUs5Mb/fxbzNbiXtGb6M35R413rPViHbkZqTaCg+3Jbw==
X-Received: by 2002:a62:8f0d:: with SMTP id n13mr11417163pfd.38.1576970869113; 
 Sat, 21 Dec 2019 15:27:49 -0800 (PST)
Received: from localhost ([2620:15c:6:12:9c46:e0da:efbf:69cc])
 by smtp.gmail.com with ESMTPSA id q7sm15456513pjd.3.2019.12.21.15.27.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Dec 2019 15:27:48 -0800 (PST)
Date: Sat, 21 Dec 2019 18:27:46 -0500
From: Joel Fernandes <joel@joelfernandes.org>
To: Valentin Schneider <valentin.schneider@arm.com>
Message-ID: <20191221232746.GB67625@google.com>
References: <20191127154428.191095-1-antonio.borneo@st.com>
 <20191204160407.GB17404@google.com>
 <6b5b74cede87a61d5f04f2a95bc4389830467fe9.camel@st.com>
 <68b3b7db-d278-6cd2-f2b6-cbba05df6db4@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <68b3b7db-d278-6cd2-f2b6-cbba05df6db4@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: linux-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>,
 Ingo Molnar <mingo@redhat.com>, ambroise.vincent@arm.com,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] tracing: Fix printing ptrs in preempt/irq
 enable/disable events
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

On Thu, Dec 19, 2019 at 06:45:25PM +0000, Valentin Schneider wrote:
> On 07/12/2019 00:00, Antonio Borneo wrote:
> > At login:
> > trace-cmd record -e preemptirq:irq_enable sleep 1
> > trace-cmd report trace.dat | head
> > and I incorrectly get only the offsets to _stext:
> > cpus=1
> >            sleep-197   [000]   280.378022: irq_enable:           caller=0x1afaS parent=0xc00091S
> >            sleep-197   [000]   280.378026: irq_enable:           caller=0x54d34S parent=0x78e00000S
> >            sleep-197   [000]   280.378029: irq_enable:           caller=0x1afaS parent=0xc00a84S
> >            sleep-197   [000]   280.378032: irq_enable:           caller=0x263dS parent=0x78e00000S
> > ...
> > 
> > With this patch I get the expected/right result:
> > cpus=1
> >            sleep-210   [000]   525.177583: irq_enable:           caller=trace_hardirqs_on_thunk parent=entry_SYSCALL_64_after_hwframe
> >            sleep-210   [000]   525.177587: irq_enable:           caller=__do_page_fault parent=(nil)S
> >            sleep-210   [000]   525.177590: irq_enable:           caller=trace_hardirqs_on_thunk parent=swapgs_restore_regs_and_return_to_usermode
> >            sleep-210   [000]   525.177593: irq_enable:           caller=do_syscall_64 parent=(nil)S
> > ...
> 
> FWIW Ambroise (in Cc) and I were staring at some irq enable/disable traces,
> and encountered exactly this on a Pixel3 running a mainline kernel. With
> Antonio's patch we got the expected result, so you can have:
> 
> Tested-by: Valentin Schneider <valentin.schneider@arm.com>

In BCC, we use the binary trace record of this tracepoint and don't interpret
the text output.  There we lookup _stext value (I believe from kallsyms) and
then apply the offset to that and do another look up for the final symbol.

Would it be possible for Ambroise to work more on this patch so that the
trace record size is not doubled?

> >> I am not comfortable with this patch at the moment, mainly because it will
> >> increase the size of this rather high frequency event. But I'm not saying
> >> there isn't an issue on 32-bit. Let's discuss more.
> >>
> > 
> > Sure, the pressure on the trace buffer will increase on a 64 bit system, but in general it also has more memory than an embedded 32 bit system.
> > The key point is, instead, can we feel safe with a 32 bit offset in a 64 bit system? Is there any guarantee a module is loaded within 32 bits offset from _stext?
> > 
> 
> You're better placed than I to know if and when this is the case, but I
> wouldn't use this in a production environment. To me this is more of a
> debugging tool (and a really good one at that), so I am less concerned
> about the memory overhead.

The issue is with poor trace buffer utilization, you could overflow the trace
buffer more easily, and lose trace data. The reason I came up with the stext
delta approach was precisely to address this and it worked when I was using
this tracepoint. Let me find some time this evening to work more on
Ambroise's patch.

thanks,

 - Joel

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
