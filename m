Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 998B4CF22CE
	for <lists+linux-stm32@lfdr.de>; Mon, 05 Jan 2026 08:16:30 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 55A3DC7BF6A;
	Mon,  5 Jan 2026 07:16:30 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BC4F2C8F27D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 Jan 2026 16:19:17 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-29f3018dfc3so38827585ad.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 02 Jan 2026 08:19:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1767370756; cv=none;
 d=google.com; s=arc-20240605;
 b=THkHDbK9zenn+SWdokat+ICnO7GIL+IyzftuD1+d1GHTSh0OTl4rBqoU3H78OLcWcq
 1bQMvuTzFA2W62weYQwaNQc47vcc246vXQKCNjs4BKTTwW1cqo4+gbPCVN5gwu09UoNs
 /OovP/3LW7U242xxgNMsuho429dDhFcVPh6GFbwuXvOrzHBNmPUbPfPbR/+rkuov6WiB
 7f4LcJ/+FGQFTs2Cqd2iqahUlGpZSIKJDFr8Le/hKbDuIjqW9AUr66nnKjOvlrUrcIFL
 HgDqY3uPSEFa87BuCJOGevr7R6D7RCVeZTyhI2XVyOoqnb+c1C93ey9DnBq8dhWvpicb
 YHAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=FPr557U2HvOHmBjLr/Ni2LmdX/a30qSDiDUWeBgkK/Y=;
 fh=d9BTB5BV+82yJjwPx+QnsOwirdFQmqDTSclStocd5ZA=;
 b=RM1/lOm8mylL0Eg56EP2+gBZB/ZjJ5UM2JcFfcw3drMVNu4IBafLpUDBA9A4RZcMrn
 NFM3C0G2SWScHwSQpxwVHgvsb/vLbKzpNdBUGyUdIHJsS5V5SptQRwVqrJoXJ1Jde0bc
 teQNaK0G5j8XWan6f/p1YqbtywYrEGIN1rxjbyId3JIoCK22MfpEZxivrXe/QkY7EXgg
 golwWgQt6z6wMuervvZtLo97hEXh44udvRiPwbdZt2JamnPcxHlp32y6GkW7B9PfjFcK
 Vry5igatxPsHyZ/3+IQ3hXmWr862BbspynA6RkRtnZQgOIur2j0cwW8E/jw/ffeEnH7Z
 ofWw==; darn=st-md-mailman.stormreply.com
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=purestorage.com; s=google2022; t=1767370756; x=1767975556;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FPr557U2HvOHmBjLr/Ni2LmdX/a30qSDiDUWeBgkK/Y=;
 b=U3vPQ4GbShwIlxFlTK5yGmdY4wTx3qkSxCVf7HAn1l/ayuTPDqoxOWjnUAA7bkfMCc
 SUdVMv+XYYgzLFW6h+q2ih/ghUXlT0/SdBzcZuTycO1ytuYSjgSHvEjB3djv3SIDW5HX
 DILcMaEo3Us5ktUCPY6ejeZBzaf9Bf7tXNpnhoMZUWuAx9/aDmVxhhSzjjqOGgkY/S/h
 DnY+W4E4SpBHeSp4+xsnGANEP3KbSiRGFjCbJzcBhQqc/FH7raA3TUbLVyz3tp7k58gG
 iCsnyAPpBaGf7ptKh4sHhIHrdlcO8+lqB6kG4NEPl8t2WcjIRpTFQHpC0RJp6XS5i74E
 0yzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767370756; x=1767975556;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=FPr557U2HvOHmBjLr/Ni2LmdX/a30qSDiDUWeBgkK/Y=;
 b=kicUfzvtXMIqC2kojmY/6fMeLFkf8h/zkFKbRpYfiBxUf0cYWRduvM8OUX+ohwna2s
 DfMyMs1U49Fd9xs+dmz4zU22gbVxNLZjFFrKzzieRCRny3LjQZ5N1qzOuVAOad+3Yzxj
 HwzNQAN+ugOOQDW0KLaokuy1/jVJTB3Urg4rM84lwupUFnOFLOG/P1FIoHEJC6eVQm1z
 4xZtrAZx0eD/N10SuOYl3VtoI1tHeM3w+KfmkGyegDTXtfzDmV21XiETrMbiJKob9tbp
 aBMUfrGmuqgtBkddDRnK1x8rd/Tnu6+twwi6wOnJzyoQF6T1O29t9T74HTp4NdJID2US
 cIdg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU7dvTIYMJqLrbjNqx2dtoshkJPzXDefxrfH2i6TkohvYwjs/PZ42qmp2ibZI5G2/aIO3IpXiGDEmYmBA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yw5GM1cdwBioXuYWpbdVRK615Llxg8yewrvOkCZuMVJUMkzTo/M
 kdovgw7UcoA1ZP/wg/kqw+oAuatOV5amiEkaF8t0E7KVRmlsOW6d7+VBuG4pEthhZdDql0IaYHc
 W8RBTXolR2vr1AkabzMPeUvEJE/lCMgdAAFMDzBY8og==
X-Gm-Gg: AY/fxX71nTLxewh5OOie2ZGv7p2TCgqTfw45TcOn6Y9Plen/ysB+OtEjuyAwNUoPJTT
 Iy1nAW4KCZeQ/2SlQa8EodEB7EaTdceQ9Y3NHYdTEsGiBzb6zytVolLr4qjnBV9RSAUBHfS6BAI
 Js9j89quQLLlaqKtBhn0YnP+9TkAyohlq5v7LJayLjR3PBBh6XY0QTwwjtSIPlVskUNk+XtZYyZ
 tD2U6WlTiX5xWyNYvWVU0uT6aNyIB0/NhY4vDpW1jous7A/ZH0W4G6R5fz+gJczGkpmD6o7
X-Google-Smtp-Source: AGHT+IF/IKaol6q06drc0jUZGfDObMCMgUc7sJGF0Pzcwx7Y3zyiL6BNsG9paslEQz3RmfOfMLaSPRZ7OEsv3ldvgtU=
X-Received: by 2002:a05:7022:6194:b0:11d:faef:21c2 with SMTP id
 a92af1059eb24-121722b44b3mr21225084c88.2.1767370755580; Fri, 02 Jan 2026
 08:19:15 -0800 (PST)
MIME-Version: 1.0
References: <20251231173633.3981832-6-csander@purestorage.com>
 <e9a1bd633fb4bb3d2820f63f41a8dd60d8c9c5e3c699fa56057ae393ef2f31d0@mail.kernel.org>
 <CADUfDZpSSikiZ8d8eWvfucj=Cvhc=k-sHN03EVExGBQ4Lx+23Q@mail.gmail.com>
 <CAADnVQKXUUNn=P=2-UECF1X7SR+oqm4xsr-2trpgTy1q+0c5FQ@mail.gmail.com>
 <CADUfDZq5Bf8mVD9o=VHsUqYgqyMJx82_fhy73ZzkvawQi2Ko2g@mail.gmail.com>
 <CAADnVQJ0Xhmx0ZyTKbWqaiiX7QwghMznzjDL1CNmraXM4d+T7A@mail.gmail.com>
In-Reply-To: <CAADnVQJ0Xhmx0ZyTKbWqaiiX7QwghMznzjDL1CNmraXM4d+T7A@mail.gmail.com>
From: Caleb Sander Mateos <csander@purestorage.com>
Date: Fri, 2 Jan 2026 11:19:02 -0500
X-Gm-Features: AQt7F2oEXplVk5UGATVc_njCcDbZ0oTjVxxZL8Y_v3dZVS7iVDarJ5ogQAkD16Y
Message-ID: <CADUfDZppy2CQjZ9La=RcBL5XeKY66Eq7Rr1JD6byuip_GPrMEg@mail.gmail.com>
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

T24gV2VkLCBEZWMgMzEsIDIwMjUgYXQgNjoxMOKAr1BNIEFsZXhlaSBTdGFyb3ZvaXRvdgo8YWxl
eGVpLnN0YXJvdm9pdG92QGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBPbiBXZWQsIERlYyAzMSwgMjAy
NSBhdCA0OjI44oCvUE0gQ2FsZWIgU2FuZGVyIE1hdGVvcwo+IDxjc2FuZGVyQHB1cmVzdG9yYWdl
LmNvbT4gd3JvdGU6Cj4gPgo+ID4gT24gV2VkLCBEZWMgMzEsIDIwMjUgYXQgMTA6MTPigK9BTSBB
bGV4ZWkgU3Rhcm92b2l0b3YKPiA+IDxhbGV4ZWkuc3Rhcm92b2l0b3ZAZ21haWwuY29tPiB3cm90
ZToKPiA+ID4KPiA+ID4gT24gV2VkLCBEZWMgMzEsIDIwMjUgYXQgMTA6MDnigK9BTSBDYWxlYiBT
YW5kZXIgTWF0ZW9zCj4gPiA+IDxjc2FuZGVyQHB1cmVzdG9yYWdlLmNvbT4gd3JvdGU6Cj4gPiA+
ID4KPiA+ID4gPiBPbiBXZWQsIERlYyAzMSwgMjAyNSBhdCAxMDowNOKAr0FNIDxib3QrYnBmLWNp
QGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4gPiA+ID4KPiA+ID4gPiA+ID4gZGlmZiAtLWdpdCBhL3Rv
b2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2JwZi90ZXN0X2ttb2RzL2JwZl90ZXN0bW9kLmMgYi90b29s
cy90ZXN0aW5nL3NlbGZ0ZXN0cy9icGYvdGVzdF9rbW9kcy9icGZfdGVzdG1vZC5jCj4gPiA+ID4g
PiA+IGluZGV4IDkwYzRiMWE1MWRlNi4uNWU0NjBiMWRiZGI2IDEwMDY0NAo+ID4gPiA+ID4gPiAt
LS0gYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9icGYvdGVzdF9rbW9kcy9icGZfdGVzdG1vZC5j
Cj4gPiA+ID4gPiA+ICsrKyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2JwZi90ZXN0X2ttb2Rz
L2JwZl90ZXN0bW9kLmMKPiA+ID4gPiA+Cj4gPiA+ID4gPiBbIC4uLiBdCj4gPiA+ID4gPgo+ID4g
PiA+ID4gPiBAQCAtMTI3NSw3ICsxMjc1LDcgQEAgYnBmX3Rlc3Rtb2Rfb3BzX190ZXN0X3JldHVy
bl9yZWZfa3B0cihpbnQgZHVtbXksIHN0cnVjdCB0YXNrX3N0cnVjdCAqdGFza19fcmVmLAo+ID4g
PiA+ID4gPiAgICAgICByZXR1cm4gTlVMTDsKPiA+ID4gPiA+ID4gIH0KPiA+ID4gPiA+ID4KPiA+
ID4gPiA+ID4gLXN0YXRpYyBzdHJ1Y3QgYnBmX3Rlc3Rtb2Rfb3BzIF9fYnBmX3Rlc3Rtb2Rfb3Bz
ID0gewo+ID4gPiA+ID4gPiArc3RhdGljIGNvbnN0IHN0cnVjdCBicGZfdGVzdG1vZF9vcHMgX19i
cGZfdGVzdG1vZF9vcHMgPSB7Cj4gPiA+ID4gPiA+ICAgICAgIC50ZXN0XzEgPSBicGZfdGVzdG1v
ZF90ZXN0XzEsCj4gPiA+ID4gPiA+ICAgICAgIC50ZXN0XzIgPSBicGZfdGVzdG1vZF90ZXN0XzIs
Cj4gPiA+ID4gPgo+ID4gPiA+ID4gSXMgaXQgc2FmZSB0byBtYWtlIF9fYnBmX3Rlc3Rtb2Rfb3Bz
IGNvbnN0IGhlcmU/IEluIGJwZl90ZXN0bW9kX2luaXQoKSwKPiA+ID4gPiA+IHRoaXMgc3RydWN0
IGlzIG1vZGlmaWVkIGF0IHJ1bnRpbWU6Cj4gPiA+ID4gPgo+ID4gPiA+ID4gICAgIHRyYW1wID0g
KHZvaWQgKiopJl9fYnBmX3Rlc3Rtb2Rfb3BzLnRyYW1wXzE7Cj4gPiA+ID4gPiAgICAgd2hpbGUg
KHRyYW1wIDw9ICh2b2lkICoqKSZfX2JwZl90ZXN0bW9kX29wcy50cmFtcF80MCkKPiA+ID4gPiA+
ICAgICAgICAgKnRyYW1wKysgPSBicGZfdGVzdG1vZF90cmFtcDsKPiA+ID4gPiA+Cj4gPiA+ID4g
PiBXcml0aW5nIHRvIGEgY29uc3QtcXVhbGlmaWVkIG9iamVjdCBpcyB1bmRlZmluZWQgYmVoYXZp
b3IgYW5kIG1heSBjYXVzZSBhCj4gPiA+ID4gPiBwcm90ZWN0aW9uIGZhdWx0IHdoZW4gdGhlIGNv
bXBpbGVyIHBsYWNlcyB0aGlzIGluIHJlYWQtb25seSBtZW1vcnkuIFdvdWxkCj4gPiA+ID4gPiB0
aGUgbW9kdWxlIGZhaWwgdG8gbG9hZCBvbiBzeXN0ZW1zIHdoZXJlIC5yb2RhdGEgaXMgYWN0dWFs
bHkgcmVhZC1vbmx5Pwo+ID4gPiA+Cj4gPiA+ID4gWXVwLCB0aGF0J3MgaW5kZWVkIHRoZSBidWcg
Y2F1Z2h0IGJ5IEtBU0FOLiBNaXNzZWQgdGhpcyBtdXRhdGlvbiBhdAo+ID4gPiA+IGluaXQgdGlt
ZSwgSSdsbCBsZWF2ZSBfX2JwZl90ZXN0bW9kX29wcyBhcyBtdXRhYmxlLgo+ID4gPgo+ID4gPiBO
by4gWW91J3JlIG1pc3NpbmcgdGhlIHBvaW50LiBUaGUgd2hvbGUgcGF0Y2ggc2V0IGlzIG5vIGdv
Lgo+ID4gPiBUaGUgcG9pbnRlciB0byBjZmkgc3R1YiBjYW4gYmUgdXBkYXRlZCBqdXN0IGFzIHdl
bGwuCj4gPgo+ID4gRG8geW91IG1lYW4gdGhlIEJQRiBjb3JlIGNvZGUgd291bGQgbW9kaWZ5IHRo
ZSBzdHJ1Y3QgcG9pbnRlZCB0byBieQo+ID4gY2ZpX3N0dWJzPyBPciBzb21lIEJQRiBzdHJ1Y3Rf
b3BzIGltcGxlbWVudGF0aW9uIChsaWtlIHRoaXMgb25lIGluCj4gPiBicGZfdGVzdG1vZC5jKSB3
b3VsZCBtb2RpZnkgaXQ/IElmIHlvdSdyZSB0YWxraW5nIGFib3V0IHRoZSBCUEYgY29yZQo+ID4g
Y29kZSwgY291bGQgeW91IHBvaW50IG91dCB3aGVyZSB0aGlzIGhhcHBlbnM/IEkgY291bGRuJ3Qg
ZmluZCBpdCB3aGVuCj4gPiBsb29raW5nIHRocm91Z2ggdGhlIGhhbmRmdWwgb2YgdXNlcyBvZiBj
Zmlfc3R1YnMgKHNlZSBwYXRjaCAxLzUpLiBPcgo+ID4gYXJlIHlvdSB0YWxraW5nIGFib3V0IHNv
bWUgaHlwb3RoZXRpY2FsIGZ1dHVyZSBjb2RlIHRoYXQgd291bGQgd3JpdGUKPiA+IHRocm91Z2gg
dGhlIGNmaV9zdHVicyBwb2ludGVyPyBJZiB5b3UncmUgdGFsa2luZyBhYm91dCBhIHN0cnVjdF9v
cHMKPiA+IGltcGxlbWVudGF0aW9uLCBJIGNlcnRhaW5seSBhZ3JlZSBpdCBjb3VsZCBtb2RpZnkg
dGhlIHN0cnVjdCBwb2ludGVkCj4gPiB0byBieSBjZmlfc3R1YnMgKGJlZm9yZSBjYWxsaW5nIHJl
Z2lzdGVyX2JwZl9zdHJ1Y3Rfb3BzKCkpLiBCdXQgdGhlbgo+ID4gdGhlIHN0cnVjdF9vcHMgaW1w
bGVtZW50YXRpb24gZG9lc24ndCBoYXZlIHRvIGRlY2xhcmUgdGhlIGdsb2JhbAo+ID4gdmFyaWFi
bGUgYXMgY29uc3QuIEEgbm9uLWNvbnN0IHBvaW50ZXIgaXMgYWxsb3dlZCBhbnl3aGVyZSBhIGNv
bnN0Cj4gPiBwb2ludGVyIGlzIGV4cGVjdGVkLgo+Cj4gWW91J3JlIHNheWluZyB0aGF0IHZvaWQg
Y29uc3QgKiBjZmlfc3R1YnM7IHBvaW50aW5nIHRvIG5vbi1jb25zdAo+IF9fYnBmX3Rlc3Rtb2Rf
b3BzIGlzIHNvbWVob3cgb2s/IE5vLiBUaGlzIHJpZ2h0IGludG8gdW5kZWZpbmVkIGJlaGF2aW9y
Lgo+IE5vdCBnb2luZyB0byBhbGxvdyB0aGF0LgoKSG93IGlzIHRoYXQgdW5kZWZpbmVkIGJlaGF2
aW9yPyBXb3VsZG4ndCB0aGUgZm9sbG93aW5nIGJlIFVCIGJ5IHRoZQpzYW1lIHJlYXNvbmluZz8K
CnZvaWQgdGFrZXNfY29uc3QoY29uc3QgaW50ICp4KTsKCnZvaWQgZih2b2lkKQp7CiAgICAgICAg
aW50IG5vdF9jb25zdCA9IDEyMzsKICAgICAgICB0YWtlc19jb25zdCgmbm90X2NvbnN0KTsKfQoK
QSBjb25zdC1xdWFsaWZpZWQgcG9pbnRlciB0eXBlIGp1c3QgcHJldmVudHMgdGhhdCBwb2ludGVy
IGZyb20gYmVpbmcKdXNlZCB0byBtdXRhdGUgdGhlIG1lbW9yeSBpdCBwb2ludHMgdG8uIEl0IGRv
ZXNuJ3QgZ3VhcmFudGVlIHRoYXQgdGhlCm1lbW9yeSBpdCBwb2ludHMgdG8gaXMgbWFya2VkIHJl
YWRvbmx5LgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJl
cGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0
aW5mby9saW51eC1zdG0zMgo=
