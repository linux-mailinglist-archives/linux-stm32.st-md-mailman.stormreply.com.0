Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EEA6878C98
	for <lists+linux-stm32@lfdr.de>; Tue, 12 Mar 2024 02:55:46 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 10240C6DD9D;
	Tue, 12 Mar 2024 01:55:46 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 40317C6DD73
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Mar 2024 01:55:44 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-33e959d8bc0so1541034f8f.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Mar 2024 18:55:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710208543; x=1710813343;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qUQTgV/c1LY6TxFowY3rUQdPlQN/M6/pFPRnz+ClL7I=;
 b=h0REYW7TAntov57WSR1TdDJXP23MqS/xdz01199E2ughifsbmLA/bx/iHhi+DXS4dD
 55ZJrWMfF7vPoCywybqmJj17nI1XYrdZynGk7rp+dY/ULSy7hflnogy/bMHKZ64wEjy/
 BcbZt9zHaoymIq/BAe/Iz2hFOKEs1OKH3hxNPO/2pc1ntws7nVgEUy3cgg14uiOKxsHD
 iIu501684OCF3dNTnJK3uwVATf6CZmlrkcc22w2tJuzymFolN82rm8EAg96A7zFLHqfh
 RpNvDNzqSw9UgtW6ejw83dmoI3yfKdNL/S9DRjT9gduhtfxTVLgO1DbrZTnzxpnr6Hwg
 Jvqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710208543; x=1710813343;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qUQTgV/c1LY6TxFowY3rUQdPlQN/M6/pFPRnz+ClL7I=;
 b=a2QheU6HTNorx7vWFqJyTm9MmV77v/uVVRjEMCC2J33I0XUCIMLvUP62b12OkCtdqi
 qEqJGTjVl0EZZK8KcVZ8tEZc3P10bIz4dqhez41J3dZ49gI/fN/ZNO51JqoJXqZHouXo
 6ZilaB2g6NwXJU1xpUXsOFgtqVNV7GZbue5wVt9/lSLYbkQwT91oVkwn0sP3n+OkxRSx
 ljuUj195mPMJlTspz+TUpN4rrRMi7zNb8neWxIhYqTtYnwzb5bVrlVzhXBoTlwAigiWc
 MXteCd23HhbFA6X4qz651w0lupt3vCoi8KBWclF3gob8iiTrCqGzfeFjLNuENe7/CWnY
 +ZBA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU224NEe6567JLB8fYEy9F2JWY4ErqppQfW1vPTEHcFDQLDJyqImQZPPdDuiFiRnKoikK1jPTHZgBhikjviRVtsdyZlhtTyDgJIc3hanWJVVhO8dvIB/msX
X-Gm-Message-State: AOJu0Yy633S0dhTnz/JEdUQTqfc4CSeNBgz38BUjodLDsMiBLOk7XuWz
 OZYwtPXVg+3iAAb4xeljiXNPg2LkLhMkL4gyTfZet2geqRRl/ZT5aXQL3Wc+J1ge+ZldcKFZvQu
 iJGZEFqt72jxdP/l+k/7H1avawVw=
X-Google-Smtp-Source: AGHT+IF9WvwCtzNHUsfNfLjeVXn5IKrULfW4spgTCxiFBM0s3KVbOpftBxulltD2FNgWguOKkvH7qH1ag5mO6L5+G/8=
X-Received: by 2002:adf:ec8c:0:b0:33e:1ee1:ef92 with SMTP id
 z12-20020adfec8c000000b0033e1ee1ef92mr6682508wrn.67.1710208543538; Mon, 11
 Mar 2024 18:55:43 -0700 (PDT)
MIME-Version: 1.0
References: <20240311093526.1010158-1-dongmenglong.8@bytedance.com>
 <20240311093526.1010158-8-dongmenglong.8@bytedance.com>
In-Reply-To: <20240311093526.1010158-8-dongmenglong.8@bytedance.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Mon, 11 Mar 2024 18:55:32 -0700
Message-ID: <CAADnVQK4tdefa3s=sim69Sc+ztd-hHohPEDXaUNVTU-mLNYUiw@mail.gmail.com>
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
Subject: Re: [Linux-stm32] [PATCH bpf-next v2 7/9] libbpf: don't free btf if
 program of multi-link tracing existing
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
bG9uZy44QGJ5dGVkYW5jZS5jb20+IHdyb3RlOgo+Cj4gQnkgZGVmYXVsdCwgdGhlIGtlcm5lbCBi
dGYgdGhhdCB3ZSBsb2FkIGR1cmluZyBsb2FkaW5nIHByb2dyYW0gd2lsbCBiZQo+IGZyZWVkIGFm
dGVyIHRoZSBwcm9ncmFtcyBhcmUgbG9hZGVkIGluIGJwZl9vYmplY3RfbG9hZCgpLiBIb3dldmVy
LCB3ZQo+IHN0aWxsIG5lZWQgdG8gdXNlIHRoZXNlIGJ0ZiBmb3IgdHJhY2luZyBvZiBtdWx0aS1s
aW5rIGR1cmluZyBhdHRhY2hpbmcuCj4gVGhlcmVmb3JlLCB3ZSBkb24ndCBmcmVlIHRoZSBidGZz
IHVudGlsIHRoZSBicGYgb2JqZWN0IGlzIGNsb3NlZCBpZiBhbnkKPiBicGYgcHJvZ3JhbXMgb2Yg
dGhlIHR5cGUgbXVsdGktbGluayB0cmFjaW5nIGV4aXN0Lgo+Cj4gTWVhbndoaWxlLCBpbnRyb2R1
Y2UgdGhlIG5ldyBhcGkgYnBmX29iamVjdF9fZnJlZV9idGYoKSB0byBtYW51YWxseSBmcmVlCj4g
dGhlIGJ0ZnMgYWZ0ZXIgYXR0YWNoaW5nLgo+Cj4gU2lnbmVkLW9mZi1ieTogTWVuZ2xvbmcgRG9u
ZyA8ZG9uZ21lbmdsb25nLjhAYnl0ZWRhbmNlLmNvbT4KPiAtLS0KPiAgdG9vbHMvbGliL2JwZi9s
aWJicGYuYyAgIHwgNDcgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLQo+
ICB0b29scy9saWIvYnBmL2xpYmJwZi5oICAgfCAgMiArKwo+ICB0b29scy9saWIvYnBmL2xpYmJw
Zi5tYXAgfCAgMSArCj4gIDMgZmlsZXMgY2hhbmdlZCwgMzggaW5zZXJ0aW9ucygrKSwgMTIgZGVs
ZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvdG9vbHMvbGliL2JwZi9saWJicGYuYyBiL3Rvb2xz
L2xpYi9icGYvbGliYnBmLmMKPiBpbmRleCA1NjdhZDM2N2U3YWEuLmZkNTQyODQ5NGE3ZSAxMDA2
NDQKPiAtLS0gYS90b29scy9saWIvYnBmL2xpYmJwZi5jCj4gKysrIGIvdG9vbHMvbGliL2JwZi9s
aWJicGYuYwo+IEBAIC04MjY3LDYgKzgyNjcsMzkgQEAgc3RhdGljIGludCBicGZfb2JqZWN0X3By
ZXBhcmVfc3RydWN0X29wcyhzdHJ1Y3QgYnBmX29iamVjdCAqb2JqKQo+ICAgICAgICAgcmV0dXJu
IDA7Cj4gIH0KPgo+ICt2b2lkIGJwZl9vYmplY3RfX2ZyZWVfYnRmcyhzdHJ1Y3QgYnBmX29iamVj
dCAqb2JqKQo+ICt7Cj4gKyAgICAgICBpbnQgaTsKPiArCj4gKyAgICAgICAvKiBjbGVhbiB1cCBt
b2R1bGUgQlRGcyAqLwo+ICsgICAgICAgZm9yIChpID0gMDsgaSA8IG9iai0+YnRmX21vZHVsZV9j
bnQ7IGkrKykgewo+ICsgICAgICAgICAgICAgICBjbG9zZShvYmotPmJ0Zl9tb2R1bGVzW2ldLmZk
KTsKPiArICAgICAgICAgICAgICAgYnRmX19mcmVlKG9iai0+YnRmX21vZHVsZXNbaV0uYnRmKTsK
PiArICAgICAgICAgICAgICAgZnJlZShvYmotPmJ0Zl9tb2R1bGVzW2ldLm5hbWUpOwo+ICsgICAg
ICAgfQo+ICsgICAgICAgZnJlZShvYmotPmJ0Zl9tb2R1bGVzKTsKPiArICAgICAgIG9iai0+YnRm
X21vZHVsZXMgPSBOVUxMOwo+ICsgICAgICAgb2JqLT5idGZfbW9kdWxlX2NudCA9IDA7Cj4gKwo+
ICsgICAgICAgLyogY2xlYW4gdXAgdm1saW51eCBCVEYgKi8KPiArICAgICAgIGJ0Zl9fZnJlZShv
YmotPmJ0Zl92bWxpbnV4KTsKPiArICAgICAgIG9iai0+YnRmX3ZtbGludXggPSBOVUxMOwo+ICt9
Cj4gKwo+ICtzdGF0aWMgdm9pZCBicGZfb2JqZWN0X2Vhcmx5X2ZyZWVfYnRmKHN0cnVjdCBicGZf
b2JqZWN0ICpvYmopCj4gK3sKPiArICAgICAgIHN0cnVjdCBicGZfcHJvZ3JhbSAqcHJvZzsKPiAr
Cj4gKyAgICAgICBicGZfb2JqZWN0X19mb3JfZWFjaF9wcm9ncmFtKHByb2csIG9iaikgewo+ICsg
ICAgICAgICAgICAgICBpZiAocHJvZy0+ZXhwZWN0ZWRfYXR0YWNoX3R5cGUgPT0gQlBGX1RSQUNF
X0ZFTlRSWV9NVUxUSSB8fAo+ICsgICAgICAgICAgICAgICAgICAgcHJvZy0+ZXhwZWN0ZWRfYXR0
YWNoX3R5cGUgPT0gQlBGX1RSQUNFX0ZFWElUX01VTFRJIHx8Cj4gKyAgICAgICAgICAgICAgICAg
ICBwcm9nLT5leHBlY3RlZF9hdHRhY2hfdHlwZSA9PSBCUEZfTU9ESUZZX1JFVFVSTl9NVUxUSSkK
PiArICAgICAgICAgICAgICAgICAgICAgICByZXR1cm47Cj4gKyAgICAgICB9Cj4gKwo+ICsgICAg
ICAgYnBmX29iamVjdF9fZnJlZV9idGZzKG9iaik7Cj4gK30KPiArCj4gIHN0YXRpYyBpbnQgYnBm
X29iamVjdF9sb2FkKHN0cnVjdCBicGZfb2JqZWN0ICpvYmosIGludCBleHRyYV9sb2dfbGV2ZWws
IGNvbnN0IGNoYXIgKnRhcmdldF9idGZfcGF0aCkKPiAgewo+ICAgICAgICAgaW50IGVyciwgaTsK
PiBAQCAtODMwNywxOCArODM0MCw3IEBAIHN0YXRpYyBpbnQgYnBmX29iamVjdF9sb2FkKHN0cnVj
dCBicGZfb2JqZWN0ICpvYmosIGludCBleHRyYV9sb2dfbGV2ZWwsIGNvbnN0IGNoCj4gICAgICAg
ICAvKiBjbGVhbiB1cCBmZF9hcnJheSAqLwo+ICAgICAgICAgemZyZWUoJm9iai0+ZmRfYXJyYXkp
Owo+Cj4gLSAgICAgICAvKiBjbGVhbiB1cCBtb2R1bGUgQlRGcyAqLwo+IC0gICAgICAgZm9yIChp
ID0gMDsgaSA8IG9iai0+YnRmX21vZHVsZV9jbnQ7IGkrKykgewo+IC0gICAgICAgICAgICAgICBj
bG9zZShvYmotPmJ0Zl9tb2R1bGVzW2ldLmZkKTsKPiAtICAgICAgICAgICAgICAgYnRmX19mcmVl
KG9iai0+YnRmX21vZHVsZXNbaV0uYnRmKTsKPiAtICAgICAgICAgICAgICAgZnJlZShvYmotPmJ0
Zl9tb2R1bGVzW2ldLm5hbWUpOwo+IC0gICAgICAgfQo+IC0gICAgICAgZnJlZShvYmotPmJ0Zl9t
b2R1bGVzKTsKPiAtCj4gLSAgICAgICAvKiBjbGVhbiB1cCB2bWxpbnV4IEJURiAqLwo+IC0gICAg
ICAgYnRmX19mcmVlKG9iai0+YnRmX3ZtbGludXgpOwo+IC0gICAgICAgb2JqLT5idGZfdm1saW51
eCA9IE5VTEw7Cj4gLQo+ICsgICAgICAgYnBmX29iamVjdF9lYXJseV9mcmVlX2J0ZihvYmopOwo+
ICAgICAgICAgb2JqLT5sb2FkZWQgPSB0cnVlOyAvKiBkb2Vzbid0IG1hdHRlciBpZiBzdWNjZXNz
ZnVsbHkgb3Igbm90ICovCj4KPiAgICAgICAgIGlmIChlcnIpCj4gQEAgLTg3OTEsNiArODgxMyw3
IEBAIHZvaWQgYnBmX29iamVjdF9fY2xvc2Uoc3RydWN0IGJwZl9vYmplY3QgKm9iaikKPiAgICAg
ICAgIHVzZHRfbWFuYWdlcl9mcmVlKG9iai0+dXNkdF9tYW4pOwo+ICAgICAgICAgb2JqLT51c2R0
X21hbiA9IE5VTEw7Cj4KPiArICAgICAgIGJwZl9vYmplY3RfX2ZyZWVfYnRmcyhvYmopOwo+ICAg
ICAgICAgYnBmX2dlbl9fZnJlZShvYmotPmdlbl9sb2FkZXIpOwo+ICAgICAgICAgYnBmX29iamVj
dF9fZWxmX2ZpbmlzaChvYmopOwo+ICAgICAgICAgYnBmX29iamVjdF91bmxvYWQob2JqKTsKPiBk
aWZmIC0tZ2l0IGEvdG9vbHMvbGliL2JwZi9saWJicGYuaCBiL3Rvb2xzL2xpYi9icGYvbGliYnBm
LmgKPiBpbmRleCA1NzIzY2JiZmNjNDEuLmM0MWE5MDllYTRjMSAxMDA2NDQKPiAtLS0gYS90b29s
cy9saWIvYnBmL2xpYmJwZi5oCj4gKysrIGIvdG9vbHMvbGliL2JwZi9saWJicGYuaAo+IEBAIC0y
OTksNiArMjk5LDggQEAgTElCQlBGX0FQSSBzdHJ1Y3QgYnBmX3Byb2dyYW0gKgo+ICBicGZfb2Jq
ZWN0X19maW5kX3Byb2dyYW1fYnlfbmFtZShjb25zdCBzdHJ1Y3QgYnBmX29iamVjdCAqb2JqLAo+
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IGNoYXIgKm5hbWUpOwo+Cj4g
K0xJQkJQRl9BUEkgdm9pZCBicGZfb2JqZWN0X19mcmVlX2J0ZnMoc3RydWN0IGJwZl9vYmplY3Qg
Km9iaik7Cj4gKwoKSXQgc2hvdWxkbid0IGJlIGV4cG9ydGVkLgpsaWJicGYgc2hvdWxkIGNsZWFu
IGl0IHVwIHdoZW4gYnBmX29iamVjdCBpcyBmcmVlZC4KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0
bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0
b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
