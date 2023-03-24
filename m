Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C89D6C7D7C
	for <lists+linux-stm32@lfdr.de>; Fri, 24 Mar 2023 12:52:10 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3DFA6C6A603;
	Fri, 24 Mar 2023 11:52:10 +0000 (UTC)
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com
 [209.85.166.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 173DDC6904F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Mar 2023 11:52:09 +0000 (UTC)
Received: by mail-io1-f53.google.com with SMTP id e13so692279ioc.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Mar 2023 04:52:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679658728;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iWww7KIOZBCmIAHeZv67n8Ky5bkkqCoK79aVsIAZNBI=;
 b=TZIv8T/N6JJPGZzyhEafVekIQ23TQTiv0q+86h2sLILA6iYzEfF+u25kxtdHp0VNRq
 oxZ78xFZORp0fy9rKmZZbV739hSARgPOxdeaHK8u5HVOOZ+XoTsb4e+8OIlwjfdD+Ql7
 zhqN1Parx4H/ypNye6pC5LYEcdA2aVqEf5Pj85VQJCszYYHd3qwp7Z6vgH8A4g2J4iDq
 Jvyj/nX9Kxxs1RNcEyCI4VxU8gCULSV9V72g3/PWK4V27yBgt7JRix0tewp8vbtVw3wM
 S62jCU5Rp3Pf1rHR89/Ps52hFSuInfYfA0/v6QVaVOAAszzLLvwm1fE5xWI5yg91LgDW
 n8Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679658728;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iWww7KIOZBCmIAHeZv67n8Ky5bkkqCoK79aVsIAZNBI=;
 b=WPf97lr2ZplJsTj4t4FjCXZVsveI2Uoes8k9yhSwDMvpdjs/gp2CxkNUcpJYBtZy4F
 o/jnjPZTkfHvSv1eD1XZjF+jIlNHsoNH3YprfxhbfcR+REJ5iV4gNN7/MckO+uT4TD4M
 c1FifQ/zxWDIUplphSJCabatcMUEFWD3BeAIXpjUe8z2l1ro/MQ048OzswwX9Z060OVb
 feB4vXgx1Ve3eJrKR/QRFnH/3QtOWBREmbE4wmrOtP8fydphAq2wVshPgyys1mZgaJBo
 +Xzh1xhPMeZzi44Bn3al+weYJ1djTvxQyGNx7pr7MHnSA1bsZnuBqcg9l61RFtQUhhHe
 nN2g==
X-Gm-Message-State: AO0yUKU76qF3GJ8QH3nkThYyBf0BL3+c6fWl4gn8Q25ZgIWW9D2VNPn1
 4E6gTb+Ykid7l+b+/PN/RelYAj78aMCidWvd5Xg=
X-Google-Smtp-Source: AK7set8+H6cwLxu738lkTCKCs6nwLDvrDpz/EBmL2ZmHT3i13MKkp+14knPu99WuRsmhLBPnfRJcdLzJTAFzgFo9qX0=
X-Received: by 2002:a05:6638:22a1:b0:3ae:e73b:ff26 with SMTP id
 z1-20020a05663822a100b003aee73bff26mr831353jas.1.1679658727838; Fri, 24 Mar
 2023 04:52:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230323185112.13855-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdVKRS1N5s-cvxrgSj9ev-Hh+gxfa-Hp2+z1zt+r7fEUWg@mail.gmail.com>
In-Reply-To: <CAMuHMdVKRS1N5s-cvxrgSj9ev-Hh+gxfa-Hp2+z1zt+r7fEUWg@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 24 Mar 2023 11:51:41 +0000
Message-ID: <CA+V-a8u5ttTsG9fn4ePKi-0=2NXzhk1seBwnzBn_X6VQDwWKpw@mail.gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
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

SGkgR2VlcnQsCgpUaGFuayB5b3UgZm9yIHRoZSByZXZpZXcuCgpPbiBGcmksIE1hciAyNCwgMjAy
MyBhdCA5OjM14oCvQU0gR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4g
d3JvdGU6Cj4KPiBIaSBQcmFiaGFrYXIsCj4KPiBUaGFua3MgZm9yIHlvdXIgcGF0Y2ghCj4KPiBP
biBUaHUsIE1hciAyMywgMjAyMyBhdCA3OjU24oCvUE0gUHJhYmhha2FyIDxwcmFiaGFrYXIuY3Nl
bmdnQGdtYWlsLmNvbT4gd3JvdGU6Cj4gPiBGcm9tOiBMYWQgUHJhYmhha2FyIDxwcmFiaGFrYXIu
bWFoYWRldi1sYWQucmpAYnAucmVuZXNhcy5jb20+Cj4gPgo+ID4gVGhlIE9TVE0gYmxvY2sgb24g
dGhlIFJaL0ZpdmUgU29DIGlzIGlkZW50aWNhbCB0byBvbmUgZm91bmQgb24gdGhlIFJaL0cyVUwK
PiA+IFNvQy4gInJlbmVzYXMscjlhMDdnMDQzLW9zdG0iIGNvbXBhdGlibGUgc3RyaW5nIHdpbGwg
YmUgdXNlZCBvbiB0aGUKPiA+IFJaL0ZpdmUgU29DIHNvIHRvIG1ha2UgdGhpcyBjbGVhciwgdXBk
YXRlIHRoZSBjb21tZW50IHRvIGluY2x1ZGUgUlovRml2ZQo+ID4gU29DLgo+ID4KPiA+IE5vIGRy
aXZlciBjaGFuZ2VzIGFyZSByZXF1aXJlZCBhcyBnZW5lcmljIGNvbXBhdGlibGUgc3RyaW5nCj4g
PiAicmVuZXNhcyxvc3RtIiB3aWxsIGJlIHVzZWQgYXMgYSBmYWxsYmFjayBvbiBSWi9GaXZlIFNv
Qy4KPgo+IFdoaWxlIHRoaXMgcGFyYWdyYXBoIGlzIHRydWUsIGl0IGRvZXNuJ3QgcmVhbGx5IG1h
dHRlciwgYXMgeW91J3JlIG5vdAo+IGFkZGluZyBhIG5ldyBTb0Mtc3BlY2lmaWMgY29tcGF0aWJs
ZSB2YWx1ZS4KPgpBZ3JlZWQsIEkgd2lsbCBrZWVwIHRoYXQgaW4gbWluZCBmb3IgZnV0dXJlIHBh
dGNoZXMuCgpDaGVlcnMsClByYWJoYWthcgoKPiA+IFNpZ25lZC1vZmYtYnk6IExhZCBQcmFiaGFr
YXIgPHByYWJoYWthci5tYWhhZGV2LWxhZC5yakBicC5yZW5lc2FzLmNvbT4KPgo+IFJldmlld2Vk
LWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlPgo+Cj4gPiAt
LS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdGltZXIvcmVuZXNhcyxvc3Rt
LnlhbWwKPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy90aW1lci9y
ZW5lc2FzLG9zdG0ueWFtbAo+ID4gQEAgLTIzLDcgKzIzLDcgQEAgcHJvcGVydGllczoKPiA+ICAg
ICAgICAtIGVudW06Cj4gPiAgICAgICAgICAgIC0gcmVuZXNhcyxyN3M3MjEwMC1vc3RtICAjIFJa
L0ExSAo+ID4gICAgICAgICAgICAtIHJlbmVzYXMscjdzOTIxMC1vc3RtICAgIyBSWi9BMk0KPiA+
IC0gICAgICAgICAgLSByZW5lc2FzLHI5YTA3ZzA0My1vc3RtICMgUlovRzJVTAo+ID4gKyAgICAg
ICAgICAtIHJlbmVzYXMscjlhMDdnMDQzLW9zdG0gIyBSWi9HMlVMIGFuZCBSWi9GaXZlCj4gPiAg
ICAgICAgICAgIC0gcmVuZXNhcyxyOWEwN2cwNDQtb3N0bSAjIFJaL0cye0wsTEN9Cj4gPiAgICAg
ICAgICAgIC0gcmVuZXNhcyxyOWEwN2cwNTQtb3N0bSAjIFJaL1YyTAo+ID4gICAgICAgIC0gY29u
c3Q6IHJlbmVzYXMsb3N0bSAgICAgICAgIyBHZW5lcmljCj4KPiBHcntvZXRqZSxlZXRpbmd9cywK
Pgo+ICAgICAgICAgICAgICAgICAgICAgICAgIEdlZXJ0Cj4KPiAtLQo+IEdlZXJ0IFV5dHRlcmhv
ZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgt
bTY4ay5vcmcKPgo+IEluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVv
cGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQKPiB3aGVuIEknbSB0YWxraW5nIHRvIGpv
dXJuYWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1tZXIiIG9yIHNvbWV0aGluZyBsaWtlIHRoYXQu
Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxkcwpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBt
YWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRw
czovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1z
dG0zMgo=
