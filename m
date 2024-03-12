Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 12A48878CB9
	for <lists+linux-stm32@lfdr.de>; Tue, 12 Mar 2024 03:05:50 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C8296C6DD9D;
	Tue, 12 Mar 2024 02:05:49 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EED6CC6DD73
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Mar 2024 02:05:47 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id
 98e67ed59e1d1-29b7b9a4908so2232694a91.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Mar 2024 19:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1710209146; x=1710813946;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nuFUN/hOP8k7Y+FzC49ZRi5HcBAhtMCwCDKyd6VJ7Rk=;
 b=JTWfh7lyP+rV1v/zQWe2KIaY4369YbAxz0nyRdm0C4CMNUAUeh9izhb7YZA8venR8b
 E3p282hy7rXNWxMxb9E0oOJwk4ISRS+FQSO8JijfGUQG9NPZBDSGvYmZv8CJOBBSoU31
 ZfAbvK5Fh6Uhr6ztEGN/tb9lctPzX4T2pMp6svRDSTj2JTzEyfDXzKPSbcDc1fro+JH8
 R6rk7sXtLHVrTH2+dTp6AM0GB06mzmO0IXBFGUuyNaYKV/G+lYgeSyy/NgK+wZmSpd5r
 ggRtFmdxXUZ8cGnB9akba0h48NXlhy5vLrTFOuiC0Av9tsbQxljUOeb0u14NGPuYzUNU
 I1UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710209146; x=1710813946;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nuFUN/hOP8k7Y+FzC49ZRi5HcBAhtMCwCDKyd6VJ7Rk=;
 b=qRg6qSln8otzR7rFlVinzUEX57m3gB2LVWqIbOgBf5ztaCmqaEPfXk7IbdTERl+nxH
 6QYiS3KZ42z6EeqDd5hLfktogRVhz2lUOYirzp6tWsMKLt3zaAiPX5Gs5mTeSD/bgnrD
 j1fuXfa51x6TkMDAnGwo38xMwmKGGjFPIa7SAs+uqloABaSNKiheAmXR+iZj4Us2joMH
 BFY+FI+hpuJJbCy3rRnn/XaOpMtpUZhjw+HZ/27yjQSED+wIaAzc1kIZ7Cc5hP5JHnDN
 w/5dc5/IKkxVu1+elaes/+x+lEEhCEo+5vqAjbXm16emrbgWpcaGLFxj8LzeVvbzs2I9
 2P7Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVMQlKTarxzZKE38O5MZNlkO5zXftXUZxGC/xNFyCcTFUz+VEVyMYnX75G3EQCS3rB30wdf9klPUlCoRjAX/uXrbKEqZNgkE7y+iVwJulqoRlGJleWLYsIv
X-Gm-Message-State: AOJu0YwT8kSB82f3ErZjV1iVohiQYcSxped+nA0zzN0UP/NYFYYKmMab
 yVFHexhClpZayoMzXid0R15lQI+p+1zcC8m87mxAbRSP59Hcl/LB6BQTJ9Fp+KHk0nMwEbtxBVb
 6arbr9roPF8unxstNIL2AvSfY3RNNsaG4nagGZA==
X-Google-Smtp-Source: AGHT+IF0WyYVLRMqbAbNjbiNEwXcYruNNPa78bRdIpKnuRBjtBqbGNQqz6kUmi5cKSh3oZKwaTTzkPnN9f3bSgCjkEM=
X-Received: by 2002:a17:90b:46d3:b0:29b:ae33:6ef2 with SMTP id
 jx19-20020a17090b46d300b0029bae336ef2mr6174052pjb.38.1710209146474; Mon, 11
 Mar 2024 19:05:46 -0700 (PDT)
MIME-Version: 1.0
References: <20240311093526.1010158-1-dongmenglong.8@bytedance.com>
 <20240311093526.1010158-8-dongmenglong.8@bytedance.com>
 <CAADnVQK4tdefa3s=sim69Sc+ztd-hHohPEDXaUNVTU-mLNYUiw@mail.gmail.com>
In-Reply-To: <CAADnVQK4tdefa3s=sim69Sc+ztd-hHohPEDXaUNVTU-mLNYUiw@mail.gmail.com>
From: =?UTF-8?B?5qKm6b6Z6JGj?= <dongmenglong.8@bytedance.com>
Date: Tue, 12 Mar 2024 10:05:35 +0800
Message-ID: <CALz3k9iabeOwHSrPb9mkfCuOebanh3+bAfi7xh3kBBN0DzHC3A@mail.gmail.com>
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
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
Subject: Re: [Linux-stm32] [External] Re: [PATCH bpf-next v2 7/9] libbpf:
 don't free btf if program of multi-link tracing existing
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

T24gVHVlLCBNYXIgMTIsIDIwMjQgYXQgOTo1NeKAr0FNIEFsZXhlaSBTdGFyb3ZvaXRvdgo8YWxl
eGVpLnN0YXJvdm9pdG92QGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBPbiBNb24sIE1hciAxMSwgMjAy
NCBhdCAyOjM14oCvQU0gTWVuZ2xvbmcgRG9uZwo+IDxkb25nbWVuZ2xvbmcuOEBieXRlZGFuY2Uu
Y29tPiB3cm90ZToKPiA+Cj4gPiBCeSBkZWZhdWx0LCB0aGUga2VybmVsIGJ0ZiB0aGF0IHdlIGxv
YWQgZHVyaW5nIGxvYWRpbmcgcHJvZ3JhbSB3aWxsIGJlCj4gPiBmcmVlZCBhZnRlciB0aGUgcHJv
Z3JhbXMgYXJlIGxvYWRlZCBpbiBicGZfb2JqZWN0X2xvYWQoKS4gSG93ZXZlciwgd2UKPiA+IHN0
aWxsIG5lZWQgdG8gdXNlIHRoZXNlIGJ0ZiBmb3IgdHJhY2luZyBvZiBtdWx0aS1saW5rIGR1cmlu
ZyBhdHRhY2hpbmcuCj4gPiBUaGVyZWZvcmUsIHdlIGRvbid0IGZyZWUgdGhlIGJ0ZnMgdW50aWwg
dGhlIGJwZiBvYmplY3QgaXMgY2xvc2VkIGlmIGFueQo+ID4gYnBmIHByb2dyYW1zIG9mIHRoZSB0
eXBlIG11bHRpLWxpbmsgdHJhY2luZyBleGlzdC4KPiA+Cj4gPiBNZWFud2hpbGUsIGludHJvZHVj
ZSB0aGUgbmV3IGFwaSBicGZfb2JqZWN0X19mcmVlX2J0ZigpIHRvIG1hbnVhbGx5IGZyZWUKPiA+
IHRoZSBidGZzIGFmdGVyIGF0dGFjaGluZy4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBNZW5nbG9u
ZyBEb25nIDxkb25nbWVuZ2xvbmcuOEBieXRlZGFuY2UuY29tPgo+ID4gLS0tCj4gPiAgdG9vbHMv
bGliL2JwZi9saWJicGYuYyAgIHwgNDcgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0t
LS0tLS0tLQo+ID4gIHRvb2xzL2xpYi9icGYvbGliYnBmLmggICB8ICAyICsrCj4gPiAgdG9vbHMv
bGliL2JwZi9saWJicGYubWFwIHwgIDEgKwo+ID4gIDMgZmlsZXMgY2hhbmdlZCwgMzggaW5zZXJ0
aW9ucygrKSwgMTIgZGVsZXRpb25zKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYi9i
cGYvbGliYnBmLmMgYi90b29scy9saWIvYnBmL2xpYmJwZi5jCj4gPiBpbmRleCA1NjdhZDM2N2U3
YWEuLmZkNTQyODQ5NGE3ZSAxMDA2NDQKPiA+IC0tLSBhL3Rvb2xzL2xpYi9icGYvbGliYnBmLmMK
PiA+ICsrKyBiL3Rvb2xzL2xpYi9icGYvbGliYnBmLmMKPiA+IEBAIC04MjY3LDYgKzgyNjcsMzkg
QEAgc3RhdGljIGludCBicGZfb2JqZWN0X3ByZXBhcmVfc3RydWN0X29wcyhzdHJ1Y3QgYnBmX29i
amVjdCAqb2JqKQo+ID4gICAgICAgICByZXR1cm4gMDsKPiA+ICB9Cj4gPgo+ID4gK3ZvaWQgYnBm
X29iamVjdF9fZnJlZV9idGZzKHN0cnVjdCBicGZfb2JqZWN0ICpvYmopCj4gPiArewo+ID4gKyAg
ICAgICBpbnQgaTsKPiA+ICsKPiA+ICsgICAgICAgLyogY2xlYW4gdXAgbW9kdWxlIEJURnMgKi8K
PiA+ICsgICAgICAgZm9yIChpID0gMDsgaSA8IG9iai0+YnRmX21vZHVsZV9jbnQ7IGkrKykgewo+
ID4gKyAgICAgICAgICAgICAgIGNsb3NlKG9iai0+YnRmX21vZHVsZXNbaV0uZmQpOwo+ID4gKyAg
ICAgICAgICAgICAgIGJ0Zl9fZnJlZShvYmotPmJ0Zl9tb2R1bGVzW2ldLmJ0Zik7Cj4gPiArICAg
ICAgICAgICAgICAgZnJlZShvYmotPmJ0Zl9tb2R1bGVzW2ldLm5hbWUpOwo+ID4gKyAgICAgICB9
Cj4gPiArICAgICAgIGZyZWUob2JqLT5idGZfbW9kdWxlcyk7Cj4gPiArICAgICAgIG9iai0+YnRm
X21vZHVsZXMgPSBOVUxMOwo+ID4gKyAgICAgICBvYmotPmJ0Zl9tb2R1bGVfY250ID0gMDsKPiA+
ICsKPiA+ICsgICAgICAgLyogY2xlYW4gdXAgdm1saW51eCBCVEYgKi8KPiA+ICsgICAgICAgYnRm
X19mcmVlKG9iai0+YnRmX3ZtbGludXgpOwo+ID4gKyAgICAgICBvYmotPmJ0Zl92bWxpbnV4ID0g
TlVMTDsKPiA+ICt9Cj4gPiArCj4gPiArc3RhdGljIHZvaWQgYnBmX29iamVjdF9lYXJseV9mcmVl
X2J0ZihzdHJ1Y3QgYnBmX29iamVjdCAqb2JqKQo+ID4gK3sKPiA+ICsgICAgICAgc3RydWN0IGJw
Zl9wcm9ncmFtICpwcm9nOwo+ID4gKwo+ID4gKyAgICAgICBicGZfb2JqZWN0X19mb3JfZWFjaF9w
cm9ncmFtKHByb2csIG9iaikgewo+ID4gKyAgICAgICAgICAgICAgIGlmIChwcm9nLT5leHBlY3Rl
ZF9hdHRhY2hfdHlwZSA9PSBCUEZfVFJBQ0VfRkVOVFJZX01VTFRJIHx8Cj4gPiArICAgICAgICAg
ICAgICAgICAgIHByb2ctPmV4cGVjdGVkX2F0dGFjaF90eXBlID09IEJQRl9UUkFDRV9GRVhJVF9N
VUxUSSB8fAo+ID4gKyAgICAgICAgICAgICAgICAgICBwcm9nLT5leHBlY3RlZF9hdHRhY2hfdHlw
ZSA9PSBCUEZfTU9ESUZZX1JFVFVSTl9NVUxUSSkKPiA+ICsgICAgICAgICAgICAgICAgICAgICAg
IHJldHVybjsKPiA+ICsgICAgICAgfQo+ID4gKwo+ID4gKyAgICAgICBicGZfb2JqZWN0X19mcmVl
X2J0ZnMob2JqKTsKPiA+ICt9Cj4gPiArCj4gPiAgc3RhdGljIGludCBicGZfb2JqZWN0X2xvYWQo
c3RydWN0IGJwZl9vYmplY3QgKm9iaiwgaW50IGV4dHJhX2xvZ19sZXZlbCwgY29uc3QgY2hhciAq
dGFyZ2V0X2J0Zl9wYXRoKQo+ID4gIHsKPiA+ICAgICAgICAgaW50IGVyciwgaTsKPiA+IEBAIC04
MzA3LDE4ICs4MzQwLDcgQEAgc3RhdGljIGludCBicGZfb2JqZWN0X2xvYWQoc3RydWN0IGJwZl9v
YmplY3QgKm9iaiwgaW50IGV4dHJhX2xvZ19sZXZlbCwgY29uc3QgY2gKPiA+ICAgICAgICAgLyog
Y2xlYW4gdXAgZmRfYXJyYXkgKi8KPiA+ICAgICAgICAgemZyZWUoJm9iai0+ZmRfYXJyYXkpOwo+
ID4KPiA+IC0gICAgICAgLyogY2xlYW4gdXAgbW9kdWxlIEJURnMgKi8KPiA+IC0gICAgICAgZm9y
IChpID0gMDsgaSA8IG9iai0+YnRmX21vZHVsZV9jbnQ7IGkrKykgewo+ID4gLSAgICAgICAgICAg
ICAgIGNsb3NlKG9iai0+YnRmX21vZHVsZXNbaV0uZmQpOwo+ID4gLSAgICAgICAgICAgICAgIGJ0
Zl9fZnJlZShvYmotPmJ0Zl9tb2R1bGVzW2ldLmJ0Zik7Cj4gPiAtICAgICAgICAgICAgICAgZnJl
ZShvYmotPmJ0Zl9tb2R1bGVzW2ldLm5hbWUpOwo+ID4gLSAgICAgICB9Cj4gPiAtICAgICAgIGZy
ZWUob2JqLT5idGZfbW9kdWxlcyk7Cj4gPiAtCj4gPiAtICAgICAgIC8qIGNsZWFuIHVwIHZtbGlu
dXggQlRGICovCj4gPiAtICAgICAgIGJ0Zl9fZnJlZShvYmotPmJ0Zl92bWxpbnV4KTsKPiA+IC0g
ICAgICAgb2JqLT5idGZfdm1saW51eCA9IE5VTEw7Cj4gPiAtCj4gPiArICAgICAgIGJwZl9vYmpl
Y3RfZWFybHlfZnJlZV9idGYob2JqKTsKPiA+ICAgICAgICAgb2JqLT5sb2FkZWQgPSB0cnVlOyAv
KiBkb2Vzbid0IG1hdHRlciBpZiBzdWNjZXNzZnVsbHkgb3Igbm90ICovCj4gPgo+ID4gICAgICAg
ICBpZiAoZXJyKQo+ID4gQEAgLTg3OTEsNiArODgxMyw3IEBAIHZvaWQgYnBmX29iamVjdF9fY2xv
c2Uoc3RydWN0IGJwZl9vYmplY3QgKm9iaikKPiA+ICAgICAgICAgdXNkdF9tYW5hZ2VyX2ZyZWUo
b2JqLT51c2R0X21hbik7Cj4gPiAgICAgICAgIG9iai0+dXNkdF9tYW4gPSBOVUxMOwo+ID4KPiA+
ICsgICAgICAgYnBmX29iamVjdF9fZnJlZV9idGZzKG9iaik7Cj4gPiAgICAgICAgIGJwZl9nZW5f
X2ZyZWUob2JqLT5nZW5fbG9hZGVyKTsKPiA+ICAgICAgICAgYnBmX29iamVjdF9fZWxmX2Zpbmlz
aChvYmopOwo+ID4gICAgICAgICBicGZfb2JqZWN0X3VubG9hZChvYmopOwo+ID4gZGlmZiAtLWdp
dCBhL3Rvb2xzL2xpYi9icGYvbGliYnBmLmggYi90b29scy9saWIvYnBmL2xpYmJwZi5oCj4gPiBp
bmRleCA1NzIzY2JiZmNjNDEuLmM0MWE5MDllYTRjMSAxMDA2NDQKPiA+IC0tLSBhL3Rvb2xzL2xp
Yi9icGYvbGliYnBmLmgKPiA+ICsrKyBiL3Rvb2xzL2xpYi9icGYvbGliYnBmLmgKPiA+IEBAIC0y
OTksNiArMjk5LDggQEAgTElCQlBGX0FQSSBzdHJ1Y3QgYnBmX3Byb2dyYW0gKgo+ID4gIGJwZl9v
YmplY3RfX2ZpbmRfcHJvZ3JhbV9ieV9uYW1lKGNvbnN0IHN0cnVjdCBicGZfb2JqZWN0ICpvYmos
Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25zdCBjaGFyICpuYW1lKTsK
PiA+Cj4gPiArTElCQlBGX0FQSSB2b2lkIGJwZl9vYmplY3RfX2ZyZWVfYnRmcyhzdHJ1Y3QgYnBm
X29iamVjdCAqb2JqKTsKPiA+ICsKPgo+IEl0IHNob3VsZG4ndCBiZSBleHBvcnRlZC4KPiBsaWJi
cGYgc2hvdWxkIGNsZWFuIGl0IHVwIHdoZW4gYnBmX29iamVjdCBpcyBmcmVlZC4KClllcywgbGli
YnBmIHdpbGwgY2xlYW4gdXAgdGhlIGJ0ZnMgd2hlbiBicGZfb2JqZWN0IGlzIGZyZWVkIGluCnRo
aXMgY29tbWl0LiBBbmQgSSdtIHRyeWluZyB0byBvZmZlciBhIHdheSB0byBlYXJseSBmcmVlIHRo
ZSBidGZzCmJ5IHRoZSB1c2VycyBtYW51YWwgdG8gcmVkdWNlIHRoZSBtZW1vcnkgdXNhZ2UuIE9y
LCB0aGUKYnRmcyB0aGF0IHdlIG9wZW5lZCB3aWxsIGtlZXAgZXhpc3RpbmcgdW50aWwgd2UgY2xv
c2UgdGhlCmJwZl9vYmplY3QuCgpUaGlzIGlzIG9wdGlvbmFsLCBJIGNhbiByZW1vdmUgaXQgaWYg
eW91IHByZWZlci4KClRoYW5rcyEKTWVuZ2xvbmcgRG9uZwpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgt
c3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4u
c3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
