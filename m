Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 50E38B4A9C1
	for <lists+linux-stm32@lfdr.de>; Tue,  9 Sep 2025 12:12:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 112CEC3F93A;
	Tue,  9 Sep 2025 10:12:36 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1616DC3FACC
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Sep 2025 10:12:34 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-3e751508f21so426745f8f.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 09 Sep 2025 03:12:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757412753; x=1758017553;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Zz313f5+9XsH5+Eb3Bh9XStxpTdiNn9ua8EWNmWWJg0=;
 b=ZDi7LMwkbnBefdrOQ24pUSjp8W2W01fnYpHtLx4fWugz3BgujHVqTDaB4dBGvJhC8L
 xC16I0fSe9FhbveRGnNlnS0FMf9RpYlSWCTpoNIy1Ki6XsAidwcuKMNylubPw+hSRJvh
 2DnCg7ZtgZP0LOgAbXZknoBwWItTACtNW2ctgbjjIrG0+yR1nocwq0ZwqRLtp2Y75U5I
 hdwzyI7bVk4hql3zCeDFlmVOulvP8HyMqIU4XHNGTauh61d398mpHPegLI8nJxzd/6uT
 nHQNg/eKX5hMzz8Il+AAHxN47ZFCRC6FT7QHuLgyCYRXrfCcQjyrnVkpdRoEXUFpqFso
 M6Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757412753; x=1758017553;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Zz313f5+9XsH5+Eb3Bh9XStxpTdiNn9ua8EWNmWWJg0=;
 b=GxheNYO4VeRI1uLypo+XQ+1Soptak9XiHwy9yFoYUhNkZxXnNGcXA+yw2lUQFSh+/P
 n/nXwjv/6ENVyYf5zFAgKmZ54/zts4WYqh+WAK471II0KvFgzkcYyfHiAfdneyp1boTM
 4v5tkm7iV9XyfExKNSPgJA8s6I0wYPPhsOQk7AvyRwl7W1HwWFztAHQ2rEnGCUJdWtO4
 gA0pJM12DD9mIhGb+EsQuZ/VYf9i30cYtavNsJvUlN3OC+76yb3805SllRl53kuivaYQ
 +1DRmlD38EUPKrX/cBtdhL/RT/1qgbR53SgF6yRxL2CI9aGCupnNDz4aGDhaQrh+T8Sb
 ODhA==
X-Gm-Message-State: AOJu0YyeF4t/dmSeuq719p4thZ+ETNwoRh28tjfsX9tlJKZIaEhGpfHA
 ZA3hYLBrl/FXMbS6AG/JSV5sgIliiNryVS6W3Lo9wlhEntMB2ODDuDzC
X-Gm-Gg: ASbGncuG+dPhoH0xyhSys+gwN8R+KXiN4wxr+eyIsHQDRCgM/UBWiNJkZTqWGYeitUz
 Jo2GI/egFOqHQA2R7SUUeAgrA7fFxkh9RHgqHt6ewzWkHpo8GY/bMBzwxeRs3whEvA2zg8MHKlO
 ABkkKxULM3LItH/ZXDxArxy9QfAppiJhJPUTgxS1CBP/Heissw1OZD3rvzVuXVF2zMaW7/QUQ0Q
 EMVS5zwsyAraz+QCfO+a3dOPtC4YirIKXZOOsRJ9RKjfYk2xPgYsXyRSjzfg9agQS1L3qE8OcKZ
 esT5Qz4Cca2zxMG3+QMQoYRGswOJJs7PO/xk/OkGa/tKT7ldaJSt47zfKFyjl6xNrKxPIX8fDs4
 z1Xpj5Eez8nboHJuz8HJW6Qq+CjsuNQ0OihOJH31XiEtZC0YeMf8NvbW0VbiBF+zoCxdn5G1/Mi
 /i1K4vgqoDRX7Bh+ua7+GLwdKiFA==
X-Google-Smtp-Source: AGHT+IH7hqeCncC0SVXTGumU9OSJ/aNPQ9AiaGhyarE4EKX3TbC/TVNGGH8t45lQyiAq41/6hdfmvg==
X-Received: by 2002:a05:6000:2883:b0:3e0:57e1:e3c1 with SMTP id
 ffacd0b85a97d-3e64d22bbadmr8510036f8f.63.1757412753401; 
 Tue, 09 Sep 2025 03:12:33 -0700 (PDT)
Received: from localhost (2a02-8440-7136-74e7-5ebf-4282-0e1a-b885.rev.sfr.net.
 [2a02:8440:7136:74e7:5ebf:4282:e1a:b885])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3e75223f2e5sm1994403f8f.52.2025.09.09.03.12.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Sep 2025 03:12:33 -0700 (PDT)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
Date: Tue, 09 Sep 2025 12:12:16 +0200
MIME-Version: 1.0
Message-Id: <20250909-b4-ddrperfm-upstream-v6-9-ce082cc801b5@gmail.com>
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
Subject: [Linux-stm32] [PATCH v6 09/20] dt-bindings: memory: SDRAM channel:
 standardise node name
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
QWRkIGEgcGF0dGVybiBmb3Igc2RyYW0gY2hhbm5lbCBub2RlIG5hbWUuCgpTaWduZWQtb2ZmLWJ5
OiBDbMOpbWVudCBMZSBHb2ZmaWMgPGNsZW1lbnQubGVnb2ZmaWNAZm9zcy5zdC5jb20+ClJldmll
d2VkLWJ5OiBSb2IgSGVycmluZyAoQXJtKSA8cm9iaEBrZXJuZWwub3JnPgpTaWduZWQtb2ZmLWJ5
OiBDbMOpbWVudCBMZSBHb2ZmaWMgPGxlZ29mZmljLmNsZW1lbnRAZ21haWwuY29tPgotLS0KIC4u
Li9iaW5kaW5ncy9tZW1vcnktY29udHJvbGxlcnMvZGRyL2plZGVjLHNkcmFtLWNoYW5uZWwueWFt
bCAgICAgICB8IDcgKysrKystLQogMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMiBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvbWVtb3J5LWNvbnRyb2xsZXJzL2Rkci9qZWRlYyxzZHJhbS1jaGFubmVsLnlhbWwgYi9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVtb3J5LWNvbnRyb2xsZXJzL2Rkci9qZWRl
YyxzZHJhbS1jaGFubmVsLnlhbWwKaW5kZXggODY2YWY0MGI2NTRkLi41Y2RkOGVmNDUxMDAgMTAw
NjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZW1vcnktY29udHJv
bGxlcnMvZGRyL2plZGVjLHNkcmFtLWNoYW5uZWwueWFtbAorKysgYi9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvbWVtb3J5LWNvbnRyb2xsZXJzL2Rkci9qZWRlYyxzZHJhbS1jaGFu
bmVsLnlhbWwKQEAgLTE3LDYgKzE3LDkgQEAgbWFpbnRhaW5lcnM6CiAgIC0gSnVsaXVzIFdlcm5l
ciA8andlcm5lckBjaHJvbWl1bS5vcmc+CiAKIHByb3BlcnRpZXM6CisgICRub2RlbmFtZToKKyAg
ICBwYXR0ZXJuOiAic2RyYW0tY2hhbm5lbC1bMC05XSskIgorCiAgIGNvbXBhdGlibGU6CiAgICAg
ZW51bToKICAgICAgIC0gamVkZWMsZGRyNC1jaGFubmVsCkBAIC0xMTgsNyArMTIxLDcgQEAgYWRk
aXRpb25hbFByb3BlcnRpZXM6IGZhbHNlCiAKIGV4YW1wbGVzOgogICAtIHwKLSAgICBscGRkci1j
aGFubmVsMCB7CisgICAgc2RyYW0tY2hhbm5lbC0wIHsKICAgICAgICNhZGRyZXNzLWNlbGxzID0g
PDE+OwogICAgICAgI3NpemUtY2VsbHMgPSA8MD47CiAgICAgICBjb21wYXRpYmxlID0gImplZGVj
LGxwZGRyMy1jaGFubmVsIjsKQEAgLTEzMyw3ICsxMzYsNyBAQCBleGFtcGxlczoKICAgICAgIH07
CiAgICAgfTsKIAotICAgIGxwZGRyLWNoYW5uZWwxIHsKKyAgICBzZHJhbS1jaGFubmVsLTEgewog
ICAgICAgI2FkZHJlc3MtY2VsbHMgPSA8MT47CiAgICAgICAjc2l6ZS1jZWxscyA9IDwwPjsKICAg
ICAgIGNvbXBhdGlibGUgPSAiamVkZWMsbHBkZHI0LWNoYW5uZWwiOwoKLS0gCjIuNDMuMAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIg
bWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0
cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgt
c3RtMzIK
