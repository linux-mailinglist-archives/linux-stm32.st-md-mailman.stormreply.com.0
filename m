Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DD41985D0E1
	for <lists+linux-stm32@lfdr.de>; Wed, 21 Feb 2024 08:08:49 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 87E1AC6B460;
	Wed, 21 Feb 2024 07:08:49 +0000 (UTC)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com
 [209.85.128.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7D368C64102
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Feb 2024 18:22:46 +0000 (UTC)
Received: by mail-yw1-f170.google.com with SMTP id
 00721157ae682-6079d44b02bso36103797b3.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Feb 2024 10:22:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708453365; x=1709058165;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=i4VgqaiLD1cCwXLefBGo8SjydfX7ZBrzgDeYTA69eJQ=;
 b=AD7kB+FU4+rsM9wTgs6ShLN9QQxAmuJtGN9cTYJ7q199/9Y7G4xB4/yCJh8otZP3p9
 NeZudKTNrAPBuPkhKW7nFUzyE4j6iFICmf4z7nc1lNakuabTCArQrFiM/9gsI+MYP/QA
 lzYjsvX5gvA/XA0X38SXtMMCCiHPthBGd3g4ZmjHanrDaMCn7ncXPDuAqaTyMQ8DKu/R
 8nsOGTUB/50emzrNAxtCAYh8kl059zEtf8mWnLigeOnTcJdrLcrh0tuuPt4l4mXnI8JP
 EFxhQnCAR7hoz+oNWcTEUEnDse1xlPs17o5hh2snOXX9HXRGfkP1IP667G+UGGopplKD
 Jvlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708453365; x=1709058165;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=i4VgqaiLD1cCwXLefBGo8SjydfX7ZBrzgDeYTA69eJQ=;
 b=mlqu+YqMI9ZKUNZCwT7o3fiyCIpuG1ZMsrfSVlq+AEXw48vJ+ZjFOEAwHlCjH7PKQP
 nzsz/9iIy3p9528yCxsa4LSDkp4EML3TlFcMFrzo0bVr7LyDHLsHybh45Y5K9MZ0y0En
 5bhdantgV1AUMr+/glRZBAzmAsJNVkfY69hU64DtFr3Wk/NTV6yDpM0zxLTcCT+QPgTN
 Q6mVME0Ca/iukRgnTJucv8O4mMaEHb6Ys7MWxulKgNsK/8piTlBzH1oOZGEfAj5YjOT/
 Ijzinh+0TjxKml2UciIlhJsJzfCbap/Gtf++xyJx7I9mkkgGPsTMZOLigQcuM7mP3Qay
 fQcQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW4pu94inuANHZVfnH6TQOVpzKHuE+yjJymMK62KudCgpa8B3OzXSdqZPHIEd9xCK4EvnujPDzc1NavubNI38WemECYUes4YMUkNBmCOs4VT/O4Dqi4OLak
X-Gm-Message-State: AOJu0YzU2N4sjP/gbO4nxW99gJmuzVUghGb1WodXWqgJLmwJCkgOLI1g
 RwGX73THM2vhr7uAotMzKNe1PAeOEmJUl4hW93r8IDqP9QqUfCNT
X-Google-Smtp-Source: AGHT+IEZTdx2DLd0midbgxnfGt6WCbioJI8bdhOlpDyoqlqQ3M0d7Lmk0qHQUjGZKKZPC9wPSvVeSQ==
X-Received: by 2002:a81:ae13:0:b0:604:7b9e:f622 with SMTP id
 m19-20020a81ae13000000b006047b9ef622mr12385166ywh.30.1708453365121; 
 Tue, 20 Feb 2024 10:22:45 -0800 (PST)
Received: from ?IPV6:2600:1700:6cf8:1240:bb79:f43d:510d:5ec7?
 ([2600:1700:6cf8:1240:bb79:f43d:510d:5ec7])
 by smtp.gmail.com with ESMTPSA id
 c2-20020a0df302000000b006046bd562a5sm2218036ywf.128.2024.02.20.10.22.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Feb 2024 10:22:44 -0800 (PST)
Message-ID: <81431b5d-0e0f-485a-a3ce-af8e63169552@gmail.com>
Date: Tue, 20 Feb 2024 10:22:42 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Menglong Dong <dongmenglong.8@bytedance.com>, andrii@kernel.org
References: <20240220035105.34626-1-dongmenglong.8@bytedance.com>
 <20240220035105.34626-2-dongmenglong.8@bytedance.com>
From: Kui-Feng Lee <sinquersw@gmail.com>
In-Reply-To: <20240220035105.34626-2-dongmenglong.8@bytedance.com>
X-Mailman-Approved-At: Wed, 21 Feb 2024 07:08:48 +0000
Cc: linux-kselftest@vger.kernel.org, davemarchevsky@fb.com, song@kernel.org,
 sdf@google.com, yonghong.song@linux.dev, thinker.li@gmail.com,
 shuah@kernel.org, linux-stm32@st-md-mailman.stormreply.com, mykolal@fb.com,
 daniel@iogearbox.net, john.fastabend@gmail.com, zhoufeng.zf@bytedance.com,
 mcoquelin.stm32@gmail.com, ast@kernel.org, dxu@dxuuu.xyz, kpsingh@kernel.org,
 linux-arm-kernel@lists.infradead.org, haoluo@google.com,
 linux-kernel@vger.kernel.org, eddyz87@gmail.com, jolsa@kernel.org,
 bpf@vger.kernel.org, martin.lau@linux.dev
Subject: Re: [Linux-stm32] [PATCH bpf-next 1/5] bpf: tracing: add support to
 record and check the accessed args
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>



On 2/19/24 19:51, Menglong Dong wrote:
> In this commit, we add the 'accessed_args' field to struct bpf_prog_aux,
> which is used to record the accessed index of the function args in
> btf_ctx_access().
> 
> Meanwhile, we add the function btf_check_func_part_match() to compare the
> accessed function args of two function prototype. This function will be
> used in the following commit.
> 
> Signed-off-by: Menglong Dong <dongmenglong.8@bytedance.com>
> ---
>   include/linux/bpf.h |   4 ++
>   kernel/bpf/btf.c    | 121 ++++++++++++++++++++++++++++++++++++++++++++
>   2 files changed, 125 insertions(+)
> 
> diff --git a/include/linux/bpf.h b/include/linux/bpf.h
> index c7aa99b44dbd..0225b8dbdd9d 100644
> --- a/include/linux/bpf.h
> +++ b/include/linux/bpf.h
> @@ -1464,6 +1464,7 @@ struct bpf_prog_aux {
>   	const struct btf_type *attach_func_proto;
>   	/* function name for valid attach_btf_id */
>   	const char *attach_func_name;
> +	u64 accessed_args;
>   	struct bpf_prog **func;
>   	void *jit_data; /* JIT specific data. arch dependent */
>   	struct bpf_jit_poke_descriptor *poke_tab;
> @@ -2566,6 +2567,9 @@ struct bpf_reg_state;
>   int btf_prepare_func_args(struct bpf_verifier_env *env, int subprog);
>   int btf_check_type_match(struct bpf_verifier_log *log, const struct bpf_prog *prog,
>   			 struct btf *btf, const struct btf_type *t);
> +int btf_check_func_part_match(struct btf *btf1, const struct btf_type *t1,
> +			      struct btf *btf2, const struct btf_type *t2,
> +			      u64 func_args);
>   const char *btf_find_decl_tag_value(const struct btf *btf, const struct btf_type *pt,
>   				    int comp_idx, const char *tag_key);
>   int btf_find_next_decl_tag(const struct btf *btf, const struct btf_type *pt,
> diff --git a/kernel/bpf/btf.c b/kernel/bpf/btf.c
> index 6ff0bd1a91d5..3a6931402fe4 100644
> --- a/kernel/bpf/btf.c
> +++ b/kernel/bpf/btf.c
> @@ -6203,6 +6203,9 @@ bool btf_ctx_access(int off, int size, enum bpf_access_type type,
>   		/* skip first 'void *__data' argument in btf_trace_##name typedef */
>   		args++;
>   		nr_args--;
> +		prog->aux->accessed_args |= (1 << (arg + 1));
> +	} else {
> +		prog->aux->accessed_args |= (1 << arg);
>   	}
>   
>   	if (arg > nr_args) {
> @@ -7010,6 +7013,124 @@ int btf_check_type_match(struct bpf_verifier_log *log, const struct bpf_prog *pr
>   	return btf_check_func_type_match(log, btf1, t1, btf2, t2);
>   }
>   
> +static u32 get_ctx_arg_total_size(struct btf *btf, const struct btf_type *t)
> +{
> +	const struct btf_param *args;
> +	u32 size = 0, nr_args;
> +	int i;
> +
> +	nr_args = btf_type_vlen(t);
> +	args = (const struct btf_param *)(t + 1);
> +	for (i = 0; i < nr_args; i++) {
> +		t = btf_type_skip_modifiers(btf, args[i].type, NULL);
> +		size += btf_type_is_ptr(t) ? 8 : roundup(t->size, 8);
> +	}
> +
> +	return size;
> +}
> +
> +static int get_ctx_arg_idx_aligned(struct btf *btf, const struct btf_type *t,
> +				   int off)
> +{
> +	const struct btf_param *args;
> +	u32 offset = 0, nr_args;
> +	int i;
> +
> +	nr_args = btf_type_vlen(t);
> +	args = (const struct btf_param *)(t + 1);
> +	for (i = 0; i < nr_args; i++) {
> +		if (offset == off)
> +			return i;
> +
> +		t = btf_type_skip_modifiers(btf, args[i].type, NULL);
> +		offset += btf_type_is_ptr(t) ? 8 : roundup(t->size, 8);
> +		if (offset > off)
> +			return -1;
> +	}
> +	return -1;
> +}

This one is very similar to get_ctx_arg_idx().
How about to refactor get_ctx_arg_idx() and share the code
between get_ctx_arg_idx() and get_ctx_arg_idx_aligned().

For example,

-static u32 get_ctx_arg_idx(struct btf *btf, const struct btf_type 
*func_proto,
-                          int off)
+static u32 _get_ctx_arg_idx(struct btf *btf, const struct btf_type 
*func_proto,
+                          int off, u32 *arg_off)
  {
         const struct btf_param *args;
         const struct btf_type *t;
         u32 offset = 0, nr_args;
         int i;

         if (!func_proto)
                 return off / 8;

         nr_args = btf_type_vlen(func_proto);
         args = (const struct btf_param *)(func_proto + 1);
         for (i = 0; i < nr_args; i++) {
+               if (arg_off)
+                       *arg_off = offset;
                 t = btf_type_skip_modifiers(btf, args[i].type, NULL);
                 offset += btf_type_is_ptr(t) ? 8 : roundup(t->size, 8);
                 if (off < offset)
                         return i;
         }

+       if (arg_off)
+               *arg_off = offset;
         t = btf_type_skip_modifiers(btf, func_proto->type, NULL);
         offset += btf_type_is_ptr(t) ? 8 : roundup(t->size, 8);
         if (off < offset)
                 return nr_args;

         return nr_args + 1;
  }

+static u32 get_ctx_arg_idx(struct btf *btf, const struct btf_type 
*func_proto,
+                          int off)
+{
+       return _get_ctx_arg_idx(btf, func_proto, off, NULL);
+}
+
+static u32 get_ctx_arg_idx_aligned(struct btf *btf,
+                                  const struct btf_type *func_proto,
+                                  int off)
+{
+       u32 arg_off;
+       u32 arg_idx = _get_ctx_arg_idx(btf, func_proto, off, &arg_off);
+       return arg_off == off ? arg_idx : -1;
+}
+

> +
> +/* This function is similar to btf_check_func_type_match(), except that it
> + * only compare some function args of the function prototype t1 and t2.
> + */
> +int btf_check_func_part_match(struct btf *btf1, const struct btf_type *func1,
> +			      struct btf *btf2, const struct btf_type *func2,
> +			      u64 func_args)
> +{
> +	const struct btf_param *args1, *args2;
> +	u32 nargs1, i, offset = 0;
> +	const char *s1, *s2;
> +
> +	if (!btf_type_is_func_proto(func1) || !btf_type_is_func_proto(func2))
> +		return -EINVAL;
> +
> +	args1 = (const struct btf_param *)(func1 + 1);
> +	args2 = (const struct btf_param *)(func2 + 1);
> +	nargs1 = btf_type_vlen(func1);
> +
> +	for (i = 0; i <= nargs1; i++) {
> +		const struct btf_type *t1, *t2;
> +
> +		if (!(func_args & (1 << i)))
> +			goto next;
> +
> +		if (i < nargs1) {
> +			int t2_index;
> +
> +			/* get the index of the arg corresponding to args1[i]
> +			 * by the offset.
> +			 */
> +			t2_index = get_ctx_arg_idx_aligned(btf2, func2,
> +							   offset);
> +			if (t2_index < 0)
> +				return -EINVAL;
> +
> +			t1 = btf_type_skip_modifiers(btf1, args1[i].type, NULL);
> +			t2 = btf_type_skip_modifiers(btf2, args2[t2_index].type,
> +						     NULL);
> +		} else {
> +			/* i == nargs1, this is the index of return value of t1 */
> +			if (get_ctx_arg_total_size(btf1, func1) !=
> +			    get_ctx_arg_total_size(btf2, func2))
> +				return -EINVAL;
> +
> +			/* check the return type of t1 and t2 */
> +			t1 = btf_type_skip_modifiers(btf1, func1->type, NULL);
> +			t2 = btf_type_skip_modifiers(btf2, func2->type, NULL);
> +		}
> +
> +		if (t1->info != t2->info ||
> +		    (btf_type_has_size(t1) && t1->size != t2->size))
> +			return -EINVAL;
> +		if (btf_type_is_int(t1) || btf_is_any_enum(t1))
> +			goto next;
> +
> +		if (btf_type_is_struct(t1))
> +			goto on_struct;
> +
> +		if (!btf_type_is_ptr(t1))
> +			return -EINVAL;
> +
> +		t1 = btf_type_skip_modifiers(btf1, t1->type, NULL);
> +		t2 = btf_type_skip_modifiers(btf2, t2->type, NULL);
> +		if (!btf_type_is_struct(t1) || !btf_type_is_struct(t2))
> +			return -EINVAL;
> +
> +on_struct:
> +		s1 = btf_name_by_offset(btf1, t1->name_off);
> +		s2 = btf_name_by_offset(btf2, t2->name_off);
> +		if (strcmp(s1, s2))
> +			return -EINVAL;
> +next:
> +		if (i < nargs1) {
> +			t1 = btf_type_skip_modifiers(btf1, args1[i].type, NULL);
> +			offset += btf_type_is_ptr(t1) ? 8 : roundup(t1->size, 8);
> +		}
> +	}
> +
> +	return 0;
> +}
> +
>   static bool btf_is_dynptr_ptr(const struct btf *btf, const struct btf_type *t)
>   {
>   	const char *name;
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
