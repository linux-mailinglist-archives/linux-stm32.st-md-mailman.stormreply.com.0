Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D243CEC732
	for <lists+linux-stm32@lfdr.de>; Wed, 31 Dec 2025 19:14:01 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E1630C57A52;
	Wed, 31 Dec 2025 18:14:00 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B5FB6C0693F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 31 Dec 2025 18:13:59 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-42fb2314f52so6169045f8f.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 31 Dec 2025 10:13:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767204839; x=1767809639;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=80wuQlyFH/FTtp28IkHfYhaeWqE7rS7z6vp3Trh+jc4=;
 b=Z3u3SlBjO5AJNKL2v+MpdG05krfA6qeL2VcMbFg7iQ1V8XDnRDG33eTYP3FXj91nui
 cR+2W5MSr6X9xRSoBj4zGH2JW0c3XJ9NZqyqnmm6sCcBHC0JIur6xerRRrSP9kLMQSTq
 03YMH3BheLhXi5jQtCR8ianL2lkT/3RgP3GSX7n8oVBOLB4xeS0xxMuWPtT49DyCzPWq
 W2S1yO4WouXk/QXGkORnb1PkICVzUPNDTK59AULpm4AWXUM2zKfud47RAM04zB2dr5O+
 epEU9zM6XKUeLx/YQ/vUudK+VIXAgEwF+aIbYtQ2/bwHhxVn8tmkfpyk/nWM7zkhIzk+
 UPNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767204839; x=1767809639;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=80wuQlyFH/FTtp28IkHfYhaeWqE7rS7z6vp3Trh+jc4=;
 b=SG6AbexOqLuOPruaclKxUX6VbgvqBWH6BLm1ZfLA1lRBNXXrnDRZwMRPW46kRtRg0x
 ZgJoKGLrRjQCJ9U6CP/OFwB3V23FIBleCoOoyOvibpSMEbAPcIqGI5Jx85hca+dYdRTz
 BgQ4noeYQQdkJehFSWmCmR0tuZW40T2M9Klp9XVCFz/t02LZmQ5g9MBWojP6yLWRS6zo
 04FukELVgf8rFVb1qgtX2FzAt3ysT6zxsm816IjRhl/cgnbeGr5lnCB15Y0b/8DCxTsp
 rE1Tu92i6rsvf1Oinj/wOqRO1gCvGTd2ZwA8A9hHiswFqAAfpGtw8lqyeCAoturV6TwC
 Js6A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVpWyBYIqyQ+lCn2UtG476ydT7+7y+dTswDr6KSbA8AvIAGAmgW+kIhK45MzDyXr9AZw0OqpM8MX67Hrw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yxw++s6CC1o+EXgPoUzs+kumvzsii/4fh4gq6SaXA9jGlT5YM+y
 O+ccMWlXbLaecfW/75WCXIrGAJiKaa+J9EUgJXXsnIN51GytIGwPboCZB6rt1d2HazfUklKl791
 JFx6r74Si79UT/zUHmpt990mPuP/t7so=
X-Gm-Gg: AY/fxX6pto/UzGqSVKMWm15LkIdEjYcqQDFdFA0TWcIPq0cO+S24bJI/0Vx/gryuQMc
 Ql03U+WA+ujnIAK5LCkVXfJGhbaZe/pnHrDvZDYqkOoCeRX6M4KdmRFbUQFoptiRIzTSavQOstR
 6BKyxMLZw4O+tm0gSOG2V0oBqv8y5wSM0ClS5IqF6wol3YZpPg3qQbxhB3YV2m9OxT9OqoZ4AkA
 q7/pKmmwL6srVKixx5C/iR4sSdJtrgmRnURAdZBm5tkL7KfFnoYwHlcYKkxAXN4o0ivml9cbbg3
 hnhRPoeSwjwzbaaXoZOwsj/+7iM3
X-Google-Smtp-Source: AGHT+IE7rn8UGO5FxmIqC7DPe8kHIdUtmNgCuEKioyalqiNjU4yifPpIQxEAl6/RRsYuU+/knbKXbX9dpW9nJ6ADD+Y=
X-Received: by 2002:a05:6000:611:b0:431:3ba:1188 with SMTP id
 ffacd0b85a97d-4324e4c70e5mr40336157f8f.3.1767204838828; Wed, 31 Dec 2025
 10:13:58 -0800 (PST)
MIME-Version: 1.0
References: <20251231173633.3981832-6-csander@purestorage.com>
 <e9a1bd633fb4bb3d2820f63f41a8dd60d8c9c5e3c699fa56057ae393ef2f31d0@mail.kernel.org>
 <CADUfDZpSSikiZ8d8eWvfucj=Cvhc=k-sHN03EVExGBQ4Lx+23Q@mail.gmail.com>
In-Reply-To: <CADUfDZpSSikiZ8d8eWvfucj=Cvhc=k-sHN03EVExGBQ4Lx+23Q@mail.gmail.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Wed, 31 Dec 2025 10:13:47 -0800
X-Gm-Features: AQt7F2oHF_qxr3_KPJ-VT5eeYhG4tvvvWKJxtIn11KSC3ODYIcBGmV1QpWm3ri0
Message-ID: <CAADnVQKXUUNn=P=2-UECF1X7SR+oqm4xsr-2trpgTy1q+0c5FQ@mail.gmail.com>
To: Caleb Sander Mateos <csander@purestorage.com>
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

T24gV2VkLCBEZWMgMzEsIDIwMjUgYXQgMTA6MDnigK9BTSBDYWxlYiBTYW5kZXIgTWF0ZW9zCjxj
c2FuZGVyQHB1cmVzdG9yYWdlLmNvbT4gd3JvdGU6Cj4KPiBPbiBXZWQsIERlYyAzMSwgMjAyNSBh
dCAxMDowNOKAr0FNIDxib3QrYnBmLWNpQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4KPiA+ID4gZGlm
ZiAtLWdpdCBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2JwZi90ZXN0X2ttb2RzL2JwZl90ZXN0
bW9kLmMgYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9icGYvdGVzdF9rbW9kcy9icGZfdGVzdG1v
ZC5jCj4gPiA+IGluZGV4IDkwYzRiMWE1MWRlNi4uNWU0NjBiMWRiZGI2IDEwMDY0NAo+ID4gPiAt
LS0gYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9icGYvdGVzdF9rbW9kcy9icGZfdGVzdG1vZC5j
Cj4gPiA+ICsrKyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2JwZi90ZXN0X2ttb2RzL2JwZl90
ZXN0bW9kLmMKPiA+Cj4gPiBbIC4uLiBdCj4gPgo+ID4gPiBAQCAtMTI3NSw3ICsxMjc1LDcgQEAg
YnBmX3Rlc3Rtb2Rfb3BzX190ZXN0X3JldHVybl9yZWZfa3B0cihpbnQgZHVtbXksIHN0cnVjdCB0
YXNrX3N0cnVjdCAqdGFza19fcmVmLAo+ID4gPiAgICAgICByZXR1cm4gTlVMTDsKPiA+ID4gIH0K
PiA+ID4KPiA+ID4gLXN0YXRpYyBzdHJ1Y3QgYnBmX3Rlc3Rtb2Rfb3BzIF9fYnBmX3Rlc3Rtb2Rf
b3BzID0gewo+ID4gPiArc3RhdGljIGNvbnN0IHN0cnVjdCBicGZfdGVzdG1vZF9vcHMgX19icGZf
dGVzdG1vZF9vcHMgPSB7Cj4gPiA+ICAgICAgIC50ZXN0XzEgPSBicGZfdGVzdG1vZF90ZXN0XzEs
Cj4gPiA+ICAgICAgIC50ZXN0XzIgPSBicGZfdGVzdG1vZF90ZXN0XzIsCj4gPgo+ID4gSXMgaXQg
c2FmZSB0byBtYWtlIF9fYnBmX3Rlc3Rtb2Rfb3BzIGNvbnN0IGhlcmU/IEluIGJwZl90ZXN0bW9k
X2luaXQoKSwKPiA+IHRoaXMgc3RydWN0IGlzIG1vZGlmaWVkIGF0IHJ1bnRpbWU6Cj4gPgo+ID4g
ICAgIHRyYW1wID0gKHZvaWQgKiopJl9fYnBmX3Rlc3Rtb2Rfb3BzLnRyYW1wXzE7Cj4gPiAgICAg
d2hpbGUgKHRyYW1wIDw9ICh2b2lkICoqKSZfX2JwZl90ZXN0bW9kX29wcy50cmFtcF80MCkKPiA+
ICAgICAgICAgKnRyYW1wKysgPSBicGZfdGVzdG1vZF90cmFtcDsKPiA+Cj4gPiBXcml0aW5nIHRv
IGEgY29uc3QtcXVhbGlmaWVkIG9iamVjdCBpcyB1bmRlZmluZWQgYmVoYXZpb3IgYW5kIG1heSBj
YXVzZSBhCj4gPiBwcm90ZWN0aW9uIGZhdWx0IHdoZW4gdGhlIGNvbXBpbGVyIHBsYWNlcyB0aGlz
IGluIHJlYWQtb25seSBtZW1vcnkuIFdvdWxkCj4gPiB0aGUgbW9kdWxlIGZhaWwgdG8gbG9hZCBv
biBzeXN0ZW1zIHdoZXJlIC5yb2RhdGEgaXMgYWN0dWFsbHkgcmVhZC1vbmx5Pwo+Cj4gWXVwLCB0
aGF0J3MgaW5kZWVkIHRoZSBidWcgY2F1Z2h0IGJ5IEtBU0FOLiBNaXNzZWQgdGhpcyBtdXRhdGlv
biBhdAo+IGluaXQgdGltZSwgSSdsbCBsZWF2ZSBfX2JwZl90ZXN0bW9kX29wcyBhcyBtdXRhYmxl
LgoKTm8uIFlvdSdyZSBtaXNzaW5nIHRoZSBwb2ludC4gVGhlIHdob2xlIHBhdGNoIHNldCBpcyBu
byBnby4KVGhlIHBvaW50ZXIgdG8gY2ZpIHN0dWIgY2FuIGJlIHVwZGF0ZWQganVzdCBhcyB3ZWxs
LgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1z
dG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNv
bQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9s
aW51eC1zdG0zMgo=
