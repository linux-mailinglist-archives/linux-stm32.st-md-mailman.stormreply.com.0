Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CNVeBaR732k2UAAAu9opvQ:T2
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Apr 2026 13:51:00 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 30AD5404088
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Apr 2026 13:51:00 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7AB7EC8F29F;
	Wed, 15 Apr 2026 11:50:59 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0D4E4C8F286
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Apr 2026 15:10:21 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-43d734223e4so1665831f8f.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Apr 2026 08:10:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776179421; cv=none;
 d=google.com; s=arc-20240605;
 b=gJ2IWesQkI2kNCSIHbMSCCAgXxQLf1ZMKsLKkSGKW8c4OR/h3vsKAPVht8yT3hjqEP
 zQnt+BSzwF4CHLoyCDVzhTHDBKUHA6lKE6uaB5n3eo0zWudMDE4BrB8294nrRq4JeCUG
 0vL2fSdRpQfnaC3bSQ7k2DXTDhGgBhJDLMYF2H9mJPlXgR/QTA/cr9B6uMYDUrAMgjUl
 2gHdhGaQKXE3Mo41C9Lr8KRebi8yO8pndHsadNcKNTX7++eX5hxxJNvJ0O9Dpvkp9nhF
 t6bMpipDoSo9cJpfZikcX+UVCXXOUtLZPgw39Qyx/GUmsSQCWn3+ChDtlnpQQGGTGByb
 qVBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=A7c7tKPqaKq3NgFiv2DNK8q/BvKoh1wbxDHgCCrA1+c=;
 fh=6CgE5TBF3ZiU2sfecBQup75IA6nspJJCKj60EOe+iGk=;
 b=ZeuRl6tZ36iWKX806sXXLN8lqftF7TcVJYafTxSx+PWotwHxqRWvVLvne6ycJd/XPX
 oTKg0qpTKirRlODwpzpdj7ErR/634iPaBvB79G2eSuB5oRl6HIQS7WMDC3i5bEcRtmH1
 jFAC6yo0bGP96zxBO3HwUmvh1YmxK4E2H4TnWpFuoTm420iUMVJaufDQlV+5OPY+ohiu
 d/Uv/HmpaVdW7Fl6x0F0boW4uE6vbN2UbgcslqMzZi9+5ZDua5cVj8wi8YsYzlzT13sr
 K/VWsxithB6ZKW51HuaJu7k2Q9TtZdkpAw754Mggq2T0VZ/MqqMJi0SRgBRHnOg/YoIL
 Mqpg==; darn=st-md-mailman.stormreply.com
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1776179421; x=1776784221;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=A7c7tKPqaKq3NgFiv2DNK8q/BvKoh1wbxDHgCCrA1+c=;
 b=djL+Pv4BXtriKDKpxaRIqg2IzvGuFnt58etbo4FlQpntbeiVy0qdpmF/kZ+382woK8
 E0xcj2MgYdDZK5nD5xTZ9hP6YCnAe1nqCw/FPC2vTbMyYXlUgw/hb/7MA+kzOBHlCMDx
 ihCxqEbZHVeRsd/oDmq+sphqIuYP8Arn3UIZwnzW7dCQPeKyLSRgtdwTnFRJDlC8L3mJ
 ZgOgPsFRQk+oD4aIqN5HprlqOnUY6wy8PP8NKORDmXyys+wB4UPX6fKj2prfDDGjVUFD
 emsVn0wqKWbTMQRLO61062n4as6AsNGqQOPKjIfINa9coGljwsfnzHgkV+ER27xpcwq2
 5goA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776179421; x=1776784221;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=A7c7tKPqaKq3NgFiv2DNK8q/BvKoh1wbxDHgCCrA1+c=;
 b=l9K3KmXJ4PWFHRKz1urUuxWhIRxT2X4OVPUM4oAZBPEhK43o9DXZnEHsOJUzvKMtSS
 VM6LVVyVDwr+/VoC7dChsx/h7KbFRB8lFEL/edAWEhZ4qzO/g5v/i2PSGelHJet9dh+0
 DcaU0knXJOOS1nzQF7Ww8uyw8nZlPGHVLdGOGGhc3ucYhMpr8GjTa26rqIN/rIS9lkyf
 QTzREhzgm44bs7qwdkvIWubfO/B0/eoEqGK6CiDJxkfFPivNPjPhMgegd140BXuiv9Gj
 OkxRa33DddAHrhhby4IuBIJnjTMSF/D1bjP58JDBYOPe/IpdPNrkSLR+g3Vfq9XuJo+W
 KJ3Q==
X-Forwarded-Encrypted: i=1;
 AFNElJ+k4L0zh9maTCKwVgpXyZOy8i+HRpMQ+EdWUxkocaDfCOdvnC82Kwbz0IvpeLL0+Szz/dEIG0+0ZaO+/w==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yzw7x4U9amKMJMktwADGk66NQugMh6l1Hog/I5vIXHNN01Pw2b5
 GhBbMmOGwGPpkq94jHM0clhAyn1Y7TJ3/A00i0f9veKYKMbkxcnFgmwjjsg8WopIUr05B0B61O4
 xTnxYHFS+xSpa8Kqoaw4N5yrAdfzC9Nk=
X-Gm-Gg: AeBDietLUYJt5Qqtt5R0R/jyZgoItoyImH89YOWXtF0UV6lIjc+Jbzky+G5vr4F92Qa
 8oZdIzNbU1Z/KOgjjE3ZJ6z4IJH1FyrhN4qM9dUYFcnrr5QkMJpDcEuaf26RxyhAg8OHRCkCglf
 1dR57Ce7pxM7q2+TDjfXrXqFbYTU+baZgYwgSyTy+4bUT5obhvm01smnnNs6CekG4vTtviF4TPn
 0RtZy5zqB5EpkyLCEV7beNEllKZxnTKV5aGqNFWSAfR8RTtXOg7ChPPBu8qWgH8STIp5gE6+iJO
 6vQLm7n6srwesvWZhsV77JDGWcBe2QFFjU5I3QCI
X-Received: by 2002:a05:6000:4110:b0:43e:a8cc:89b7 with SMTP id
 ffacd0b85a97d-43ea8cc8c24mr1517128f8f.3.1776179420992; Tue, 14 Apr 2026
 08:10:20 -0700 (PDT)
MIME-Version: 1.0
References: <20260413-kasan-v1-0-1a5831230821@bootlin.com>
 <20260413-kasan-v1-1-1a5831230821@bootlin.com>
 <CA+fCnZfubV6LgRjO3NQvhrG2Q5o0ftkFFupLWVYS50XDnmCaog@mail.gmail.com>
 <DHSWK17EZUDP.GIJ6BX2NFR6U@bootlin.com>
 <CAADnVQLJ=fJ7t1i2+_RYqU1gqYqiLP9Zrwo4vdZsgzjK_yzJTQ@mail.gmail.com>
In-Reply-To: <CAADnVQLJ=fJ7t1i2+_RYqU1gqYqiLP9Zrwo4vdZsgzjK_yzJTQ@mail.gmail.com>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Tue, 14 Apr 2026 17:10:08 +0200
X-Gm-Features: AQROBzAtXSFwPeCMpZ2dGca-DBLsSXREgEyBZSQFf7Waht1WxQ2QIbb8WTtAIYs
Message-ID: <CA+fCnZd31GzdpEqR8VhfK4JtUKyyRMgbBoAbeGACJgm7WvB6Vw@mail.gmail.com>
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
X-Mailman-Approved-At: Wed, 15 Apr 2026 11:50:57 +0000
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Song Liu <song@kernel.org>,
 Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Alexander Potapenko <glider@google.com>,
 Yonghong Song <yonghong.song@linux.dev>, "H. Peter Anvin" <hpa@zytor.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>, Shuah Khan <shuah@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, Xu Kuohai <xukuohai@huawei.com>,
 Daniel Borkmann <daniel@iogearbox.net>, X86 ML <x86@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>, Andrii Nakryiko <andrii@kernel.org>,
 kasan-dev <kasan-dev@googlegroups.com>, Ingo Molnar <mingo@redhat.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Bastien Curutchet <bastien.curutchet@bootlin.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, ebpf@linuxfoundation.org,
 Alexei Starovoitov <ast@kernel.org>, Borislav Petkov <bp@alien8.de>,
 =?UTF-8?Q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
 bpf <bpf@vger.kernel.org>, Dmitry Vyukov <dvyukov@google.com>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 linux-mm <linux-mm@kvack.org>, Network Development <netdev@vger.kernel.org>,
 David Ahern <dsahern@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 Eduard Zingerman <eddyz87@gmail.com>, Thomas Gleixner <tglx@kernel.org>,
 Jiri Olsa <jolsa@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 Martin KaFai Lau <martin.lau@linux.dev>,
 "David S. Miller" <davem@davemloft.net>,
 Kumar Kartikeya Dwivedi <memxor@gmail.com>
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
X-Spamd-Result: default: False [4.49 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:google.com:reject}];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:alexei.starovoitov@gmail.com,m:thomas.petazzoni@bootlin.com,m:dave.hansen@linux.intel.com,m:song@kernel.org,m:ryabinin.a.a@gmail.com,m:glider@google.com,m:yonghong.song@linux.dev,m:hpa@zytor.com,m:vincenzo.frascino@arm.com,m:shuah@kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:xukuohai@huawei.com,m:daniel@iogearbox.net,m:x86@kernel.org,m:john.fastabend@gmail.com,m:andrii@kernel.org,m:kasan-dev@googlegroups.com,m:mingo@redhat.com,m:linux-arm-kernel@lists.infradead.org,m:bastien.curutchet@bootlin.com,m:mcoquelin.stm32@gmail.com,m:ebpf@linuxfoundation.org,m:ast@kernel.org,m:bp@alien8.de,m:alexis.lothore@bootlin.com,m:bpf@vger.kernel.org,m:dvyukov@google.com,m:linux-kselftest@vger.kernel.org,m:linux-mm@kvack.org,m:netdev@vger.kernel.org,m:dsahern@kernel.org,m:linux-kernel@vger.kernel.org,m:eddyz87@gmail.com,m:tglx@kernel.org,m:jolsa@kernel.org,m:akpm@linux-foundation.org,m:martin.lau@linux.dev,m:davem@davemloft.net,m:memxor@gmail.com,m:alexeistarovoito
 v@gmail.com,m:ryabininaa@gmail.com,m:johnfastabend@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	GREYLIST(0.00)[pass,meta];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[39];
	FORGED_SENDER(0.00)[andreyknvl@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[bootlin.com,linux.intel.com,kernel.org,gmail.com,google.com,linux.dev,zytor.com,arm.com,st-md-mailman.stormreply.com,huawei.com,iogearbox.net,googlegroups.com,redhat.com,lists.infradead.org,linuxfoundation.org,alien8.de,vger.kernel.org,kvack.org,linux-foundation.org,davemloft.net];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[andreyknvl@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	MISSING_XM_UA(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_SPAM(0.00)[0.114];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: 30AD5404088
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gVHVlLCBBcHIgMTQsIDIwMjYgYXQgNDozNuKAr1BNIEFsZXhlaSBTdGFyb3ZvaXRvdgo8YWxl
eGVpLnN0YXJvdm9pdG92QGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiA+IEFDSywgSSdsbCB0cnkgdG8g
dXNlIHRob3NlIGthc2FuX2NoZWNrX3JlYWQgYW5kIGthc2FuX2NoZWNrX3dyaXRlIHJhdGhlcgo+
ID4gdGhhbiBfX2FzYW5fe2xvYWQsc3RvcmV9WC4KPgo+IE5vLiBUaGUgcGVyZm9ybWFuY2UgcGVu
YWx0eSB3aWxsIGJlIHRvbyBoaWdoLgoKV2l0aCB1c2luZyBfX2FzYW5fbG9hZC9zdG9yZVgoKSwg
aXQgd2lsbCBiZSBvbmUgZnVuY3Rpb24gY2FsbCB0byBnZXQKdG8gY2hlY2tfcmVnaW9uX2lubGlu
ZSgpOiBfX2FzYW5fbG9hZC9zdG9yZVgtPmNoZWNrX3JlZ2lvbl9pbmxpbmUuCgpXaXRoIGthc2Fu
X2NoZWNrX3JlYWQvd3JpdGUoKSwgcmlnaHQgbm93LCBpdCB3b3VsZCBiZSB0d28gZnVuY3Rpb24K
Y2FsbHM6IF9fa2FzYW5fY2hlY2tfcmVhZC0+a2FzYW5fY2hlY2tfcmFuZ2UtPmNoZWNrX3JlZ2lv
bl9pbmxpbmUuCgpJIGRvdWJ0IGFuIGV4dHJhIGZ1bmN0aW9uIGNhbGwgd291bGQgbWFrZSBhIGRp
ZmZlcmVuY2UgaW4gdGVybXMgb2YKcGVyZm9ybWFuY2U6IHRoZSBzaGFkb3cgY2hlY2tpbmcgaXRz
ZWxmIGlzIGFsc28gZXhwZW5zaXZlLgoKQnV0IGlmIHRoZSBzZWNvbmQgY2FsbCBpcyBhIGNvbmNl
cm4sIHdlIGNhbiBtb3ZlIGthc2FuX2NoZWNrX3JhbmdlKCkKYW5kIGxvd2VyLWxldmVsIGZ1bmN0
aW9ucyBpbnRvIG1tL2thc2FuL2dlbmVyaWMuaCBhbmQgaW5jbHVkZSBpdCBpbnRvCnNoYWRvdy5j
LCBhbmQgdGhlbiBpdCB3aWxsIGJlIGp1c3Qgb25lIGZ1bmN0aW9uIGNhbGwuCgpUbyBpbXByb3Zl
IHBlcmZvcm1hbmNlIGZ1cnRoZXIsIHRoZSBKSVQgY29tcGlsZXIgY291bGQgZW1pdCBpbmxpbmVk
CnNoYWRvdyBjaGVja2luZyBpbnN0cnVjdGlvbnMsIHNhbWUgYXMgdGhlIEMgY29tcGlsZXIgZG9l
cyB3aXRoCktBU0FOX0lOTElORT15LgoKPiBod190YWdzIHdvbid0IHdvcmsgd2l0aG91dCBjb3Jy
ZXNwb25kaW5nIEpJVCB3b3JrLgoKWW91IHByb2JhYmx5IG1lYW50IFNXX1RBR1MgaGVyZS4KCkhX
X1RBR1Mgd2lsbCBsaWtlbHkganVzdCB3b3JrIHdpdGhvdXQgYW55IEpJVCBjaGFuZ2VzIChldmVu
IHRoZQprYXNhbl9jaGVja19ieXRlKCkgdGhpbmcgSSBtZW50aW9uZWQgc2hvdWxkIG5vdCBiZSBy
ZXF1aXJlZCksIGFzc3VtaW5nCkpJVCdlZCBCUEYgY29kZSBqdXN0IGFjY2Vzc2VzIGtlcm5lbC1y
ZXR1cm5lZCBwb2ludGVycyBhcyBpcy4KCj4gSSBzZWUgbm8gcG9pbnQgc2FjcmlmaWNpbmcgcGVy
Zm9ybWFuY2UgZm9yIGFlc3RoZXRpY3MuCgpXaXRoIHRoZSBjaGFuZ2UgSSBzdWdnZXN0ZWQgYWJv
dmUsIHRoZXJlIHdvdWxkIGJlIG5vIHBlcmZvcm1hbmNlCmRpZmZlcmVuY2UuIEFuZCB0aGUgY29k
ZSBzdGF5cyBjbGVhbmVyLgoKPiBfX2FzYW5fbG9hZC9zdG9yZVggaXMgd2hhdCBjb21waWxlcnMg
ZW1pdC4KCkZvciBHZW5lcmljIG1vZGUuIEZvciBTV19UQUdTLCB0aGUgZnVuY3Rpb24gbmFtZXMg
YXJlIGRpZmZlcmVudC4KS2VlcGluZyB0aGlzIGRldGFpbCB3aXRoaW4gdGhlIEtBU0FOIGNvZGUg
aXMgY2xlYW5lci4KCgo+IEluIHRoYXQgc2Vuc2UgSklUIGlzIGEgY29tcGlsZXIgaXQgc2hvdWxk
IGVtaXQgZXhhY3RseSB0aGUgc2FtZS4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1k
LW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHku
Y29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
