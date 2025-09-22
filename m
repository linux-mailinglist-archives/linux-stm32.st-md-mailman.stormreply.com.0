Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DC43B8F6D2
	for <lists+linux-stm32@lfdr.de>; Mon, 22 Sep 2025 10:12:33 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 43A29C3087A;
	Mon, 22 Sep 2025 08:12:33 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C35C1C32E8F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Sep 2025 08:12:31 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-4694ac46ae0so25211005e9.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Sep 2025 01:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758528751; x=1759133551;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=8htGACZZYE1dIEbtDAUA+3P97IrmED7ZD9WcIPqTfx4=;
 b=ZgP+uFQmsA6TJxgpeXL+ZQxoxRwLQcaaMAe8OR/J7d8DxLysxamn8KWDkSNj07qG5w
 YSqDW1SVB5WKMyflNfJ/chyUuMJF1Mzzj1XjQaWUOShDMHNhBNMbuPHBedQ+5/VxacYX
 +kww6ftdeS1Nhv6TSWk8+RtTp0blRAWwhzv2KqQEZglEXuMbAoDUpKLyyn2fuAkB6gt4
 QN0xZItBZJ9zRkvhsndJTHjihT0DQHlNJZXeitvBt8D9py21qShAeFdZzcT01hUKPrzZ
 Nraj/ZrSzU6xi9AbJZjmGmzOLO78G+txWtW0yBjx/8YJwz6zKbmupXzPuWT00d7VdazS
 0HjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758528751; x=1759133551;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8htGACZZYE1dIEbtDAUA+3P97IrmED7ZD9WcIPqTfx4=;
 b=pIUG6bnlHicXGShwIqDZBG5vRV6rrSwhvEphX1jCbRG0mlMKkzAms+e/aUxQXcHq6Z
 GfqFFo/lnn9LvfH9MuwcBrLpzkpJc/QmPRaphjhBz3X5VCiksvxzct0cnzTPqXRVDRAJ
 hKtBFyUhJzJmNZuVF1dDH7CxjFO8SYzh9F6vAQzhJrSyBXXY68GelS266GcWs3eMfFfR
 diEyEhhG+6IAEaYUvlQ9Q+Kv8MEgDG/Qs8JlKRdpy7F4WvDcEQYUtTWPau9gQzyWGlB+
 rhea2C12UMCxAq2aOVUrjfrgyjjVtbpxQXXAtU6K5kPsr8/x9mKl6mUj8giSP44wAByh
 sR1Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWbLzit1z19bgmKwzHEmZz5IHqzX65/gT5dBhEE/KwWu2PasmlZ4bvrsiKGA1cADvEaEgEWFL7MJyCeXw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzGHI1yt95NxdlIQFyazKP4FudumKJZlqmh0vGGBtS9hDVLLMu3
 O/buAK6vnUsLJtBkJYLM+LP+9jYFr0BwvAg8P8W3GVXvoP6qNiofLXRFQS5+sQ==
X-Gm-Gg: ASbGnctUAlcQUpBrAKZgFvnDKrNljXBKC/pzgcS1Hlrdzzest6N3DMl3N/y3Uv4bRYR
 gOURxSq7rduDYJNBAZINIyLI1GK5A+wrBr8ndlfPmhPemNwWEPI2CNGATTNIItEZZJ/8XFDdO5x
 CARHgYP6Oh+jWi3umk5AXk8eTSZagb3ikof900RpADEthVVmOxApp6gGFSG1W9kZsTGyop3MM9o
 cnsulwbkr6SjSjniYw1skEjh0+QS4XJ5PbMgRNBZ1GOXYaX8okUMqHhk19OU1DvI3bOft3GQ5d8
 3Hrl5MMzz8wQPMu01HqHUAQotKpHnvp3cSNrKBdtAQtwYPFz37kb+FD/yE9vDPBQ9sX17Fon6WW
 2Cr8NyEDekh1i//q8hbTA9fcKlB1x7yNNKJeeP5aVOVGipzr9E3uWnwiX8AcyRLHGM6hS9SroeL
 LchMaiA6TeD1GHFgIV
X-Google-Smtp-Source: AGHT+IHIVtfPSrHin4y9JkfBQxIDF6jMfONQa4rDA8eGnaJ0DC6uDJwECPyzN7tfzI8/ktqkL/ZedA==
X-Received: by 2002:a05:6000:40cc:b0:3ec:d78d:8fde with SMTP id
 ffacd0b85a97d-3ee8585e38dmr9724920f8f.44.1758528751149; 
 Mon, 22 Sep 2025 01:12:31 -0700 (PDT)
Received: from localhost (2a02-8440-750d-3377-171e-75f8-f2d4-2af8.rev.sfr.net.
 [2a02:8440:750d:3377:171e:75f8:f2d4:2af8])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3f00cc58b91sm12911883f8f.1.2025.09.22.01.12.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Sep 2025 01:12:30 -0700 (PDT)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
Date: Mon, 22 Sep 2025 10:12:18 +0200
MIME-Version: 1.0
Message-Id: <20250922-b4-rcc-upstream-v7-1-2dfc4e018f40@gmail.com>
References: <20250922-b4-rcc-upstream-v7-0-2dfc4e018f40@gmail.com>
In-Reply-To: <20250922-b4-rcc-upstream-v7-0-2dfc4e018f40@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>
X-Mailer: b4 0.15-dev-0dae4
Cc: devicetree@vger.kernel.org,
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v7 1/3] dt-bindings: stm32: stm32mp25: add
 `#access-controller-cells` property
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
UkNDIGlzIGFibGUgdG8gY2hlY2sgdGhlIGF2YWlsYWJpbGl0eSBvZiBhIGNsb2NrLgpBbGxvdyB0
byBxdWVyeSB0aGUgUkNDIHdpdGggYSBmaXJld2FsbCBJRC4KClNpZ25lZC1vZmYtYnk6IENsw6lt
ZW50IExlIEdvZmZpYyA8Y2xlbWVudC5sZWdvZmZpY0Bmb3NzLnN0LmNvbT4KQWNrZWQtYnk6IFJv
YiBIZXJyaW5nIChBcm0pIDxyb2JoQGtlcm5lbC5vcmc+ClNpZ25lZC1vZmYtYnk6IENsw6ltZW50
IExlIEdvZmZpYyA8bGVnb2ZmaWMuY2xlbWVudEBnbWFpbC5jb20+Ci0tLQogRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Nsb2NrL3N0LHN0bTMybXAyNS1yY2MueWFtbCB8IDcgKysr
KysrKwogMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9jbG9jay9zdCxzdG0zMm1wMjUtcmNjLnlhbWwg
Yi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvY2xvY2svc3Qsc3RtMzJtcDI1LXJj
Yy55YW1sCmluZGV4IDg4ZTUyZjEwZDFlYy4uNGQ0NzFlM2Q4OWJjIDEwMDY0NAotLS0gYS9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvY2xvY2svc3Qsc3RtMzJtcDI1LXJjYy55YW1s
CisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9jbG9jay9zdCxzdG0zMm1w
MjUtcmNjLnlhbWwKQEAgLTMxLDYgKzMxLDExIEBAIHByb3BlcnRpZXM6CiAgICcjcmVzZXQtY2Vs
bHMnOgogICAgIGNvbnN0OiAxCiAKKyAgJyNhY2Nlc3MtY29udHJvbGxlci1jZWxscyc6CisgICAg
Y29uc3Q6IDEKKyAgICBkZXNjcmlwdGlvbjoKKyAgICAgIENvbnRhaW5zIHRoZSBmaXJld2FsbCBJ
RCBhc3NvY2lhdGVkIHRvIHRoZSBwZXJpcGhlcmFsLgorCiAgIGNsb2NrczoKICAgICBpdGVtczoK
ICAgICAgIC0gZGVzY3JpcHRpb246IENLX1NDTUlfSFNFIEhpZ2ggU3BlZWQgRXh0ZXJuYWwgb3Nj
aWxsYXRvciAoOCB0byA0OCBNSHopCkBAIC0xMjMsNiArMTI4LDcgQEAgcmVxdWlyZWQ6CiAgIC0g
cmVnCiAgIC0gJyNjbG9jay1jZWxscycKICAgLSAnI3Jlc2V0LWNlbGxzJworICAtICcjYWNjZXNz
LWNvbnRyb2xsZXItY2VsbHMnCiAgIC0gY2xvY2tzCiAKIGFkZGl0aW9uYWxQcm9wZXJ0aWVzOiBm
YWxzZQpAQCAtMTM2LDYgKzE0Miw3IEBAIGV4YW1wbGVzOgogICAgICAgICByZWcgPSA8MHg0NDIw
MDAwMCAweDEwMDAwPjsKICAgICAgICAgI2Nsb2NrLWNlbGxzID0gPDE+OwogICAgICAgICAjcmVz
ZXQtY2VsbHMgPSA8MT47CisgICAgICAgICNhY2Nlc3MtY29udHJvbGxlci1jZWxscyA9IDwxPjsK
ICAgICAgICAgY2xvY2tzID0gIDwmc2NtaV9jbGsgQ0tfU0NNSV9IU0U+LAogICAgICAgICAgICAg
ICAgICAgPCZzY21pX2NsayBDS19TQ01JX0hTST4sCiAgICAgICAgICAgICAgICAgICA8JnNjbWlf
Y2xrIENLX1NDTUlfTVNJPiwKCi0tIAoyLjQzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0z
MkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9y
bXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
