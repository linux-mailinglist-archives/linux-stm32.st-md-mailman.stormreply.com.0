Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 51843B8FE6A
	for <lists+linux-stm32@lfdr.de>; Mon, 22 Sep 2025 12:06:21 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 06B2CC32E92;
	Mon, 22 Sep 2025 10:06:21 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 44036C32E8F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Sep 2025 10:06:20 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-3f0ae439bc3so1457854f8f.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Sep 2025 03:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758535579; x=1759140379;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=unx+477Xo9SXjdzpioJOWI84YS3CAeJIIcacV6mD704=;
 b=GUAuKzA8eLTo5V8fVQ61/YphFcaMpDFgmc/a6W4XTE1/2h52zMUwqG2ZnEj3JLM8lo
 44CK8REhj83ahmfepMylq7AAXcorxnMwi6q7t0nh2s25ZevBBLNRpZ3FhjdOyZV9nXTf
 Ntlg7UzQKZvHxp4KlBWh4BwHVMBn5nEIlWYjXQf15XVnvRlr/D5q+kgcEk8vS4vrozzn
 HMaPEYCz+K8UnEmnPSG2Eqg+515Up22kprUtt1jnN6gapzbiHOlSyOlDoHZskDIUhJl1
 tQ+KVWiv8NwVbifiZXcxY65RkbFUO2WdbA4jIzVPZUIZpDbO23mYRZHASXqway7DLeLF
 wy7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758535579; x=1759140379;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=unx+477Xo9SXjdzpioJOWI84YS3CAeJIIcacV6mD704=;
 b=wW/v3ADYilcYH/vRThLUndLw75uLPvbQwRaNqvb2mmOl6WSP8Tlcdo04edDmuHHhr9
 39jWa214FktolLwy17rL+z0+w4hn2soPn8ddrvr+BaJtgqxVDsJyjxNOi9oWk5b4dml7
 jMZ2JmHRmKRY2H9B1dikORVtXTLR0eSZyvq0PA5bIMZGvHS6BdAbM5iLZWhVXzI3eqJe
 DBMtOZczoCa6rqRK8DJVSpjKluCDT5kMlW9sVEAnfBzSLGPlwhq4AK+S/6xGpEmAi8Il
 W8Zggf1vQ1ulMFNlHDwuHyzdAbYTrYRrjnlKbxEv6nV4GiI8B2cWHXnliVuJ15nbF8fo
 Reeg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVP7jZ+y0Pv4oARkTgeDEhqX0FArpr10vpcqHXabrUUXWtV8Kh78vrC/EHdOEBud34Ey9eboBk6O7O78Q==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzjfVx4HuzDjFvp1fQb36RfqXwpZMWzi3XqK6DWqNcYhMZw9TOu
 b2Ekp1TJZJjCZdB5X64YNZ14RH41cTZ9vvXiHtcJ+HlnRrx9RMA+shpS
X-Gm-Gg: ASbGncsvfUaEVG7idpRV2jtlSkfBqHDvZSR1KTpVpZ28BlSdauBGMzQehLHLip3JPR/
 ugDJnFy3z/gwuC/UX7QE0hz7gRLPQ233KQmBdgCkPLFd4nGdORVzPFgD9tc8hT6gFM6En8ix0kR
 hIdNKc14xGbHcZdBrs+T4mxf1SfZ3RCvUBsdjcQPrELj7yVS+OMtphobssVdc8rbLaaQ1ibN4jP
 0oRgxG6GXT6lJFV+9oXjhkapGH/S8ZLLcVKWLmXu+bPGcU47N79xy+ZzwrIAslLIXcV14RAvFQF
 t9SR4E6RabwKf2ueBQauUUbqYzfbvGeESN62LCUmAYTybYOVXpPDARd/9ysnSW5xVY4o6ymIJ0I
 abcVJ/Sa/rZ7tTv5aDot+V0kjolOW86c1kHZBWL0Io58a37nI8Xk6wH/RznrW/tcrTBeP6lmHrQ
 hg5cC+pAmuw7Rx/Kdh
X-Google-Smtp-Source: AGHT+IFPgQWMfW7+KuDx0XBlYA9F21pJgkpSv8WTV4nH9rMZwyvad2B/FC4WdzJHu0BGJqOjLMdEzA==
X-Received: by 2002:a05:6000:22c4:b0:402:7afc:1cf5 with SMTP id
 ffacd0b85a97d-4027afc20d1mr695483f8f.35.1758535579347; 
 Mon, 22 Sep 2025 03:06:19 -0700 (PDT)
Received: from localhost (2a02-8440-750d-3377-171e-75f8-f2d4-2af8.rev.sfr.net.
 [2a02:8440:750d:3377:171e:75f8:f2d4:2af8])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46d1f3e1b03sm40908675e9.23.2025.09.22.03.06.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Sep 2025 03:06:19 -0700 (PDT)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
Date: Mon, 22 Sep 2025 12:06:13 +0200
Message-Id: <20250922-b4-ddr-bindings-v7-0-b3dd20e54db6@gmail.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAJUf0WgC/x3MQQqAIBBA0avIrBtQS6WuEi0sR5uNhUIE0d2Tl
 m/x/wOVClOFSTxQ6OLKR25wnYBt9zkRcmgGLbWRo9a4DhhCwZVz4JwqOmUV9SR9NBZadRaKfP/
 HeXnfD6+bg1phAAAA
X-Change-ID: 20250922-b4-ddr-bindings-7161e3e0af56
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Julius Werner <jwerner@chromium.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.15-dev-0dae4
Cc: devicetree@vger.kernel.org,
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v7 0/7] Add DDR4 memory-controller bindings
 and factorise LPDDR and DDR bindings
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

SW50cm9kdWNlIEREUjQgYmluZGluZ3MsIHdoaWNoIGlzIHRoZSBmaXJzdCBERFIgdHlwZSB0byBi
ZSBhZGRlZC4KQXMgdGhlIEREUiBhbmQgTFBERFIgdXNlIHRoZSBzYW1lIHByb3BlcnRpZXMsIGZh
Y3RvcmlzZSB0aGVtIGluIGEKc2RyYW0tcHJvcHMgYmluZGluZ3MgZmlsZSBhbmQgcmVuYW1lIGxw
ZGRyLWNoYW5uZWwgaW50byBzZHJhbS1jaGFubmVsLgoKVGhpcyB2NyBpcyBhIHN1YnNldCBvZiB0
aGUgdjYgYW5kIG90aGVyIHByaW9yIHZlcnNpb25zLCBzcGxpdCB0byBzaW1wbGlmeQp0aGUgcmV2
aWV3IGFuZCBtZXJnaW5nIHByb2Nlc3MuCgpDaGFuZ2VzIGluIHY3OgotIE5vbmUKLSBMaW5rIHRv
IHY2OiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNTA5MDktYjQtZGRycGVyZm0tdXBz
dHJlYW0tdjYtNS1jZTA4MmNjODAxYjVAZ21haWwuY29tLwoKU2lnbmVkLW9mZi1ieTogQ2zDqW1l
bnQgTGUgR29mZmljIDxsZWdvZmZpYy5jbGVtZW50QGdtYWlsLmNvbT4KLS0tCkNsw6ltZW50IExl
IEdvZmZpYyAoNyk6CiAgICAgIGR0LWJpbmRpbmdzOiBtZW1vcnk6IGZhY3RvcmlzZSBMUEREUiBw
cm9wcyBpbnRvIFNEUkFNIHByb3BzCiAgICAgIGR0LWJpbmRpbmdzOiBtZW1vcnk6IGludHJvZHVj
ZSBERFI0CiAgICAgIGR0LWJpbmRpbmdzOiBtZW1vcnk6IGZhY3RvcmlzZSBMUEREUiBjaGFubmVs
IGJpbmRpbmcgaW50byBTRFJBTSBjaGFubmVsCiAgICAgIGR0LWJpbmRpbmc6IG1lbW9yeTogYWRk
IEREUjQgY2hhbm5lbCBjb21wYXRpYmxlCiAgICAgIGR0LWJpbmRpbmdzOiBtZW1vcnk6IFNEUkFN
IGNoYW5uZWw6IHN0YW5kYXJkaXNlIG5vZGUgbmFtZQogICAgICBhcm02NDogZHRzOiBzdDogYWRk
IExQRERSIGNoYW5uZWwgdG8gc3RtMzJtcDI1N2YtZGsgYm9hcmQKICAgICAgYXJtNjQ6IGR0czog
c3Q6IGFkZCBERFIgY2hhbm5lbCB0byBzdG0zMm1wMjU3Zi1ldjEgYm9hcmQKCiAuLi4vbWVtb3J5
LWNvbnRyb2xsZXJzL2Rkci9qZWRlYyxkZHI0LnlhbWwgICAgICAgICB8IDM0ICsrKysrKysrCiAu
Li4vbWVtb3J5LWNvbnRyb2xsZXJzL2Rkci9qZWRlYyxscGRkci1wcm9wcy55YW1sICB8IDc0IC0t
LS0tLS0tLS0tLS0tLS0tCiAuLi4vbWVtb3J5LWNvbnRyb2xsZXJzL2Rkci9qZWRlYyxscGRkcjIu
eWFtbCAgICAgICB8ICAyICstCiAuLi4vbWVtb3J5LWNvbnRyb2xsZXJzL2Rkci9qZWRlYyxscGRk
cjMueWFtbCAgICAgICB8ICAyICstCiAuLi4vbWVtb3J5LWNvbnRyb2xsZXJzL2Rkci9qZWRlYyxs
cGRkcjQueWFtbCAgICAgICB8ICAyICstCiAuLi4vbWVtb3J5LWNvbnRyb2xsZXJzL2Rkci9qZWRl
YyxscGRkcjUueWFtbCAgICAgICB8ICAyICstCiAuLi5scGRkci1jaGFubmVsLnlhbWwgPT4gamVk
ZWMsc2RyYW0tY2hhbm5lbC55YW1sfSB8IDQwICsrKysrKy0tLQogLi4uL21lbW9yeS1jb250cm9s
bGVycy9kZHIvamVkZWMsc2RyYW0tcHJvcHMueWFtbCAgfCA5NCArKysrKysrKysrKysrKysrKysr
KysrCiBhcmNoL2FybTY0L2Jvb3QvZHRzL3N0L3N0bTMybXAyNTdmLWRrLmR0cyAgICAgICAgICB8
ICA3ICsrCiBhcmNoL2FybTY0L2Jvb3QvZHRzL3N0L3N0bTMybXAyNTdmLWV2MS5kdHMgICAgICAg
ICB8ICA3ICsrCiAxMCBmaWxlcyBjaGFuZ2VkLCAxNzMgaW5zZXJ0aW9ucygrKSwgOTEgZGVsZXRp
b25zKC0pCi0tLQpiYXNlLWNvbW1pdDogMDdlMjdhZDE2Mzk5YWZjZDY5M2JlMjAyMTFiMGRmYWU2
M2UwNjE1ZgpjaGFuZ2UtaWQ6IDIwMjUwOTIyLWI0LWRkci1iaW5kaW5ncy03MTYxZTNlMGFmNTYK
CkJlc3QgcmVnYXJkcywKLS0gIApDbMOpbWVudCBMZSBHb2ZmaWMgPGxlZ29mZmljLmNsZW1lbnRA
Z21haWwuY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4v
bGlzdGluZm8vbGludXgtc3RtMzIK
