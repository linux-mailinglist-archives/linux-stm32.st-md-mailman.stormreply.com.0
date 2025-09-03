Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E92DDB41AC6
	for <lists+linux-stm32@lfdr.de>; Wed,  3 Sep 2025 11:56:48 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A4E6BC3F95F;
	Wed,  3 Sep 2025 09:56:48 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 20DADC3FAC7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 Sep 2025 09:56:47 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-45cb6d8f42cso1985455e9.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 03 Sep 2025 02:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756893406; x=1757498206;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wRGL+yvGCt5Y/YQJFhgCAidgUtWHfFyrPOfmPr2jchE=;
 b=R3Ab2Aixprq1sOFEip51vvBfLZdNbCkH8NNZ8f26ZKGi3yHFxufo/66mpKt6A4BqlU
 MvL9IxvA2N9H+hKShZt6pAnHKXj3+cQ5xHe4H6KhjhCL/MJgroHP+etGcbU8YKISsYRi
 VNlgyNjBYhVm9Q+RFDBSsRGutMgq6lGKUtdf/rS6iaXypa7ZGEQbKC7sPtyAe99tBzV/
 ExC1njddQVtTJ9S9RPARURfhQXJVIsSx+pRBFI9iMPZiPMaa+OrC5b8fXEEoZ+7+H/w4
 dD2FKMWesXax9d+i44doDiDG/xSPdFkcAKXSg3aIlGNndfK38BMswYfCKdeAvpC70Bl1
 bc4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756893406; x=1757498206;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wRGL+yvGCt5Y/YQJFhgCAidgUtWHfFyrPOfmPr2jchE=;
 b=MiSbq3OSUNVH3zq9VPrCLcwdkNJxC52LeVqKbDMnnyBwCvTUkCzqojI9/YX16MSFzx
 /uW6IyE4Yc2++NzUGLaImMViIoK9VzzZ10cTw8nQA4pcBIZtsYAp2mzazpv5Vc3lJ6Mi
 nIc7MEFaL+ZXn97zOqqescfPl0JY9xLlSm40Qsknf1VcSgcTRd5kX4HdOT3luBu5lzEb
 tcRNzdIcWZtcO9sOiq12fr6Ge0T9PP3hiwiAJSfV4m4HMC/AtDQn3plze9wFqPs30AQ3
 Aqi9u5yNQfCK5ElkgjgQFwgDfE14VWTqD5ppEArwE6Ckcqoa57WDdTxnNQ4Zf0jJloxC
 CvKg==
X-Forwarded-Encrypted: i=1;
 AJvYcCViAu6c7dHuIa0Hl12tpkz3T664VUJj0Q8OEdHK7st4kOEpdJqXWpTao6R0RMs2NwVkuNrIJZUnXv/4JA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwDrnjr9kRSRDflFfK0GFnJz6suXsDSMnw3JZRd0ibUkwAyqSIf
 +ZW/tBBKVKyrvMp7le4YM86oRP5yC+MRJKspRI31N8AKiCvwGzSNY4zV7xVkwd8zNa+XjG6t34W
 OQOjUsRpLHYe2ohdZpFZGK/JXeeoBLGA=
X-Gm-Gg: ASbGncuH9QnVwR4iW+fPFB4jDT6iwg6LpIkl8C+Nrx9Nx4eazbplEHRBMbrq2ZZn55d
 xdhzGRmHQ5t0ZUW5XCPvabIexJ0+HLDJwkPDPQfRTfLmuRyKD3fUfiGAQc/JlSkF+2o5nPsi7eP
 NUI/DSHbpBieSwI2fhIt76m0Cq9CBjCohvKP7jDaAVQwPY4ybZP0gLxN/Zt8gr7wLJ91mpTjsvO
 0tZf6dRKvaDq7srs5Y=
X-Google-Smtp-Source: AGHT+IEQUqA1qdyBjSIqEH7yyO8Yto1g3IUsn6wF/lfNaBELqiermAkFpi4/ZOCBGDgVSpzOqFCGaE8gu4cJp0yyq2U=
X-Received: by 2002:a05:600c:8b17:b0:45b:8d61:9d02 with SMTP id
 5b1f17b1804b1-45b8e52fa48mr86888605e9.30.1756893406116; Wed, 03 Sep 2025
 02:56:46 -0700 (PDT)
MIME-Version: 1.0
References: <20250902001302.3823418-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250902001302.3823418-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdU_BHtHznN8C7s0Yf=nxBaXb94MLFD-Pcz73W8hJhxc-w@mail.gmail.com>
In-Reply-To: <CAMuHMdU_BHtHznN8C7s0Yf=nxBaXb94MLFD-Pcz73W8hJhxc-w@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 3 Sep 2025 10:56:19 +0100
X-Gm-Features: Ac12FXzyrhXt8ty31ymC76K4PCsLmoMNIPvsEjNtyJoctbgrdUIEhn5oIWhc6mE
Message-ID: <CA+V-a8sUgu9YgtnkCYEzGtfH=2dQCyj9Q7Wu1+WaKrDWy3vjiw@mail.gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Eric Dumazet <edumazet@google.com>,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh@kernel.org>,
 Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@armlinux.org.uk>,
 Jose Abreu <joabreu@synopsys.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>, Philipp Zabel <p.zabel@pengutronix.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH net-next 2/4] dt-bindings: net: renesas,
 rzv2h-gbeth: Document Renesas RZ/T2H and RZ/N2H SoCs
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

SGkgR2VlcnQsCgpUaGFuayB5b3UgZm9yIHRoZSByZXZpZXcuCgpPbiBXZWQsIFNlcCAzLCAyMDI1
IGF0IDEwOjA54oCvQU0gR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4g
d3JvdGU6Cj4KPiBIaSBQcmFiaGFrYXIsCj4KPiBUaGFua3MgZm9yIHlvdXIgcGF0Y2ghCj4KPiBP
biBUdWUsIDIgU2VwdCAyMDI1IGF0IDAyOjEzLCBQcmFiaGFrYXIgPHByYWJoYWthci5jc2VuZ2dA
Z21haWwuY29tPiB3cm90ZToKPiA+IEZyb206IExhZCBQcmFiaGFrYXIgPHByYWJoYWthci5tYWhh
ZGV2LWxhZC5yakBicC5yZW5lc2FzLmNvbT4KPiA+Cj4gPiBEb2N1bWVudCB0aGUgRXRoZXJuZXQg
TUFDIChHTUFDKSBJUCBwcmVzZW50IG9uIHRoZSBSZW5lc2FzIFJaL1QySAo+ID4gKFI5QTA5RzA3
NykgYW5kIFJaL04ySCAoUjlBMDlHMDg3KSBTb0NzLiBUaGUgR01BQyBJUCBvbiBSWi9OMkggaXMK
PiA+IGlkZW50aWNhbCB0byB0aGF0IGZvdW5kIG9uIHRoZSBSWi9UMkggU29DLgo+ID4KPiA+IFdo
aWxlIHRoZSBSWi9WMkgoUCksIFJaL1QySCwgYW5kIFJaL04ySCBTb0NzIGFsbCBpbnRlZ3JhdGUg
dGhlIFN5bm9wc3lzCj4gPiBEZXNpZ25XYXJlIE1BQyAodmVyc2lvbiA1LjIwKSwgdGhlIGhhcmR3
YXJlIGlzIHN5bnRoZXNpemVkIHdpdGggZGlmZmVyZW50Cj4gPiBvcHRpb25zIGNvbXBhcmVkIHRv
IHRoZSBSWi9WMkgoUCk6Cj4gPiAgIC0gUlovVDJIIHJlcXVpcmVzIG9ubHkgMyBjbG9ja3MgaW5z
dGVhZCBvZiA3Cj4gPiAgIC0gUlovVDJIIHN1cHBvcnRzIDggUlgvVFggcXVldWUgcGFpcnMgaW5z
dGVhZCBvZiA0Cj4gPiAgIC0gUlovVDJIIG5lZWRzIDIgcmVzZXQgY29udHJvbHMgd2l0aCByZXNl
dC1uYW1lcyBwcm9wZXJ0eSwgdnMuIGEgc2luZ2xlCj4gPiAgICAgdW5uYW1lZCByZXNldAo+ID4g
ICAtIFJaL1QySCBoYXMgdGhlIHNwbGl0IGhlYWRlciBmZWF0dXJlIGVuYWJsZWQsIHdoaWxlIGl0
IGlzIGRpc2FibGVkIG9uCj4gPiAgICAgUlovVjJIKFApCj4gPgo+ID4gVG8gYWNjb21tb2RhdGUg
dGhlc2UgZGlmZmVyZW5jZXMsIGludHJvZHVjZSBhIG5ldyBnZW5lcmljIGNvbXBhdGlibGUKPiA+
IHN0cmluZyBgcmVuZXNhcyxyenQyaC1nYmV0aGAsIHVzZWQgYXMgYSBmYWxsYmFjayBmb3IgYm90
aCBSWi9UMkggYW5kCj4gPiBSWi9OMkggU29Dcy4KPgo+IFVudGlsIG5vdywgd2UgZGlkbid0IGhh
dmUgYW55IGZhbWlseS1zcGVjaWZpYyAicmVuZXNhcyxyenQyaC0qIgo+IGNvbXBhdGlibGUgdmFs
dWVzLiAgSW5zdGVhZCwgd2UgYWx3YXlzIHVzZWQgIiByZW5lc2FzLHI5YTA5ZzA3Ny08Zm9vPiIK
PiBhcyBhIGZhbGxiYWNrIGZvciAicmVuZXNhcyxyOWEwOWcwODctPGZvbz4iLgo+IElzIHRoZXJl
IGFueSBnb29kIHJlYXNvbiB0byBzdGFydCBkZXZpYXRpbmcgZnJvbSB0aGlzPwo+ClJpZ2h0LCBJ
IG1pc3NlZCB0aGF0ISBJICdsbCBzd2l0Y2ggYmFjayB0byB0aGUgcHJldmlvdXMgYXBwcm9hY2gu
CgpDaGVlcnMsClByYWJoYWthcgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFp
bG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20v
bWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
