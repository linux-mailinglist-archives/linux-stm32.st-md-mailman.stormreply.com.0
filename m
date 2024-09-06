Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E04DE96FBCD
	for <lists+linux-stm32@lfdr.de>; Fri,  6 Sep 2024 21:06:28 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8A69AC78013;
	Fri,  6 Sep 2024 19:06:28 +0000 (UTC)
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com
 [209.85.210.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B4F99C6DD9D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Sep 2024 19:06:21 +0000 (UTC)
Received: by mail-ot1-f41.google.com with SMTP id
 46e09a7af769-70f79f75da6so1515212a34.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 06 Sep 2024 12:06:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1725649580; x=1726254380;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=sRL0IOkPquaSmH/TxMcTrkn2lAb7RgDZ+KVgL/uKDo8=;
 b=UGwDJcuN8O74YnY/Uktjw3K06nMarLz1e7FYtjYnIEuIFcBy9X28wb/0FEDXheHirx
 JAl5W80I0xjuqCM2Ogay4G5Q/PetJ1a5dUDQyhqcYVRIhUYZYiod1Lvaer+ltzXkV9zl
 fPKOKxclaIEnHgkWATP6s4mFS/WzXdkuqnVMvg1PkG6zBXZ9wXjBoVIaKVlvYATokuyU
 nhaGYrm5qDirs/CjoJTBFrUPFbB7PGXdyRK8QI9QMaFr4K1YzXcMPpWk1f5I2B6TmISE
 NjHwVCnvTkpbvta3KJr8VM1BxlLi9CAdN1IgYjvbwHb52LC6UycewCCwjiIKXZ7XSiyB
 lu7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725649580; x=1726254380;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sRL0IOkPquaSmH/TxMcTrkn2lAb7RgDZ+KVgL/uKDo8=;
 b=CV1a8FvmzrV98VTK7kuUbYsJ59RAtTxlHy3Gmep8OQ8MtD/zOXoFIhMAw6+IhihyYs
 lT0PXiznEb50Y5VRuiHrbwvGunLbycNmtMNClVhimrpEMCZ8lD/p4U46f/aDKSCi6Qgp
 YSF7M7t3emkKz1ZQnDm4q/9w4sq13Y5TnGD+3fbPM2bW/TNMqn+IlYNec2ODQgxluELw
 f+yCedgiZXCO7ipsaOOdh6bJ1vI2CcQRv5A8Jfa3AnAeoMaiqt9cKVkKj3B/R0oOTI0q
 oRbPispVRS4K+iKGjq/uUKoekpWDOq3nLVb4NJIY2aDt3rCQqBeXAIemY8ClovkkK/Sr
 o7LA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWcvVxcKmFe3mJlxrll48VopZsDFVZrogKIG+ubEAJGA3mrzGFRGTc7SdXgbEXeKrjAxCoPSDGwkKMkYA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yx6pmh1ci0RZ9qwMsiAij8zmbBNVlZnCRZhRg5NoZkrHF0aMrvZ
 YMRTU+XlnAS9lJAx0pcZQibDfEZD8eekM6Vc4ZlZMac6PJSAVHasTnZHcfvBFDQ=
X-Google-Smtp-Source: AGHT+IFMNu7CkzsCPaFKzf0VUQEiZwLzm4UrG2v/Np24ZK9LDshdqsK0810LAPAwttIC/hC3aaCcKQ==
X-Received: by 2002:a05:6830:6404:b0:709:3b06:d578 with SMTP id
 46e09a7af769-710cc25c94amr4383633a34.26.1725649580418; 
 Fri, 06 Sep 2024 12:06:20 -0700 (PDT)
Received: from [192.168.0.142] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
 by smtp.gmail.com with ESMTPSA id
 46e09a7af769-70f671ca4a0sm3783279a34.79.2024.09.06.12.06.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Sep 2024 12:06:20 -0700 (PDT)
Message-ID: <6e4b7ef4-19c7-477c-b753-d4d59ed38e3a@baylibre.com>
Date: Fri, 6 Sep 2024 14:06:18 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 linux-pwm@vger.kernel.org
References: <cover.1725635013.git.u.kleine-koenig@baylibre.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <cover.1725635013.git.u.kleine-koenig@baylibre.com>
Cc: Trevor Gamblin <tgamblin@baylibre.com>, Kent Gibson <warthog618@gmail.com>,
 Michael Hennerich <michael.hennerich@analog.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-trace-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v4 0/7] pwm: New abstraction and userspace
	API
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

T24gOS82LzI0IDEwOjQyIEFNLCBVd2UgS2xlaW5lLUvDtm5pZyB3cm90ZToKPiBIZWxsbywKPiAK
PiBoZXJlIGNvbWVzIHY0IG9mIHRoZSBzZXJpZXMgdG8gYWRkIHN1cHBvcnQgZm9yIGR1dHkgb2Zm
c2V0IGluIFBXTQo+IHdhdmVmb3Jtcy4gRm9yIGEgc2luZ2xlIFBXTSBvdXRwdXQgdGhlcmUgaXMg
bm8gZ2FpbiwgYnV0IGlmIHlvdSBoYXZlIGEKPiBjaGlwIHdpdGggdHdvIChvciBtb3JlKSBvdXRw
dXRzIGFuZCBib3RoIG9wZXJhdGUgd2l0aCB0aGUgc2FtZSBwZXJpb2QsCj4geW91IGNhbiBnZW5l
cmF0ZSBhbiBvdXRwdXQgbGlrZToKPiAKPiAgICAgICAgICAgICAgICBfX19fX18gICAgICAgICBf
X19fX18gICAgICAgICBfX19fX18gICAgICAgICBfX19fX18KPiAgICBQV00gIzAgIF9fXy8gICAg
ICBcX19fX19fXy8gICAgICBcX19fX19fXy8gICAgICBcX19fX19fXy8gICAgICBcX19fX19fXwo+
ICAgICAgICAgICAgICAgICAgX18gICAgICAgICAgICAgX18gICAgICAgICAgICAgX18gICAgICAg
ICAgICAgX18KPiAgICBQV00gIzEgIF9fX19fLyAgXF9fX19fX19fX19fLyAgXF9fX19fX19fX19f
LyAgXF9fX19fX19fX19fLyAgXF9fX19fX19fXwo+ICAgICAgICAgICAgICAgXiAgICAgICAgICAg
ICAgXiAgICAgICAgICAgICAgXiAgICAgICAgICAgICAgXgo+IAoKV2hpbGUgd29ya2luZyBvbiBh
biBBREMgZHJpdmVyIHRoYXQgdXNlcyB0aGVzZSBuZXcgd2F2ZWZvcm0gQVBJcywgd2UgY2FtZQph
Y3Jvc3MgYSBjYXNlIHdoZXJlIHdlIHdhbnRlZCB3Zi0+ZHV0eV9vZmZzZXRfbnMgPj0gd2YtPnBl
cmlvZF9sZW5ndGhfbnMsCndoaWNoIGlzIGN1cnJlbnRseSBub3QgYWxsb3dlZC4gWzFdCgogICAg
ICAgICAgICAgICAgX19fX19fICAgICAgICAgX19fX19fICAgICAgICAgX19fX19fICAgICAgICAg
X19fX19fCiAgICBQV00gIzAgIF9fXy8gICAgICBcX19fX19fXy8gICAgICBcX19fX19fXy8gICAg
ICBcX19fX19fXy8gICAgICBcX19fX19fXwogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
X18gICAgICAgICAgICAgX18gICAgICAgICAgICAgX18KICAgIFBXTSAjMSAgX19fX19fX19fX19f
X19fX19fLyAgXF9fX19fX19fX19fLyAgXF9fX19fX19fX19fLyAgXF9fX19fX19fX19fCiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBeICAgICAgICAgICAgICBeICAgICAgICAgICAgICBeICAg
ICAgICAgICAgICAKCldlIHdvcmtlZCBhcm91bmQgaXQgYnkgc2V0dGluZzoKCgl3Zi0+ZHV0eV9v
ZmZzZXRfbnMgPSBERVNJUkVEX05TICUgd2YtPnBlcmlvZF9sZW5ndGhfbnMKCkhhdmluZyBQV00g
IzEgdHJpZ2dlciB0b28gZWFybHkganVzdCBjYXVzZXMgdGhlIGZpcnN0IHNhbXBsZSBkYXRhCnJl
YWQgdG8gYmUgaW52YWxpZCBkYXRhLgoKQnV0IGV2ZW4gaWYgd2UgYWxsb3dlZCB3Zi0+ZHV0eV9v
ZmZzZXRfbnMgPj0gd2YtPnBlcmlvZF9sZW5ndGhfbnMsCnRoaXMgb2Zmc2V0IHdvdWxkbid0IG1h
dHRlciBiZWNhdXNlIHRoZXJlIGN1cnJlbnRseSBpc24ndCBhIHdheSB0bwplbmFibGUgdHdvIFBX
TSBvdXRwdXRzIGF0IGV4YWN0bHkgdGhlIHNhbWUgdGltZS4KCkluIHRoZSBBREMgYXBwbGljYXRp
b24gd2Ugd29yayBhcm91bmQgYm90aCBvZiB0aGVzZSBzaG9ydGNvbWluZ3MgYnkgbm90CmVuYWJs
aW5nIHRoZSBETUEgdGhhdCBpcyB0cmlnZ2VyZWQgYnkgUFdNICMxIHVudGlsIGFmdGVyIGJvdGgg
UFdNcyBhcmUKZW5hYmxlZC4gSG93ZXZlciwgdGhlcmUgbWF5IGJlIHNpbWlsYXIgYXBwbGljYXRp
b25zIGluIHRoZSBmdXR1cmUgdGhhdAphbHNvIG5lZWQgc3VjaCBhbiBvZmZzZXQgYW5kIHN5bmNo
cm9uaXplZCBlbmFibGUgdGhhdCBtaWdodCBub3QgYmUgc28KZWFzeSB0byB3b3JrIGFyb3VuZCwg
c28gc29tZXRoaW5nIHRvIGtlZXAgaW4gbWluZC4KClsxXTogaHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvbGludXgtaWlvLzIwMjQwOTA0LWFkNzYyNV9yMS12NC0yLTc4YmM3ZGZiMmIzNUBiYXlsaWJy
ZS5jb20vCgoKPiAKPiAgLSBUaGUgZnVuY3Rpb25zIHB3bV9zZXRfd2F2ZWZvcm1fbWlnaHRfc2xl
ZXAoKSBhbmQKPiAgICBwd21fcm91bmRfd2F2ZWZvcm1fbWlnaHRfc2xlZXAoKSBoYXZlIGFuIHVu
dXN1YWwgcmV0dXJuIHZhbHVlCj4gICAgY29udmVudGlvbjogVGhleSByZXR1cm4gMCBvbiBzdWNj
ZXNzLCAxIGlmIHRoZSByZXF1ZXN0ZWQgd2F2ZWZvcm0KPiAgICBjYW5ub3QgYmUgaW1wbGVtZW50
ZWQgd2l0aG91dCBicmVha2luZyB0aGUgcm91bmRpbmcgcnVsZXMsIG9yIGEKPiAgICBuZWdhdGl2
ZSBlcnJubyBpZiBhbiBlcnJvciBvY2N1cnMuCj4gICAgRmFicmljZSByaWdodGZ1bGx5IHBvaW50
ZWQgb3V0IHRoaXMgdG8gYmUgc3VycHJpc2VkIGJ5IHRoaXMgYW5kCj4gICAgc3VnZ2VzdGVkIHRv
IHVzZSBhdCBsZWFzdCBhIGRlZmluZSBmb3IgaXQuCj4gCj4gICAgSSBjb3VsZG4ndCBmaW5kIGEg
ZGVjaXNpb24gdGhhdCBJJ20gZW50aXJlbHkgaGFwcHkgd2l0aCBoZXJlLiBNeQo+ICAgIGNvbmZs
aWN0cyBhcmU6Cj4gCj4gICAgIC0gSSB3YW50IGEgY29uc3RhbnQgdGhhdCBub3cgYW5kIGluIHRo
ZSBmdXR1cmUgb25seSBtZWFucyAiY2Fubm90IGJlCj4gICAgICAgZG9uZSBkdWUgdG8gdGhlIHJv
dW5kaW5nIHJ1bGVzIGluIHRoZSBwd20gZnJhbWV3b3JrIi4gU28gdGhlCj4gICAgICAgb3B0aW9u
cyBhcmU6Cj4gICAgICAgICAqIEludHJvZHVjZSBhIG5ldyBFU09NRVRISU5HIGFuZCByZXR1cm4g
LUVTT01FVEhJTkcKPiAgICAgICAgICAgSSB0aGluayB0aGF0J3MgaGFyZCB0byBtb3RpdmF0ZSBh
bmQgYWxzbyBteXNlbGYgZG91YnQgdGhpcwo+ICAgICAgICAgICB3b3VsZCBiZSBzZW5zaWJsZS4g
QXMgYmVsb3csIHRoZSBxdWVzdGlvbiBmb3IgYSBnb29kIG5hbWUgaXMKPiAgICAgICAgICAgdW5y
ZXNvbHZlZC4KPiAgICAgICAgICogcmV0dXJuIDEKPiAgICAgICAgICAgVGhpcyBpcyB3aGF0IHdh
cyBkb25lIGluIHRoZSBlYXJsaWVyIHJldmlzaW9ucyBhbmQgYWxzbyBoZXJlLgo+IAo+ICAgICAt
IFdoZW4ga2VlcGluZyB0aGUgcmV0dXJuIDEgc2VtYW50aWNzIChhbmQgYWxzbyBmb3IgYSBuZXcK
PiAgICAgICBFU09NRVRISU5HKToKPiAgICAgICBJIGFncmVlIHRoYXQgYSBuYW1lIGluc3RlYWQg
b2YgYSBwbGFpbiAxIHdvdWxkIGJlIG5pY2UsIGJ1dCBJCj4gICAgICAgY291bGRuJ3QgY29tZSB1
cCB3aXRoIGEgbmFtZSBJIGxpa2VkLiBHaXZlbiB0aGF0IHRoaXMgY2FuIGJlCj4gICAgICAgaW50
cm9kdWNlZCBsYXRlciB3aXRob3V0IGJyZWFraW5nIGFueXRoaW5nLCBJIGRvbid0IGNvbnNpZGVy
IHRoYXQKPiAgICAgICB2ZXJ5IHVyZ2VudC4KPiAgICAgICBNeSBjYW5kaWRhdGVzIHdlcmUgUFdN
X1JFUVVJUkVTX0JST0tFTl9ST1VORElORywKPiAgICAgICBQV01fUkVRVUlSRVNfRk9SQklEREVO
X1JPVU5ESU5HIGFuZCBQV01fRVJSX1JPVU5ESU5HLgo+ICAgICAgIFRoZXNlIGFyZSB0b28gbG9u
ZyBvci9hbmQgaW1wcmVjaXNlLgo+ICAgICAgIElmIHlvdSBoYXZlIGEgZ29vZCBpZGVhLCBwbGVh
c2UgdGVsbC4KClRvIGF2b2lkIHVzaW5nIHRoZSByZXR1cm4gdmFsdWUgZm9yIHN0YXR1cyBmbGFn
cywgd2UgY291bGQgaW50cm9kdWNlCmFuIG9wdGlvbmFsIG91dHB1dCBwYXJhbWV0ZXIuIENvbnN1
bWVycyB3aGVyZSBiZXN0IGVmZm9ydCBpcyBnb29kCmVub3VnaCBjYW4ganVzdCBwYXNzIE5VTEwg
YW5kIGNvbnN1bWVycyB0aGF0IGNhcmUgY2FuIHBhc3MgYW4gdW5zaWduZWQKaW50IHRvIHJlY2Vp
dmUgdGhlIHN0YXR1cyBmbGFnLiBUaGlzIGNvdWxkIGV2ZW4gYmUgYSBiaXRtYXAgb2YgbXVsdGlw
bGUKZmxhZ3MgaWYgaXQgd291bGQgYmUgdXNlZnVsIHRvIGtub3cgd2hpY2ggcnVsZShzKSBjb3Vs
ZCBub3QgYmUgbWV0LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4u
c3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxt
YW4vbGlzdGluZm8vbGludXgtc3RtMzIK
