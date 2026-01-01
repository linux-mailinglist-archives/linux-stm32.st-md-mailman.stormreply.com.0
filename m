Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F6C5CECC29
	for <lists+linux-stm32@lfdr.de>; Thu, 01 Jan 2026 03:10:53 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 42301C0693F;
	Thu,  1 Jan 2026 02:10:53 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 25896C35E2B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  1 Jan 2026 02:10:51 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-47d5e021a53so10963805e9.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 31 Dec 2025 18:10:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767233451; x=1767838251;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=L2EkUzQ6sigBd+WWV5Hcl6Vcy/jBU7DTMqVQsenR/Xo=;
 b=F4cvBCMPKvSl9YUupe/CpV+fVl7VN3plGWCCDe+8Pf7U/kUejMtP2+s2yIKocYB5D8
 1UfcPd6epTvVzZLv14QjHTxZm1XbtZfg8rMfillcak8h9h764FV26FNXwmzeKDepOQjQ
 fEpprUeZhO00eJtRCYs6BTEl95u39lzMh3TMVb83Ui1IcFQ2+zQMRetfoqdtMwWAvrJT
 YInycUfBo9NswQsppXywJx0tLYnOP/rt4D4O9BJ+jnk3nj+oms2nczZzoKLhNfnrJ1nd
 erMXW8ILQID5AtbqxsHHarg3NGgD1oy7Vl9uZB1Bvca0UtMjv74GhySMIyX6ByEgFMzj
 XAEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767233451; x=1767838251;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=L2EkUzQ6sigBd+WWV5Hcl6Vcy/jBU7DTMqVQsenR/Xo=;
 b=KlnemgUYJTIyK8ImkH3/Ur8Aa60iE5PJzDiHQJtnkoc8FvhKAcuSm7EKjZEJ+ju0Xb
 fxx5suj/2wR6dGOJAAO1zD6r7IEnvhpLlzSvCIqRcsdEdesQZlMTKfrVR5Gy62z/Fb9o
 pu2Z8PScpKXiGY+sZiLYwrLC7yAn0pP9OtwQNhIngFUB9Df4iHP/981SIfzzDDITkFob
 /MbsmpPi2YaFwSsUZYsmdaLLEDdsjLiztWcHTj5BXaaPjjsa1hilcaFT1YyS/iydwZvo
 sjiR6JO9WCsQBWAzw4aWozIAmaxjjjzsn3o4cXbOqg232yzBrinL84hOr/HxxGiCZ9s2
 HUgw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWCzBXWksCR60wvk2PJ4/zx79RoX5hL1RCOoiSQUBqsDbrB37gPoexShLfCKYKVh6X9qkylI0uq9SP+Og==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YztLiZo2fGvTVQcSKoAeKuzY37YBFti1OzG3sVaxeMv9ZvLg1h1
 IYBnIbiqdv9jfqK5BAY8x76y7sBQDtofMqh+xvYyvst57jQCX9/luRJdxAQFFagB9fR0qHgbEkB
 ozd3yKGAe+l53yQY4oFfiwPqcEgLW218=
X-Gm-Gg: AY/fxX4nrfJI4vEfpJ08MIVC/Lk/ztE/+R+689ky+4aCI/pkHYYGG0gfNFYsT6duJEg
 HmSyFghRheFatNuOa9MEov3heWC0nBodQle2sOpVS6CsQdH8dGZSobOmfUbj3MhsOr2Mtyxkd8X
 CW+QcAtM7fKg1l8TKUwDAy4mXj0FcC6ZKKLdxHJ1vetFIjK56TI+RDhUWieGAR+w8K1eq7/Y72h
 aa5VCiDRIPqB/zyBX6SlSx5xkrY1TC37A9+d73GxFcz02+rjo0kZLv/eViYAAzB60axkTtbLBhK
 pnFoRmOUVqIFUm1UERKxzGUMx3jF
X-Google-Smtp-Source: AGHT+IH5ZrzzFT5UNwTZptN+H56qkFUXA/Ygb+yPt8+WPgM1uThdV3rrZmNHjr6UFJLqBPNEBxHVHfwADBRcBM115zY=
X-Received: by 2002:a05:600c:638d:b0:477:afc5:fb02 with SMTP id
 5b1f17b1804b1-47d4c8f4972mr206282295e9.21.1767233450902; Wed, 31 Dec 2025
 18:10:50 -0800 (PST)
MIME-Version: 1.0
References: <20251231173633.3981832-6-csander@purestorage.com>
 <e9a1bd633fb4bb3d2820f63f41a8dd60d8c9c5e3c699fa56057ae393ef2f31d0@mail.kernel.org>
 <CADUfDZpSSikiZ8d8eWvfucj=Cvhc=k-sHN03EVExGBQ4Lx+23Q@mail.gmail.com>
 <CAADnVQKXUUNn=P=2-UECF1X7SR+oqm4xsr-2trpgTy1q+0c5FQ@mail.gmail.com>
 <CADUfDZq5Bf8mVD9o=VHsUqYgqyMJx82_fhy73ZzkvawQi2Ko2g@mail.gmail.com>
In-Reply-To: <CADUfDZq5Bf8mVD9o=VHsUqYgqyMJx82_fhy73ZzkvawQi2Ko2g@mail.gmail.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Wed, 31 Dec 2025 18:10:39 -0800
X-Gm-Features: AQt7F2qPTzBBxIXi7mSFxblwdWM4pyxfhqUHnmv1AUlo2Ajz8HPFxUtnTVbWXLM
Message-ID: <CAADnVQJ0Xhmx0ZyTKbWqaiiX7QwghMznzjDL1CNmraXM4d+T7A@mail.gmail.com>
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

T24gV2VkLCBEZWMgMzEsIDIwMjUgYXQgNDoyOOKAr1BNIENhbGViIFNhbmRlciBNYXRlb3MKPGNz
YW5kZXJAcHVyZXN0b3JhZ2UuY29tPiB3cm90ZToKPgo+IE9uIFdlZCwgRGVjIDMxLCAyMDI1IGF0
IDEwOjEz4oCvQU0gQWxleGVpIFN0YXJvdm9pdG92Cj4gPGFsZXhlaS5zdGFyb3ZvaXRvdkBnbWFp
bC5jb20+IHdyb3RlOgo+ID4KPiA+IE9uIFdlZCwgRGVjIDMxLCAyMDI1IGF0IDEwOjA54oCvQU0g
Q2FsZWIgU2FuZGVyIE1hdGVvcwo+ID4gPGNzYW5kZXJAcHVyZXN0b3JhZ2UuY29tPiB3cm90ZToK
PiA+ID4KPiA+ID4gT24gV2VkLCBEZWMgMzEsIDIwMjUgYXQgMTA6MDTigK9BTSA8Ym90K2JwZi1j
aUBrZXJuZWwub3JnPiB3cm90ZToKPiA+ID4gPgo+ID4gPiA+ID4gZGlmZiAtLWdpdCBhL3Rvb2xz
L3Rlc3Rpbmcvc2VsZnRlc3RzL2JwZi90ZXN0X2ttb2RzL2JwZl90ZXN0bW9kLmMgYi90b29scy90
ZXN0aW5nL3NlbGZ0ZXN0cy9icGYvdGVzdF9rbW9kcy9icGZfdGVzdG1vZC5jCj4gPiA+ID4gPiBp
bmRleCA5MGM0YjFhNTFkZTYuLjVlNDYwYjFkYmRiNiAxMDA2NDQKPiA+ID4gPiA+IC0tLSBhL3Rv
b2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2JwZi90ZXN0X2ttb2RzL2JwZl90ZXN0bW9kLmMKPiA+ID4g
PiA+ICsrKyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2JwZi90ZXN0X2ttb2RzL2JwZl90ZXN0
bW9kLmMKPiA+ID4gPgo+ID4gPiA+IFsgLi4uIF0KPiA+ID4gPgo+ID4gPiA+ID4gQEAgLTEyNzUs
NyArMTI3NSw3IEBAIGJwZl90ZXN0bW9kX29wc19fdGVzdF9yZXR1cm5fcmVmX2twdHIoaW50IGR1
bW15LCBzdHJ1Y3QgdGFza19zdHJ1Y3QgKnRhc2tfX3JlZiwKPiA+ID4gPiA+ICAgICAgIHJldHVy
biBOVUxMOwo+ID4gPiA+ID4gIH0KPiA+ID4gPiA+Cj4gPiA+ID4gPiAtc3RhdGljIHN0cnVjdCBi
cGZfdGVzdG1vZF9vcHMgX19icGZfdGVzdG1vZF9vcHMgPSB7Cj4gPiA+ID4gPiArc3RhdGljIGNv
bnN0IHN0cnVjdCBicGZfdGVzdG1vZF9vcHMgX19icGZfdGVzdG1vZF9vcHMgPSB7Cj4gPiA+ID4g
PiAgICAgICAudGVzdF8xID0gYnBmX3Rlc3Rtb2RfdGVzdF8xLAo+ID4gPiA+ID4gICAgICAgLnRl
c3RfMiA9IGJwZl90ZXN0bW9kX3Rlc3RfMiwKPiA+ID4gPgo+ID4gPiA+IElzIGl0IHNhZmUgdG8g
bWFrZSBfX2JwZl90ZXN0bW9kX29wcyBjb25zdCBoZXJlPyBJbiBicGZfdGVzdG1vZF9pbml0KCks
Cj4gPiA+ID4gdGhpcyBzdHJ1Y3QgaXMgbW9kaWZpZWQgYXQgcnVudGltZToKPiA+ID4gPgo+ID4g
PiA+ICAgICB0cmFtcCA9ICh2b2lkICoqKSZfX2JwZl90ZXN0bW9kX29wcy50cmFtcF8xOwo+ID4g
PiA+ICAgICB3aGlsZSAodHJhbXAgPD0gKHZvaWQgKiopJl9fYnBmX3Rlc3Rtb2Rfb3BzLnRyYW1w
XzQwKQo+ID4gPiA+ICAgICAgICAgKnRyYW1wKysgPSBicGZfdGVzdG1vZF90cmFtcDsKPiA+ID4g
Pgo+ID4gPiA+IFdyaXRpbmcgdG8gYSBjb25zdC1xdWFsaWZpZWQgb2JqZWN0IGlzIHVuZGVmaW5l
ZCBiZWhhdmlvciBhbmQgbWF5IGNhdXNlIGEKPiA+ID4gPiBwcm90ZWN0aW9uIGZhdWx0IHdoZW4g
dGhlIGNvbXBpbGVyIHBsYWNlcyB0aGlzIGluIHJlYWQtb25seSBtZW1vcnkuIFdvdWxkCj4gPiA+
ID4gdGhlIG1vZHVsZSBmYWlsIHRvIGxvYWQgb24gc3lzdGVtcyB3aGVyZSAucm9kYXRhIGlzIGFj
dHVhbGx5IHJlYWQtb25seT8KPiA+ID4KPiA+ID4gWXVwLCB0aGF0J3MgaW5kZWVkIHRoZSBidWcg
Y2F1Z2h0IGJ5IEtBU0FOLiBNaXNzZWQgdGhpcyBtdXRhdGlvbiBhdAo+ID4gPiBpbml0IHRpbWUs
IEknbGwgbGVhdmUgX19icGZfdGVzdG1vZF9vcHMgYXMgbXV0YWJsZS4KPiA+Cj4gPiBOby4gWW91
J3JlIG1pc3NpbmcgdGhlIHBvaW50LiBUaGUgd2hvbGUgcGF0Y2ggc2V0IGlzIG5vIGdvLgo+ID4g
VGhlIHBvaW50ZXIgdG8gY2ZpIHN0dWIgY2FuIGJlIHVwZGF0ZWQganVzdCBhcyB3ZWxsLgo+Cj4g
RG8geW91IG1lYW4gdGhlIEJQRiBjb3JlIGNvZGUgd291bGQgbW9kaWZ5IHRoZSBzdHJ1Y3QgcG9p
bnRlZCB0byBieQo+IGNmaV9zdHVicz8gT3Igc29tZSBCUEYgc3RydWN0X29wcyBpbXBsZW1lbnRh
dGlvbiAobGlrZSB0aGlzIG9uZSBpbgo+IGJwZl90ZXN0bW9kLmMpIHdvdWxkIG1vZGlmeSBpdD8g
SWYgeW91J3JlIHRhbGtpbmcgYWJvdXQgdGhlIEJQRiBjb3JlCj4gY29kZSwgY291bGQgeW91IHBv
aW50IG91dCB3aGVyZSB0aGlzIGhhcHBlbnM/IEkgY291bGRuJ3QgZmluZCBpdCB3aGVuCj4gbG9v
a2luZyB0aHJvdWdoIHRoZSBoYW5kZnVsIG9mIHVzZXMgb2YgY2ZpX3N0dWJzIChzZWUgcGF0Y2gg
MS81KS4gT3IKPiBhcmUgeW91IHRhbGtpbmcgYWJvdXQgc29tZSBoeXBvdGhldGljYWwgZnV0dXJl
IGNvZGUgdGhhdCB3b3VsZCB3cml0ZQo+IHRocm91Z2ggdGhlIGNmaV9zdHVicyBwb2ludGVyPyBJ
ZiB5b3UncmUgdGFsa2luZyBhYm91dCBhIHN0cnVjdF9vcHMKPiBpbXBsZW1lbnRhdGlvbiwgSSBj
ZXJ0YWlubHkgYWdyZWUgaXQgY291bGQgbW9kaWZ5IHRoZSBzdHJ1Y3QgcG9pbnRlZAo+IHRvIGJ5
IGNmaV9zdHVicyAoYmVmb3JlIGNhbGxpbmcgcmVnaXN0ZXJfYnBmX3N0cnVjdF9vcHMoKSkuIEJ1
dCB0aGVuCj4gdGhlIHN0cnVjdF9vcHMgaW1wbGVtZW50YXRpb24gZG9lc24ndCBoYXZlIHRvIGRl
Y2xhcmUgdGhlIGdsb2JhbAo+IHZhcmlhYmxlIGFzIGNvbnN0LiBBIG5vbi1jb25zdCBwb2ludGVy
IGlzIGFsbG93ZWQgYW55d2hlcmUgYSBjb25zdAo+IHBvaW50ZXIgaXMgZXhwZWN0ZWQuCgpZb3Un
cmUgc2F5aW5nIHRoYXQgdm9pZCBjb25zdCAqIGNmaV9zdHViczsgcG9pbnRpbmcgdG8gbm9uLWNv
bnN0Cl9fYnBmX3Rlc3Rtb2Rfb3BzIGlzIHNvbWVob3cgb2s/IE5vLiBUaGlzIHJpZ2h0IGludG8g
dW5kZWZpbmVkIGJlaGF2aW9yLgpOb3QgZ29pbmcgdG8gYWxsb3cgdGhhdC4KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBs
aXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1t
ZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
