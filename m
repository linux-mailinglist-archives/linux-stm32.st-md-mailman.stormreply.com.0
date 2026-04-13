Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 75DTOaN732k3UAAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Apr 2026 13:50:59 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F5A940406A
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Apr 2026 13:50:59 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 154E7C8F295;
	Wed, 15 Apr 2026 11:50:59 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 53D22C01FB5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Apr 2026 22:20:04 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-43cf8d550bdso4667577f8f.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Apr 2026 15:20:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776118804; cv=none;
 d=google.com; s=arc-20240605;
 b=h4FcsFXNN1s2eDMFQ8ZRb3cnVU08fAiLFPtu7nUEMxnHWwKLzzLsuyz43xAfeG2cHL
 F7CM4CeD/6DodBFJYe3pAmtYtYW3n66YA90K+z70YBeYIgNet6GBAluXTQMBRyyNpmBz
 BeFF2RD3Po5E2vmJqs4tvy73AOcmEM5p1YAsUfTfb/P/cl24H5B+WkURbCIMDs8yX3hR
 0YOPOVeT78ph6IvZDBoQ9yfZQNO9K+ddVpGGHi05ssuvfm8T8RTwGT4y7iIPea3gKbdu
 ym/Fauwl5MY6JhTSjbyHwApB9kw6H4OiCjoOmXkd1I8gOW9ZqgZ2B9pMAqDTnI4/svO+
 2Ibw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=00dCXJraG3Nz3xP1Zulfjafowes4Ec60LER8Tb820vo=;
 fh=UQIX0DkOrLjUdtkGE30vJl9gi5cGKkyqFom7PYJq8N4=;
 b=JpKZWGsvRvXcrxAijouvn16k0sJxmjHt+X7RgUBnrAwdWcoAp9Y6/08Dsk8+MZp/Ue
 VOs62vVJbUY07vrAWu+/8PC9dxOzVDPoOK7C5kwFIDY9Ila62C54KZFgqPS+omhtMD+9
 IPLB7QBAG1H3CXY+IiFF5tgMT3VKI+asVjLB3DsXeGwxyE/g+gwcamlG5+RqGsLFINdZ
 j9imWbMkvfzoEKGA6UDpYzH1aAc9vjLQ3LIUrelwZq3tpYKeiRWgDPPpM7biCPBJddZ5
 LdzZtq98s8STFsJDORRYmJlbDAq8FyVtnjGlzXjnAWyDQ0m4EpdZHZJREF2mB819CBGi
 sskg==; darn=st-md-mailman.stormreply.com
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1776118804; x=1776723604;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=00dCXJraG3Nz3xP1Zulfjafowes4Ec60LER8Tb820vo=;
 b=ATcpJVPxlohdoOsGIlzSzOOD77g/BfalJJZIo0BsyGNTKp48B8Lz1XPwVVcXzC1Ani
 E2IvKmV1mBm8a7B3XB9nqMIko4/DMx45fdJzbiAY4LobPUmZQ8g1qAovVRsvQ5ly3pDc
 acSIIlcx4Jk28i1Y3c9dVwQOP52IPv+5eYQ8WqhgBLOJ9OF+EXed/TEOLIpvSz+u85Fl
 M3N5al4ejqxodWJW/wG1IbvF5YeqYeN6hVE7Iy5e9Wrry9GT8hEyesW9RvO0fK/O5HKe
 d1iA0O5hKYZiRWNuFPh22Oo6NoNbzmEOh935Kq4MoDb1eCLeG3Eadep9nE/QRo5PWk7F
 YL5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776118804; x=1776723604;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=00dCXJraG3Nz3xP1Zulfjafowes4Ec60LER8Tb820vo=;
 b=EpdAixqirdCpduIm+AktXks0UBa0oGZQJYG6aUpox0dhA0q0LAD1UcMd2RXUgt+cXt
 LBQMhfIek4c8WsHnvVhT/OLG1teav3O+6YOMCeMTceEAWSfOGcmYFjdn8wprsZf8YN1y
 aRRMvEVrMjU8rYWVj86sZdm6pv9UPGqzW0wS136te3ybsEDYWrUVtpqjwH6kgR0O1pbS
 rCDQhISMXiIouncTOrXpdUAvFFrb+SP7cYUv4k6Tyk0xHcF0ZikfcBDWogFt9VbPTZ2a
 p9iGvEFg3ddr8FZ+S0a3dZKV8u65Vrri8gowsv/jeQXA1etzt5i3XJPIxmI5pW5ZB3MU
 W2Xw==
X-Forwarded-Encrypted: i=1;
 AFNElJ+6d3PHJI7kjT4gfdEgKNRUBZq25EohW2MwaVGosSPuFv2x+55bvs+VP4Qg2VQXcoZAzdnXaerqZ54XZQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yx4mNUmt0MhvXaFvY1TwhpUyfAzOi1YwCbsHbqjulPXdZrZ6fdT
 6mCBjuEjr/pkPnoCi3KaT0UygFusH3lE+re25B+nGRbsBLrTFtZQmy+Oa9iae2buF3OJl3nxCwc
 IqLWVilJklVkDEW3IpagL7hUCNEVq3UI=
X-Gm-Gg: AeBDies8vueaZUTK/HXMmRmJz3uYqqddeEqd5OnSP7TTsjWLxGVD6o4WtCXbgo5DP6L
 TppH2pEAL9Jauaj4Vj0/vGtNisHwTQ+21wsryueX9Xmq4mwVaSbKNQvdq9URFY9VZrpi+bdYNvz
 VhscVJMdfGe1KRP6imRLCPWPlRVfLfPQCEnBFEz/TD7KshVmVIIvnMC0Ku9zT3eBA4ZXW/uiGjn
 NN+dicmHjXbU9qTJDGTexY797xXkKSiYNNzLUinD0jdiGlHfMflTihsWRzrnJ8DJM/bbI2cPPVU
 m3J/bRDU8Y16Z9F8eiQTABCedIyrY4MUZ6ClE6EV
X-Received: by 2002:a05:6000:2c0a:b0:43d:576e:63 with SMTP id
 ffacd0b85a97d-43d642d363bmr22139849f8f.39.1776118803430; Mon, 13 Apr 2026
 15:20:03 -0700 (PDT)
MIME-Version: 1.0
References: <20260413-kasan-v1-0-1a5831230821@bootlin.com>
 <20260413-kasan-v1-1-1a5831230821@bootlin.com>
In-Reply-To: <20260413-kasan-v1-1-1a5831230821@bootlin.com>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Tue, 14 Apr 2026 00:19:52 +0200
X-Gm-Features: AQROBzDwNCNsQCHGNuFB9CZ_Z628O1o6wbow_4AViz1wzqVpQC382sCN6eDZsJc
Message-ID: <CA+fCnZfubV6LgRjO3NQvhrG2Q5o0ftkFFupLWVYS50XDnmCaog@mail.gmail.com>
To: =?UTF-8?Q?Alexis_Lothor=C3=A9_=28eBPF_Foundation=29?=
 <alexis.lothore@bootlin.com>
X-Mailman-Approved-At: Wed, 15 Apr 2026 11:50:57 +0000
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Song Liu <song@kernel.org>,
 Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Alexander Potapenko <glider@google.com>,
 Yonghong Song <yonghong.song@linux.dev>, "H. Peter Anvin" <hpa@zytor.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>, Shuah Khan <shuah@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, Xu Kuohai <xukuohai@huawei.com>,
 Daniel Borkmann <daniel@iogearbox.net>, x86@kernel.org,
 John Fastabend <john.fastabend@gmail.com>, Andrii Nakryiko <andrii@kernel.org>,
 kasan-dev@googlegroups.com, Ingo Molnar <mingo@redhat.com>,
 linux-arm-kernel@lists.infradead.org,
 Bastien Curutchet <bastien.curutchet@bootlin.com>,
 Jiri Olsa <jolsa@kernel.org>, ebpf@linuxfoundation.org,
 Alexei Starovoitov <ast@kernel.org>, Borislav Petkov <bp@alien8.de>,
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, bpf@vger.kernel.org,
 Dmitry Vyukov <dvyukov@google.com>, linux-kselftest@vger.kernel.org,
 linux-mm@kvack.org, netdev@vger.kernel.org, David Ahern <dsahern@kernel.org>,
 linux-kernel@vger.kernel.org, Eduard Zingerman <eddyz87@gmail.com>,
 Thomas Gleixner <tglx@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Martin KaFai Lau <martin.lau@linux.dev>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH RFC bpf-next 1/8] kasan: expose generic
	kasan helpers
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
X-Spamd-Result: default: False [5.49 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:google.com:reject}];
	DATE_IN_PAST(1.00)[37];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[andreyknvl@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[38];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:alexis.lothore@bootlin.com,m:thomas.petazzoni@bootlin.com,m:dave.hansen@linux.intel.com,m:song@kernel.org,m:ryabinin.a.a@gmail.com,m:glider@google.com,m:yonghong.song@linux.dev,m:hpa@zytor.com,m:vincenzo.frascino@arm.com,m:shuah@kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:xukuohai@huawei.com,m:daniel@iogearbox.net,m:x86@kernel.org,m:john.fastabend@gmail.com,m:andrii@kernel.org,m:kasan-dev@googlegroups.com,m:mingo@redhat.com,m:linux-arm-kernel@lists.infradead.org,m:bastien.curutchet@bootlin.com,m:jolsa@kernel.org,m:ebpf@linuxfoundation.org,m:ast@kernel.org,m:bp@alien8.de,m:memxor@gmail.com,m:bpf@vger.kernel.org,m:dvyukov@google.com,m:linux-kselftest@vger.kernel.org,m:linux-mm@kvack.org,m:netdev@vger.kernel.org,m:dsahern@kernel.org,m:linux-kernel@vger.kernel.org,m:eddyz87@gmail.com,m:tglx@kernel.org,m:mcoquelin.stm32@gmail.com,m:akpm@linux-foundation.org,m:martin.lau@linux.dev,m:davem@davemloft.net,m:ryabininaa@gmail.com,m:johnfastabend@gmail.com,
 m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[bootlin.com,linux.intel.com,kernel.org,gmail.com,google.com,linux.dev,zytor.com,arm.com,st-md-mailman.stormreply.com,huawei.com,iogearbox.net,googlegroups.com,redhat.com,lists.infradead.org,linuxfoundation.org,alien8.de,vger.kernel.org,kvack.org,linux-foundation.org,davemloft.net];
	DKIM_TRACE(0.00)[gmail.com:-];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andreyknvl@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	NEURAL_SPAM(0.00)[0.140];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,st-md-mailman.stormreply.com:rdns,bootlin.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: 6F5A940406A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gTW9uLCBBcHIgMTMsIDIwMjYgYXQgODoyOeKAr1BNIEFsZXhpcyBMb3Rob3LDqSAoZUJQRiBG
b3VuZGF0aW9uKQo8YWxleGlzLmxvdGhvcmVAYm9vdGxpbi5jb20+IHdyb3RlOgo+Cj4gSW4gb3Jk
ZXIgdG8gcHJlcGFyZSBLQVNBTiBoZWxwZXJzIHRvIGJlIGNhbGxlZCBmcm9tIHRoZSBlQlBGIHN1
YnN5c3RlbQo+ICh0byBhZGQgS0FTQU4gaW5zdHJ1bWVudGF0aW9uIGF0IHJ1bnRpbWUgd2hlbiBK
SVRpbmcgZUJQRiBwcm9ncmFtcyksCj4gZXhwb3NlIHRoZSBfX2FzYW5fe2xvYWQsc3RvcmV9WCBm
dW5jdGlvbnMgaW4gbGludXgva2FzYW4uaAo+Cj4gU2lnbmVkLW9mZi1ieTogQWxleGlzIExvdGhv
csOpIChlQlBGIEZvdW5kYXRpb24pIDxhbGV4aXMubG90aG9yZUBib290bGluLmNvbT4KPiAtLS0K
PiAgaW5jbHVkZS9saW51eC9rYXNhbi5oIHwgMTMgKysrKysrKysrKysrKwo+ICBtbS9rYXNhbi9r
YXNhbi5oICAgICAgfCAxMCAtLS0tLS0tLS0tCj4gIDIgZmlsZXMgY2hhbmdlZCwgMTMgaW5zZXJ0
aW9ucygrKSwgMTAgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9r
YXNhbi5oIGIvaW5jbHVkZS9saW51eC9rYXNhbi5oCj4gaW5kZXggMzM4YTE5MjFhNTBhLi42ZjU4
MGQ0YTM5ZTQgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9saW51eC9rYXNhbi5oCj4gKysrIGIvaW5j
bHVkZS9saW51eC9rYXNhbi5oCj4gQEAgLTcxMCw0ICs3MTAsMTcgQEAgdm9pZCBrYXNhbl9ub25f
Y2Fub25pY2FsX2hvb2sodW5zaWduZWQgbG9uZyBhZGRyKTsKPiAgc3RhdGljIGlubGluZSB2b2lk
IGthc2FuX25vbl9jYW5vbmljYWxfaG9vayh1bnNpZ25lZCBsb25nIGFkZHIpIHsgfQo+ICAjZW5k
aWYgLyogQ09ORklHX0tBU0FOX0dFTkVSSUMgfHwgQ09ORklHX0tBU0FOX1NXX1RBR1MgKi8KPgo+
ICsjaWZkZWYgQ09ORklHX0tBU0FOX0dFTkVSSUMKPiArdm9pZCBfX2FzYW5fbG9hZDEodm9pZCAq
cCk7Cj4gK3ZvaWQgX19hc2FuX3N0b3JlMSh2b2lkICpwKTsKPiArdm9pZCBfX2FzYW5fbG9hZDIo
dm9pZCAqcCk7Cj4gK3ZvaWQgX19hc2FuX3N0b3JlMih2b2lkICpwKTsKPiArdm9pZCBfX2FzYW5f
bG9hZDQodm9pZCAqcCk7Cj4gK3ZvaWQgX19hc2FuX3N0b3JlNCh2b2lkICpwKTsKPiArdm9pZCBf
X2FzYW5fbG9hZDgodm9pZCAqcCk7Cj4gK3ZvaWQgX19hc2FuX3N0b3JlOCh2b2lkICpwKTsKPiAr
dm9pZCBfX2FzYW5fbG9hZDE2KHZvaWQgKnApOwo+ICt2b2lkIF9fYXNhbl9zdG9yZTE2KHZvaWQg
KnApOwo+ICsjZW5kaWYgLyogQ09ORklHX0tBU0FOX0dFTkVSSUMgKi8KClRoaXMgbG9va3MgdWds
eSwgbGV0J3Mgbm90IGRvIHRoaXMgdW5sZXNzIGl0J3MgcmVhbGx5IHJlcXVpcmVkLgoKWW91IGNh
biBqdXN0IHVzZSBrYXNhbl9jaGVja19yZWFkL3dyaXRlKCkgaW5zdGVhZCAtIHRoZXNlIGFyZSBw
dWJsaWMKd3JhcHBlcnMgYXJvdW5kIHRoZSBzYW1lIHNoYWRvdyBtZW1vcnkgY2hlY2tpbmcgZnVu
Y3Rpb25zLiBBbmQgdGhleQphbHNvIHdvcmsgd2l0aCB0aGUgU1dfVEFHUyBtb2RlLCBpbiBjYXNl
IHRoZSBCUEYgd291bGQgd2FudCB0byB1c2UKdGhhdCBtb2RlIGF0IHNvbWUgcG9pbnQuIChGb3Ig
SFdfVEFHUywgd2Ugb25seSBoYXZlIGthc2FuX2NoZWNrX2J5dGUoKQp0aGF0IGNoZWNrcyBhIHNp
bmdsZSBieXRlLCBidXQgaXQgY2FuIGJlIGV4dGVuZGVkIGluIHRoZSBmdXR1cmUgaWYKcmVxdWly
ZWQgdG8gYmUgdXNlZCBieSBCUEYuKQoKCgo+ICsKPiAgI2VuZGlmIC8qIExJTlVYX0tBU0FOX0gg
Ki8KPiBkaWZmIC0tZ2l0IGEvbW0va2FzYW4va2FzYW4uaCBiL21tL2thc2FuL2thc2FuLmgKPiBp
bmRleCBmYzkxNjlhNTQ3NjYuLjNiZmNlOGViMzEzNSAxMDA2NDQKPiAtLS0gYS9tbS9rYXNhbi9r
YXNhbi5oCj4gKysrIGIvbW0va2FzYW4va2FzYW4uaAo+IEBAIC01OTQsMTYgKzU5NCw2IEBAIHZv
aWQgX19hc2FuX2hhbmRsZV9ub19yZXR1cm4odm9pZCk7Cj4gIHZvaWQgX19hc2FuX2FsbG9jYV9w
b2lzb24odm9pZCAqLCBzc2l6ZV90IHNpemUpOwo+ICB2b2lkIF9fYXNhbl9hbGxvY2FzX3VucG9p
c29uKHZvaWQgKnN0YWNrX3RvcCwgc3NpemVfdCBzdGFja19ib3R0b20pOwo+Cj4gLXZvaWQgX19h
c2FuX2xvYWQxKHZvaWQgKik7Cj4gLXZvaWQgX19hc2FuX3N0b3JlMSh2b2lkICopOwo+IC12b2lk
IF9fYXNhbl9sb2FkMih2b2lkICopOwo+IC12b2lkIF9fYXNhbl9zdG9yZTIodm9pZCAqKTsKPiAt
dm9pZCBfX2FzYW5fbG9hZDQodm9pZCAqKTsKPiAtdm9pZCBfX2FzYW5fc3RvcmU0KHZvaWQgKik7
Cj4gLXZvaWQgX19hc2FuX2xvYWQ4KHZvaWQgKik7Cj4gLXZvaWQgX19hc2FuX3N0b3JlOCh2b2lk
ICopOwo+IC12b2lkIF9fYXNhbl9sb2FkMTYodm9pZCAqKTsKPiAtdm9pZCBfX2FzYW5fc3RvcmUx
Nih2b2lkICopOwo+ICB2b2lkIF9fYXNhbl9sb2FkTih2b2lkICosIHNzaXplX3Qgc2l6ZSk7Cj4g
IHZvaWQgX19hc2FuX3N0b3JlTih2b2lkICosIHNzaXplX3Qgc2l6ZSk7Cj4KPgo+IC0tCj4gMi41
My4wCj4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBs
eS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtc3RtMzIK
