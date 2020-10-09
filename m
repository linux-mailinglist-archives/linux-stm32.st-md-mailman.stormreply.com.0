Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 01D76288BE0
	for <lists+linux-stm32@lfdr.de>; Fri,  9 Oct 2020 16:54:20 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AFBB5C32EA8;
	Fri,  9 Oct 2020 14:54:19 +0000 (UTC)
Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com
 [209.85.218.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C3325C32EA6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  9 Oct 2020 14:54:16 +0000 (UTC)
Received: by mail-ej1-f68.google.com with SMTP id qp15so13498371ejb.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 09 Oct 2020 07:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=WPLkSeBjE1UNFvhO83o6KlgNgRkw/d3XV3/gLArbGT4=;
 b=ubB/KqJYZzM5j9bfX7vxLEmNhOPSiGG2mpxOk+X66p7Mv1n6uwgV9Urmrt+vvNI1wx
 jFxgeRuJjiAcAhGXnVJvISCBTUru3PAkDuZZiQOzhyzWcfKP+VDRGTzBwbS3evqV3feK
 xW/jupkwDGiqZ4KGcdbn05B3Ktuml5dotOzvxV+iQlBJ2YBP3preI2cvpFErIRvvW+Lf
 4sM4l4QbyhlVWYqaUM5styJp+n4smks6UlLpiV1/x+PqegAgWOI8fpj36IUO3YItiCcW
 bZK0wkpRWlWio1LLi2kcVcoK+dBmMyyqtpEgDIWhf1vxeThxcEvHGMAFt1xXT6yrVD8p
 zZMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WPLkSeBjE1UNFvhO83o6KlgNgRkw/d3XV3/gLArbGT4=;
 b=kbzlgoh+kk93OWV0OgtBNJTL9NLsMreuAR2+TQ6+M5IsVS/DP1W1eCp5uJYb5BaiPe
 tznqW/mQS1hYVWgJa5bk7Cy2sAcXclSyraWyBMhRbiVv0VQJnCmvzo5Q7dbi7bILkoSw
 dcMx6MhM7vk00bGyJwhx+3ZVlT2WQgJqqErwAghfXkFyeW0QF6CuxoXC87sq6TKGzK86
 EcGxKEn0Lxb4L+8xTwYXJuAHEsMM5c/qBbjS7HtiNMlb0hm8Ha0skexQWk7noOgmdjTW
 ONT9ENt1txasIofSSw8AI636WmUY015VquU/lxl3ZNrUqt/iX67cqwzraJ81NcmkVGIt
 7YOg==
X-Gm-Message-State: AOAM533PDvheMscKP8rlHRBBxY9LKvoEK8744XZk5sBYtFzNBjVHazPK
 qADI050tiQU3KLv9uUHEGsg=
X-Google-Smtp-Source: ABdhPJxaaSDSp8k8U2yr8O/442lsP/xXbOLJZ/AiJKc+/39HwEaAgIUrdOEa51Hm7RHJj8j+O2db9w==
X-Received: by 2002:a17:906:d292:: with SMTP id
 ay18mr14899370ejb.244.1602255256179; 
 Fri, 09 Oct 2020 07:54:16 -0700 (PDT)
Received: from ?IPv6:2003:ea:8f00:6a00:e538:757:aee0:c25f?
 (p200300ea8f006a00e5380757aee0c25f.dip0.t-ipconnect.de.
 [2003:ea:8f00:6a00:e538:757:aee0:c25f])
 by smtp.googlemail.com with ESMTPSA id t10sm6369824ejc.38.2020.10.09.07.54.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Oct 2020 07:54:15 -0700 (PDT)
To: John Keeping <john@metanate.com>, netdev@vger.kernel.org
References: <20201008162749.860521-1-john@metanate.com>
From: Heiner Kallweit <hkallweit1@gmail.com>
Message-ID: <8036d473-68bd-7ee7-e2e9-677ff4060bd3@gmail.com>
Date: Fri, 9 Oct 2020 16:54:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <20201008162749.860521-1-john@metanate.com>
Content-Language: en-US
Cc: linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: Don't call _irqoff() with
	hardirqs enabled
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

On 08.10.2020 18:27, John Keeping wrote:
> With threadirqs, stmmac_interrupt() is called on a thread with hardirqs
> enabled so we cannot call __napi_schedule_irqoff().  Under lockdep it
> leads to:
> 
> 	------------[ cut here ]------------
> 	WARNING: CPU: 0 PID: 285 at kernel/softirq.c:598 __raise_softirq_irqoff+0x6c/0x1c8
> 	IRQs not disabled as expected
> 	Modules linked in: brcmfmac hci_uart btbcm cfg80211 brcmutil
> 	CPU: 0 PID: 285 Comm: irq/41-eth0 Not tainted 5.4.69-rt39 #1
> 	Hardware name: Rockchip (Device Tree)
> 	[<c0110d3c>] (unwind_backtrace) from [<c010c284>] (show_stack+0x10/0x14)
> 	[<c010c284>] (show_stack) from [<c0855504>] (dump_stack+0xa8/0xe0)
> 	[<c0855504>] (dump_stack) from [<c0120a9c>] (__warn+0xe0/0xfc)
> 	[<c0120a9c>] (__warn) from [<c0120e80>] (warn_slowpath_fmt+0x7c/0xa4)
> 	[<c0120e80>] (warn_slowpath_fmt) from [<c01278c8>] (__raise_softirq_irqoff+0x6c/0x1c8)
> 	[<c01278c8>] (__raise_softirq_irqoff) from [<c056bccc>] (stmmac_interrupt+0x388/0x4e0)
> 	[<c056bccc>] (stmmac_interrupt) from [<c0178714>] (irq_forced_thread_fn+0x28/0x64)
> 	[<c0178714>] (irq_forced_thread_fn) from [<c0178924>] (irq_thread+0x124/0x260)
> 	[<c0178924>] (irq_thread) from [<c0142ee8>] (kthread+0x154/0x164)
> 	[<c0142ee8>] (kthread) from [<c01010bc>] (ret_from_fork+0x14/0x38)
> 	Exception stack(0xeb7b5fb0 to 0xeb7b5ff8)
> 	5fa0:                                     00000000 00000000 00000000 00000000
> 	5fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
> 	5fe0: 00000000 00000000 00000000 00000000 00000013 00000000
> 	irq event stamp: 48
> 	hardirqs last  enabled at (50): [<c085c200>] prb_unlock+0x7c/0x8c
> 	hardirqs last disabled at (51): [<c085c0dc>] prb_lock+0x58/0x100
> 	softirqs last  enabled at (0): [<c011e770>] copy_process+0x550/0x1654
> 	softirqs last disabled at (25): [<c01786ec>] irq_forced_thread_fn+0x0/0x64
> 	---[ end trace 0000000000000002 ]---
> 
> Use __napi_schedule() instead which will save & restore the interrupt
> state.
> 
I'm thinking about a __napi_schedule version that disables hard irq's
conditionally, based on variable force_irqthreads, exported by the irq
subsystem. This would allow to behave correctly with threadirqs set,
whilst not loosing the _irqoff benefit with threadirqs unset.
Let me come up with a proposal.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
