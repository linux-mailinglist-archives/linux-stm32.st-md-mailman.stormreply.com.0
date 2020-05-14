Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 162C81D2AD4
	for <lists+linux-stm32@lfdr.de>; Thu, 14 May 2020 11:00:34 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BEBE8C36B12;
	Thu, 14 May 2020 09:00:33 +0000 (UTC)
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
 [209.85.221.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D4859C36B0E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 May 2020 09:00:28 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id v12so2798419wrp.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 May 2020 02:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=brO8SatzFGXuJx7truk9R35eMq/wT5WUrcx2WinNCbE=;
 b=yB4/wSNaH36qcX3ATdVHv5wM50wNQ0F9THXz6MYGO/Z5VW2nm/DAW0ZrVAZSVQb4Ei
 8WzGL9TSkBUW3QBwu55rhPuu5Z+ozILLJFZuV2KWUbiOP15IS+2STJaVBzF02gWjxou/
 +zqMqF9qqfNCHP4eM3uUGlS8mwnkL85fYTiB4clQVJHIhgf7rI0DDdmiX21dGKp33EMS
 BBkKD1zYjwe9VnLcjKRxyHAf5ra0+BR4ADKbuaAd2QC3WVrp3Vrvet0BaL/LUd8xD9MQ
 qZwLuJu7yprAKLS87ee2yC92l4XctwEjvIybLReXE1eSLnwB3R58upThUohkGOb+rDKV
 TLeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=brO8SatzFGXuJx7truk9R35eMq/wT5WUrcx2WinNCbE=;
 b=BRD3rGXuA0SiRi2QRUy9xm1K8ehHQEEcFyM8HZnpW7zzD1H9KZNXQbDR9dUI4Q/V3d
 I99kQrRY0YSCQptEnCEk5zmOduTDAf0p+tFEBi+Cax0ZGbpGaf52wlQtFsI2csxWNyxd
 VZByy/uml1jkF9iKJ+APR3nDT0pZLoPH0hMCQhRh2hy+FdJfpvn+kwBNrIw2v1YsuBc0
 YDQJwLPKeoxtmDkxQ1P4Fc5CW/EAcy7Ub+ce1VkOM3d4oexVox9W8ymDtpNjMLoFLMlx
 Vet9zgK0MaCctHIT+BzODqU/To1WxkOEWOlyV72ZO5xiCfZjhuh1w+m/kFWCQR3gFiSC
 vhmA==
X-Gm-Message-State: AOAM532ZHZfJKK4kN0h2je5iy9ywpqahqf1nEJwwAgk1ac6aDCzsDkYs
 d+Y+L6t7Cmn//nADITYNOOvALA==
X-Google-Smtp-Source: ABdhPJw+rFHQFUTHAaNgyLW1xC7hhZnEVdOwRgOheuGlo7jgtN0uXxuUcMgeW3VsFaSa/lENVe3Vzg==
X-Received: by 2002:a5d:53c7:: with SMTP id a7mr4414459wrw.334.1589446828174; 
 Thu, 14 May 2020 02:00:28 -0700 (PDT)
Received: from dell ([2.31.163.63])
 by smtp.gmail.com with ESMTPSA id c193sm13125691wme.37.2020.05.14.02.00.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 May 2020 02:00:26 -0700 (PDT)
Date: Thu, 14 May 2020 10:00:25 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Benjamin GAIGNARD <benjamin.gaignard@st.com>
Message-ID: <20200514090025.GE271301@dell>
References: <20200220162246.8334-1-benjamin.gaignard@st.com>
 <20200226162125.GA13349@bogus>
 <70ee04c9-4f65-6909-32bc-a379c21a031e@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <70ee04c9-4f65-6909-32bc-a379c21a031e@st.com>
Cc: "mark.rutland@arm.co" <mark.rutland@arm.co>, Rob Herring <robh@kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH v3] dt-bindings: mfd: Convert stmfx
 bindings to json-schema
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

T24gVGh1LCAxNCBNYXkgMjAyMCwgQmVuamFtaW4gR0FJR05BUkQgd3JvdGU6Cgo+IAo+IAo+IE9u
IDIvMjYvMjAgNToyMSBQTSwgUm9iIEhlcnJpbmcgd3JvdGU6Cj4gPiBPbiBUaHUsIDIwIEZlYiAy
MDIwIDE3OjIyOjQ2ICswMTAwLCBCZW5qYW1pbiBHYWlnbmFyZCB3cm90ZToKPiA+PiBDb252ZXJ0
IHN0bWZ4IGJpbmRpbmdzIHRvIGpzb24tc2NoZW1hCj4gPj4KPiA+PiBTaWduZWQtb2ZmLWJ5OiBC
ZW5qYW1pbiBHYWlnbmFyZCA8YmVuamFtaW4uZ2FpZ25hcmRAc3QuY29tPgo+ID4+IC0tLQo+ID4+
ICAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvbWZkL3N0LHN0bWZ4LnlhbWwgICAgICAgICAgfCAx
MjQgKysrKysrKysrKysrKysrKysrKysrCj4gPj4gICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvbWZkL3N0bWZ4LnR4dCAgICB8ICAyOCAtLS0tLQo+ID4+ICAgLi4uL2RldmljZXRy
ZWUvYmluZGluZ3MvcGluY3RybC9waW5jdHJsLXN0bWZ4LnR4dCAgfCAxMTYgLS0tLS0tLS0tLS0t
LS0tLS0tLQo+ID4+ICAgMyBmaWxlcyBjaGFuZ2VkLCAxMjQgaW5zZXJ0aW9ucygrKSwgMTQ0IGRl
bGV0aW9ucygtKQo+ID4+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9tZmQvc3Qsc3RtZngueWFtbAo+ID4+ICAgZGVsZXRlIG1vZGUgMTAwNjQ0
IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZmQvc3RtZngudHh0Cj4gPj4gICBk
ZWxldGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BpbmN0
cmwvcGluY3RybC1zdG1meC50eHQKPiA+Pgo+IEhpIExlZSwgUm9iLAo+IAo+IEkgaGF2ZW4ndCBi
ZWVuIGFibGUgdG8gZm91bmQgdGhpcyBwYXRjaCBpbiAtbmV4dCBicmFuY2hlcywgY2FuIG9uZSBv
ZiAKPiB5b3UgbWVyZ2UgaXQgPwo+IAo+IFRoYW5rcywKPiBCZW5qYW1pbgo+ID4gUmV2aWV3ZWQt
Ynk6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+CgpSb2IsCgpXZSBzaG91bGQgYWdyZWUg
b24gYSBwcm9jZXNzIGdvaW5nIGZvcndhcmQuICBEbyB5b3UgdGFrZSBEVCBkb2N1bWVudApjaGFu
Z2VzIG9yIHNob3VsZCBJPyAgVXAgdW50aWwgd2UgbW92ZWQgdG8gWUFNTCBmb3JtYXR0aW5nLCBJ
IHRvb2sKdGhlbSBidXQgcmVzcG9uc2libHkgc2VlbXMgdG8gaGF2ZSBtaWdyYXRlZCBvdmVyIHRv
IHlvdSBzaW5jZSB0aGVuLgoKSSBkb24ndCBtaW5kIGVpdGhlciB3YXkuCgotLSAKTGVlIEpvbmVz
IFvmnY7nkLzmlq9dCkxpbmFybyBTZXJ2aWNlcyBUZWNobmljYWwgTGVhZApMaW5hcm8ub3JnIOKU
giBPcGVuIHNvdXJjZSBzb2Z0d2FyZSBmb3IgQVJNIFNvQ3MKRm9sbG93IExpbmFybzogRmFjZWJv
b2sgfCBUd2l0dGVyIHwgQmxvZwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFp
bG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20v
bWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
