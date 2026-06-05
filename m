Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xeZWOslZI2pSqgEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Sat, 06 Jun 2026 01:20:41 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 79E2B64BC8B
	for <lists+linux-stm32@lfdr.de>; Sat, 06 Jun 2026 01:20:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=gmail.com header.s=20251104 header.b=ersV6nC5;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=gmail.com (policy=none)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2B381C01FB6;
	Fri,  5 Jun 2026 23:20:41 +0000 (UTC)
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com
 [209.85.210.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 307CBCFAC40
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 Jun 2026 23:20:39 +0000 (UTC)
Received: by mail-ot1-f45.google.com with SMTP id
 46e09a7af769-7e6cfdc92bfso899020a34.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 05 Jun 2026 16:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1780701638; x=1781306438;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:references:subject:cc:to:from:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4+iCAJCoPeoQjVniwPzyILoS4cYkcgjvk5RajaSaOvM=;
 b=ersV6nC5U8I0dg2AMKrADYwZkVk03e04Tcjc0491b7xI6PQWYfLxYPbFMyjkML8LlJ
 rOA21j+zObDtMmo+nFnGyXzOHb0qTMBK6Xl/7EJ6grpbBhbrYu0Si/1zB+nji4DhECcO
 nBRcYhKth9IzZi3wel01QDYVFlB3e2JtNjVoEFM3HoN5Me7huPQE3um1r4NFQvZoTKjm
 qfeK1La8KQEm49yb6gYIAJ1l4LlJzp69aSTuFjbUy78RFCzNiBphrTMKosFsPL5PzS/i
 9uCka8gkUQZ5/WJ4A0p2JEdw0mN2Nto6Y7EdbMgHl+u8D8kZRf9ON6TPpAO+5btC6wPR
 f0gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780701638; x=1781306438;
 h=in-reply-to:references:subject:cc:to:from:message-id:date
 :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4+iCAJCoPeoQjVniwPzyILoS4cYkcgjvk5RajaSaOvM=;
 b=Gh7cFsbCEhdpxgTVqByZKFVUFj705Z/6OMZM5ZSyk5RjMGoky3nrUckU8v8l8ZBZmr
 h45u1/FdC23nRcwOieXThhY9CGvDI/vQ8LZhWWezGt0fqi/M5bRV6bAMjTPn73W53B6u
 iDCfOExZnBwx6Wa9wKjeu6g+8YrMYWPJQxDrMqbuO51nCxVOU+WHOgQvG+ANAYD1Jg9W
 e/1pkpHl4ik4kTe0ldNUyOOBOoWMb45gL6NRuGGpqv5BEp36GguCDS1bDijpiKxh8J65
 he/gPw7+ehRWLVSHPDIY7unOFxZ2n5Qy/GEf583Drn/6+UxRcN5gWnbK8rJlHpzt411U
 aiQw==
X-Forwarded-Encrypted: i=1;
 AFNElJ8hQouxOBH9GVZi0wScLzZcsfesksqGKRPKbs50+Px4Uzz2Whjcb17e9TvC0//m3FnbkhrS6ry4vw/AgA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YypbvnKakkUJrCRFn+0b+gdpyyDypJV2r1Rqacfox/SzEOthLow
 SmEe66yic3Y8SQe4gqXgY5oB9W18o0nJMIYfbz2F0vIRv60lTICgE/v/
X-Gm-Gg: Acq92OGvopAHdTTbrHBGceaLo/t+mYPfA1TGgsFDIGhRZQnRaSTt3UhlO3UMnPdFasf
 6TtGjUybYQSzPipZaeQNKRG7O7lj1qmr9BIyomno5htTD5NPLxc4qSLLD6uwKsJeZTRV3kEF2hC
 kMbIvYLslu5AdAL5eIto5DEJh1dqBgR38dkEhOiHhOXxKEpBu1ftNgosZ3gMmeDPUb/sCT2Ukpl
 OSjsqHFxwtbq/6wbWTINJYPJgOmED6KwF3xXpzC2LZsCRMf8S0XVaD5vq8WijJVTPuBZp17qaEF
 FHjoy4o1Kb2KFFrV8Utr9advKe+x5VbH4Qe/WSgQV7HpBApxV5/+Aci3HB+BFpYUSX/lqHRLKq5
 VQ0u7Io+d7Nxv+CBSuN3lukruRYQBJcqms28c0jehP0LVQOBSN8QssfM/cCi7+JSTADxX0ju+v4
 kHmiTRtqEGPQaXsVYk0EbCCIoAKQqI7rv3jSMpBPcCLlxcq3hxn7emMP1glSwskaYDivqf3/ACs
 D3AeQoIbHytZQPCi06tuIN5REEl
X-Received: by 2002:a4a:edcb:0:b0:69e:40a1:5fd3 with SMTP id
 006d021491bc7-69e68b1b820mr3057943eaf.2.1780701637605; 
 Fri, 05 Jun 2026 16:20:37 -0700 (PDT)
Received: from localhost ([2a03:2880:10ff:46::])
 by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-440d8465e00sm8002361fac.15.2026.06.05.16.20.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Jun 2026 16:20:36 -0700 (PDT)
Mime-Version: 1.0
Date: Fri, 05 Jun 2026 16:20:34 -0700
Message-Id: <DJ1I1PI8PVFM.3KR1GSL838OMF@gmail.com>
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: =?utf-8?b?QWxleGlzIExvdGhvcsOpIChlQlBGIEZvdW5kYXRpb24p?=
 <alexis.lothore@bootlin.com>, "Alexei Starovoitov" <ast@kernel.org>,
 "Daniel Borkmann" <daniel@iogearbox.net>, "Andrii Nakryiko"
 <andrii@kernel.org>, "Martin KaFai Lau" <martin.lau@linux.dev>, "Eduard
 Zingerman" <eddyz87@gmail.com>, "Kumar Kartikeya Dwivedi"
 <memxor@gmail.com>, "Song Liu" <song@kernel.org>, "Yonghong Song"
 <yonghong.song@linux.dev>, "Jiri Olsa" <jolsa@kernel.org>, "John Fastabend"
 <john.fastabend@gmail.com>, "Thomas Gleixner" <tglx@kernel.org>, "Ingo
 Molnar" <mingo@redhat.com>, "Borislav Petkov" <bp@alien8.de>, "Dave Hansen"
 <dave.hansen@linux.intel.com>, <x86@kernel.org>, "H. Peter Anvin"
 <hpa@zytor.com>, "Shuah Khan" <shuah@kernel.org>, "Maxime Coquelin"
 <mcoquelin.stm32@gmail.com>, "Alexandre Torgue"
 <alexandre.torgue@foss.st.com>, "Ihor Solodrai" <ihor.solodrai@linux.dev>
X-Mailer: aerc
References: <20260604-kasan-v2-0-c066e627fda8@bootlin.com>
 <20260604-kasan-v2-1-c066e627fda8@bootlin.com>
In-Reply-To: <20260604-kasan-v2-1-c066e627fda8@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, ebpf@linuxfoundation.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 bpf@vger.kernel.org, Bastien Curutchet <bastien.curutchet@bootlin.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [4.00 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	MV_CASE(0.50)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[bootlin.com,kernel.org,iogearbox.net,linux.dev,gmail.com,redhat.com,alien8.de,linux.intel.com,zytor.com,foss.st.com];
	FORGED_SENDER(0.00)[alexeistarovoitov@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[29];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:alexis.lothore@bootlin.com,m:ast@kernel.org,m:daniel@iogearbox.net,m:andrii@kernel.org,m:martin.lau@linux.dev,m:eddyz87@gmail.com,m:memxor@gmail.com,m:song@kernel.org,m:yonghong.song@linux.dev,m:jolsa@kernel.org,m:john.fastabend@gmail.com,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:shuah@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:ihor.solodrai@linux.dev,m:thomas.petazzoni@bootlin.com,m:ebpf@linuxfoundation.org,m:linux-kernel@vger.kernel.org,m:linux-kselftest@vger.kernel.org,m:bpf@vger.kernel.org,m:bastien.curutchet@bootlin.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:johnfastabend@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexeistarovoitov@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCVD_TLS_LAST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 79E2B64BC8B

T24gVGh1IEp1biA0LCAyMDI2IGF0IDE6MjEgUE0gUERULCBBbGV4aXMgTG90aG9yw6kgKGVCUEYg
Rm91bmRhdGlvbikgd3JvdGU6Cj4gIAo+ICtib29sIGJwZl9pbnNuX2FjY2Vzc2VzX3N0YWNrX29u
bHkoY29uc3Qgc3RydWN0IGJwZl92ZXJpZmllcl9lbnYgKmVudiwKPiArCQkJCSAgY29uc3Qgc3Ry
dWN0IGJwZl9wcm9nICpwcm9nLCBpbnQgaW5zbl9pZHgpCj4gK3sKPiArCXN0cnVjdCBicGZfaW5z
biAqaW5zbjsKPiArCj4gKwkvKiBjQlBGOiB3ZSBoYXZlIG5vIHZlcmlmaWVyIHN0YXRlLCBkbyBh
IGJlc3QtZWZmb3J0IGNoZWNrIGJhc2VkIG9uCj4gKwkgKiBkc3Qvc3JjIHJlZwo+ICsJICovCj4g
KwlpbnNuX2lkeCArPSBwcm9nLT5hdXgtPnN1YnByb2dfc3RhcnQ7Cj4gKwlpbnNuID0gKHN0cnVj
dCBicGZfaW5zbiAqKXByb2ctPmluc25zaSArIGluc25faWR4Owo+ICsJaWYgKCFlbnYpCj4gKwkJ
cmV0dXJuIGluc24tPmRzdF9yZWcgPT0gQlBGX1JFR19GUCB8fAo+ICsJCSAgICAgICBpbnNuLT5z
cmNfcmVnID09IEJQRl9SRUdfRlA7Cj4gKwlyZXR1cm4gIWVudi0+aW5zbl9hdXhfZGF0YVtpbnNu
X2lkeF0ubm9uX3N0YWNrX2FjY2VzczsKPiArfQoKTGV0J3Mgc2tpcCB0aGlzIGZ1bmN0aW9uIGFu
ZCBjQlBGIGFsdG9nZXRoZXIuCgpUaGlzIGVmZm9ydCBhaW1zIHRvIGNhdGNoIHZlcmlmaWVyIGFu
ZCBrZnVuYyBidWdzLgpjQlBGIGRvZXNuJ3QgaGF2ZSBub3JtYWwgdmVyaWZpZXIgYW5kIGhhcyBw
bGVudHkgb2YgdW5wcml2IGdvdGNoYXMuClRoZSBrZXJuZWwgY29tcGlsZWQgd2l0aCBLQVNBTiBp
cyBmb3IgZGVidWdnaW5nLCBidXQgSSdkIGxpa2UgdG8KYXZvaWQgdGhpbmtpbmcgYWJvdXQgdW5w
cml2IGNvbXBsaWNhdGlvbnMgd2l0aCBjQlBGIGFuZCBLQVNBTi4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApM
aW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFp
bG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
