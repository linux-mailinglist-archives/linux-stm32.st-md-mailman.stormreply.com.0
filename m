Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zG9mAkvwImrvfQEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 05 Jun 2026 17:50:35 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D7496497B6
	for <lists+linux-stm32@lfdr.de>; Fri, 05 Jun 2026 17:50:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=bootlin.com header.s=dkim header.b="El9/+tTc";
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=bootlin.com (policy=reject)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1EA9CC87ED6;
	Fri,  5 Jun 2026 15:50:34 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 37EE8C87ED5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 Jun 2026 15:50:33 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 53C3F4E408D1;
 Fri,  5 Jun 2026 15:50:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 132FF5FED1;
 Fri,  5 Jun 2026 15:50:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 32D1B106A250B; 
 Fri,  5 Jun 2026 17:50:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1780674630; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=SK9KuxS1ziFhMMC1VuJ1L9c3rL5t3987G0g0RIOVuXY=;
 b=El9/+tTcBzEyeAzQTFeFhzTs0NAXSig/ZmmOW1SkHrjIZN/GGwlVIMVAMjCgFkoboVMyT5
 GjqQxVRcv5LIvnYTgCxLDTFrCHFkkG9ZpREs9AebRMiO649TyfFEUKADbh5Xe/oUUqZ/ZX
 BBTHkMNYQzk5Yih1Piqd+yX310sr7lzevEA+8dCEFlH4D0j0NZqN8+zLzGEDToLFop1RjW
 dJgjW+AxMlIIi7Ao/uumGpK5HXwY6DuBuPOeSE+IvU4b2LCLeOVbgcDRJYvL98/D7m2469
 PNHd/uU5/VwmiNsRGylx6YZaYjEQwEVQYHCQyPImefg1ag9BSF3eIjhLakZsIA==
Mime-Version: 1.0
Date: Fri, 05 Jun 2026 17:50:24 +0200
Message-Id: <DJ18H1FKONSJ.QNJHYMX6AW6B@bootlin.com>
To: "Yonghong Song" <yonghong.song@linux.dev>,
 =?utf-8?b?QWxleGlzIExvdGhvcsOpIChlQlBGIEZvdW5kYXRpb24p?=
 <alexis.lothore@bootlin.com>, "Alexei Starovoitov" <ast@kernel.org>,
 "Daniel Borkmann" <daniel@iogearbox.net>, "Andrii Nakryiko"
 <andrii@kernel.org>, "Martin KaFai Lau" <martin.lau@linux.dev>, "Eduard
 Zingerman" <eddyz87@gmail.com>, "Kumar Kartikeya Dwivedi"
 <memxor@gmail.com>, "Song Liu" <song@kernel.org>, "Jiri Olsa"
 <jolsa@kernel.org>, "John Fastabend" <john.fastabend@gmail.com>, "Thomas
 Gleixner" <tglx@kernel.org>, "Ingo Molnar" <mingo@redhat.com>, "Borislav
 Petkov" <bp@alien8.de>, "Dave Hansen" <dave.hansen@linux.intel.com>,
 <x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, "Shuah Khan"
 <shuah@kernel.org>, "Maxime Coquelin" <mcoquelin.stm32@gmail.com>,
 "Alexandre Torgue" <alexandre.torgue@foss.st.com>, "Ihor Solodrai"
 <ihor.solodrai@linux.dev>
From: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260604-kasan-v2-0-c066e627fda8@bootlin.com>
 <20260604-kasan-v2-5-c066e627fda8@bootlin.com>
 <78009c06-4233-4e0a-88ec-33eba10ad8b3@linux.dev>
In-Reply-To: <78009c06-4233-4e0a-88ec-33eba10ad8b3@linux.dev>
X-Last-TLS-Session-Version: TLSv1.3
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, ebpf@linuxfoundation.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 bpf@vger.kernel.org, Bastien Curutchet <bastien.curutchet@bootlin.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH bpf-next v2 5/8] bpf,
 x86: emit KASAN checks into x86 JITed programs
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
X-Spamd-Result: default: False [5.89 / 15.00];
	DMARC_POLICY_REJECT(2.00)[bootlin.com : SPF not aligned (relaxed),reject];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[bootlin.com:s=dkim];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	MV_CASE(0.50)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:yonghong.song@linux.dev,m:alexis.lothore@bootlin.com,m:ast@kernel.org,m:daniel@iogearbox.net,m:andrii@kernel.org,m:martin.lau@linux.dev,m:eddyz87@gmail.com,m:memxor@gmail.com,m:song@kernel.org,m:jolsa@kernel.org,m:john.fastabend@gmail.com,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:shuah@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:ihor.solodrai@linux.dev,m:thomas.petazzoni@bootlin.com,m:ebpf@linuxfoundation.org,m:linux-kernel@vger.kernel.org,m:linux-kselftest@vger.kernel.org,m:bpf@vger.kernel.org,m:bastien.curutchet@bootlin.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:johnfastabend@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[linux.dev,bootlin.com,kernel.org,iogearbox.net,gmail.com,redhat.com,alien8.de,linux.intel.com,zytor.com,foss.st.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[alexis.lothore@bootlin.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RCVD_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[bootlin.com:-];
	FORGED_SENDER_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[alexis.lothore@bootlin.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	TAGGED_RCPT(0.00)[linux-stm32];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,bootlin.com:mid,bootlin.com:from_mime,bootlin.com:url,st-md-mailman.stormreply.com:from_smtp,st-md-mailman.stormreply.com:rdns,stormreply.com:url,stormreply.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8D7496497B6

SGkgWW9uZ2hvbmcsCgpPbiBGcmkgSnVuIDUsIDIwMjYgYXQgNDo1NCBQTSBDRVNULCBZb25naG9u
ZyBTb25nIHdyb3RlOgo+CgpbLi4uXQoKPj4gICAJCQlpZiAoQlBGX01PREUoaW5zbi0+Y29kZSkg
PT0gQlBGX1BST0JFX01FTVNYIHx8Cj4+ICAgCQkJICAgIEJQRl9NT0RFKGluc24tPmNvZGUpID09
IEJQRl9NRU1TWCkKPj4gQEAgLTI1OTIsMTMgKzI2MjIsMTMgQEAgc3RhdGljIGludCBkb19qaXQo
c3RydWN0IGJwZl92ZXJpZmllcl9lbnYgKmVudiwgc3RydWN0IGJwZl9wcm9nICpicGZfcHJvZywg
aW50ICoKPj4gICAJCQlmYWxsdGhyb3VnaDsKPj4gICAJCWNhc2UgQlBGX1NUWCB8IEJQRl9BVE9N
SUMgfCBCUEZfVzoKPj4gICAJCWNhc2UgQlBGX1NUWCB8IEJQRl9BVE9NSUMgfCBCUEZfRFc6Cj4+
ICsJCQlib29sIGlzNjQgPSBCUEZfU0laRShpbnNuLT5jb2RlKSA9PSBCUEZfRFc7Cj4+ICsJCQl1
MzIgcmVhbF9zcmNfcmVnID0gc3JjX3JlZzsKPj4gKwkJCXUzMiByZWFsX2RzdF9yZWcgPSBkc3Rf
cmVnOwo+Cj4gV2l0aCBsbHZtMjMsIEkgZ290IHRoZSBmb2xsb3dpbmcgYnVpbGQgZmFpbHVyZToK
Pgo+ICAgICAgL2hvbWUveWhzL3dvcmsvYnBmLW5leHQvYXJjaC94ODYvbmV0L2JwZl9qaXRfY29t
cC5jOjI2MjU6NDogZXJyb3I6Cj4gICAgICAgICAgICAgIGxhYmVsIGZvbGxvd2VkIGJ5IGEgZGVj
bGFyYXRpb24gaXMgYSBDMjMgZXh0ZW5zaW9uIFstV2Vycm9yLC1XYzIzLWV4dGVuc2lvbnNdCj4g
ICAgICAgMjYyNSB8ICAgICAgICAgICAgICAgICAgICAgICAgIGJvb2wgaXM2NCA9IEJQRl9TSVpF
KGluc24tPmNvZGUpID09IEJQRl9EVzsKPiAgICAgICAgICAgIHwgICAgICAgICAgICAgICAgICAg
ICAgICAgXgo+ICAgICAgMSBlcnJvciBnZW5lcmF0ZWQuCj4KPiBUaGUgYmVsb3cgaXMgYSBmaXg6
CgpUaGFua3MgZm9yIHRoZSB0ZXN0LCB0aGUgcmVwb3J0IGFuZCB0aGUgZml4LiBTbyB0aGlzIHdh
cm5pbmcgbG9va3MKc3BlY2lmaWMgdG8gbGx2bTIzLCBhcyBDSSBkb2VzIG5vdCB0cmlnZ2VyIGl0
IHdpdGggTExWTTIxLiBJJ2xsIGJyaW5nCnRoZSBmaXggaW4gaW4gdGhlIG5leHQgcmV2aXNpb24u
CgpBbGV4aXMKCi0tIApBbGV4aXMgTG90aG9yw6ksIEJvb3RsaW4KRW1iZWRkZWQgTGludXggYW5k
IEtlcm5lbCBlbmdpbmVlcmluZwpodHRwczovL2Jvb3RsaW4uY29tCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QK
TGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1h
aWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
