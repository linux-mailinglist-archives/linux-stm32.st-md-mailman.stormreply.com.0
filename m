Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 265D385CD6C
	for <lists+linux-stm32@lfdr.de>; Wed, 21 Feb 2024 02:24:30 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CEE95C6B45E;
	Wed, 21 Feb 2024 01:24:29 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 23D91C69063
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Feb 2024 01:24:28 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-33d6fe64a9bso954854f8f.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Feb 2024 17:24:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708478667; x=1709083467;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QZojfwT+RxAPcmdQGaQgA+F8ssXlbPridr3vJSQMHT4=;
 b=PaOK1nKVfnf7Pa81q1GhVXGOXf/n7p6wVH+bLR5mAIgyqNJGwTizALoP6JRt8EiYUL
 7lRhpjP/QaEXe55dxFkUJJA54Vmi6uql92ONMDT+SOwh8sqPbiHhkMLI06k3lzIKe5b6
 TZ+z4UVDIMFuSvOERY3ruHAwqrOy7utzGkXD3BcWGsN2vAQDxl0F3Q2KciobvGp2xmWE
 lI7WdTLz9SciYHtOAGJ9f2yNsI/frmAsG2KIMBUt2RDLgBLMcOc7Kn7Q2WsndPxaNf0U
 drjlOV7/ojqwf6h1EUZRgOf9ydfZ9hta/kd+m2YXweAJH2smHD1/qzJvFkYUAxT+RCd2
 /Wgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708478667; x=1709083467;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QZojfwT+RxAPcmdQGaQgA+F8ssXlbPridr3vJSQMHT4=;
 b=DxwILerwtfDfXclfWEDezEEG93/XvkqcPi0pQo/GzpPzKKf5HROCfXenMl7MzVChNZ
 iysV39A/l8s4uZo4WUxJJh5zR+7nW6EMiic8xSkLjyS2ehvTdbQ4Zf8yTn2TBLzzgtFE
 +LR0RJ1/evuCu+bTMLmbuoxXZZqH8uvJvMOvPrtxNVmL3MS4s8cQTXKKY+U3AVZUUsrt
 45Zd4LoQS56V+wCJNJYZfy6uQMPoH8XbuNgmbagfl+NAP0u5D4mPJRwEY+X2RF2bg1dV
 A3EQWEw08Zz4/hO9AUqoC877mvppsFi85S8UAdlOnKX8ghZiZAQC7SDKFE2JDPLSF0Ot
 ed1g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVohev/lPR9dUJHucONkavAIbT9qf1ekZakJDZ3ovzxTY1q3iWNJH6jCswt4agGnQWBV+sZkIHBbOvF0ESvRGNTOdBQAml8VFKuIl4Z7wEC5zyOYtE6V4hH
X-Gm-Message-State: AOJu0Yx0PXc7N1oQP0i4v20UnuLADj8kltGcqFi7yHJCA17GTQkfvUsQ
 Tcu+XQlkmvlpaZIqSrmewqZhhKSUhSK8YUCPFQInh+zb4w1MeS0A3rW3K89rUE9X9mep0dXECzK
 dZ+ZAv2Vx60u/DSOQoE9t4J/uoYg=
X-Google-Smtp-Source: AGHT+IFyffuFUKOEwh8cz2anMZHoATwBV3He7T2iJSSw7NZmTRvibOeFA+SKuUw6n1BjpafmDJGA/qD3RYrvTH/2jQ4=
X-Received: by 2002:a05:6000:1e86:b0:33d:34a9:902f with SMTP id
 dd6-20020a0560001e8600b0033d34a9902fmr7166848wrb.36.1708478667438; Tue, 20
 Feb 2024 17:24:27 -0800 (PST)
MIME-Version: 1.0
References: <20240220035105.34626-1-dongmenglong.8@bytedance.com>
In-Reply-To: <20240220035105.34626-1-dongmenglong.8@bytedance.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Tue, 20 Feb 2024 17:24:16 -0800
Message-ID: <CAADnVQ+E4ygZV6dcs8wj5FdFz9bfrQ=61235uiRoxe9RqQvR9Q@mail.gmail.com>
To: Menglong Dong <dongmenglong.8@bytedance.com>
Cc: "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Dave Marchevsky <davemarchevsky@fb.com>, Song Liu <song@kernel.org>,
 Stanislav Fomichev <sdf@google.com>, Yonghong Song <yonghong.song@linux.dev>,
 Kui-Feng Lee <thinker.li@gmail.com>, Shuah Khan <shuah@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, Mykola Lysenko <mykolal@fb.com>,
 Daniel Borkmann <daniel@iogearbox.net>,
 John Fastabend <john.fastabend@gmail.com>, Andrii Nakryiko <andrii@kernel.org>,
 Feng Zhou <zhoufeng.zf@bytedance.com>, mcoquelin.stm32@gmail.com,
 Alexei Starovoitov <ast@kernel.org>, Daniel Xu <dxu@dxuuu.xyz>,
 KP Singh <kpsingh@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Hao Luo <haoluo@google.com>, LKML <linux-kernel@vger.kernel.org>,
 Eddy Z <eddyz87@gmail.com>, Jiri Olsa <jolsa@kernel.org>,
 bpf <bpf@vger.kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>
Subject: Re: [Linux-stm32] [PATCH bpf-next 0/5] bpf: make tracing program
	support multi-attach
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

T24gTW9uLCBGZWIgMTksIDIwMjQgYXQgNzo1MeKAr1BNIE1lbmdsb25nIERvbmcKPGRvbmdtZW5n
bG9uZy44QGJ5dGVkYW5jZS5jb20+IHdyb3RlOgo+Cj4gRm9yIG5vdywgdGhlIEJQRiBwcm9ncmFt
IG9mIHR5cGUgQlBGX1BST0dfVFlQRV9UUkFDSU5HIGlzIG5vdCBhbGxvd2VkIHRvCj4gYmUgYXR0
YWNoZWQgdG8gbXVsdGlwbGUgaG9va3MsIGFuZCB3ZSBoYXZlIHRvIGNyZWF0ZSBhIEJQRiBwcm9n
cmFtIGZvcgo+IGVhY2gga2VybmVsIGZ1bmN0aW9uLCBmb3Igd2hpY2ggd2Ugd2FudCB0byB0cmFj
ZSwgZXZlbiB0aHJvdWdoIGFsbCB0aGUKPiBwcm9ncmFtIGhhdmUgdGhlIHNhbWUgKG9yIHNpbWls
YXIpIGxvZ2ljLiBUaGlzIGNhbiBjb25zdW1lIGV4dHJhIG1lbW9yeSwKPiBhbmQgbWFrZSB0aGUg
cHJvZ3JhbSBsb2FkaW5nIHNsb3cgaWYgd2UgaGF2ZSBwbGVudHkgb2Yga2VybmVsIGZ1bmN0aW9u
IHRvCj4gdHJhY2UuCgpTaG91bGQgdGhpcyBiZSBjb21iaW5lZCB3aXRoIG11bHRpIGxpbmsgPwoo
QXMgd2FzIHJlY2VudGx5IGRvbmUgZm9yIGtwcm9iZV9tdWx0aSBhbmQgdXByb2JlX211bHRpKS4K
TG9hZGluZyBmZW50cnkgcHJvZyBvbmNlIGFuZCBhdHRhY2hpbmcgaXQgdGhyb3VnaCBtYW55IGJw
Zl9saW5rcwp0byBtdWx0aXBsZSBwbGFjZXMgaXMgYSBuaWNlIGFkZGl0aW9uLApidXQgd2Ugc2hv
dWxkIHByb2JhYmx5IGFkZCBhIG11bHRpIGxpbmsgcmlnaHQgYXdheSB0b28uCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcg
bGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3Qt
bWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
