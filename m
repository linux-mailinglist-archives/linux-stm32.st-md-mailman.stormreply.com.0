Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CCF46C7B82
	for <lists+linux-stm32@lfdr.de>; Fri, 24 Mar 2023 10:35:06 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C9F62C6A603;
	Fri, 24 Mar 2023 09:35:05 +0000 (UTC)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com
 [209.85.128.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2E9DBC6904F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Mar 2023 09:35:04 +0000 (UTC)
Received: by mail-yw1-f171.google.com with SMTP id
 00721157ae682-5445009c26bso22814367b3.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Mar 2023 02:35:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679650503;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=miXbgzLmIT8TbuaHosYV2bM+7farboHCB6roIPdYqKY=;
 b=gbbsVXjI/GLLOUl5MpxCL7Y+lOGxpsZtgvxO4qRCweyKUIYFc4U5ehS/tB0EM16TBw
 btHmbFi3WOUBUTVEg7XB7DS7qKQ/TEFyfMAs0e1lwmYOju+6QvOnjdC/bfjVuDYFiPuv
 um8X6h2GiIH5XJUB6mxepYNRbIOqxVutxAp0dYceEXFjT6AyONplJCIoxM9Uj7IOcmE7
 1rjehrUxFBJndyjeoqLB1EFcYZg5PFdd1Uo7N+6WgbHaBbhtpYL+q0uWh/FLbPHAsiNI
 p91DXm0EGtuY9Bal4BNEx8RAP2Rs3ivcs8Trag8+MxlA6o5lKCcgabEHIDuNr/kG49//
 WSeA==
X-Gm-Message-State: AAQBX9ftchiKBQNsSTdubHuPOksLyjM7i4Eaf1fKd2wdK2fnF17Wd8CY
 ERSZiqgA9s0I7bMw7wTZkdG8x9oyJvCUPA==
X-Google-Smtp-Source: AKy350bFpKPyytz03Sl1fqKwiSUPg5cS5CbZEY9cPAZNyVQRp+IF8k5xcdYVRcCo2zqSJcH/3/6z7g==
X-Received: by 2002:a0d:d489:0:b0:544:626a:d90d with SMTP id
 w131-20020a0dd489000000b00544626ad90dmr1603315ywd.40.1679650502845; 
 Fri, 24 Mar 2023 02:35:02 -0700 (PDT)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com.
 [209.85.219.179]) by smtp.gmail.com with ESMTPSA id
 dc8-20020a05690c0f0800b00545a08184besm317346ywb.78.2023.03.24.02.35.02
 for <linux-stm32@st-md-mailman.stormreply.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Mar 2023 02:35:02 -0700 (PDT)
Received: by mail-yb1-f179.google.com with SMTP id p15so1388400ybl.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Mar 2023 02:35:02 -0700 (PDT)
X-Received: by 2002:a05:6902:10c3:b0:b75:9519:dbcd with SMTP id
 w3-20020a05690210c300b00b759519dbcdmr979907ybu.12.1679650502403; Fri, 24 Mar
 2023 02:35:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230323185112.13855-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20230323185112.13855-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 24 Mar 2023 10:34:50 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVKRS1N5s-cvxrgSj9ev-Hh+gxfa-Hp2+z1zt+r7fEUWg@mail.gmail.com>
Message-ID: <CAMuHMdVKRS1N5s-cvxrgSj9ev-Hh+gxfa-Hp2+z1zt+r7fEUWg@mail.gmail.com>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Chris Brandt <chris.brandt@renesas.com>,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Biju Das <biju.das.jz@bp.renesas.com>, Thomas Gleixner <tglx@linutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: timer: renesas: ostm:
	Document RZ/Five SoC
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

SGkgUHJhYmhha2FyLAoKVGhhbmtzIGZvciB5b3VyIHBhdGNoIQoKT24gVGh1LCBNYXIgMjMsIDIw
MjMgYXQgNzo1NuKAr1BNIFByYWJoYWthciA8cHJhYmhha2FyLmNzZW5nZ0BnbWFpbC5jb20+IHdy
b3RlOgo+IEZyb206IExhZCBQcmFiaGFrYXIgPHByYWJoYWthci5tYWhhZGV2LWxhZC5yakBicC5y
ZW5lc2FzLmNvbT4KPgo+IFRoZSBPU1RNIGJsb2NrIG9uIHRoZSBSWi9GaXZlIFNvQyBpcyBpZGVu
dGljYWwgdG8gb25lIGZvdW5kIG9uIHRoZSBSWi9HMlVMCj4gU29DLiAicmVuZXNhcyxyOWEwN2cw
NDMtb3N0bSIgY29tcGF0aWJsZSBzdHJpbmcgd2lsbCBiZSB1c2VkIG9uIHRoZQo+IFJaL0ZpdmUg
U29DIHNvIHRvIG1ha2UgdGhpcyBjbGVhciwgdXBkYXRlIHRoZSBjb21tZW50IHRvIGluY2x1ZGUg
UlovRml2ZQo+IFNvQy4KPgo+IE5vIGRyaXZlciBjaGFuZ2VzIGFyZSByZXF1aXJlZCBhcyBnZW5l
cmljIGNvbXBhdGlibGUgc3RyaW5nCj4gInJlbmVzYXMsb3N0bSIgd2lsbCBiZSB1c2VkIGFzIGEg
ZmFsbGJhY2sgb24gUlovRml2ZSBTb0MuCgpXaGlsZSB0aGlzIHBhcmFncmFwaCBpcyB0cnVlLCBp
dCBkb2Vzbid0IHJlYWxseSBtYXR0ZXIsIGFzIHlvdSdyZSBub3QKYWRkaW5nIGEgbmV3IFNvQy1z
cGVjaWZpYyBjb21wYXRpYmxlIHZhbHVlLgoKPiBTaWduZWQtb2ZmLWJ5OiBMYWQgUHJhYmhha2Fy
IDxwcmFiaGFrYXIubWFoYWRldi1sYWQucmpAYnAucmVuZXNhcy5jb20+CgpSZXZpZXdlZC1ieTog
R2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydCtyZW5lc2FzQGdsaWRlci5iZT4KCj4gLS0tIGEvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3RpbWVyL3JlbmVzYXMsb3N0bS55YW1sCj4g
KysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3RpbWVyL3JlbmVzYXMsb3N0
bS55YW1sCj4gQEAgLTIzLDcgKzIzLDcgQEAgcHJvcGVydGllczoKPiAgICAgICAgLSBlbnVtOgo+
ICAgICAgICAgICAgLSByZW5lc2FzLHI3czcyMTAwLW9zdG0gICMgUlovQTFICj4gICAgICAgICAg
ICAtIHJlbmVzYXMscjdzOTIxMC1vc3RtICAgIyBSWi9BMk0KPiAtICAgICAgICAgIC0gcmVuZXNh
cyxyOWEwN2cwNDMtb3N0bSAjIFJaL0cyVUwKPiArICAgICAgICAgIC0gcmVuZXNhcyxyOWEwN2cw
NDMtb3N0bSAjIFJaL0cyVUwgYW5kIFJaL0ZpdmUKPiAgICAgICAgICAgIC0gcmVuZXNhcyxyOWEw
N2cwNDQtb3N0bSAjIFJaL0cye0wsTEN9Cj4gICAgICAgICAgICAtIHJlbmVzYXMscjlhMDdnMDU0
LW9zdG0gIyBSWi9WMkwKPiAgICAgICAgLSBjb25zdDogcmVuZXNhcyxvc3RtICAgICAgICAjIEdl
bmVyaWMKCkdye29ldGplLGVldGluZ31zLAoKICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQK
Ci0tIApHZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBp
YTMyIC0tIGdlZXJ0QGxpbnV4LW02OGsub3JnCgpJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdp
dGggdGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4gQnV0CndoZW4gSSdt
IHRhbGtpbmcgdG8gam91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRo
aW5nIGxpa2UgdGhhdC4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBMaW51cyBU
b3J2YWxkcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJl
cGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0
aW5mby9saW51eC1zdG0zMgo=
