Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FD71CF22BB
	for <lists+linux-stm32@lfdr.de>; Mon, 05 Jan 2026 08:16:29 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DCB56C7A853;
	Mon,  5 Jan 2026 07:16:28 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 419CFC0693F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 31 Dec 2025 18:04:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id BCD9E60008;
 Wed, 31 Dec 2025 18:04:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DCA9C113D0;
 Wed, 31 Dec 2025 18:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767204254;
 bh=0Ro/XQqblVYAcHi56aVJIXOsSIn7Ux3IzaTJsrElFYg=;
 h=In-Reply-To:References:Subject:From:To:Cc:Date:From;
 b=dd9E6CgqjuFYXrdSBGiq5lsWev299NUcKd1xVS1RKFPZZZyM30QY31MvqGgsiSpu1
 f/+/caqUZitQGpRxRWkODAmz/Ba+DTMSDUoDm0TtOJoPHK/rR8Hp7hRtTcRbAPJbHK
 nYzgsL4iaPCKzf7Ry9Lu3sNQHqGINWt5sJ7kqfrxbscHUPIY5RKxUgG/vLsbOY3Xn+
 Dc2H1sXmW2k1Hj/qphuHnH1KkDa34WemgE/glkWH3HT6D+ZSCR+csvHpfTFZzsjKyL
 FpFShgn/otYQwLUfwe30RgJi8RNJiN/a+jFC1Y2KQk/w6POn4OaI6dHxCNeYvvcNoS
 +xQampOmp7r+A==
Content-Type: multipart/mixed; boundary="===============5488489058363418599=="
MIME-Version: 1.0
Message-Id: <e9a1bd633fb4bb3d2820f63f41a8dd60d8c9c5e3c699fa56057ae393ef2f31d0@mail.kernel.org>
In-Reply-To: <20251231173633.3981832-6-csander@purestorage.com>
References: <20251231173633.3981832-6-csander@purestorage.com>
From: bot+bpf-ci@kernel.org
To: csander@purestorage.com, jikos@kernel.org, bentiss@kernel.org,
 ast@kernel.org, daniel@iogearbox.net, john.fastabend@gmail.com,
 andrii@kernel.org, martin.lau@linux.dev, eddyz87@gmail.com, song@kernel.org,
 yonghong.song@linux.dev, kpsingh@kernel.org, sdf@fomichev.me,
 haoluo@google.com, jolsa@kernel.org, tj@kernel.org, void@manifault.com,
 arighi@nvidia.com, changwoo@igalia.com, mingo@redhat.com, peterz@infradead.org,
 juri.lelli@redhat.com, vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
 rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de, vschneid@redhat.com,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 horms@kernel.org, dsahern@kernel.org, jhs@mojatatu.com,
 xiyou.wangcong@gmail.com, jiri@resnulli.us, alibuda@linux.alibaba.com,
 dust.li@linux.alibaba.com, sidraya@linux.ibm.com, wenjia@linux.ibm.com,
 mjambigi@linux.ibm.com, tonylu@linux.alibaba.com, guwen@linux.alibaba.com,
 shuah@kernel.org, mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com
Date: Wed, 31 Dec 2025 18:04:13 +0000 (UTC)
X-Mailman-Approved-At: Mon, 05 Jan 2026 07:16:21 +0000
Cc: linux-s390@vger.kernel.org, ast@kernel.org, martin.lau@kernel.org,
 daniel@iogearbox.net, eddyz87@gmail.com, linux-rdma@vger.kernel.org,
 netdev@vger.kernel.org, csander@purestorage.com, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, andrii@kernel.org,
 ihor.solodrai@linux.dev, linux-kselftest@vger.kernel.org,
 linux-input@vger.kernel.org, bpf@vger.kernel.org, clm@meta.com,
 sched-ext@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 yonghong.song@linux.dev
Subject: Re: [Linux-stm32] [PATCH 5/5] selftests/bpf: make cfi_stubs globals
	const
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

--===============5488489058363418599==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

> diff --git a/tools/testing/selftests/bpf/test_kmods/bpf_testmod.c b/tools/testing/selftests/bpf/test_kmods/bpf_testmod.c
> index 90c4b1a51de6..5e460b1dbdb6 100644
> --- a/tools/testing/selftests/bpf/test_kmods/bpf_testmod.c
> +++ b/tools/testing/selftests/bpf/test_kmods/bpf_testmod.c

[ ... ]

> @@ -1275,7 +1275,7 @@ bpf_testmod_ops__test_return_ref_kptr(int dummy, struct task_struct *task__ref,
>  	return NULL;
>  }
>
> -static struct bpf_testmod_ops __bpf_testmod_ops = {
> +static const struct bpf_testmod_ops __bpf_testmod_ops = {
>  	.test_1 = bpf_testmod_test_1,
>  	.test_2 = bpf_testmod_test_2,

Is it safe to make __bpf_testmod_ops const here? In bpf_testmod_init(),
this struct is modified at runtime:

    tramp = (void **)&__bpf_testmod_ops.tramp_1;
    while (tramp <= (void **)&__bpf_testmod_ops.tramp_40)
        *tramp++ = bpf_testmod_tramp;

Writing to a const-qualified object is undefined behavior and may cause a
protection fault when the compiler places this in read-only memory. Would
the module fail to load on systems where .rodata is actually read-only?


---
AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md

CI run summary: https://github.com/kernel-patches/bpf/actions/runs/20624206229

--===============5488489058363418599==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============5488489058363418599==--
