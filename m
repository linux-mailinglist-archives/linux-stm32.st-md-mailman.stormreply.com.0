Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id IoZ4HXDqIWomQgEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 04 Jun 2026 23:13:20 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 01544643898
	for <lists+linux-stm32@lfdr.de>; Thu, 04 Jun 2026 23:13:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=DiwgBurV;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=kernel.org (policy=quarantine)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A2E7AC8F273;
	Thu,  4 Jun 2026 21:13:19 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BB014C8F272
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  4 Jun 2026 21:13:18 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 572EA40E21;
 Thu,  4 Jun 2026 21:13:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A26711F00893;
 Thu,  4 Jun 2026 21:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1780607597;
 bh=MpZ3QvNzyLq6MCDStBRoFi5pI56pBgPE12+T/xtOUmg=;
 h=In-Reply-To:References:Subject:From:To:Cc:Date;
 b=DiwgBurVitMzJUb2m1D70814eZtSeLV6fzWGh1T2qAO3fIHYGN7fF6kO/SrAKQjvX
 8KwBI4Slif3WPLWLLG+H0ocAbC5Bq1YGBsxs6YxCzrETQKxKe3rlGXXsTN/y3MXau+
 F9BwpD8Quj3la/DeROcj+6ufk01ZCIBIe73AK/sNC8YmGSt76noC5is2RVBvBg/s8U
 HZiKleQmM9wlj/qZeVAS0qg/RG32HNoU16vexEx2IEStUJnwoma57gmiVl+bLNTPib
 +VTcLHOBALlAYOiKOypCREXI/to5P1Lw4xGpsPCy5b5Fr5o9uzIeOPVRuX9afv3Dz0
 zydMNdGWcdnhA==
Content-Type: multipart/mixed; boundary="===============4379291998619388122=="
MIME-Version: 1.0
Message-Id: <0e5fcc7f26d096479c14eda3b51a238cecfdeff065ab6f33c50f71e54eee0ff0@mail.kernel.org>
In-Reply-To: <20260604-kasan-v2-1-c066e627fda8@bootlin.com>
References: <20260604-kasan-v2-1-c066e627fda8@bootlin.com>
From: bot+bpf-ci@kernel.org
To: alexis.lothore@bootlin.com, ast@kernel.org, daniel@iogearbox.net,
 andrii@kernel.org, martin.lau@linux.dev, eddyz87@gmail.com, memxor@gmail.com,
 song@kernel.org, yonghong.song@linux.dev, jolsa@kernel.org,
 john.fastabend@gmail.com, tglx@kernel.org, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, shuah@kernel.org,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 ihor.solodrai@linux.dev
Date: Thu,  4 Jun 2026 21:13:16 +0000 (UTC)
Cc: yonghong.song@linux.dev, thomas.petazzoni@bootlin.com, daniel@iogearbox.net,
 eddyz87@gmail.com, ebpf@linuxfoundation.org, linux-kernel@vger.kernel.org,
 ast@kernel.org, andrii@kernel.org, ihor.solodrai@linux.dev,
 alexis.lothore@bootlin.com, linux-kselftest@vger.kernel.org,
 bpf@vger.kernel.org, bastien.curutchet@bootlin.com, clm@meta.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 martin.lau@kernel.org
Subject: Re: [Linux-stm32] [PATCH bpf-next v2 1/8] bpf: mark instructions
	accessing program stack
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
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20260515];
	CTYPE_MIXED_BOGUS(1.00)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[multipart/mixed,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[bot@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+,1:+,2:+];
	RCPT_COUNT_TWELVE(0.00)[38];
	TAGGED_FROM(0.00)[bpf-ci];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:alexis.lothore@bootlin.com,m:ast@kernel.org,m:daniel@iogearbox.net,m:andrii@kernel.org,m:martin.lau@linux.dev,m:eddyz87@gmail.com,m:memxor@gmail.com,m:song@kernel.org,m:yonghong.song@linux.dev,m:jolsa@kernel.org,m:john.fastabend@gmail.com,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:shuah@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:ihor.solodrai@linux.dev,m:thomas.petazzoni@bootlin.com,m:ebpf@linuxfoundation.org,m:linux-kernel@vger.kernel.org,m:linux-kselftest@vger.kernel.org,m:bpf@vger.kernel.org,m:bastien.curutchet@bootlin.com,m:clm@meta.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:martin.lau@kernel.org,m:johnfastabend@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[bootlin.com,kernel.org,iogearbox.net,linux.dev,gmail.com,redhat.com,alien8.de,linux.intel.com,zytor.com,foss.st.com];
	RCVD_COUNT_THREE(0.00)[4];
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
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,st-md-mailman.stormreply.com:from_smtp,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 01544643898

--===============4379291998619388122==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

> diff --git a/kernel/bpf/core.c b/kernel/bpf/core.c
> index a656a8572bdb..393d9eacd215 100644
> --- a/kernel/bpf/core.c
> +++ b/kernel/bpf/core.c

[ ... ]

> @@ -1583,6 +1583,22 @@ bool bpf_insn_is_indirect_target(const struct bpf_verifier_env *env, const struc
>  	return env->insn_aux_data[insn_idx].indirect_target;
>  }
>
> +bool bpf_insn_accesses_stack_only(const struct bpf_verifier_env *env,
> +				  const struct bpf_prog *prog, int insn_idx)
> +{
> +	struct bpf_insn *insn;
> +
> +	/* cBPF: we have no verifier state, do a best-effort check based on
> +	 * dst/src reg
> +	 */
> +	insn_idx += prog->aux->subprog_start;
> +	insn = (struct bpf_insn *)prog->insnsi + insn_idx;
> +	if (!env)
> +		return insn->dst_reg == BPF_REG_FP ||
> +		       insn->src_reg == BPF_REG_FP;
> +	return !env->insn_aux_data[insn_idx].non_stack_access;
> +}
> +

Sashiko bot raised a concern about this code in v2 review: When JIT
compiling an eBPF subprogram, prog points to the subprogram and
prog->insnsi only spans the subprogram's instructions.

By adding prog->aux->subprog_start to insn_idx, doesn't this result in
out-of-bounds pointer arithmetic for insn? Even though the pointer is not
dereferenced here because of the if (!env) check, could this trigger UBSAN
bounds-checking traps?

Should the insn pointer calculation be deferred until inside the !env block
where it is genuinely needed for cBPF?

Reference: https://lore.kernel.org/bpf/20260604203644.81EF51F00893@smtp.kernel.org/

> diff --git a/kernel/bpf/fixups.c b/kernel/bpf/fixups.c
> index 5aa3f7d99ac9..5228c910fbf5 100644
> --- a/kernel/bpf/fixups.c
> +++ b/kernel/bpf/fixups.c

[ ... ]

> @@ -185,16 +185,22 @@ static void adjust_insn_aux_data(struct bpf_verifier_env *env,
>  	}
>
>  	/*
> -	 * The indirect_target flag of the original instruction was moved to the last of the
> -	 * new instructions by the above memmove and memset, but the indirect jump target is
> -	 * actually the first instruction, so move it back. This also matches with the behavior
> -	 * of bpf_insn_array_adjust(), which preserves xlated_off to point to the first new
> -	 * instruction.
> +	 * The indirect_target and non_stack_access flags of the original
> +	 * instruction were moved to the last of the new instructions by the
> +	 * above memmove and memset, but those actually match the first
> +	 * instruction, so move them back. This also matches with the behavior
> +	 * of bpf_insn_array_adjust(), which preserves xlated_off to point to
> +	 * the first new instruction.
>  	 */
>  	if (data[off + cnt - 1].indirect_target) {
>  		data[off].indirect_target = 1;
>  		data[off + cnt - 1].indirect_target = 0;
>  	}
> +
> +	if (data[off + cnt - 1].non_stack_access) {
> +		data[off].non_stack_access = 1;
> +		data[off + cnt - 1].non_stack_access = 0;
> +	}
>  }

Sashiko bot raised a concern about this logic in v2 review: When
bpf_patch_insn_data() expands a single instruction into multiple
instructions, this logic restricts the non_stack_access flag to only the
first instruction of the patched sequence and clears it for the rest.

Since the actual memory load or store in a patched sequence often occurs on
subsequent instructions rather than the first, wouldn't they lose this flag
and incorrectly bypass KASAN checks during JIT compilation?

Reference: https://lore.kernel.org/bpf/20260604203644.81EF51F00893@smtp.kernel.org/



---
AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md

CI run summary: https://github.com/kernel-patches/bpf/actions/runs/26978380520
--===============4379291998619388122==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============4379291998619388122==--
