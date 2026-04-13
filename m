Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mCgCFew13Wl9agkAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Apr 2026 20:29:00 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D94923F2037
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Apr 2026 20:28:59 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1FB4FC3F944;
	Mon, 13 Apr 2026 18:28:59 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EAAC8C32EB0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Apr 2026 18:28:57 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id EF77BC5B1AB;
 Mon, 13 Apr 2026 18:29:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 24AAB5FFB9;
 Mon, 13 Apr 2026 18:28:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 57AC3104504B7; 
 Mon, 13 Apr 2026 20:28:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1776104935; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding; bh=8wwTbqAk1/v1m7wW2LqSmKK5iRKdfUxdCX7mcszWNIw=;
 b=A6txoxr1XcmG6tEbbCTyhur5lWgPF7QbN2kOqQ54tYUX88h9fiDrus4Hjzv6K1aTBvZ2CO
 bjdVtAPCZTUuxgjc6RPvbXX0F56K9Ade5XwS7muo/TOF1Tvpmck0wAWs4AVubunqSm+Ndd
 6f01OPXyrIg/4lsYV6IK/RMy3MjbBTauAl1B50TjTV2IxPVcJuSQrO4S+u7TZwMR/mU033
 FVILOV9EtBmoXp1r76CWS2aoAmzpBnQyc2Izig6DLjirZ630fRVBYFhCLMDQGNkhc32w4F
 Q3k01keahidyZQVCTHur9l743MSGM6UBhfKfPB0DM8ZaeCot7DW4hlmohhjJyw==
From: =?utf-8?q?Alexis_Lothor=C3=A9_=28eBPF_Foundation=29?=
 <alexis.lothore@bootlin.com>
Date: Mon, 13 Apr 2026 20:28:40 +0200
Message-Id: <20260413-kasan-v1-0-1a5831230821@bootlin.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDQyMz3ezE4sQ83bTkFDOLNDOT5BTzJCWg2oKi1LTMCrA50UpBbs4gsaS
 CNN281IoSpdjaWgCGQM1aaAAAAA==
X-Change-ID: 20260126-kasan-fcd68f64cd7b
To: Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
 Martin KaFai Lau <martin.lau@linux.dev>, 
 Eduard Zingerman <eddyz87@gmail.com>, 
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
 John Fastabend <john.fastabend@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, David Ahern <dsahern@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Shuah Khan <shuah@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
 Alexander Potapenko <glider@google.com>, 
 Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Andrew Morton <akpm@linux-foundation.org>
X-Mailer: b4 0.15.1
X-Last-TLS-Session-Version: TLSv1.3
Cc: linux-kselftest@vger.kernel.org,
 Bastien Curutchet <bastien.curutchet@bootlin.com>, netdev@vger.kernel.org,
 ebpf@linuxfoundation.org, linux-kernel@vger.kernel.org,
 kasan-dev@googlegroups.com, linux-mm@kvack.org,
 =?utf-8?q?Alexis_Lothor=C3=A9_=28eBPF_Foundation=29?=
 <alexis.lothore@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 bpf@vger.kernel.org, Xu Kuohai <xukuohai@huawei.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH RFC bpf-next 0/8] bpf: add support for KASAN
 checks in JITed programs
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
X-Spamd-Result: default: False [5.39 / 15.00];
	DMARC_POLICY_REJECT(2.00)[bootlin.com : SPF not aligned (relaxed),reject];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[bootlin.com:s=dkim];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[40];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS(0.00)[m:ast@kernel.org,m:daniel@iogearbox.net,m:andrii@kernel.org,m:martin.lau@linux.dev,m:eddyz87@gmail.com,m:memxor@gmail.com,m:song@kernel.org,m:yonghong.song@linux.dev,m:jolsa@kernel.org,m:john.fastabend@gmail.com,m:davem@davemloft.net,m:dsahern@kernel.org,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:shuah@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:ryabinin.a.a@gmail.com,m:glider@google.com,m:andreyknvl@gmail.com,m:dvyukov@google.com,m:vincenzo.frascino@arm.com,m:akpm@linux-foundation.org,m:linux-kselftest@vger.kernel.org,m:bastien.curutchet@bootlin.com,m:netdev@vger.kernel.org,m:ebpf@linuxfoundation.org,m:linux-kernel@vger.kernel.org,m:kasan-dev@googlegroups.com,m:linux-mm@kvack.org,m:alexis.lothore@bootlin.com,m:thomas.petazzoni@bootlin.com,m:bpf@vger.kernel.org,m:xukuohai@huawei.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead
 .org,m:johnfastabend@gmail.com,m:mcoquelinstm32@gmail.com,m:ryabininaa@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[alexis.lothore@bootlin.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_TO(0.00)[kernel.org,iogearbox.net,linux.dev,gmail.com,davemloft.net,redhat.com,alien8.de,linux.intel.com,zytor.com,foss.st.com,google.com,arm.com,linux-foundation.org];
	GREYLIST(0.00)[pass,meta];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexis.lothore@bootlin.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[bootlin.com:-];
	NEURAL_HAM(-0.00)[-0.937];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: D94923F2037
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGVsbG8sCnRoaXMgc2VyaWVzIGFpbXMgdG8gYnJpbmcgYmFzaWMgc3VwcG9ydCBmb3IgS0FTQU4g
Y2hlY2tzIHRvIEJQRiBKSVRlZApwcm9ncmFtcy4gVGhpcyBmb2xsb3dzIHRoZSBmaXJzdCBSRkMg
cG9zdGVkIGluIFsxXS4KCktBU0FOIGFsbG93cyB0byBzcG90IG1lbW9yeSBtYW5hZ2VtZW50IG1p
c3Rha2VzIGJ5IHJlc2VydmluZyBhIGZyYWN0aW9uCm9mIG1lbW9yeSBhcyAic2hhZG93IG1lbW9y
eSIgdGhhdCB3aWxsIG1hcCB0byB0aGUgcmVzdCBvZiB0aGUgbWVtb3J5IGFuZAphbGxvdyBpdHMg
bW9uaXRvcmluZy4gRWFjaCBtZW1vcnktYWNjZXNzaW5nIGluc3RydWN0aW9uIGlzIHRoZW4KaW5z
dHJ1bWVudGVkIGF0IGJ1aWxkIHRpbWUgdG8gY2FsbCBzb21lIEFTQU4gY2hlY2sgZnVuY3Rpb24s
IHRoYXQgd2lsbAphbmFseXplIHRoZSBjb3JyZXNwb25kaW5nIGJpdHMgaW4gc2hhZG93IG1lbW9y
eSwgYW5kIGlmIGl0IGRldGVjdHMgdGhlCmFjY2VzcyBhcyBpbnZhbGlkLCB0cmlnZ2VyIGEgZGV0
YWlsZWQgcmVwb3J0LiBUaGUgZ29hbCBvZiB0aGlzIHNlcmllcyBpcwp0byByZXBsaWNhdGUgdGhp
cyBtZWNoYW5pc20gZm9yIEJQRiBwcm9ncmFtcyB3aGVuIHRoZXkgYXJlIGJlaW5nIEpJVGVkCmlu
dG8gbmF0aXZlIGluc3RydWN0aW9uczogdGhhdCdzIHRoZW4gdGhlIChydW50aW1lKSBKSVQgY29t
cGlsZXIgd2hvIGlzCmluIGNoYXJnZSBvZiBpbnNlcnRpbmcgY2FsbHMgdG8gdGhlIGNvcnJlc3Bv
bmRpbmcga2FzYW4gY2hlY2tzLCB3aGVuIGEKcHJvZ3JhbSBpcyBiZWluZyBsb2FkZWQgaW50byB0
aGUga2VybmVsLiBUaGlzIHRhc2sgaW52b2x2ZXM6Ci0gaWRlbnRpZnlpbmcgYXQgcHJvZ3JhbSBs
b2FkIHRpbWUgdGhlIGluc3RydWN0aW9ucyBwZXJmb3JtaW5nIG1lbW9yeQogIGFjY2Vzc2VzCi0g
aWRlbnRpZnlpbmcgdGhvc2UgYWNjZXNzZXMgcHJvcGVydGllcyAoc2l6ZSA/IHJlYWQgb3Igd3Jp
dGUgPykgdG8KICBkZWZpbmUgdGhlIHJlbGV2YW50IGthc2FuIGNoZWNrIGZ1bmN0aW9uIHRvIGNh
bGwKLSBqdXN0IGJlZm9yZSB0aGUgaWRlbnRpZmllZCBpbnN0cnVjdGlvbnM6CiAgLSBwZXJmb3Jt
IHRoZSBiYXNpYyBjb250ZXh0IHNhdmluZyAoaWU6IHNhdmluZyByZWdpc3RlcnMpCiAgLSBpbnNl
cnRpbmcgYSBjYWxsIHRvIHRoZSByZWxldmFudCBrYXNhbiBjaGVjayBmdW5jdGlvbiAKICAtIHJl
c3RvcmUgY29udGV4dAotIHdoZW5ldmVyIHRoZSBpbnN0cnVtZW50ZWQgcHJvZ3JhbSBleGVjdXRl
cywgaWYgaXQgcGVyZm9ybXMgYW4gaW52YWxpZAogIGFjY2VzcywgaXQgdHJpZ2dlcnMgYSBrYXNh
biByZXBvcnQgaWRlbnRpY2FsIHRvIHRob3NlIGluc3RydW1lbnRlZCBvbgogIGtlcm5lbCBzaWRl
IGF0IGJ1aWxkIHRpbWUuCgpBcyBkaXNjdXNzZWQgaW4gWzFdLCB0aGlzIHNlcmllcyBpcyBiYXNl
ZCBvbiBzb21lIGNob2ljZXMgYW5kCmFzc3VtcHRpb25zOgotIGl0IGZvY3VzZXMgb24geDg2XzY0
IGZvciBub3csIGFuZCBzbyBvbmx5IG9uIEtBU0FOX0dFTkVSSUMKLSBub3QgYWxsIG1lbW9yeSBh
Y2Nlc3NpbmcgQlBGIGluc3RydWN0aW9ucyBhcmUgYmVpbmcgaW5zdHJ1bWVudGVkOgogIC0gaXQg
Zm9jdXNlcyBvbiBTVFgvTERYIGluc3RydWN0aW9ucwogIC0gaXQgZGlzY2FyZHMgaW5zdHJ1Y3Rp
b25zIGFjY2Vzc2luZyBCUEYgcHJvZ3JhbSBzdGFjayAoYWxyZWFkeQogICAgbW9uaXRvcmVkIGJ5
IHBhZ2UgZ3VhcmRzKQogIC0gaXQgZGlzY2FyZHMgcG9zc2libHkgZmF1bHRpbmcgaW5zdHJ1Y3Rp
b25zLCBsaWtlIEJQRl9QUk9CRV9NRU0gb3IKICAgIEJQRl9QUk9CRV9BVE9NSUMgaW5zbnMKClRo
ZSBzZXJpZXMgaXMgbWFya2VkIGFuZCBzZW50IGFzIFJGQzoKLSB0byBhbGxvdyBjb2xsZWN0aW5n
IGZlZWRiYWNrIGVhcmx5IGFuZCBtYWtlIHN1cmUgdGhhdCBpdCBnb2VzIGludG8gdGhlCiAgcmln
aHQgZGlyZWN0aW9uCi0gYmVjYXVzZSBpdCBkZXBlbmRzIG9uIFh1J3Mgd29yayB0byBwYXNzIGRh
dGEgYmV0d2VlbiB0aGUgdmVyaWZpZXIgYW5kCiAgSklUIGNvbXBpbGVycy4gVGhpcyB3b3JrIGlz
IG5vdCBtZXJnZWQgeWV0LCBzZWUgWzJdLiBJIGhhdmUgYmVlbgogIHRyYWNraW5nIHRoZSB2YXJp
b3VzIHJldmlzaW9ucyBoZSBzZW50IG9uIHRoZSBNTCBhbmQgYmFzZWQgbXkgbG9jYWwKICBicmFu
Y2ggb24gaGlzIHdvcmsKLSBiZWNhdXNlIHRlc3RzIGJyb3VnaHQgYnkgdGhpcyBzZXJpZXMgY3Vy
cmVudGx5IGNhbid0IHJ1biBvbiBCUEYgQ0k6CiAgdGhleSBleHBlY3Qga2FzYW4gbXVsdGlzaG90
IHRvIGJlIGVuYWJsZWQsIG90aGVyd2lzZSB0aGUgZmlyc3QgdGVzdAogIHdpbGwgbWFrZSBhbGwg
b3RoZXIga2FzYW4tcmVsYXRlZCB0ZXN0cyBmYWlsLgotIGJlY2F1c2Ugc29tZSBjYXNlcyBsaWtl
IGF0b21pYyBsb2Fkcy9zdG9yZXMgYXJlIG5vdCBpbnN0cnVtZW50ZWQgeWV0CiAgKGFuZCBhcmUg
c3RpbGwgbWFraW5nIG1lIHNjcmF0Y2ggbXkgaGVhZCkKLSBiZWNhdXNlIGl0IHdpbGwgaG9wZWZ1
bGx5IHByb3ZpZGUgYSBnb29kIGJhc2lzIHRvIGRpc2N1c3MgdGhlIHRvcGljIGF0CiAgTFNGTU1C
UEYgKHNlZSBbM10pCgpEZXNwaXRlIHRoaXMgc2VyaWVzIG5vdCBiZWluZyByZWFkeSBmb3IgaW50
ZWdyYXRpb24geWV0LCBhbnlvbmUKaW50ZXJlc3RlZCBpbiBydW5uaW5nIGl0IGxvY2FsbHkgY2Fu
IHBlcmZvcm0gdGhlIGZvbGxvd2luZyBzdGVwcyB0byBydW4KdGhlIEpJVGVkIEtBU0FOIGluc3Ry
dW1lbnRhdGlvbiBzZWxmdGVzdHM6Ci0gcmViYXNpbmcgbG9jYWxseSB0aGlzIHNlcmllcyBvbiBb
Ml0KLSBidWlsZGluZyBhbmQgcnVubmluZyB0aGUgY29ycmVzcG9uZGluZyBrZXJuZWwgd2l0aCBr
YXNhbl9tdWx0aV9zaG90CiAgZW5hYmxlZAotIHJ1bm5pbmcgYHRlc3RfcHJvZ3MgLWEga2FzYW5g
CgpBbmQgc2hvdWxkIGdldCBhIHZhcmlldHkgb2YgS0FTQU4gdGVzdHMgZXhlY3V0ZWQgZm9yIEJQ
RiBwcm9ncmFtczoKCiAgIzE2Mi8xICAga2FzYW4vYnBmX2thc2FuX3VhZl9yZWFkXzE6T0sKICAj
MTYyLzIgICBrYXNhbi9icGZfa2FzYW5fdWFmX3JlYWRfMjpPSwogICMxNjIvMyAgIGthc2FuL2Jw
Zl9rYXNhbl91YWZfcmVhZF80Ok9LCiAgIzE2Mi80ICAga2FzYW4vYnBmX2thc2FuX3VhZl9yZWFk
Xzg6T0sKICAjMTYyLzUgICBrYXNhbi9icGZfa2FzYW5fdWFmX3dyaXRlXzE6T0sKICAjMTYyLzYg
ICBrYXNhbi9icGZfa2FzYW5fdWFmX3dyaXRlXzI6T0sKICAjMTYyLzcgICBrYXNhbi9icGZfa2Fz
YW5fdWFmX3dyaXRlXzQ6T0sKICAjMTYyLzggICBrYXNhbi9icGZfa2FzYW5fdWFmX3dyaXRlXzg6
T0sKICAjMTYyLzkgICBrYXNhbi9icGZfa2FzYW5fb29iX3JlYWRfMTpPSwogICMxNjIvMTAgIGth
c2FuL2JwZl9rYXNhbl9vb2JfcmVhZF8yOk9LCiAgIzE2Mi8xMSAga2FzYW4vYnBmX2thc2FuX29v
Yl9yZWFkXzQ6T0sKICAjMTYyLzEyICBrYXNhbi9icGZfa2FzYW5fb29iX3JlYWRfODpPSwogICMx
NjIvMTMgIGthc2FuL2JwZl9rYXNhbl9vb2Jfd3JpdGVfMTpPSwogICMxNjIvMTQgIGthc2FuL2Jw
Zl9rYXNhbl9vb2Jfd3JpdGVfMjpPSwogICMxNjIvMTUgIGthc2FuL2JwZl9rYXNhbl9vb2Jfd3Jp
dGVfNDpPSwogICMxNjIvMTYgIGthc2FuL2JwZl9rYXNhbl9vb2Jfd3JpdGVfODpPSwogICMxNjIg
ICAgIGthc2FuOk9LCiAgU3VtbWFyeTogMS8xNiBQQVNTRUQsIDAgU0tJUFBFRCwgMCBGQUlMRUQK
ClsxXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9icGYvREc3VUcxMTJBVkJDLkpLWUlTRFRBTTMw
VEBib290bGluLmNvbS8KWzJdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2JwZi9jb3Zlci4xNzc2
MDYyODg1LmdpdC54dWt1b2hhaUBob3RtYWlsLmNvbS8KWzNdIGh0dHBzOi8vbG9yZS5rZXJuZWwu
b3JnL2JwZi9ER0dOQ1hYNzlIOE8uMlA2SzhMMVFXMU04S0Bib290bGluLmNvbS8KClNpZ25lZC1v
ZmYtYnk6IEFsZXhpcyBMb3Rob3LDqSAoZUJQRiBGb3VuZGF0aW9uKSA8YWxleGlzLmxvdGhvcmVA
Ym9vdGxpbi5jb20+Ci0tLQpBbGV4aXMgTG90aG9yw6kgKGVCUEYgRm91bmRhdGlvbikgKDgpOgog
ICAgICBrYXNhbjogZXhwb3NlIGdlbmVyaWMga2FzYW4gaGVscGVycwogICAgICBicGY6IG1hcmsg
aW5zdHJ1Y3Rpb25zIGFjY2Vzc2luZyBwcm9ncmFtIHN0YWNrCiAgICAgIGJwZjogYWRkIEJQRl9K
SVRfS0FTQU4gZm9yIEtBU0FOIGluc3RydW1lbnRhdGlvbiBvZiBKSVRlZCBwcm9ncmFtcwogICAg
ICBicGYsIHg4NjogYWRkIGhlbHBlciB0byBlbWl0IGthc2FuIGNoZWNrcyBpbiB4ODYgSklUZWQg
cHJvZ3JhbXMKICAgICAgYnBmLCB4ODY6IGVtaXQgS0FTQU4gY2hlY2tzIGludG8geDg2IEpJVGVk
IHByb2dyYW1zCiAgICAgIHNlbGZ0ZXN0cy9icGY6IGRvIG5vdCBydW4gdmVyaWZpZXIgSklUIHRl
c3RzIHdoZW4gQlBGX0pJVF9LQVNBTiBpcyBlbmFibGVkCiAgICAgIGJwZiwgeDg2OiBlbmFibGUg
S0FTQU4gZm9yIEpJVGVkIHByb2dyYW1zIG9uIHg4NgogICAgICBzZWxmdGVzdHMvYnBmOiBhZGQg
dGVzdHMgdG8gdmFsaWRhdGUgS0FTQU4gb24gSklUIHByb2dyYW1zCgogYXJjaC94ODYvS2NvbmZp
ZyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDEgKwogYXJjaC94ODYvbmV0
L2JwZl9qaXRfY29tcC5jICAgICAgICAgICAgICAgICAgICAgICAgfCAxMDYgKysrKysrKysrKysr
KwogaW5jbHVkZS9saW51eC9icGYuaCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAg
IDIgKwogaW5jbHVkZS9saW51eC9icGZfdmVyaWZpZXIuaCAgICAgICAgICAgICAgICAgICAgICAg
fCAgIDIgKwogaW5jbHVkZS9saW51eC9rYXNhbi5oICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgfCAgMTMgKysKIGtlcm5lbC9icGYvS2NvbmZpZyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHwgICA5ICsrCiBrZXJuZWwvYnBmL2NvcmUuYyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICB8ICAxMCArKwoga2VybmVsL2JwZi92ZXJpZmllci5jICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgfCAgIDcgKwogbW0va2FzYW4va2FzYW4uaCAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgfCAgMTAgLS0KIHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2JwZi9w
cm9nX3Rlc3RzL2thc2FuLmMgICAgIHwgMTY1ICsrKysrKysrKysrKysrKysrKysrKwogdG9vbHMv
dGVzdGluZy9zZWxmdGVzdHMvYnBmL3Byb2dzL2thc2FuLmMgICAgICAgICAgfCAxNDYgKysrKysr
KysrKysrKysrKysrCiAuLi4vdGVzdGluZy9zZWxmdGVzdHMvYnBmL3Rlc3Rfa21vZHMvYnBmX3Rl
c3Rtb2QuYyB8ICA3OSArKysrKysrKysrCiB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9icGYvdGVz
dF9sb2FkZXIuYyAgICAgICAgICB8ICAgNSArCiB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9icGYv
dW5wcml2X2hlbHBlcnMuYyAgICAgICB8ICAgNSArCiB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9i
cGYvdW5wcml2X2hlbHBlcnMuaCAgICAgICB8ICAgMSArCiAxNSBmaWxlcyBjaGFuZ2VkLCA1NTEg
aW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25zKC0pCi0tLQpiYXNlLWNvbW1pdDogNzk5MGEwNzFi
MzI4ODdhMWE4ODM5NTJlOGNmNjAxMzRiNmQ2ZmVhMApjaGFuZ2UtaWQ6IDIwMjYwMTI2LWthc2Fu
LWZjZDY4ZjY0Y2Q3YgoKQmVzdCByZWdhcmRzLAotLSAgCkFsZXhpcyBMb3Rob3LDqSAoZUJQRiBG
b3VuZGF0aW9uKSA8YWxleGlzLmxvdGhvcmVAYm9vdGxpbi5jb20+CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QK
TGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1h
aWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
