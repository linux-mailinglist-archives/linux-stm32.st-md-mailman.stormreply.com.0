Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8O8nEaR732k3UAAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Apr 2026 13:51:00 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 27E49404086
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Apr 2026 13:51:00 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6AA3AC8F29D;
	Wed, 15 Apr 2026 11:50:59 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AA818C8F286
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Apr 2026 14:36:17 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-43cfd96354aso3352966f8f.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Apr 2026 07:36:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776177377; cv=none;
 d=google.com; s=arc-20240605;
 b=JolTQAOiPl9JrwoOKgeS7BDkcLzhhMd4AVfqflDQk4QQxZ9XcK9noh2iNe1k/Ljovc
 Ko4C97iT4bJrr3PV9TFRjy7pId4JAFFybZTuGmBIbiH1shZh78ltCKuqvNVmhyWFxg2P
 k8v6Kh/iXIBQSTWec4I4/ENDmIJX8CvG2RRpmnppinzcFD+wIB/QaiHRGVmdlAFdrVWE
 54lQevCn6OS6an7JacFvtpsolMv1HQ3lhyPx7Ij4qYZSG5voohzWhF1HfNHV7L4i6fo4
 lgqdj+F5bdYRLpIYla5DtuR+jVJ/IKc3t+xbAzvMgApuKp9hR/oi972Aa4b0+QQ4gvtW
 3OiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=AnsEV6VHaHqEew+Xa56Ltrfs2MD3YtoIUeXjaty5EkY=;
 fh=GOnsxYoHOQUzReLW2aXQYOfVdIEWo1puhIisQQhT14w=;
 b=DLsB6vtUR9AoD/ggJmAwmYKaK2eZFmbXyFDnDbOBxz9GWlf107VunlAv9P+iLRF44L
 iDNlYoMLCjPAPYjYqpvh3ltrBUbpRCZY4I0WqYlWi8SjI/ZnREhpP6CuBQUqK0hVW0mz
 QkmbP/oesXDeaxJag8f8kHS9TfyzIo1OZhk2YuLWds4pWEESXtgie6rP7yLBU9z1PcQy
 Xq+P/UB23xK5EMZ29EZXjZ/1jIHizEOEegK1Oz5VnWcLa/ii94MzGYHgrWlvv8pNtzDn
 ymeMbbvVTDx2FTsfb5uajkJAxfCcEnyywxH34D/1APjdwV5JF3jdmiyhRESbEoIJZew8
 wW4A==; darn=st-md-mailman.stormreply.com
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1776177377; x=1776782177;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AnsEV6VHaHqEew+Xa56Ltrfs2MD3YtoIUeXjaty5EkY=;
 b=dcpX8WXut3IU6EbkvL4+3hwufdNS9c2BsqEBS1+F+zRV1MUuxhixlzY7MotJYLzEKV
 xB/bdyNV7ETXKRrJbUAjIix+JMVgglMWrD0VYFHepJjgvyqewdnffu8pL6YLsz+ERUlx
 yTKzlUEXnbytdNKOgpDQ5Wwhk1knrtsUrB0aGoikQECnsOvH1edifiUhx9tQZuiBqTCP
 TuU+n+OZfoSpeh3b8S8OLLE7eEuccLzb3f0VbHGa3GACpDvli9yI1TUv5jiQsbs4xvB7
 /zBJ24hUh8sIi43Pq5pQ1mGUo8icJdtnkoG3MTSCwfS0CPzvYHqN0z/lTZGOIhifAP0/
 IT6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776177377; x=1776782177;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=AnsEV6VHaHqEew+Xa56Ltrfs2MD3YtoIUeXjaty5EkY=;
 b=MHsLkcRC05WxXoutiMaChFEIw96VUiMmpX0wW0iPfkXf1teFgt22P4BMgYEnLvR54V
 7Gj2KxdLTjh7cqSvxSlim3ICl9nSwWgIf/PfBGbFNWWhb+YGwjYwEA0Yu6oWe3KEfk8w
 QZq5ZeQ3o/+FbcecPF5XiGrNyGIU9wY6lf7Ax/nSI5tU7uYnlz8wlyBnWsUMTy0RLBpV
 0oGd2aImG4gQAPP2k+vNGQmvmgjfYa0scuRU2bPL9El+E1SsAAFGxlsEg74n0i7DEC2m
 qMX2v2Wo2a4Oi1T1THzQqD0RIFV0gnGrfRoWEKcfOPkrgJ/v+5Q/9Y+uHJMv+B+oR+oZ
 eiiA==
X-Forwarded-Encrypted: i=1;
 AFNElJ+H2LiDBXJlw/4P6bULxQTVe+Epn/lbCJ+SLR8h92UtnwfOBnTWfarceY39nu1nBor4qvD76fIF8bV5fw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Ywr5dW1GnV2SzaZvJ3BU+cnzKojm2OKYURXUDX6zD8wdcmJkBxW
 X5Ip2O+9gArEMW+/L3U6Sxp0VecWrTrTNhq9eY9N+V6txGbY2An7DEhygnjKd3QDv/Ayvi2l6hK
 68z9xlXkf0IjehSMWxs4vWGqhbiHiBBc=
X-Gm-Gg: AeBDiesKl9lEP2FVXte7Jdfo8kyGCyqR0c6XCX2p+J48pOxbtmQdjmBipdBtXCcMEvv
 VGjVMXxTKjvQv6nnAflz3gRqueDiCUQ70wwB9b6Cy3kmv/JTeL1Z+g6tEs1Cn6Fyj9UYp4/j3px
 nWvG199GRo8j5ifq/aZB+TCHXnL7Gmnn1927ePtN5GEUDpJ/ZnBhtZWE+BjBqS4fSFW+2SyVn1G
 jLdRmFkhN+iRIUKOhHP7sVQQHzaLWuc6U/lz/16PTuHl68kvKYIgJDJFl30OSACnVqIecyeCMe2
 7o+UcTw9HBbmkHzp0Nc5eIdYu5Ebx+mi6bX4Vb858eoTY9nNJLbnQMuTKOYBrX13uvLYQjfed7p
 VKRVWAz3k2UXUi0X7+21FRVf+nw==
X-Received: by 2002:a05:6000:1a86:b0:43d:6e0:9458 with SMTP id
 ffacd0b85a97d-43d642c08b5mr27685966f8f.39.1776177376758; Tue, 14 Apr 2026
 07:36:16 -0700 (PDT)
MIME-Version: 1.0
References: <20260413-kasan-v1-0-1a5831230821@bootlin.com>
 <20260413-kasan-v1-1-1a5831230821@bootlin.com>
 <CA+fCnZfubV6LgRjO3NQvhrG2Q5o0ftkFFupLWVYS50XDnmCaog@mail.gmail.com>
 <DHSWK17EZUDP.GIJ6BX2NFR6U@bootlin.com>
In-Reply-To: <DHSWK17EZUDP.GIJ6BX2NFR6U@bootlin.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Tue, 14 Apr 2026 07:36:05 -0700
X-Gm-Features: AQROBzD11iC8gAKSEnmD0t_Id88yG4ZENQr7azgzst5W9dho6pOaDHcgJ_Mytlo
Message-ID: <CAADnVQLJ=fJ7t1i2+_RYqU1gqYqiLP9Zrwo4vdZsgzjK_yzJTQ@mail.gmail.com>
To: =?UTF-8?Q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
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
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, bpf <bpf@vger.kernel.org>,
 Dmitry Vyukov <dvyukov@google.com>, Andrey Konovalov <andreyknvl@gmail.com>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 linux-mm <linux-mm@kvack.org>, Network Development <netdev@vger.kernel.org>,
 David Ahern <dsahern@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 Eduard Zingerman <eddyz87@gmail.com>, Thomas Gleixner <tglx@kernel.org>,
 Jiri Olsa <jolsa@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
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
X-Spamd-Result: default: False [4.49 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:google.com:reject}];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	TAGGED_FROM(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:alexis.lothore@bootlin.com,m:thomas.petazzoni@bootlin.com,m:dave.hansen@linux.intel.com,m:song@kernel.org,m:ryabinin.a.a@gmail.com,m:glider@google.com,m:yonghong.song@linux.dev,m:hpa@zytor.com,m:vincenzo.frascino@arm.com,m:shuah@kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:xukuohai@huawei.com,m:daniel@iogearbox.net,m:x86@kernel.org,m:john.fastabend@gmail.com,m:andrii@kernel.org,m:kasan-dev@googlegroups.com,m:mingo@redhat.com,m:linux-arm-kernel@lists.infradead.org,m:bastien.curutchet@bootlin.com,m:mcoquelin.stm32@gmail.com,m:ebpf@linuxfoundation.org,m:ast@kernel.org,m:bp@alien8.de,m:memxor@gmail.com,m:bpf@vger.kernel.org,m:dvyukov@google.com,m:andreyknvl@gmail.com,m:linux-kselftest@vger.kernel.org,m:linux-mm@kvack.org,m:netdev@vger.kernel.org,m:dsahern@kernel.org,m:linux-kernel@vger.kernel.org,m:eddyz87@gmail.com,m:tglx@kernel.org,m:jolsa@kernel.org,m:akpm@linux-foundation.org,m:martin.lau@linux.dev,m:davem@davemloft.net,m:ryabininaa@gmail.com,m:j
 ohnfastabend@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[39];
	FORGED_SENDER(0.00)[alexeistarovoitov@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[bootlin.com,linux.intel.com,kernel.org,gmail.com,google.com,linux.dev,zytor.com,arm.com,st-md-mailman.stormreply.com,huawei.com,iogearbox.net,googlegroups.com,redhat.com,lists.infradead.org,linuxfoundation.org,alien8.de,vger.kernel.org,kvack.org,linux-foundation.org,davemloft.net];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[alexeistarovoitov@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	MISSING_XM_UA(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_SPAM(0.00)[0.044];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo,bootlin.com:email]
X-Rspamd-Queue-Id: 27E49404086
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gVHVlLCBBcHIgMTQsIDIwMjYgYXQgNjoxM+KAr0FNIEFsZXhpcyBMb3Rob3LDqQo8YWxleGlz
LmxvdGhvcmVAYm9vdGxpbi5jb20+IHdyb3RlOgo+Cj4gSGkgQW5kcmV5LCB0aGFua3MgZm9yIHRo
ZSBwcm9tcHQgcmV2aWV3ICEKPgo+IE9uIFR1ZSBBcHIgMTQsIDIwMjYgYXQgMTI6MTkgQU0gQ0VT
VCwgQW5kcmV5IEtvbm92YWxvdiB3cm90ZToKPiA+IE9uIE1vbiwgQXByIDEzLCAyMDI2IGF0IDg6
MjnigK9QTSBBbGV4aXMgTG90aG9yw6kgKGVCUEYgRm91bmRhdGlvbikKPiA+IDxhbGV4aXMubG90
aG9yZUBib290bGluLmNvbT4gd3JvdGU6Cj4gPj4KPgo+IFsuLi5dCj4KPiA+PiArI2lmZGVmIENP
TkZJR19LQVNBTl9HRU5FUklDCj4gPj4gK3ZvaWQgX19hc2FuX2xvYWQxKHZvaWQgKnApOwo+ID4+
ICt2b2lkIF9fYXNhbl9zdG9yZTEodm9pZCAqcCk7Cj4gPj4gK3ZvaWQgX19hc2FuX2xvYWQyKHZv
aWQgKnApOwo+ID4+ICt2b2lkIF9fYXNhbl9zdG9yZTIodm9pZCAqcCk7Cj4gPj4gK3ZvaWQgX19h
c2FuX2xvYWQ0KHZvaWQgKnApOwo+ID4+ICt2b2lkIF9fYXNhbl9zdG9yZTQodm9pZCAqcCk7Cj4g
Pj4gK3ZvaWQgX19hc2FuX2xvYWQ4KHZvaWQgKnApOwo+ID4+ICt2b2lkIF9fYXNhbl9zdG9yZTgo
dm9pZCAqcCk7Cj4gPj4gK3ZvaWQgX19hc2FuX2xvYWQxNih2b2lkICpwKTsKPiA+PiArdm9pZCBf
X2FzYW5fc3RvcmUxNih2b2lkICpwKTsKPiA+PiArI2VuZGlmIC8qIENPTkZJR19LQVNBTl9HRU5F
UklDICovCj4gPgo+ID4gVGhpcyBsb29rcyB1Z2x5LCBsZXQncyBub3QgZG8gdGhpcyB1bmxlc3Mg
aXQncyByZWFsbHkgcmVxdWlyZWQuCj4gPgo+ID4gWW91IGNhbiBqdXN0IHVzZSBrYXNhbl9jaGVj
a19yZWFkL3dyaXRlKCkgaW5zdGVhZCAtIHRoZXNlIGFyZSBwdWJsaWMKPiA+IHdyYXBwZXJzIGFy
b3VuZCB0aGUgc2FtZSBzaGFkb3cgbWVtb3J5IGNoZWNraW5nIGZ1bmN0aW9ucy4gQW5kIHRoZXkK
PiA+IGFsc28gd29yayB3aXRoIHRoZSBTV19UQUdTIG1vZGUsIGluIGNhc2UgdGhlIEJQRiB3b3Vs
ZCB3YW50IHRvIHVzZQo+ID4gdGhhdCBtb2RlIGF0IHNvbWUgcG9pbnQuIChGb3IgSFdfVEFHUywg
d2Ugb25seSBoYXZlIGthc2FuX2NoZWNrX2J5dGUoKQo+ID4gdGhhdCBjaGVja3MgYSBzaW5nbGUg
Ynl0ZSwgYnV0IGl0IGNhbiBiZSBleHRlbmRlZCBpbiB0aGUgZnV0dXJlIGlmCj4gPiByZXF1aXJl
ZCB0byBiZSB1c2VkIGJ5IEJQRi4pCj4KPiBBQ0ssIEknbGwgdHJ5IHRvIHVzZSB0aG9zZSBrYXNh
bl9jaGVja19yZWFkIGFuZCBrYXNhbl9jaGVja193cml0ZSByYXRoZXIKPiB0aGFuIF9fYXNhbl97
bG9hZCxzdG9yZX1YLgoKTm8uIFRoZSBwZXJmb3JtYW5jZSBwZW5hbHR5IHdpbGwgYmUgdG9vIGhp
Z2guCmh3X3RhZ3Mgd29uJ3Qgd29yayB3aXRob3V0IGNvcnJlc3BvbmRpbmcgSklUIHdvcmsuCkkg
c2VlIG5vIHBvaW50IHNhY3JpZmljaW5nIHBlcmZvcm1hbmNlIGZvciBhZXN0aGV0aWNzLgpfX2Fz
YW5fbG9hZC9zdG9yZVggaXMgd2hhdCBjb21waWxlcnMgZW1pdC4KSW4gdGhhdCBzZW5zZSBKSVQg
aXMgYSBjb21waWxlciBpdCBzaG91bGQgZW1pdCBleGFjdGx5IHRoZSBzYW1lLgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5n
IGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0
LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
