Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id n704CWf662k1TgAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Sat, 25 Apr 2026 01:19:03 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A1817463FF5
	for <lists+linux-stm32@lfdr.de>; Sat, 25 Apr 2026 01:19:02 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 16787C87EC6;
	Fri, 24 Apr 2026 23:19:02 +0000 (UTC)
Received: from out-187.mta1.migadu.com (out-187.mta1.migadu.com
 [95.215.58.187])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 42AD5C32EB0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Apr 2026 23:19:00 +0000 (UTC)
Message-ID: <7dd64547-25a4-46de-a896-98fcec04468e@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1777072738;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P3XVMe3dGeABivLaYIdooN1MvQa1CctnziG70XU09po=;
 b=lAdngFjWpn+SFIEIgyjCn6oyJ7s6mP8JViggHzKVI1eQOG8r8fZE96FmVDJRHvA5PSglKz
 UM1P3b5Y3bU4XRPVejznw6aBsaRiopshcyt4CJCQ3+MTz1tCmr61vtPiwmaHEKEmgNqEbm
 tyMnnBKBDxXtgqkPNrAauQU71Wd0y8w=
Date: Fri, 24 Apr 2026 16:18:29 -0700
MIME-Version: 1.0
To: =?UTF-8?Q?Alexis_Lothor=C3=A9_=28eBPF_Foundation=29?=
 <alexis.lothore@bootlin.com>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman
 <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>,
 Song Liu <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>,
 Jiri Olsa <jolsa@kernel.org>, John Fastabend <john.fastabend@gmail.com>,
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
References: <20260413-kasan-v1-0-1a5831230821@bootlin.com>
 <20260413-kasan-v1-2-1a5831230821@bootlin.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Ihor Solodrai <ihor.solodrai@linux.dev>
In-Reply-To: <20260413-kasan-v1-2-1a5831230821@bootlin.com>
X-Migadu-Flow: FLOW_OUT
Cc: linux-kselftest@vger.kernel.org,
 Bastien Curutchet <bastien.curutchet@bootlin.com>, netdev@vger.kernel.org,
 ebpf@linuxfoundation.org, linux-kernel@vger.kernel.org,
 kasan-dev@googlegroups.com, linux-mm@kvack.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, bpf@vger.kernel.org,
 Xu Kuohai <xukuohai@huawei.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH RFC bpf-next 2/8] bpf: mark instructions
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
X-Rspamd-Queue-Id: A1817463FF5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.49 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[linux.dev:s=key1];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[linux.dev : SPF not aligned (relaxed),none];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:alexis.lothore@bootlin.com,m:ast@kernel.org,m:daniel@iogearbox.net,m:andrii@kernel.org,m:martin.lau@linux.dev,m:eddyz87@gmail.com,m:memxor@gmail.com,m:song@kernel.org,m:yonghong.song@linux.dev,m:jolsa@kernel.org,m:john.fastabend@gmail.com,m:davem@davemloft.net,m:dsahern@kernel.org,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:shuah@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:ryabinin.a.a@gmail.com,m:glider@google.com,m:andreyknvl@gmail.com,m:dvyukov@google.com,m:vincenzo.frascino@arm.com,m:akpm@linux-foundation.org,m:linux-kselftest@vger.kernel.org,m:bastien.curutchet@bootlin.com,m:netdev@vger.kernel.org,m:ebpf@linuxfoundation.org,m:linux-kernel@vger.kernel.org,m:kasan-dev@googlegroups.com,m:linux-mm@kvack.org,m:thomas.petazzoni@bootlin.com,m:bpf@vger.kernel.org,m:xukuohai@huawei.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead
 .org,m:johnfastabend@gmail.com,m:mcoquelinstm32@gmail.com,m:ryabininaa@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[bootlin.com,kernel.org,iogearbox.net,linux.dev,gmail.com,davemloft.net,redhat.com,alien8.de,linux.intel.com,zytor.com,foss.st.com,google.com,arm.com,linux-foundation.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[40];
	FORGED_SENDER(0.00)[ihor.solodrai@linux.dev,linux-stm32-bounces@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[linux.dev:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ihor.solodrai@linux.dev,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.755];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[linux-stm32];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:mid,bootlin.com:email,stormreply.com:url,stormreply.com:email]

T24gNC8xMy8yNiAxMToyOCBBTSwgQWxleGlzIExvdGhvcsODwqkgKGVCUEYgRm91bmRhdGlvbikg
d3JvdGU6Cj4gSW4gb3JkZXIgdG8gcHJlcGFyZSB0byBlbWl0IEtBU0FOIGNoZWNrcyBpbiBKSVRl
ZCBwcm9ncmFtcywgSklUCj4gY29tcGlsZXJzIG5lZWQgdG8gYmUgYXdhcmUgYWJvdXQgd2hldGhl
ciBzb21lIGxvYWQvc3RvcmUgaW5zdHJ1Y3Rpb25zCj4gYXJlIHRhcmdldGluZyB0aGUgYnBmIHBy
b2dyYW0gc3RhY2ssIGFzIHRob3NlIHNob3VsZCBub3QgYmUgbW9uaXRvcmVkCj4gKHdlIGFscmVh
ZHkgaGF2ZSBndWFyZCBwYWdlcyBmb3IgdGhhdCwgYW5kIGl0IGlzIGRpZmZpY3VsdCBhbnl3YXkg
dG8KPiBjb3JyZWN0bHkgbW9uaXRvciBhbnkga2luZCBvZiBkYXRhIHBhc3NlZCBvbiBzdGFjayku
Cj4gCj4gVG8gc3VwcG9ydCB0aGlzIG5lZWQsIG1ha2UgdGhlIEJQRiB2ZXJpZmllciBtYXJrIHRo
ZSBpbnN0cnVjdGlvbnMgdGhhdAo+IGFjY2VzcyBwcm9ncmFtIHN0YWNrOgo+IC0gYWRkIGEgc2V0
dGVyIHRoYXQgYWxsb3dzIHRoZSB2ZXJpZmllciB0byBtYXJrIGluc3RydWN0aW9ucyBhY2Nlc3Np
bmcKPiAgIHRoZSBwcm9ncmFtIHN0YWNrCj4gLSBhZGQgYSBnZXR0ZXIgdGhhdCBhbGxvd3MgSklU
IGNvbXBpbGVycyB0byBjaGVjayB3aGV0aGVyIGluc3RydWN0aW9ucwo+ICAgYmVpbmcgSklUZWQg
YXJlIGFjY2Vzc2luZyB0aGUgc3RhY2sKPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbGV4aXMgTG90aG9y
w6kgKGVCUEYgRm91bmRhdGlvbikgPGFsZXhpcy5sb3Rob3JlQGJvb3RsaW4uY29tPgo+IC0tLQo+
ICBpbmNsdWRlL2xpbnV4L2JwZi5oICAgICAgICAgIHwgIDIgKysKPiAgaW5jbHVkZS9saW51eC9i
cGZfdmVyaWZpZXIuaCB8ICAyICsrCj4gIGtlcm5lbC9icGYvY29yZS5jICAgICAgICAgICAgfCAx
MCArKysrKysrKysrCj4gIGtlcm5lbC9icGYvdmVyaWZpZXIuYyAgICAgICAgfCAgNyArKysrKysr
Cj4gIDQgZmlsZXMgY2hhbmdlZCwgMjEgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9p
bmNsdWRlL2xpbnV4L2JwZi5oIGIvaW5jbHVkZS9saW51eC9icGYuaAo+IGluZGV4IGI0YjcwM2M5
MGNhOS4uNzc0YTAzOTVjNDk4IDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvbGludXgvYnBmLmgKPiAr
KysgYi9pbmNsdWRlL2xpbnV4L2JwZi5oCj4gQEAgLTE1NDMsNiArMTU0Myw4IEBAIHZvaWQgYnBm
X2ppdF91bmNoYXJnZV9tb2RtZW0odTMyIHNpemUpOwo+ICBib29sIGJwZl9wcm9nX2hhc190cmFt
cG9saW5lKGNvbnN0IHN0cnVjdCBicGZfcHJvZyAqcHJvZyk7Cj4gIGJvb2wgYnBmX2luc25faXNf
aW5kaXJlY3RfdGFyZ2V0KGNvbnN0IHN0cnVjdCBicGZfdmVyaWZpZXJfZW52ICplbnYsIGNvbnN0
IHN0cnVjdCBicGZfcHJvZyAqcHJvZywKPiAgCQkJCSBpbnQgaW5zbl9pZHgpOwo+ICtib29sIGJw
Zl9pbnNuX2FjY2Vzc2VzX3N0YWNrKGNvbnN0IHN0cnVjdCBicGZfdmVyaWZpZXJfZW52ICplbnYs
Cj4gKwkJCSAgICAgY29uc3Qgc3RydWN0IGJwZl9wcm9nICpwcm9nLCBpbnQgaW5zbl9pZHgpOwo+
ICAjZWxzZQo+ICBzdGF0aWMgaW5saW5lIGludCBicGZfdHJhbXBvbGluZV9saW5rX3Byb2coc3Ry
dWN0IGJwZl90cmFtcF9saW5rICpsaW5rLAo+ICAJCQkJCSAgIHN0cnVjdCBicGZfdHJhbXBvbGlu
ZSAqdHIsCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvYnBmX3ZlcmlmaWVyLmggYi9pbmNs
dWRlL2xpbnV4L2JwZl92ZXJpZmllci5oCj4gaW5kZXggYjE0OGY4MTZmMjViLi5hYjk5ZWQ0YzQy
MjcgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9saW51eC9icGZfdmVyaWZpZXIuaAo+ICsrKyBiL2lu
Y2x1ZGUvbGludXgvYnBmX3ZlcmlmaWVyLmgKPiBAQCAtNjYwLDYgKzY2MCw4IEBAIHN0cnVjdCBi
cGZfaW5zbl9hdXhfZGF0YSB7Cj4gIAl1MTYgY29uc3RfcmVnX21hcF9tYXNrOwo+ICAJdTE2IGNv
bnN0X3JlZ19zdWJwcm9nX21hc2s7Cj4gIAl1MzIgY29uc3RfcmVnX3ZhbHNbMTBdOwo+ICsJLyog
aW5zdHJ1Y3Rpb24gYWNjZXNzZXMgc3RhY2sgKi8KPiArCWJvb2wgYWNjZXNzZXNfc3RhY2s7Cj4g
IH07Cj4gIAo+ICAjZGVmaW5lIE1BWF9VU0VEX01BUFMgNjQgLyogbWF4IG51bWJlciBvZiBtYXBz
IGFjY2Vzc2VkIGJ5IG9uZSBlQlBGIHByb2dyYW0gKi8KPiBkaWZmIC0tZ2l0IGEva2VybmVsL2Jw
Zi9jb3JlLmMgYi9rZXJuZWwvYnBmL2NvcmUuYwo+IGluZGV4IDhiMDE4ZmY0ODg3NS4uMzQwYWJm
ZGFkYmVkIDEwMDY0NAo+IC0tLSBhL2tlcm5lbC9icGYvY29yZS5jCj4gKysrIGIva2VybmVsL2Jw
Zi9jb3JlLmMKPiBAQCAtMTU4Miw2ICsxNTgyLDE2IEBAIGJvb2wgYnBmX2luc25faXNfaW5kaXJl
Y3RfdGFyZ2V0KGNvbnN0IHN0cnVjdCBicGZfdmVyaWZpZXJfZW52ICplbnYsIGNvbnN0IHN0cnVj
Cj4gIAlpbnNuX2lkeCArPSBwcm9nLT5hdXgtPnN1YnByb2dfc3RhcnQ7Cj4gIAlyZXR1cm4gZW52
LT5pbnNuX2F1eF9kYXRhW2luc25faWR4XS5pbmRpcmVjdF90YXJnZXQ7Cj4gIH0KPiArCj4gK2Jv
b2wgYnBmX2luc25fYWNjZXNzZXNfc3RhY2soY29uc3Qgc3RydWN0IGJwZl92ZXJpZmllcl9lbnYg
KmVudiwKPiArCQkJICAgICBjb25zdCBzdHJ1Y3QgYnBmX3Byb2cgKnByb2csIGludCBpbnNuX2lk
eCkKPiArewo+ICsJaWYgKCFlbnYpCj4gKwkJcmV0dXJuIGZhbHNlOwo+ICsJaW5zbl9pZHggKz0g
cHJvZy0+YXV4LT5zdWJwcm9nX3N0YXJ0Owo+ICsJcmV0dXJuIGVudi0+aW5zbl9hdXhfZGF0YVtp
bnNuX2lkeF0uYWNjZXNzZXNfc3RhY2s7Cj4gK30KPiArCj4gICNlbmRpZiAvKiBDT05GSUdfQlBG
X0pJVCAqLwo+ICAKPiAgLyogQmFzZSBmdW5jdGlvbiBmb3Igb2Zmc2V0IGNhbGN1bGF0aW9uLiBO
ZWVkcyB0byBnbyBpbnRvIC50ZXh0IHNlY3Rpb24sCj4gZGlmZiAtLWdpdCBhL2tlcm5lbC9icGYv
dmVyaWZpZXIuYyBiL2tlcm5lbC9icGYvdmVyaWZpZXIuYwo+IGluZGV4IDFlMzZiOWU5MTI3Ny4u
N2JjZTRmYjRlNTQwIDEwMDY0NAo+IC0tLSBhL2tlcm5lbC9icGYvdmVyaWZpZXIuYwo+ICsrKyBi
L2tlcm5lbC9icGYvdmVyaWZpZXIuYwo+IEBAIC0zNTAyLDYgKzM1MDIsMTEgQEAgc3RhdGljIHZv
aWQgbWFya19pbmRpcmVjdF90YXJnZXQoc3RydWN0IGJwZl92ZXJpZmllcl9lbnYgKmVudiwgaW50
IGlkeCkKPiAgCWVudi0+aW5zbl9hdXhfZGF0YVtpZHhdLmluZGlyZWN0X3RhcmdldCA9IHRydWU7
Cj4gIH0KPiAgCj4gK3N0YXRpYyB2b2lkIG1hcmtfaW5zbl9hY2Nlc3Nlc19zdGFjayhzdHJ1Y3Qg
YnBmX3ZlcmlmaWVyX2VudiAqZW52LCBpbnQgaWR4KQo+ICt7Cj4gKwllbnYtPmluc25fYXV4X2Rh
dGFbaWR4XS5hY2Nlc3Nlc19zdGFjayA9IHRydWU7Cj4gK30KPiArCj4gICNkZWZpbmUgTFJfRlJB
TUVOT19CSVRTCTMKPiAgI2RlZmluZSBMUl9TUElfQklUUwk2Cj4gICNkZWZpbmUgTFJfRU5UUllf
QklUUwkoTFJfU1BJX0JJVFMgKyBMUl9GUkFNRU5PX0JJVFMgKyAxKQo+IEBAIC02NDkwLDYgKzY0
OTUsOCBAQCBzdGF0aWMgaW50IGNoZWNrX21lbV9hY2Nlc3Moc3RydWN0IGJwZl92ZXJpZmllcl9l
bnYgKmVudiwgaW50IGluc25faWR4LCB1MzIgcmVnbgo+ICAJCWVsc2UKPiAgCQkJZXJyID0gY2hl
Y2tfc3RhY2tfd3JpdGUoZW52LCByZWdubywgb2ZmLCBzaXplLAo+ICAJCQkJCQl2YWx1ZV9yZWdu
bywgaW5zbl9pZHgpOwo+ICsKPiArCQltYXJrX2luc25fYWNjZXNzZXNfc3RhY2soZW52LCBpbnNu
X2lkeCk7CgpJIGFtIG5vdCBzdXJlIHRoaXMgY2FuIGJlIGRvbmUgdW5jb25kaXRpb25hbGx5IGhl
cmUuCgpJdCBtYXkgYmUgcG9zc2libGUgaW4gZGlmZmVyZW50IHN0YXRlcyB0byBoYXZlIGRpZmZl
cmVudCBwb2ludGVyCnR5cGVzIGZvciB0aGUgYWZmZWN0ZWQgcmVnIChQVFJfVE9fU1RBQ0sgaW4g
b25lIGV4ZWN1dGlvbiBwYXRoIGFuZCBzYXkKUFRSX1RPX01BUF9WQUxVRSBpbiBhbm90aGVyKS4g
QW5kIGlmIHNldCB1bmNvZGl0aW9uYWxseSwKaW5zdHJ1bWVudGF0aW9uIG1heSBiZSBza2lwcGVk
IGZvciBsZWdpdGltYXRlIHRhcmdldHMuCgpNYXliZSByZXNldCBieSBkZWZhdWx0IGluIGNoZWNr
X21lbV9hY2Nlc3MoKT8KCj4gIAl9IGVsc2UgaWYgKHJlZ19pc19wa3RfcG9pbnRlcihyZWcpKSB7
Cj4gIAkJaWYgKHQgPT0gQlBGX1dSSVRFICYmICFtYXlfYWNjZXNzX2RpcmVjdF9wa3RfZGF0YShl
bnYsIE5VTEwsIHQpKSB7Cj4gIAkJCXZlcmJvc2UoZW52LCAiY2Fubm90IHdyaXRlIGludG8gcGFj
a2V0XG4iKTsKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0
b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
