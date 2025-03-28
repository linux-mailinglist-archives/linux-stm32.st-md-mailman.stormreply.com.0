Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 000B5A74EF3
	for <lists+linux-stm32@lfdr.de>; Fri, 28 Mar 2025 18:14:17 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AF5EFC78F7F;
	Fri, 28 Mar 2025 17:14:17 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0CF47C78F77
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Mar 2025 17:14:16 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-43cf034d4abso27031435e9.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Mar 2025 10:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1743182056; x=1743786856;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7RiNKZlkxAxgBvokSU2RyRmQNQI1s7tLyPaBleKgV+A=;
 b=uscfAlLcAKvOXlcWbYidewef1/jDtpt2hI1d6EZ+4pYD2C7QsHLmX8yBWCjkTQAhnb
 QgAqCzifQdTSHlEmhIMBXrczYXglvXngrt1BIdZaq6g1dA4h38w9AGMbClg7OipHB2B5
 DSdxQMoB7e5WmSbi6tJOt5GT2BRowDPdZPmPmv59anC1vjiNpZiVPtMAeetNHhxnpcnr
 Y9dayvQCwg7wUQ8+esTjnQUsXsX/8BYg1M2Z4XWZ/ID5eFMuIYageVfCjO0u0uZb/Bgv
 3NUyoMwOVH7BCM8OxrMZMuda0w8EBXc91pgzIqh7cHgE3JcMzlawOg9Qofw4vo/HqEsC
 qomw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743182056; x=1743786856;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7RiNKZlkxAxgBvokSU2RyRmQNQI1s7tLyPaBleKgV+A=;
 b=V0EGt2dWPj9lsjiyxPOIZXZPk5UydjL4LuFqmS1IJoK2w/pbcRDTCbyBUF/4tb4xFh
 G6bg+JdF7/Gn66or2VFcFg34/IZFjZDyl105ckuLvzQLx+ndINxNsVy9nWlLc5CsJaey
 Ff9RDzmVWDRLcXVAzzd9owa12Xv+dvnhyps+1GhMLujKVpOwch/34lm/JbwxhG9SCcCq
 0xS44CKDAsKb7V6v/s38eprME7Vw8nOJWOZTUUqG4h/e/cIEHG6gFq2Zxb/UNCB2PKMb
 p8TlzRLxKgzBU6iX4r0BmW1llghktqtB8mgjqMEqOzFly5P1RhJ7sku5KMELhpXJe65U
 nukA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVo3yAv0Xeb6GW8chRTIZYj5pQ5r/q6U+jZ8EYGRle64g1jPBC2CMywUlQiHMRKgmmV4vEfCs6rxrAx9Q==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yzrr7YdsN6xbaFi0Ph21sUhrQEOdSKkvm5pHsJcroMt0gpmCECr
 J2wlkPBoRN0mHHHBUlPuH8TUY1O4M3f6yBM8lzgGg1KeNGp86mKJKi4ppCXknaY=
X-Gm-Gg: ASbGnct0Cl89J6rwpLtKaa2EO93XKiy1jopHw5VF456f/KxG4X54oWlYbKVLp3Xn/d4
 QUDf9/d6avdAz5b4ORNEHq4f8jvyl8lv1qWrS219jIm5pq1sKfU511y8gG+DujFmDtYMvuOf+f+
 tu6jRNz+l1HiM1p/NiH4UvFH/eaL0v16oYjArBGROHizsADkgD49zGt/ky8md8LSyk6LuC0XGvF
 17J4rhvCoOOSESFOWK44RhYZPKPYquRaSExctJtPV1HQ9V6RHCEbZiBqhO+YDrwyZVFcIjLAmrt
 JdrWKxOGQkSqPiAaOMVbmhtbGsryTP419uDK99T/UP+mzkyADShCPTzvqMMrvp49ynnUsqXAm5Z
 oc4/47TnKo3A=
X-Google-Smtp-Source: AGHT+IGR/kzMV6Atudb0fRu185H6wdA1+X5asjv7gAZNnxUUZIM/KcLBLHgVDu+28V8mgpkJV6Xccw==
X-Received: by 2002:a05:600c:310c:b0:43b:c0fa:f9cd with SMTP id
 5b1f17b1804b1-43db6227ac9mr3380065e9.7.1743182056212; 
 Fri, 28 Mar 2025 10:14:16 -0700 (PDT)
Received: from localhost
 (p200300f65f14610400000000000001b9.dip0.t-ipconnect.de.
 [2003:f6:5f14:6104::1b9]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d8ff042c8sm33411655e9.27.2025.03.28.10.14.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Mar 2025 10:14:15 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Fri, 28 Mar 2025 18:14:05 +0100
Message-ID: <20250328171406.3307778-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1643;
 i=u.kleine-koenig@baylibre.com; h=from:subject;
 bh=BHpq2UbaF3kL6H8YXDTV3jWJ+lPDn0AShBL5PzMnA/s=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBn5tjen6l7NAtT3+JrsCCThqn5k1qsVD1vc0M9Y
 ZVXM89Rdy2JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZ+bY3gAKCRCPgPtYfRL+
 TvPRB/9KuR3rJQ0M41W3nqDBh5GaE52iNnZd3KKvvPv9z7cHHQyJwdW77AFGgNSv3keG14zGVSh
 nAHzmRdowRt1Fv163Ri4lOD0ZQnL/albfzfHGGROLZGh3oZBuL0i0maRccS66D8bgiBlBfDjRHg
 3v3ENgAwKOizz1eaAS4zsVozyMRtX8NC90c1HgQmwEdL6kCE5QFbvcLSaq+9yUTv0pxa0uyJFBA
 yWEcssCDxRMk38qor1VgCbVh7P67TQtNg0RHohxrNulSGjG15Ca8O29fr4AGZHWvZg3qejOSO52
 aMUKLoIqXEQ5DMJ5DpPflMnYGF52droNnFSzBVBd1q3/1nyV
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] ARM: dts: stm32: Add nvmem-cells to ethernet
	nodes for constant mac-addresses
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

VGhlIGVmdXNlIGRldmljZSB0cmVlIGRlc2NyaXB0aW9uIGFscmVhZHkgaGFzIHRoZSB0d28gbGFi
ZWxzIHBvaW50aW5nIHRvCnRoZSBlZnVzZSBub2RlcyB0aGF0IHNwZWNpZnkgdGhlIG1hYy1hZGRy
ZXNzZXMgdG8gYmUgdXNlZC4gV2lyZSB0aGVtIHVwCnRvIHRoZSBldGhlcm5ldCBub2Rlcy4gVGhp
cyBpcyBlbm91Z2ggdG8gbWFrZSBiYXJlYm94IHBpY2sgdGhlIHJpZ2h0Cm1hYy1hZGRyZXNzZXMg
YW5kIHBhc3MgdGhlbSB0byBMaW51eC4KClN1Z2dlc3RlZC1ieTogQWhtYWQgRmF0b3VtIDxhLmZh
dG91bUBwZW5ndXRyb25peC5kZT4KU2lnbmVkLW9mZi1ieTogVXdlIEtsZWluZS1Lw7ZuaWcgPHUu
a2xlaW5lLWtvZW5pZ0BiYXlsaWJyZS5jb20+Ci0tLQogYXJjaC9hcm0vYm9vdC9kdHMvc3Qvc3Rt
MzJtcDEzMS5kdHNpIHwgMiArKwogYXJjaC9hcm0vYm9vdC9kdHMvc3Qvc3RtMzJtcDEzMy5kdHNp
IHwgMiArKwogMiBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9h
cmNoL2FybS9ib290L2R0cy9zdC9zdG0zMm1wMTMxLmR0c2kgYi9hcmNoL2FybS9ib290L2R0cy9z
dC9zdG0zMm1wMTMxLmR0c2kKaW5kZXggODUxMmE2ZTQ2YjMzLi45MTc1ZWQ3N2Q3NjkgMTAwNjQ0
Ci0tLSBhL2FyY2gvYXJtL2Jvb3QvZHRzL3N0L3N0bTMybXAxMzEuZHRzaQorKysgYi9hcmNoL2Fy
bS9ib290L2R0cy9zdC9zdG0zMm1wMTMxLmR0c2kKQEAgLTE2MDksNiArMTYwOSw4IEBAIGV0aGVy
bmV0MTogZXRoZXJuZXRANTgwMGEwMDAgewogCQkJCXNucHMsYXhpLWNvbmZpZyA9IDwmc3RtbWFj
X2F4aV9jb25maWdfMT47CiAJCQkJc25wcyx0c287CiAJCQkJYWNjZXNzLWNvbnRyb2xsZXJzID0g
PCZldHpwYyA0OD47CisJCQkJbnZtZW0tY2VsbHMgPSA8JmV0aGVybmV0X21hYzFfYWRkcmVzcz47
CisJCQkJbnZtZW0tY2VsbC1uYW1lcyA9ICJtYWMtYWRkcmVzcyI7CiAJCQkJc3RhdHVzID0gImRp
c2FibGVkIjsKIAogCQkJCXN0bW1hY19heGlfY29uZmlnXzE6IHN0bW1hYy1heGktY29uZmlnIHsK
ZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jvb3QvZHRzL3N0L3N0bTMybXAxMzMuZHRzaSBiL2FyY2gv
YXJtL2Jvb3QvZHRzL3N0L3N0bTMybXAxMzMuZHRzaQppbmRleCA3M2U0NzAwMTljZTQuLjcwOGMw
YWY1MGJjNCAxMDA2NDQKLS0tIGEvYXJjaC9hcm0vYm9vdC9kdHMvc3Qvc3RtMzJtcDEzMy5kdHNp
CisrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL3N0L3N0bTMybXAxMzMuZHRzaQpAQCAtOTEsNiArOTEs
OCBAQCBldGhlcm5ldDI6IGV0aGVybmV0QDU4MDBlMDAwIHsKIAkJc25wcyxheGktY29uZmlnID0g
PCZzdG1tYWNfYXhpX2NvbmZpZ18yPjsKIAkJc25wcyx0c287CiAJCWFjY2Vzcy1jb250cm9sbGVy
cyA9IDwmZXR6cGMgNDk+OworCQludm1lbS1jZWxscyA9IDwmZXRoZXJuZXRfbWFjMl9hZGRyZXNz
PjsKKwkJbnZtZW0tY2VsbC1uYW1lcyA9ICJtYWMtYWRkcmVzcyI7CiAJCXN0YXR1cyA9ICJkaXNh
YmxlZCI7CiAKIAkJc3RtbWFjX2F4aV9jb25maWdfMjogc3RtbWFjLWF4aS1jb25maWcgewoKYmFz
ZS1jb21taXQ6IGUyMWVkYjE2MzhlODI0NjBmMTI2YTZlNDliY2RkOTU4ZDQ1MjkyOWMKLS0gCjIu
NDcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBs
eS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtc3RtMzIK
