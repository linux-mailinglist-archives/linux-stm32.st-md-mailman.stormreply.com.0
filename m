Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 79BF8ACF3C4
	for <lists+linux-stm32@lfdr.de>; Thu,  5 Jun 2025 18:10:07 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 901ACC30883;
	Thu,  5 Jun 2025 16:10:06 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 778AEC3087B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  5 Jun 2025 16:10:05 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-3a50fc7ac4dso772463f8f.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 05 Jun 2025 09:10:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749139805; x=1749744605;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YnIQvPD9lJYDOlBpOrCy1ioFdRL5RyD0q+hZaolXlzo=;
 b=gMcGGxvW050qCpV6lH3ywfO44T2D97DS0xNtsBIKl9cjE3vlPyl2dTpFedKsIf5kOX
 IzkvKnhx+BG3KmmkYXhCWhinLtRjdGtUUX41KB7Ruuxc8euj/eUxDI/lI2gAWwDt7/lH
 9mqywDXBgJVFBk/Us0hOcf1kZTD44pC+1a6aZ1xBOz1MIaiR1MulY3OlaUMKJs2z6h1w
 RR9rY6Sc4qXB5+KEishUxMuAMVEmGzfZSUEZIkEfy2N2vfQDYGsu3Ni7cTTIj95sgruW
 zjBW0q2hy9TCJx5Jkf0T1GAg/U/3pyoHQdZ1aDGykDh/8/YwQnPhycoKu+YMCZeSR0N9
 CraQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749139805; x=1749744605;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YnIQvPD9lJYDOlBpOrCy1ioFdRL5RyD0q+hZaolXlzo=;
 b=VnCq+ZFofW93EPwu5jb3Q0bG29yV8QL246ftJRlV68CN0BjJIs0YDXu0ey8cH+zt/w
 bUbntNC+ATexGyCX/Uj4sUSpDxmWk1Wo4pzk/W/CsMsvOK7YIMvTl3rAXMCjoYiyfL/2
 uJEhx0Cu7JdsJt2OIhf3///To+fFqvp/2UjBCYj2DeKbsWyktoObaIsx1bZZ9z8cViLr
 RrsyPjdPyF/sF5amkumeaaaUnvooODqZKExxzjJ69X64fAtB6tjCC/isHGAkdnxDvY0x
 TAl/4C00tj4WYPlD2Ed+flFlKzKNBbOQpR39rRJ6Re/OQkwgQV885XYgn/kUt8CHTyBg
 ekUQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUMonzFIgNMnKfELX5kWIh8kuAoj/Azg6b1hDULn0yVdnpo6VIhbKVVZBdylOEhQ1ql4EVkOUzTB7lJnA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YygavxWLrOvF6MXhBMY60WQ5P1IYdGKTlvwpUu2E0YBP/lQT5gC
 wUg4G3/GdaDpHSIXv0Q6UiovzZ3Ruec5y7lDLgJ9i15VGcptCEJnmhDX/fOrBGAlVEIrscbLywp
 5CgUF2Xca96jXi96vr1+dqjFyV+nXGSg=
X-Gm-Gg: ASbGncvQZmDmvRkwbw4aPY2Ttn6I3mjdtPmlmFJaFd9TNGYr/nbjgfb9D6wKOkShkiN
 1W8+YJsC+qefNRoO/v2IvVpBFPp+0Knv6wJYdz9pmLr3c9oGBTBPXfyUMoJawigAl8vymn+4Xcn
 il9BLoDDTxXpJoDohR3iXguOrd7lZWcM0uT0NoQV6cjl3jiCcGzd0IKL6sChK0SwBm3KJlpQ==
X-Google-Smtp-Source: AGHT+IF4/r/MeCk1ofRbXjeQgnJMl2fjGGz6lBVtftByV5fvMH1+Rl6IDv+s6YX9w9uN5TsW5ALs3oMs2ojfpEr5ugw=
X-Received: by 2002:a5d:4291:0:b0:3a5:2875:f986 with SMTP id
 ffacd0b85a97d-3a52875fc63mr2749955f8f.44.1749139804629; Thu, 05 Jun 2025
 09:10:04 -0700 (PDT)
MIME-Version: 1.0
References: <20250411-many_args_arm64-v1-0-0a32fe72339e@bootlin.com>
 <20250411-many_args_arm64-v1-1-0a32fe72339e@bootlin.com>
 <CAEf4Bzbn6BdXTOb0dTcsQmOMZpp5=DzGS2hHHQ3+dwcja=gv+w@mail.gmail.com>
 <D98Q8BRNUVS9.11J60C67L1ALR@bootlin.com>
 <CAEf4BzZHMYyGDZ4c4eNXG7Fm=ecxCCbKhKbQTbCjvWmKtdwvBw@mail.gmail.com>
 <D9E9IQQ3QKXM.3UJ17G9CBS1FH@bootlin.com>
 <DADMLIVHMSSO.3AXSI5216WCT6@bootlin.com>
 <9a2ba0ad-b34d-42f8-89a6-d9a44f007bdc@linux.dev>
 <DAEFD2WH7HRV.2SOG9Q00QSEXH@bootlin.com>
In-Reply-To: <DAEFD2WH7HRV.2SOG9Q00QSEXH@bootlin.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Thu, 5 Jun 2025 09:09:53 -0700
X-Gm-Features: AX0GCFt6yH5UVLu_OY8YyoKeWCoB2_l0Zw4RyPbCo3gsHpLrUJ01bzW8146d9WY
Message-ID: <CAADnVQ+T_s6dAwJ5JKqNqA8tq1P+MdfPvPw0EoY5yOf8PnGT4g@mail.gmail.com>
To: =?UTF-8?Q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
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
 KP Singh <kpsingh@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Hao Luo <haoluo@google.com>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 dwarves@vger.kernel.org, Ihor Solodrai <ihor.solodrai@linux.dev>,
 LKML <linux-kernel@vger.kernel.org>, Eduard Zingerman <eddyz87@gmail.com>,
 Jiri Olsa <jolsa@kernel.org>, bpf <bpf@vger.kernel.org>,
 Andrii Nakryiko <andrii.nakryiko@gmail.com>,
 Martin KaFai Lau <martin.lau@linux.dev>
Subject: Re: [Linux-stm32] [Question] attributes encoding in BTF
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

T24gVGh1LCBKdW4gNSwgMjAyNSBhdCAxMjozNeKAr0FNIEFsZXhpcyBMb3Rob3LDqQo8YWxleGlz
LmxvdGhvcmVAYm9vdGxpbi5jb20+IHdyb3RlOgo+Cj4gSGkgSWhvciwKPgo+IE9uIFdlZCBKdW4g
NCwgMjAyNSBhdCA3OjMxIFBNIENFU1QsIElob3IgU29sb2RyYWkgd3JvdGU6Cj4gPiBPbiA2LzQv
MjUgMjowMiBBTSwgQWxleGlzIExvdGhvcsODwqkgd3JvdGU6Cj4KPiBbLi4uXQo+Cj4gPj4gQ291
bGQgSSBiZSBtaXNzaW5nIHNvbWV0aGluZyBvYnZpb3VzID8gT3IgZGlkIEkgbWlzdW5kZXJzdGFu
ZCB0aGUgYWN0dWFsCj4gPj4gYXR0cmlidXRlIGVuY29kaW5nIGZlYXR1cmUgPwo+ID4KPiA+IEhp
IEFsZXhpcy4KPiA+Cj4gPiBUaGUgY2hhbmdlcyByZWNlbnRseSBsYW5kZWQgaW4gcGFob2xlIGFu
ZCBsaWJicGYgcmUgYXR0cmlidXRlcyBoYWQgYQo+ID4gdmVyeSBuYXJyb3cgZ29hbDogcGFzc2lu
ZyB0aHJvdWdoIHBhcnRpY3VsYXIgYXR0cmlidXRlcyBmb3Igc29tZSBCUEYKPiA+IGtmdW5jcyBm
cm9tIHRoZSBrZXJuZWwgc291cmNlIHRvIHZtbGludXguaAo+ID4KPiA+IEJURiBub3cgaGFzIGEg
d2F5IG9mIGVuY29kaW5nIGFueSBhdHRyaWJ1dGUgKGFzIG9wcG9zZWQgdG8gb25seSBicGYKPiA+
IHR5cGUvZGVjbCB0YWdzKSBieSBzZXR0aW5nIHR5cGUvZGVjbCB0YWcga2luZCBmbGFnIFsxXS4g
U28gaXQgaXMKPiA+IHBvc3NpYmxlIHRvIHJlcHJlc2VudCBhdHRyaWJ1dGVzIGxpa2UgcGFja2Vk
IGFuZCBhbGlnbmVkIGluIEJURi4KPiA+Cj4gPiBIb3dldmVyLCB0aGUgQlRGIHRhZ3MgbmVlZCB0
byBiZSBnZW5lcmF0ZWQgYnkgc29tZXRoaW5nLCBpbiBjYXNlIG9mCj4gPiB2bWxpbnV4IGJ5IHBh
aG9sZS4gUGFob2xlIGdlbmVyYXRlcyBCVEYgYnkgcGFyc2luZyBEV0FSRi4gQW5kLCBhcyBmYXIg
YXMKPiA+IEkgdW5kZXJzdGFuZCwgYXR0cmlidXRlcyBhcmUgbm90IChjYW4gbm90IGJlPykgcmVw
cmVzZW50ZWQgaW4gRFdBUkYgaW4gYQo+ID4gZ2VuZXJpYyB3YXksIGl0IHJlYWxseSBkZXBlbmRz
IG9uIHNwZWNpZmljcyBvZiB0aGUgYXR0cmlidXRlLgo+ID4KPiA+IEluIG9yZGVyIHRvIHN1cHBv
cnQgcGFja2VkL2FsaWduZWQsIHBhaG9sZSBuZWVkcyB0byBrbm93IGhvdyB0byBmaWd1cmUKPiA+
IHRoZW0gb3V0IGZyb20gRFdBUkYgaW5wdXQgYW5kIGFkZCB0aGUgdGFncyB0byBCVEYuIEFuZCB0
aGlzIGRvZXMgbm90Cj4gPiBoYXBwZW4gcmlnaHQgbm93LCB3aGljaCBpcyB3aHkgeW91IGRvbid0
IHNlZSBhbnl0aGluZyBpbiBicGZ0b29sIG91dHB1dC4KPiA+Cj4gPiBbMV0KPiA+IGh0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL2JwZi8yMDI1MDEzMDIwMTIzOS4xNDI5NjQ4LTEtaWhvci5zb2xvZHJh
aUBsaW51eC5kZXYvCj4KPiBUaGFua3MgZm9yIHRoZSBkZXRhaWxzICEgSSBoYXZlIG1pc3NlZCB0
aGlzIHBvc3NpYmlsaXR5LCBhcyBJIGhhdmUgYmVlbgo+IGFzc3VtaW5nIHRoYXQgRFdBUkYgaW5m
byB3YXMgZXhwb3NpbmcgdGhlIG5lZWRlZCBpbmZvLiBJJ2xsIHRha2UgYSBsb29rIGF0Cj4gaXQs
IGJ1dCBpZiB0aG9zZSBhdHRyaWJ1dGVzIGNhbiBub3QgYmUgcmVwcmVzZW50ZWQgYnkgRFdBUkYs
IEknbGwgaGF2ZSB0bwo+IGZpbmQgYW5vdGhlciB3YXkgb2YgZ2V0dGluZyB0aG9zZSBwYWNraW5n
L2FsaWdubWVudCBtb2RpZmljYXRpb25zIG9uIGRhdGEKPiB0eXBlIChlZzogcmUtdXNlL3NoYXJl
IGJ0Zl9fYWxpZ25fb2YgZnJvbSBsaWJicGYsIGFzIHN1Z2dlc3RlZCBieSBBbmRyaWksCj4gYnV0
IGl0IG1heSBub3QgYWJsZSB0byBjb3ZlciBhbGwgY2FzZXMpLgoKTm90IHN1cmUgYWxsIHRoZSB0
cm91YmxlIGlzIHdvcnRoIGl0LgpJIGZlZWwgaXQncyBhIGNvcm5lciBjYXNlLiBTb21ldGhpbmcg
d2UgZG9uJ3QgbmVlZCB0byBmaXguCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1t
YWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNv
bS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
