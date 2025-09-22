Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A88CB8F6D1
	for <lists+linux-stm32@lfdr.de>; Mon, 22 Sep 2025 10:12:33 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2FDC0C32E92;
	Mon, 22 Sep 2025 08:12:32 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9B3D2C32E8F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Sep 2025 08:12:30 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-45dcfecdc0fso35889075e9.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Sep 2025 01:12:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758528750; x=1759133550;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=eYqKhruI45NqfrcmY2IdIDvWyXftG5Pvnt74G18ZyBg=;
 b=eZBLG+fcQHfEkIfysVK7HyYpek9e3lI3mAzx0sI+1Ge2CZjT4719Q8YtmrpfKhGNVy
 yUD3312GmmMVipWmWWhPqguZzA2dUtnK07PN9uDGdYrjl9HdvGKrd2dRFw3heaeEbmFD
 G27HWbI2fqBqiSey7CYHvM2ZcCP9i23UIgrl7ncfkkUXDvqgdGmnrY4jHE7h6Hp1fmTG
 xbUlakODOTBkT1OuxQeqGoJGjPWJ1hplEzr2X73vtCwuM/Ekhmktgig3wp9aKL+syXFP
 nXBNWhQ4WTJw0prXGUer9YqqbHNV2UwnOwyqrVo29MnllE5FeCSbAydjZ1PLJPnY1mZB
 uqkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758528750; x=1759133550;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eYqKhruI45NqfrcmY2IdIDvWyXftG5Pvnt74G18ZyBg=;
 b=nYnCKktZcRj1tTvnM0/3cIX5p6yrZgEtLYkvR3J1Y/nx9BzMT9DX/ecMcDZbjsbFi0
 I+QRAIQmMnoiIw/yypU8QAJvhX0ow3BvBWNbr0x8hfRvvVf9P/cEu5dc0GFlwqNhlWz8
 IYbIGSsOgCdpc5cGamtcaX9p2HpZylmLjnwZ5HyWYYwQZ3bEMX5C+eFubO2G+oVRyN3+
 V+7212SAWefhGhyKiZVfdYSShZBiH0Q13gtRgS+/6Vmwp/xKKnu2Wy7HgSMjyQfM7jIG
 NW8h3433ewSd6+8JK5dBnBBssKEJ8qkeVQke3+frhitDblPIIBfrofJKuv6rO7o7xz4T
 toTw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV9MSTH4+JigrDifXvnH+6prir/0aNHGEEJkefRiFHnSQupG3S2cebnT3y68wiOpUsZfHYDYdvHvBe5oQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yy494SInrlv6WPKMec561E/VLMWc2uyOZzoy5udxBtGJ6Tes4uE
 7OETgoH3VzAP0fJKCSlCDBVVaAOi8J9EstCNpj3FmYyXOVWPZTnteWrbFHY6Dg==
X-Gm-Gg: ASbGncs5XJolqm5Ww+YCdLcnqG/nGuaEzck4SY6OixXF6mnpBvvHPOTT+xux25VdoHf
 lbwhzSu/iq8Y7+u1nMXOeco8Higz1bz/vGvLerPpW8kunVtVFzQ5Ty/eOUMGuxqGgEXe/YCsVS4
 3rU6oYnYodaRMwgLmwikVuAmzwLyGf4ZPyO0+peVp4G3u/Dwj+PLQ4h2Pvrm9EtAFEb0i43HZNi
 y+/8UO7m7ZMnzCrPbBCVWq9oKurFReNODRUmk0s97havq0qZxU3gzzWVFOfooa1AydWeePhrIFx
 f7DigJUKbgbOB8DOwpbeQZvFZXaBq/dunrQpYoPWYivvq4kaqPc2XHL59aVJKvz0eiAKEfVaKfa
 RUXtE1rwyxiQ7LQujIrtBAGKLp4u3wTny2UBt/m5iFKd5XbXJBOCwadfH1lhw4v/MpP6eYtDXma
 uoGfIlDTO4x6YFTEJN
X-Google-Smtp-Source: AGHT+IGaW5mf3l3e9WL0amAUkV4jBYZ9TpBBxRsBaTLr99vQ32yK+2WU4XPkn1fwTjqGvgH00a6hfw==
X-Received: by 2002:a05:600c:3143:b0:450:cabd:b4a9 with SMTP id
 5b1f17b1804b1-46d31dcba3dmr18635985e9.29.1758528749751; 
 Mon, 22 Sep 2025 01:12:29 -0700 (PDT)
Received: from localhost (2a02-8440-750d-3377-171e-75f8-f2d4-2af8.rev.sfr.net.
 [2a02:8440:750d:3377:171e:75f8:f2d4:2af8])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3fd84338ca2sm3903576f8f.42.2025.09.22.01.12.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Sep 2025 01:12:29 -0700 (PDT)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
Date: Mon, 22 Sep 2025 10:12:17 +0200
Message-Id: <20250922-b4-rcc-upstream-v7-0-2dfc4e018f40@gmail.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAOEE0WgC/02Oyw6DIBREf8XcdUkAK4K/0ri4wqUl8dGC2ibGf
 y+pi7o8k8zM2SBRDJSgKTaItIYUpjFDfSnAPnC8EwsuM0guK26EYt2VRWvZ8kxzJByYRk1Yolf
 IHeTWM5IPn9/irT040mvJw/MRQoeJmJ2GIcxNwWuSNTqhSmPQW6dM2VE+E6LjziOpkrgSlYezU
 FOcdXyI9Ma+/zs5T7rSGqXwullraPf9CzYPxM3pAAAA
X-Change-ID: 20250916-b4-rcc-upstream-8a8ea3af6a0d
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
Subject: [Linux-stm32] [PATCH v7 0/3] Register the STM32MP25 RCC driver as
 an access controller.
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

VGhlIFNUTTMyTVAyNSBSQ0MgcGVyaXBoZXJhbCBhcyBhbiBhY2Nlc3MgY29udHJvbGxlciBpcyBh
bGxvd2VkIHRvIGtub3cKd2hldGhlciB0aGUgY2xvY2tzIGFyZSBzZWN1cmVkIG9yIG5vdC4KVGhl
IFNUTTMyTVAyNSBSQ0MgcGVyaXBoZXJhbCBrbm93cyBhYm91dCB0aGUgY2xvY2sgc2VjdXJlIGNv
bmZpZ3VyYXRpb24Kb2YgYWxsIG5vbiBSSUYtYXdhcmUgcGVyaXBoZXJhbC4KSW4gcGFyYWxsZWwg
YWxsIHRoZSBSSUYtYXdhcmUgcGVyaXBoZXJhbCBjb25maWd1cmF0aW9uIGluZm9ybWF0aW9uCmFy
ZSBrbm93biBieSB0aGUgUklGU0MgcGVyaXBoZXJhbCB3aGljaCBpcyBhbHJlYWR5IGFuIGFjY2Vz
cwpjb250cm9sbGVyLgoKVGhpcyB2NyBpcyBhIHN1YnNldCBvZiB0aGUgdjYgYW5kIG90aGVyIHBy
aW9yIHZlcnNpb25zLCBzcGxpdCB0byBzaW1wbGlmeQp0aGUgcmV2aWV3IGFuZCBtZXJnaW5nIHBy
b2Nlc3MuCgpDaGFuZ2VzIGluIHY3OgotIE5vbmUKLSBMaW5rIHRvIHY2OiBodHRwczovL2xvcmUu
a2VybmVsLm9yZy9hbGwvMjAyNTA5MDktYjQtZGRycGVyZm0tdXBzdHJlYW0tdjYtMi1jZTA4MmNj
ODAxYjVAZ21haWwuY29tLwoKU2lnbmVkLW9mZi1ieTogQ2zDqW1lbnQgTGUgR29mZmljIDxsZWdv
ZmZpYy5jbGVtZW50QGdtYWlsLmNvbT4KLS0tCkNsw6ltZW50IExlIEdvZmZpYyAoMyk6CiAgICAg
IGR0LWJpbmRpbmdzOiBzdG0zMjogc3RtMzJtcDI1OiBhZGQgYCNhY2Nlc3MtY29udHJvbGxlci1j
ZWxsc2AgcHJvcGVydHkKICAgICAgY2xrOiBzdG0zMm1wMjU6IGFkZCBmaXJld2FsbCBncmFudF9h
Y2Nlc3Mgb3BzCiAgICAgIGFybTY0OiBkdHM6IHN0OiBzZXQgcmNjIGFzIGFuIGFjY2Vzcy1jb250
cm9sbGVyCgogLi4uL2JpbmRpbmdzL2Nsb2NrL3N0LHN0bTMybXAyNS1yY2MueWFtbCAgICAgICAg
ICAgfCAgNyArKysrCiBhcmNoL2FybTY0L2Jvb3QvZHRzL3N0L3N0bTMybXAyNTEuZHRzaSAgICAg
ICAgICAgICB8ICAxICsKIGRyaXZlcnMvY2xrL3N0bTMyL2Nsay1zdG0zMm1wMjUuYyAgICAgICAg
ICAgICAgICAgIHwgNDAgKysrKysrKysrKysrKysrKysrKysrLQogMyBmaWxlcyBjaGFuZ2VkLCA0
NyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCi0tLQpiYXNlLWNvbW1pdDogMDdlMjdhZDE2
Mzk5YWZjZDY5M2JlMjAyMTFiMGRmYWU2M2UwNjE1ZgpjaGFuZ2UtaWQ6IDIwMjUwOTE2LWI0LXJj
Yy11cHN0cmVhbS04YThlYTNhZjZhMGQKcHJlcmVxdWlzaXRlLWNoYW5nZS1pZDogMjAyNTA5MTYt
YjQtZmlyZXdhbGwtdXBzdHJlYW0tZGZlODU4OGEyMWY4OnY3CnByZXJlcXVpc2l0ZS1wYXRjaC1p
ZDogMWVhZDk2MGY0MDVjN2EyZGNjOTExMWFjZDBiYjRjOTVlZDMzOTU0ZgoKQmVzdCByZWdhcmRz
LAotLSAgCkNsw6ltZW50IExlIEdvZmZpYyA8bGVnb2ZmaWMuY2xlbWVudEBnbWFpbC5jb20+Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0z
MiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpo
dHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51
eC1zdG0zMgo=
