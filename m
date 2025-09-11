Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E115B52D11
	for <lists+linux-stm32@lfdr.de>; Thu, 11 Sep 2025 11:22:53 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A63A9C349C1;
	Thu, 11 Sep 2025 09:22:52 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 05497C36B14
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Sep 2025 09:22:50 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-55f68d7a98aso485406e87.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Sep 2025 02:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757582570; x=1758187370;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xClIjfrvAbF1xtvQXj+QQGe/hhZ9PeRp4erbvUtEvwI=;
 b=3P3TbAodFnWFDnNyRemT1/9ecnNiIX1IwW5ZBbo77GcK6WZA2Z5roNnReRll+MQYAo
 A0ZiUU3sQf6Goxb18znSYFF7UNtEqYX90/jGpKrNO3XSW1L46GnmUg22UOZ9qwBbdgef
 Zmo8GroRpMrMnibmRYk4xSmMdrmuRB5nhKrcLWVsvXMfbaoChjSzvmKrkan4+pijJroY
 MH7bHMAXyWvODDHq4Nvufgje25DZ2tVM/+PE5nqVZyHFWfwezxBvUeFoo+N91HDzFGSq
 gjLHnHzk9veANl/yHj3l1Zg8I3hjqnNA8OH5mer7qoNlnSenJOf7osIXgxQuAtgxFfzb
 tqRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757582570; x=1758187370;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xClIjfrvAbF1xtvQXj+QQGe/hhZ9PeRp4erbvUtEvwI=;
 b=mV9BQ6ORDVsiW6uLera5lwJXM89m4XqIotxSQONkhDy0F/WpycHg0gJdzzTWDpWlaz
 CLCSJ3xHETOoq4MOwFBo5A2ylhWqT3BMGI2yrySWHnsm0p+YT7tB19UVMlQzylgqhcee
 WxTIft2teuXPe+GmdoG68c2uF9J0lG0gAAHKo6qFF55blH5usZ/DU1//gEJqyiqIt2X2
 JuPjgo1tX9E2ppQ5oOT09h7geumcE18REv18TH0fzqPDhTlR1wplBbiD9kpSdbh4dTr8
 /i1HPmpeIhiwJFJIWZtgLkTcJrIRHv0Cb+jouddRO3SOIacYoWjF/mMjAt0We0CmCY8L
 blMg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVnJ+SHJaEz4ve9JxjqDVUFiV1FmE2yF33ePlJSoWZT9tUNP1CJcXArjYNhbdS6xm3bMKR1YgGqlOuREA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxZ83UH1Bb1eJ/7cywv5MrUk/U2txdqABfErZ95r5uj/O2V5urW
 Q17FjPJQBOq60+u1EGU43JxCXIvVAFTSWvhlSlLXnudjibkmjrk7BdtyX6vrC1sHOghS2a/Sk3U
 T7pRTcEgjO1HNl+RQ3TF/GLG5J6Z4Yic4EmdTSKJRxA==
X-Gm-Gg: ASbGncu66ltr3REKvmEHcuSWxRfXuZVz+UfzuT4M93uOhD2t/V6ADPeoUS3VKX3FHHJ
 e9jb67z6vraKWI3XbXN9G+JfzI2h6u9D+PBwSktp7JoSvNLbbX6v1GIgHHPmaFAbqx1uHliugts
 tVHAsdqhvbOSof7ZJDUtFxJZrZpSiana95nSR7m3up6DYKN+Icpw7O8936RjXGFtduNSSbDpdE1
 7mNXAsq52CbossXPzOx8UJiKrP3+pVnXCUf7EQ=
X-Google-Smtp-Source: AGHT+IFsnkGxYpIZ2no6WEiKw7trlyFszU8hXSZ7C1IoobeXgikTcX6nfxEwSn+eF6XIvxGU/64B9GjviqVf+lb37jo=
X-Received: by 2002:a05:6512:145b:10b0:562:d04d:fa0f with SMTP id
 2adb3069b0e04-562d04dfb5emr4915461e87.57.1757582570041; Thu, 11 Sep 2025
 02:22:50 -0700 (PDT)
MIME-Version: 1.0
References: <20250910-qcom-sa8255p-emac-v1-0-32a79cf1e668@linaro.org>
 <20250910-qcom-sa8255p-emac-v1-2-32a79cf1e668@linaro.org>
 <175751081352.3667912.274641295097354228.robh@kernel.org>
 <CAMRc=Mfom=QpqTrTSc_NEbKScOi1bLdVDO7kJ0+UQW9ydvdKjQ@mail.gmail.com>
 <20250910143618.GA4072335-robh@kernel.org>
 <CAMRc=McKF1O4KmB=LVX=gTvAmKjBC3oAM3BhTkk77U_MXuMJAA@mail.gmail.com>
 <b83a59f9-16ae-4835-b185-d5209d70a0f6@oss.qualcomm.com>
In-Reply-To: <b83a59f9-16ae-4835-b185-d5209d70a0f6@oss.qualcomm.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 11 Sep 2025 11:22:38 +0200
X-Gm-Features: Ac12FXx_Hui0lKjh3pL6K30JyaITyJ2wgwj7xLN_jTKFVW2DjCpTudv5l9sTHKE
Message-ID: <CAMRc=Md83STGFYya5eu4j33=SQ+D6upcP-7fnBwKo2dPdTtX+g@mail.gmail.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Eric Dumazet <edumazet@google.com>,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh@kernel.org>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Jose Abreu <joabreu@synopsys.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Konrad Dybcio <konradybcio@kernel.org>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 linux-arm-msm@vger.kernel.org, Richard Cochran <richardcochran@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>, Vinod Koul <vkoul@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH 2/9] dt-bindings: net: qcom: document the
 ethqos device for SCMI-based systems
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

T24gVGh1LCBTZXAgMTEsIDIwMjUgYXQgMTA6NTPigK9BTSBLb25yYWQgRHliY2lvCjxrb25yYWQu
ZHliY2lvQG9zcy5xdWFsY29tbS5jb20+IHdyb3RlOgo+Cj4gT24gOS8xMC8yNSA0OjQyIFBNLCBC
YXJ0b3N6IEdvbGFzemV3c2tpIHdyb3RlOgo+ID4gT24gV2VkLCBTZXAgMTAsIDIwMjUgYXQgNDoz
NuKAr1BNIFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4+Cj4gPj4gT24g
V2VkLCBTZXAgMTAsIDIwMjUgYXQgMDM6NDM6MzhQTSArMDIwMCwgQmFydG9zeiBHb2xhc3pld3Nr
aSB3cm90ZToKPiA+Pj4gT24gV2VkLCBTZXAgMTAsIDIwMjUgYXQgMzozOOKAr1BNIFJvYiBIZXJy
aW5nIChBcm0pIDxyb2JoQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4+Pj4KPiA+Pj4+Cj4gPj4+PiBP
biBXZWQsIDEwIFNlcCAyMDI1IDEwOjA3OjM5ICswMjAwLCBCYXJ0b3N6IEdvbGFzemV3c2tpIHdy
b3RlOgo+ID4+Pj4+IEZyb206IEJhcnRvc3ogR29sYXN6ZXdza2kgPGJhcnRvc3ouZ29sYXN6ZXdz
a2lAbGluYXJvLm9yZz4KPiA+Pj4+Pgo+ID4+Pj4+IERlc2NyaWJlIHRoZSBmaXJtd2FyZS1tYW5h
Z2VkIHZhcmlhbnQgb2YgdGhlIFFDb20gRGVzaWduV2FyZSBNQUMuIEFzIHRoZQo+ID4+Pj4+IHBy
b3BlcnRpZXMgaGVyZSBkaWZmZXIgYSBsb3QgZnJvbSB0aGUgSExPUy1tYW5hZ2VkIHZhcmlhbnQs
IGxldHMgcHV0IGl0Cj4gPj4+Pj4gaW4gYSBzZXBhcmF0ZSBmaWxlLgo+ID4+Pj4+Cj4gPj4+Pj4g
U2lnbmVkLW9mZi1ieTogQmFydG9zeiBHb2xhc3pld3NraSA8YmFydG9zei5nb2xhc3pld3NraUBs
aW5hcm8ub3JnPgo+ID4+Pj4+IC0tLQo+Cj4gWy4uLl0KPgo+ID4+PiBUaGVzZSBzZWVtIHRvIGJl
IGEgZmFsc2UtcG9zaXRpdmVzIHRyaWdnZXJlZCBieSBtb2RpZnlpbmcgdGhlCj4gPj4+IGhpZ2gt
bGV2ZWwgc25wcy5kd21hYy55YW1sIGZpbGU/Cj4gPj4KPiA+PiBOby4gWW91IGp1c3QgbWFkZSAz
IHBvd2VyLWRvbWFpbnMgcmVxdWlyZWQgZm9yIGV2ZXJ5b25lLgo+ID4+Cj4gPgo+ID4gV2l0aCBh
IG1heEl0ZW1zOiAzPwo+Cj4gSW4gdGhlIGNvbW1vbiBkZWZpbml0aW9uOgo+Cj4gbWluSXRlbXM6
IG4KPiBtYXhJdGVtczogMwo+CgpKdXN0IHRvIG1ha2UgaXQgY2xlYXI6IGlmIEkgaGF2ZSBhIG1h
eEl0ZW1zIGJ1dCBubyBtaW5JdGVtcywgZG9lcyB0aGlzCm1ha2UgbWF4SXRlbXMgZWZmZWN0aXZl
bHkgd29yayBhcyBhIHN0cmljdC1udW1iZXItb2YtaXRlbXM/CgpCYXJ0b3N6Cgo+IEluIHlvdXIg
bmV3IGZpbGUgdGhhdCBpbmNsdWRlcyB0aGUgbWFpbiBvbmU6Cj4KPiBwcm9wZXJ0aWVzOgo+ICAg
ICAgICAgcG93ZXItZG9tYWluczoKPiAgICAgICAgICAgICAgICAgbWluSXRlbXM6IDMKPgo+IEtv
bnJhZApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5
LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5m
by9saW51eC1zdG0zMgo=
