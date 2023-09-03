Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 33100790A93
	for <lists+linux-stm32@lfdr.de>; Sun,  3 Sep 2023 04:44:29 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C81CBC6A613;
	Sun,  3 Sep 2023 02:44:28 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com
 [209.85.219.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8489AC65E4C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  3 Sep 2023 02:44:27 +0000 (UTC)
Received: by mail-qv1-f43.google.com with SMTP id
 6a1803df08f44-64914f08c65so2679336d6.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 02 Sep 2023 19:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693709066; x=1694313866;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=t1GAPNmXBdNBOSiPidq4SuOnNGpXyf62DRjoqSlEOKo=;
 b=pc1N+W4NRVBisMRj6kE6ZAZOBieU6lVwNC3OxRjWElBT85BG02O/KX3yOn4pj2nbsT
 hDIxH5uKR+D0pK86X5QybnA1THyYxqOSPYaWZG+pHFdXkK9LUqrsL/R00coO7kDWU5eO
 l/tLyjS/FWf14uJ+xckJh84nVHQHgFL0Lj1eOmkK9uQbcQNFn67ApVDv5O9pYolIGI/C
 c79Mq0njtqbrsKBqQ1KdsyWe0MzBU198vaj6/eXchPylxlmXk4JirHGopqSnxGhQHdTk
 cGOyb7MIjqrl2xnvfYI/cO8VpLSeFm2Lhbb8SQySy7ajtkL6bHW4z3GeJfD/xuXk1vjA
 ZdsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693709066; x=1694313866;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=t1GAPNmXBdNBOSiPidq4SuOnNGpXyf62DRjoqSlEOKo=;
 b=BLDr+k33X37zjCSKHCO0Qs7+Ehu9OhR2EBtHIyJRk95B4wo7O1khz9l08EM2gz7mbu
 n4LqR8L/ZNjwnYiYX+D4bG5a0xRk3Tq/96WUKW/iXx2kom7p/IhbXCLQ9fj0KjpfjCkL
 TDsS0SlQthoBu+gL1qFs9iW6A4QEfVFPkmEGw8c5J1ceDB2gY9748iIeq40ahpMfSef+
 /kIPSwi0YbIYxK8JGpTiC2ChEl/OdJLIoPYnhQIAxen69Wq26vdZCNXIRekcURESfGGq
 KKZsZSTvZAxGJw07dO54xEo405b30WYyLyzuVCskK0AJT6QXGfTo1VCQV+LXMwOPk7RV
 zVUw==
X-Gm-Message-State: AOJu0YyxKdiBr2OjSIvk1kUC4IasJUaE5c0zXmiMyAVnSZsMmJozIa72
 3YtVuH513L76D802dIBiXxO+36ma6iXWEbDU4zY=
X-Google-Smtp-Source: AGHT+IHbSGrDC3xasIMg2h9SHHXg5ol1Cyq5w/p/l2eUSGrtnMxS0UghYfA4zwp55tXGNfaK7lqcxQoRN5HcF/N9iTw=
X-Received: by 2002:a0c:a9c8:0:b0:651:75a4:75b0 with SMTP id
 c8-20020a0ca9c8000000b0065175a475b0mr7632518qvb.1.1693709066298; Sat, 02 Sep
 2023 19:44:26 -0700 (PDT)
MIME-Version: 1.0
References: <tencent_4F0CF08592B31A2E69546C5E174785109F09@qq.com>
 <tencent_2B465711F30DC88514B2842F1D54005E8109@qq.com>
In-Reply-To: <tencent_2B465711F30DC88514B2842F1D54005E8109@qq.com>
From: Yafang Shao <laoar.shao@gmail.com>
Date: Sun, 3 Sep 2023 10:43:50 +0800
Message-ID: <CALOAHbDvA8yG0=ep3e+MbsWu0oeHzoDUzWGf9mzApN_4za09LQ@mail.gmail.com>
To: Rong Tao <rtoax@foxmail.com>
Cc: linux-kselftest@vger.kernel.org, ast@kernel.org, song@kernel.org,
 rongtao@cestc.cn, yonghong.song@linux.dev, shuah@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, mykolal@fb.com, daniel@iogearbox.net,
 john.fastabend@gmail.com, andrii@kernel.org, jolsa@kernel.org,
 kpsingh@kernel.org, olsajiri@gmail.com, linux-arm-kernel@lists.infradead.org,
 haoluo@google.com, linux-kernel@vger.kernel.org, mcoquelin.stm32@gmail.com,
 bpf@vger.kernel.org, martin.lau@linux.dev, sdf@google.com
Subject: Re: [Linux-stm32] [PATCH bpf-next v10 0/2] selftests/bpf: Optimize
	kallsyms cache
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

T24gU2F0LCBTZXAgMiwgMjAyMyBhdCAxOjI04oCvUE0gUm9uZyBUYW8gPHJ0b2F4QGZveG1haWwu
Y29tPiB3cm90ZToKPgo+IEhpLCBldmVyeSBvbmUuCj4KPiBJJ20gc28gc29ycnksIHRoYXQgaSdt
IG5vdCBmYW1pbGllciB3aXRoICdob3cgdG8gc3VibWl0IHBhdGNoIHNlcmllcycsCj4gSSBqdXN0
IHNlbnQgc29tZSBlbWFpbHMgcmVwZWF0ZWRseSB1c2luZyB0aGUgZ2l0IHNlbmQtZW1haWwgY29t
bWFuZCwKPiBwbGVhc2UgaWdub3JlIHRoZSBlcnJvciBtZXNzYWdlcy4KPgo+IFBTOiBIb3cgdG8g
c2VuZCBwYXRjaCBjb2xsZWN0aW9ucyB1c2luZyBnaXQgc2VuZC1lbWFpbD8KCiQgZ2l0IHNlbmQt
ZW1haWwgLS10byA8b3V0cmVhY2h5IG1haWxpbmcgbGlzdCBpZiByZXF1aXJlZD4gLS1jYwo8YWRk
cmVzc2VzIGZyb20gZ2V0X21haW50YWluZXIucGwgb3V0cHV0PiAvdG1wLyoucGF0Y2gKClNlZSBh
bHNvIHRoZSBzZWN0aW9uICJVc2luZyBnaXQgZm9ybWF0LXBhdGNoIHRvIHNlbmQgcGF0Y2hzZXRz
IiBpbgpodHRwczovL2tlcm5lbG5ld2JpZXMub3JnL0ZpcnN0S2VybmVsUGF0Y2gKCi0tIApSZWdh
cmRzCllhZmFuZwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9y
bXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9s
aXN0aW5mby9saW51eC1zdG0zMgo=
