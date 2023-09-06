Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 63EFF797042
	for <lists+linux-stm32@lfdr.de>; Thu,  7 Sep 2023 08:21:29 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0FBE4C6B469;
	Thu,  7 Sep 2023 06:21:29 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E87A9C6B468
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  6 Sep 2023 20:54:16 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-31ad9155414so270560f8f.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 06 Sep 2023 13:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694033656; x=1694638456;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6kVCXHAEjEM8goSFYvxXt/gFxYeO8nmrzpZAICgJpDE=;
 b=Gd8nupq6LwLWlLLJ8tGr69a0J3l0W+AVWJicGA/Hpkj+lt5L3dhEEgijkgowl2vw9o
 Im0dohS9bCG4UFVju47fQQsoIXGg/RstFKzG3TNTZpkJ3/7Y521qVfBV+Rxcq8YqceQm
 10l6CynrgfDMRbmYi1jEZv970HL+Ko2tADA6NQWQoCSz3dOBYxuf0H4VTXa4k6emGTtp
 TuzNGJOKOFeUEztzcfD5WFm/mjOPNdbVTWW1Kg6YT6IhEkVkHTiqJqepbdy+RL8/JszH
 lE9ZcnGvaeaBRdGZml8AKJjAC7n4oCksTVVVJaqVxm7OpEn88cUT/WQvZWvgGDtKVfnJ
 kS2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1694033656; x=1694638456;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6kVCXHAEjEM8goSFYvxXt/gFxYeO8nmrzpZAICgJpDE=;
 b=AuttIG1nCvK3ACyuavzlQ9pp938mc7wkyCRskerboNsb5EarAsFBGIfFr3j8p6tAc6
 PsoU890wRigBSIvLYtt1lBOH5CGuy2stkZE59xgacHubyPQFE4cfIfqxyiHoH9ub9RAf
 IeYZLbeFXdRPQY35p5na64GN4Mhr6xhLsgIcM6Wz38/dz+wZWy6YgBvwgiR6xazmHaCc
 ocvQWu71j4f88AM7VNZPCsGlsdgd0u8C+qi6GvFq+FLhibU7vWR6XRFzwrYRCaVBRaaN
 wCxaLAJNmr2oylKCI1Y7AwmoIhYqmu12IpxO5hPjcI718Lk3D9LlJFWX2ILPdYJQUqas
 FBGg==
X-Gm-Message-State: AOJu0YzHrXiEwiDktyirZjcaoi53XhtsIkU26NTEuVI3kBDE+q9Bdz7t
 4CCoqNpR5FOavqx1See5GNE=
X-Google-Smtp-Source: AGHT+IG4ooluzmxwcYlqOgvX4/v7UF1oQSyZHST17ujusbKy/cUFYsvzWSMQkJmILJfYgGTJTfe45Q==
X-Received: by 2002:a5d:6582:0:b0:31a:d4a9:bdac with SMTP id
 q2-20020a5d6582000000b0031ad4a9bdacmr3038816wru.11.1694033655894; 
 Wed, 06 Sep 2023 13:54:15 -0700 (PDT)
Received: from krava ([83.240.60.62]) by smtp.gmail.com with ESMTPSA id
 j9-20020a170906410900b009926928d486sm9420794ejk.35.2023.09.06.13.54.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Sep 2023 13:54:15 -0700 (PDT)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Wed, 6 Sep 2023 22:54:13 +0200
To: Rong Tao <rtoax@foxmail.com>
Message-ID: <ZPjm9fcy35JJZj6M@krava>
References: <cover.1693922135.git.rongtao@cestc.cn>
 <tencent_F9CAE827E2BA8193D06796FBE58ECAD16B06@qq.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <tencent_F9CAE827E2BA8193D06796FBE58ECAD16B06@qq.com>
X-Mailman-Approved-At: Thu, 07 Sep 2023 06:21:28 +0000
Cc: Yonghong Song <yonghong.song@linux.dev>, Song Liu <song@kernel.org>,
 Yafang Shao <laoar.shao@gmail.com>, Rong Tao <rongtao@cestc.cn>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Shuah Khan <shuah@kernel.org>, "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>, Mykola Lysenko <mykolal@fb.com>,
 daniel@iogearbox.net, John Fastabend <john.fastabend@gmail.com>,
 andrii@kernel.org, Alexei Starovoitov <ast@kernel.org>,
 KP Singh <kpsingh@kernel.org>, olsajiri@gmail.com,
 "moderated list:ARM/STM32 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
 Hao Luo <haoluo@google.com>, open list <linux-kernel@vger.kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "open list:BPF \[GENERAL\] \(Safe Dynamic Programs and Tools\)"
 <bpf@vger.kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, sdf@google.com
Subject: Re: [Linux-stm32] [PATCH bpf-next v11 1/2] selftests/bpf:
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

On Tue, Sep 05, 2023 at 10:04:18PM +0800, Rong Tao wrote:
> From: Rong Tao <rongtao@cestc.cn>
> 
> Static ksyms often have problems because the number of symbols exceeds the
> MAX_SYMS limit. Like changing the MAX_SYMS from 300000 to 400000 in
> commit e76a014334a6("selftests/bpf: Bump and validate MAX_SYMS") solves
> the problem somewhat, but it's not the perfect way.
> 
> This commit uses dynamic memory allocation, which completely solves the
> problem caused by the limitation of the number of kallsyms. At the same
> time, add APIs:
> 
>     load_kallsyms_local()
>     ksym_search_local()
>     ksym_get_addr_local()
>     free_kallsyms_local()
> 
> There are used to solve the problem of selftests/bpf updating kallsyms
> after attach new symbols during testmod testing.
> 
> Acked-by: Stanislav Fomichev <sdf@google.com>
> Signed-off-by: Rong Tao <rongtao@cestc.cn>

looks good, I added few more coments, with them addressed you can add my

Acked-by: Jiri Olsa <jolsa@kernel.org>

thanks,
jirka


> ---
> v11: Remove useless load_kallsyms_refresh() and modify code some format
> v10: https://lore.kernel.org/lkml/tencent_0A73B402B1D440480838ABF7124CE5EA5505@qq.com/
>     Keep the original load_kallsyms().
> v9: https://lore.kernel.org/lkml/tencent_254B7015EED7A5D112C45E033DA1822CF107@qq.com/
>     Add load_kallsyms_local,ksym_search_local,ksym_get_addr_local functions.
> v8: https://lore.kernel.org/lkml/tencent_6D23FE187408D965E95DFAA858BC7E8C760A@qq.com/
>     Resolves inter-thread contention for ksyms global variables.
> v7: https://lore.kernel.org/lkml/tencent_BD6E19C00BF565CD5C36A9A0BD828CFA210A@qq.com/
>     Fix __must_check macro.
> v6: https://lore.kernel.org/lkml/tencent_4A09A36F883A06EA428A593497642AF8AF08@qq.com/
>     Apply libbpf_ensure_mem()
> v5: https://lore.kernel.org/lkml/tencent_0E9E1A1C0981678D5E7EA9E4BDBA8EE2200A@qq.com/
>     Release the allocated memory once the load_kallsyms_refresh() upon error
>     given it's dynamically allocated.
> v4: https://lore.kernel.org/lkml/tencent_59C74613113F0C728524B2A82FE5540A5E09@qq.com/
>     Make sure most cases we don't need the realloc() path to begin with,
>     and check strdup() return value.
> v3: https://lore.kernel.org/lkml/tencent_50B4B2622FE7546A5FF9464310650C008509@qq.com/
>     Do not use structs and judge ksyms__add_symbol function return value.
> v2: https://lore.kernel.org/lkml/tencent_B655EE5E5D463110D70CD2846AB3262EED09@qq.com/
>     Do the usual len/capacity scheme here to amortize the cost of realloc, and
>     don't free symbols.
> v1: https://lore.kernel.org/lkml/tencent_AB461510B10CD484E0B2F62E3754165F2909@qq.com/

SNIP

> +static int ksyms__add_symbol(struct ksyms *ksyms, const char *name,
> +			     unsigned long addr)
> +{
> +	void *tmp;
> +
> +	tmp = strdup(name);
> +	if (!tmp)
> +		return -ENOMEM;
> +	ksyms->syms[ksyms->sym_cnt].addr = addr;
> +	ksyms->syms[ksyms->sym_cnt].name = tmp;
> +
> +	ksyms->sym_cnt++;
> +
> +	return 0;

nit, extra new lines above

> +}
> +
> +void free_kallsyms_local(struct ksyms *ksyms)
> +{
> +	unsigned int i;
> +
> +	if (!ksyms)
> +		return;
> +
> +	if (!ksyms->syms) {
> +		free(ksyms);
> +		return;
> +	}
> +
> +	for (i = 0; i < ksyms->sym_cnt; i++)
> +		free(ksyms->syms[i].name);
> +	free(ksyms->syms);
> +	free(ksyms);
> +}
>  
>  static int ksym_cmp(const void *p1, const void *p2)
>  {
>  	return ((struct ksym *)p1)->addr - ((struct ksym *)p2)->addr;
>  }
>  
> -int load_kallsyms_refresh(void)
> +struct ksyms *load_kallsyms_local(struct ksyms *ksyms)
>  {
>  	FILE *f;
>  	char func[256], buf[256];
>  	char symbol;
>  	void *addr;
> -	int i = 0;
> +	int ret;
>  
> -	sym_cnt = 0;
> +	/* flush kallsyms, free the previously allocated dynamic memory */
> +	free_kallsyms_local(ksyms);

with the removal of the refresh function (from last version) there's
no need now for ksyms argument in load_kallsyms_local

all the current users of load_kallsyms_local are passing NULL arg

>  
>  	f = fopen("/proc/kallsyms", "r");
>  	if (!f)
> -		return -ENOENT;
> +		return NULL;
> +
> +	ksyms = calloc(1, sizeof(struct ksyms));
> +	if (!ksyms)

missing fclose(f);

> +		return NULL;
>  
>  	while (fgets(buf, sizeof(buf), f)) {
>  		if (sscanf(buf, "%p %c %s", &addr, &symbol, func) != 3)
>  			break;
>  		if (!addr)
>  			continue;
> -		if (i >= MAX_SYMS)
> -			return -EFBIG;
>  
> -		syms[i].addr = (long) addr;
> -		syms[i].name = strdup(func);
> -		i++;
> +		ret = libbpf_ensure_mem((void **) &ksyms->syms, &ksyms->sym_cap,
> +					sizeof(struct ksym), ksyms->sym_cnt + 1);
> +		if (ret)
> +			goto error;
> +		ret = ksyms__add_symbol(ksyms, func, (unsigned long)addr);
> +		if (ret)
> +			goto error;
>  	}
>  	fclose(f);
> -	sym_cnt = i;
> -	qsort(syms, sym_cnt, sizeof(struct ksym), ksym_cmp);
> -	return 0;
> +	qsort(ksyms->syms, ksyms->sym_cnt, sizeof(struct ksym), ksym_cmp);
> +	return ksyms;
> +
> +error:
> +	free_kallsyms_local(ksyms);

missing fclose(f);

> +	return NULL;
>  }
>  
>  int load_kallsyms(void)
>  {
> -	/*
> -	 * This is called/used from multiplace places,
> -	 * load symbols just once.
> -	 */
> -	if (sym_cnt)
> -		return 0;
> -	return load_kallsyms_refresh();
> +	if (!ksyms)
> +		ksyms = load_kallsyms_local(NULL);
> +	return ksyms ? 0 : 1;
>  }
>  
> -struct ksym *ksym_search(long key)
> +struct ksym *ksym_search_local(struct ksyms *ksyms, long key)
>  {
> -	int start = 0, end = sym_cnt;
> +	int start = 0, end = ksyms->sym_cnt;
>  	int result;
>  
> +	if (!ksyms)
> +		return NULL;

I don't think we need to check !ksyms in here, you don't do
that check in ksym_get_addr_local and I think it's fine

> +
>  	/* kallsyms not loaded. return NULL */
> -	if (sym_cnt <= 0)
> +	if (ksyms->sym_cnt <= 0)
>  		return NULL;
>  
>  	while (start < end) {

SNIP

> diff --git a/tools/testing/selftests/bpf/trace_helpers.h b/tools/testing/selftests/bpf/trace_helpers.h
> index 876f3e711df6..d6eeec85a5e4 100644
> --- a/tools/testing/selftests/bpf/trace_helpers.h
> +++ b/tools/testing/selftests/bpf/trace_helpers.h
> @@ -11,13 +11,18 @@ struct ksym {
>  	long addr;
>  	char *name;
>  };
> +struct ksyms;
>  
>  int load_kallsyms(void);
> -int load_kallsyms_refresh(void);
> -
>  struct ksym *ksym_search(long key);
>  long ksym_get_addr(const char *name);
>  
> +struct ksyms *load_kallsyms_local(struct ksyms *ksyms);
> +struct ksym *ksym_search_local(struct ksyms *ksyms, long key);
> +long ksym_get_addr_local(struct ksyms *ksyms, const char *name);
> +

nit, extra newline

> +void free_kallsyms_local(struct ksyms *ksyms);
> +
>  /* open kallsyms and find addresses on the fly, faster than load + search. */
>  int kallsyms_find(const char *sym, unsigned long long *addr);
>  
> -- 
> 2.41.0
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
