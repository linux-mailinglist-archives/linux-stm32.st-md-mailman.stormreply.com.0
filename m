Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CD38113DD7D
	for <lists+linux-stm32@lfdr.de>; Thu, 16 Jan 2020 15:33:46 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 864EBC36B0F;
	Thu, 16 Jan 2020 14:33:46 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8E201C36B0D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Jan 2020 14:33:44 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com
 [209.85.219.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1C29A20748
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Jan 2020 14:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1579185223;
 bh=zCTzRzpxW45hf9zhu97cl/HH/TkaKoXKxG33ubUlcis=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=lzvmVPxC0YoX1GCXF9xUvPrjSs4rABccejlMEYJBJejJBHBYBFbLHbl9I1uSYPV0s
 3EY+xd0XAuDU9RZq3eOwaUXPY3w86rI2ei6fInbAhyjKcskoR3Ss6JG1AD0V/OTu72
 nbcIyHgK5xQvFUJjrWjxwTqxbhEM7tjwPVQtLOqo=
Received: by mail-qv1-f52.google.com with SMTP id l14so9120923qvu.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Jan 2020 06:33:43 -0800 (PST)
X-Gm-Message-State: APjAAAWbE7JU2aRJ4jsCIzS0+UklhbqhS9E3ZexGpuj0yQuTt7DnLEtn
 aSBF/ZbWpgePdL7cPHxaTFyv/Sq8owkxdF1nIQ==
X-Google-Smtp-Source: APXvYqxpzOz30rqleYyMHf6/FcDEmshzxEl/xINJJW+FtV85eSNgGaPEZdKTK/HozyW+hT6davB/mrOR0U63bbSIPFg=
X-Received: by 2002:ad4:450a:: with SMTP id k10mr2710244qvu.136.1579185222222; 
 Thu, 16 Jan 2020 06:33:42 -0800 (PST)
MIME-Version: 1.0
References: <20200110134823.14882-1-ludovic.barre@st.com>
 <20200110134823.14882-6-ludovic.barre@st.com>
 <20200115145645.GA599@bogus> <2ce63f11-8b0c-8261-63fa-cd19e874c537@st.com>
In-Reply-To: <2ce63f11-8b0c-8261-63fa-cd19e874c537@st.com>
From: Rob Herring <robh@kernel.org>
Date: Thu, 16 Jan 2020 08:33:30 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJMGY-n07e81iAsj+P7wPHFojBerNnjx8vtvqLTDA7yEw@mail.gmail.com>
Message-ID: <CAL_JsqJMGY-n07e81iAsj+P7wPHFojBerNnjx8vtvqLTDA7yEw@mail.gmail.com>
To: Ludovic BARRE <ludovic.barre@st.com>
Cc: devicetree@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
 linux-mmc <linux-mmc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH 5/9] dt-bindings: mmc: mmci: add delay
 block base register for sdmmc
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

T24gVGh1LCBKYW4gMTYsIDIwMjAgYXQgMzoyMSBBTSBMdWRvdmljIEJBUlJFIDxsdWRvdmljLmJh
cnJlQHN0LmNvbT4gd3JvdGU6Cj4KPiBIaSBSb2IKPgo+IExlIDEvMTUvMjAgw6AgMzo1NiBQTSwg
Um9iIEhlcnJpbmcgYSDDqWNyaXQgOgo+ID4gT24gRnJpLCBKYW4gMTAsIDIwMjAgYXQgMDI6NDg6
MTlQTSArMDEwMCwgTHVkb3ZpYyBCYXJyZSB3cm90ZToKPiA+PiBUbyBzdXBwb3J0IHRoZSBzZHIx
MDQgbW9kZSwgdGhlIHNkbW1jIHZhcmlhbnQgaGFzIGEKPiA+PiBoYXJkd2FyZSBkZWxheSBibG9j
ayB0byBtYW5hZ2UgdGhlIGNsb2NrIHBoYXNlIHdoZW4gc2FtcGxpbmcKPiA+PiBkYXRhIHJlY2Vp
dmVkIGJ5IHRoZSBjYXJkLgo+ID4+Cj4gPj4gVGhpcyBwYXRjaCBhZGRzIGEgc2Vjb25kIGJhc2Ug
cmVnaXN0ZXIgKG9wdGlvbmFsKSBmb3IKPiA+PiBzZG1tYyBkZWxheSBibG9jay4KPiA+Pgo+ID4+
IFNpZ25lZC1vZmYtYnk6IEx1ZG92aWMgQmFycmUgPGx1ZG92aWMuYmFycmVAc3QuY29tPgo+ID4+
IC0tLQo+ID4+ICAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21tYy9tbWNpLnR4
dCB8IDIgKysKPiA+PiAgIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKPiA+Pgo+ID4+
IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbW1jL21tY2ku
dHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21tYy9tbWNpLnR4dAo+ID4+
IGluZGV4IDZkM2M2MjZlMDE3ZC4uNGVjOTIxZTRiZjM0IDEwMDY0NAo+ID4+IC0tLSBhL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tbWMvbW1jaS50eHQKPiA+PiArKysgYi9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbW1jL21tY2kudHh0Cj4gPj4gQEAgLTI4LDYg
KzI4LDggQEAgc3BlY2lmaWMgZm9yIHV4NTAwIHZhcmlhbnQ6Cj4gPj4gICAtIHN0LHNpZy1waW4t
ZmJjbGsgICAgICAgOiBmZWVkYmFjayBjbG9jayBzaWduYWwgcGluIHVzZWQuCj4gPj4KPiA+PiAg
IHNwZWNpZmljIGZvciBzZG1tYyB2YXJpYW50Ogo+ID4+ICstIHJlZyAgICAgICAgICAgICAgICAg
ICAgICAgIDogYSBzZWNvbmQgYmFzZSByZWdpc3RlciBtYXkgYmUgZGVmaW5lZCBpZiBhIGRlbGF5
Cj4gPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgIGJsb2NrIGlzIHByZXNlbnQgYW5kIHVz
ZWQgZm9yIHR1bmluZy4KPiA+Cj4gPiBXaGljaCBjb21wYXRpYmxlcyBoYXZlIGEgMm5kIHJlZyBl
bnRyeT8KPgo+IEluIGZhY3QsIG1tY2kgZHJpdmVyIGlzIEFSTSBBbWJhIGRyaXZlciAoYXJtLHBy
aW1lY2VsbCkgYW5kIGhhcyBvbmx5IG9uZQo+IGNvbXBhdGlibGUgImFybSxwbDE4eCIuCj4gVGhl
IHZhcmlhbnRzIGFyZSBpZGVudGlmaWVkIGJ5IHByaW1lY2VsbC1wZXJpcGhpZCBwcm9wZXJ0eQo+
IChkaXNjb3ZlcmVkIGF0IHJ1bnRpbWUgd2l0aCBIVyBibG9jayByZWdpc3RlciBvciBkZWZpbmVk
IGJ5Cj4gZGV2aWNlIHRyZWUgcHJvcGVydHkgImFybSxwcmltZWNlbGwtcGVyaXBoaWQiKS4KPgo+
IFRoZSBkZWZhdWx0cyAiYXJtLHBsMTh4IiB2YXJpYW50cyBoYXZlIG9ubHkgb25lIGJhc2UgcmVn
aXN0ZXIsCj4gYnV0IHRoZSBTRE1NQyBuZWVkIGEgc2Vjb25kIGJhc2UgcmVnaXN0ZXIgZm9yIHRo
ZXNlCj4gZGVsYXkgYmxvY2sgcmVnaXN0ZXJzLgo+Cj4gZXhhbXBsZSBvZiBzZG1tYyBub2RlOgo+
ICAgICAgICAgc2RtbWMxOiBzZG1tY0A1ODAwNTAwMCB7Cj4gICAgICAgICAgICAgICAgIGNvbXBh
dGlibGUgPSAiYXJtLHBsMTh4IiwgImFybSxwcmltZWNlbGwiOwo+ICAgICAgICAgICAgICAgICBh
cm0scHJpbWVjZWxsLXBlcmlwaGlkID0gPDB4MDAyNTMxODA+Owo+ICAgICAgICAgICAgICAgICBy
ZWcgPSA8MHg1ODAwNTAwMCAweDEwMDA+LCA8MHg1ODAwNjAwMCAweDEwMDA+Owo+ICAgICAgICAg
fTsKPgo+IHdoYXQgZG8geW91IGFkdmlzZT8KCkkgbWlzc2VkIHRoYXQgdGhpcyBpcyBhIHByaW1l
Y2VsbCBibG9jay4gSnVzdCBnaXZlIHNvbWUgaW5kaWNhdGlvbgp3aGljaCB2YXJpYW50cyBoYXZl
IHRoaXMgMm5kIHJhbmdlLgoKUm9iCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1t
YWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNv
bS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
