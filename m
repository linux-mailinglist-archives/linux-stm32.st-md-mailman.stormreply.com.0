Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DCAB1726009
	for <lists+linux-stm32@lfdr.de>; Wed,  7 Jun 2023 14:49:50 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 85C03C6A5E7;
	Wed,  7 Jun 2023 12:49:50 +0000 (UTC)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com
 [209.85.128.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 38570C65E58
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  7 Jun 2023 12:49:49 +0000 (UTC)
Received: by mail-yw1-f180.google.com with SMTP id
 00721157ae682-56ca07b34b1so939967b3.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 07 Jun 2023 05:49:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1686142188; x=1688734188;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8AxgroMuIH5NoBbtLc+ad3Qph59KMeN5Cm1Y0j7Ly7E=;
 b=ZbKfKcjvgFXKqwj0h5Tewi1lK9Xd76DukZKwpNIXejMBEEIVgX1ml9V5uECiRVpV9C
 qpIGXKmcNrTBr1q1m39Ibv5tpSIkf8YqnsD3sVX2jKG2S8whdARNgj06BRqknITaqsfU
 xRKVeXzvJSMs4tI9tPs9ap5Lf66e2PkfUr6L8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686142188; x=1688734188;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8AxgroMuIH5NoBbtLc+ad3Qph59KMeN5Cm1Y0j7Ly7E=;
 b=EE8Z8J+oRy67EQLFN0uRQhz1YusMpsnSl0HBzSJcsUHh+Ln2Q4msUwMrC4iUqlIXCP
 L0LbsGHwcPsWO3TkIbt3XSMzIsBXOflmDpvJQKF+DFSQTxJkjdGVl78C3jZFPijB42t4
 l/WK4jKaK3z1B8ahOVJZtBtG3rczry1OL06HMIB4A7dFsKnUTSBH/7MTO6vbg+KH+xDp
 mJK0/fJm5UNa1PG/87P4Ot7cQDr/qd167hCWcnIoNo+6HLHZB1v9Wsh+f7sGrIDSo2PE
 ygLF/rH+JlluHYjVjBeZTaF+7/Q4lhtofI3jBLwbvm6gzQB/FUCaw5/i3iND2tza7eCQ
 9krQ==
X-Gm-Message-State: AC+VfDzMTkZl90N8YTVCYmi+VgVczein2/UIWK4JnF3KiU257RhpqHJr
 It1ZsV7LL1ek+ug215JVPa2FvWSaVfOGCRatoJx0qg==
X-Google-Smtp-Source: ACHHUZ7hBI1yQy3hOqMs3IywMmiWVgkBaT4CmmHgTUdbu1gUndSUOaqBclPy1zulKt9pLMxC7qjpriQ1ztOABz2tp58=
X-Received: by 2002:a81:834b:0:b0:568:b6a5:9100 with SMTP id
 t72-20020a81834b000000b00568b6a59100mr6838026ywf.42.1686142188079; Wed, 07
 Jun 2023 05:49:48 -0700 (PDT)
MIME-Version: 1.0
References: <20230607063139.621351-1-dario.binacchi@amarulasolutions.com>
 <20230607063139.621351-4-dario.binacchi@amarulasolutions.com>
 <CAMty3ZDCkQ_T+j96iXtMAhkOLFBm=hZHk=sZzSGA=MOQQUOv7g@mail.gmail.com>
In-Reply-To: <CAMty3ZDCkQ_T+j96iXtMAhkOLFBm=hZHk=sZzSGA=MOQQUOv7g@mail.gmail.com>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Wed, 7 Jun 2023 14:49:36 +0200
Message-ID: <CABGWkvq_DevgJeR+KfBy-4ME+u-iORW93BAT4FTMVRuG0KU1Zg@mail.gmail.com>
To: Jagan Teki <jagan@amarulasolutions.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 michael@amarulasolutions.com,
 Amarula patchwork <linux-amarula@amarulasolutions.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [RESEND PATCH v2 3/6] ARM: dts: stm32: support
 display on stm32f746-disco board
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

SGkgSmFnYW4sCgpPbiBXZWQsIEp1biA3LCAyMDIzIGF0IDg6NDPigK9BTSBKYWdhbiBUZWtpIDxq
YWdhbkBhbWFydWxhc29sdXRpb25zLmNvbT4gd3JvdGU6Cj4KPiBPbiBXZWQsIEp1biA3LCAyMDIz
IGF0IDEyOjAx4oCvUE0gRGFyaW8gQmluYWNjaGkKPiA8ZGFyaW8uYmluYWNjaGlAYW1hcnVsYXNv
bHV0aW9ucy5jb20+IHdyb3RlOgo+ID4KPiA+IEFkZCBzdXBwb3J0IHRvIFJvY2t0ZWNoIFJLMDQz
Rk40OEggZGlzcGxheSBvbiBzdG0zMmY3NDYtZGlzY28gYm9hcmQuCj4gPgo+ID4gU2lnbmVkLW9m
Zi1ieTogRGFyaW8gQmluYWNjaGkgPGRhcmlvLmJpbmFjY2hpQGFtYXJ1bGFzb2x1dGlvbnMuY29t
Pgo+ID4gLS0tCj4gPgo+ID4gKG5vIGNoYW5nZXMgc2luY2UgdjEpCj4gPgo+ID4gIGFyY2gvYXJt
L2Jvb3QvZHRzL3N0bTMyZjc0Ni1kaXNjby5kdHMgfCA1MSArKysrKysrKysrKysrKysrKysrKysr
KysrKysKPiA+ICAxIGZpbGUgY2hhbmdlZCwgNTEgaW5zZXJ0aW9ucygrKQo+ID4KPiA+IGRpZmYg
LS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9zdG0zMmY3NDYtZGlzY28uZHRzIGIvYXJjaC9hcm0v
Ym9vdC9kdHMvc3RtMzJmNzQ2LWRpc2NvLmR0cwo+ID4gaW5kZXggYzExNjE2ZWQ1ZmM2Li5jZGE0
MjNiNmE4NzQgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL2FybS9ib290L2R0cy9zdG0zMmY3NDYtZGlz
Y28uZHRzCj4gPiArKysgYi9hcmNoL2FybS9ib290L2R0cy9zdG0zMmY3NDYtZGlzY28uZHRzCj4g
PiBAQCAtNjAsMTAgKzYwLDQxIEBAIG1lbW9yeUBjMDAwMDAwMCB7Cj4gPiAgICAgICAgICAgICAg
ICAgcmVnID0gPDB4QzAwMDAwMDAgMHg4MDAwMDA+Owo+ID4gICAgICAgICB9Owo+ID4KPiA+ICsg
ICAgICAgcmVzZXJ2ZWQtbWVtb3J5IHsKPiA+ICsgICAgICAgICAgICAgICAjYWRkcmVzcy1jZWxs
cyA9IDwxPjsKPiA+ICsgICAgICAgICAgICAgICAjc2l6ZS1jZWxscyA9IDwxPjsKPiA+ICsgICAg
ICAgICAgICAgICByYW5nZXM7Cj4gPiArCj4gPiArICAgICAgICAgICAgICAgbGludXgsY21hIHsK
PiA+ICsgICAgICAgICAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAic2hhcmVkLWRtYS1wb29s
IjsKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIG5vLW1hcDsKPiA+ICsgICAgICAgICAgICAg
ICAgICAgICAgIHNpemUgPSA8MHg4MDAwMD47Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICBs
aW51eCxkbWEtZGVmYXVsdDsKPiA+ICsgICAgICAgICAgICAgICB9Owo+ID4gKyAgICAgICB9Owo+
Cj4gVGhpcyBsb29rcyB1bnJlbGF0ZWQgdG8gZGlzcGxheSBlbmFibGVtZW50LCBpc24ndCBpdD8K
CldpdGhvdXQgdGhlICJyZXNlcnZlZC1tZW1vcnkiIG5vZGUsIGl0IGlzIG5vdCBwb3NzaWJsZSB0
byBhbGxvY2F0ZQptZW1vcnkgZm9yIHRoZSBmcmFtZWJ1ZmZlci4KSSBnb3QgdGhpcyBlcnJvcjoK
c3RtMzItZGlzcGxheSA0MDAxNjgwMC5kaXNwbGF5LWNvbnRyb2xsZXI6IFtkcm1dICpFUlJPUiog
ZmFpbGVkIHRvCmFsbG9jYXRlIGJ1ZmZlciB3aXRoIHNpemUgMTM5MjY0CgpUaGFua3MgYW5kIHJl
Z2FyZHMsCkRhcmlvCgo+Cj4gSmFnYW4uCgoKCi0tCgpEYXJpbyBCaW5hY2NoaQoKU2VuaW9yIEVt
YmVkZGVkIExpbnV4IERldmVsb3BlcgoKZGFyaW8uYmluYWNjaGlAYW1hcnVsYXNvbHV0aW9ucy5j
b20KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KCgpBbWFydWxhIFNvbHV0aW9u
cyBTUkwKClZpYSBMZSBDYW5ldmFyZSAzMCwgMzExMDAgVHJldmlzbywgVmVuZXRvLCBJVAoKVC4g
KzM5IDA0MiAyNDMgNTMxMAppbmZvQGFtYXJ1bGFzb2x1dGlvbnMuY29tCgp3d3cuYW1hcnVsYXNv
bHV0aW9ucy5jb20KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4v
bGlzdGluZm8vbGludXgtc3RtMzIK
