Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 27ABD8240CD
	for <lists+linux-stm32@lfdr.de>; Thu,  4 Jan 2024 12:41:56 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CD174C6B476;
	Thu,  4 Jan 2024 11:41:55 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3BD64C65E56
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  4 Jan 2024 11:41:55 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id
 4fb4d7f45d1cf-55539cac143so515896a12.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 04 Jan 2024 03:41:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704368514; x=1704973314;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=li47kl6w5F7Kdkk2+B7xCgguinxHCXOI6fH+waqV0VM=;
 b=cpTIks8kd6KqLShS9I5pJE9ChuN6i2+0zCTbrPqg8EG4yUVoq2ZYcZCxvY/I0gilnL
 4bLIOci4g9ELic0Qs9tHCt5TsZNs69mo/CHJCW8P4gneHH8STxBibBHMuqiaaCmOCB/o
 eIIR2VEhUJVj/UrdXC3zy76d5ZBaM62NH6agmsmqgYdspdI1D4J8X63gqDb4ddGMf/Ff
 jBQ00uUSisvn/GAIBvVhuxxRq9ndntzXWrnGelV+M5aiedVSuF5sClvv+EVOZX5nvrwg
 dCXDTYd0naHs/H5re/FyYXbRzygOu1eareuO7m3ELAerQYyVCkdk6mwkYYqV91nD6HjR
 TXaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704368514; x=1704973314;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=li47kl6w5F7Kdkk2+B7xCgguinxHCXOI6fH+waqV0VM=;
 b=FW20hUFEUXY9gyaiw/hX/b4vML2peNfJAJY4dQqqkchtkTr+YFrE6vzYi+Qs7Hd54e
 rCI8w/k45BqpP/9P68yNQpUAGDPYPq09O1jGowyNjf+jnaNR92orerDMutb7WalgXKjT
 qmP19qUyKxg7EgFWsR0PcfKD+shS2uJt/l4KfXd9Sh2AqAXFOGDXUTLB9y+ehRNQO+jK
 Ajqfzqkgs8rUduJ/jvqg3zH85wJvmZRcN8kx3rKD5/8uVD55TKhvuOhn8ZOpRAGeEjs7
 ApxRulu2+JtWUsY4083fPuHZp9lPxcGu0KiNgVm0xvoYNIforbTAOG1mMFRoBrp695he
 eusA==
X-Gm-Message-State: AOJu0YzRbeWoqYm6rF7TjZrXpVYLnteTZVJAcPehkG9+AKL6vfDCLNJy
 p2HNGzxHZsUP47/cqT3E3BE=
X-Google-Smtp-Source: AGHT+IFrFEjJWJoSGpDPpDjTuLdY+CFN4tGrhsg3QTmtjCcI4AMtsTnvEFP18v2XfpFjbFbUiq++MA==
X-Received: by 2002:a17:906:231a:b0:a28:b774:62d9 with SMTP id
 l26-20020a170906231a00b00a28b77462d9mr261239eja.62.1704368514369; 
 Thu, 04 Jan 2024 03:41:54 -0800 (PST)
Received: from krava (2001-1ae9-1c2-4c00-726e-c10f-8833-ff22.ip6.tmcz.cz.
 [2001:1ae9:1c2:4c00:726e:c10f:8833:ff22])
 by smtp.gmail.com with ESMTPSA id
 o16-20020a170906601000b00a26dc8ec78dsm10999304ejj.147.2024.01.04.03.41.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Jan 2024 03:41:54 -0800 (PST)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Thu, 4 Jan 2024 12:41:51 +0100
To: Daniel Xu <dxu@dxuuu.xyz>
Message-ID: <ZZaZf_8RuX2xqZGf@krava>
References: <cover.1704324602.git.dxu@dxuuu.xyz>
 <68d5598e5708dfe3370406cd5c946565ca4b50f1.1704324602.git.dxu@dxuuu.xyz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <68d5598e5708dfe3370406cd5c946565ca4b50f1.1704324602.git.dxu@dxuuu.xyz>
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
Subject: Re: [Linux-stm32] [PATCH bpf-next 2/2] bpf: treewide: Annotate BPF
	kfuncs in BTF
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

On Wed, Jan 03, 2024 at 04:31:56PM -0700, Daniel Xu wrote:

SNIP

> diff --git a/include/linux/btf_ids.h b/include/linux/btf_ids.h
> index 88f914579fa1..771e29762a2d 100644
> --- a/include/linux/btf_ids.h
> +++ b/include/linux/btf_ids.h
> @@ -8,6 +8,9 @@ struct btf_id_set {
>  	u32 ids[];
>  };
>  
> +/* This flag implies BTF_SET8 holds kfunc(s) */
> +#define BTF_SET8_KFUNC		(1 << 0)
> +
>  struct btf_id_set8 {
>  	u32 cnt;
>  	u32 flags;
> diff --git a/kernel/bpf/btf.c b/kernel/bpf/btf.c
> index 51e8b4bee0c8..b8ba00a4179f 100644
> --- a/kernel/bpf/btf.c
> +++ b/kernel/bpf/btf.c
> @@ -7769,6 +7769,9 @@ static int __register_btf_kfunc_id_set(enum btf_kfunc_hook hook,
>  	struct btf *btf;
>  	int ret, i;
>  
> +	/* All kfuncs need to be tagged as such in BTF */
> +	WARN_ON(!(kset->set->flags & BTF_SET8_KFUNC));

__register_btf_kfunc_id_set gets called also from the 'hooks' path:

  bpf_mptcp_kfunc_init
    register_btf_fmodret_id_set
      __register_btf_kfunc_id_set

so it will hit the warn.. it should be probably in the register_btf_kfunc_id_set ?

also given that we can have modules calling register_btf_kfunc_id_set,
should we just return error instead of the warn?

SNIP

> diff --git a/tools/testing/selftests/bpf/bpf_testmod/bpf_testmod.c b/tools/testing/selftests/bpf/bpf_testmod/bpf_testmod.c
> index 91907b321f91..32972334cd50 100644
> --- a/tools/testing/selftests/bpf/bpf_testmod/bpf_testmod.c
> +++ b/tools/testing/selftests/bpf/bpf_testmod/bpf_testmod.c
> @@ -341,7 +341,7 @@ static struct bin_attribute bin_attr_bpf_testmod_file __ro_after_init = {
>  	.write = bpf_testmod_test_write,
>  };
>  
> -BTF_SET8_START(bpf_testmod_common_kfunc_ids)
> +BTF_SET8_START(bpf_testmod_common_kfunc_ids, BTF_SET8_KFUNC)
>  BTF_ID_FLAGS(func, bpf_iter_testmod_seq_new, KF_ITER_NEW)
>  BTF_ID_FLAGS(func, bpf_iter_testmod_seq_next, KF_ITER_NEXT | KF_RET_NULL)
>  BTF_ID_FLAGS(func, bpf_iter_testmod_seq_destroy, KF_ITER_DESTROY)

we need to change also bpf_testmod_check_kfunc_ids set

jirka

> -- 
> 2.42.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
