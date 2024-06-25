Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E7C6C91786D
	for <lists+linux-stm32@lfdr.de>; Wed, 26 Jun 2024 08:01:49 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9CC9BC78015;
	Wed, 26 Jun 2024 06:01:49 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 31E23C71289
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Jun 2024 21:33:14 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-3650f2e540dso4087790f8f.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Jun 2024 14:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719351193; x=1719955993;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=GkKB4GxtrWlg/r+kXFJYqrA8LJ2kMmmjaxb+VTbBkRE=;
 b=KaBu6P7Mg83tHE6JbjLve3D9V12ApisB0veMeTbrhVzIwbzWHBNqriXg2Dfsi6hL+i
 YCVepIyn12tW8i9CgPe0RKG6bSnybQPbNnmtrU3xGQTtA0vu7f5rUZFCLo02CBytd9Mw
 pz8eVD0TXcr9uyHpwVMgk5q9nM1TJ4OK7CnRE8E1ltjITYU7QqytSV7qkGALC8x2ReIc
 +aDhMcvHAMGOUTsh4N1bB+RvWvhSnUBcaYVPR+ShSb8ISQlbHvOhkKF7Y6uCmrhme6nq
 xDsgTecChG5La7BYDKcg2AaiHemuFUjY7Tp1cTY4iuWIPLels+u9UcxhM55nmN0WghV+
 HbRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719351193; x=1719955993;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GkKB4GxtrWlg/r+kXFJYqrA8LJ2kMmmjaxb+VTbBkRE=;
 b=JzSNf4zFcf7JVgeQAwctI1vMxbQ6LgCIyjnLcCtTKny31WQ1dFfzdztlgNHb4hL+Dx
 vG+PvNEqpKmFLYTiYLLZirMHu1Hbk1JwY3iasZNHYbLssg2afRYa8SmAaZ06x6eLbkAi
 woHC756tOiGj4b2sNFvBoANf0iUci9AyfkeaNcMWz0QBTkGPrSsow3pMYjPgWc6DNegD
 QW84BFnpHlrQfsRlS00j0/BBarkduVlM7CtSvEIRigiIUFFZb6u9eOm4MT5We+HZ0+JF
 G4mSBoTRgElvUmFZCrDIibkJOlspW6p5VrOc9l9jk8qxbWnukYvtNQ/+wiIlXWP0aS7o
 eBXQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXpKqWuAR+DnZu5t1SdkW0mNPUCQbVYRgJgXiqR79OgPDtgJdOZtq5GyIHM2P1Aj0OLSz8MXs8QQL8wu5V7OJ1FpS0L/3ymy0mhtNzZVSVTSwC60OTRVWfJ
X-Gm-Message-State: AOJu0YytcoCAK1mXrPHFvrILrk2CGJZn0JsBRkyMOCCAR5wQjP/In/xd
 Uy4RcsaJeRNaQviJOajo7acv5/HD7oIUuMAlova6p0fjD2mI8cIF
X-Google-Smtp-Source: AGHT+IHJsvMy2gyT8lX6O4uQaNgdEVNrVh/pEyToiulrY3Z1uOuSVV5HU3UP95uu+B3Bbmdmm1Rm+Q==
X-Received: by 2002:adf:fa41:0:b0:363:7788:b974 with SMTP id
 ffacd0b85a97d-366e96b234emr5482775f8f.53.1719351192919; 
 Tue, 25 Jun 2024 14:33:12 -0700 (PDT)
Received: from localhost ([2001:861:3385:e20:6384:4cf:52c5:3194])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-424c8251dc1sm1785695e9.17.2024.06.25.14.33.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jun 2024 14:33:12 -0700 (PDT)
From: Raphael Gallais-Pou <rgallaispou@gmail.com>
Date: Tue, 25 Jun 2024 23:32:39 +0200
Message-Id: <20240625-thermal-v2-0-bf8354ed51ee@gmail.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAHc3e2YC/2XMQQ7CIBCF4as0sxZTEBRdeQ/TBcLQTlKKgYZoG
 u4uduvyf3n5NsiYCDPcug0SFsoUlxbi0IGdzDIiI9caRC9kr7hm64QpmJlpfxZKCm2sv0J7vxJ
 6eu/SY2g9UV5j+uxw4b/13yic9ezivDUndFLJ530MhuajjQGGWusXECQ1zZ4AAAA=
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Patrice Chotard <patrice.chotard@foss.st.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
X-Mailer: b4 0.14.0
X-Mailman-Approved-At: Wed, 26 Jun 2024 06:01:46 +0000
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-pm@vger.kernel.org
Subject: [Linux-stm32] [PATCH v2 0/3] Add thermal management support for STi
	platform
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

VGhpcyBwYXRjaCBzZXJpZXMgZW5oYW5jZXMgdGhlIHN0X3RoZXJtYWwgZHJpdmVyIGluIG9yZGVy
IHRvIGVuYWJsZQpzdXBwb3J0IGZvciB0aGVybWFsIHpvbmVzLiBUaGUgY2hhbmdlcyBpbmNsdWRl
OgoKMS4gUmVwbGFjZSBkZXByZWNhdGVkIFBNIHJ1bnRpbWUgbWFjcm9zIHdpdGggdGhlaXIgdXBk
YXRlZCBjb3VudGVycGFydHMuCjIuIEltcGxlbWVudGluZyBkZXZtXyogYmFzZWQgdGhlcm1hbCBv
ZiB6b25lIGZ1bmN0aW9ucyB3aXRoaW4gdGhlIGRyaXZlci4KMy4gVXBkYXRpbmcgdGhlIHN0aWg0
MTggZGV2aWNlLXRyZWUuCgpUaGUgZGV2aWNlLXRyZWUgcGF0Y2ggZGVwZW5kcyBvbiBhbiBlYXJs
aWVyIHBhdGNoIHNlbnQgdG8gdGhlIG1haWxpbmcKbGlzdCBbMV0uCgpBcyBpdCBpcyBjdXJyZW50
bHkgaW1wbGVtZW50ZWQsIGFuIGFsZXJ0IHRocmVzaG9sZCBvZiA4NcKwQyBpcyBzZXQgdG8KdHJp
Z2dlciB0aGUgQ1BVIHRocm90dGxpbmcsIGFuZCB3aGVuIHRoZSB0ZW1wZXJhdHVyZSBleGNlZWRz
IHRoZQpjcml0aWNhbCB0aHJlc2hvbGQgb2YgOTXCsEMsIHRoZSBzeXN0ZW0gc2h1dHMgZG93bi4g
VGhlcmUgaXMgZm9yIG5vdyBubwphY3RpdmUgY29vbGluZyBkZXZpY2Ugb24gdGhlIHBsYXRmb3Jt
LCB3aGljaCBleHBsYWlucyB0aGUgdXNlIG9mIHRoZQpjcHVmcmVxIGZyYW1ld29yay4KClsxXSBo
dHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sLzIwMjQwMzIwLXRoZXJtYWwtdjMtMi03MDAyOTY2
OTRjNGFAZ21haWwuY29tCgpTaWduZWQtb2ZmLWJ5OiBSYXBoYWVsIEdhbGxhaXMtUG91IDxyZ2Fs
bGFpc3BvdUBnbWFpbC5jb20+Ci0tLQpDaGFuZ2VzIGluIHYyOgotIEFkZCBQYXRyaWNlJ3MgUi1i
Ci0gRWRpdCBwYXRjaCBbMi8zXSB0byByZW1vdmUgdW51c2VkIHN0cnVjdAotIExpbmsgdG8gdjE6
IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNDA1MTgtdGhlcm1hbC12MS0wLTdkZmNhM2Vk
NDU0YkBnbWFpbC5jb20KCi0tLQpSYXBoYWVsIEdhbGxhaXMtUG91ICgzKToKICAgICAgdGhlcm1h
bDogc3Q6IHN3aXRjaCBmcm9tIENPTkZJR19QTV9TTEVFUCBndWFyZHMgdG8gcG1fc2xlZXBfcHRy
KCkKICAgICAgdGhlcm1hbDogc3RpOiBkZXBlbmQgb24gVEhFUk1BTF9PRiBzdWJzeXN0ZW0KICAg
ICAgQVJNOiBkdHM6IHN0aTogYWRkIHRoZXJtYWwtem9uZXMgc3VwcG9ydCBvbiBzdGloNDE4Cgog
YXJjaC9hcm0vYm9vdC9kdHMvc3Qvc3RpaDQwNy1mYW1pbHkuZHRzaSB8ICA2ICsrKy0tCiBhcmNo
L2FybS9ib290L2R0cy9zdC9zdGloNDE4LmR0c2kgICAgICAgIHwgNDEgKysrKysrKysrKysrKysr
KysrKysrKysrKysrKystLS0KIGRyaXZlcnMvdGhlcm1hbC9zdC9LY29uZmlnICAgICAgICAgICAg
ICAgfCAgMSArCiBkcml2ZXJzL3RoZXJtYWwvc3Qvc3RfdGhlcm1hbC5jICAgICAgICAgIHwgMjkg
KysrKysrKysrLS0tLS0tLS0tLS0tLQogZHJpdmVycy90aGVybWFsL3N0L3N0X3RoZXJtYWxfbWVt
bWFwLmMgICB8ICAyICstCiBkcml2ZXJzL3RoZXJtYWwvc3Qvc3RtX3RoZXJtYWwuYyAgICAgICAg
IHwgIDggKysrLS0tLQogNiBmaWxlcyBjaGFuZ2VkLCA1OCBpbnNlcnRpb25zKCspLCAyOSBkZWxl
dGlvbnMoLSkKLS0tCmJhc2UtY29tbWl0OiAwZmM0YmZhYjJjZDQ1ZjlhY2I4NmM0ZjA0YjUxOTFl
MTE0ZTkwMWVkCmNoYW5nZS1pZDogMjAyNDA1MTgtdGhlcm1hbC04ZjYyNTQyOGFjZjkKCkJlc3Qg
cmVnYXJkcywKLS0gClJhcGhhZWwgR2FsbGFpcy1Qb3UgPHJnYWxsYWlzcG91QGdtYWlsLmNvbT4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0
bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29t
Cmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXN0bTMyCg==
