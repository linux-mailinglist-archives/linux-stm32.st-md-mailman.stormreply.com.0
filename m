Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 487F6930DA2
	for <lists+linux-stm32@lfdr.de>; Mon, 15 Jul 2024 07:35:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C8A82C6C841;
	Mon, 15 Jul 2024 05:35:29 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F2EC7C6C83A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Jul 2024 05:35:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id DE943CE0B28;
 Mon, 15 Jul 2024 05:35:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5407FC4AF0C;
 Mon, 15 Jul 2024 05:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1721021720;
 bh=23WVQytlsylhbvxlQYuds0lP2VtzWIhTTgtqfdPH29o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iy2UdCZHqRcCdoKcJTRLMDVSnkjG+Xex9X8HTKKJYHrjK8RHNBUnRu0DFbYVgx3Gc
 xERkEqqR+hutyEkvQkWM8YaBb/6823P8dEOQubX4aMDiHn97+/yjrKKqpqaVb/6zNa
 RDDOhpe9OZ2tJrpcFDRjjwynZ3jeQGCvKCz8pJuQ=
Date: Mon, 15 Jul 2024 07:35:16 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Message-ID: <2024071518-ridden-election-8118@gregkh>
References: <2d168cf9-e456-4262-b276-95e992b8eac7@quicinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2d168cf9-e456-4262-b276-95e992b8eac7@quicinc.com>
Cc: Peter Zijlstra <peterz@infradead.org>, nouveau@lists.freedesktop.org,
 Dave Hansen <dave.hansen@linux.intel.com>, kernel-janitors@vger.kernel.org,
 Karol Herbst <karolherbst@gmail.com>, "H. Peter Anvin" <hpa@zytor.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, x86@kernel.org,
 Russell King <linux@armlinux.org.uk>, Ingo Molnar <mingo@redhat.com>,
 Steven Rostedt <rostedt@goodmis.org>, Pekka Paalanen <ppaalanen@gmail.com>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [Linux-stm32] MODULE_DESCRIPTION() patches with no maintainer
	action
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

On Sun, Jul 14, 2024 at 02:46:19PM -0700, Jeff Johnson wrote:
> Andrew & Greg,
> 
> I hate to bother you with such mundane patches, but the following have been
> posted for a while without any maintainer or reviewer comment or action, and
> they have not yet landed in linux-next.
> 
> What is the path forward to have these MODULE_DESCRIPTION() warnings fixed?
> 
> arch/arm/probes/kprobes/
> https://lore.kernel.org/all/20240622-md-arm-arch-arm-probes-kprobes-v1-1-0832bd6e45db@quicinc.com/
> 
> arch/x86/mm/
> https://lore.kernel.org/all/20240515-testmmiotrace-md-v1-1-10919a8b2842@quicinc.com/
> 
> drivers/spmi/
> https://lore.kernel.org/all/20240609-md-drivers-spmi-v1-1-f1d5b24e7a66@quicinc.com/
> 
> (note that beyond these 3 patches I still have an additional 13 patches which
> need to land in order to fix these warnings tree-wide, but those 13 patches
> have had recent maintainer or reviewer action so I'm not seeking your help at
> this time).

After -rc1 is out, resend them all as a series and cc: the right people
and either me or Andrew can pick them up then and get them merged in
before -final is released.

thanks,

greg k-h
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
