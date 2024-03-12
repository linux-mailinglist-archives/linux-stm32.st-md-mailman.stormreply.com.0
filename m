Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E003878C9E
	for <lists+linux-stm32@lfdr.de>; Tue, 12 Mar 2024 02:56:32 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 22B03C6DD9D;
	Tue, 12 Mar 2024 01:56:32 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 99A94C6DD73
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Mar 2024 01:56:30 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-33e99915809so1188537f8f.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Mar 2024 18:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710208590; x=1710813390;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EfRRhmqpYXn/+hf3x4Zj15gOPBE5rQPEx7SCKgl1o/o=;
 b=cBMF+1fF21hlp0gOVRm+52wuJKou6jUewysBTRNDtwz1Vi5nV2APHdUcGHjLMMmWMC
 waeXglj/wLZtnDWEzMOHMujsCdpaqgA3jY/MVDNRJYApTcZ8Dhdlf/Hlzu18RAp4PlRJ
 rBdzPiFaqMVOUYQKde68+AgOkblfgetwJpPLJuGRblmnpTicAy4KSTlV2ZNY4hdjy8GZ
 rfQI1PRMPrGjUlTGWhHrephtkPGe3ueKbAN/8zUrxli8cWjiTUwOKrLDZz0iEbQlFo+r
 c96yviZpSW54xCQXz/rABRfeZc4cdSR6h/vQoSWno0vcTfdq3zch16xlVN+c1cLlV5J0
 U4wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710208590; x=1710813390;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EfRRhmqpYXn/+hf3x4Zj15gOPBE5rQPEx7SCKgl1o/o=;
 b=HpSv2lVI/1iITDrX3kg2unRQ0RRVQRPBeKe9w34Fc6zLTAnc0x6IIBxUfXtV1lxc0J
 xzcY29BgFx6Uy73Z9pNJhRwNb+xsstabdGzDusCg5ZVygwfdzq4sW288JMtL5VRwaID9
 jWcBnBO5v4ZR/V8VP195br1oOh4A3hL83QTNWX3l4F43pUZc6hZD2NIsj2dob+96GRJA
 yJZDf3D2J+ttWYgZP3g+LPeDJZmYb6Id3zgJslUpONA6lKIVvv/0/EZ+qGCAa0hhYMi4
 +3W1jDG4uMOo8C3Adb5B5tZ9PfcS9ha7i5vwYg28IQjf+XhdUiCC6YulPCWIf6rquiih
 Z7zQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXbuSNOHBFGcImsN2UPemediBhImVrRY3O/WDp+yGXPeLUdCgQ+Tb8tleZRaDTSyM+JjKJhqGCRBYdy7zqDx/NefUVJH3gW9LeFij7UVuU7EikzPmo2W8mN
X-Gm-Message-State: AOJu0YzXwPO/lhulEt+HXGlzcHWq0dI64C650X+W2q4XxbXQKBMkwyMH
 NLObDcfpx1tcGCrqWUDYn4b5RinHPA4pYJ5Q9RBH2O0G/70SmeWTGLPOtMfsyEQNkSVdhAZj6el
 651lLViD3kmRMD4LCQem0aGLYB2Q=
X-Google-Smtp-Source: AGHT+IG7xsAdm+wS5oFq5b1jjL8oBRBQgSVipKjCrWRkHMT37wKqdMMIKRlqjVh9M9fPohkxT6A/kQN+ZA/9RtegLYA=
X-Received: by 2002:a5d:498f:0:b0:33e:fd3:8f4e with SMTP id
 r15-20020a5d498f000000b0033e0fd38f4emr5186878wrq.14.1710208589943; Mon, 11
 Mar 2024 18:56:29 -0700 (PDT)
MIME-Version: 1.0
References: <20240311093526.1010158-1-dongmenglong.8@bytedance.com>
 <20240311093526.1010158-9-dongmenglong.8@bytedance.com>
In-Reply-To: <20240311093526.1010158-9-dongmenglong.8@bytedance.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Mon, 11 Mar 2024 18:56:18 -0700
Message-ID: <CAADnVQK+s3XgSYhpSdh7_9Qhq4DimmSO-D9d5+EsSZQMX4TxxA@mail.gmail.com>
To: Menglong Dong <dongmenglong.8@bytedance.com>
Cc: "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, Alexei Starovoitov <ast@kernel.org>,
 Song Liu <song@kernel.org>, Stanislav Fomichev <sdf@google.com>,
 Yonghong Song <yonghong.song@linux.dev>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 linux-s390 <linux-s390@vger.kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, X86 ML <x86@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>, Andrii Nakryiko <andrii@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Quentin Monnet <quentin@isovalent.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 linux-trace-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>,
 KP Singh <kpsingh@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Hao Luo <haoluo@google.com>, Network Development <netdev@vger.kernel.org>,
 David Ahern <dsahern@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 Eddy Z <eddyz87@gmail.com>, Sven Schnelle <svens@linux.ibm.com>,
 Jiri Olsa <jolsa@kernel.org>, bpf <bpf@vger.kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH bpf-next v2 8/9] libbpf: add support for
	the multi-link of tracing
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

T24gTW9uLCBNYXIgMTEsIDIwMjQgYXQgMjozNeKAr0FNIE1lbmdsb25nIERvbmcKPGRvbmdtZW5n
bG9uZy44QGJ5dGVkYW5jZS5jb20+IHdyb3RlOgo+Cj4KPiAtICAgICAgICAgICAgICAgZXJyID0g
bGliYnBmX2ZpbmRfYXR0YWNoX2J0Zl9pZChwcm9nLCBhdHRhY2hfbmFtZSwgJmJ0Zl9vYmpfZmQs
ICZidGZfdHlwZV9pZCk7Cj4gKyAgICAgICAgICAgICAgIG5hbWVfZW5kID0gc3RyY2hyKGF0dGFj
aF9uYW1lLCAnLCcpOwo+ICsgICAgICAgICAgICAgICAvKiBmb3IgbXVsdGktbGluayB0cmFjaW5n
LCB1c2UgdGhlIGZpcnN0IHRhcmdldCBzeW1ib2wgZHVyaW5nCj4gKyAgICAgICAgICAgICAgICAq
IGxvYWRpbmcuCj4gKyAgICAgICAgICAgICAgICAqLwo+ICsgICAgICAgICAgICAgICBpZiAoKGRl
ZiAmIFNFQ19BVFRBQ0hfQlRGX01VTFRJKSAmJiBuYW1lX2VuZCkgewo+ICsgICAgICAgICAgICAg
ICAgICAgICAgIGludCBsZW4gPSBuYW1lX2VuZCAtIGF0dGFjaF9uYW1lICsgMTsKPiArICAgICAg
ICAgICAgICAgICAgICAgICBjaGFyICpmaXJzdF90Z3Q7Cj4gKwo+ICsgICAgICAgICAgICAgICAg
ICAgICAgIGZpcnN0X3RndCA9IG1hbGxvYyhsZW4pOwo+ICsgICAgICAgICAgICAgICAgICAgICAg
IGlmICghZmlyc3RfdGd0KQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJu
IC1FTk9NRU07Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgc3RybmNweShmaXJzdF90Z3QsIGF0
dGFjaF9uYW1lLCBsZW4pOwo+ICsgICAgICAgICAgICAgICAgICAgICAgIGZpcnN0X3RndFtsZW4g
LSAxXSA9ICdcMCc7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgZXJyID0gbGliYnBmX2ZpbmRf
YXR0YWNoX2J0Zl9pZChwcm9nLCBmaXJzdF90Z3QsICZidGZfb2JqX2ZkLAo+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJmJ0Zl90eXBlX2lk
KTsKPiArICAgICAgICAgICAgICAgICAgICAgICBmcmVlKGZpcnN0X3RndCk7Cj4gKyAgICAgICAg
ICAgICAgIH0gZWxzZSB7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgZXJyID0gbGliYnBmX2Zp
bmRfYXR0YWNoX2J0Zl9pZChwcm9nLCBhdHRhY2hfbmFtZSwgJmJ0Zl9vYmpfZmQsCj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAmYnRmX3R5
cGVfaWQpOwo+ICsgICAgICAgICAgICAgICB9CgpQbHMgdXNlIGdsb2JfbWF0Y2ggdGhlIHdheSBb
a3VdcHJvYmUgbXVsdGkgYXJlIGRvaW5nCmluc3RlYWQgb2YgZXhhY3QgbWF0Y2guCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxp
bmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8v
c3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMy
Cg==
