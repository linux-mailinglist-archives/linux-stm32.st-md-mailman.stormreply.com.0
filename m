Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4352BCF22C1
	for <lists+linux-stm32@lfdr.de>; Mon, 05 Jan 2026 08:16:30 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0EC11C7BF70;
	Mon,  5 Jan 2026 07:16:30 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D27A1C0693F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  1 Jan 2026 00:28:42 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id
 d9443c01a7336-29f08b909aeso25111545ad.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 31 Dec 2025 16:28:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=purestorage.com; s=google2022; t=1767227321; x=1767832121;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=S2uWD+3+uKcWSebatXzToxK0XPCm9Txe1uJXgdjEiEI=;
 b=BjchwIa+15Am4A2VCL3Bc4ZVqYEz9+nZ+5WnHv7hBZhPqLMWAqIgCn061h4t+ZFb/+
 6fyf8I6GmRkKrp1JcsFY6HWhKW5UjlnJqlJBRL1W3Z/3b267w3tBkeR1Yxj+LADO+JRp
 H9XKvxQKAqbZ40P2oQSKYQ0oHp9sNY4euy5JqpTHHdvWok/xUyQvF3sRFjxThEO2dhQp
 0itosLLgueI9ktb3tU+y5kbD8PYARxjAUYF5WkhcM/zy8timgnjBjoXIcqe2c8c9rEgV
 EeJlaX0zbgSd5gHtP59Iy4ww8gXZZRS4kuN/1lWK4iZmKTH9ooiTmmqYCYAAuzekC9Cd
 RYVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767227321; x=1767832121;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=S2uWD+3+uKcWSebatXzToxK0XPCm9Txe1uJXgdjEiEI=;
 b=NcqxTMhlATolV56MuARKuu0iYz9JOqwLq3uaRz6kP0h5kif63Xa9EQTM98HmWmdHyK
 mb+Z8EOK693UqPSbm3ZClOK8azRmCDd5Yq8l1wxq+n4+MPi+w/LFUEgXOAgScj1doOY5
 U+8i6bEZHFfXIoBv8VYiM1nc3eGBirHiFOLAkm3+Sp2x++th7O++kk4yPmWL2SsUdn6Q
 ICOQJKHDnXf7DGp/NaW3UencubBr4AJm1uwLmhwva1jsuljLPLEBqRAHZ2I3A7lEQ6Nx
 5MKdQKvgtidOkchj1o3Nb0Au1pu/EW8F5zTrSSCskmg9K+UbLYGracr3HadjWv7tr5Ol
 IYUw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU0ms59qlRaHd3FkI/zm05Kq+73XZJcTNLrnQ+P+qt2+BQorfJxvvvbj+63CyqIQvBtGqlcfBhgeSZTIw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwZKU2UGUsggAepAUJMyFhVmerWjIlhmJ8OxZobgkRitqjcZchp
 XzJZ7JusWqOg1Ha6Xln0Qeo7JSeNDIYeEeP0M4aWNHOcQNgpOl+oCL7G/SJ146mgRLzMspKQ7UR
 2PHAEL+AK+7jH5JwbdrRSVxXFBhO6q6PU0bTs9H8PHQ==
X-Gm-Gg: AY/fxX6Kc5MOuCh/tMmBYnxWx15BMHG2s5lzuO4jouVtAemTGiydYGrEx11Mnxn6W5o
 TKJYeM67eXEA/mFraf+1HgOSIllr3EFIJIc6+DYM6hA9mh3AL+ApymLBx11D/+khDeCOnR8Vzhq
 nrMIyXw5CXDD+Pf/gKuKYtCr9BPhXZr8GXnn7740Ij9nfgdKQxZBBhgSBh/0GDUPWZdyrLIHUsc
 zia3hm8UyaGHyxag7DVR6kJyqIu0yw+jtK69ZEQd8yVmfDHzItMIicGqf+g2/2hqnieqQ/lW2eb
 5+mh1tk=
X-Google-Smtp-Source: AGHT+IFdBMje3pnEFdkXLIfnRWJ5hysTabkkamtVS8bCSG8FnqVHfzLw8gfE0QdSc/2hoIrXIja460pqGNnL6T+duQk=
X-Received: by 2002:a05:7022:f007:b0:11e:3e9:3e89 with SMTP id
 a92af1059eb24-12172312c16mr18360486c88.7.1767227320930; Wed, 31 Dec 2025
 16:28:40 -0800 (PST)
MIME-Version: 1.0
References: <20251231173633.3981832-6-csander@purestorage.com>
 <e9a1bd633fb4bb3d2820f63f41a8dd60d8c9c5e3c699fa56057ae393ef2f31d0@mail.kernel.org>
 <CADUfDZpSSikiZ8d8eWvfucj=Cvhc=k-sHN03EVExGBQ4Lx+23Q@mail.gmail.com>
 <CAADnVQKXUUNn=P=2-UECF1X7SR+oqm4xsr-2trpgTy1q+0c5FQ@mail.gmail.com>
In-Reply-To: <CAADnVQKXUUNn=P=2-UECF1X7SR+oqm4xsr-2trpgTy1q+0c5FQ@mail.gmail.com>
From: Caleb Sander Mateos <csander@purestorage.com>
Date: Wed, 31 Dec 2025 19:28:29 -0500
X-Gm-Features: AQt7F2r4zx9aMRYNSaKUcm0Gdej6msD8c2I3CLYONDae3Dt0B2iooTor-dsXV_A
Message-ID: <CADUfDZq5Bf8mVD9o=VHsUqYgqyMJx82_fhy73ZzkvawQi2Ko2g@mail.gmail.com>
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
X-Mailman-Approved-At: Mon, 05 Jan 2026 07:16:22 +0000
Cc: Juri Lelli <juri.lelli@redhat.com>, linux-s390 <linux-s390@vger.kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>, Peter Zijlstra <peterz@infradead.org>,
 sidraya@linux.ibm.com, Alexei Starovoitov <ast@kernel.org>,
 Benjamin Segall <bsegall@google.com>, Song Liu <song@kernel.org>,
 Eric Dumazet <edumazet@google.com>, "D. Wythe" <alibuda@linux.alibaba.com>,
 David Vernet <void@manifault.com>, bot+bpf-ci@kernel.org,
 Tony Lu <tonylu@linux.alibaba.com>, linux-stm32@st-md-mailman.stormreply.com,
 Martin KaFai Lau <martin.lau@kernel.org>, sched-ext@lists.linux.dev,
 Valentin Schneider <vschneid@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Shuah Khan <shuah@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>, Andrii Nakryiko <andrii@kernel.org>,
 Chris Mason <clm@meta.com>, Dust Li <dust.li@linux.alibaba.com>,
 Ingo Molnar <mingo@redhat.com>, Andrea Righi <arighi@nvidia.com>,
 "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Mel Gorman <mgorman@suse.de>,
 linux-rdma@vger.kernel.org, Jiri Pirko <jiri@resnulli.us>,
 Simon Horman <horms@kernel.org>, Hao Luo <haoluo@google.com>,
 Jiri Kosina <jikos@kernel.org>, Jamal Hadi Salim <jhs@mojatatu.com>,
 Steven Rostedt <rostedt@goodmis.org>, KP Singh <kpsingh@kernel.org>,
 wenjia@linux.ibm.com, mjambigi@linux.ibm.com,
 Cong Wang <xiyou.wangcong@gmail.com>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Benjamin Tissoires <bentiss@kernel.org>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Ihor Solodrai <ihor.solodrai@linux.dev>, Stanislav Fomichev <sdf@fomichev.me>,
 David Ahern <dsahern@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 Eduard <eddyz87@gmail.com>, Changwoo Min <changwoo@igalia.com>,
 guwen@linux.alibaba.com, Jiri Olsa <jolsa@kernel.org>,
 Network Development <netdev@vger.kernel.org>, Tejun Heo <tj@kernel.org>,
 bpf <bpf@vger.kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH 5/5] selftests/bpf: make cfi_stubs globals
	const
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

T24gV2VkLCBEZWMgMzEsIDIwMjUgYXQgMTA6MTPigK9BTSBBbGV4ZWkgU3Rhcm92b2l0b3YKPGFs
ZXhlaS5zdGFyb3ZvaXRvdkBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gT24gV2VkLCBEZWMgMzEsIDIw
MjUgYXQgMTA6MDnigK9BTSBDYWxlYiBTYW5kZXIgTWF0ZW9zCj4gPGNzYW5kZXJAcHVyZXN0b3Jh
Z2UuY29tPiB3cm90ZToKPiA+Cj4gPiBPbiBXZWQsIERlYyAzMSwgMjAyNSBhdCAxMDowNOKAr0FN
IDxib3QrYnBmLWNpQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4gPgo+ID4gPiA+IGRpZmYgLS1naXQg
YS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9icGYvdGVzdF9rbW9kcy9icGZfdGVzdG1vZC5jIGIv
dG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvYnBmL3Rlc3Rfa21vZHMvYnBmX3Rlc3Rtb2QuYwo+ID4g
PiA+IGluZGV4IDkwYzRiMWE1MWRlNi4uNWU0NjBiMWRiZGI2IDEwMDY0NAo+ID4gPiA+IC0tLSBh
L3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2JwZi90ZXN0X2ttb2RzL2JwZl90ZXN0bW9kLmMKPiA+
ID4gPiArKysgYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9icGYvdGVzdF9rbW9kcy9icGZfdGVz
dG1vZC5jCj4gPiA+Cj4gPiA+IFsgLi4uIF0KPiA+ID4KPiA+ID4gPiBAQCAtMTI3NSw3ICsxMjc1
LDcgQEAgYnBmX3Rlc3Rtb2Rfb3BzX190ZXN0X3JldHVybl9yZWZfa3B0cihpbnQgZHVtbXksIHN0
cnVjdCB0YXNrX3N0cnVjdCAqdGFza19fcmVmLAo+ID4gPiA+ICAgICAgIHJldHVybiBOVUxMOwo+
ID4gPiA+ICB9Cj4gPiA+ID4KPiA+ID4gPiAtc3RhdGljIHN0cnVjdCBicGZfdGVzdG1vZF9vcHMg
X19icGZfdGVzdG1vZF9vcHMgPSB7Cj4gPiA+ID4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgYnBmX3Rl
c3Rtb2Rfb3BzIF9fYnBmX3Rlc3Rtb2Rfb3BzID0gewo+ID4gPiA+ICAgICAgIC50ZXN0XzEgPSBi
cGZfdGVzdG1vZF90ZXN0XzEsCj4gPiA+ID4gICAgICAgLnRlc3RfMiA9IGJwZl90ZXN0bW9kX3Rl
c3RfMiwKPiA+ID4KPiA+ID4gSXMgaXQgc2FmZSB0byBtYWtlIF9fYnBmX3Rlc3Rtb2Rfb3BzIGNv
bnN0IGhlcmU/IEluIGJwZl90ZXN0bW9kX2luaXQoKSwKPiA+ID4gdGhpcyBzdHJ1Y3QgaXMgbW9k
aWZpZWQgYXQgcnVudGltZToKPiA+ID4KPiA+ID4gICAgIHRyYW1wID0gKHZvaWQgKiopJl9fYnBm
X3Rlc3Rtb2Rfb3BzLnRyYW1wXzE7Cj4gPiA+ICAgICB3aGlsZSAodHJhbXAgPD0gKHZvaWQgKiop
Jl9fYnBmX3Rlc3Rtb2Rfb3BzLnRyYW1wXzQwKQo+ID4gPiAgICAgICAgICp0cmFtcCsrID0gYnBm
X3Rlc3Rtb2RfdHJhbXA7Cj4gPiA+Cj4gPiA+IFdyaXRpbmcgdG8gYSBjb25zdC1xdWFsaWZpZWQg
b2JqZWN0IGlzIHVuZGVmaW5lZCBiZWhhdmlvciBhbmQgbWF5IGNhdXNlIGEKPiA+ID4gcHJvdGVj
dGlvbiBmYXVsdCB3aGVuIHRoZSBjb21waWxlciBwbGFjZXMgdGhpcyBpbiByZWFkLW9ubHkgbWVt
b3J5LiBXb3VsZAo+ID4gPiB0aGUgbW9kdWxlIGZhaWwgdG8gbG9hZCBvbiBzeXN0ZW1zIHdoZXJl
IC5yb2RhdGEgaXMgYWN0dWFsbHkgcmVhZC1vbmx5Pwo+ID4KPiA+IFl1cCwgdGhhdCdzIGluZGVl
ZCB0aGUgYnVnIGNhdWdodCBieSBLQVNBTi4gTWlzc2VkIHRoaXMgbXV0YXRpb24gYXQKPiA+IGlu
aXQgdGltZSwgSSdsbCBsZWF2ZSBfX2JwZl90ZXN0bW9kX29wcyBhcyBtdXRhYmxlLgo+Cj4gTm8u
IFlvdSdyZSBtaXNzaW5nIHRoZSBwb2ludC4gVGhlIHdob2xlIHBhdGNoIHNldCBpcyBubyBnby4K
PiBUaGUgcG9pbnRlciB0byBjZmkgc3R1YiBjYW4gYmUgdXBkYXRlZCBqdXN0IGFzIHdlbGwuCgpE
byB5b3UgbWVhbiB0aGUgQlBGIGNvcmUgY29kZSB3b3VsZCBtb2RpZnkgdGhlIHN0cnVjdCBwb2lu
dGVkIHRvIGJ5CmNmaV9zdHVicz8gT3Igc29tZSBCUEYgc3RydWN0X29wcyBpbXBsZW1lbnRhdGlv
biAobGlrZSB0aGlzIG9uZSBpbgpicGZfdGVzdG1vZC5jKSB3b3VsZCBtb2RpZnkgaXQ/IElmIHlv
dSdyZSB0YWxraW5nIGFib3V0IHRoZSBCUEYgY29yZQpjb2RlLCBjb3VsZCB5b3UgcG9pbnQgb3V0
IHdoZXJlIHRoaXMgaGFwcGVucz8gSSBjb3VsZG4ndCBmaW5kIGl0IHdoZW4KbG9va2luZyB0aHJv
dWdoIHRoZSBoYW5kZnVsIG9mIHVzZXMgb2YgY2ZpX3N0dWJzIChzZWUgcGF0Y2ggMS81KS4gT3IK
YXJlIHlvdSB0YWxraW5nIGFib3V0IHNvbWUgaHlwb3RoZXRpY2FsIGZ1dHVyZSBjb2RlIHRoYXQg
d291bGQgd3JpdGUKdGhyb3VnaCB0aGUgY2ZpX3N0dWJzIHBvaW50ZXI/IElmIHlvdSdyZSB0YWxr
aW5nIGFib3V0IGEgc3RydWN0X29wcwppbXBsZW1lbnRhdGlvbiwgSSBjZXJ0YWlubHkgYWdyZWUg
aXQgY291bGQgbW9kaWZ5IHRoZSBzdHJ1Y3QgcG9pbnRlZAp0byBieSBjZmlfc3R1YnMgKGJlZm9y
ZSBjYWxsaW5nIHJlZ2lzdGVyX2JwZl9zdHJ1Y3Rfb3BzKCkpLiBCdXQgdGhlbgp0aGUgc3RydWN0
X29wcyBpbXBsZW1lbnRhdGlvbiBkb2Vzbid0IGhhdmUgdG8gZGVjbGFyZSB0aGUgZ2xvYmFsCnZh
cmlhYmxlIGFzIGNvbnN0LiBBIG5vbi1jb25zdCBwb2ludGVyIGlzIGFsbG93ZWQgYW55d2hlcmUg
YSBjb25zdApwb2ludGVyIGlzIGV4cGVjdGVkLgoKVGhhbmtzLApDYWxlYgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxp
c3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1k
LW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
