Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D7B582566C
	for <lists+linux-stm32@lfdr.de>; Fri,  5 Jan 2024 16:19:11 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B3ED0C6C83C;
	Fri,  5 Jan 2024 15:19:10 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9834DC6B45B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 Jan 2024 15:19:09 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id
 a640c23a62f3a-a28d25253d2so181300866b.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 05 Jan 2024 07:19:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704467949; x=1705072749;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=cXM8mUu2b7I5NINWgE1xN7lsAgN9ikjmrQenDxvMoYo=;
 b=MjCfRJ5XSU0raINwx7PprJrxnZlDn7jbzeh7v9WUO2f8nG9zMHByaSEdy2IaJVUg/m
 /KC55c/oqet47DZnzahO8IsFHBXeBvKVvR+VywC3K0jw+CmfuZUgemTeQwC0zqemlUcf
 EYHqYYNo4AkHPnyBxxA6ODuzsrPU8LD2s5QpIuuUJnCfHtwOTUbaRlWGBdKbSUuBlt9z
 ak3wAWnn5fXJcP2+//HSCqz851MD3jAIQM9TG7N12XF+Vgacq/si8KEQuc11qEDWAkjT
 Vy0OvujeIfWOT6YQd5uM0VRRz14jdesvJiizLvT/0FRXGR5QTrB6He9zv9NQWOsRuVvC
 qQ1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704467949; x=1705072749;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cXM8mUu2b7I5NINWgE1xN7lsAgN9ikjmrQenDxvMoYo=;
 b=Cx2xELwCV9Cj65JK4RGPx/1N+RHOFBVVbAPwmPSP1+ZqkeITJyaxrf+5Xln9QyNt+u
 hLA5lihRDS5b3d2nWhaNAMGG0PpI30c8NKXv7sxr5g8xjWDTJmTPUy6MrnR7UENQJULp
 ul2jt0f7wnXd1TZoVRwAkfIAry1ICllGNSz/2fjZR0k19UwQHnlOX/mHO1dweZ4W2qhl
 cDLsXEVXtou/odsyqVY21ATchY84uCmyHfkWrHxxrQbTCnApyYZjKXZ1L4V78NIWCKhn
 EFHN2KpAO0zTSY7FG5gtyw6BjPPSAwumbLd6mqRlmQqiDfySQP35G9rvj+lQ4nrtiSY4
 WvUw==
X-Gm-Message-State: AOJu0YxD3smzvv+wlKg31+wn4U++D3SLgI31ctHQ7UnsC5hlPXAoWXo2
 DGjTrMQQ3M+lX32q0UY3ljM=
X-Google-Smtp-Source: AGHT+IHMylC1f/uOwiPnE54XyvPyUNJflvpVz3FB0ZLbHNPVoLKw4ML5AEQ2yE/zVzZzRQJG9qQEHw==
X-Received: by 2002:a17:906:6a82:b0:a23:4c5d:dab4 with SMTP id
 p2-20020a1709066a8200b00a234c5ddab4mr1164549ejr.62.1704467948901; 
 Fri, 05 Jan 2024 07:19:08 -0800 (PST)
Received: from krava (2001-1ae9-1c2-4c00-726e-c10f-8833-ff22.ip6.tmcz.cz.
 [2001:1ae9:1c2:4c00:726e:c10f:8833:ff22])
 by smtp.gmail.com with ESMTPSA id
 mj20-20020a170906af9400b00a27a7fa8691sm979246ejb.137.2024.01.05.07.19.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jan 2024 07:19:07 -0800 (PST)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Fri, 5 Jan 2024 16:19:06 +0100
To: Daniel Xu <dxu@dxuuu.xyz>
Message-ID: <ZZgd6vOhpLcZmYp5@krava>
References: <cover.1704422454.git.dxu@dxuuu.xyz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1704422454.git.dxu@dxuuu.xyz>
Cc: fsverity@lists.linux.dev, alan.maguire@oracle.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, alexei.starovoitov@gmail.com, memxor@gmail.com,
 coreteam@netfilter.org, netfilter-devel@vger.kernel.org, quentin@isovalent.com,
 linux-kselftest@vger.kernel.org, linux-input@vger.kernel.org,
 cgroups@vger.kernel.org, bpf@vger.kernel.org, olsajiri@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-trace-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH bpf-next v2 0/3] Annotate kfuncs in
	.BTF_ids section
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

On Thu, Jan 04, 2024 at 07:45:46PM -0700, Daniel Xu wrote:
> === Description ===
> 
> This is a bpf-treewide change that annotates all kfuncs as such inside
> .BTF_ids. This annotation eventually allows us to automatically generate
> kfunc prototypes from bpftool.
> 
> We store this metadata inside a yet-unused flags field inside struct
> btf_id_set8 (thanks Kumar!). pahole will be taught where to look.
> 
> More details about the full chain of events are available in commit 3's
> description.
> 
> The accompanying pahole changes (still needs some cleanup) can be viewed
> here on this "frozen" branch [0].
> 
> [0]: https://github.com/danobi/pahole/tree/kfunc_btf-mailed

great, lgtm.. seems I've got the tags in right places (128 kfuncs)

please send it on the list once you're done with that, so we could
comment on that

thanks,
jirka

> 
> === Changelog ===
> 
> Changes from v1:
> * Move WARN_ON() up a call level
> * Also return error when kfunc set is not properly tagged
> * Use BTF_KFUNCS_START/END instead of flags
> * Rename BTF_SET8_KFUNC to BTF_SET8_KFUNCS
> 
> Daniel Xu (3):
>   bpf: btf: Support flags for BTF_SET8 sets
>   bpf: btf: Add BTF_KFUNCS_START/END macro pair
>   bpf: treewide: Annotate BPF kfuncs in BTF
> 
>  drivers/hid/bpf/hid_bpf_dispatch.c            |  8 +++----
>  fs/verity/measure.c                           |  4 ++--
>  include/linux/btf_ids.h                       | 21 +++++++++++++++----
>  kernel/bpf/btf.c                              |  4 ++++
>  kernel/bpf/cpumask.c                          |  4 ++--
>  kernel/bpf/helpers.c                          |  8 +++----
>  kernel/bpf/map_iter.c                         |  4 ++--
>  kernel/cgroup/rstat.c                         |  4 ++--
>  kernel/trace/bpf_trace.c                      |  8 +++----
>  net/bpf/test_run.c                            |  8 +++----
>  net/core/filter.c                             | 16 +++++++-------
>  net/core/xdp.c                                |  4 ++--
>  net/ipv4/bpf_tcp_ca.c                         |  4 ++--
>  net/ipv4/fou_bpf.c                            |  4 ++--
>  net/ipv4/tcp_bbr.c                            |  4 ++--
>  net/ipv4/tcp_cubic.c                          |  4 ++--
>  net/ipv4/tcp_dctcp.c                          |  4 ++--
>  net/netfilter/nf_conntrack_bpf.c              |  4 ++--
>  net/netfilter/nf_nat_bpf.c                    |  4 ++--
>  net/xfrm/xfrm_interface_bpf.c                 |  4 ++--
>  net/xfrm/xfrm_state_bpf.c                     |  4 ++--
>  .../selftests/bpf/bpf_testmod/bpf_testmod.c   |  8 +++----
>  22 files changed, 77 insertions(+), 60 deletions(-)
> 
> -- 
> 2.42.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
