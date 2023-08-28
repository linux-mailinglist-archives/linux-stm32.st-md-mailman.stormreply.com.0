Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D174778B3AA
	for <lists+linux-stm32@lfdr.de>; Mon, 28 Aug 2023 16:52:15 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6C4DBC6B47D;
	Mon, 28 Aug 2023 14:52:15 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9B2D8C6A617
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Aug 2023 13:54:22 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-31c5a2e8501so2753503f8f.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Aug 2023 06:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693230862; x=1693835662;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=VDmYVoW7p8nt38CD6BvN3r9xzwRS5n00QRgr4Mi9/VU=;
 b=gh19/ymTWEypbg+l+oO/hboSV74tUyLQ0AC8+z/dSbPcrdsdoAEIFf1tJGhznWzcC4
 22hoUj9kwlKuIPRkPWFiWqDC43IwjqblEsJsw7kuScda0OX/mb3/SWWdBP8x8XEBbSul
 U7/iUmCNv/1u29JCo4OrYvzVo/8AeGkcW7nkQTdKKx/dW2PNh6Dt8uOlRfdtiMFTXSnz
 EyYEcLfWXsFNLfoYuyT/Ol0dwn6HUURaQykY7kKzQAXQOu8PqbnBIK973YdW8M5Kqbs9
 ST3lt338LPkp927J5DZb2+nV08aGccoX9hay9v7r5MfefAn/+8ml1hEVVhqwdIGQE+sX
 UXsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693230862; x=1693835662;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VDmYVoW7p8nt38CD6BvN3r9xzwRS5n00QRgr4Mi9/VU=;
 b=GOptnBFJOyilC0rXUM75xiLrdueGetS1jT4UiPp093J6Oq51r1eclKbaw2MD5EXHZB
 gvCHV9rm0oG1BrR56ByxSYiTW8zOuoW+Vi18uVAYM3k2vs67Ut3vaQFdJ2xG/YLRFEF4
 JiJ9pKZUvybY+vjx5QtQ4Px6aSmCJspl+J9YOYB+5arE71PWGlsnAH4UDuQQAsqthkcW
 xqcD25Dj61768jOuAh0yxACFj5CZPdk+uceMKH8+v56jFqoNcbeA1pKn5+v7qdsY4CiZ
 eS6n4d3EC+XYOhYILkQWqNyJp4Q/sqo5TQwTTPlJY6xBgY9QD0LwEakhiDOSvgX/hBmw
 i3/g==
X-Gm-Message-State: AOJu0YwWTuUiq39Wz0lLCZQ4j62onH6rFibemersLekKSg7aTZAmE9jB
 HI+yLG7IuEjI3TEIS6355Xc=
X-Google-Smtp-Source: AGHT+IG95nW6xPk0zV6WB4OItUlDjsx3dUBybv6nT1PqBfrGNAkcz36bK6VacMecutGOK5zkit30bA==
X-Received: by 2002:adf:ce8e:0:b0:313:ef24:6fe6 with SMTP id
 r14-20020adfce8e000000b00313ef246fe6mr20110183wrn.1.1693230861671; 
 Mon, 28 Aug 2023 06:54:21 -0700 (PDT)
Received: from krava ([83.240.61.245]) by smtp.gmail.com with ESMTPSA id
 bf8-20020a0564021a4800b00529fb5fd3b9sm4478223edb.80.2023.08.28.06.54.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Aug 2023 06:54:21 -0700 (PDT)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Mon, 28 Aug 2023 15:54:18 +0200
To: Rong Tao <rtoax@foxmail.com>
Message-ID: <ZOynCqBv/JJyZ2Kj@krava>
References: <ZOsZwQptH05Gn9yU@krava>
 <tencent_D53295A257B55119C425836EA19E2CE84B07@qq.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <tencent_D53295A257B55119C425836EA19E2CE84B07@qq.com>
X-Mailman-Approved-At: Mon, 28 Aug 2023 14:52:13 +0000
Cc: yonghong.song@linux.dev, chantr4@gmail.com, ast@kernel.org, song@kernel.org,
 laoar.shao@gmail.com, rongtao@cestc.cn, linux-kselftest@vger.kernel.org,
 deso@posteo.net, xukuohai@huawei.com, shuah@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, mykolal@fb.com, iii@linux.ibm.com,
 daniel@iogearbox.net, john.fastabend@gmail.com, andrii@kernel.org,
 zwisler@google.com, kpsingh@kernel.org, olsajiri@gmail.com,
 linux-arm-kernel@lists.infradead.org, haoluo@google.com,
 linux-kernel@vger.kernel.org, eddyz87@gmail.com, mcoquelin.stm32@gmail.com,
 bpf@vger.kernel.org, martin.lau@linux.dev, sdf@google.com
Subject: Re: [Linux-stm32] [PATCH bpf-next v8] selftests/bpf:
 trace_helpers.c: optimize kallsyms cache
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

On Mon, Aug 28, 2023 at 08:57:21AM +0800, Rong Tao wrote:
> Hi, jirka. Thanks for your reply.
> 
> > > @@ -164,13 +165,14 @@ int main(int argc, char **argv)
> > >  	}
> > >  
> > >  	/* initialize kernel symbol translation */
> > > -	if (load_kallsyms()) {
> > > +	ksyms = load_kallsyms();
> > 
> > if we keep the load_kallsyms/ksym_search/ksym_get_addr functions as described
> > in [1] the samples/bpf would stay untouched apart from the Makefile change
> 
> Maybe we should make this modification, wouldn't it be better? After all,
> not modifying the source code of samples/bpf is not really a reason not to
> make modifications to load_kallsyms(), what do you think?

I think we want separate selftest and samples changes and I don't see
other way to do that

> 
> In addition, if we continue to keep the original ksym_search() interface,
> the following problems are very difficult to deal with:
> 
> 	Source code ksym_search [1]
> 
>     struct ksym *ksym_search(long key)
>     {
>     	int start = 0, end = sym_cnt;
>     	int result;
>     
>     	/* kallsyms not loaded. return NULL */
>     	if (sym_cnt <= 0)
>     		return NULL;
>     
>     	while (start < end) {
>     		size_t mid = start + (end - start) / 2;
>     
>     		result = key - syms[mid].addr;
>     		if (result < 0)
>     			end = mid;
>     		else if (result > 0)
>     			start = mid + 1;
>     		else
>     			return &syms[mid];                         <<<
>     	}
>     
>     	if (start >= 1 && syms[start - 1].addr < key &&
>     	    key < syms[start].addr)
>     		/* valid ksym */
>     		return &syms[start - 1];                       <<<
>     
>     	/* out of range. return _stext */
>     	return &syms[0];                                   <<<
>     }
> 
> The original ksym_search() interface directly returns the global syms 
> address, which is also dangerous for multi-threading. If we allocate new
> memory for this, it is not a perfect solution.

the assumption was that the original ksym_search touches the global
syms allocated before running tests.. then tests that actually need
fresh kallsyms data (because of bpf_testmod load/unload) would get
their own copy of kallsyms

jirka

> 
> If we rewrite
> 
> 	struct ksym *ksym_search(long key)
> 
> to
> 	struct ksym ksym_search(long key)
> 
> This also affects the source code in samples/bpf.
> 
> The same problem exists with ksym_get_addr().
> 
> Best wishes,
> Rong Tao
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git/tree/tools/testing/selftests/bpf/trace_helpers.c#n100
> 
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
