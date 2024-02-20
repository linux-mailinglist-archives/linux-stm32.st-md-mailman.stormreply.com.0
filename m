Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E146685C25A
	for <lists+linux-stm32@lfdr.de>; Tue, 20 Feb 2024 18:18:45 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A7648C6B45E;
	Tue, 20 Feb 2024 17:18:45 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C0A76C6A61D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Feb 2024 17:18:43 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id
 4fb4d7f45d1cf-563f675be29so5187231a12.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Feb 2024 09:18:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708449523; x=1709054323;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2jsimXL4CWxMWFytJ0GOuQvmJcBH3su7G6flKHH6vaI=;
 b=HxnWb6PgTV7Vkh+VkV5rl8Fl1H59X3vyfpTM99/QDp0CPwU+Y2FmOdQiGm6sAzvzQb
 zErp/y3/7oPuUK4YZvykbG4KuUzffOSufFyDjBkqQTugSChmsSaS+nCbwqzB7ZH8Nquy
 9/rT7z/Q9rjbzjiKdVL7xwDx+0PuMus+6kmyQYF8rhm+0zgr3f+CQOVK580a0amgoger
 5hLnHRGO0sfYQZnpG0c2evD5NKFZdolfI59m6txk1HJ0iuB+q3b+11gLEjE6ixpbC4R9
 SNq2N4rq52tnJxj3q8th+xQlP0RemCbYVoQfW7fsV8fUe/tTfv3uB5zZLyq1OfmwqrRp
 AqfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708449523; x=1709054323;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2jsimXL4CWxMWFytJ0GOuQvmJcBH3su7G6flKHH6vaI=;
 b=n8jcWwMNsEo3CS2xi/qFMDEh3MIiOB2ECR6kiHhJIR8MUkupVTWOPWomSgj4oU5EW5
 Z/Wz1b0Ea3coMSFNjA+6XQetZCK4CoXvQEeE+VwgymwZgJT7YMbaIBB2gVyRmYVLULBO
 CXq+nyP/ZhJ6OJft7hFBtueGvMzz/3XIU9+r8n7pPD8yqZFaj4KAI/3CtnSjjDbvm4Lx
 cG3sFioQ4yIrlIm9bqrzQAIHdktDIEnaDAIOYfTwHwwWxw3O7jGQEi+DBFHF2zogUivt
 JmbqwI1kIyUoQhvyp/aU/pfs2W0PREBkZRLwQh9W3LYsBveU+pcPfGzXrUSW7oOlIXSL
 Jyig==
X-Forwarded-Encrypted: i=1;
 AJvYcCWOWsZjhYSBBfUHjV6e9yfn/hOuZJBH1xDA2zkP9rIpRd3wW4xARuZWUevzQ8yeD8nwFPPvhMG0Y1qaCqhTZywDWkX6CEm5yDpvV6AFQXV4n6/ydhNmCY28
X-Gm-Message-State: AOJu0Yz6BJDJxKflANQsLJ+qOtCXxnER5yFi09iQzNGPuPqMFt9t/JiH
 l8Ac4oFhVGtxHZs2DuaMgze6eNcYw8K7j1tONADfUELCZQfFH2WX
X-Google-Smtp-Source: AGHT+IHc0pN9KHkKeb7luanourVgNNVzQPzVIAPQ4poYAK/bHeBaBBTbjvPtzX2mIiyI/iKaLuo4xQ==
X-Received: by 2002:aa7:db49:0:b0:564:a76b:aa55 with SMTP id
 n9-20020aa7db49000000b00564a76baa55mr2426459edt.12.1708449523138; 
 Tue, 20 Feb 2024 09:18:43 -0800 (PST)
Received: from krava ([83.240.60.70]) by smtp.gmail.com with ESMTPSA id
 ew14-20020a056402538e00b005602346c3f5sm3823732edb.79.2024.02.20.09.18.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Feb 2024 09:18:42 -0800 (PST)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Tue, 20 Feb 2024 18:18:40 +0100
To: Menglong Dong <dongmenglong.8@bytedance.com>
Message-ID: <ZdTe8LteoqR43d4q@krava>
References: <20240220035105.34626-1-dongmenglong.8@bytedance.com>
 <20240220035105.34626-2-dongmenglong.8@bytedance.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240220035105.34626-2-dongmenglong.8@bytedance.com>
Cc: yonghong.song@linux.dev, davemarchevsky@fb.com, song@kernel.org,
 sdf@google.com, linux-kselftest@vger.kernel.org, thinker.li@gmail.com,
 shuah@kernel.org, linux-stm32@st-md-mailman.stormreply.com, mykolal@fb.com,
 daniel@iogearbox.net, john.fastabend@gmail.com, andrii@kernel.org,
 zhoufeng.zf@bytedance.com, ast@kernel.org, dxu@dxuuu.xyz, kpsingh@kernel.org,
 linux-arm-kernel@lists.infradead.org, haoluo@google.com,
 linux-kernel@vger.kernel.org, eddyz87@gmail.com, mcoquelin.stm32@gmail.com,
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On Tue, Feb 20, 2024 at 11:51:01AM +0800, Menglong Dong wrote:

SNIP

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
> +
> +/* This function is similar to btf_check_func_type_match(), except that it
> + * only compare some function args of the function prototype t1 and t2.
> + */

could we reuse btf_check_func_type_match instead? perhaps just
adding extra argument with arguments bitmap to it?

jirka

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
>  static bool btf_is_dynptr_ptr(const struct btf *btf, const struct btf_type *t)
>  {
>  	const char *name;
> -- 
> 2.39.2
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
