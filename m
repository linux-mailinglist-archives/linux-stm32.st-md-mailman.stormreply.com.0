Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B5A3D611C69
	for <lists+linux-stm32@lfdr.de>; Fri, 28 Oct 2022 23:28:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 55671C640F9;
	Fri, 28 Oct 2022 21:28:41 +0000 (UTC)
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com
 [209.85.167.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5667EC63324
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Oct 2022 21:28:39 +0000 (UTC)
Received: by mail-oi1-f180.google.com with SMTP id u132so7519746oib.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Oct 2022 14:28:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lknu54DbFthD579xaozvAvZtzzLsGT0TFE9tJ3u52N4=;
 b=zjpRxGg1r25yYreM1VfyDt0qHcsHRofsfY79sb6Z2VpFqcxiyYN0n2riekfPwbT4RU
 afZeGirvM6lTDn8cpBpqPDftmvFeBFj0WNTVu79gjXiJF7VZ/KjHTLnVU0jJ1NDnFoEl
 VptJBvsp4A/DAH8D+yGSzAPDWPrSOBIvyDe0imHfdSvqbE3llKhC2hydg9fqO99Gd9kl
 fJmh/vtHs/QEWB4lpx5qlKXei5dgDLDpFAGaFQcvcyI+s3D/ymEspman1Tt3Cyog6Ov4
 KCLMKgkxNMDbvM4AtyR0oATg5zF+MvI0r6zr4JcN79G2bomBiDrRQzcpBD3wTl8Libk2
 y3Mg==
X-Gm-Message-State: ACrzQf0zwKtdznnAWjyuYJFX/X1zXhUqbfAOIYt1UTQq8LJmghihGuVH
 Y9E80soiGF95k5SJ/YKYOA==
X-Google-Smtp-Source: AMsMyM7TA8UcCrte8E7aB86djXst16DZXJt5jV5F6apx7LivjSiemtLqKZ+e8qL60XfbspflUZy2Gg==
X-Received: by 2002:a05:6808:2021:b0:354:9a79:2f5a with SMTP id
 q33-20020a056808202100b003549a792f5amr9905119oiw.276.1666992517892; 
 Fri, 28 Oct 2022 14:28:37 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 q15-20020a056830018f00b0066564c9103csm2140271ota.55.2022.10.28.14.28.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Oct 2022 14:28:37 -0700 (PDT)
Received: (nullmailer pid 2308996 invoked by uid 1000);
 Fri, 28 Oct 2022 21:28:38 -0000
Date: Fri, 28 Oct 2022 16:28:38 -0500
From: Rob Herring <robh@kernel.org>
To: Marek Vasut <marex@denx.de>
Message-ID: <20221028212838.GA2286583-robh@kernel.org>
References: <20221027225020.215149-1-marex@denx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221027225020.215149-1-marex@denx.de>
Cc: devicetree@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/3] [RFC] dt-bindings: nvmem: syscon: Add
 syscon backed nvmem bindings
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

T24gRnJpLCBPY3QgMjgsIDIwMjIgYXQgMTI6NTA6MThBTSArMDIwMCwgTWFyZWsgVmFzdXQgd3Jv
dGU6Cj4gQWRkIHRyaXZpYWwgYmluZGluZ3MgZm9yIGRyaXZlciB3aGljaCBwZXJtaXRzIGV4cG9z
aW5nIHN5c2NvbiBiYWNrZWQKPiByZWdpc3RlciB0byB1c2Vyc3BhY2UuIFRoaXMgaXMgdXNlZnVs
IGUuZy4gdG8gZXhwb3NlIFUtQm9vdCBib290Cj4gY291bnRlciBvbiB2YXJpb3VzIHBsYXRmb3Jt
cyB3aGVyZSB0aGUgYm9vdCBjb3VudGVyIGlzIHN0b3JlZCBpbgo+IHJhbmRvbSB2b2xhdGlsZSBy
ZWdpc3RlciwgbGlrZSBTVE0zMk1QMTV4eCBUQU1QX0JLUHhSIHJlZ2lzdGVyLgoKR2VuZXJpYyBi
aW5kaW5ncyBhbHdheXMgc3RhcnQgdHJpdmlhbCB1bnRpbCB0aGV5IGdldCBhcHBlbmRlZCBvbmUg
CnByb3BlcnR5IGF0IGEgdGltZS4uLgoKV2hhdCBoYXBwZW5zIHdoZW4geW91IGhhdmUgbW9yZSB0
aGFuIDEgZmllbGQgYW5kL29yIG1vcmUgdGhhbiAxIApyZWdpc3Rlcj8KCj4gU2lnbmVkLW9mZi1i
eTogTWFyZWsgVmFzdXQgPG1hcmV4QGRlbnguZGU+Cj4gLS0tCj4gQ2M6IEFsZXhhbmRyZSBUb3Jn
dWUgPGFsZXhhbmRyZS50b3JndWVAZm9zcy5zdC5jb20+Cj4gQ2M6IFJhZmHFgiBNacWCZWNraSA8
cmFmYWxAbWlsZWNraS5wbD4KPiBDYzogUm9iIEhlcnJpbmcgPHJvYmgrZHRAa2VybmVsLm9yZz4K
PiBDYzogU3Jpbml2YXMgS2FuZGFnYXRsYSA8c3Jpbml2YXMua2FuZGFnYXRsYUBsaW5hcm8ub3Jn
Pgo+IENjOiBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZwo+IENjOiBsaW51eC1zdG0zMkBzdC1t
ZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCj4gVG86IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5m
cmFkZWFkLm9yZwo+IC0tLQo+ICAuLi4vYmluZGluZ3MvbnZtZW0vbnZtZW0tc3lzY29uLnlhbWwg
ICAgICAgICAgfCAzOSArKysrKysrKysrKysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCAzOSBp
bnNlcnRpb25zKCspCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvbnZtZW0vbnZtZW0tc3lzY29uLnlhbWwKPiAKPiBkaWZmIC0tZ2l0IGEvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL252bWVtL252bWVtLXN5c2Nvbi55YW1sIGIv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL252bWVtL252bWVtLXN5c2Nvbi55YW1s
Cj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwMDAwLi4zMDM1YTBiMmNk
MjRhCj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9udm1lbS9udm1lbS1zeXNjb24ueWFtbAo+IEBAIC0wLDAgKzEsMzkgQEAKPiArIyBTUERY
LUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAtb25seSBPUiBCU0QtMi1DbGF1c2UpCj4gKyVZ
QU1MIDEuMgo+ICstLS0KPiArJGlkOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9udm1l
bS9udm1lbS1zeXNjb24ueWFtbCMKPiArJHNjaGVtYTogaHR0cDovL2RldmljZXRyZWUub3JnL21l
dGEtc2NoZW1hcy9jb3JlLnlhbWwjCj4gKwo+ICt0aXRsZTogR2VuZXJpYyBzeXNjb24gYmFja2Vk
IG52bWVtCj4gKwo+ICttYWludGFpbmVyczoKPiArICAtIE1hcmVrIFZhc3V0IDxtYXJleEBkZW54
LmRlPgo+ICsKPiArYWxsT2Y6Cj4gKyAgLSAkcmVmOiAibnZtZW0ueWFtbCMiCj4gKwo+ICtwcm9w
ZXJ0aWVzOgo+ICsgIGNvbXBhdGlibGU6Cj4gKyAgICBlbnVtOgo+ICsgICAgICAtIG52bWVtLXN5
c2Nvbgo+ICsKPiArICByZWc6Cj4gKyAgICBtYXhJdGVtczogMQo+ICsKPiArcmVxdWlyZWQ6Cj4g
KyAgLSBjb21wYXRpYmxlCj4gKyAgLSByZWcKPiArCj4gK2FkZGl0aW9uYWxQcm9wZXJ0aWVzOiBm
YWxzZQo+ICsKPiArZXhhbXBsZXM6Cj4gKyAgLSB8Cj4gKyAgICB0YW1wQDVjMDBhMDAwIHsKPiAr
ICAgICAgICBjb21wYXRpYmxlID0gInN0LHN0bTMyLXRhbXAiLCAic3lzY29uIiwgInNpbXBsZS1t
ZmQiOwoKVGhpcyBpcyB2ZXJ5IGNvbW1vbiwgYnV0IHBlcnNvbmFsbHkgSSB0aGluayAic3lzY29u
IiBhbmQgInNpbXBsZS1tZmQiIApzaG91bGQgYmUgbXV0dWFsbHkgZXhjbHVzaXZlLiAic2ltcGxl
LW1mZCIgaXMgc2F5aW5nIHRoZSBjaGlsZHJlbiBoYXZlIApubyBkZXBlbmRlbmN5IG9uIHRoZSBw
YXJlbnQsIHlldCB0aGUgY2hpbGQgbm9kZXMgbmVlZCBhIHJlZ21hcCBmcm9tIHRoZSAKcGFyZW50
LiBTb3VuZHMgbGlrZSBhIGRlcGVuZGVuY3kuCgo+ICsgICAgICAgIHJlZyA9IDwweDVjMDBhMDAw
IDB4NDAwPjsKPiArCj4gKyAgICAgICAgbnZtZW0tc3lzY29uIHsKPiArICAgICAgICAgICAgY29t
cGF0aWJsZSA9ICJudm1lbS1zeXNjb24iOwo+ICsgICAgICAgICAgICByZWcgPSA8MHgxNGMgMHg0
PjsKCkhvdyBkb2VzIG9uZSBpZGVudGlmeSB0aGlzIGlzIHRoZSBib290bG9hZGVyJ3MgYm9vdCBj
b3VudD8gSG93IGRvZXMgdGhlIApib290bG9hZGVyIGtub3cgaXQgY2FuIHdyaXRlIHRvIHRoaXM/
Cgo+ICsgICAgICAgIH07Cj4gKyAgICB9Owo+IC0tIAo+IDIuMzUuMQo+IAo+IApfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5n
IGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0
LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
