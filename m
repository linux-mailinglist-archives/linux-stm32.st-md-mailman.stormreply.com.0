Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A855B792221
	for <lists+linux-stm32@lfdr.de>; Tue,  5 Sep 2023 13:30:42 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6EE74C6B461;
	Tue,  5 Sep 2023 11:30:42 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 04BC8C6A615
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  4 Sep 2023 19:51:13 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-2b9d07a8d84so25765171fa.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 04 Sep 2023 12:51:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693857073; x=1694461873;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3AUBpdzY9yVap/s/23ZdGK7PcPt7+ENwXsRxdz18Anc=;
 b=aaCDdKy0eEsGCKQmLJwaOveYEZv9Vouf2uKFTrl7hyGC4+wPjTvBElbDzifwuUlVRG
 cmasausWlgS5g3zOxIdNjaVYZpqH4yF0SbvSHzlsErOWugvuvHEGm8Hdd02wQAsHBVoQ
 uy5AJM+MhkDXQMgx4GW7yysRE78BtKe9+rhi/fgYQRYmib3WEJw9iy88uY3lt8GRjoSm
 oGpJjsIVXKk9u2OY+19APwJ7KryExCwYfXF2bME4hN3UPU1KzkyWIU1q1bqbWeIGL5GN
 AJjdOW1dAOU4OGh6qteTfSF9Ttw24DP6UiD1kjyAgQ4GweWk39O4/rMnymDUaQ9yN2Xw
 1JlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693857073; x=1694461873;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3AUBpdzY9yVap/s/23ZdGK7PcPt7+ENwXsRxdz18Anc=;
 b=KtG/uLfTE2UlPmVRhnMiEGkcn0UjlV+kjuxROHPw5a5V9+2UjKrGUe/mXEufKglTNT
 BvwhaghnczXDXrWxmRxb6BzpIJK3/pPAMlphvgy3D5yoYBJX2GG3DQA2TMW112WGaS8M
 pZ4aKB6lSRDz7/8t48/r8EK0aS2EHCcodYKbkddP8yRN2IaCWDV9E2rNmqjcDq4HzCkO
 Y0iJncBV3SHiLLrNx90f7m0C7B81w9h+ZkxIo++kPkhUe2PxDyw0yQJ4uG1r971JtcRQ
 C9Pf2ZbOPj4qaSrQgmVzhcPK36kWC4rLoNtEI95mz/vQmikDViOxwUWv0lgGz53uX2fb
 6UMA==
X-Gm-Message-State: AOJu0Yy6p+/7tqiRYDQnPJHguDPG5ppqUbHqOwliT9ZbDDmWaJtFa9Tz
 hw59J4Xxg1k7SRUPseB8KGI=
X-Google-Smtp-Source: AGHT+IEe5hqM2tLSPD19i5CtW5J/dyVWXpmEWt1LF6g64hsvkH9kl2jvCYwAFLOu+VdQnzFX3w1cLA==
X-Received: by 2002:a19:ca12:0:b0:500:dc8d:c344 with SMTP id
 a18-20020a19ca12000000b00500dc8dc344mr6345801lfg.48.1693857072696; 
 Mon, 04 Sep 2023 12:51:12 -0700 (PDT)
Received: from krava ([83.240.60.62]) by smtp.gmail.com with ESMTPSA id
 qc8-20020a170906d8a800b0099275c59bc9sm6560549ejb.33.2023.09.04.12.51.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Sep 2023 12:51:12 -0700 (PDT)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Mon, 4 Sep 2023 21:51:10 +0200
To: Rong Tao <rtoax@foxmail.com>
Message-ID: <ZPY1Lu8341L+d5Rw@krava>
References: <cover.1693788910.git.rongtao@cestc.cn>
 <tencent_0A73B402B1D440480838ABF7124CE5EA5505@qq.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <tencent_0A73B402B1D440480838ABF7124CE5EA5505@qq.com>
X-Mailman-Approved-At: Tue, 05 Sep 2023 11:30:40 +0000
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
Subject: Re: [Linux-stm32] [PATCH bpf-next v10 1/2] selftests/bpf:
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

On Mon, Sep 04, 2023 at 09:01:20AM +0800, Rong Tao wrote:
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

missing free_kallsyms_local

> diff --git a/tools/testing/selftests/bpf/prog_tests/fill_link_info.c b/tools/testing/selftests/bpf/prog_tests/fill_link_info.c
> index 9d768e083714..13e618317c8b 100644
> --- a/tools/testing/selftests/bpf/prog_tests/fill_link_info.c
> +++ b/tools/testing/selftests/bpf/prog_tests/fill_link_info.c
> @@ -302,16 +302,18 @@ void test_fill_link_info(void)
>  {
>  	struct test_fill_link_info *skel;
>  	int i;
> +	struct ksyms *ksyms;
>  
>  	skel = test_fill_link_info__open_and_load();
>  	if (!ASSERT_OK_PTR(skel, "skel_open"))
>  		return;
>  
>  	/* load kallsyms to compare the addr */
> -	if (!ASSERT_OK(load_kallsyms_refresh(), "load_kallsyms_refresh"))
> +	ksyms = load_kallsyms_local();
> +	if (!ASSERT_OK_PTR(ksyms, "load_kallsyms_local"))
>  		goto cleanup;

actually I don't see why this test should need refreshed kallsyms,
it doesn't load/unload testmod, I think it can use global ksyms

>  
> -	kprobe_addr = ksym_get_addr(KPROBE_FUNC);
> +	kprobe_addr = ksym_get_addr_local(ksyms, KPROBE_FUNC);
>  	if (test__start_subtest("kprobe_link_info"))
>  		test_kprobe_fill_link_info(skel, BPF_PERF_EVENT_KPROBE, false);
>  	if (test__start_subtest("kretprobe_link_info"))
> @@ -329,7 +331,7 @@ void test_fill_link_info(void)
>  
>  	qsort(kmulti_syms, KMULTI_CNT, sizeof(kmulti_syms[0]), symbols_cmp_r);
>  	for (i = 0; i < KMULTI_CNT; i++)
> -		kmulti_addrs[i] = ksym_get_addr(kmulti_syms[i]);
> +		kmulti_addrs[i] = ksym_get_addr_local(ksyms, kmulti_syms[i]);
>  	if (test__start_subtest("kprobe_multi_link_info"))
>  		test_kprobe_multi_fill_link_info(skel, false, false);
>  	if (test__start_subtest("kretprobe_multi_link_info"))
> @@ -339,4 +341,5 @@ void test_fill_link_info(void)
>  
>  cleanup:
>  	test_fill_link_info__destroy(skel);
> +	free_kallsyms_local(ksyms);
>  }
> diff --git a/tools/testing/selftests/bpf/prog_tests/kprobe_multi_testmod_test.c b/tools/testing/selftests/bpf/prog_tests/kprobe_multi_testmod_test.c
> index 1fbe7e4ac00a..532b05ae2da4 100644
> --- a/tools/testing/selftests/bpf/prog_tests/kprobe_multi_testmod_test.c
> +++ b/tools/testing/selftests/bpf/prog_tests/kprobe_multi_testmod_test.c
> @@ -4,6 +4,8 @@
>  #include "trace_helpers.h"
>  #include "bpf/libbpf_internal.h"
>  
> +static struct ksyms *ksyms;
> +
>  static void kprobe_multi_testmod_check(struct kprobe_multi *skel)
>  {
>  	ASSERT_EQ(skel->bss->kprobe_testmod_test1_result, 1, "kprobe_test1_result");
> @@ -50,12 +52,12 @@ static void test_testmod_attach_api_addrs(void)
>  	LIBBPF_OPTS(bpf_kprobe_multi_opts, opts);
>  	unsigned long long addrs[3];
>  
> -	addrs[0] = ksym_get_addr("bpf_testmod_fentry_test1");
> -	ASSERT_NEQ(addrs[0], 0, "ksym_get_addr");
> -	addrs[1] = ksym_get_addr("bpf_testmod_fentry_test2");
> -	ASSERT_NEQ(addrs[1], 0, "ksym_get_addr");
> -	addrs[2] = ksym_get_addr("bpf_testmod_fentry_test3");
> -	ASSERT_NEQ(addrs[2], 0, "ksym_get_addr");
> +	addrs[0] = ksym_get_addr_local(ksyms, "bpf_testmod_fentry_test1");
> +	ASSERT_NEQ(addrs[0], 0, "ksym_get_addr_local");
> +	addrs[1] = ksym_get_addr_local(ksyms, "bpf_testmod_fentry_test2");
> +	ASSERT_NEQ(addrs[1], 0, "ksym_get_addr_local");
> +	addrs[2] = ksym_get_addr_local(ksyms, "bpf_testmod_fentry_test3");
> +	ASSERT_NEQ(addrs[2], 0, "ksym_get_addr_local");
>  
>  	opts.addrs = (const unsigned long *) addrs;
>  	opts.cnt = ARRAY_SIZE(addrs);
> @@ -79,11 +81,19 @@ static void test_testmod_attach_api_syms(void)
>  
>  void serial_test_kprobe_multi_testmod_test(void)
>  {
> -	if (!ASSERT_OK(load_kallsyms_refresh(), "load_kallsyms_refresh"))
> +	ksyms = load_kallsyms_local();
> +	if (!ASSERT_OK_PTR(ksyms, "load_kallsyms_local"))
>  		return;
>  
>  	if (test__start_subtest("testmod_attach_api_syms"))
>  		test_testmod_attach_api_syms();
> +
> +	ksyms = load_kallsyms_refresh(ksyms);
> +	if (!ASSERT_OK_PTR(ksyms, "load_kallsyms_refresh"))
> +		return;

hm, this refresh is not needed right? the test got the fresh kallsyms above
and both test_testmod_attach_api_syms and test_testmod_attach_api_addrs
should be happy

> +
>  	if (test__start_subtest("testmod_attach_api_addrs"))
>  		test_testmod_attach_api_addrs();
> +
> +	free_kallsyms_local(ksyms);
>  }
> diff --git a/tools/testing/selftests/bpf/trace_helpers.c b/tools/testing/selftests/bpf/trace_helpers.c
> index f83d9f65c65b..d64c4ef336e1 100644
> --- a/tools/testing/selftests/bpf/trace_helpers.c
> +++ b/tools/testing/selftests/bpf/trace_helpers.c
> @@ -14,104 +14,171 @@
>  #include <linux/limits.h>
>  #include <libelf.h>
>  #include <gelf.h>
> +#include "bpf/libbpf_internal.h"
>  
>  #define TRACEFS_PIPE	"/sys/kernel/tracing/trace_pipe"
>  #define DEBUGFS_PIPE	"/sys/kernel/debug/tracing/trace_pipe"
>  
> -#define MAX_SYMS 400000
> -static struct ksym syms[MAX_SYMS];
> -static int sym_cnt;
> +struct ksyms {
> +	struct ksym *syms;
> +	size_t sym_cap;
> +	size_t sym_cnt;
> +};
> +
> +static struct ksyms *ksyms;
> +
> +static int ksyms__add_symbol(struct ksyms *ksyms, const char *name,
> +							 unsigned long addr)

extra white space in here ^^^

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
> +struct ksyms *load_kallsyms_refresh(struct ksyms *ksyms)
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
>  
>  	f = fopen("/proc/kallsyms", "r");
>  	if (!f)
> -		return -ENOENT;
> +		return NULL;
> +
> +	ksyms = calloc(1, sizeof(struct ksyms));
> +	if (!ksyms)
> +		return NULL;

I wonder it could be easier not to allocate ksyms, but just let the
caller to pass the pointer to 'ksym' variable on stack.. but there
might be other problems, so I guess this is fine

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
> +	return NULL;
> +}
> +
> +struct ksyms *load_kallsyms_local(void)
> +{
> +	return load_kallsyms_refresh(NULL);

I think we can have just:

   struct ksyms *load_kallsyms_local(struct ksyms *ksyms);

I don't see reason for load_kallsyms_refresh functions, perhaps it's
leftover because I don't see the function in the changelog

thanks,
jirka
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
