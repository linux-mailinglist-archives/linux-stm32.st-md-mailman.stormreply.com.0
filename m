Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E208696490
	for <lists+linux-stm32@lfdr.de>; Tue, 14 Feb 2023 14:23:10 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 31889C6A5F5;
	Tue, 14 Feb 2023 13:23:10 +0000 (UTC)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com
 [209.85.217.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 94E40C69063
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Feb 2023 13:23:08 +0000 (UTC)
Received: by mail-vs1-f48.google.com with SMTP id d66so16440355vsd.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Feb 2023 05:23:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4d/IW4N4wxgQvgkiL75RXQZp2sQYcrN7W4VVjwtQeMs=;
 b=kGfCTuAdlYgItY8rlODWig3jPbUTpFkNsdf0tbLPgTgOibi52bakl3Luj906AcvpWt
 v8ow173IkIoKPx9uFF01BjD5tCuy2uq9vcgNaYIOP085TdDGC0f2cXcAtBHK2XlDWYwg
 kZXICBP5p4aPF4THhHVGEMcZag0haCCPC9TLUYEcPvFLHMfpTNbm1uov0DkFhsfFtV/v
 H3V5VCypclFSu5XHx2wbBn7d0t8PsTGu+mg9h0fs0u97SNlHlmH5eVi3MePQLZ1OOQIJ
 r2ayAAw0B/dCf5/RMKqX5rBkmisBvZ8Nuq7NSwjBqK5ndpVAcAxQ4bmj5R1AcAZz7+t4
 dLQQ==
X-Gm-Message-State: AO0yUKUNnJMjDSmNGjQJ892MqxorDZp4pxzpBh3ljwpIqsN2AQ/hhZUz
 8T20gRyOafoLtw+OJkxeYXNXdjpgzOkUW5+6
X-Google-Smtp-Source: AK7set87PNrMRp3Y1dEwsulOxQIShlHJlX3ZedwHMwgVE9yqY9Sku4Df9xVjMet30Q98uw5ihxGXXg==
X-Received: by 2002:a67:d283:0:b0:411:c3ed:da93 with SMTP id
 z3-20020a67d283000000b00411c3edda93mr2434854vsi.8.1676380987301; 
 Tue, 14 Feb 2023 05:23:07 -0800 (PST)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com.
 [209.85.222.43]) by smtp.gmail.com with ESMTPSA id
 n11-20020ab0540b000000b00686fd08183bsm95337uaa.28.2023.02.14.05.23.07
 for <linux-stm32@st-md-mailman.stormreply.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Feb 2023 05:23:07 -0800 (PST)
Received: by mail-ua1-f43.google.com with SMTP id u3so2802874uae.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Feb 2023 05:23:07 -0800 (PST)
X-Received: by 2002:a05:690c:ea2:b0:4fc:962d:7dc1 with SMTP id
 cr2-20020a05690c0ea200b004fc962d7dc1mr197860ywb.301.1676380647699; Tue, 14
 Feb 2023 05:17:27 -0800 (PST)
MIME-Version: 1.0
References: <20230209151632.275883-1-clement.leger@bootlin.com>
 <20230209151632.275883-7-clement.leger@bootlin.com>
In-Reply-To: <20230209151632.275883-7-clement.leger@bootlin.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 14 Feb 2023 14:17:15 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVpkX=_GBacD7i2+fCkTuMoGS+Y0Gh1U2fWZ2RDj6aX1g@mail.gmail.com>
Message-ID: <CAMuHMdVpkX=_GBacD7i2+fCkTuMoGS+Y0Gh1U2fWZ2RDj6aX1g@mail.gmail.com>
To: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>
Cc: Herve Codina <herve.codina@bootlin.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Kurt Kanzenbach <kurt@linutronix.de>, Eric Dumazet <edumazet@google.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?Q?Miqu=C3=A8l_Raynal?= <miquel.raynal@bootlin.com>,
 Jon Hunter <jonathanh@nvidia.com>, linux-stm32@st-md-mailman.stormreply.com,
 Tan Tee Min <tee.min.tan@linux.intel.com>, Magnus Damm <magnus.damm@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Wong Vee Khee <veekhee@apple.com>,
 Jose Abreu <joabreu@synopsys.com>, Milan Stevanovic <milan.stevanovic@se.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 devicetree@vger.kernel.org,
 Mohammad Athari Bin Ismail <mohammad.athari.ismail@intel.com>,
 Rob Herring <robh+dt@kernel.org>, Revanth Kumar Uppala <ruppala@nvidia.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Jimmy Lalande <jimmy.lalande@se.com>, linux-arm-kernel@lists.infradead.org,
 Sergey Shtylyov <s.shtylyov@omp.ru>, Pascal Eberhard <pascal.eberhard@se.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH net-next v3 6/6] ARM: dts: r9a06g032:
	describe GMAC1
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

SGkgQ2zDqW1lbnQsCgpPbiBUaHUsIEZlYiA5LCAyMDIzIGF0IDQ6MTQgUE0gQ2zDqW1lbnQgTMOp
Z2VyIDxjbGVtZW50LmxlZ2VyQGJvb3RsaW4uY29tPiB3cm90ZToKPiBSWi9OMSBTb0MgaW5jbHVk
ZXMgdHdvIE1BQyBuYW1lZCBHTUFDeCB0aGF0IGFyZSBjb21wYXRpYmxlIHdpdGggdGhlCj4gInNu
cHMsZHdtYWMiIGRyaXZlci4gR01BQzEgaXMgY29ubmVjdGVkIGRpcmVjdGx5IHRvIHRoZSBNSUkg
Y29udmVydGVyCj4gcG9ydCAxLiBTaW5jZSB0aGlzIE1JSSBjb252ZXJ0ZXIgaXMgcmVwcmVzZW50
ZWQgdXNpbmcgYSBQQ1MgZHJpdmVyLCBpdAo+IHVzZXMgdGhlIHJlbmVzYXMgc3BlY2lmaWMgY29t
cGF0aWJsZSBkcml2ZXIgd2hpY2ggdXNlcyB0aGlzIFBDUy4KPgo+IFNpZ25lZC1vZmYtYnk6IENs
w6ltZW50IEzDqWdlciA8Y2xlbWVudC5sZWdlckBib290bGluLmNvbT4KClRoYW5rcyBmb3IgeW91
ciBwYXRjaCEKCj4gLS0tIGEvYXJjaC9hcm0vYm9vdC9kdHMvcjlhMDZnMDMyLmR0c2kKPiArKysg
Yi9hcmNoL2FybS9ib290L2R0cy9yOWEwNmcwMzIuZHRzaQo+IEBAIC0zMDQsNiArMzA0LDI0IEBA
IGRtYTE6IGRtYS1jb250cm9sbGVyQDQwMTA1MDAwIHsKPiAgICAgICAgICAgICAgICAgICAgICAg
ICBkYXRhLXdpZHRoID0gPDg+Owo+ICAgICAgICAgICAgICAgICB9Owo+Cj4gKyAgICAgICAgICAg
ICAgIGdtYWMxOiBldGhlcm5ldEA0NDAwMDAwMCB7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAg
Y29tcGF0aWJsZSA9ICJyZW5lc2FzLHI5YTA2ZzAzMi1nbWFjIiwgInJlbmVzYXMscnpuMS1nbWFj
IiwgInNucHMsZHdtYWMiOwo+ICsgICAgICAgICAgICAgICAgICAgICAgIHJlZyA9IDwweDQ0MDAw
MDAwIDB4MjAwMD47Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgaW50ZXJydXB0LXBhcmVudCA9
IDwmZ2ljPjsKPiArICAgICAgICAgICAgICAgICAgICAgICBpbnRlcnJ1cHRzID0gPEdJQ19TUEkg
MzQgSVJRX1RZUEVfTEVWRUxfSElHSD4sCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIDxHSUNfU1BJIDM2IElSUV9UWVBFX0xFVkVMX0hJR0g+LAo+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICA8R0lDX1NQSSAzNSBJUlFfVFlQRV9MRVZFTF9ISUdIPjsK
PiArICAgICAgICAgICAgICAgICAgICAgICBpbnRlcnJ1cHQtbmFtZXMgPSAibWFjaXJxIiwgImV0
aF93YWtlX2lycSIsICJldGhfbHBpIjsKPiArICAgICAgICAgICAgICAgICAgICAgICBjbG9jay1u
YW1lcyA9ICJzdG1tYWNldGgiOwoKUGxlYXNlIG1vdmUgY2xvY2stbmFtZXMgYmVsb3cgY2xvY2tz
LCBsaWtlIGluIGFsbCBvdGhlciBub2Rlcy4KCj4gKyAgICAgICAgICAgICAgICAgICAgICAgY2xv
Y2tzID0gPCZzeXNjdHJsIFI5QTA2RzAzMl9IQ0xLX0dNQUMwPjsKCk1pc3NpbmcgcG93ZXItZG9t
YWlucyBwcm9wZXJ0eS4KCj4gKyAgICAgICAgICAgICAgICAgICAgICAgc25wcyxtdWx0aWNhc3Qt
ZmlsdGVyLWJpbnMgPSA8MjU2PjsKPiArICAgICAgICAgICAgICAgICAgICAgICBzbnBzLHBlcmZl
Y3QtZmlsdGVyLWVudHJpZXMgPSA8MTI4PjsKPiArICAgICAgICAgICAgICAgICAgICAgICB0eC1m
aWZvLWRlcHRoID0gPDIwNDg+Owo+ICsgICAgICAgICAgICAgICAgICAgICAgIHJ4LWZpZm8tZGVw
dGggPSA8NDA5Nj47Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgcGNzLWhhbmRsZSA9IDwmbWlp
X2NvbnYxPjsKPiArICAgICAgICAgICAgICAgICAgICAgICBzdGF0dXMgPSAiZGlzYWJsZWQiOwo+
ICsgICAgICAgICAgICAgICB9Owo+ICsKPiAgICAgICAgICAgICAgICAgZ21hYzI6IGV0aGVybmV0
QDQ0MDAyMDAwIHsKPiAgICAgICAgICAgICAgICAgICAgICAgICBjb21wYXRpYmxlID0gInJlbmVz
YXMscjlhMDZnMDMyLWdtYWMiLCAicmVuZXNhcyxyem4xLWdtYWMiLCAic25wcyxkd21hYyI7Cj4g
ICAgICAgICAgICAgICAgICAgICAgICAgcmVnID0gPDB4NDQwMDIwMDAgMHgyMDAwPjsKCkdye29l
dGplLGVldGluZ31zLAoKICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQKCi0tIApHZWVydCBV
eXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0
QGxpbnV4LW02OGsub3JnCgpJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2Fs
IHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4gQnV0CndoZW4gSSdtIHRhbGtpbmcgdG8g
am91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5nIGxpa2UgdGhh
dC4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxkcwpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBt
YWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRw
czovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1z
dG0zMgo=
