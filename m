Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 672F0878C6E
	for <lists+linux-stm32@lfdr.de>; Tue, 12 Mar 2024 02:44:08 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1A5D9C6DD9D;
	Tue, 12 Mar 2024 01:44:08 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0C24EC6DD73
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Mar 2024 01:44:06 +0000 (UTC)
Received: by mail-pj1-f41.google.com with SMTP id
 98e67ed59e1d1-29bf998872fso1055720a91.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Mar 2024 18:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1710207845; x=1710812645;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=labtf93chunomZqW/vUnTTFsyT2Ay36RYxUH/Np39t8=;
 b=Vnzm0uwvvG4e2nWOhQHUAhJs+tT7wqSqPLioKVwUHX7HjNCCx0lD5l9g2KqYMZV0cu
 vqJK2l4Hh21/pt9DPOL9o1gxgW0gLIShHedIGOjNZo3sGjQy98Rg7EbbKlxLg/eQjJ4T
 lEoevae/Y30bLUNwt8LxDbtQBVw+3JSB0Q87EdosPnwuMyOIBbMrezLsUTrsIeNrcEwA
 sfNotiVuw9p7Msxyhub5zzLzXJGYujcw4l0RVQaMcHbmeAVgM3VaGiQm2X8DK2CTE4L6
 VoTW1xSFGD6DbRNAVHvoReeGtUbJELApIm5dJtvGhRe2TN9B5DHfN45ad1RxJ9tq2zXp
 w0Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710207845; x=1710812645;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=labtf93chunomZqW/vUnTTFsyT2Ay36RYxUH/Np39t8=;
 b=PdWpXO/Y0c4x6gelVp136EvJGMlWZzJVJ6lKk9RM5CyOjMjssq8RNvR0tl+yVofsS1
 esbzuT5eauDx8DR3OLoq6ak6UAwhZV04ToPz0J9YI/nnefKKm8hRgTNXlBIe96gF/+uu
 Rx/BOTu0OZujPElSGHrz9Onxr0Oi9Nrxxw/UVC+8eZomX9hrhSCCJUy1eLDtHlIcbFE/
 JeDs4ZCwMTgEb7MZeRoXWCbYocjFcscqrERG2D7WESBk+skWJCFj5eQgFlMC1Ny6CRbz
 czHzIwv2aWQ2/pMnyLzEbaIk0uC7B2tiGaCOqR80a+FjJcqqzVHcMO2C+34e8ltj+Am/
 4EFA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXCtI85VyNjoIfLhrIsdCIY6SnYqPSuQvHcgiPDSYAcKSq3svRkaouL8WkEX37upMPpFZhAtTZ3KenCU5FWv0A6vPk2vj3XMM3DULmhCdXbxqeHOMD5P2wh
X-Gm-Message-State: AOJu0Yx71UueTlMfSP6261p3ELyzydbQpcNyWJ2bEKxi/BsewkEEpCb0
 EgY+icNoouSFsD4vPtYvkrOgcPJ00c0l10aSC8RbmOEPbWvWky3AGPCttFr+fLChAEjKm4u81kV
 yR63l5gGr3QkW8H7CGSTGockToSV8+46tPd61IQ==
X-Google-Smtp-Source: AGHT+IErV3iMJSVZsOorpKVzsGY2UytkCGuC6pmqJE2LbhhD8namNE+eDxsMMlkkIxKkEYQlxwMbWYmXWufoMcMT79A=
X-Received: by 2002:a17:90a:8991:b0:29b:aee2:cc8f with SMTP id
 v17-20020a17090a899100b0029baee2cc8fmr6097802pjn.9.1710207845560; Mon, 11 Mar
 2024 18:44:05 -0700 (PDT)
MIME-Version: 1.0
References: <20240311093526.1010158-1-dongmenglong.8@bytedance.com>
 <20240311093526.1010158-9-dongmenglong.8@bytedance.com>
 <e8f37842-1ddf-4241-97f3-b83ffcb32ddc@isovalent.com>
In-Reply-To: <e8f37842-1ddf-4241-97f3-b83ffcb32ddc@isovalent.com>
From: =?UTF-8?B?5qKm6b6Z6JGj?= <dongmenglong.8@bytedance.com>
Date: Tue, 12 Mar 2024 09:43:54 +0800
Message-ID: <CALz3k9hDuUgT0bQWXRKVogJ9=UF0_zWu6dAJVYE380BHBy85JA@mail.gmail.com>
To: Quentin Monnet <quentin@isovalent.com>
Cc: linux-kselftest@vger.kernel.org, dave.hansen@linux.intel.com,
 ast@kernel.org, song@kernel.org, sdf@google.com, yonghong.song@linux.dev,
 agordeev@linux.ibm.com, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, daniel@iogearbox.net, x86@kernel.org,
 john.fastabend@gmail.com, andrii@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, borntraeger@linux.ibm.com,
 linux-trace-kernel@vger.kernel.org, rostedt@goodmis.org, kpsingh@kernel.org,
 mathieu.desnoyers@efficios.com, linux-arm-kernel@lists.infradead.org,
 haoluo@google.com, netdev@vger.kernel.org, dsahern@kernel.org,
 linux-kernel@vger.kernel.org, eddyz87@gmail.com, svens@linux.ibm.com,
 jolsa@kernel.org, bpf@vger.kernel.org, martin.lau@linux.dev,
 davem@davemloft.net
Subject: Re: [Linux-stm32] [External] Re: [PATCH bpf-next v2 8/9] libbpf:
 add support for the multi-link of tracing
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

T24gTW9uLCBNYXIgMTEsIDIwMjQgYXQgMTE6MjnigK9QTSBRdWVudGluIE1vbm5ldCA8cXVlbnRp
bkBpc292YWxlbnQuY29tPiB3cm90ZToKPgo+IDIwMjQtMDMtMTEgMDk6MzUgVVRDKzAwMDAgfiBN
ZW5nbG9uZyBEb25nIDxkb25nbWVuZ2xvbmcuOEBieXRlZGFuY2UuY29tPgo+ID4gQWRkIHN1cHBv
cnQgZm9yIHRoZSBhdHRhY2ggdHlwZXMgb2Y6Cj4gPgo+ID4gQlBGX1RSQUNFX0ZFTlRSWV9NVUxU
SQo+ID4gQlBGX1RSQUNFX0ZFWElUX01VTFRJCj4gPiBCUEZfTU9ESUZZX1JFVFVSTl9NVUxUSQo+
ID4KPiA+IFNpZ25lZC1vZmYtYnk6IE1lbmdsb25nIERvbmcgPGRvbmdtZW5nbG9uZy44QGJ5dGVk
YW5jZS5jb20+Cj4gPiAtLS0KPiA+ICB0b29scy9icGYvYnBmdG9vbC9jb21tb24uYyB8ICAgMyAr
Cj4gPiAgdG9vbHMvbGliL2JwZi9icGYuYyAgICAgICAgfCAgMTAgKysrCj4gPiAgdG9vbHMvbGli
L2JwZi9icGYuaCAgICAgICAgfCAgIDYgKysKPiA+ICB0b29scy9saWIvYnBmL2xpYmJwZi5jICAg
ICB8IDE2OCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystCj4gPiAgdG9vbHMv
bGliL2JwZi9saWJicGYuaCAgICAgfCAgMTQgKysrKwo+ID4gIHRvb2xzL2xpYi9icGYvbGliYnBm
Lm1hcCAgIHwgICAxICsKPiA+ICA2IGZpbGVzIGNoYW5nZWQsIDE5OSBpbnNlcnRpb25zKCspLCAz
IGRlbGV0aW9ucygtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS90b29scy9icGYvYnBmdG9vbC9jb21t
b24uYyBiL3Rvb2xzL2JwZi9icGZ0b29sL2NvbW1vbi5jCj4gPiBpbmRleCBjYzZlNmFhZTI0NDcu
LmZmYzg1MjU2NjcxZCAxMDA2NDQKPiA+IC0tLSBhL3Rvb2xzL2JwZi9icGZ0b29sL2NvbW1vbi5j
Cj4gPiArKysgYi90b29scy9icGYvYnBmdG9vbC9jb21tb24uYwo+ID4gQEAgLTEwODksNiArMTA4
OSw5IEBAIGNvbnN0IGNoYXIgKmJwZl9hdHRhY2hfdHlwZV9pbnB1dF9zdHIoZW51bSBicGZfYXR0
YWNoX3R5cGUgdCkKPiA+ICAgICAgIGNhc2UgQlBGX1RSQUNFX0ZFTlRSWTogICAgICAgICAgICAg
ICAgICByZXR1cm4gImZlbnRyeSI7Cj4gPiAgICAgICBjYXNlIEJQRl9UUkFDRV9GRVhJVDogICAg
ICAgICAgICAgICAgICAgcmV0dXJuICJmZXhpdCI7Cj4gPiAgICAgICBjYXNlIEJQRl9NT0RJRllf
UkVUVVJOOiAgICAgICAgICAgICAgICAgcmV0dXJuICJtb2RfcmV0IjsKPiA+ICsgICAgIGNhc2Ug
QlBGX1RSQUNFX0ZFTlRSWV9NVUxUSTogICAgICAgICAgICByZXR1cm4gImZlbnRyeV9tdWx0aSI7
Cj4gPiArICAgICBjYXNlIEJQRl9UUkFDRV9GRVhJVF9NVUxUSTogICAgICAgICAgICAgcmV0dXJu
ICJmZXhpdF9tdWx0aSI7Cj4gPiArICAgICBjYXNlIEJQRl9NT0RJRllfUkVUVVJOX01VTFRJOiAg
ICAgICAgICAgcmV0dXJuICJtb2RfcmV0X211bHRpIjsKPiA+ICAgICAgIGNhc2UgQlBGX1NLX1JF
VVNFUE9SVF9TRUxFQ1Q6ICAgICAgICAgICByZXR1cm4gInNrX3NrYl9yZXVzZXBvcnRfc2VsZWN0
IjsKPiA+ICAgICAgIGNhc2UgQlBGX1NLX1JFVVNFUE9SVF9TRUxFQ1RfT1JfTUlHUkFURTogICAg
ICAgIHJldHVybiAic2tfc2tiX3JldXNlcG9ydF9zZWxlY3Rfb3JfbWlncmF0ZSI7Cj4gPiAgICAg
ICBkZWZhdWx0OiAgICAgICAgcmV0dXJuIGxpYmJwZl9icGZfYXR0YWNoX3R5cGVfc3RyKHQpOwo+
Cj4gSGksIHBsZWFzZSBkcm9wIHRoaXMgcGFydCBpbiBicGZ0b29sLgo+Cj4gYnBmX2F0dGFjaF90
eXBlX2lucHV0X3N0cigpIGlzIHVzZWQgZm9yIGxlZ2FjeSBhdHRhY2ggdHlwZSBuYW1lcyB0aGF0
Cj4gd2VyZSB1c2VkIGJlZm9yZSBicGZ0b29sIHN3aXRjaGVkIHRvIGxpYmJwZl9icGZfYXR0YWNo
X3R5cGVfc3RyKCksIGFuZAo+IHRoYXQgYXJlIHN0aWxsIHN1cHBvcnRlZCB0b2RheS4gVGhlIG5h
bWVzIGZvciBuZXcgYXR0YWNoIHR5cGVzIHNob3VsZAo+IGp1c3QgYmUgcmV0cmlldmVkIHdpdGgg
bGliYnBmX2JwZl9hdHRhY2hfdHlwZV9zdHIoKS4gQW5kIGZ1bmN0aW9uCj4gYnBmX2F0dGFjaF90
eXBlX2lucHV0X3N0cigpIGlzIGFsc28gb25seSB1c2VkIGZvciBhdHRhY2hpbmcKPiBjZ3JvdXAt
cmVsYXRlZCBwcm9ncmFtcyB3aXRoICJicGZ0b29sIGNncm91cCAoYXR8ZGUpdGFjaCIuCgpPa2F5
ISBJIHdhcyBjb25mdXNlZCBhYm91dCB0aGlzIGZ1bmN0aW9uLCB3aGljaCBoYXMgcmVkdXBsaWNh
dGVkCmluZm9ybWF0aW9uIGFib3V0IHRoZSBhdHRhY2ggdHlwZSBuYW1lLCBhbmQgSSB1bmRlcnN0
YW5kIGl0IG5vdy4KClRoYW5rcyEKTWVuZ2xvbmcgRG9uZwoKPgo+IFRoYW5rcywKPiBRdWVudGlu
Cj4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgt
c3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5j
b20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8v
bGludXgtc3RtMzIK
