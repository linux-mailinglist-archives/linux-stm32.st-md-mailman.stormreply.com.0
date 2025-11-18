Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D5D5BC6A6F0
	for <lists+linux-stm32@lfdr.de>; Tue, 18 Nov 2025 16:55:29 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7581AC62D48;
	Tue, 18 Nov 2025 15:55:29 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 77BDCC62D2D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Nov 2025 15:09:02 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-4775638d819so32621855e9.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Nov 2025 07:09:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763478542; x=1764083342;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Zz313f5+9XsH5+Eb3Bh9XStxpTdiNn9ua8EWNmWWJg0=;
 b=QV5IT0Bfdt7p7I6kBQ2CWIjErEH7lWqiVV5BvYKty6KMiQcPwHl2gkamMTBJnq7m5c
 vwGnKEPh3H4CAKJwIfyw042VmTW6BuJtFWSQqcqIe+DLwwt4BSYPHzAdeI65DHhKieVR
 g4gfCbeEQ2FP9OhnUEzCGGT5llQQzikuSNT3Qz29uxZj3RTkRmWAl0POBGmfbfNtRa0J
 h94NvWdVfYzNC0eL70wopvypB3raqZ14mc4JNeDyq4sxFNSwxntF7S42mYHP25FkyU8C
 BKFWk9Ca3+Y4MWc89GfZ8w0Rng9xUau0Wd3CO8K5wAIKum84ttZf0VAblJYYMly8HStX
 XWLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763478542; x=1764083342;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Zz313f5+9XsH5+Eb3Bh9XStxpTdiNn9ua8EWNmWWJg0=;
 b=j0b+DFkaKUbhXgNFVPY6jDoW+Xw0OqZQVJ4Lv+IwYDj9JbI1s+aTb4vOU7Vfm1l34d
 Z8Nn5Rba5722MqH40N5LinkAXZb9rA2qLu+fzE71oUaFdUjMDBxBuxKKZTs4incL1MX0
 HYCUVI1bxFOJBiVv1MDo/aGLuPO4yqLAaoe0GqfrIx3OsJV38sQzuXmL+FIYjCe8SdyW
 pOMcCZtN/zwzVpxOjSvYpyPB51zj20zlApegopJnswHrb4MATtMFKNH6XazK06MfAIPN
 EX7isT0NfaiftIUWMYsipfZ5PNSfQqmTGlUkGSTvjHuk1pcNCY2engSOPjIZW2cN0RqR
 3IsA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWWPv/O0DpTkGpC1UFhB6Wtu6+BkBzZWb4Oy3uh8RQZpGNNEkWXE3hFdwjPWQQKuCGMexojeqCX/LTSIQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxtaLFWAug+hr/VTzDxne8vHea3Xf/almH2Op4SO2V7Jm7HET4A
 acnR1dDmoYBuQXLIvQ5mx3+847eFFWvEjt5bEHrCtI2t5AFAGPw5DHTm
X-Gm-Gg: ASbGncubZcgfsvFiydOJNzrsuyzaV1DmTEKZNVPSUprvTQlg8dBqwAb31vvOnWiX2/6
 qyOJ2S8P3pQs1kqqbBzuRuM0xyAzfB+s18ku+guoclJW3o/+4htLg61+BFVoYzVA1mHY6ehztsR
 3dW0rNzihQ6cbjudzut+EWv8e6RabIKAYhZuMj52S9Cgo1w+y5quFdW2NUXb0551fnRCFLWnDbc
 E8JsT+o/bx2QBb604eg2UCbblPCdPnwjsu1VPdm5b6OMmN9wQ4WNY7Qpjcs5jx0G5RTRyrQCZiW
 LEj3sdKYJQIM9EDqq3e5v9O9sxKx0d0NXYE/s8v7AbH30Tz3MFPqbvXEvdPh5a2Nl+LHbczRgz2
 pBv0VKH8n5LY685XpzPaM2INpmMq32Rz0WlVY0mn5T1nGhqMypJmA48jhmHQmlt6mjvgopYUqMQ
 NowUnZieYiCLDk2wghzOFz/qgFdLJgPywfwTC+h2QHlTfUtqSxnja66c2j1KeecYCvb3E0/WMnw
 dWci/TI2sNAYA8E
X-Google-Smtp-Source: AGHT+IE6GAJOdG/qDGqIS1mCpN488TDzi+QKoUUH1cFmR3miBBoO1+a2akA4/Hkj6YnfPYg9iHTXrw==
X-Received: by 2002:a05:600c:630c:b0:477:7a63:611f with SMTP id
 5b1f17b1804b1-4778feba6demr143915445e9.36.1763478541562; 
 Tue, 18 Nov 2025 07:09:01 -0800 (PST)
Received: from localhost (2a02-842a-9b20-0d01-432b-0dab-f195-2b25.rev.sfr.net.
 [2a02:842a:9b20:d01:432b:dab:f195:2b25])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47796a8a695sm206281725e9.13.2025.11.18.07.09.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Nov 2025 07:09:01 -0800 (PST)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
Date: Tue, 18 Nov 2025 16:08:01 +0100
MIME-Version: 1.0
Message-Id: <20251118-b4-ddr-bindings-v9-5-a033ac5144da@gmail.com>
References: <20251118-b4-ddr-bindings-v9-0-a033ac5144da@gmail.com>
In-Reply-To: <20251118-b4-ddr-bindings-v9-0-a033ac5144da@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Julius Werner <jwerner@chromium.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.15-dev-86b30
X-Mailman-Approved-At: Tue, 18 Nov 2025 15:55:27 +0000
Cc: devicetree@vger.kernel.org,
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>,
 linux-kernel@vger.kernel.org,
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v9 5/7] dt-bindings: memory: SDRAM channel:
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
