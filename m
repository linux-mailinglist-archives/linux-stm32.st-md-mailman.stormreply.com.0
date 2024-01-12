Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 10B0A82C378
	for <lists+linux-stm32@lfdr.de>; Fri, 12 Jan 2024 17:20:46 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ADD73C6DD79;
	Fri, 12 Jan 2024 16:20:45 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 48FBEC6DD78
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Jan 2024 16:20:44 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-2cd8bd6ce1bso20875821fa.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Jan 2024 08:20:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705076443; x=1705681243;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=AXoDO1itquPIC9RJIHRuZv9xrGW2cJyAPsZoJpPFw+4=;
 b=k44ViJMNSz2ibqw9RMJ+tQiw9UnY14UGhFcE5fd7kpNgqYW7pi/8aE8LCeMH/EkKPQ
 OteD5684z2iCCehqV77ydMrmAiJMIkMqSrnONZF/saZDKZiDTaGreTVWq2BPGkxAnG01
 Lc/XP8i6LBb3VGrpj7KaRsBuoGXjpRZmYbCDcxjJmPgNw2okeWDWdUNeVEHQdRxw+1Cq
 XptZr77bnm7PGSV1HyzaZiuv6SIRL+I4PwuDQHjdrpvUXGamx2WK1e7TSZFWAOhMM1xh
 zTXNcJOLYAY4C70ZZ776eGUScypVlo5+J3gE7NPEUe0qHs7FPpMkcLXEjxU+XLJe3qzJ
 bQkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705076443; x=1705681243;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AXoDO1itquPIC9RJIHRuZv9xrGW2cJyAPsZoJpPFw+4=;
 b=JYKM5iEGs5Fa0k1pgWrBGmO8DCKnXkcMAI+lOfyA/qNlkceyufw0NhbXpZXD3QSrpP
 UizRkrHHdsN0FCtY3c0FqASGW1K0hgmoYy3+0f8QVi6ApzCsKMZ6jG6e3DPezGJmjtyI
 PypwJp/P4+mz9eKPD6jqgBAvIivpvnnIiHQ4rp7orNlSpK0e9Dew/0MnVg+gITduMTa6
 92Ub12pHLQ4qVpPRrGqyGEpiwBARgVVJOa/4n6EENkP07dPFfAM7sR1zWysm+xXB7Tez
 TcjXn9TgQKvVCwBkHnyWvscLcbW8MuOV7iwME2/g8V6keBM4+9F1RIDs56JyHvkjnfH5
 qpkA==
X-Gm-Message-State: AOJu0YyqQUsW5kGQfZXezoydYNUXO1MkQnIInNNoagqFcCxvmd/cTAzs
 xNdfuj4XsZP+u8XUaIZvB4E=
X-Google-Smtp-Source: AGHT+IE54+pPKK6YhmHg0iM9e5UupkHUdB/tKeoGr8eQ2XZMM3dBdNGnw8BrNqPksBRiLQFF6ydb5Q==
X-Received: by 2002:a05:6512:128d:b0:50e:7b9c:8b1a with SMTP id
 u13-20020a056512128d00b0050e7b9c8b1amr697559lfs.95.1705076443029; 
 Fri, 12 Jan 2024 08:20:43 -0800 (PST)
Received: from krava (ip-94-113-247-30.net.vodafone.cz. [94.113.247.30])
 by smtp.gmail.com with ESMTPSA id
 w26-20020a17090652da00b00a1c7b20e9e6sm1931682ejn.32.2024.01.12.08.20.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jan 2024 08:20:42 -0800 (PST)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Fri, 12 Jan 2024 17:20:39 +0100
To: Daniel Xu <dxu@dxuuu.xyz>
Message-ID: <ZaFm13GyXUukcnkm@krava>
References: <cover.1704565248.git.dxu@dxuuu.xyz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1704565248.git.dxu@dxuuu.xyz>
Cc: fsverity@lists.linux.dev, alan.maguire@oracle.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, alexei.starovoitov@gmail.com, memxor@gmail.com,
 coreteam@netfilter.org, netfilter-devel@vger.kernel.org, quentin@isovalent.com,
 linux-kselftest@vger.kernel.org, linux-input@vger.kernel.org,
 cgroups@vger.kernel.org, bpf@vger.kernel.org, olsajiri@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-trace-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH bpf-next v3 0/3] Annotate kfuncs in
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

On Sat, Jan 06, 2024 at 11:24:07AM -0700, Daniel Xu wrote:
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

so the plan is to have bpftool support to generate header file
with detected kfuncs?

jirka

> 
> [0]: https://github.com/danobi/pahole/tree/kfunc_btf-mailed
> 
> === Changelog ===
> 
> Changes from v2:
> * Only WARN() for vmlinux kfuncs
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
>  kernel/bpf/btf.c                              |  8 +++++++
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
>  22 files changed, 81 insertions(+), 60 deletions(-)
> 
> -- 
> 2.42.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
