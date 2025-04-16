Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D931DA90DC6
	for <lists+linux-stm32@lfdr.de>; Wed, 16 Apr 2025 23:24:38 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6932CC78F94;
	Wed, 16 Apr 2025 21:24:38 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7AF70C78F8C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Apr 2025 21:24:37 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id
 d2e1a72fcca58-736c1138ae5so40896b3a.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Apr 2025 14:24:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744838676; x=1745443476;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4jVAyA2MpizhxtQwsOdID7gg2xhGq08cVN7SZQ9jXqk=;
 b=h7fO8PmRFfzH8kxX6cZ8ceAjpF7hUPJbV3CPSIttkRV5t6at1l+3K9KqwCqeT8XHoU
 hgZC/BWOg8tiFsHFhdz/aHAvaAhLmddOOyOAFVMrFJh02XeavflC58O1+T8rRR9H0FH0
 yCiP6JsspHBLFiOqLN5UmQc/6SC9CM1KpQNJ0EEZSeI3yv1nZayeBrawzRbbu5rJLPS4
 yW6aYjksklose+3Wo89cbmxVDgtIjvYW2sJmqPy/YC0jsYbNCXF9hP7IPLLEd8v2pwT+
 5bqcpWs+P7eWFzTsL5QECBoRh5l1KkO7goU9bPQhSzhy+P57svcjdf9SLPdZti3Knx3E
 th2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744838676; x=1745443476;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4jVAyA2MpizhxtQwsOdID7gg2xhGq08cVN7SZQ9jXqk=;
 b=WIEQkN0XnTjoi0qvTo8nLuIoaIsgVGUb0BdKZNmRGOWGo9gmT0XnTwxSsfAN4UL/bw
 jaq5Cp5xOiqE1SaIKrAK9WmjKm8/EHri7y/wtiPdjalgWYM9IKMc9MuHIXnUH7N4nii1
 hU8Pe3jMol7FMxVuXp1xdTfim1JBCmvvvSkbhroOtYnEtk01AUygkGEaiw8/TPxr4OSa
 2D+RH3vei5aURMWU8E02exWRdRD2XBIJ2HEAj439MsopQFFLsDERJoAfsqFbht/X68mm
 6ROfCV7HAli93u4+B3g3W9+KSF5ujH8ZasUGGQhv5EMFZbbn49c1sgyv9gX4dq6Xwk5O
 p+Tg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX8O91RpsGwyFoGXdHftWDGy8oJadwRdEnkqy2JA9YIKN61gDARMKWtJQM+/1IBRXR9aiulpdkD5VKYzw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxugVlTxVw0WqgjOc3JAxk72tq/bX6Yb8MMy3+PC71KBMBATfnP
 f48osnoRejeAN5QeFpXE8T1glh93Cwl/hqZgeqgoCqogRKQwaT99hByH72O2vE5Lmmto0TO4+2m
 uyhEqpPSSl0UGvCvpe/q/Oi3CWNw=
X-Gm-Gg: ASbGncutdExEVpyV6NJ6DikNxLOn0wyDcS+ZntVs7PO1JVdXM7Mfl5HJ4yJB6Wayzyx
 7/oHQnDozlxYCj6+p/YLC4zG57RYBJYqymd+jgrMmpF8tsYD1HYNvvtPfMtwBSnqlXwMsVb4m7N
 lHyJOT0dM2rxtivvhrlw7msVXJm7KranybElwR9g==
X-Google-Smtp-Source: AGHT+IGP0KP8Iix57A7pNCwQp1k9B+JFkxfWiQwRVI0u7EuoGlinHX/1dVpIRADFn6P7r1WHtj3Ss+TZRQvR2I4Bbg8=
X-Received: by 2002:a05:6a00:aa8d:b0:736:a973:748 with SMTP id
 d2e1a72fcca58-73c267f8ba4mr4955120b3a.22.1744838675753; Wed, 16 Apr 2025
 14:24:35 -0700 (PDT)
MIME-Version: 1.0
References: <20250411-many_args_arm64-v1-0-0a32fe72339e@bootlin.com>
 <20250411-many_args_arm64-v1-1-0a32fe72339e@bootlin.com>
In-Reply-To: <20250411-many_args_arm64-v1-1-0a32fe72339e@bootlin.com>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Wed, 16 Apr 2025 14:24:23 -0700
X-Gm-Features: ATxdqUE6pVn0ZTMRWW3NJojzYizvIX7ZuQkUbJrKxsRI8DDdQqgnpzQYLgypGws
Message-ID: <CAEf4Bzbn6BdXTOb0dTcsQmOMZpp5=DzGS2hHHQ3+dwcja=gv+w@mail.gmail.com>
To: =?UTF-8?Q?Alexis_Lothor=C3=A9_=28eBPF_Foundation=29?=
 <alexis.lothore@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>, Shuah Khan <shuah@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, Mykola Lysenko <mykolal@fb.com>,
 Daniel Borkmann <daniel@iogearbox.net>, Will Deacon <will@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>, Andrii Nakryiko <andrii@kernel.org>,
 Stanislav Fomichev <sdf@fomichev.me>,
 Bastien Curutchet <bastien.curutchet@bootlin.com>,
 Florent Revest <revest@chromium.org>, Puranjay Mohan <puranjay@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, ebpf@linuxfoundation.org,
 Xu Kuohai <xukuohai@huaweicloud.com>, Alexei Starovoitov <ast@kernel.org>,
 KP Singh <kpsingh@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Hao Luo <haoluo@google.com>, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, Eduard Zingerman <eddyz87@gmail.com>,
 Jiri Olsa <jolsa@kernel.org>, bpf@vger.kernel.org,
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

T24gRnJpLCBBcHIgMTEsIDIwMjUgYXQgMTozMuKAr1BNIEFsZXhpcyBMb3Rob3LDqSAoZUJQRiBG
b3VuZGF0aW9uKQo8YWxleGlzLmxvdGhvcmVAYm9vdGxpbi5jb20+IHdyb3RlOgo+Cj4gSW4gb3Jk
ZXIgdG8gcHJvcGVybHkgSklUIHRoZSB0cmFtcG9saW5lcyBuZWVkZWQgdG8gYXR0YWNoIEJQRiBw
cm9ncmFtcwo+IHRvIGZ1bmN0aW9ucywgc29tZSBhcmNoaXRlY3R1cmVzIGxpa2UgQVJNNjQgbmVl
ZCB0byBrbm93IGFib3V0IHRoZQo+IGFsaWdubWVudCBuZWVkZWQgZm9yIHRoZSBmdW5jdGlvbiBh
cmd1bWVudHMuIFN1Y2ggYWxpZ25tZW50IGNhbgo+IGdlbmVyYWxseSBiZSBkZWR1Y2VkIGZyb20g
dGhlIGFyZ3VtZW50IHNpemUsIGJ1dCB0aGF0J3Mgbm90IGNvbXBsZXRlbHkKPiB0cnVlIGZvciBj
b21wb3NpdGUgdHlwZXMuIEluIHRoZSBzcGVjaWZpYyBjYXNlIG9mIEFSTTY0LCB0aGUgQUFQQ1M2
NCBBQkkKPiBkZWZpbmVzIHRoYXQgYSBjb21wb3NpdGUgdHlwZSB3aGljaCBuZWVkcyB0byBiZSBw
YXNzZWQgdGhyb3VnaCBzdGFjawo+IG11c3QgYmUgYWxpZ25lZCBvbiB0aGUgbWF4aW11bSBiZXR3
ZWVuIDggYW5kIHRoZSBsYXJnZXN0IGFsaWdubWVudAo+IGNvbnN0cmFpbnQgb2YgaXRzIGZpcnN0
LWxldmVsIG1lbWJlcnMuIFNvIHRoZSBKSVQgY29tcGlsZXIgbmVlZHMgbW9yZQo+IGluZm9ybWF0
aW9uIGFib3V0IHRoZSBhcmd1bWVudHMgdG8gbWFrZSBzdXJlIHRvIGdlbmVyYXRlIGNvZGUgdGhh
dAo+IHJlc3BlY3RzIHRob3NlIGFsaWdubWVudCBjb25zdHJhaW50cy4KPgo+IEZvciBzdHJ1Y3Qg
YXJndW1lbnRzLCBhZGQgaW5mb3JtYXRpb24gYWJvdXQgdGhlIHNpemUgb2YgdGhlIGxhcmdlc3QK
PiBmaXJzdC1sZXZlbCBtZW1iZXIgaW4gdGhlIHN0cnVjdCBidGZfZnVuY19tb2RlbCB0byBhbGxv
dyB0aGUgSklUCj4gY29tcGlsZXIgdG8gZ3Vlc3MgdGhlIG5lZWRlZCBhbGlnbm1lbnQuIFRoZSBp
bmZvcm1hdGlvbiBpcyBxdWl0ZQoKSSBtaWdodCBiZSBtaXNzaW5nIHNvbWV0aGluZywgYnV0IGhv
dyBjYW4gdGhlICpzaXplKiBvZiB0aGUgZmllbGQgYmUKdXNlZCB0byBjYWxjdWxhdGUgdGhhdCBh
cmd1bWVudCdzICphbGlnbm1lbnQqPyBpLmUuLCBJIGRvbid0CnVuZGVyc3RhbmQgd2h5IGFyZ19s
YXJnZXN0X21lbWJlcl9zaXplIG5lZWRzIHRvIGJlIGNhbGN1bGF0ZWQgaW5zdGVhZApvZiBhcmdf
bGFyZ2VzdF9tZW1iZXJfYWxpZ25tZW50Li4uCgo+IHNwZWNpZmljLCBidXQgaXQgYWxsb3dzIHRv
IGtlZXAgYXJjaC1zcGVjaWZpYyBjb25jZXJucyAoaWU6IGd1ZXNzaW5nIHRoZQo+IGZpbmFsIG5l
ZWRlZCBhbGlnbm1lbnQgZm9yIGFuIGFyZ3VtZW50KSBpc29sYXRlZCBpbiBlYWNoIEpJVCBjb21w
aWxlci4KCmNvdWxkbid0IGFsbCB0aGlzIGluZm9ybWF0aW9uIGJlIGNhbGN1bGF0ZWQgaW4gdGhl
IEpJVCBjb21waWxlciAoaWYKSklUIG5lZWRzIHRoYXQpIGZyb20gQlRGPwoKPgo+IFNpZ25lZC1v
ZmYtYnk6IEFsZXhpcyBMb3Rob3LDqSAoZUJQRiBGb3VuZGF0aW9uKSA8YWxleGlzLmxvdGhvcmVA
Ym9vdGxpbi5jb20+Cj4gLS0tCj4gIGluY2x1ZGUvbGludXgvYnBmLmggfCAgMSArCj4gIGtlcm5l
bC9icGYvYnRmLmMgICAgfCAyNSArKysrKysrKysrKysrKysrKysrKysrKysrCj4gIDIgZmlsZXMg
Y2hhbmdlZCwgMjYgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgv
YnBmLmggYi9pbmNsdWRlL2xpbnV4L2JwZi5oCj4gaW5kZXggM2YwY2M4OWMwNjIyY2IxYTA5Nzk5
OWFmYjc4YzE3MTAyNTkzYjZiYi4uOGIzNGRjZjYwYTBjZTA5MjI4ZmY3NjFiOTYyYWI2N2I2YTNl
MjI2MyAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL2xpbnV4L2JwZi5oCj4gKysrIGIvaW5jbHVkZS9s
aW51eC9icGYuaAo+IEBAIC0xMTA2LDYgKzExMDYsNyBAQCBzdHJ1Y3QgYnRmX2Z1bmNfbW9kZWwg
ewo+ICAgICAgICAgdTggbnJfYXJnczsKPiAgICAgICAgIHU4IGFyZ19zaXplW01BWF9CUEZfRlVO
Q19BUkdTXTsKPiAgICAgICAgIHU4IGFyZ19mbGFnc1tNQVhfQlBGX0ZVTkNfQVJHU107Cj4gKyAg
ICAgICB1OCBhcmdfbGFyZ2VzdF9tZW1iZXJfc2l6ZVtNQVhfQlBGX0ZVTkNfQVJHU107Cj4gIH07
Cj4KPiAgLyogUmVzdG9yZSBhcmd1bWVudHMgYmVmb3JlIHJldHVybmluZyBmcm9tIHRyYW1wb2xp
bmUgdG8gbGV0IG9yaWdpbmFsIGZ1bmN0aW9uCj4gZGlmZiAtLWdpdCBhL2tlcm5lbC9icGYvYnRm
LmMgYi9rZXJuZWwvYnBmL2J0Zi5jCj4gaW5kZXggMTZiYTM2ZjM0ZGZhYjc1MzFiYWJmNTc1M2Nh
YjlmMzY4Y2RkZWZhMy4uNWQ0MDkxMWVjOTAyMTAwODZhNjE3NWQ1NjlhYmI2ZTUyZDc1YWQxNyAx
MDA2NDQKPiAtLS0gYS9rZXJuZWwvYnBmL2J0Zi5jCj4gKysrIGIva2VybmVsL2JwZi9idGYuYwo+
IEBAIC03MzE4LDYgKzczMTgsMjkgQEAgc3RhdGljIGludCBfX2dldF90eXBlX3NpemUoc3RydWN0
IGJ0ZiAqYnRmLCB1MzIgYnRmX2lkLAo+ICAgICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4gIH0KPgo+
ICtzdGF0aWMgdTggX19nZXRfbGFyZ2VzdF9tZW1iZXJfc2l6ZShzdHJ1Y3QgYnRmICpidGYsIGNv
bnN0IHN0cnVjdCBidGZfdHlwZSAqdCkKPiArewo+ICsgICAgICAgY29uc3Qgc3RydWN0IGJ0Zl9t
ZW1iZXIgKm1lbWJlcjsKPiArICAgICAgIGNvbnN0IHN0cnVjdCBidGZfdHlwZSAqbXR5cGU7Cj4g
KyAgICAgICB1OCBsYXJnZXN0X21lbWJlcl9zaXplID0gMDsKPiArICAgICAgIGludCBpOwo+ICsK
PiArICAgICAgIGlmICghX19idGZfdHlwZV9pc19zdHJ1Y3QodCkpCj4gKyAgICAgICAgICAgICAg
IHJldHVybiBsYXJnZXN0X21lbWJlcl9zaXplOwo+ICsKPiArICAgICAgIGZvcl9lYWNoX21lbWJl
cihpLCB0LCBtZW1iZXIpIHsKPiArICAgICAgICAgICAgICAgbXR5cGUgPSBidGZfdHlwZV9ieV9p
ZChidGYsIG1lbWJlci0+dHlwZSk7Cj4gKyAgICAgICAgICAgICAgIHdoaWxlIChtdHlwZSAmJiBi
dGZfdHlwZV9pc19tb2RpZmllcihtdHlwZSkpCj4gKyAgICAgICAgICAgICAgICAgICAgICAgbXR5
cGUgPSBidGZfdHlwZV9ieV9pZChidGYsIG10eXBlLT50eXBlKTsKPiArICAgICAgICAgICAgICAg
aWYgKCFtdHlwZSkKPiArICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsKPiAr
ICAgICAgICAgICAgICAgaWYgKG10eXBlLT5zaXplID4gbGFyZ2VzdF9tZW1iZXJfc2l6ZSkKPiAr
ICAgICAgICAgICAgICAgICAgICAgICBsYXJnZXN0X21lbWJlcl9zaXplID0gbXR5cGUtPnNpemU7
Cj4gKyAgICAgICB9Cj4gKwo+ICsgICAgICAgcmV0dXJuIGxhcmdlc3RfbWVtYmVyX3NpemU7Cj4g
K30KPiArCj4gIHN0YXRpYyB1OCBfX2dldF90eXBlX2Ztb2RlbF9mbGFncyhjb25zdCBzdHJ1Y3Qg
YnRmX3R5cGUgKnQpCj4gIHsKPiAgICAgICAgIHU4IGZsYWdzID0gMDsKPiBAQCAtNzM5Niw2ICs3
NDE5LDggQEAgaW50IGJ0Zl9kaXN0aWxsX2Z1bmNfcHJvdG8oc3RydWN0IGJwZl92ZXJpZmllcl9s
b2cgKmxvZywKPiAgICAgICAgICAgICAgICAgfQo+ICAgICAgICAgICAgICAgICBtLT5hcmdfc2l6
ZVtpXSA9IHJldDsKPiAgICAgICAgICAgICAgICAgbS0+YXJnX2ZsYWdzW2ldID0gX19nZXRfdHlw
ZV9mbW9kZWxfZmxhZ3ModCk7Cj4gKyAgICAgICAgICAgICAgIG0tPmFyZ19sYXJnZXN0X21lbWJl
cl9zaXplW2ldID0KPiArICAgICAgICAgICAgICAgICAgICAgICBfX2dldF9sYXJnZXN0X21lbWJl
cl9zaXplKGJ0ZiwgdCk7Cj4gICAgICAgICB9Cj4gICAgICAgICBtLT5ucl9hcmdzID0gbmFyZ3M7
Cj4gICAgICAgICByZXR1cm4gMDsKPgo+IC0tCj4gMi40OS4wCj4KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0Ckxp
bnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWls
bWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
