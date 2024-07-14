Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D29A49309C2
	for <lists+linux-stm32@lfdr.de>; Sun, 14 Jul 2024 13:43:20 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 80537C6C855;
	Sun, 14 Jul 2024 11:43:20 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 04564C6C841
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 14 Jul 2024 11:43:13 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-42797289c8bso24881255e9.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 14 Jul 2024 04:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720957393; x=1721562193;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2n5TCQJ2aZTml13MKx0tGjckXVIFB7K8BA9Nly4+9wo=;
 b=KTcC98/MXMKwY+a3mUxFxiFUyfQ/yTF74juTywcxBmkGnuqCScDRLt/htemC+/29Wn
 ObkkIBk1AP555MG5itZgYVM2F8L5q2H5exq38Y9zT4zYIQGRq6rtItyF3achTWFZYJHN
 VP02GUiN7th67QK5v4uYbncdnEklg+HT7iMvKjpeMWQ05IzZmVIfcTlhtTdJVeZyEc8X
 HoqtoqFi952Zu6BeT0mepCt7u+HV1OlzSdv/yiKBR6u4i8g4askh4/8K2rxD/uAqUaSz
 MxpDo+gLm99lKxzjpW9wyrWohelb3/hqQXeyVwi5wDjdKxvIoanGw1FndwZZmiNteTTY
 5/0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720957393; x=1721562193;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2n5TCQJ2aZTml13MKx0tGjckXVIFB7K8BA9Nly4+9wo=;
 b=Ozpq8qkBSy6zSpRUQVhU6KNoI7s6WKSIzkqHuEOKoSnY47sHcWvcg8us8a9L+QR1Jb
 A1i04HhsrLPl3EMr4qp8ot6aXmwCMccOau2/h6OGzR5U2GzidiJPCo1ERm0vz/7wKl8V
 F3lq40FR/naS3kHbYhyG9sjooyvf8alrjU6xUnlRdWpqavT+SL1BZFIkI/1+R1S0VqPf
 MdzxyP0A/JLrU9peVJ039SdRDbxvYT+H5hRUlJ1XkGfGNx7IuoVHxkj0XkZwCpSjXMML
 PQPR9YoVUNGKya/xff8A2WxTM6/MOgfdAwmULMhmL+aErPq2A6o37a0znVQtKt8tSeIQ
 9eQA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUNOJCpgcKpzdgVERVl5V+qoo/rymbY8SrVzMPWClBjMeV9SYmOsRVAsMhJjJRllpuw5/yLHAjjzsjUfClpAMAg6Mc9CNWoNGVKVADDYvOlnSxiRjJg2V1d
X-Gm-Message-State: AOJu0YxM6xay461M2RMPZi87OW7kheybe1dOUpJ+UCxExaI/KyF48xuV
 Ahi4dOoDE5A73dFp9UyiW6oF2jXaPjGwf9LGExvp6p8eq/WkxY6e
X-Google-Smtp-Source: AGHT+IExNrbXa/f2Lp9GuK2cGefWfniERXAX71ycVDSa7Qqxj4fnPg2Z1sso2yeSttZjeaTAepYziw==
X-Received: by 2002:a05:600c:b48:b0:426:8c36:5841 with SMTP id
 5b1f17b1804b1-4268c459b89mr102803385e9.23.1720957392745; 
 Sun, 14 Jul 2024 04:43:12 -0700 (PDT)
Received: from localhost ([2001:861:3385:e20:6384:4cf:52c5:3194])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427a5edb454sm48887395e9.32.2024.07.14.04.43.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Jul 2024 04:43:12 -0700 (PDT)
From: Raphael Gallais-Pou <rgallaispou@gmail.com>
Date: Sun, 14 Jul 2024 13:42:44 +0200
Message-Id: <20240714-thermal-v3-0-88f2489ef7d5@gmail.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIALS5k2YC/2WNzQ7CIBAGX6XZs5hCQdGT72E8UFjaTfoXaIim6
 btLe6mJx/myM7tAxEAY4V4sEDBRpHHIUJ0KsK0ZGmTkMoMohSwV12xuMfSmY9pfhJJCG+tvkK+
 ngJ7ee+n5ytxSnMfw2cOJb+t/I3FWsqvz1lTopJL1o+kNdWc79rA1kji8/O3wRPZqrysl0SmO+
 Out6/oFDGIXy9YAAAA=
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Patrice Chotard <patrice.chotard@foss.st.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
X-Mailer: b4 0.14.0
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-pm@vger.kernel.org
Subject: [Linux-stm32] [PATCH v3 0/2] Add thermal management support for STi
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
bGFpc3BvdUBnbWFpbC5jb20+Ci0tLQpDaGFuZ2VzIGluIHYzOgotIEZpeCB1bm1ldCBkZXBlbmRl
bmN5IGluIFsyLzJdCi0gUmVtb3ZlIG5vIG1vcmUgdXNlZCB2YXJpYWJsZSBpbiBbMi8yXQotIFJl
bW92ZSBhbHJlYWR5IG1lcmdlZCBwYXRjaCBpbiBzb2MgdHJlZQotIExpbmsgdG8gdjI6IGh0dHBz
Oi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNDA2MjUtdGhlcm1hbC12Mi0wLWJmODM1NGVkNTFlZUBn
bWFpbC5jb20KCkNoYW5nZXMgaW4gdjI6Ci0gQWRkIFBhdHJpY2UncyBSLWIKLSBFZGl0IHBhdGNo
IFsyLzNdIHRvIHJlbW92ZSB1bnVzZWQgc3RydWN0Ci0gTGluayB0byB2MTogaHR0cHM6Ly9sb3Jl
Lmtlcm5lbC5vcmcvci8yMDI0MDUxOC10aGVybWFsLXYxLTAtN2RmY2EzZWQ0NTRiQGdtYWlsLmNv
bQoKLS0tClJhcGhhZWwgR2FsbGFpcy1Qb3UgKDIpOgogICAgICB0aGVybWFsOiBzdDogc3dpdGNo
IGZyb20gQ09ORklHX1BNX1NMRUVQIGd1YXJkcyB0byBwbV9zbGVlcF9wdHIoKQogICAgICB0aGVy
bWFsOiBzdGk6IGRlcGVuZCBvbiBUSEVSTUFMX09GIHN1YnN5c3RlbQoKIGRyaXZlcnMvdGhlcm1h
bC9zdC9LY29uZmlnICAgICAgICAgICAgIHwgIDIgKysKIGRyaXZlcnMvdGhlcm1hbC9zdC9zdF90
aGVybWFsLmMgICAgICAgIHwgMzIgKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0tLS0KIGRy
aXZlcnMvdGhlcm1hbC9zdC9zdF90aGVybWFsX21lbW1hcC5jIHwgIDIgKy0KIGRyaXZlcnMvdGhl
cm1hbC9zdC9zdG1fdGhlcm1hbC5jICAgICAgIHwgIDggKysrLS0tLS0KIDQgZmlsZXMgY2hhbmdl
ZCwgMTcgaW5zZXJ0aW9ucygrKSwgMjcgZGVsZXRpb25zKC0pCi0tLQpiYXNlLWNvbW1pdDogM2Zl
MTIxYjYyMjgyNWZmOGNjOTk1YTFlNmIwMjYxODFjNDgxODhkYgpjaGFuZ2UtaWQ6IDIwMjQwNTE4
LXRoZXJtYWwtOGY2MjU0MjhhY2Y5CgpCZXN0IHJlZ2FyZHMsCi0tIApSYXBoYWVsIEdhbGxhaXMt
UG91IDxyZ2FsbGFpc3BvdUBnbWFpbC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJA
c3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1y
ZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
