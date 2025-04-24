Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EEA1A9BB1B
	for <lists+linux-stm32@lfdr.de>; Fri, 25 Apr 2025 01:15:01 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1224CC78F72;
	Thu, 24 Apr 2025 23:15:01 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 96B84C78F68
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Apr 2025 23:14:59 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-39ee5a5bb66so1009254f8f.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Apr 2025 16:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745536499; x=1746141299;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=s8gs1eFT2kcTigsEaDxM7aO9zrXV1nvZcJgmjCeGg/s=;
 b=aZZSdX9xGuYlgr7rKkKTpJrZASZUABQUuMDFcf+wZtRT174wIaT2UC5MCdhjJ5qFhv
 SeZIiaxVthwGCjR2UBtc4/Zs8K7+J+CZS8bc7Eq1TT3p65o+WghkByzYmPSOY9aSrvb/
 1JQS5feEvPfka/hyIRC+JctvaLhbjUo76LF4VdnRtZFxbLA0cOY17V/sVq4/LocHvvlG
 RlxuPtT2p+Tm/CLNvbAH2+Pgric7GGs5/h/fJuutbgCwLWTwcOTWLAcdeJTC4gQ7eK5c
 +hEn/Thtuwi6w+iLqqbr2F40QrBRaqYm6jhEd2on2YCCoGXe8sjhEZZgQ29V0/yC8ahl
 LdAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745536499; x=1746141299;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=s8gs1eFT2kcTigsEaDxM7aO9zrXV1nvZcJgmjCeGg/s=;
 b=cpmUp8N1Y9R4GRfqzJMUWEx0gVQUeNp/rbJwjc1bBdVL5eCLXspfad0UVynu53yiKg
 Uojbot666yu7kmwhJDubSmh0lL/5VJC22RK0R0vG7WJYvBA78fnp4sXS5urXmxkQViH4
 YzHYmoexYlSczq0/OqRJOOGFv07Irzmniw0tdyKEbkMtesK3T9cIOlxzz2Cd8G8tc0PK
 DKlZg/t2YMr2qjkGMgvb8S+hdZKyG8tbHXnXWXBIkhgG8IiCK1fhiRds9yvZmvANxAYp
 +Nav+2TCBmXCHeohBT/BKVop82ahpmCcgEw5AG7logfMMogdN2uLxzNZWhfBucVA1ocm
 30Iw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV2jO5g3UAKXVqua0oBBbU52MVPJXm/yoyUpVvFrg/pq57pfr9MbNYiGvGurE7dZMl1egTWpCfxd57Zfw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yxouwy/TfY8ekuhFrkxIgpi8YMBzcOMuiaBkbF2c75L5DyzNJNj
 FmQDYXVdlQjSp+UdmDUWQ6KjhrCC0asf7Jod3pp5CzENxc0g6AInjUFvW3sUkWSjlqALXUWlagB
 yXJzYEOcMGa5VL76oVG5Ag8ingbc=
X-Gm-Gg: ASbGncuQN4OI8MqSFvUytGkQJYMDeBVxyXZyX9Vk9gc7SELpp8vbV89WS3r9Vmk93LP
 odIaKFJX646CVTcnSa2ePwSz2fVUkYI1BU6+RNzXNSDkHG0OG1WXiTOJFwisBNE1gEDItEMu2LG
 lW9wrNNBVkBdl+5NKG6azatvULbeB5SSkAKR6lTQ==
X-Google-Smtp-Source: AGHT+IE/YHe0tNhYaMF75gOnF/79ImQh8cJXhRvuuQQVkEf5Rbn7XpEgOWmmcxAdQyOyipX96Oi3C6Ci8VDp5VFlVyI=
X-Received: by 2002:a5d:47a9:0:b0:39a:c9ac:cd58 with SMTP id
 ffacd0b85a97d-3a074e37565mr6270f8f.29.1745536498767; Thu, 24 Apr 2025
 16:14:58 -0700 (PDT)
MIME-Version: 1.0
References: <20250411-many_args_arm64-v1-0-0a32fe72339e@bootlin.com>
 <20250411-many_args_arm64-v1-1-0a32fe72339e@bootlin.com>
 <CAEf4Bzbn6BdXTOb0dTcsQmOMZpp5=DzGS2hHHQ3+dwcja=gv+w@mail.gmail.com>
 <D98Q8BRNUVS9.11J60C67L1ALR@bootlin.com>
 <CAEf4BzZHMYyGDZ4c4eNXG7Fm=ecxCCbKhKbQTbCjvWmKtdwvBw@mail.gmail.com>
 <D9E9IQQ3QKXM.3UJ17G9CBS1FH@bootlin.com>
 <6b6472c3-0718-4e60-9972-c166d51962a3@huaweicloud.com>
 <D9EWSDXHDGFJ.FIDSHIR1OP80@bootlin.com>
In-Reply-To: <D9EWSDXHDGFJ.FIDSHIR1OP80@bootlin.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Thu, 24 Apr 2025 16:14:47 -0700
X-Gm-Features: ATxdqUHSd3r3JNAn_frzfTxFj2BJG7Z5GLEC-zQw6e4_nKCYPS6OLcRLFS8EitM
Message-ID: <CAADnVQJjQLdc_Chvz9v2-huCb9rmi048heK-eEX30AtW10H+-Q@mail.gmail.com>
To: =?UTF-8?Q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Alexei Starovoitov <ast@kernel.org>,
 Song Liu <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>,
 Shuah Khan <shuah@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 Mykola Lysenko <mykolal@fb.com>, Daniel Borkmann <daniel@iogearbox.net>,
 Will Deacon <will@kernel.org>, John Fastabend <john.fastabend@gmail.com>,
 Andrii Nakryiko <andrii@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>,
 Bastien Curutchet <bastien.curutchet@bootlin.com>,
 Florent Revest <revest@chromium.org>, Puranjay Mohan <puranjay@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, ebpf@linuxfoundation.org,
 Xu Kuohai <xukuohai@huaweicloud.com>, KP Singh <kpsingh@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Hao Luo <haoluo@google.com>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, Eduard Zingerman <eddyz87@gmail.com>,
 Jiri Olsa <jolsa@kernel.org>, bpf <bpf@vger.kernel.org>,
 Andrii Nakryiko <andrii.nakryiko@gmail.com>,
 Martin KaFai Lau <martin.lau@linux.dev>
Subject: Re: [Linux-stm32] [PATCH RFC bpf-next 1/4] bpf: add struct largest
 member size in func model
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

T24gVGh1LCBBcHIgMjQsIDIwMjUgYXQgNjozOOKAr0FNIEFsZXhpcyBMb3Rob3LDqQo8YWxleGlz
LmxvdGhvcmVAYm9vdGxpbi5jb20+IHdyb3RlOgo+Cj4gSGkgWHUsCj4KPiBPbiBUaHUgQXByIDI0
LCAyMDI1IGF0IDI6MDAgUE0gQ0VTVCwgWHUgS3VvaGFpIHdyb3RlOgo+ID4gT24gNC8yNC8yMDI1
IDM6MjQgQU0sIEFsZXhpcyBMb3Rob3LDqSB3cm90ZToKPiA+PiBIaSBBbmRyaWksCj4gPj4KPiA+
PiBPbiBXZWQgQXByIDIzLCAyMDI1IGF0IDc6MTUgUE0gQ0VTVCwgQW5kcmlpIE5ha3J5aWtvIHdy
b3RlOgo+ID4+PiBPbiBUaHUsIEFwciAxNywgMjAyNSBhdCAxMjoxNOKAr0FNIEFsZXhpcyBMb3Ro
b3LDqQo+ID4+PiA8YWxleGlzLmxvdGhvcmVAYm9vdGxpbi5jb20+IHdyb3RlOgo+ID4+Pj4KPiA+
Pj4+IEhpIEFuZHJpaSwKPiA+Pj4+Cj4gPj4+PiBPbiBXZWQgQXByIDE2LCAyMDI1IGF0IDExOjI0
IFBNIENFU1QsIEFuZHJpaSBOYWtyeWlrbyB3cm90ZToKPiA+Pj4+PiBPbiBGcmksIEFwciAxMSwg
MjAyNSBhdCAxOjMy4oCvUE0gQWxleGlzIExvdGhvcsOpIChlQlBGIEZvdW5kYXRpb24pCj4gPj4+
Pj4gPGFsZXhpcy5sb3Rob3JlQGJvb3RsaW4uY29tPiB3cm90ZToKPgo+IFsuLi5dCj4KPiA+PiBU
aGFua3MgZm9yIHRoZSBwb2ludGVyLCBJJ2xsIHRha2UgYSBsb29rIGF0IGl0LiBUaGUgbW9yZSB3
ZSBkaXNjdXNzIHRoaXMKPiA+PiBzZXJpZXMsIHRoZSBsZXNzIG1lbWJlciBzaXplIHNvdW5kcyBy
ZWxldmFudCBmb3Igd2hhdCBJJ20gdHJ5aW5nIHRvIGFjaGlldmUKPiA+PiBoZXJlLgo+ID4+Cj4g
Pj4gRm9sbG93aW5nIFh1J3MgY29tbWVudHMsIEkgaGF2ZSBiZWVuIHRoaW5raW5nIGFib3V0IGhv
dyBJIGNvdWxkIGRldGVjdCB0aGUKPiA+PiBjdXN0b20gYWxpZ25tZW50cyBhbmQgcGFja2luZyBv
biBzdHJ1Y3R1cmVzLCBhbmQgSSB3YXMgd29uZGVyaW5nIGlmIEkgY291bGQKPiA+PiBzb21laG93
IGJlbmVmaXQgZnJvbSBfX2F0dHJpYnV0ZV9fIGVuY29kaW5nIGluIEJURiBpbmZvIChbMV0pLiBC
dXQKPiA+PiBmb2xsb3dpbmcgeW91ciBoaW50LCBJIGFsc28gc2VlIHNvbWUgYnRmX2lzX3N0cnVj
dF9wYWNrZWQoKSBpbgo+ID4+IHRvb2xzL2xpYi9icGYvYnRmX2R1bXAuYyB0aGF0IGNvdWxkIGhl
bHAuIEknbGwgZGlnIHRoaXMgZnVydGhlciBhbmQgc2VlIGlmCj4gPj4gSSBjYW4gbWFuYWdlIHRv
IG1ha2Ugc29tZXRoaW5nIHdvcmsgd2l0aCBhbGwgb2YgdGhpcy4KPiA+Pgo+ID4KPiA+IFdpdGgg
RFdBUkYgaW5mbywgd2UgbWlnaHQgbm90IG5lZWQgdG8gZGV0ZWN0IHRoZSBzdHJ1Y3R1cmUgYWxp
Z25tZW50IGFueW1vcmUsCj4gPiBzaW5jZSB0aGUgRFdfQVRfbG9jYXRpb24gYXR0cmlidXRlIHRl
bGxzIHVzIHdoZXJlIHRoZSBzdHJ1Y3R1cmUgcGFyYW1ldGVyIGlzCj4gPiBsb2NhdGVkIG9uIHRo
ZSBzdGFjaywgYW5kIERXX0FUX2J5dGVfc2l6ZSBnaXZlcyB1cyB0aGUgc2l6ZSBvZiB0aGUgc3Ry
dWN0dXJlLgo+Cj4gSSBhbSBub3Qgc3VyZSB0byBmb2xsb3cgeW91IGhlcmUsIGJlY2F1c2UgRFdB
UkYgaW5mbyBpcyBub3QgYWNjZXNzaWJsZQo+IGZyb20ga2VybmVsIGF0IHJ1bnRpbWUsIHJpZ2h0
ID8gT3IgYXJlIHlvdSBtZWFuaW5nIHRoYXQgd2UgY291bGQsIGF0IGJ1aWxkCj4gdGltZSwgZW5y
aWNoIHRoZSBCVEYgaW5mbyBlbWJlZGRlZCBpbiB0aGUga2VybmVsIHRoYW5rcyB0byBEV0FSRiBp
bmZvID8KClNvdW5kcyBsaWtlIGFybTY0IGhhcyBjb21wbGljYXRlZCBydWxlcyBmb3Igc3RhY2sg
YWxpZ25tZW50IGFuZApzdGFjayBvZmZzZXQgY29tcHV0YXRpb24gZm9yIHBhc3NpbmcgOXRoKyBh
cmd1bWVudC4KClNpbmNlIHlvdXIgYW5hbHlzaXMgc2hvd3M6CiJ0aGVyZSBhcmUgYWJvdXQgMjAw
IGZ1bmN0aW9ucyBhY2NlcHQgOSB0byAxMiBhcmd1bWVudHMsIHNvIGFkZGluZyBzdXBwb3J0CmZv
ciB1cCB0byAxMiBmdW5jdGlvbiBhcmd1bWVudHMuIgpJIHNheSwgbGV0J3Mga2VlcCB0aGUgZXhp
c3RpbmcgbGltaXRhdGlvbjoKICAgICAgICBpZiAobnJlZ3MgPiA4KQogICAgICAgICAgICAgICAg
cmV0dXJuIC1FTk9UU1VQUDsKCklmIHRoZXJlIGlzIGEgc2ltcGxlIGFuZCBkdW1iIHdheSB0byBk
ZXRlY3QgdGhhdCBhcmc5KyBhcmUgc2NhbGFycwp3aXRoIHNpbXBsZSBzdGFjayBwYXNzaW5nIHJ1
bGVzLCB0aGVuLCBzdXJlLCBsZXQncyBzdXBwb3J0IHRob3NlIHRvbywKYnV0IGZhbmN5IHBhY2tl
ZC9hbGlnbih4KS9ldGMgbGV0J3MgaWdub3JlLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJA
c3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1y
ZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
