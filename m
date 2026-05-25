Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CGH+M4yOFGqIOQcAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 25 May 2026 20:01:48 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AD105CD843
	for <lists+linux-stm32@lfdr.de>; Mon, 25 May 2026 20:01:48 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E8AD0C030CD;
	Mon, 25 May 2026 18:01:47 +0000 (UTC)
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C4AD8C3F944
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 May 2026 18:01:45 +0000 (UTC)
Received: by mail-dl1-f49.google.com with SMTP id
 a92af1059eb24-1329fc4bf77so7608126c88.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 May 2026 11:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=etsalapatis-com.20251104.gappssmtp.com; s=20251104; t=1779732104;
 x=1780336904; darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:references:cc:to:from:subject:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fzor4pOAcoXrq0r/dQWN3ieh5O1PmvSJQr5rj+ToVL8=;
 b=cJvGYY4VCUzWrAc9cpU1qa2WGjwm9s3zS3ltkyqsmq2V9eVoydokw+w+pW3sVjHZUt
 ZskXGFoxFnwZZIizWa5M5jINxathDy53YQgg1BAkC/+ieW/TFTDfaXucGbndBGOmEQ5w
 ZnAW4r6oIz3zNr2qZaWlVJOFPUKFpFiTRfFKlQl1PHLeioTmvLbLDaEOCR/dnrQE+4mo
 eUuf/5yBvKqOdJ3W0rnnvqiNxNXc7oMc5noZxJMEez8zaQ8aufNcejZmyKbFRq6Amf2O
 bOtEUqR+TouzmptQa5lxdUmU+l6seM0UOw9dYy0ZcaHlBW3uC69ZEB3Ym8SjLqmYPOiF
 iWYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779732104; x=1780336904;
 h=in-reply-to:references:cc:to:from:subject:message-id:date
 :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fzor4pOAcoXrq0r/dQWN3ieh5O1PmvSJQr5rj+ToVL8=;
 b=gQ+H2NFZWZY98WESODDwKvyYfb25GvOuGzqBpuSqU7WzKqINzBwSecCypON/2SFUnz
 Bywp7je3Zr6frwfbDxiXWgqx7heAb59BxsgSIJLxpyw/FovWeEoD/yYyMMO19GWKdjn/
 3MNHGWQw8WVngB/jeChuU0eFk9VtRlnvbrF24r3mEQpD19GnUDnsaQCe1OqM74UiZn54
 hLlW3x32RrnPk+P/ZEX2vHijJyXxggO3arynVK0D5ZbSDZBIbcgD0aDxn216od/rJrWM
 fuMDtTbfNZHre/LeCWb8pPcj+rqrNtdXoFRtEw0GXEzPg8uZ3QP22amXp8hg3EhDm1m8
 lZvw==
X-Forwarded-Encrypted: i=1;
 AFNElJ/CYRUX2SrUMe6TEaxnddQsj6Y/l/XMWmeTjEvfQjDiYLJj/Bqk2S86gt74O/Edu7bzlTe65FIRjL553g==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yzb2YAbo6ea6gsu8L450CKHTxpUbsDZ/9Sidoi5DnCiCcEHdS8k
 6FOIp/fiCUk6rWRzvQkpOGO9oFZDlSoM5dDx/gSwz4YbF2s88qg1LV9EuMwd2YPSmDY=
X-Gm-Gg: Acq92OFVb5x+AiDP+mO/Vjmi30jVWZBgJl14nqXjbIWFLAqKtZUdLbf+oFdvc7EphKH
 7qUO7BkH2YtzgXIISt1La/U+NJvTFAuttucPnQhU5YrvWv5or8jhJvCFzLrRnpBtyfs0zSYygpu
 GQnX0gePwSnBUtJCB3+aUaWcPculKF2rk4iJEWVltgZJ0leRHYrKgNYPo0Xg8YFJJ83tCC1+CYJ
 AQGxk3UToyCNaSZ/hzoQ2VxCfrMRnFIH+0Kblq4a1FgqmPqqON/KvbOu9LwyLKmRaT5XX7ZB+gK
 98j+m0PxUSg94N8dUQBu1FNPc+n4ceXhURAMMTN5yR9zznu85ev9VVZDZ3mw5rJXEJUbafi7zMM
 ulG3hta+Sk2VavsZFZCKfQren7kU9sSxLbNSyn2VEtun7h07Vr2WKhxLJapvlj7RfEJAReus6xp
 8O8DA=
X-Received: by 2002:a05:7022:ef01:b0:12c:8f92:c6ba with SMTP id
 a92af1059eb24-1365fc7b48cmr5378838c88.34.1779732103455; 
 Mon, 25 May 2026 11:01:43 -0700 (PDT)
Received: from localhost ([2620:10d:c090:600::cc2])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-1366a2e634csm7642048c88.2.2026.05.25.11.01.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 May 2026 11:01:43 -0700 (PDT)
Mime-Version: 1.0
Date: Mon, 25 May 2026 14:01:33 -0400
Message-Id: <DIRYDGLWJJWI.1PACVYJDRYBJ2@etsalapatis.com>
From: "Emil Tsalapatis" <emil@etsalapatis.com>
To: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>, "Emil
 Tsalapatis" <emil@etsalapatis.com>, "Alexei Starovoitov"
 <alexei.starovoitov@gmail.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260413-kasan-v1-0-1a5831230821@bootlin.com>
 <20260413-kasan-v1-3-1a5831230821@bootlin.com>
 <CA+fCnZf-o8tiv_tX9YB5eBUGx17OpztKZsEB6Awjw3WAqBAiUw@mail.gmail.com>
 <DHSWSSYRPUVC.2W3G3OU27L3HG@bootlin.com>
 <CAADnVQLj=UosnsC-4V2+mN92Fe0-kW++U+m-O9c93kk6BwiXgw@mail.gmail.com>
 <DIP9O3BEWG3C.2BAHKYUIA4H4E@bootlin.com>
 <DIPDH3PCUDDG.EGYL0SYSG1IO@etsalapatis.com>
 <DIRMYUXFYOVY.1LQV9E3OHGGBK@bootlin.com>
In-Reply-To: <DIRMYUXFYOVY.1LQV9E3OHGGBK@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Song Liu <song@kernel.org>,
 Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Alexander Potapenko <glider@google.com>,
 Yonghong Song <yonghong.song@linux.dev>, "H. Peter Anvin" <hpa@zytor.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>, Shuah Khan <shuah@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, Xu Kuohai <xukuohai@huawei.com>,
 Daniel Borkmann <daniel@iogearbox.net>, X86 ML <x86@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>, Andrii
 Nakryiko <andrii@kernel.org>, kasan-dev <kasan-dev@googlegroups.com>, Ingo
 Molnar <mingo@redhat.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Bastien Curutchet <bastien.curutchet@bootlin.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, ebpf@linuxfoundation.org,
 Alexei Starovoitov <ast@kernel.org>, Borislav Petkov <bp@alien8.de>,
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, bpf <bpf@vger.kernel.org>,
 Dmitry Vyukov <dvyukov@google.com>, Andrey Konovalov <andreyknvl@gmail.com>,
 "open list:KERNEL SELFTEST
 FRAMEWORK" <linux-kselftest@vger.kernel.org>, linux-mm <linux-mm@kvack.org>,
 Network Development <netdev@vger.kernel.org>, David
 Ahern <dsahern@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 Eduard Zingerman <eddyz87@gmail.com>, Thomas Gleixner <tglx@kernel.org>,
 Jiri Olsa <jolsa@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 Martin KaFai Lau <martin.lau@linux.dev>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH RFC bpf-next 3/8] bpf: add BPF_JIT_KASAN
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
X-Spamd-Result: default: False [3.89 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[etsalapatis-com.20251104.gappssmtp.com:s=20251104];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	MV_CASE(0.50)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DMARC_NA(0.00)[etsalapatis.com];
	FREEMAIL_TO(0.00)[bootlin.com,etsalapatis.com,gmail.com];
	FORGED_SENDER(0.00)[emil@etsalapatis.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[41];
	FORGED_RECIPIENTS(0.00)[m:alexis.lothore@bootlin.com,m:emil@etsalapatis.com,m:alexei.starovoitov@gmail.com,m:thomas.petazzoni@bootlin.com,m:dave.hansen@linux.intel.com,m:song@kernel.org,m:ryabinin.a.a@gmail.com,m:glider@google.com,m:yonghong.song@linux.dev,m:hpa@zytor.com,m:vincenzo.frascino@arm.com,m:shuah@kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:xukuohai@huawei.com,m:daniel@iogearbox.net,m:x86@kernel.org,m:john.fastabend@gmail.com,m:andrii@kernel.org,m:kasan-dev@googlegroups.com,m:mingo@redhat.com,m:linux-arm-kernel@lists.infradead.org,m:bastien.curutchet@bootlin.com,m:mcoquelin.stm32@gmail.com,m:ebpf@linuxfoundation.org,m:ast@kernel.org,m:bp@alien8.de,m:memxor@gmail.com,m:bpf@vger.kernel.org,m:dvyukov@google.com,m:andreyknvl@gmail.com,m:linux-kselftest@vger.kernel.org,m:linux-mm@kvack.org,m:netdev@vger.kernel.org,m:dsahern@kernel.org,m:linux-kernel@vger.kernel.org,m:eddyz87@gmail.com,m:tglx@kernel.org,m:jolsa@kernel.org,m:akpm@linux-foundation.org,m:martin.lau@linu
 x.dev,m:davem@davemloft.net,m:alexeistarovoitov@gmail.com,m:ryabininaa@gmail.com,m:johnfastabend@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[etsalapatis-com.20251104.gappssmtp.com:-];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[emil@etsalapatis.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[bootlin.com,linux.intel.com,kernel.org,gmail.com,google.com,linux.dev,zytor.com,arm.com,st-md-mailman.stormreply.com,huawei.com,iogearbox.net,googlegroups.com,redhat.com,lists.infradead.org,linuxfoundation.org,alien8.de,vger.kernel.org,kvack.org,linux-foundation.org,davemloft.net];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	NEURAL_SPAM(0.00)[1.000];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,bootlin.com:email]
X-Rspamd-Queue-Id: 5AD105CD843
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gTW9uIE1heSAyNSwgMjAyNiBhdCA1OjA1IEFNIEVEVCwgQWxleGlzIExvdGhvcsOpIHdyb3Rl
Ogo+IE9uIEZyaSBNYXkgMjIsIDIwMjYgYXQgNzoxMyBQTSBDRVNULCBFbWlsIFRzYWxhcGF0aXMg
d3JvdGU6Cj4+IE9uIEZyaSBNYXkgMjIsIDIwMjYgYXQgMTA6MTQgQU0gRURULCBBbGV4aXMgTG90
aG9yw6kgd3JvdGU6Cj4+PiBPbiBUdWUgQXByIDE0LCAyMDI2IGF0IDQ6MzggUE0gQ0VTVCwgQWxl
eGVpIFN0YXJvdm9pdG92IHdyb3RlOgo+Pj4+IE9uIFR1ZSwgQXByIDE0LCAyMDI2IGF0IDY6MjTi
gK9BTSBBbGV4aXMgTG90aG9yw6kKPj4+PiA8YWxleGlzLmxvdGhvcmVAYm9vdGxpbi5jb20+IHdy
b3RlOgo+Pj4+Pgo+Pj4+PiBPbiBUdWUgQXByIDE0LCAyMDI2IGF0IDEyOjIwIEFNIENFU1QsIEFu
ZHJleSBLb25vdmFsb3Ygd3JvdGU6Cj4+Pj4+ID4gT24gTW9uLCBBcHIgMTMsIDIwMjYgYXQgODoy
OeKAr1BNIEFsZXhpcyBMb3Rob3LDqSAoZUJQRiBGb3VuZGF0aW9uKQo+Pj4+PiA+IDxhbGV4aXMu
bG90aG9yZUBib290bGluLmNvbT4gd3JvdGU6Cj4+Pgo+Pj4gWy4uLl0KPj4+Cj4+Pj4+ID4+ICtj
b25maWcgQlBGX0pJVF9LQVNBTgo+Pj4+PiA+PiArICAgICAgIGJvb2wKPj4+Pj4gPj4gKyAgICAg
ICBkZXBlbmRzIG9uIEhBVkVfRUJQRl9KSVRfS0FTQU4KPj4+Pj4gPj4gKyAgICAgICBkZWZhdWx0
IHkgaWYgQlBGX0pJVCAmJiBLQVNBTl9HRU5FUklDCj4+Pj4+ID4KPj4+Pj4gPiBTaG91bGQgdGhp
cyBiZSAiZGVwZW5kcyBvbiBLQVNBTiAmJiBLQVNBTl9HRU5FUklDIj8KPj4+Pj4KPj4+Pj4gTWVh
bmluZywgbWFraW5nIGl0IGFuIGV4cGxpY2l0IHVzZXItc2VsZWN0YWJsZSBvcHRpb24gPwo+Pj4+
Pgo+Pj4+PiBJZiBzbywgdGhlIGN1cnJlbnQgZGVzaWduIGNob2ljZSBpcyB2b2x1bnRhcnkgYW5k
IGJhc2VkIG9uIHRoZSBmZWVkYmFjawo+Pj4+PiByZWNlaXZlZCBvbiB0aGUgb3JpZ2luYWwgUkZD
LCB3aGVyZSBJIGhhdmUgYmVlbiBzdWdnZXN0ZWQgdG8KPj4+Pj4gYXV0b21hdGljYWxseSBlbmFi
bGUgdGhlIEtBU0FOIGluc3RydW1lbnRhdGlvbiBpbiBCUEYgcHJvZ3JhbXMgaWYgS0FTQU4KPj4+
Pj4gc3VwcG9ydCBpcyBlbmFibGVkIGluIHRoZSBrZXJuZWwgKFsxXSkuIEJ1dCBpZiBhIHVzZXIt
c2VsZWN0YWJsZSB0b2dnbGUKPj4+Pj4gaXMgZXZlbnR1YWxseSBhIGJldHRlciBzb2x1dGlvbiwg
SSdtIGZpbmUgd2l0aCBjaGFuZ2luZyBpdC4KPj4+Pgo+Pj4+IExldCdzIG5vdCBhZGQgbW9yZSBj
b25maWcga25vYnMuCj4+Pj4gRXZlbiB0aGlzIHBhdGNoIGxvb2tzIHJlZHVuZGFudC4KPj4+PiBJ
bnNpZGUgSklUIGRvIGluc3RydW1lbnRhdGlvbiB3aGVuIEtBU0FOX0dFTkVSSUMgaXMgc2V0Lgo+
Pj4KPj4+ICh3aXRoIHF1aXRlIHNvbWUgZGVsYXkpIEkgdGhpbmsgaXQgd291bGQgYmUgYmV0dGVy
IHRvIGtlZXAgdGhpcyBuZXcKPj4+IEJQRl9KSVRfS0FTQU4sIGJlY2F1c2UgYXNpZGUgZnJvbSB0
aGUgcG9zc2liaWxpdHkgdG8gdXNlIGl0IGluCj4+PiBicGZfaml0X2NvbXAuYywgaXQgYWxsb3dz
IHRvIHVwZGF0ZSB0ZXN0cyBhZmZlY3RlZCBieSBLQVNBTgo+Pj4gaW5zdHJ1bWVudGF0aW9uIGlu
IGEgbmljZXIgd2F5LiBGb3IgZXhhbXBsZSwgdGhlIHRlc3RfbG9hZGVyIHN1YnRlc3RzCj4+PiB0
aGF0IG1vbml0b3IgSklUdGVkIGluc3RydWN0aW9ucyBhcmUgY29uZnVzZWQgYnkgS0FTQU4uIEkg
Y2FuIGVpdGhlcgo+Pj4gc2tpcCB0aGVtIG9yIG1ha2UgdGhlbSBzbWFydGVyIHdoZW4gS0FTQU4g
aXMgZW5hYmxlZCBmb3IgQlBGLCBidXQgaW4KPj4+IGJvdGggY2FzZXMsIGl0IHdvdWxkIGJlIG5p
Y2VyIHRvIGp1c3QgYWRhcHQgdGhlIGJlaGF2aW9yIGJhc2VkIG9uIGEKPj4+IGdlbmVyaWMgQ09O
RklHX0JQRl9KSVRfS0FTQU4sIHJhdGhlciB0aGFuIHNwcmlua2xpbmcgc29tZSAiaWYKPj4+IGpp
dF9lbmFibGVkIEFORCBDT05GSUdfS0FTQU5fR0VORVJJQyBBTkQgQVJDSF9YODYiIGluIHNlbGZ0
ZXN0cy4gVGhhdAo+Pj4gc3RpbGwgZG9lcyBub3QgbWFrZSBpdCBhIGNvbmZpZyBrbm9iLCB0aGF0
IGp1c3QgY3JlYXRlcyBhbiBpbnRlcm5hbAo+Pj4gS2NvbmZpZyBvcHRpb24gdGhhdCBpcyBhdXRv
bWF0aWNhbGx5IHR1cm5lZCBvbiB3aGVuIEtBU0FOIGFuZCBKSVQgYXJlCj4+PiBlbmFibGVkIGF0
IGJ1aWxkIHRpbWUuCj4+Cj4+IEhhdmluZyBhIHRvZ2dsYWJsZSBjb25maWcga25vYiBnaXZlcyB1
cyB0aGUgb3B0aW9uIHRvIHNldCB1cCBLQVNBTiBmb3IKPj4gdGhlIGtlcm5lbCBidXQgbm90IGZv
ciBCUEYsIGFuZCBJIGRvbid0IHNlZSB3aHkgd2UnZCB3YW50IHRoYXQuIEltbyB3ZSBhcmUKPj4g
YWxyZWFkeSBwYXlpbmcgdGhlIGNvc3Qgb2YgS0FTQU4gZm9yIHRoZSByZXN0IG9mIHRoZSBrZXJu
ZWwsIHRoZXJlIGlzIG5vCj4+IGluY2VudGl2ZSB0byBub3QgcnVuIGl0IGZvciB0aGUgQlBGIEpJ
VC4gSGF2aW5nIHRvIGVhdCB0aGUgY29tcGxleGl0eSBjb3N0Cj4+IGluIHRoZSBzZWxmdGVzdHMg
c2VlbXMgcmVhc29uYWJsZSBpZiB0aGUgYWx0ZXJuYXRpdmUgbWVhbnMgYSBjbGVhbmVyCj4+IGlu
dGVyZmFjZSBmb3IgdGhlIHVzZXIgKHByZXZlbnRpbmcgdGhlbSBmcm9tIGNob29zaW5nIGFuIHVu
cmVhc29uYWJsZQo+PiBjb21iaW5hdGlvbiBvZiBvcHRpb25zKS4KPgo+IEFnYWluLCB0aGlzIGRv
ZXMgbm90IGV4cG9zZSBhIHRvZ2dsYWJsZSBrbm9iLCB0aGlzIGlzIGEgcHVyZWx5IGludGVybmFs
Cj4ga2NvbmZpZywgYXV0b21hdGljYWxseSBlbmFibGVkIGlmIENPTkZJR19LQVNBTl9HRU5FUklD
IGlzIHNldCBhbmQgaWYgdGhlCj4gYXJjaGl0ZWN0dXJlLXNwZWNpZmljIEtjb25maWcgZGVmaW5l
cyBIQVZFX0VCUEZfSklUX0tBU0FOIChzaW5jZSB3ZSB3YW50Cj4gaXQgZm9yIHg4NiBvbmx5KSwg
YW5kIHRoZXJlIHdvdWxkIGJlIG5vIHdheSB0byBlbmFibGUgS0FTQU4gZm9yIGtlcm5lbAo+IG9u
bHkgYW5kIG5vdCBmb3IgQlBGLCBvciB0aGUgb3RoZXIgd2F5IGFyb3VuZC4gV2hhdCBJIGFtIHBy
b3Bvc2luZyBpcwo+IGp1c3QgYW4gaW50ZXJuYWwsIGFyY2hpdGVjdHVyZS1hZ25vc3RpY2Uga2Nv
bmZpZyB0byBhdm9pZCBjb25kaXRpb25pbmcKPiBzb21lIHNlbGZ0ZXN0cyB0byBhbnkgYXJjaGl0
ZWN0dXJlLiAKCk1ha2VzIHNlbnNlLCBpbiB0aGlzIGNhc2UgdGhpcyBzZWVtcyByZWFzb25hYmxl
LgoKPgo+IEFsZXhpcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4u
c3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxt
YW4vbGlzdGluZm8vbGludXgtc3RtMzIK
