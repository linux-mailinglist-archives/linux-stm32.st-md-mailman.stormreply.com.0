Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 57C08CA3971
	for <lists+linux-stm32@lfdr.de>; Thu, 04 Dec 2025 13:26:19 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0725BC3F95E;
	Thu,  4 Dec 2025 12:26:19 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DA424C349C4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  4 Dec 2025 12:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1764851176;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ntrkK5ngwL04sLtoW4Sv8APHLop043OBw9D0nKKE4pM=;
 b=RXuN6x42MYj7GPK9WkUACFP5jlS+VdOjfocBovf/gxXxlmhJ1QhBAkGF9ktVZYKt6hCYMN
 cjlFMZJe/42xakOqIAtYrQYnqVQIoaVIKiNlwLgroIbJwSICJPSv53FlYDUFl/8r4mnNiO
 t84yYf2GdAg5IJOvh7DxDtzFR+xi4OQ=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-365-1PCckxEBOLmACvOLUr7S5Q-1; Thu, 04 Dec 2025 07:26:15 -0500
X-MC-Unique: 1PCckxEBOLmACvOLUr7S5Q-1
X-Mimecast-MFC-AGG-ID: 1PCckxEBOLmACvOLUr7S5Q_1764851174
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-42e2e3c2cccso577661f8f.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 04 Dec 2025 04:26:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764851174; x=1765455974;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ntrkK5ngwL04sLtoW4Sv8APHLop043OBw9D0nKKE4pM=;
 b=wbgqZnfcFVvNf+5JvqQIUkOWAFYXDSyDVXt1uCqBs0QQIq9lqv8Czq697lOSjXIgE9
 tW61w1WwuOv1vNLWMnzfm8E45uQnQ6AO2+Y7wCOTcVrfKp8qQCoOH8rhU15uuAXDfUB1
 i7azgu5WUko7me0eQfLK1qknM9zYtSLCskIKwbu3ffzpkvKBDjWIbyQw6Ku8txEQ0UMA
 qkHjGEQrMVxYBZg37qTPpeZtXBrLK30EK4SZp9eVSLZ0L/RXr4oJ39oWILE+XYaaR0tj
 eufiJKyx3vHwx7nUC/2EGrBT+jZR7cCw7QbNkDhkC0zkAHe0h5VoyBifp0KfJ8wdzWEf
 YUsQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWmMB3ZS0H1QnmHTPxoAWZdTlmY9Sj3mOmCFcUw/4gkDYjLWv7kTGyuFpTM8WdgIlA70n3JqL6HlrPP2g==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyuX/AdFD/vPHcbqUdxW8yrPS/2ke5ebLUO0Puxlk0/RD0pF+Dm
 XoUl4Neg484xjJwJPQzhRhAsHft4+//6wFHmGMBlDEzQKvJCYx6NLtRojomUJ186ZpI+dEBvwbF
 vcFfOKoAEw+9CGY+uhprXuX5CAVfKSmCfQQocUGLb5gnJNc/K5a84Y9FG78QXwMqmMl67jzE4It
 RFTkOVwQ==
X-Gm-Gg: ASbGncsY8ZGEFu5kh+VqpLIz+JZOZHNx6eBuLnfNdfzN5QZ6hEMZmaY3hO2LeY1EKU/
 T/GhP/4PHJ+sNSy5X1nO6D6teYJCyPakDHO0zgKqYjUYVTw4KvXVcnbLn5ZEXDd+qX0GR8ztbxP
 VxwzelFKC2onal44nOg/sWTIrgsCWWzeMioXSIQ71jrxwdZvKruMnCgWguFvomx3pIPD9guTkr/
 KfPXFt0J1Voj4bj+kk03Ua7tD+5p4pxry2WKY7tjfWwHLk+RZqB5zuWBeirunIGLxS19qTpUaoQ
 rXbGVxJRx6aGaK7JWrXdv2+VWFMjSTuhGdpnj2dGxkoYBn2gVctoRLcQvoayE2I9pOeoXuW0EDy
 TvIPEPFJPBaN5
X-Received: by 2002:a05:6000:2c07:b0:42b:3ed2:c079 with SMTP id
 ffacd0b85a97d-42f731a2fccmr6635998f8f.48.1764851174424; 
 Thu, 04 Dec 2025 04:26:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE6gmno3wWmw/T0ba/JcUdJo3RTAy+j1I7RB2376m0GMm4A3gdkyRtvDjK4Ir85kEN7eqyU1w==
X-Received: by 2002:a05:6000:2c07:b0:42b:3ed2:c079 with SMTP id
 ffacd0b85a97d-42f731a2fccmr6635966f8f.48.1764851173922; 
 Thu, 04 Dec 2025 04:26:13 -0800 (PST)
Received: from [192.168.88.32] ([212.105.153.24])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42f7d222506sm3442295f8f.28.2025.12.04.04.26.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Dec 2025 04:26:13 -0800 (PST)
Message-ID: <81491196-2872-4fd3-a1f3-f27ce0bb998b@redhat.com>
Date: Thu, 4 Dec 2025 13:26:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jie Zhang <jzhang918@gmail.com>, netdev@vger.kernel.org
References: <20251202025421.4560-1-jie.zhang@analog.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20251202025421.4560-1-jie.zhang@analog.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: J3HXfxMksGzFdmJOb2kN94KiKhP6vdWoqLS2PggEHqY_1764851174
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Cc: linux-kernel@vger.kernel.org,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 linux-stm32@st-md-mailman.stormreply.com, Furong Xu <0x1207@gmail.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Jie Zhang <jie.zhang@analog.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>,
 "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: fix oops when split header
	is enabled
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


n 12/2/25 3:54 AM, Jie Zhang wrote:
> For GMAC4, when split header is enabled, in some rare cases, the
> hardware does not fill buf2 of the first descriptor with payload.
> Thus we cannot assume buf2 is always fully filled if it is not
> the last descriptor. Otherwise, the length of buf2 of the second
> descriptor will be calculated wrong and cause an oops:
> 
> Unable to handle kernel paging request at virtual address ffff00019246bfc0
> Mem abort info:
>   ESR = 0x0000000096000145
>   EC = 0x25: DABT (current EL), IL = 32 bits
>   SET = 0, FnV = 0
>   EA = 0, S1PTW = 0
>   FSC = 0x05: level 1 translation fault
> Data abort info:
>   ISV = 0, ISS = 0x00000145, ISS2 = 0x00000000
>   CM = 1, WnR = 1, TnD = 0, TagAccess = 0
>   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
> swapper pgtable: 4k pages, 48-bit VAs, pgdp=0000000090d8b000
> [ffff00019246bfc0] pgd=180000009dfff403, p4d=180000009dfff403, pud=0000000000000000
> Internal error: Oops: 0000000096000145 [#1]  SMP
> Modules linked in:
> CPU: 0 UID: 0 PID: 157 Comm: iperf3 Not tainted 6.18.0-rc6 #1 PREEMPT
> Hardware name: ADI 64-bit SC598 SOM EZ Kit (DT)
> pstate: 00400009 (nzcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> pc : dcache_inval_poc+0x28/0x58
> lr : arch_sync_dma_for_cpu+0x28/0x34
> sp : ffff800080dcbc40
> x29: ffff800080dcbc40 x28: 0000000000000008 x27: ffff000091c50980
> x26: ffff000091c50980 x25: 0000000000000000 x24: ffff000092a5fb00
> x23: ffff000092768f28 x22: 000000009246c000 x21: 0000000000000002
> x20: 00000000ffffffdc x19: ffff000091844c10 x18: 0000000000000000
> x17: ffff80001d308000 x16: ffff800080dc8000 x15: ffff0000929fb034
> x14: 70f709157374dd21 x13: ffff000092812ec0 x12: 0000000000000000
> x11: 000000000000dd86 x10: 0000000000000040 x9 : 0000000000000600
> x8 : ffff000092a5fbac x7 : 0000000000000001 x6 : 0000000000004240
> x5 : 000000009246c000 x4 : ffff000091844c10 x3 : 000000000000003f
> x2 : 0000000000000040 x1 : ffff00019246bfc0 x0 : ffff00009246c000
> Call trace:
>  dcache_inval_poc+0x28/0x58 (P)
>  dma_direct_sync_single_for_cpu+0x38/0x6c
>  __dma_sync_single_for_cpu+0x34/0x6c
>  stmmac_napi_poll_rx+0x8f0/0xb60
>  __napi_poll.constprop.0+0x30/0x144
>  net_rx_action+0x160/0x274
>  handle_softirqs+0x1b8/0x1fc
>  __do_softirq+0x10/0x18
>  ____do_softirq+0xc/0x14
>  call_on_irq_stack+0x30/0x48
>  do_softirq_own_stack+0x18/0x20
>  __irq_exit_rcu+0x64/0xe8
>  irq_exit_rcu+0xc/0x14
>  el1_interrupt+0x3c/0x58
>  el1h_64_irq_handler+0x14/0x1c
>  el1h_64_irq+0x6c/0x70
>  __arch_copy_to_user+0xbc/0x240 (P)
>  simple_copy_to_iter+0x28/0x30
>  __skb_datagram_iter+0x1bc/0x268
>  skb_copy_datagram_iter+0x1c/0x24
>  tcp_recvmsg_locked+0x3ec/0x778
>  tcp_recvmsg+0x10c/0x194
>  inet_recvmsg+0x64/0xa0
>  sock_recvmsg_nosec+0x1c/0x24
>  sock_read_iter+0x8c/0xdc
>  vfs_read+0x144/0x1a0
>  ksys_read+0x74/0xdc
>  __arm64_sys_read+0x14/0x1c
>  invoke_syscall+0x60/0xe4
>  el0_svc_common.constprop.0+0xb0/0xcc
>  do_el0_svc+0x18/0x20
>  el0_svc+0x80/0xc8
>  el0t_64_sync_handler+0x58/0x134
>  el0t_64_sync+0x170/0x174
> Code: d1000443 ea03003f 8a230021 54000040 (d50b7e21)
> ---[ end trace 0000000000000000 ]---
> Kernel panic - not syncing: Oops: Fatal exception in interrupt
> Kernel Offset: disabled
> CPU features: 0x080000,00008000,08006281,0400520b
> Memory Limit: none
> ---[ end Kernel panic - not syncing: Oops: Fatal exception in interrupt ]---

Please avoid including the last 6 lines in the commit message, the '---'
separator could foul git when applying the patch and truncate the commit
message.
> To fix this, the PL bit-field in RDES3 register is used for all
> descriptors, whether it is the last descriptor or not.
> 
> Signed-off-by: Jie Zhang <jie.zhang@analog.com>
Looks like a fixes suitable for net; a fix tag is required and you should
include the target tree into the subj prefix, see:
https://elixir.bootlin.com/linux/v6.18/source/Documentation/process/maintainer-netdev.rst#L64The
patch does not apply to 'net' anymore, please rebase and resubmit. You
can retain Jacob's ack.

/P


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
