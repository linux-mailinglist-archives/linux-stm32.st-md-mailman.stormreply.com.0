Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id sowVNTbTJ2rV2wIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 09 Jun 2026 10:47:50 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C18D65DF18
	for <lists+linux-stm32@lfdr.de>; Tue, 09 Jun 2026 10:47:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=bootlin.com header.s=dkim header.b=ISpERdkX;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=bootlin.com (policy=reject)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E1883C8F282;
	Tue,  9 Jun 2026 08:47:49 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D8A83C555BE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Jun 2026 08:47:48 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id BC052C6344B;
 Tue,  9 Jun 2026 08:47:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 4810A5FFC1;
 Tue,  9 Jun 2026 08:47:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id B4163106A2AC4; 
 Tue,  9 Jun 2026 10:47:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1780994866; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=YjDdX3vciOF19PxithdDPrRHmvsQu1FVpC/1SU6RqHs=;
 b=ISpERdkX3duCHiXejPbFzvffW7F4yI9mZSAqibAXZRDOS5dhq7ubqMdN+moqHgxnQLg9Jx
 hwdzoXVU1SAANvZTq6vsCFH6SkPou/QuDLszyJnJGCnVdeB6K3ZueYWLl1rzgLpgfeOnUV
 nCRWeqc0nVSwoMk2hh6S8OrKQu7NyzzNmyugGBsRatDQur+H+PxeD2mxojrJg1SYJxPM+i
 Zt3uw97k9gKDSFAAyoOXMWF4HRHbS68V71sngePYfbVIzefB5XUJKKlmT7rgb7EyJnHVEJ
 CD3h8BarmuhxOLzK2tLJGvI+HiyjkzyCcgYZ3BAbGUrsuN2M3YepKtLuaqcrWA==
Mime-Version: 1.0
Date: Tue, 09 Jun 2026 10:47:36 +0200
Message-Id: <DJ4DZHRVAV59.SPVM2QDQN0C@bootlin.com>
From: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
To: <bot+bpf-ci@kernel.org>, <alexis.lothore@bootlin.com>, <ast@kernel.org>,
 <daniel@iogearbox.net>, <andrii@kernel.org>, <martin.lau@linux.dev>,
 <eddyz87@gmail.com>, <memxor@gmail.com>, <song@kernel.org>,
 <yonghong.song@linux.dev>, <jolsa@kernel.org>, <john.fastabend@gmail.com>,
 <tglx@kernel.org>, <mingo@redhat.com>, <bp@alien8.de>,
 <dave.hansen@linux.intel.com>, <x86@kernel.org>, <hpa@zytor.com>,
 <shuah@kernel.org>, <mcoquelin.stm32@gmail.com>,
 <alexandre.torgue@foss.st.com>, <ihor.solodrai@linux.dev>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260604-kasan-v2-2-c066e627fda8@bootlin.com>
 <1e7ab52954b9ff584d6871c2ec234a7155b577f29128564d0d597809cafad826@mail.kernel.org>
In-Reply-To: <1e7ab52954b9ff584d6871c2ec234a7155b577f29128564d0d597809cafad826@mail.kernel.org>
X-Last-TLS-Session-Version: TLSv1.3
Cc: thomas.petazzoni@bootlin.com, ebpf@linuxfoundation.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
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
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:bot+bpf-ci@kernel.org,m:alexis.lothore@bootlin.com,m:ast@kernel.org,m:daniel@iogearbox.net,m:andrii@kernel.org,m:martin.lau@linux.dev,m:eddyz87@gmail.com,m:memxor@gmail.com,m:song@kernel.org,m:yonghong.song@linux.dev,m:jolsa@kernel.org,m:john.fastabend@gmail.com,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:shuah@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:ihor.solodrai@linux.dev,m:thomas.petazzoni@bootlin.com,m:ebpf@linuxfoundation.org,m:linux-kernel@vger.kernel.org,m:linux-kselftest@vger.kernel.org,m:bpf@vger.kernel.org,m:bastien.curutchet@bootlin.com,m:clm@meta.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:martin.lau@kernel.org,m:bot@kernel.org,m:johnfastabend@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,bootlin.com,iogearbox.net,linux.dev,gmail.com,redhat.com,alien8.de,linux.intel.com,zytor.com,foss.st.com];
	FORGED_SENDER(0.00)[alexis.lothore@bootlin.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[32];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[alexis.lothore@bootlin.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[bootlin.com:-];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,bpf-ci];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3C18D65DF18

T24gVGh1IEp1biA0LCAyMDI2IGF0IDExOjEzIFBNIENFU1QsIGJvdCticGYtY2kgd3JvdGU6Cj4+
IGRpZmYgLS1naXQgYS9rZXJuZWwvYnBmL0tjb25maWcgYi9rZXJuZWwvYnBmL0tjb25maWcKPj4g
aW5kZXggZWIzZGUzNTczNGYwLi5hOGUwMDRmODhiOTIgMTAwNjQ0Cj4+IC0tLSBhL2tlcm5lbC9i
cGYvS2NvbmZpZwo+PiArKysgYi9rZXJuZWwvYnBmL0tjb25maWcKPgo+IFsgLi4uIF0KPgo+PiBA
QCAtMTAxLDQgKzEwNSw5IEBAIGNvbmZpZyBCUEZfTFNNCj4+Cj4+ICAJICBJZiB5b3UgYXJlIHVu
c3VyZSBob3cgdG8gYW5zd2VyIHRoaXMgcXVlc3Rpb24sIGFuc3dlciBOLgo+Pgo+PiArY29uZmln
IEJQRl9KSVRfS0FTQU4KPj4gKwlib29sCj4+ICsJZGVwZW5kcyBvbiBIQVZFX0VCUEZfSklUX0tB
U0FOCj4+ICsJZGVmYXVsdCB5IGlmIEJQRl9KSVQgJiYgS0FTQU5fR0VORVJJQyAmJiBLQVNBTl9W
TUFMTE9DICYmIFZNQVBfU1RBQ0sKPj4gKwo+PiAgZW5kbWVudSAjICJCUEYgc3Vic3lzdGVtIgo+
Cj4gVGhpcyBpc24ndCBhIGJ1ZywgYnV0IGEgZGVzaWduIGNvbmNlcm4gcmFpc2VkIG9uIGFuIGVh
cmxpZXIgcG9zdGluZyBvZgo+IHRoaXMgd29yayBkb2Vzbid0IGxvb2sgZnVsbHkgcmVzb2x2ZWQu
Cj4KPiBJbiB0aGUgdjEgKFJGQykgZGlzY3Vzc2lvbiwgdGhlIHN1Z2dlc3Rpb24gd2FzIHRvIG5v
dCBhZGQgYSBjb25maWcga25vYgo+IGF0IGFsbCBhbmQgaW5zdGVhZCBkbyB0aGUgaW5zdHJ1bWVu
dGF0aW9uIGluc2lkZSB0aGUgSklUIHdoZW5ldmVyCj4gS0FTQU5fR0VORVJJQyBpcyBzZXQ6Cj4K
PiAgICJMZXQncyBub3QgYWRkIG1vcmUgY29uZmlnIGtub2JzLiBFdmVuIHRoaXMgcGF0Y2ggbG9v
a3MgcmVkdW5kYW50Lgo+ICAgIEluc2lkZSBKSVQgZG8gaW5zdHJ1bWVudGF0aW9uIHdoZW4gS0FT
QU5fR0VORVJJQyBpcyBzZXQuIgo+Cj4gICBodHRwczovL2xvcmUua2VybmVsLm9yZy9icGYvQ0FB
RG5WUUxqPVVvc25zQy00VjIrbU45MkZlMC1rVysrVSttLU85Yzkza2s2QndpWGd3QG1haWwuZ21h
aWwuY29tLwo+Cj4gVGhlIHJlYXNvbmluZyBnaXZlbiBmb3Iga2VlcGluZyB0aGUgaW50ZXJuYWwg
S2NvbmZpZyB3YXMgdGhhdCBpdCBsZXRzCj4gc2VsZnRlc3RzIGFkYXB0IHRoZWlyIGJlaGF2aW9y
IHdpdGhvdXQgc3ByaW5rbGluZyBhcmNoIGFuZCBLQVNBTgo+IGNvbmRpdGlvbmFscywgYW5kIGFu
b3RoZXIgcmV2aWV3ZXIgYWdyZWVkIHRoYXQgYXBwcm9hY2ggd2FzIHJlYXNvbmFibGUuCj4KPiBU
aGF0ICJ0aGlzIHBhdGNoIGxvb2tzIHJlZHVuZGFudCIgb2JqZWN0aW9uIHdhcyBuZXZlciBleHBs
aWNpdGx5Cj4gcmV0cmFjdGVkIG9yIHJlLWFja2VkLCB5ZXQgdGhlIEJQRl9KSVRfS0FTQU4gY29u
ZmlnIGlzIHJldGFpbmVkIGhlcmUuCj4KPiBIYXMgdGhpcyBkZXNpZ24gcG9pbnQgYmVlbiBzZXR0
bGVkPwoKSSBzdGlsbCBhZHZvY2F0ZSB0byBrZWVwIHRoaXMgQlBGX0pJVF9LQVNBTiwgd2hpY2gg
aXMgdXNlZCBsYXRlciBpbgpwYXRjaCA3LzggdG8gY2hlY2sgd2hldGhlciBrYXNhbiB0ZXN0cyBz
aG91bGQgYmUgZXhlY3V0ZWQgb3Igbm90LgoKQWxleGlzCj4KPiAtLS0KPiBBSSByZXZpZXdlZCB5
b3VyIHBhdGNoLiBQbGVhc2UgZml4IHRoZSBidWcgb3IgZW1haWwgcmVwbHkgd2h5IGl0J3Mgbm90
IGEgYnVnLgo+IFNlZTogaHR0cHM6Ly9naXRodWIuY29tL2tlcm5lbC1wYXRjaGVzL3ZtdGVzdC9i
bG9iL21hc3Rlci9jaS9jbGF1ZGUvUkVBRE1FLm1kCj4KPiBDSSBydW4gc3VtbWFyeTogaHR0cHM6
Ly9naXRodWIuY29tL2tlcm5lbC1wYXRjaGVzL2JwZi9hY3Rpb25zL3J1bnMvMjY5NzgzODA1MjAK
CgoKCi0tIApBbGV4aXMgTG90aG9yw6ksIEJvb3RsaW4KRW1iZWRkZWQgTGludXggYW5kIEtlcm5l
bCBlbmdpbmVlcmluZwpodHRwczovL2Jvb3RsaW4uY29tCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgt
c3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4u
c3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
