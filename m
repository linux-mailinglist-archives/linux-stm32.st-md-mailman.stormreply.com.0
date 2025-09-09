Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 81CAAB4A9C7
	for <lists+linux-stm32@lfdr.de>; Tue,  9 Sep 2025 12:12:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 44AE2C3F939;
	Tue,  9 Sep 2025 10:12:41 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 50CFDC3F93B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Sep 2025 10:12:39 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-45dda7d87faso26772455e9.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 09 Sep 2025 03:12:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757412759; x=1758017559;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=+hrS+gNEMWDxV0mKXtkhOcJ6h8ajN29VXW/74N9mIiM=;
 b=Sk9b8vZI0tBAad0o6FdQBczfwMx1yWU8l65JoAxpaAO2GfD2mWd7m8VbExtqGN8mqr
 UlxUbqwg6ii77fJuxmh7ZxkAbv5PoqmvENvtXj2dx3HdyrXX1dEbfyVNyNpf1or00850
 qBRbm2lAMiCHpVnojkFRTQro6ciyimx8JUCBHklCwhBANXduVQRHj+L7gxZIB7Bw7Tpm
 00DFAvS+ZBr05ScH6ma1QUYidpOZDIGGJNfNKxJD2VC9yPyPaHyXSNZtuySHR5cbgGf9
 iBkV7w7AA/PkPSTFWvAQBCxm/VyLjbSFjlbr/YJkrDJWMwZKJNSiy6hnmG53n2HIGTEV
 T/xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757412759; x=1758017559;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+hrS+gNEMWDxV0mKXtkhOcJ6h8ajN29VXW/74N9mIiM=;
 b=uhxEH5dV5dyxUnCHji5bOX7u+s0NjYgJCXYfkj/BCdB6ESx8lBeQaWqp7V9bIqd94r
 gYD28zoQck0deM88BF/WrC0Cjk8NYnW/kcJvxRXWgNOyhu2dCaOrumGSGBCcIyw2FlH9
 EBIOnErkVeLit6TRDbn17LtHkYqNlvi9bYNcsLLTzraPPe4GbC6ckC3hUNLVINCNrgct
 2zPrFvRglWGq7atI5KhNgzrYUfNQPxSaUpFukRryA1aSQOQBBzwvxlinYt130zxoZfAS
 Dm4Tpni4fN1YSGPVCqbKdR6IhFeDiiyaKNE3ndmVUwqldigHnHaAXpM+aZxGlKPLW4Pu
 2nWg==
X-Gm-Message-State: AOJu0YwwHdnQOUlw0qs++epGRZ6/fk4k9A/T5SGQBiBCp6BHnBzArHDt
 g2CstUSpHZW1tEPn2X7yzJTy/VvQjyMIcZ9Aeo006YlWPPqu89iU6Zaz
X-Gm-Gg: ASbGnctp7LYFKRx0HdJIh1GcTxbyI86219e4Ze3AvL0O3jwJoPpNoJ+/CV4x5ql18gX
 UsC6d059fRxR4itmsd6VS897pnnbHZsQ/b8VlcRPpRRsR8iUlC5Z3GMLcXWXFqVjimCSOHuyg0F
 vDgrL1QiPiv0X1oHINu1A4WbOtwGhPpW5gJaURC2dMcCZj1d8q6rE0OEgz3q+jJOTM6rJSLgi9n
 LFZDwF+EzwJ/ZRH0CuhukT7mYFSpGOuAPfhyIa4tpVkwcY3wDz3rQnGr1JFOlm3Cw1eWj2jkRzG
 EmHsEBp/dJWlv7SGqAFQ5WJqlpi4Daqz93ztIk5RRuew+fdi88turbcj/9WTkXl/fzTfcNan9Cn
 EuPRBga9skaRjUjHik7rTHPRu7g8Eg8OgvwEl/6inBzuqpMBnJiiUt4qk78wTRZY+GjFTw7PXeO
 GM5s5ArhSJCt6wJH7be5XmIBch8g==
X-Google-Smtp-Source: AGHT+IF6kdfD0zGsjMmnAtNgzzWv37+IjLvZ504xPGjikiuj3U4fWnzlKF5W2UHoTYqJemkuMoORFg==
X-Received: by 2002:a05:600c:4ecd:b0:45d:d5fb:1858 with SMTP id
 5b1f17b1804b1-45dddee8e80mr91947355e9.21.1757412758646; 
 Tue, 09 Sep 2025 03:12:38 -0700 (PDT)
Received: from localhost (2a02-8440-7136-74e7-5ebf-4282-0e1a-b885.rev.sfr.net.
 [2a02:8440:7136:74e7:5ebf:4282:e1a:b885])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3e75223ea47sm1973272f8f.46.2025.09.09.03.12.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Sep 2025 03:12:37 -0700 (PDT)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
Date: Tue, 09 Sep 2025 12:12:19 +0200
MIME-Version: 1.0
Message-Id: <20250909-b4-ddrperfm-upstream-v6-12-ce082cc801b5@gmail.com>
References: <20250909-b4-ddrperfm-upstream-v6-0-ce082cc801b5@gmail.com>
In-Reply-To: <20250909-b4-ddrperfm-upstream-v6-0-ce082cc801b5@gmail.com>
To: Gatien Chevallier <gatien.chevallier@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Julius Werner <jwerner@chromium.org>, 
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Jonathan Corbet <corbet@lwn.net>
X-Mailer: b4 0.15-dev-dfb17
Cc: devicetree@vger.kernel.org,
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-perf-users@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v6 12/20] dt-bindings: perf: stm32: introduce
 DDRPERFM dt-bindings
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

RnJvbTogQ2zDqW1lbnQgTGUgR29mZmljIDxjbGVtZW50LmxlZ29mZmljQGZvc3Muc3QuY29tPgoK
RERSUEVSRk0gaXMgdGhlIEREUiBQZXJmb3JtYW5jZSBNb25pdG9yIGVtYmVkZGVkIGluIFNUTTMy
TVBVIFNvQy4KSXQgYWxsb3dzIHRvIG1vbml0b3IgRERSIGV2ZW50cyB0aGF0IGNvbWUgZnJvbSB0
aGUgRERSIENvbnRyb2xsZXIKc3VjaCBhcyByZWFkIG9yIHdyaXRlIGV2ZW50cy4KClNpZ25lZC1v
ZmYtYnk6IENsw6ltZW50IExlIEdvZmZpYyA8Y2xlbWVudC5sZWdvZmZpY0Bmb3NzLnN0LmNvbT4K
U2lnbmVkLW9mZi1ieTogQ2zDqW1lbnQgTGUgR29mZmljIDxsZWdvZmZpYy5jbGVtZW50QGdtYWls
LmNvbT4KLS0tCiAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9wZXJmL3N0LHN0bTMyLWRkci1wbXUu
eWFtbCB8IDk0ICsrKysrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA5NCBpbnNl
cnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L3BlcmYvc3Qsc3RtMzItZGRyLXBtdS55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL3BlcmYvc3Qsc3RtMzItZGRyLXBtdS55YW1sCm5ldyBmaWxlIG1vZGUgMTAwNjQ0Cmlu
ZGV4IDAwMDAwMDAwMDAwMC4uMWQ5Nzg2MWUzZDQ0Ci0tLSAvZGV2L251bGwKKysrIGIvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BlcmYvc3Qsc3RtMzItZGRyLXBtdS55YW1sCkBA
IC0wLDAgKzEsOTQgQEAKKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IChHUEwtMi4wLW9ubHkg
T1IgQlNELTItQ2xhdXNlKQorJVlBTUwgMS4yCistLS0KKyRpZDogaHR0cDovL2RldmljZXRyZWUu
b3JnL3NjaGVtYXMvcGVyZi9zdCxzdG0zMi1kZHItcG11LnlhbWwjCiskc2NoZW1hOiBodHRwOi8v
ZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCMKKworbWFpbnRhaW5lcnM6Cisg
IC0gQ2zDqW1lbnQgTGUgR29mZmljIDxsZWdvZmZpYy5jbGVtZW50QGdtYWlsLmNvbT4KKwordGl0
bGU6IFNUTWljcm9lbGVjdHJvbmljcyBTVE0zMiBERFIgUGVyZm9ybWFuY2UgTW9uaXRvciAoRERS
UEVSRk0pCisKK3Byb3BlcnRpZXM6CisgIGNvbXBhdGlibGU6CisgICAgb25lT2Y6CisgICAgICAt
IGl0ZW1zOgorICAgICAgICAgIC0gY29uc3Q6IHN0LHN0bTMybXAxMzEtZGRyLXBtdQorICAgICAg
LSBpdGVtczoKKyAgICAgICAgICAtIGVudW06CisgICAgICAgICAgICAgIC0gc3Qsc3RtMzJtcDE1
MS1kZHItcG11CisgICAgICAgICAgLSBjb25zdDogc3Qsc3RtMzJtcDEzMS1kZHItcG11CisgICAg
ICAtIGl0ZW1zOgorICAgICAgICAgIC0gY29uc3Q6IHN0LHN0bTMybXAyNTEtZGRyLXBtdQorCisg
IHJlZzoKKyAgICBtYXhJdGVtczogMQorCisgIGNsb2NrczoKKyAgICBtYXhJdGVtczogMQorCisg
IHJlc2V0czoKKyAgICBtYXhJdGVtczogMQorCisgIGFjY2Vzcy1jb250cm9sbGVyczoKKyAgICBt
aW5JdGVtczogMQorICAgIG1heEl0ZW1zOiAyCisKKyAgbWVtb3J5LWNoYW5uZWw6CisgICAgZGVz
Y3JpcHRpb246CisgICAgICBUaGUgbWVtb3J5IGNoYW5uZWwgdGhpcyBERFJQRVJGTSBpcyBhdHRh
Y2hlZCB0by4KKyAgICAkcmVmOiAvc2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy9waGFu
ZGxlCisKK3JlcXVpcmVkOgorICAtIGNvbXBhdGlibGUKKyAgLSByZWcKKworYWxsT2Y6CisgIC0g
aWY6CisgICAgICBwcm9wZXJ0aWVzOgorICAgICAgICBjb21wYXRpYmxlOgorICAgICAgICAgIGNv
bnRhaW5zOgorICAgICAgICAgICAgY29uc3Q6IHN0LHN0bTMybXAxMzEtZGRyLXBtdQorICAgIHRo
ZW46CisgICAgICByZXF1aXJlZDoKKyAgICAgICAgLSBjbG9ja3MKKyAgICAgICAgLSByZXNldHMK
KworICAtIGlmOgorICAgICAgcHJvcGVydGllczoKKyAgICAgICAgY29tcGF0aWJsZToKKyAgICAg
ICAgICBjb250YWluczoKKyAgICAgICAgICAgIGNvbnN0OiBzdCxzdG0zMm1wMjUxLWRkci1wbXUK
KyAgICB0aGVuOgorICAgICAgcmVxdWlyZWQ6CisgICAgICAgIC0gYWNjZXNzLWNvbnRyb2xsZXJz
CisgICAgICAgIC0gbWVtb3J5LWNoYW5uZWwKKworYWRkaXRpb25hbFByb3BlcnRpZXM6IGZhbHNl
CisKK2V4YW1wbGVzOgorICAtIHwKKyAgICAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvY2xvY2svc3Rt
MzJtcDEtY2xrcy5oPgorICAgICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9yZXNldC9zdG0zMm1wMS1y
ZXNldHMuaD4KKworICAgIHBlcmZANWEwMDcwMDAgeworICAgICAgICBjb21wYXRpYmxlID0gInN0
LHN0bTMybXAxNTEtZGRyLXBtdSIsICJzdCxzdG0zMm1wMTMxLWRkci1wbXUiOworICAgICAgICBy
ZWcgPSA8MHg1YTAwNzAwMCAweDQwMD47CisgICAgICAgIGNsb2NrcyA9IDwmcmNjIEREUlBFUkZN
PjsKKyAgICAgICAgcmVzZXRzID0gPCZyY2MgRERSUEVSRk1fUj47CisgICAgfTsKKworICAtIHwK
KyAgICBkZHJfY2hhbm5lbDogc2RyYW0tY2hhbm5lbC0wIHsKKyAgICAgICAgI2FkZHJlc3MtY2Vs
bHMgPSA8MT47CisgICAgICAgICNzaXplLWNlbGxzID0gPDA+OworICAgICAgICBjb21wYXRpYmxl
ID0gImplZGVjLGRkcjQtY2hhbm5lbCI7CisgICAgICAgIGlvLXdpZHRoID0gPDE2PjsKKyAgICB9
OworCisgICAgcGVyZkA0ODA0MTAwMCB7CisgICAgICBjb21wYXRpYmxlID0gInN0LHN0bTMybXAy
NTEtZGRyLXBtdSI7CisgICAgICByZWcgPSA8MHg0ODA0MTAwMCAweDQwMD47CisgICAgICBhY2Nl
c3MtY29udHJvbGxlcnMgPSA8JnJjYyAxMDQ+OworICAgICAgbWVtb3J5LWNoYW5uZWwgPSA8JmRk
cl9jaGFubmVsPjsKKyAgICB9OwoKLS0gCjIuNDMuMAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0
bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0
b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
