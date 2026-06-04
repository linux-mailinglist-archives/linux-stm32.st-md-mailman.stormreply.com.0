Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id B9SiJw7yIWotQwEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 04 Jun 2026 23:45:50 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 387B8643AAC
	for <lists+linux-stm32@lfdr.de>; Thu, 04 Jun 2026 23:45:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=RjNt1Zfl;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=kernel.org (policy=quarantine)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D90EFC8F272;
	Thu,  4 Jun 2026 21:45:49 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 06603C8F271
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  4 Jun 2026 21:45:47 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id DC88B6001A;
 Thu,  4 Jun 2026 21:45:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 076631F00893;
 Thu,  4 Jun 2026 21:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1780609546;
 bh=eVPQ3M4nO2cjo4ZvlqJcXIehT4M5f0oVzasV566Wey4=;
 h=In-Reply-To:References:Subject:From:To:Cc:Date;
 b=RjNt1ZflgPOa3QCB1uhADhvuCHHeOhF9pb550vZ9YhQF47A5HGMNfdXAD6wxT6o+s
 p4yLBkWFUmqeLxAf9JXAQbeSadGip4m6WTwSx2j06mVZMs9pomJwf6IfpxpYiCHg21
 IOGpNWMEzRQC8XyjgcyV0q3vxkS6BIv8fYcuoXvsYbCAXYN89OK5WhQzDzXCOs+g4Q
 xwXWWiO9by1OWL2iRaX38Y/NQ00OAFPcya0uwNOVdJwcJrhNU+tTEDOVJ1emi5GEqm
 zGBt9qCmETG8CPbSSquApDhNk7saGl8cVIPS2ZUL4J0j3LCWkl964PCyneEPHWJ89M
 XFYcOKm3Ai2jw==
Content-Type: multipart/mixed; boundary="===============3493038701439416165=="
MIME-Version: 1.0
Message-Id: <8642178be3be8efc7f19ac4a9aa37e699f2baa82cab200909b99997068c6ae7b@mail.kernel.org>
In-Reply-To: <20260604-kasan-v2-8-c066e627fda8@bootlin.com>
References: <20260604-kasan-v2-8-c066e627fda8@bootlin.com>
From: bot+bpf-ci@kernel.org
To: alexis.lothore@bootlin.com, ast@kernel.org, daniel@iogearbox.net,
 andrii@kernel.org, martin.lau@linux.dev, eddyz87@gmail.com, memxor@gmail.com,
 song@kernel.org, yonghong.song@linux.dev, jolsa@kernel.org,
 john.fastabend@gmail.com, tglx@kernel.org, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, shuah@kernel.org,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 ihor.solodrai@linux.dev
Date: Thu,  4 Jun 2026 21:45:46 +0000 (UTC)
Cc: yonghong.song@linux.dev, thomas.petazzoni@bootlin.com, daniel@iogearbox.net,
 eddyz87@gmail.com, ebpf@linuxfoundation.org, linux-kernel@vger.kernel.org,
 ast@kernel.org, andrii@kernel.org, ihor.solodrai@linux.dev,
 alexis.lothore@bootlin.com, linux-kselftest@vger.kernel.org,
 bpf@vger.kernel.org, bastien.curutchet@bootlin.com, clm@meta.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 martin.lau@kernel.org
Subject: Re: [Linux-stm32] [PATCH bpf-next v2 8/8] selftests/bpf: add tests
	to validate KASAN on JIT programs
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
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [5.79 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	CTYPE_MIXED_BOGUS(1.00)[];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20260515];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[multipart/mixed,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	GREYLIST(0.00)[pass,meta];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+,1:+,2:+];
	FORGED_SENDER(0.00)[bot@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	TAGGED_FROM(0.00)[bpf-ci];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[bootlin.com,kernel.org,iogearbox.net,linux.dev,gmail.com,redhat.com,alien8.de,linux.intel.com,zytor.com,foss.st.com];
	FORGED_RECIPIENTS(0.00)[m:alexis.lothore@bootlin.com,m:ast@kernel.org,m:daniel@iogearbox.net,m:andrii@kernel.org,m:martin.lau@linux.dev,m:eddyz87@gmail.com,m:memxor@gmail.com,m:song@kernel.org,m:yonghong.song@linux.dev,m:jolsa@kernel.org,m:john.fastabend@gmail.com,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:shuah@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:ihor.solodrai@linux.dev,m:thomas.petazzoni@bootlin.com,m:ebpf@linuxfoundation.org,m:linux-kernel@vger.kernel.org,m:linux-kselftest@vger.kernel.org,m:bpf@vger.kernel.org,m:bastien.curutchet@bootlin.com,m:clm@meta.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:martin.lau@kernel.org,m:johnfastabend@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[linux.dev,bootlin.com,iogearbox.net,gmail.com,linuxfoundation.org,vger.kernel.org,kernel.org,meta.com,st-md-mailman.stormreply.com,lists.infradead.org];
	FROM_NEQ_ENVFROM(0.00)[bot@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:-];
	TAGGED_RCPT(0.00)[linux-stm32];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCPT_COUNT_TWELVE(0.00)[38];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 387B8643AAC

--===============3493038701439416165==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

> diff --git a/tools/testing/selftests/bpf/prog_tests/kasan.c b/tools/testing/selftests/bpf/prog_tests/kasan.c
> new file mode 100644
> index 000000000000..0000000000000
> --- /dev/null
> +++ b/tools/testing/selftests/bpf/prog_tests/kasan.c
> @@ -0,0 +1,356 @@

[ ... ]

> +	ctx->klog_fd = open_kernel_logs();
> +	if (!ASSERT_OK_FD(ctx->klog_fd, "open kernel logs"))
> +		goto destroy;

[ ... ]

> +	for (i = 0; i < ARRAY_SIZE(tests); i++) {
> +		test = &tests[i];
> +		run_subtest(ctx, test);
> +	}

The Sashiko AI review on the RFC v1 8/8 posting raised a concern here that
does not seem to have been addressed in v2:

  https://lore.kernel.org/bpf/20260425065049.BEC63C2BCB0@smtp.kernel.org

The original question was:

  KASAN operates in single-shot mode by default. After the first subtest
  triggers a report, will subsequent reports be suppressed, causing the
  remaining subtests to fail? Also, since BPF CI runs with panic_on_warn=1,
  will the first KASAN splat invoke check_panic_on_warn() and immediately
  panic the CI runner?

KASAN runs in single-shot mode by default. mm/kasan/report.c suppresses
reports after the first one unless kasan_multi_shot is set.

This loop runs roughly 50 subtests, and each one expects a fresh KASAN
report emitted via the JIT-inserted __asan_load/__asan_store calls that go
through kasan_report().

Under default single-shot KASAN, would the subtests after the first one see
no report and fail the positive assertions?

Separately, BPF CI runs with panic_on_warn=1 (config.ppc64el still sets
panic_on_warn=1). Would the first KASAN splat reach check_panic_on_warn()
and panic the runner?

Nothing in v2 appears to enable kasan_multi_shot or guard against
panic_on_warn. Was this intended to be handled somewhere?

> diff --git a/tools/testing/selftests/bpf/progs/kasan.c b/tools/testing/selftests/bpf/progs/kasan.c
> new file mode 100644
> index 000000000000..670318a956a4
> --- /dev/null
> +++ b/tools/testing/selftests/bpf/progs/kasan.c
> @@ -0,0 +1,382 @@

[ ... ]

> +SEC("tcx/ingress")
> +int stx_on_stack(struct __sk_buff *skb)
> +{
> +	struct kasan_write_val val;
> +
> +	bpf_kfunc_kasan_poison(&val, sizeof(struct kasan_write_val));
> +	switch (access_size) {
> +	case 1:
> +		val.data_1 = access_size;
> +		break;
> +	case 2:
> +		val.data_2 = access_size;
> +		break;
> +	case 4:
> +		val.data_4 = access_size;
> +		break;
> +	case 8:
> +		val.data_8 = access_size;
> +		break;
> +	}
> +	bpf_kfunc_kasan_poison(&val, sizeof(struct kasan_write_val));

This isn't a bug, but should this second call be
bpf_kfunc_kasan_unpoison() rather than bpf_kfunc_kasan_poison()?

Every other program in this file (st_on_stack, st_not_on_stack, ldx_*,
simple_atomic_*, load_acquire_*, store_release_*) calls
bpf_kfunc_kasan_unpoison() after the access, and stx_not_on_stack below
repeats the same poison-twice pattern.

> +	return 0;
> +}

[ ... ]

> +SEC("tcx/ingress")
> +int stx_not_on_stack(struct __sk_buff *skb)
> +{

[ ... ]

> +	bpf_kfunc_kasan_poison(val, sizeof(struct kasan_write_val));
> +	switch (access_size) {
> +	case 1:
> +		val->data_1 = access_size;
> +		break;

[ ... ]

> +	}
> +	bpf_kfunc_kasan_poison(val, sizeof(struct kasan_write_val));

Same question here as in stx_on_stack: the second call is
bpf_kfunc_kasan_poison() where the other programs use
bpf_kfunc_kasan_unpoison().

The intended store still happens while the memory is poisoned, so the
expected KASAN report is still generated and the positive assertion still
passes. The effect is that the leftover poison stays on the test_map slab
value (and on the stack region for stx_on_stack) until the next subtest
re-poisons and unpoisons the same region. Was poisoning a second time here
intentional?

> +	return 0;
> +}

---
AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md

CI run summary: https://github.com/kernel-patches/bpf/actions/runs/26978380520
--===============3493038701439416165==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============3493038701439416165==--
