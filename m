Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5Ms8DXPqIWooQgEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 04 Jun 2026 23:13:23 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 132B96438A0
	for <lists+linux-stm32@lfdr.de>; Thu, 04 Jun 2026 23:13:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=Xxxgafho;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=kernel.org (policy=quarantine)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C9AC3C8F273;
	Thu,  4 Jun 2026 21:13:22 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B2832C8F273
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  4 Jun 2026 21:13:21 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id AB9A7418EA;
 Thu,  4 Jun 2026 21:13:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D89F1F00893;
 Thu,  4 Jun 2026 21:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1780607600;
 bh=R+m7Si3D+ole/8K+71lLy8KRgWcJ869l99QxME4GzlE=;
 h=In-Reply-To:References:Subject:From:To:Cc:Date;
 b=XxxgafhoyrZUNrj9DMod/PAUvkNiUv2GCWyfl/7nELyGmpgFUfbbgs4IABIUR8bSV
 iXqujyVPXhwDHm8wMNNuOC2fijPOzLM3GyTDqJ55GKlEwaU5OCgzT0eyL3IYo/5Uh9
 Fm9ly5QIfRWXCk886bHqoT0brJZSCl3aVgQ0H2u0oVnpScy3cLraxS7bYazcgugO/N
 W8vBcMi9ncHagU7ElqUYs3PsjcufcD6rkf84Lyxsnp28IZrbxqbcFTzernOXS7dMMc
 5Rbze6TGAQlswv0ANClo3hsMXoJ0ku8h9UCibajVifNobVlFPYQxYkDcn8d9GNur29
 BggA9CObmDEjQ==
Content-Type: multipart/mixed; boundary="===============5773208707414677654=="
MIME-Version: 1.0
Message-Id: <8485a4391b9a9b744bf0f740b60ba73dec5e894a725157f9c336c0225e00a4dd@mail.kernel.org>
In-Reply-To: <20260604-kasan-v2-4-c066e627fda8@bootlin.com>
References: <20260604-kasan-v2-4-c066e627fda8@bootlin.com>
From: bot+bpf-ci@kernel.org
To: alexis.lothore@bootlin.com, ast@kernel.org, daniel@iogearbox.net,
 andrii@kernel.org, martin.lau@linux.dev, eddyz87@gmail.com, memxor@gmail.com,
 song@kernel.org, yonghong.song@linux.dev, jolsa@kernel.org,
 john.fastabend@gmail.com, tglx@kernel.org, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, shuah@kernel.org,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 ihor.solodrai@linux.dev
Date: Thu,  4 Jun 2026 21:13:20 +0000 (UTC)
Cc: yonghong.song@linux.dev, thomas.petazzoni@bootlin.com, daniel@iogearbox.net,
 eddyz87@gmail.com, ebpf@linuxfoundation.org, linux-kernel@vger.kernel.org,
 ast@kernel.org, andrii@kernel.org, ihor.solodrai@linux.dev,
 alexis.lothore@bootlin.com, linux-kselftest@vger.kernel.org,
 bpf@vger.kernel.org, bastien.curutchet@bootlin.com, clm@meta.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 martin.lau@kernel.org
Subject: Re: [Linux-stm32] [PATCH bpf-next v2 4/8] bpf,
	x86: refactor BPF_ST management in do_jit
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
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MIME_GOOD(-0.10)[multipart/mixed,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+,1:+,2:+];
	RCPT_COUNT_TWELVE(0.00)[38];
	TAGGED_FROM(0.00)[bpf-ci];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[bot@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
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
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:from_smtp,st-md-mailman.stormreply.com:rdns,stormreply.com:url,stormreply.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 132B96438A0

--===============5773208707414677654==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

> diff --git a/arch/x86/net/bpf_jit_comp.c b/arch/x86/net/bpf_jit_comp.c
> index 0981791014eb..943a0f315cf2 100644
> --- a/arch/x86/net/bpf_jit_comp.c
> +++ b/arch/x86/net/bpf_jit_comp.c
> @@ -2300,41 +2300,50 @@ static int do_jit(struct bpf_verifier_env *env, struct bpf_prog *bpf_prog, int *
>  			EMIT_LFENCE();
>  			break;
>
> -			/* ST: *(u8*)(dst_reg + off) = imm */
>  		case BPF_ST | BPF_MEM | BPF_B:

[ ... ]

>  		case BPF_ST | BPF_MEM | BPF_DW:
> -			if (dst_reg == BPF_REG_PARAMS && insn->off == -8) {
> -				/* Arg 6: store immediate in r9 register */
> -				emit_mov_imm64(&prog, X86_REG_R9, imm32 >> 31, (u32)imm32);
> +			switch (BPF_SIZE(insn->code)) {

[ ... ]

> +			case BPF_DW:
> +				if (dst_reg == BPF_REG_PARAMS &&
> +				    insn->off == -8) {
> +					/* Arg 6: store immediate in r9 register */
> +					emit_mov_imm64(&prog, X86_REG_R9,
> +						       imm32 >> 31, (u32)imm32);
> +					break;
> +				}
> +				EMIT2(add_1mod(0x48, dst_reg), 0xC7);
>  				break;
>  			}
> -			EMIT2(add_1mod(0x48, dst_reg), 0xC7);
>
> -st:			insn_off = insn->off;
> +			insn_off = insn->off;

Has the scope of the Arg 6 break changed here?

In the original code the BPF_DW handling lived directly under the case
label, and its break left the whole outer instruction switch:

	case BPF_ST | BPF_MEM | BPF_DW:
		if (dst_reg == BPF_REG_PARAMS && insn->off == -8) {
			/* Arg 6: store immediate in r9 register */
			emit_mov_imm64(&prog, X86_REG_R9, imm32 >> 31, (u32)imm32);
			break;
		}
		EMIT2(add_1mod(0x48, dst_reg), 0xC7);
	st:	insn_off = insn->off;
		...

So for the Arg 6 case it emitted exactly the movabs into r9 and stopped,
never reaching the st: addressing and immediate emission.

After the refactor, the Arg 6 branch lives inside the inner switch on
BPF_SIZE(), so its break only exits that inner switch:

	case BPF_DW:
		if (dst_reg == BPF_REG_PARAMS &&
		    insn->off == -8) {
			emit_mov_imm64(&prog, X86_REG_R9,
				       imm32 >> 31, (u32)imm32);
			break;
		}
		EMIT2(add_1mod(0x48, dst_reg), 0xC7);
		break;
	}

	insn_off = insn->off;
	if (dst_reg == BPF_REG_PARAMS) {
		insn_off = outgoing_arg_base - outgoing_rsp -
			   insn_off - 16;
		dst_reg = BPF_REG_FP;
	}
	if (is_imm8(insn_off))
		EMIT2(add_1reg(0x40, dst_reg), insn_off);
	else
		EMIT1_off32(add_1reg(0x80, dst_reg), insn_off);
	EMIT(imm32, bpf_size_to_x86_bytes(BPF_SIZE(insn->code)));

After emitting the movabs into r9, does control now fall through into
the common insn_off block and emit an additional ModRM/displacement byte
sequence plus a 4-byte immediate that do not belong to any instruction?

Would those extra bytes corrupt the emitted machine code stream for the
Arg 6 path, since dst_reg == BPF_REG_PARAMS with insn->off == -8 is a
reachable case used to pass the 6th outgoing call argument in r9?

Could the original break be preserved here, for example by breaking out
of the outer switch (or skipping the insn_off block) once the Arg 6
movabs has been emitted?

The commit message describes this as grouping the BPF_ST instructions
"in a single block of fall-through cases", implying no behavioral change,
but the Arg 6 path appears to gain extra emitted bytes.


---
AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md

CI run summary: https://github.com/kernel-patches/bpf/actions/runs/26978380520
--===============5773208707414677654==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============5773208707414677654==--
