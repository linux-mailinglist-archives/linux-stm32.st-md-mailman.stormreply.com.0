Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 320D4CF22C0
	for <lists+linux-stm32@lfdr.de>; Mon, 05 Jan 2026 08:16:30 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EF990C7BF6F;
	Mon,  5 Jan 2026 07:16:29 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
 [209.85.215.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6A846C0693F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 31 Dec 2025 18:09:32 +0000 (UTC)
Received: by mail-pg1-f174.google.com with SMTP id
 41be03b00d2f7-b9a2e3c4afcso426408a12.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 31 Dec 2025 10:09:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1767204571; cv=none;
 d=google.com; s=arc-20240605;
 b=ckm9EVqT6saV5QboqrZgJ76VwOpTmqu7Ie/eSSiZoXIvJCBnrT/Nn2rhfsLDM2mIjJ
 qfEgu8K37Hx5eky10lFGPUXEscB83cYJCCGiIp5u4MseS/vBLDTKwZEfo5PSd3pF1qCY
 glPdlv298xrAq9GgEx69TphEpY9DF2E4h9mFkvOTyA8a8KOC7KUzDcpad515E0tJMt2X
 wkmCfqyPdH7zsjssbRpyt7bIJ+Pe87c3WTqVHiAgebvDg6jhxkbJvHiDLF3Y+kbIs2dx
 0MWV5ooQPnt/P+59gsQDBVz8SCC2y+EtZ1aULENEJ2wRp6lNCoD0geLcWVhLASYJlUhW
 Pa1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=bIMPl7WzuufPEFhizw2OC5bzIw2A/w2Jw5N6sXr/zUI=;
 fh=oMV2OPXTlmjmfjrHoXUfa4UBckYLDBkNWJQjCC/Ibw8=;
 b=EjxcSgTb89MAp7iTQexQgTg1bVKR6esEXXqwtD4NYJKJ0BtccevGpEh7RXCwK4EcGN
 fAsm3flgYMDwFrACDHdOcy8VYSLNJ/viaO+SNWVn3TCynETW5pMEeoX9aJI4QgYDHyTg
 KvLln1+JqbPaCJRfvYCtfWF+t5ohwntl1XblMu/fe7QZMXhvpvwFT2LpnNermWzcOAty
 Uh0MYY+w0XbL8IdQBZW4bS45MJpzkauhnbJ86TPoGTTayM+QmP3eWb0iEN/zEs5gDF0Y
 ExTUH5+4Vfd7ObHxLCnvW4xDqqx97VXlKG8oQnFnYyTj8OwyUSARo38cxvauORoEmy15
 I3mw==; darn=st-md-mailman.stormreply.com
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=purestorage.com; s=google2022; t=1767204571; x=1767809371;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bIMPl7WzuufPEFhizw2OC5bzIw2A/w2Jw5N6sXr/zUI=;
 b=C6Jv1eAx1LWjQ2KTVi5qYYyn+E/U0dbPd3byYWWnWW9A4Ujdjp2LfzWS5gwJwzWvTl
 LR1uZ8tFKOonZpbvnrMUtjrn4gdCUhan1DfnEQZpLHfbjAXKqy8ieQc4BOX0bOsw4pKi
 pVXjzl3cOd8L12lXaRGC6SUb4y5oDSVbE3eYMFFocw0PbXL6y7jg7vcT9eABmP438E+J
 JPpBBpHc6f055VmWNVt/uJZXEETFSyBE2uOlNEHUvIKs4GG3M3kWeEOMVJ9jBZgWY2wm
 gx59hBK78+rIoJ/Fv5jeO5zn56wnnYEhh4wbQ/fyCGdUkdJWSENQiUbvx4tutIaFNHgG
 YthQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767204571; x=1767809371;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=bIMPl7WzuufPEFhizw2OC5bzIw2A/w2Jw5N6sXr/zUI=;
 b=tUF1zqgKmxVvBtMMXL9oV+hBbTXVg8vRMpwlbVIGa72G7wt/Gu2kGjxo56dwRMrDru
 xPzSlyht63+2tCimv9L/rQQ+mFkmkG2esjm3x422bncvvFbUgrIM+VTd/QghuqkAtgKT
 bJP9LB6jUT27rQq7/0yeki2oZsadeHNSIZOdun3BfCXMeKSAONPu7zB7bi0ysVK7wVeS
 +wk4bGwvCUmb0ntWbb97mqRHyLtm2Y841Jk/RoIePZznDo5OrP1+/D6NmaKVQo6j63Uv
 JK7QZyCtQZ0fES/jXQdrIFuLrZPuYtZqethUP1evvaFwGVbDQmIq5cHZUKF2RhV3LiFm
 1XGg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWlPeGuhAcDRQhtR7hz+Mts6TiH79evXb+TdFF8axTMgirMB7B3eX9n6vdyhSaM0nACQ/I2RbI3SedkDw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzyDrMKvTZrz+agTZbw4zn30m0AQK/0EIE7LE39U6fcC4lcuihp
 WQa7Bsx9yJzTm4co6m0Tza6Z6KNY070HS/N1hIxO6UKs8Jl/leJYeKyWaco/BtACKbo76cWVi8+
 hxkMagBLqsFmr6eMJGLIRSNBMdWbg9gMlEC2o3MXvQQ==
X-Gm-Gg: AY/fxX7y+nFb4GTHOHAwZVVl+benX7rkL+o0QT83UYUL8FGkI2KfTTZqfUKrzBstSJE
 cEpJNBIMSTt/ZnlKARn4ULKbCw7mvYaMT41ERBFOndGo27LK2Vy+5WH2aUDi3DHfI1DKwxAXQeQ
 oSirqsvPJfZOTHfSXopeHStMye/0DOe1Y3Mix1a6DkLAdVghaWitZAQ75Hrp+phygpIF6Wnvyq5
 TRUL1w1EKQsbPtT4SdPq7mwS3kiNzvJ8XQIVKh34RRnTuxt1mY4nHy0Dh9zCJiE01/vTF+b24zh
 qZLvYWc=
X-Google-Smtp-Source: AGHT+IEoQb+VMYUZF/EVHfCupM/J7UKB/HyklpfhaHst9+Iqt6sXvQ7lmZWvrOhCEyHebOWe5s6vxpHZd7OfrJbc6Sg=
X-Received: by 2002:a05:7022:6194:b0:11d:faef:21c2 with SMTP id
 a92af1059eb24-121722b44b3mr19049815c88.2.1767204570391; Wed, 31 Dec 2025
 10:09:30 -0800 (PST)
MIME-Version: 1.0
References: <20251231173633.3981832-6-csander@purestorage.com>
 <e9a1bd633fb4bb3d2820f63f41a8dd60d8c9c5e3c699fa56057ae393ef2f31d0@mail.kernel.org>
In-Reply-To: <e9a1bd633fb4bb3d2820f63f41a8dd60d8c9c5e3c699fa56057ae393ef2f31d0@mail.kernel.org>
From: Caleb Sander Mateos <csander@purestorage.com>
Date: Wed, 31 Dec 2025 13:09:19 -0500
X-Gm-Features: AQt7F2q8qmB_ZWyKhj1fKhcgEDCzRqBwfvvrWtG8WY5Jchb5VzTDRzCjSxJzD0s
Message-ID: <CADUfDZpSSikiZ8d8eWvfucj=Cvhc=k-sHN03EVExGBQ4Lx+23Q@mail.gmail.com>
To: bot+bpf-ci@kernel.org
X-Mailman-Approved-At: Mon, 05 Jan 2026 07:16:22 +0000
Cc: juri.lelli@redhat.com, linux-s390@vger.kernel.org, yonghong.song@linux.dev,
 peterz@infradead.org, sidraya@linux.ibm.com, ast@kernel.org,
 bsegall@google.com, song@kernel.org, edumazet@google.com,
 alibuda@linux.alibaba.com, void@manifault.com, tonylu@linux.alibaba.com,
 linux-stm32@st-md-mailman.stormreply.com, martin.lau@kernel.org,
 sched-ext@lists.linux.dev, vschneid@redhat.com, vincent.guittot@linaro.org,
 daniel@iogearbox.net, shuah@kernel.org, john.fastabend@gmail.com,
 andrii@kernel.org, clm@meta.com, dust.li@linux.alibaba.com, mingo@redhat.com,
 arighi@nvidia.com, linux-input@vger.kernel.org, kuba@kernel.org,
 pabeni@redhat.com, mcoquelin.stm32@gmail.com, mgorman@suse.de,
 linux-rdma@vger.kernel.org, jiri@resnulli.us, horms@kernel.org,
 haoluo@google.com, jikos@kernel.org, jhs@mojatatu.com, rostedt@goodmis.org,
 kpsingh@kernel.org, wenjia@linux.ibm.com, mjambigi@linux.ibm.com,
 xiyou.wangcong@gmail.com, dietmar.eggemann@arm.com,
 linux-arm-kernel@lists.infradead.org, bentiss@kernel.org,
 linux-kselftest@vger.kernel.org, ihor.solodrai@linux.dev, sdf@fomichev.me,
 dsahern@kernel.org, linux-kernel@vger.kernel.org, eddyz87@gmail.com,
 changwoo@igalia.com, guwen@linux.alibaba.com, jolsa@kernel.org,
 netdev@vger.kernel.org, tj@kernel.org, bpf@vger.kernel.org,
 martin.lau@linux.dev, davem@davemloft.net
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

T24gV2VkLCBEZWMgMzEsIDIwMjUgYXQgMTA6MDTigK9BTSA8Ym90K2JwZi1jaUBrZXJuZWwub3Jn
PiB3cm90ZToKPgo+ID4gZGlmZiAtLWdpdCBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2JwZi90
ZXN0X2ttb2RzL2JwZl90ZXN0bW9kLmMgYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9icGYvdGVz
dF9rbW9kcy9icGZfdGVzdG1vZC5jCj4gPiBpbmRleCA5MGM0YjFhNTFkZTYuLjVlNDYwYjFkYmRi
NiAxMDA2NDQKPiA+IC0tLSBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2JwZi90ZXN0X2ttb2Rz
L2JwZl90ZXN0bW9kLmMKPiA+ICsrKyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2JwZi90ZXN0
X2ttb2RzL2JwZl90ZXN0bW9kLmMKPgo+IFsgLi4uIF0KPgo+ID4gQEAgLTEyNzUsNyArMTI3NSw3
IEBAIGJwZl90ZXN0bW9kX29wc19fdGVzdF9yZXR1cm5fcmVmX2twdHIoaW50IGR1bW15LCBzdHJ1
Y3QgdGFza19zdHJ1Y3QgKnRhc2tfX3JlZiwKPiA+ICAgICAgIHJldHVybiBOVUxMOwo+ID4gIH0K
PiA+Cj4gPiAtc3RhdGljIHN0cnVjdCBicGZfdGVzdG1vZF9vcHMgX19icGZfdGVzdG1vZF9vcHMg
PSB7Cj4gPiArc3RhdGljIGNvbnN0IHN0cnVjdCBicGZfdGVzdG1vZF9vcHMgX19icGZfdGVzdG1v
ZF9vcHMgPSB7Cj4gPiAgICAgICAudGVzdF8xID0gYnBmX3Rlc3Rtb2RfdGVzdF8xLAo+ID4gICAg
ICAgLnRlc3RfMiA9IGJwZl90ZXN0bW9kX3Rlc3RfMiwKPgo+IElzIGl0IHNhZmUgdG8gbWFrZSBf
X2JwZl90ZXN0bW9kX29wcyBjb25zdCBoZXJlPyBJbiBicGZfdGVzdG1vZF9pbml0KCksCj4gdGhp
cyBzdHJ1Y3QgaXMgbW9kaWZpZWQgYXQgcnVudGltZToKPgo+ICAgICB0cmFtcCA9ICh2b2lkICoq
KSZfX2JwZl90ZXN0bW9kX29wcy50cmFtcF8xOwo+ICAgICB3aGlsZSAodHJhbXAgPD0gKHZvaWQg
KiopJl9fYnBmX3Rlc3Rtb2Rfb3BzLnRyYW1wXzQwKQo+ICAgICAgICAgKnRyYW1wKysgPSBicGZf
dGVzdG1vZF90cmFtcDsKPgo+IFdyaXRpbmcgdG8gYSBjb25zdC1xdWFsaWZpZWQgb2JqZWN0IGlz
IHVuZGVmaW5lZCBiZWhhdmlvciBhbmQgbWF5IGNhdXNlIGEKPiBwcm90ZWN0aW9uIGZhdWx0IHdo
ZW4gdGhlIGNvbXBpbGVyIHBsYWNlcyB0aGlzIGluIHJlYWQtb25seSBtZW1vcnkuIFdvdWxkCj4g
dGhlIG1vZHVsZSBmYWlsIHRvIGxvYWQgb24gc3lzdGVtcyB3aGVyZSAucm9kYXRhIGlzIGFjdHVh
bGx5IHJlYWQtb25seT8KCll1cCwgdGhhdCdzIGluZGVlZCB0aGUgYnVnIGNhdWdodCBieSBLQVNB
Ti4gTWlzc2VkIHRoaXMgbXV0YXRpb24gYXQKaW5pdCB0aW1lLCBJJ2xsIGxlYXZlIF9fYnBmX3Rl
c3Rtb2Rfb3BzIGFzIG11dGFibGUuCgpUaGFua3MsCkNhbGViCgo+Cj4KPiAtLS0KPiBBSSByZXZp
ZXdlZCB5b3VyIHBhdGNoLiBQbGVhc2UgZml4IHRoZSBidWcgb3IgZW1haWwgcmVwbHkgd2h5IGl0
J3Mgbm90IGEgYnVnLgo+IFNlZTogaHR0cHM6Ly9naXRodWIuY29tL2tlcm5lbC1wYXRjaGVzL3Zt
dGVzdC9ibG9iL21hc3Rlci9jaS9jbGF1ZGUvUkVBRE1FLm1kCj4KPiBDSSBydW4gc3VtbWFyeTog
aHR0cHM6Ly9naXRodWIuY29tL2tlcm5lbC1wYXRjaGVzL2JwZi9hY3Rpb25zL3J1bnMvMjA2MjQy
MDYyMjkKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBs
eS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtc3RtMzIK
