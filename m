Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 97A05A9EB5A
	for <lists+linux-stm32@lfdr.de>; Mon, 28 Apr 2025 11:01:46 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5C888C78F67;
	Mon, 28 Apr 2025 09:01:46 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
 [209.85.210.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9490FC6C83D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Apr 2025 07:11:50 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id
 d2e1a72fcca58-73972a54919so3596110b3a.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Apr 2025 00:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745824309; x=1746429109;
 darn=st-md-mailman.stormreply.com; 
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=l6yiAhzWXQxqLcRN0o6sEZQ4X3Bi1Cf4V4RVWpgjdWI=;
 b=P+UITTkvR7rDGJOh/hupiLp8TgE4yOCoNz+EyTo6yhxICTaHjZsAfkbUIYPP0tbfJG
 8+VTxa88Qx5IrO9kKgZB5ubFll1KJp+he3Eb+Y7gZmFP9D2Vl5aak6VdG2mlQsAqwF7/
 gXCtcginOO1UH+Zmz7EI3FPMJ4JEW4DPkmrFtmW24OAZcBc0atKickzjP25g6F4heGEB
 HNh/BIyRdVTtxbSReTd8qr2eNowv1RZ8XUtliroqdM/WkuV9l7AMsnvt1G1IMvZ4kyVV
 IOiYUU5l55CSZ6/DNcXCG+L5rhLhmKrJRTkjJjiHqtioUPmZw0cqpKzNklwMgjrth2is
 +dNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745824309; x=1746429109;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=l6yiAhzWXQxqLcRN0o6sEZQ4X3Bi1Cf4V4RVWpgjdWI=;
 b=HhAONw9AhgHDAysh9CAjqndRB4r442i/DrN3RPlxhoB50WEVEarzoBRrKdud4fh3iu
 rDYgnOQ2BD33uToztahBAmX08Thec8Lam9C139VDOkeDig336JMGog5Esuza5yiAr/Fz
 ooVX8ZMi2eZx39umLXQYNHTPWVuSYuxRQunUthqWlvXcXpukh7+1X/J6MZgH7XH3FVD2
 2AB/Ux5bhIVklIn8qaPeD9uwbwbyfry9RJjQekLOsyiafZ6ZcumTiY9rrTxWbYnKCbwl
 acwGbB6FXEd5A+O5Jxgu2eMUI4CSOvH8fEOuusW412QYKQHs6Gf4Ooq6uStFtBZLb0A0
 zZLw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWQXiYTrPPIp8vJGuH0bkdVxIR8oCcYhAqsrB7KINOb6/YHMzqUW9bCokdPIQP1/2MYJCFuYh5nin4hDA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yxb/P+mcxbYtdxyxbIR/sx1Utnle54J9/PMD21Z2YumFs1c7rEB
 VBCMDB5le3UF5o+sRNFdsdC4lwybkol4SSyKw5bly7QQlMCXsKnP
X-Gm-Gg: ASbGncuYiWGUITe4wgjpSF0bI2XiBSdgsWofHkjMqXSRJHbbuW1ii2+7Q75tby5PnLc
 ZbGF9u6LUFbZdx5nAuG7G3aOh2u3qa6HIrpHNybfwDvUGwh0JpZ4EeuTpS15fknwxRVfO7ZcApX
 g4w9FKwZ11xRz2Lf6TS99N2PRSf8DPSx+MrvJJfKrAtvj1oh5g/iLuN9aOFXNx7lJwNJy2L7eQK
 zPh9NATn++/f1eHi8OtLsLpcOfYK9NIjPfn0xksSsfiH0+XeYmHHXgew5w7e2QOM/WH0el/3PgZ
 7/DGBFHPqXjgVuBBG5E3VNNfZ6bUO3pPTHEKYHxk7A0Zx+0=
X-Google-Smtp-Source: AGHT+IFfNNR7f+llhGYk1fVhTaVcaX++3ZaR5o1FbRtfz6NVhQBo0HYMUzJEO16Gkwc19jokDXS9gA==
X-Received: by 2002:a05:6a00:3e2a:b0:736:34a2:8a23 with SMTP id
 d2e1a72fcca58-73fd896a139mr12813705b3a.15.1745824309053; 
 Mon, 28 Apr 2025 00:11:49 -0700 (PDT)
Received: from [192.168.0.56] ([38.34.87.7]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73e25a6a8b7sm7495651b3a.104.2025.04.28.00.11.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Apr 2025 00:11:48 -0700 (PDT)
Message-ID: <b6878f60a62c4c6b4b7daa2272a18280e8fc362b.camel@gmail.com>
From: Eduard Zingerman <eddyz87@gmail.com>
To: Xu Kuohai <xukuohai@huaweicloud.com>, Alexis =?ISO-8859-1?Q?Lothor=E9?=
 <alexis.lothore@bootlin.com>, Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Mon, 28 Apr 2025 00:11:46 -0700
In-Reply-To: <2f13f928-9148-44e0-a44c-872a3779b0ef@huaweicloud.com>
References: <20250411-many_args_arm64-v1-0-0a32fe72339e@bootlin.com>
 <20250411-many_args_arm64-v1-1-0a32fe72339e@bootlin.com>
 <CAEf4Bzbn6BdXTOb0dTcsQmOMZpp5=DzGS2hHHQ3+dwcja=gv+w@mail.gmail.com>
 <D98Q8BRNUVS9.11J60C67L1ALR@bootlin.com>
 <CAEf4BzZHMYyGDZ4c4eNXG7Fm=ecxCCbKhKbQTbCjvWmKtdwvBw@mail.gmail.com>
 <D9E9IQQ3QKXM.3UJ17G9CBS1FH@bootlin.com>
 <6b6472c3-0718-4e60-9972-c166d51962a3@huaweicloud.com>
 <D9EWSDXHDGFJ.FIDSHIR1OP80@bootlin.com>
 <2f13f928-9148-44e0-a44c-872a3779b0ef@huaweicloud.com>
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 28 Apr 2025 09:01:44 +0000
Cc: Yonghong Song <yonghong.song@linux.dev>,
 Catalin Marinas <catalin.marinas@arm.com>, Song Liu <song@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Shuah Khan <shuah@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, Mykola Lysenko <mykolal@fb.com>,
 Daniel Borkmann <daniel@iogearbox.net>, Will Deacon <will@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>, Andrii Nakryiko <andrii@kernel.org>,
 Stanislav Fomichev <sdf@fomichev.me>,
 Bastien Curutchet <bastien.curutchet@bootlin.com>,
 Florent Revest <revest@chromium.org>, Puranjay Mohan <puranjay@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, ebpf@linuxfoundation.org,
 Alexei Starovoitov <ast@kernel.org>, KP Singh <kpsingh@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Hao Luo <haoluo@google.com>,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
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

T24gRnJpLCAyMDI1LTA0LTI1IGF0IDE3OjIzICswODAwLCBYdSBLdW9oYWkgd3JvdGU6CgpbLi4u
XQoKPiBGb3IgdGhlIHR3byBxdWVzdGlvbnMgeW91IG1lbnRpb25lZCwgSeKAmW0gbm90IHN1cmUg
aWYgd2UgY2FuIGFjY2VzcyBEV0FSRiBhdHRyaWJ1dGVzCj4gYXQgcnVudGltZS4gQXMgZm9yIGFk
ZGluZyBwYXJhbWV0ZXIgbG9jYXRpb25zIHRvIEJURiBhdCBidWlsZGluZyB0aW1lLCBJIHRoaW5r
IGl0Cj4gbWVhbnMgd2Ugd291bGQgbmVlZCB0byByZWNvcmQgQ1BVLXJlbGF0ZWQgcmVnaXN0ZXIg
aW5mbyBpbiBCVEYsIHdoaWNoIEkgZG9u4oCZdCB0aGluawo+IGlzIGEgZ29vZCBpZGVhLgoKQW5v
dGhlciBvcHRpb24gd291bGQgYmUgZm9yIHBhaG9sZSB0byBjaGVjayBpZiBmdW5jdGlvbiBwYXJh
bWV0ZXIKRFdfQVRfbG9jYWN0aW9uIGlzIHBsYWNlZCBpbiBhY2NvcmRhbmNlIHdpdGggQUJJLgpU
aGVzZSBmbGFncyBjYW4gYmUgcmVjb3JkZWQgaW4gYSBkZWRpY2F0ZWQgc2VjdGlvbiBvciBzbXRo
IGxpa2UgdGhpcy4KSGF2aW5nIHNhaWQgdGhhdCwgRFdfQVRfbG9jYWN0aW9uIHNlZW0gdG8gYmUg
bm90IHZlcnkgcmVsaWFibGUuCkUuZy4gZm9yIGJwZl90ZXN0bW9kLmtvIGdlbmVyYXRlZCBieSBj
bGFuZyAxOS4xLjcgSSBkb24ndCBzZWUKRFdfQVRfbG9jYWN0aW9uIHNwZWNpZmllZCBmb3IgcGFy
YW1ldGVycyBhLCBiLCBjLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxt
YW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21h
aWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
