Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kbnbCXLqIWonQgEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 04 Jun 2026 23:13:22 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EF09D64389D
	for <lists+linux-stm32@lfdr.de>; Thu, 04 Jun 2026 23:13:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=MDcxOFIl;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=kernel.org (policy=quarantine)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B5ACDC8F275;
	Thu,  4 Jun 2026 21:13:21 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 44C3AC8F275
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  4 Jun 2026 21:13:20 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 288D74042C;
 Thu,  4 Jun 2026 21:13:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 685231F00898;
 Thu,  4 Jun 2026 21:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1780607599;
 bh=Bvq7vOl1c1mpIND7SGq8IUzzkQicWNmeIHBCULeRYCk=;
 h=In-Reply-To:References:Subject:From:To:Cc:Date;
 b=MDcxOFIlJpDBkWx4G4Fyg+NRKBS8U/9nrpTIxW6hEAlPJieSOpscifAXinZHL8Pra
 ZLcvQyU2kS2+93H6siaH+q5lJv7j+LGzr0G5gATRIramDZR8hJmQB2jAL2NvItMOwa
 yuaA6IX9likH4SSia+VKj/6U5wccC4VyPhb5GYtrdsgtf5yx6sZ2TSBmSTmvz0A5a3
 lDVeTJAPGhBGQSMQxXc0h41xsI9JXJ1l0XS3K8yxFPAVq7Gr95j40husFaFtoPFhFk
 P3oAWBSjMGDNurtTa4DUHudhMuteXxxRhDtCCMKbPzSlhMjw2A2DlG56pJARAd9sxo
 eLmhA5dVCl8aQ==
Content-Type: multipart/mixed; boundary="===============5364940318977030226=="
MIME-Version: 1.0
Message-Id: <1e7ab52954b9ff584d6871c2ec234a7155b577f29128564d0d597809cafad826@mail.kernel.org>
In-Reply-To: <20260604-kasan-v2-2-c066e627fda8@bootlin.com>
References: <20260604-kasan-v2-2-c066e627fda8@bootlin.com>
From: bot+bpf-ci@kernel.org
To: alexis.lothore@bootlin.com, ast@kernel.org, daniel@iogearbox.net,
 andrii@kernel.org, martin.lau@linux.dev, eddyz87@gmail.com, memxor@gmail.com,
 song@kernel.org, yonghong.song@linux.dev, jolsa@kernel.org,
 john.fastabend@gmail.com, tglx@kernel.org, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, shuah@kernel.org,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 ihor.solodrai@linux.dev
Date: Thu,  4 Jun 2026 21:13:18 +0000 (UTC)
Cc: yonghong.song@linux.dev, thomas.petazzoni@bootlin.com, daniel@iogearbox.net,
 eddyz87@gmail.com, ebpf@linuxfoundation.org, linux-kernel@vger.kernel.org,
 ast@kernel.org, andrii@kernel.org, ihor.solodrai@linux.dev,
 alexis.lothore@bootlin.com, linux-kselftest@vger.kernel.org,
 bpf@vger.kernel.org, bastien.curutchet@bootlin.com, clm@meta.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 martin.lau@kernel.org
Subject: Re: [Linux-stm32] [PATCH bpf-next v2 2/8] bpf: add BPF_JIT_KASAN
	for KASAN instrumentation of JITed programs
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
X-Rspamd-Queue-Id: EF09D64389D

--===============5364940318977030226==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

> diff --git a/kernel/bpf/Kconfig b/kernel/bpf/Kconfig
> index eb3de35734f0..a8e004f88b92 100644
> --- a/kernel/bpf/Kconfig
> +++ b/kernel/bpf/Kconfig

[ ... ]

> @@ -101,4 +105,9 @@ config BPF_LSM
>
>  	  If you are unsure how to answer this question, answer N.
>
> +config BPF_JIT_KASAN
> +	bool
> +	depends on HAVE_EBPF_JIT_KASAN
> +	default y if BPF_JIT && KASAN_GENERIC && KASAN_VMALLOC && VMAP_STACK
> +
>  endmenu # "BPF subsystem"

This isn't a bug, but a design concern raised on an earlier posting of
this work doesn't look fully resolved.

In the v1 (RFC) discussion, the suggestion was to not add a config knob
at all and instead do the instrumentation inside the JIT whenever
KASAN_GENERIC is set:

  "Let's not add more config knobs. Even this patch looks redundant.
   Inside JIT do instrumentation when KASAN_GENERIC is set."

  https://lore.kernel.org/bpf/CAADnVQLj=UosnsC-4V2+mN92Fe0-kW++U+m-O9c93kk6BwiXgw@mail.gmail.com/

The reasoning given for keeping the internal Kconfig was that it lets
selftests adapt their behavior without sprinkling arch and KASAN
conditionals, and another reviewer agreed that approach was reasonable.

That "this patch looks redundant" objection was never explicitly
retracted or re-acked, yet the BPF_JIT_KASAN config is retained here.

Has this design point been settled?


---
AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md

CI run summary: https://github.com/kernel-patches/bpf/actions/runs/26978380520
--===============5364940318977030226==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============5364940318977030226==--
