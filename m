Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E7E4585C256
	for <lists+linux-stm32@lfdr.de>; Tue, 20 Feb 2024 18:18:35 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9B264C6B45E;
	Tue, 20 Feb 2024 17:18:35 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F132EC6A61D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Feb 2024 17:18:33 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-a3d5e77cfbeso998460666b.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Feb 2024 09:18:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708449513; x=1709054313;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=dmxS6iktBtidz6yGIwqms+MtYfTcC8Gwrx4Li+2LctM=;
 b=UM4FxGfHEAl5nPGhZ1T5KwvmMFwRMrjwF8ICsJrQLVM3B3lIUNKuQHeK6AtQaH2rwg
 DE2ai37cxedT8Q4KjimejLynRw4hbCweWMJy+NA3SPcGRQDPZg4GTejPgBrpWfPcw2hI
 OI/mKC5fgQ2jBklSgIWy62mvJ9fqHOyGGu7/lcE6bZd9YLMeDGgPGVr79WqaHiCt92Qz
 yVqk0+m2Ype5qwTCg3EI5t4H2YT0iiM1WplJYiTTFrZMD1+L45ywUHaFCp49GYNQJ7cK
 JeCl/RRQ7AxtfBENh1RY/3/sNsvjQPVeBDP3X9ZnUdZWOxheTkJI6VuUYpw3pmNFpIwV
 5U3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708449513; x=1709054313;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dmxS6iktBtidz6yGIwqms+MtYfTcC8Gwrx4Li+2LctM=;
 b=Mzx8gSb41wKKMPI+7INGOaLnRu9NbdUPIy6UqtwO0V7KsVhVbqDGK7xNLp8SyeXXPe
 xKt+Qt8vxM4088ZBj0eh2o2klkJ84bst6V+3OieQfzoTRLQig5lyXjQosjvDRhj3Ge0C
 bC1P+YiPiOPtZMtgUCEEruNNTuTI2YYlkLxPJocBrRF4Pg+/VZWBsMg5QOQLO7yFjolg
 IZybz3ZegaC9qOFnnMAkrtxmdx6typU0qIx6oEkp7kRj0w1kPkgpgdVasLcxMmr4klmU
 27x7GnT2r5HhZU/8AWoRmlbj0EdsyJ+/NlUN0YcAS9JYNf7cy7Sp5n1WDtGTNkiT05Rj
 DPbw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUCDNjX880dhDa9QCG7GUyo9cAemzLm/Zt95lZcypti0X0z4PRzT1IdaLolR0yVEM01lFnRLDhHzSnpdYNhg5THRYOd3llhma3gOatkURpOA7zfbigytBdN
X-Gm-Message-State: AOJu0YwlRozJfV8R5xcQVo6pNYZlcs2kVnTpi/kNycCGBTxrJcUhtExP
 84Q9FvQKkn83r/yg0b/vpHrzJgOLouo02mvN4yckdVYuJHUlYNxRgYnDznpW+Vg=
X-Google-Smtp-Source: AGHT+IFcO8MiaoD6Cte2ItgLhV+w9LAMsoeBHZyEn5ZrO/x7ZBnibRjWEqOEGIuYMtJYCpOsxEMCFg==
X-Received: by 2002:a17:906:28d1:b0:a3e:c77a:8100 with SMTP id
 p17-20020a17090628d100b00a3ec77a8100mr4485554ejd.17.1708449513035; 
 Tue, 20 Feb 2024 09:18:33 -0800 (PST)
Received: from krava ([83.240.60.70]) by smtp.gmail.com with ESMTPSA id
 g1-20020a170906c18100b00a3e278c4a3fsm3668349ejz.53.2024.02.20.09.18.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Feb 2024 09:18:32 -0800 (PST)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Tue, 20 Feb 2024 18:18:30 +0100
To: Menglong Dong <dongmenglong.8@bytedance.com>
Message-ID: <ZdTe5pyV16y4wYzv@krava>
References: <20240220035105.34626-1-dongmenglong.8@bytedance.com>
 <20240220035105.34626-3-dongmenglong.8@bytedance.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240220035105.34626-3-dongmenglong.8@bytedance.com>
Cc: yonghong.song@linux.dev, davemarchevsky@fb.com, song@kernel.org,
 sdf@google.com, linux-kselftest@vger.kernel.org, thinker.li@gmail.com,
 shuah@kernel.org, linux-stm32@st-md-mailman.stormreply.com, mykolal@fb.com,
 daniel@iogearbox.net, john.fastabend@gmail.com, andrii@kernel.org,
 zhoufeng.zf@bytedance.com, ast@kernel.org, dxu@dxuuu.xyz, kpsingh@kernel.org,
 linux-arm-kernel@lists.infradead.org, haoluo@google.com,
 linux-kernel@vger.kernel.org, eddyz87@gmail.com, mcoquelin.stm32@gmail.com,
 bpf@vger.kernel.org, martin.lau@linux.dev
Subject: Re: [Linux-stm32] [PATCH bpf-next 2/5] bpf: tracing: support to
 attach program to multi hooks
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

On Tue, Feb 20, 2024 at 11:51:02AM +0800, Menglong Dong wrote:

SNIP

> @@ -3228,7 +3260,9 @@ static int bpf_tracing_prog_attach(struct bpf_prog *prog,
>  	struct bpf_link_primer link_primer;
>  	struct bpf_prog *tgt_prog = NULL;
>  	struct bpf_trampoline *tr = NULL;
> +	struct btf *attach_btf = NULL;
>  	struct bpf_tracing_link *link;
> +	struct module *mod = NULL;
>  	u64 key = 0;
>  	int err;
>  
> @@ -3258,31 +3292,50 @@ static int bpf_tracing_prog_attach(struct bpf_prog *prog,
>  		goto out_put_prog;
>  	}
>  
> -	if (!!tgt_prog_fd != !!btf_id) {
> -		err = -EINVAL;
> -		goto out_put_prog;
> -	}
> -
>  	if (tgt_prog_fd) {
> -		/*
> -		 * For now we only allow new targets for BPF_PROG_TYPE_EXT. If this
> -		 * part would be changed to implement the same for
> -		 * BPF_PROG_TYPE_TRACING, do not forget to update the way how
> -		 * attach_tracing_prog flag is set.
> -		 */
> -		if (prog->type != BPF_PROG_TYPE_EXT) {
> +		if (!btf_id) {
>  			err = -EINVAL;
>  			goto out_put_prog;
>  		}
> -
>  		tgt_prog = bpf_prog_get(tgt_prog_fd);
>  		if (IS_ERR(tgt_prog)) {
> -			err = PTR_ERR(tgt_prog);
>  			tgt_prog = NULL;
> -			goto out_put_prog;
> +			/* tgt_prog_fd is the fd of the kernel module BTF */
> +			attach_btf = btf_get_by_fd(tgt_prog_fd);

I think we should pass the btf_fd through attr, like add
link_create.tracing_btf_fd instead, this seems confusing

> +			if (IS_ERR(attach_btf)) {
> +				attach_btf = NULL;
> +				err = -EINVAL;
> +				goto out_put_prog;
> +			}
> +			if (!btf_is_kernel(attach_btf)) {
> +				btf_put(attach_btf);
> +				err = -EOPNOTSUPP;
> +				goto out_put_prog;
> +			}
> +		} else if (prog->type == BPF_PROG_TYPE_TRACING &&
> +			   tgt_prog->type == BPF_PROG_TYPE_TRACING) {
> +			prog->aux->attach_tracing_prog = true;
>  		}

could you please add comment on why this check is in here?

> -
> -		key = bpf_trampoline_compute_key(tgt_prog, NULL, btf_id);
> +		key = bpf_trampoline_compute_key(tgt_prog, attach_btf,
> +						 btf_id);
> +	} else if (btf_id) {
> +		attach_btf = bpf_get_btf_vmlinux();
> +		if (IS_ERR(attach_btf)) {
> +			attach_btf = NULL;
> +			err = PTR_ERR(attach_btf);
> +			goto out_unlock;
> +		}
> +		if (!attach_btf) {
> +			err = -EINVAL;
> +			goto out_unlock;
> +		}
> +		btf_get(attach_btf);
> +		key = bpf_trampoline_compute_key(NULL, attach_btf, btf_id);
> +	} else {
> +		attach_btf = prog->aux->attach_btf;
> +		/* get the reference of the btf for bpf link */
> +		if (attach_btf)
> +			btf_get(attach_btf);
>  	}
>  
>  	link = kzalloc(sizeof(*link), GFP_USER);
> @@ -3319,7 +3372,7 @@ static int bpf_tracing_prog_attach(struct bpf_prog *prog,
>  	 *   are NULL, then program was already attached and user did not provide
>  	 *   tgt_prog_fd so we have no way to find out or create trampoline
>  	 */
> -	if (!prog->aux->dst_trampoline && !tgt_prog) {
> +	if (!prog->aux->dst_trampoline && !tgt_prog && !btf_id) {
>  		/*
>  		 * Allow re-attach for TRACING and LSM programs. If it's
>  		 * currently linked, bpf_trampoline_link_prog will fail.
> @@ -3346,17 +3399,27 @@ static int bpf_tracing_prog_attach(struct bpf_prog *prog,
>  		 * different from the destination specified at load time, we
>  		 * need a new trampoline and a check for compatibility
>  		 */
> +		struct btf *origin_btf = prog->aux->attach_btf;
>  		struct bpf_attach_target_info tgt_info = {};
>  
> +		/* use the new attach_btf to check the target */
> +		prog->aux->attach_btf = attach_btf;
>  		err = bpf_check_attach_target(NULL, prog, tgt_prog, btf_id,
>  					      &tgt_info);
> +		prog->aux->attach_btf = origin_btf;

could we pass the attach_btf as argument then?

jirka

>  		if (err)
>  			goto out_unlock;
>  
> -		if (tgt_info.tgt_mod) {
> -			module_put(prog->aux->mod);
> -			prog->aux->mod = tgt_info.tgt_mod;
> -		}
> +		mod = tgt_info.tgt_mod;
> +		/* the new target and the previous target are in the same
> +		 * module, release the reference once.
> +		 */
> +		if (mod && mod == prog->aux->mod)
> +			module_put(mod);
> +		err = bpf_tracing_check_multi(prog, tgt_prog, attach_btf,
> +					      tgt_info.tgt_type);
> +		if (err)
> +			goto out_unlock;
>  
>  		tr = bpf_trampoline_get(key, &tgt_info);
>  		if (!tr) {
> @@ -3373,6 +3436,7 @@ static int bpf_tracing_prog_attach(struct bpf_prog *prog,
>  		 */
>  		tr = prog->aux->dst_trampoline;
>  		tgt_prog = prog->aux->dst_prog;
> +		mod = prog->aux->mod;
>  	}
>  
>  	err = bpf_link_prime(&link->link.link, &link_primer);
> @@ -3388,6 +3452,8 @@ static int bpf_tracing_prog_attach(struct bpf_prog *prog,
>  
>  	link->tgt_prog = tgt_prog;
>  	link->trampoline = tr;
> +	link->attach_btf = attach_btf;
> +	link->mod = mod;
>  
>  	/* Always clear the trampoline and target prog from prog->aux to make
>  	 * sure the original attach destination is not kept alive after a
> @@ -3400,20 +3466,27 @@ static int bpf_tracing_prog_attach(struct bpf_prog *prog,
>  	if (prog->aux->dst_trampoline && tr != prog->aux->dst_trampoline)
>  		/* we allocated a new trampoline, so free the old one */
>  		bpf_trampoline_put(prog->aux->dst_trampoline);
> +	if (prog->aux->mod && mod != prog->aux->mod)
> +		/* the mod in prog is not used anywhere, move it to link */
> +		module_put(prog->aux->mod);
>  
>  	prog->aux->dst_prog = NULL;
>  	prog->aux->dst_trampoline = NULL;
> +	prog->aux->mod = NULL;
>  	mutex_unlock(&prog->aux->dst_mutex);
>  
>  	return bpf_link_settle(&link_primer);
>  out_unlock:
>  	if (tr && tr != prog->aux->dst_trampoline)
>  		bpf_trampoline_put(tr);
> +	if (mod && mod != prog->aux->mod)
> +		module_put(mod);
>  	mutex_unlock(&prog->aux->dst_mutex);
>  	kfree(link);
>  out_put_prog:
>  	if (tgt_prog_fd && tgt_prog)
>  		bpf_prog_put(tgt_prog);
> +	btf_put(attach_btf);
>  	return err;
>  }
>  
> -- 
> 2.39.2
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
