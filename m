Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 97F3582565D
	for <lists+linux-stm32@lfdr.de>; Fri,  5 Jan 2024 16:11:40 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3F7EEC6C83C;
	Fri,  5 Jan 2024 15:11:40 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
 [209.85.208.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D4BF8C6B45B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 Jan 2024 15:11:38 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id
 38308e7fff4ca-2cd0c17e42bso19742771fa.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 05 Jan 2024 07:11:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704467498; x=1705072298;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0jvwWQN/4UcpzgDB9Dn1kP+j0A1/ex5/bFC8KQNDn3Y=;
 b=fjfQq/olIf7EmoZvfdDFLXh6BFYb8K/c/UVPzZulKhU9xZRMXX1DwemaNKWA44TM7h
 s5oZbR7rkP6YoXl9r+puNu52eoUUO2ZMNYEeh2kUUrkLSAxBJDJro4Wsq9SDzDJCBpTo
 9D/FNiprWt1elQ83RJbLXuV6AsjE1sEz45V7lYYdTjkLLOzorSfcA8VGeKH7hhkORAiS
 jKl1TlIqhCh71tdP7QhfYvYgdHe+B1bCsziuwmr+a0kbf3Gp8hKqibLOYz1YmhllwKdr
 5X010uWmUImPfFbgqVe940zhl0RihQGOAUNN5NDwXOHWu8sOIy01I7XwRfjL7xShW2zj
 STDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704467498; x=1705072298;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0jvwWQN/4UcpzgDB9Dn1kP+j0A1/ex5/bFC8KQNDn3Y=;
 b=IBp8THP32M7e6l4kgFXYWvqOT8lstQDHLwcXRQa2xdJfEcx0Jp2dNNqebmlNXkfyYj
 ybUJLpaFMMaoVIVTmJlDnVVf5FdXcl2rrCxSaSsnDKnhzBChfoXIAICAb193y2/bbdX3
 XfKe66AxInwo1ar2jPf7r8wrzbU3WVQssQAkEnTOPkm7dHNxbCZsIB0pXFUDN7zfh/MG
 lKfHQ42VXca21x0/51C2NNFl6hCRru2/Bt2YMI29pELlf3v9PRB0HUAR1N+pcymTjuf+
 tslGg2Soq68zOATxW81mmcJLyZgk8XKuo//bpFHl15np9BAGnMKQZVy3CwrIFyLCoQNk
 fraQ==
X-Gm-Message-State: AOJu0YzQQKU47/MdzmpYrkwCGlBjmRtz+t7afR0nJeGWd4/cFLX08157
 0Yb4eQyMoyp5aUsot2xAtg8=
X-Google-Smtp-Source: AGHT+IFfGsd7OhjOyharZSVfOb2cwd7D3hSDlT4qWYQ2gJAsNlPcjNmo0EWFSODi+SQP2gAcMZ+9jA==
X-Received: by 2002:ac2:58e3:0:b0:50e:3714:b420 with SMTP id
 v3-20020ac258e3000000b0050e3714b420mr959191lfo.9.1704467497642; 
 Fri, 05 Jan 2024 07:11:37 -0800 (PST)
Received: from krava (2001-1ae9-1c2-4c00-726e-c10f-8833-ff22.ip6.tmcz.cz.
 [2001:1ae9:1c2:4c00:726e:c10f:8833:ff22])
 by smtp.gmail.com with ESMTPSA id
 b1-20020a170906490100b00a26b36311ecsm986048ejq.146.2024.01.05.07.11.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jan 2024 07:11:36 -0800 (PST)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Fri, 5 Jan 2024 16:11:33 +0100
To: Daniel Xu <dxu@dxuuu.xyz>
Message-ID: <ZZgcJTdwMZHglPtr@krava>
References: <cover.1704422454.git.dxu@dxuuu.xyz>
 <a923e3809955bdfd2bc8d6a103c20e01f1636dbc.1704422454.git.dxu@dxuuu.xyz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a923e3809955bdfd2bc8d6a103c20e01f1636dbc.1704422454.git.dxu@dxuuu.xyz>
Cc: yonghong.song@linux.dev, linux-stm32@st-md-mailman.stormreply.com,
 song@kernel.org, edumazet@google.com, benjamin.tissoires@redhat.com,
 sdf@google.com, lizefan.x@bytedance.com, netdev@vger.kernel.org,
 shuah@kernel.org, alexei.starovoitov@gmail.com, steffen.klassert@secunet.com,
 mykolal@fb.com, Herbert Xu <herbert@gondor.apana.org.au>, daniel@iogearbox.net,
 john.fastabend@gmail.com, andrii@kernel.org, kadlec@netfilter.org,
 ebiggers@kernel.org, quentin@isovalent.com, linux-input@vger.kernel.org,
 kuba@kernel.org, pabeni@redhat.com, pablo@netfilter.org,
 linux-trace-kernel@vger.kernel.org, coreteam@netfilter.org, hawk@kernel.org,
 jikos@kernel.org, rostedt@goodmis.org, ast@kernel.org,
 mathieu.desnoyers@efficios.com, memxor@gmail.com, kpsingh@kernel.org,
 cgroups@vger.kernel.org, olsajiri@gmail.com,
 linux-arm-kernel@lists.infradead.org, fsverity@lists.linux.dev,
 haoluo@google.com, linux-kselftest@vger.kernel.org, tytso@mit.edu,
 alan.maguire@oracle.com, dsahern@kernel.org, fw@strlen.de,
 linux-kernel@vger.kernel.org, netfilter-devel@vger.kernel.org,
 mhiramat@kernel.org, mcoquelin.stm32@gmail.com, hannes@cmpxchg.org,
 tj@kernel.org, bpf@vger.kernel.org, martin.lau@linux.dev, davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH bpf-next v2 3/3] bpf: treewide: Annotate
	BPF kfuncs in BTF
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

On Thu, Jan 04, 2024 at 07:45:49PM -0700, Daniel Xu wrote:

SNIP

> diff --git a/fs/verity/measure.c b/fs/verity/measure.c
> index bf7a5f4cccaf..3969d54158d1 100644
> --- a/fs/verity/measure.c
> +++ b/fs/verity/measure.c
> @@ -159,9 +159,9 @@ __bpf_kfunc int bpf_get_fsverity_digest(struct file *file, struct bpf_dynptr_ker
>  
>  __bpf_kfunc_end_defs();
>  
> -BTF_SET8_START(fsverity_set_ids)
> +BTF_KFUNCS_START(fsverity_set_ids)
>  BTF_ID_FLAGS(func, bpf_get_fsverity_digest, KF_TRUSTED_ARGS)
> -BTF_SET8_END(fsverity_set_ids)
> +BTF_KFUNCS_END(fsverity_set_ids)
>  
>  static int bpf_get_fsverity_digest_filter(const struct bpf_prog *prog, u32 kfunc_id)
>  {
> diff --git a/kernel/bpf/btf.c b/kernel/bpf/btf.c
> index 51e8b4bee0c8..8cc718f37a9d 100644
> --- a/kernel/bpf/btf.c
> +++ b/kernel/bpf/btf.c
> @@ -7802,6 +7802,10 @@ int register_btf_kfunc_id_set(enum bpf_prog_type prog_type,
>  {
>  	enum btf_kfunc_hook hook;
>  
> +	/* All kfuncs need to be tagged as such in BTF */
> +	if (WARN_ON(!(kset->set->flags & BTF_SET8_KFUNCS)))
> +		return -EINVAL;

having the warning for module with wrong set8 flags seems wrong to me,
I think we should trigger the warn only for kernel calls.. by adding
kset->owner check in the condition above

jirka

> +
>  	hook = bpf_prog_type_to_kfunc_hook(prog_type);
>  	return __register_btf_kfunc_id_set(hook, kset);
>  }

SNIP
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
