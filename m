Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5068E850D2A
	for <lists+linux-stm32@lfdr.de>; Mon, 12 Feb 2024 05:30:27 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E11FFC6907A;
	Mon, 12 Feb 2024 04:30:26 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5454AC65E4F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Feb 2024 04:30:25 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id
 d9443c01a7336-1d932f6ccfaso18084555ad.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 11 Feb 2024 20:30:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707712224; x=1708317024;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
 :reply-to; bh=3T9QXvUrIRRU7LGl55R5e+M2xbd0WYhx3eIeVfdzbAY=;
 b=dhEWFVO1Ddu7wQiSsibWIJCVB/qPQ2H6IYitW6lCnqWFqCQOfZoik/gTfX+CQzDHqT
 W3KM5YaE6z8o72twCTugYn6c/eJohE8Rhn1UgiyttMkGVGBa+FfjjbQwyVutxoMqGobD
 3taIrCH53vhCEe4aohMc9Knb7JxG1c507tnscPZ/DhzpfOq78YIHqoGOHzaqBw7WU3TF
 riF63FnJJRQn1OuVkENSO62ci0IgQ9+ixmqqdx6mA8KdnnlMHwgB/8MEeYKgXugJHMVV
 3n4Jmt6zNG7YFaNPSK0JjvJ2Vt28STXp/HTpn46ze6uQJVwaUal+hyuuW6L/P5mf6D2f
 /SzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707712224; x=1708317024;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3T9QXvUrIRRU7LGl55R5e+M2xbd0WYhx3eIeVfdzbAY=;
 b=lKxEHdxaBnAaAlqCYaNiCIabG0e2jFG8/5UTN2hsOIw47o01U3bJJT+7JPTLViae57
 5jOEOVetMbrEtnCOkGWqk4lM7Sl4eZsdygtyTpJyOhsoE2gfp+JtSt+IK3XBSHja/lec
 PcJAKTcyQBDVMCZIs3oTidzzur6Az1Rp/CWbOaU2m61epo1lMSQpJw/XebHc1zP67C0e
 /DhLxqu0kF3NYyTClq4nZr99Vt1t4AjRhONRhIDAtN5NyHeXoL6roX018110QV9iFdDZ
 eDVyMeaz5H8GXaZDaOFTfrIorwin5IS08mDm+Ny0Wb7UMFoaQ6D9cHuXybVtbfpJQOic
 fg2g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXHsVr+R8yJhDhaLhaw5gRHkWtuUmritzchNqUVfbH8wYHPUFSeu3Di8DB+uF0FBBbdItrRjOMH6e8iOnrG32tYgpZtTK7yIp20tYQZaE4d3ODwUOkfuF3u
X-Gm-Message-State: AOJu0Yyu2mfJN3dLYR8OSEWVgEmWWBdDPGI2m3moiYTHEBqfvdVPPJCZ
 pgBkrYF7MkDXaS7NuuDxZPRK4UW2j4yN28aB1Zy6Xsbv8b8fi/Pg
X-Google-Smtp-Source: AGHT+IHmbsIuYr7U/igYIt1wVig3xsh090b1FWqxrtZCPUlU2y1ySLRpwmoosq35UVBhlGoGKyGE+g==
X-Received: by 2002:a05:6a21:3a41:b0:19e:cc6e:fcc3 with SMTP id
 zu1-20020a056a213a4100b0019ecc6efcc3mr1539927pzb.46.1707712223673; 
 Sun, 11 Feb 2024 20:30:23 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUBsP3hJomQ0PdBzl47l/IxAo9VS6FxONNyKYBXF4yyDXACB9LPeV2pBy/kt0hRnyVXkrZTJl/QHwlrpDo9Y2XsSuCCbKNc0fZwLYusHmog5VtCCkaYmoFhNr5DA9IdnaDTnsIwGxrqKKCkGiMr+pSuYJBwzJbl6X7J87qBQqMjIDeo8d0ka+QMdd0BALxwab3sQPPCE1MWcAJXQ7+4f0GJ8Rq5Ho4ZqL/BiYUe7igFoZUfgGtLdsYLOjK3XkqFLNdc8RzUu26+jIFeY4H576aB1CEIDRlrNY+HSeH4UfpOkkbDxYaTGBiGHyTU53QVHqY6jBPin/QBLddKaB5IQhcyMKS2Q/3+iL7uLWckjL3ZnoXQeOG5lsBqLjRKg0bFU8XWT5RKFJ957/d7BtgbfnxBFTNhVPQBbUtKws9C/iBpzFmfSDMqXlkQBLtBbVWMCBwg48to2ba5c0ND5ADY/1DeX37D56DSp8e7FM2PqkVeksjk1tGzx8BLZ2Mg+xiRD96ZMGfF0HZ+CVO1u08DhKvcVeIRTcwwBodUzx03kutBFC5PyAaoVXbW02TeC0tOIwYQiRt9MZd5Aw+QoWjH+CHaObV7QwnrLK30K2IeeR1WxB2JOyKpibAGDT6AeMzq5+ptkk31DJWQs2Ayev/UhsUWVFFlnVzqwbw=
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 iu11-20020a17090b450b00b002970994278csm5586896pjb.8.2024.02.11.20.30.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Feb 2024 20:30:22 -0800 (PST)
Date: Sun, 11 Feb 2024 20:30:21 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Petr Tesarik <petr@tesarici.cz>
Message-ID: <ea1567d9-ce66-45e6-8168-ac40a47d1821@roeck-us.net>
References: <20240203190927.19669-1-petr@tesarici.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240203190927.19669-1-petr@tesarici.cz>
Cc: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>,
 open list <linux-kernel@vger.kernel.org>, Jisheng Zhang <jszhang@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Marc Haber <mh+netdev@zugschlus.de>,
 "open list:STMMAC ETHERNET DRIVER" <netdev@vger.kernel.org>,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 stable@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>,
 "David S. Miller" <davem@davemloft.net>,
 "moderated list:ARM/STM32 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH net v3] net: stmmac: protect updates of
 64-bit statistics counters
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

Hi,

On Sat, Feb 03, 2024 at 08:09:27PM +0100, Petr Tesarik wrote:
> As explained by a comment in <linux/u64_stats_sync.h>, write side of struct
> u64_stats_sync must ensure mutual exclusion, or one seqcount update could
> be lost on 32-bit platforms, thus blocking readers forever. Such lockups
> have been observed in real world after stmmac_xmit() on one CPU raced with
> stmmac_napi_poll_tx() on another CPU.
> 
> To fix the issue without introducing a new lock, split the statics into
> three parts:
> 
> 1. fields updated only under the tx queue lock,
> 2. fields updated only during NAPI poll,
> 3. fields updated only from interrupt context,
> 
> Updates to fields in the first two groups are already serialized through
> other locks. It is sufficient to split the existing struct u64_stats_sync
> so that each group has its own.
> 
> Note that tx_set_ic_bit is updated from both contexts. Split this counter
> so that each context gets its own, and calculate their sum to get the total
> value in stmmac_get_ethtool_stats().
> 
> For the third group, multiple interrupts may be processed by different CPUs
> at the same time, but interrupts on the same CPU will not nest. Move fields
> from this group to a newly created per-cpu struct stmmac_pcpu_stats.
> 
> Fixes: 133466c3bbe1 ("net: stmmac: use per-queue 64 bit statistics where necessary")
> Link: https://lore.kernel.org/netdev/Za173PhviYg-1qIn@torres.zugschlus.de/t/
> Cc: stable@vger.kernel.org
> Signed-off-by: Petr Tesarik <petr@tesarici.cz>

This patch results in a lockdep splat. Backtrace and bisect results attached.

Guenter

---
[   33.736728] ================================
[   33.736805] WARNING: inconsistent lock state
[   33.736953] 6.8.0-rc4 #1 Tainted: G                 N
[   33.737080] --------------------------------
[   33.737155] inconsistent {HARDIRQ-ON-W} -> {IN-HARDIRQ-W} usage.
[   33.737309] kworker/0:2/39 [HC1[1]:SC0[2]:HE0:SE0] takes:
[   33.737459] ef792074 (&syncp->seq#2){?...}-{0:0}, at: sun8i_dwmac_dma_interrupt+0x9c/0x28c
[   33.738206] {HARDIRQ-ON-W} state was registered at:
[   33.738318]   lock_acquire+0x11c/0x368
[   33.738431]   __u64_stats_update_begin+0x104/0x1ac
[   33.738525]   stmmac_xmit+0x4d0/0xc58
[   33.738605]   dev_hard_start_xmit+0xc4/0x2a0
[   33.738689]   sch_direct_xmit+0xf8/0x30c
[   33.738763]   __dev_queue_xmit+0x400/0xcc4
[   33.738831]   ip6_finish_output2+0x254/0xafc
[   33.738903]   mld_sendpack+0x260/0x5b0
[   33.738969]   mld_ifc_work+0x274/0x588
[   33.739032]   process_one_work+0x230/0x604
[   33.739101]   worker_thread+0x1dc/0x494
[   33.739165]   kthread+0x100/0x120
[   33.739225]   ret_from_fork+0x14/0x28
[   33.739302] irq event stamp: 3553
[   33.739371] hardirqs last  enabled at (3552): [<c03e884c>] __call_rcu_common.constprop.0+0x1a4/0x6b4
[   33.739515] hardirqs last disabled at (3553): [<c0300bd4>] __irq_svc+0x54/0xb8
[   33.739638] softirqs last  enabled at (3542): [<c1254a60>] neigh_resolve_output+0x1fc/0x254
[   33.739795] softirqs last disabled at (3546): [<c1243798>] __dev_queue_xmit+0x48/0xcc4
[   33.739919]
[   33.739919] other info that might help us debug this:
[   33.740021]  Possible unsafe locking scenario:
[   33.740021]
[   33.740111]        CPU0
[   33.740158]        ----
[   33.740204]   lock(&syncp->seq#2);
[   33.740314]   <Interrupt>
[   33.740363]     lock(&syncp->seq#2);
[   33.740511]
[   33.740511]  *** DEADLOCK ***
[   33.740511]
[   33.740665] 8 locks held by kworker/0:2/39:
[   33.740761]  #0: c4bfb2a8 ((wq_completion)mld){+.+.}-{0:0}, at: process_one_work+0x168/0x604
[   33.741025]  #1: f0909f20 ((work_completion)(&(&idev->mc_ifc_work)->work)){+.+.}-{0:0}, at: process_one_work+0x168/0x604
[   33.741230]  #2: c328baac (&idev->mc_lock){+.+.}-{3:3}, at: mld_ifc_work+0x24/0x588
[   33.741387]  #3: c2191488 (rcu_read_lock){....}-{1:2}, at: mld_sendpack+0x0/0x5b0
[   33.741553]  #4: c2191488 (rcu_read_lock){....}-{1:2}, at: ip6_finish_output2+0x174/0xafc
[   33.741716]  #5: c219149c (rcu_read_lock_bh){....}-{1:2}, at: __dev_queue_xmit+0x48/0xcc4
[   33.741877]  #6: c4d3a974 (dev->qdisc_tx_busylock ?: &qdisc_tx_busylock){+...}-{2:2}, at: __dev_queue_xmit+0x334/0xcc4
[   33.742070]  #7: c49e5050 (_xmit_ETHER#2){+...}-{2:2}, at: sch_direct_xmit+0x158/0x30c
[   33.742250]
[   33.742250] stack backtrace:
[   33.742426] CPU: 0 PID: 39 Comm: kworker/0:2 Tainted: G                 N 6.8.0-rc4 #1
[   33.742578] Hardware name: Allwinner sun8i Family
[   33.742776] Workqueue: mld mld_ifc_work
[   33.742998]  unwind_backtrace from show_stack+0x10/0x14
[   33.743119]  show_stack from dump_stack_lvl+0x68/0x90
[   33.743232]  dump_stack_lvl from mark_lock.part.0+0xbd8/0x12d8
[   33.743345]  mark_lock.part.0 from __lock_acquire+0xad4/0x224c
[   33.743458]  __lock_acquire from lock_acquire+0x11c/0x368
[   33.743564]  lock_acquire from __u64_stats_update_begin+0x104/0x1ac
[   33.743683]  __u64_stats_update_begin from sun8i_dwmac_dma_interrupt+0x9c/0x28c
[   33.743805]  sun8i_dwmac_dma_interrupt from stmmac_napi_check+0x40/0x1c8
[   33.743917]  stmmac_napi_check from stmmac_interrupt+0xa4/0x154
[   33.744020]  stmmac_interrupt from __handle_irq_event_percpu+0xcc/0x2ec
[   33.744134]  __handle_irq_event_percpu from handle_irq_event+0x38/0x80
[   33.744243]  handle_irq_event from handle_fasteoi_irq+0x9c/0x1c4
[   33.744346]  handle_fasteoi_irq from generic_handle_domain_irq+0x28/0x38
[   33.744459]  generic_handle_domain_irq from gic_handle_irq+0x98/0xcc
[   33.744567]  gic_handle_irq from generic_handle_arch_irq+0x34/0x44
[   33.744673]  generic_handle_arch_irq from call_with_stack+0x18/0x20
[   33.744831]  call_with_stack from __irq_svc+0x9c/0xb8
[   33.745018] Exception stack(0xf0909c00 to 0xf0909c48)
[   33.745221] 9c00: f0ab0000 c49e506c 0000005a 00000000 c0000006 f0ab0014 0000005a c0f5da68
[   33.745387] 9c20: c35bd810 c4b50000 c4b50000 c365d300 00000000 f0909c50 c0f70a70 c0f70a74
[   33.745574] 9c40: 60000013 ffffffff
[   33.745668]  __irq_svc from sun8i_dwmac_enable_dma_transmission+0x20/0x24
[   33.745809]  sun8i_dwmac_enable_dma_transmission from stmmac_xmit+0x790/0xc58
[   33.745975]  stmmac_xmit from dev_hard_start_xmit+0xc4/0x2a0
[   33.746100]  dev_hard_start_xmit from sch_direct_xmit+0xf8/0x30c
[   33.746220]  sch_direct_xmit from __dev_queue_xmit+0x400/0xcc4
[   33.746350]  __dev_queue_xmit from ip6_finish_output2+0x254/0xafc
[   33.746462]  ip6_finish_output2 from mld_sendpack+0x260/0x5b0
[   33.746568]  mld_sendpack from mld_ifc_work+0x274/0x588
[   33.746670]  mld_ifc_work from process_one_work+0x230/0x604
[   33.746793]  process_one_work from worker_thread+0x1dc/0x494
[   33.746906]  worker_thread from kthread+0x100/0x120
[   33.746994]  kthread from ret_from_fork+0x14/0x28
[   33.747076] Exception stack(0xf0909fb0 to 0xf0909ff8)
[   33.747165] 9fa0:                                     00000000 00000000 00000000 00000000
[   33.747303] 9fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
[   33.747433] 9fe0: 00000000 00000000 00000000 00000000 00000013 00000000

---
# bad: [841c35169323cd833294798e58b9bf63fa4fa1de] Linux 6.8-rc4
# good: [54be6c6c5ae8e0d93a6c4641cb7528eb0b6ba478] Linux 6.8-rc3
git bisect start 'HEAD' 'v6.8-rc3'
# bad: [c76b766ec50d3d43e2dacea53a733b285f4b730d] Merge tag 'drm-fixes-2024-02-09' of git://anongit.freedesktop.org/drm/drm
git bisect bad c76b766ec50d3d43e2dacea53a733b285f4b730d
# bad: [63e4b9d693e0f8c28359c7ea81e1ee510864c37b] Merge tag 'nf-24-02-08' of git://git.kernel.org/pub/scm/linux/kernel/git/netfilter/nf
git bisect bad 63e4b9d693e0f8c28359c7ea81e1ee510864c37b
# bad: [75428f537d7cae33c7e4dd726144074f78622c09] net: intel: fix old compiler regressions
git bisect bad 75428f537d7cae33c7e4dd726144074f78622c09
# good: [1a1c13303ff6d64e6f718dc8aa614e580ca8d9b4] nfp: flower: prevent re-adding mac index for bonded port
git bisect good 1a1c13303ff6d64e6f718dc8aa614e580ca8d9b4
# good: [3871aa01e1a779d866fa9dfdd5a836f342f4eb87] tipc: Check the bearer type before calling tipc_udp_nl_bearer_add()
git bisect good 3871aa01e1a779d866fa9dfdd5a836f342f4eb87
# good: [58086721b7781c3e35b19c9b78c8f5a791070ba3] devlink: avoid potential loop in devlink_rel_nested_in_notify_work()
git bisect good 58086721b7781c3e35b19c9b78c8f5a791070ba3
# bad: [38cc3c6dcc09dc3a1800b5ec22aef643ca11eab8] net: stmmac: protect updates of 64-bit statistics counters
git bisect bad 38cc3c6dcc09dc3a1800b5ec22aef643ca11eab8
# good: [cb88cb53badb8aeb3955ad6ce80b07b598e310b8] ppp_async: limit MRU to 64K
git bisect good cb88cb53badb8aeb3955ad6ce80b07b598e310b8
# first bad commit: [38cc3c6dcc09dc3a1800b5ec22aef643ca11eab8] net: stmmac: protect updates of 64-bit statistics counters
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
