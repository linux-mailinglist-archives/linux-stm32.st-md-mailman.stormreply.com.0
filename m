Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B0E0BAC1C8
	for <lists+linux-stm32@lfdr.de>; Tue, 30 Sep 2025 10:47:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8FFFAC424CC;
	Tue, 30 Sep 2025 08:46:59 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8939DC424CB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Sep 2025 08:46:58 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-46e42deffa8so47519665e9.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Sep 2025 01:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759222018; x=1759826818;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Zz313f5+9XsH5+Eb3Bh9XStxpTdiNn9ua8EWNmWWJg0=;
 b=AsCDfVnO7H8l/jt3rTJjcBQ2RJIqFoV3It5ZiM9LXl/cBsh3fRS1ErJHUBAn6euQO6
 ZVhXspRjaNkzxONh2gtPVPelbElIYWSfEU/ydydHJK9qFPeY4jxQGySqi4/kcM1gCFj/
 +HAb1e00ZUvd/M7N/a5S+jhFZuaudfxCey2rISIyTqz4e8PVDHg3Ii7Pvux76War9Vys
 7gZTZHWjwNYlWrRSl5XJI6EokS9fc2K8vWX4hGMFEdU6cXukahSGfFfVmXz1bRJBDw8S
 5MogkOAOJw2HeL+3lf+4BChUDSu+mDIdZkZro57gFM7yfEd0WSQUS2Tt6egRwKGTlxmG
 Hpog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759222018; x=1759826818;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Zz313f5+9XsH5+Eb3Bh9XStxpTdiNn9ua8EWNmWWJg0=;
 b=o87wO/3jbAIVpLYRbhalny7my2iNFX3dPUi20xuIvhz3+qI2JGMFW2EFLDEdA5j5mT
 RSNWGmFrANxObrJiroKUEJDFKweRvP3QWvfYdv6XeQfmIDT18GPyAKw83CTJgKQoKwRX
 UWWcvpfgsq+CmfCGlDySYzC9aYd+rBgcS1BePKDuqHQBjNQABl7fXPhr+9Hkf8MDsr0c
 F0YEcxW4HrxP3C7hsFrin3etGBJ4ZcjUWDmMQAMRyPJHOlBub3y2K/vvmT2pbk2DGs2L
 Ka48mn9yFdYaWwTTt1ZMLOMRVvS3BtoIg4Z2zeGv2GF9k0vAcHozgGtaO/seeEE5t4Zx
 BIlQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUBfTzwCJyDCyg9EjZBXtRFzV6gsYdgBdM3EwMD1uPjh048eeoNhAyRTwaNglRGMXKL3dTIXAi30GHHWA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzObKCIoOa29aFmCGL6X/hfidqS1aTbOffeoRN/3zt1HVot2qu9
 OPD34J3m5x6qfymf6fcjGz86ysZqcUZcbmZuJlkMCngw9fOZ3XGrhqO0
X-Gm-Gg: ASbGncvQ6ezlsK72BDpXtYcnqVZdmCJtS2HXAvFJpHFko3QH7dBz72PeoHDVcXZR9rb
 jA68KJLy+oPy1jp4OZe2tjeJG3P2qIsVwwPWiJ6p4xBYCJQmqgILGfF0Y5OaGBqe65YEwxfgRXo
 SHXQlkpur8Y1vOiW1Lmx1IrbKdMp5pHjBoIKQnCstcCK4gXj3BjLjvSmB1ZCC+SKsiILfwbiRGi
 w03US2fJWiOcRfeBzxHFczmwGzqKFESuDM2b8XfDAW8cyRmuLzDotn52PBkKzruOkMZHKMktcKh
 wkyeRuX3p2V/yeS1uQmlAdUob39xCAf/klYHSxFDbyQgCpUEfNzAxpm+oAZrEt/qyYoiPj4hFjj
 APb41FfcUippJEwpZt6Xf8uOPUdx0QnO+Aqsi3WwwC1NsS1HJuw+fx1HVkWVDdGB1tMVK94BqAi
 psNBWPPgQFut8Pchd4cTi8ZPPoT+e5/4Vo+/4vOzWR
X-Google-Smtp-Source: AGHT+IE5U4JjqYd6xwd8FJayS/jcOVFVp9zMugNYrK4b09ZbxPm2ncnyK5wWqHK+ARGFcMuJfSBjSw==
X-Received: by 2002:a05:600c:1986:b0:45d:d8d6:7fcc with SMTP id
 5b1f17b1804b1-46e32a057c2mr162105605e9.27.1759222017757; 
 Tue, 30 Sep 2025 01:46:57 -0700 (PDT)
Received: from localhost (2a02-8440-7149-a758-f461-9bc4-1c75-ebc1.rev.sfr.net.
 [2a02:8440:7149:a758:f461:9bc4:1c75:ebc1])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e2ab31f1dsm258242245e9.13.2025.09.30.01.46.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Sep 2025 01:46:57 -0700 (PDT)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
Date: Tue, 30 Sep 2025 10:46:48 +0200
MIME-Version: 1.0
Message-Id: <20250930-b4-ddr-bindings-v8-5-fe4d8c015a50@gmail.com>
References: <20250930-b4-ddr-bindings-v8-0-fe4d8c015a50@gmail.com>
In-Reply-To: <20250930-b4-ddr-bindings-v8-0-fe4d8c015a50@gmail.com>
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
Subject: [Linux-stm32] [PATCH v8 5/7] dt-bindings: memory: SDRAM channel:
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
