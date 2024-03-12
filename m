Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F1FD4878C87
	for <lists+linux-stm32@lfdr.de>; Tue, 12 Mar 2024 02:51:43 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B08F2C6DD9D;
	Tue, 12 Mar 2024 01:51:43 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9E858C6DD73
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Mar 2024 01:51:42 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-33e99b62e01so1101349f8f.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Mar 2024 18:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710208302; x=1710813102;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aKvBVych6YCWus4gRNHRR8iBtRNOaryODuyFk+IiwIg=;
 b=VJqJNZThTE3K+V+USdiBRIl1h44opK690XUpEKgeMPhBryuuKoDDpnX1bw1UqmYNdG
 7kNUXbDQWIQ8ymYddyP9BAWI39NHhHTF4d8TMLrEh1UD20nrWiY1XNupbdFTeUKKKH4p
 MVO3IecP9wKm5f2JBZ67/V8pIEQp7jWmISbokfKYptOpTYbpobHOoKXhFN3v0THSloae
 22BJu0X2xC6zhRNeuTFzDDGqlFrlc8rXBi3m1MUdKTwLx8Av9Y6nVsz1niGT8r/m2Vy9
 yXVeZdK749Gv4Br1KQoYaF6+Asz8Kf9fzX80/g5U/EPaE/Ab64LhCfy7Mw4wHHyg3RbI
 SaNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710208302; x=1710813102;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aKvBVych6YCWus4gRNHRR8iBtRNOaryODuyFk+IiwIg=;
 b=XjDZwqrV4xdwivIKV2TmG26IUogVKCs9/S2QETGZcLLq+4a6r9k9fdd+5HwvJMN4Zf
 E9YFaHpLC6LjURamkDHt6ajA6vEQHf5G1XKzZJPBZUPzI+GjzoEUEeuebCw3vid02O+0
 AhiB6RweiLX4zPt0jnr9mktUZPyvoaSuBHcE0HnRJygMxSmnG81Sydf8SGINliF1e6br
 WiuZdJC6AQPh+yPXCmypBpxuDoYCICALA2wyXlQizq99SMrUBBzarQH8qkCfQofw8qxP
 1AoMsd8gAWH9wc3ys+1cO3H951uorzPjPpuqSeZ+ky0tqHv0L0ODlP/U3ohVyDR8rvhk
 pkdA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX8pz0fFSW+Dim0fY1fqctr3AG/dbLAbn50dt+q/ZqfqzpyrVOsYIaAIcLqLdHFIRYvC71m5S/zinxM/nCP9ghS6dMQ0fJSfLeSxs9AYw/4DfilEanzvjUK
X-Gm-Message-State: AOJu0YyPjsjgu9wGUKBqaJLRKlkjYs1uV4xzdBZofjEFuyW7l6phS1rI
 Jh5Vz45S6OZcUisNMnfsVMSZ8TRpzekoLRc1mj4dFHEZcLPHJ6dwcghnm+pE+VGGvc0DJ8cE9bb
 fay3kTe7FnZZkV85DGhGiwZbGWLM=
X-Google-Smtp-Source: AGHT+IEB/YPizRPdSM8g0e75qq4Trwgwdg1LF6SZVgxJUmKpI+Q9QIjihr7HmFgR5GDbRJDy4Pav6rzymzHVBMyXxJg=
X-Received: by 2002:adf:ea06:0:b0:33e:48f9:169d with SMTP id
 q6-20020adfea06000000b0033e48f9169dmr403840wrm.31.1710208301974; Mon, 11 Mar
 2024 18:51:41 -0700 (PDT)
MIME-Version: 1.0
References: <20240311093526.1010158-1-dongmenglong.8@bytedance.com>
 <20240311093526.1010158-6-dongmenglong.8@bytedance.com>
In-Reply-To: <20240311093526.1010158-6-dongmenglong.8@bytedance.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Mon, 11 Mar 2024 18:51:30 -0700
Message-ID: <CAADnVQKw4HUbwvivysVBQPpA2MC2e56MwrvJy89qs8rx_ixOnw@mail.gmail.com>
To: Menglong Dong <dongmenglong.8@bytedance.com>
Cc: "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, Alexei Starovoitov <ast@kernel.org>,
 Song Liu <song@kernel.org>, Stanislav Fomichev <sdf@google.com>,
 Yonghong Song <yonghong.song@linux.dev>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 linux-s390 <linux-s390@vger.kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, X86 ML <x86@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>, Andrii Nakryiko <andrii@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Quentin Monnet <quentin@isovalent.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 linux-trace-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>,
 KP Singh <kpsingh@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Hao Luo <haoluo@google.com>, Network Development <netdev@vger.kernel.org>,
 David Ahern <dsahern@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 Eddy Z <eddyz87@gmail.com>, Sven Schnelle <svens@linux.ibm.com>,
 Jiri Olsa <jolsa@kernel.org>, bpf <bpf@vger.kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH bpf-next v2 5/9] bpf: verifier: add btf to
 the function args of bpf_check_attach_target
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

T24gTW9uLCBNYXIgMTEsIDIwMjQgYXQgMjozNeKAr0FNIE1lbmdsb25nIERvbmcKPGRvbmdtZW5n
bG9uZy44QGJ5dGVkYW5jZS5jb20+IHdyb3RlOgo+Cj4gQWRkIHRhcmdldCBidGYgdG8gdGhlIGZ1
bmN0aW9uIGFyZ3Mgb2YgYnBmX2NoZWNrX2F0dGFjaF90YXJnZXQoKSwgdGhlbgo+IHRoZSBjYWxs
ZXIgY2FuIHNwZWNpZnkgdGhlIGJ0ZiB0byBjaGVjay4KPgo+IFNpZ25lZC1vZmYtYnk6IE1lbmds
b25nIERvbmcgPGRvbmdtZW5nbG9uZy44QGJ5dGVkYW5jZS5jb20+Cj4gLS0tCj4gIGluY2x1ZGUv
bGludXgvYnBmX3ZlcmlmaWVyLmggfCAxICsKPiAga2VybmVsL2JwZi9zeXNjYWxsLmMgICAgICAg
ICB8IDYgKysrKy0tCj4gIGtlcm5lbC9icGYvdHJhbXBvbGluZS5jICAgICAgfCAxICsKPiAga2Vy
bmVsL2JwZi92ZXJpZmllci5jICAgICAgICB8IDggKysrKystLS0KPiAgNCBmaWxlcyBjaGFuZ2Vk
LCAxMSBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2luY2x1
ZGUvbGludXgvYnBmX3ZlcmlmaWVyLmggYi9pbmNsdWRlL2xpbnV4L2JwZl92ZXJpZmllci5oCj4g
aW5kZXggNGIwZjY2MDBlNDk5Li42Y2IyMGVmY2ZhYzMgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9s
aW51eC9icGZfdmVyaWZpZXIuaAo+ICsrKyBiL2luY2x1ZGUvbGludXgvYnBmX3ZlcmlmaWVyLmgK
PiBAQCAtODExLDYgKzgxMSw3IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBicGZfdHJhbXBvbGluZV91
bnBhY2tfa2V5KHU2NCBrZXksIHUzMiAqb2JqX2lkLCB1MzIgKmJ0Zl9pZCkKPiAgaW50IGJwZl9j
aGVja19hdHRhY2hfdGFyZ2V0KHN0cnVjdCBicGZfdmVyaWZpZXJfbG9nICpsb2csCj4gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IHN0cnVjdCBicGZfcHJvZyAqcHJvZywKPiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgY29uc3Qgc3RydWN0IGJwZl9wcm9nICp0Z3RfcHJvZywK
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IGJ0ZiAqYnRmLAo+ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICB1MzIgYnRmX2lkLAo+ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBzdHJ1Y3QgYnBmX2F0dGFjaF90YXJnZXRfaW5mbyAqdGd0X2luZm8pOwo+ICB2b2lkIGJw
Zl9mcmVlX2tmdW5jX2J0Zl90YWIoc3RydWN0IGJwZl9rZnVuY19idGZfdGFiICp0YWIpOwo+IGRp
ZmYgLS1naXQgYS9rZXJuZWwvYnBmL3N5c2NhbGwuYyBiL2tlcm5lbC9icGYvc3lzY2FsbC5jCj4g
aW5kZXggZDFjZDY0NWVmOWFjLi42MTI4YzMxMzExNDEgMTAwNjQ0Cj4gLS0tIGEva2VybmVsL2Jw
Zi9zeXNjYWxsLmMKPiArKysgYi9rZXJuZWwvYnBmL3N5c2NhbGwuYwo+IEBAIC0zNDAxLDkgKzM0
MDEsMTEgQEAgc3RhdGljIGludCBicGZfdHJhY2luZ19wcm9nX2F0dGFjaChzdHJ1Y3QgYnBmX3By
b2cgKnByb2csCj4gICAgICAgICAgICAgICAgICAqIG5lZWQgYSBuZXcgdHJhbXBvbGluZSBhbmQg
YSBjaGVjayBmb3IgY29tcGF0aWJpbGl0eQo+ICAgICAgICAgICAgICAgICAgKi8KPiAgICAgICAg
ICAgICAgICAgc3RydWN0IGJwZl9hdHRhY2hfdGFyZ2V0X2luZm8gdGd0X2luZm8gPSB7fTsKPiAr
ICAgICAgICAgICAgICAgc3RydWN0IGJ0ZiAqYnRmOwo+Cj4gLSAgICAgICAgICAgICAgIGVyciA9
IGJwZl9jaGVja19hdHRhY2hfdGFyZ2V0KE5VTEwsIHByb2csIHRndF9wcm9nLCBidGZfaWQsCj4g
LSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICZ0Z3RfaW5mbyk7
Cj4gKyAgICAgICAgICAgICAgIGJ0ZiA9IHRndF9wcm9nID8gdGd0X3Byb2ctPmF1eC0+YnRmIDog
cHJvZy0+YXV4LT5hdHRhY2hfYnRmOwoKSSB0aGluayBpdCdzIGJldHRlciB0byBrZWVwIHRoaXMg
Yml0IGluc2lkZSBicGZfY2hlY2tfYXR0YWNoX3RhcmdldCgpLApzaW5jZSBhIGxvdCBvZiBvdGhl
ciBjb2RlIGluIHRoZXJlIGlzIHdvcmtpbmcgd2l0aCBpZiAodGd0X3Byb2cpIC4uLgpzbyBpZiB0
aGUgY2FsbGVyIG1lc3NlcyB1cCBwYXNzaW5nIHRndF9wcm9nLT5hdXgtPmJ0ZiB3aXRoIHRndF9w
cm9nCnRoZSBidWcgd2lsbCBiZSBkaWZmaWN1bHQgdG8gZGVidWcuCgo+ICsgICAgICAgICAgICAg
ICBlcnIgPSBicGZfY2hlY2tfYXR0YWNoX3RhcmdldChOVUxMLCBwcm9nLCB0Z3RfcHJvZywgYnRm
LAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBidGZfaWQs
ICZ0Z3RfaW5mbyk7Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0
b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
