Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 655AA843B65
	for <lists+linux-stm32@lfdr.de>; Wed, 31 Jan 2024 10:47:51 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 15F15C6C841;
	Wed, 31 Jan 2024 09:47:51 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AC01EC65E4C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 31 Jan 2024 09:47:49 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id
 4fb4d7f45d1cf-55f8abbeeddso416656a12.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 31 Jan 2024 01:47:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706694469; x=1707299269;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/O9XgRbkcBJVk7UwNZF0sbS5DqjZwvxc08GdgHW/6js=;
 b=QwJvc5Jx/YfvuxtwHbrYmjGBFvaYQ/EbXJ+wAQ9mH+7rIWuTfGUdLSn+S7QUMdDShE
 QGlmDhXokUnNksZwFXSrlUwDolBQbCQRp0PLIf8W1i32tx7FZyX/zklFu7RFjaehOMb9
 2tum9PFLGy+YWSsSVoFSNpe5LdQNZVrq4Oc+iT0aQrkgs0hQQsQmZ35NOnMhoksVj9yx
 XWquyNu/ihNQNlp8uOzF3QcSREm+nXpfoZRa/eYv0GCyFD3I4bpaU8OYFjP6h9omcUWl
 ElDgjQUwoViN50r+JzzP55Nefs12feA7O/AGJNx9mwjJGptxa4NzGCLLiG7CiItTTeAt
 6+tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706694469; x=1707299269;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/O9XgRbkcBJVk7UwNZF0sbS5DqjZwvxc08GdgHW/6js=;
 b=XVtQM/MtOVM7I/yUZkEufQg3fF6mMkWzUSSdRESQgrYY+voy4YisMNoj91zXcwKENR
 fouuRahLKO9kqWxaDSwlcTwJdb7Rca/t+OK9dUSuI5CKFqjyLpYemQk09hFbL9C6Q82K
 bEklaBFYCjZ9KLX7AI9JUTs3vnE9qLpFLSKl2GA86mKU/T0j783QNGWYRvv02Kl81dZ7
 bVL2mPrMsd6y56AcTS6ZIb+hlYw6hjjvnywTyyTfz2o6sJZgWYwmLuPt1IB/kBuz/hX3
 t+6EFLom/EBhvd5ATOWIubQnpG5rsXoHGIKMKzT+iNsBLXWbuRaSYsBmqj5qWS2oZdje
 INFA==
X-Gm-Message-State: AOJu0YwSP4Q4xVKrWXj3n2jWGnr/KMtwl0/mPWktxhoWFVpM19hVFrvK
 GA59DOXgSbDqGBXGBHpxujDgOiAIDYZGhW6rTG6+QHtTvtCQboou
X-Google-Smtp-Source: AGHT+IG7soa47inYZ5qRD0y2IAxLTuYubf/We9SppnGjsvKB6J8PYmZ+J/JIhIYIFJ4eW+ahV6p0bw==
X-Received: by 2002:aa7:d3da:0:b0:55f:4d7e:e4e9 with SMTP id
 o26-20020aa7d3da000000b0055f4d7ee4e9mr677420edr.21.1706694468728; 
 Wed, 31 Jan 2024 01:47:48 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCWiQ74i0rflV78kHDD47By+VknL25M/waMOcUseNfD20dtrpXOOs6Ao+gTVaS8DbJxsRAeqz0D74nt/JzPKas4fElzSMHU34w5JZzRUGMeCAfihCbaCTiQtK30VNQHIpMClOh/RhgzoLzRD/c1G/GVg0n2Xq1yaP8QSGbquEojq3tT0Ngp9tgp1T6NjSPqpuhw4DhU9xq79sMBc5xVg7kfNgh4MfGP1W3tMOXWVvEe5W0CC5fKzqDdHHTTGS1QOI9O9mpkOaAG0lC3hMGyOu6hJjVOqkDF2AtMfPuS4xMj7fCJjzvqm+cUx7U68p5sHDS08r2ExD56T3alGKXX+JFF294bvkxPJwLkg3PUtv/w5GuijywP9P340TIWpJOibm28GzcD4n7N3R2cWhzhCC1ZRuTsBrBzZlEdQDW2w0kXXeNOVnMvePqRJBle9+Wy7OIKJquy1qbLmRF4/H25zBeTsCAH4Wy9nyUOXN8pxxvIVX7wTkzS+UhPMdncPI31/9xJnRQ52G7Mwr6HgtzhnzFvpG8wDV4yMM1b/N6zfStQBk29H6BbZcak5QEGndd41sRMDxxRDBmN3rlsn5DHQVqMqSulzElZgC/jBr455JmuklDm8/pD/zLy/KjDHB+xhJTLEPbpfOgfZCZyVWspgqXl5Dx0u3G27UtAUjenX6FjpCzau
Received: from krava (2001-1ae9-1c2-4c00-726e-c10f-8833-ff22.ip6.tmcz.cz.
 [2001:1ae9:1c2:4c00:726e:c10f:8833:ff22])
 by smtp.gmail.com with ESMTPSA id
 h11-20020aa7c94b000000b00558a3268bbcsm5651569edt.53.2024.01.31.01.47.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Jan 2024 01:47:48 -0800 (PST)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Wed, 31 Jan 2024 10:47:46 +0100
To: Daniel Xu <dxu@dxuuu.xyz>
Message-ID: <ZboXQmsg6fO-qaNu@krava>
References: <cover.1706491398.git.dxu@dxuuu.xyz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1706491398.git.dxu@dxuuu.xyz>
Cc: fsverity@lists.linux.dev, alan.maguire@oracle.com,
 linux-doc@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, alexei.starovoitov@gmail.com, memxor@gmail.com,
 coreteam@netfilter.org, netfilter-devel@vger.kernel.org, quentin@isovalent.com,
 linux-kselftest@vger.kernel.org, linux-input@vger.kernel.org,
 cgroups@vger.kernel.org, bpf@vger.kernel.org, olsajiri@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-trace-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH bpf-next v4 0/3] Annotate kfuncs in
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

On Sun, Jan 28, 2024 at 06:24:05PM -0700, Daniel Xu wrote:
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
> The accompanying pahole and bpftool changes can be viewed
> here on these "frozen" branches [0][1].
> 
> [0]: https://github.com/danobi/pahole/tree/kfunc_btf-v3-mailed
> [1]: https://github.com/danobi/linux/tree/kfunc_bpftool-mailed
> 
> === Changelog ===
> 
> Changes from v3:
> * Rebase to bpf-next and add missing annotation on new kfunc

Acked-by: Jiri Olsa <jolsa@kernel.org>

jirka

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
>  Documentation/bpf/kfuncs.rst                  |  8 +++----
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
>  net/core/filter.c                             | 20 +++++++++---------
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
>  23 files changed, 87 insertions(+), 66 deletions(-)
> 
> -- 
> 2.42.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
