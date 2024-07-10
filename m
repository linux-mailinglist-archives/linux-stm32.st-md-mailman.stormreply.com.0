Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F6B792CBF2
	for <lists+linux-stm32@lfdr.de>; Wed, 10 Jul 2024 09:31:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EA19FC6DD72;
	Wed, 10 Jul 2024 07:31:15 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AC619C5E2CD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Jul 2024 07:31:09 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-a77c0b42a8fso75556766b.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Jul 2024 00:31:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1720596669; x=1721201469;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zeoMyAYH/0AY49p/6wUMg/daMN8t7+U6lzuDcGnmvQs=;
 b=Yb2ZmGaTG19wYDmZVXy/oAwBMe8Oqqt2E/PjgRASuKHyPwGkLDHUBZ0c7w8ZySN7of
 llARTzZ36ggBQMFIgmdlTiLZF/RiZ1JL+objj5SMcQ0CtoAongTrfRAHam2CP2L43QRR
 jnf9zi14lcDuWtFxt5cIad3Kyjq8PoyIgxkpdVCr7hL356OyugPSe/Wp1nuVzJLBlXSm
 kmRNQoRCXnQ0JyUwIKOP2xw8SIhNyVz1UYurpDkAmQjwhRdqnktnP9un7JEN+LImlR4I
 wEgibFGmFC39aZRmwwbdfhVgLaGVzfnAvFmvmwDVG8u54T5PdxzNKhJHg/rPverQGCQ/
 TO/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720596669; x=1721201469;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zeoMyAYH/0AY49p/6wUMg/daMN8t7+U6lzuDcGnmvQs=;
 b=I9X7fKFMeb9A1rbv6L8y/visVgdZN3gr0+l1x7tQ2JFU2917MXvGAYXmAZImxNDBTN
 Zfl0bmVx+O+xb7Drugbp6ftzgjZ0gETOmWl4lNm288hWtx3K5HfRsGlJ0sQPLRAZp2nL
 +/e/8Kksq1MS3jasS47wC+WFyxscSeQXhegPlJYDWXZvbpwIWyBxZXWoLnncAwCc451B
 U2Zzt8EL3V+ZB1Xh1pjjVuGhoE0Fb4UkgV9LuKNX43M4nG7xYwVHX8zn4iLRWPwHoCsT
 6Xul09lPwzVp0b/wDtTXeAGt2j3UO+w6yFm331aBVhLnCgtUNBKxH2ES/3cD6ffzxy0B
 OhJg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXqbs8UXvqAskIJJ5+4iffUJFO4+UZEqNy6DX4aO/Bh+0ExggzEZuXTwSHlybUInnEaMMmAod+u9pTxhXUrKAH5eUJvgVq0WWfkVGJkjUqS9ZWfFO9kOXxP
X-Gm-Message-State: AOJu0YxJOlvXUqoVzgBbrjq2ugejkBvq4LFPPgWnd1tK+BImseMyeg9D
 Sa4lFHAiMguHdH4fiHxBDe1wSQouY3eFgF9IQBsC6dxpxE/RKsraLNMLiXehQ7Wukj2FQCFYuLp
 w
X-Google-Smtp-Source: AGHT+IGa902OsSSWrLryMzBb4Z7dwfffKSYSGip8Pq0Sc3sPP9BE70P5Tpa4HHUD4DT0BlnE0QzRkA==
X-Received: by 2002:a17:907:76cf:b0:a72:5967:b34 with SMTP id
 a640c23a62f3a-a780d267c19mr335101166b.22.1720596668917; 
 Wed, 10 Jul 2024 00:31:08 -0700 (PDT)
Received: from localhost (p50915eb1.dip0.t-ipconnect.de. [80.145.94.177])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a780a86f62bsm136608866b.199.2024.07.10.00.31.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jul 2024 00:31:08 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Date: Wed, 10 Jul 2024 09:30:50 +0200
Message-ID: <20240710073050.192806-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3664;
 i=u.kleine-koenig@baylibre.com; h=from:subject;
 bh=Nox0WDYkPvAoxUCnliq+o9vOQ6rG1/i+jlOyvW0SQhY=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBmjjiqsnamzmn5YFRYQqcfNOpdF/BBUPTls9NUy
 atWrP1ZZCqJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZo44qgAKCRCPgPtYfRL+
 TgEhB/9bSs3HH4og760D8KT4qcx9cUaeTq1lr+ED5dBa3Srz6KszoCao9p41K7im4QEuSChDhQ3
 JYUxrUiffdhn3MfS4pMefm0J1IGFNdoz9TyO7m2JhrMlfb2+ZYrJpCd0JXbV7dTM6Etw35qNIdN
 DDVRdrqcOwtDOQkCz3dw1Gl/KbgAFi0ezox0uYpbFH8+bl0YBjG2ROci8tYwMz1ohr8+rv3HgdE
 1DLDGdgLE6ehl5VtUjyke40VVZaQ8N3iHJkY6eITBj0VggOa2GgeMADKjSXLlNnpmNoV2D06fP1
 4j+wIg4ZsZGImMXi7mHAVfib4ZmRdNtdUNMC40tYm+MBEwoF
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Cc: linux-arm-kernel@lists.infradead.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Guenter Roeck <linux@roeck-us.net>
Subject: [Linux-stm32] [PATCH] usb: typec: Drop explicit initialization of
	struct i2c_device_id::driver_data to 0
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

VGhlc2UgZHJpdmVyIGRvbid0IHVzZSB0aGUgZHJpdmVyX2RhdGEgbWVtYmVyIG9mIHN0cnVjdCBp
MmNfZGV2aWNlX2lkLApzbyBkb24ndCBleHBsaWNpdGx5IGluaXRpYWxpemUgdGhpcyBtZW1iZXIu
CgpUaGlzIHByZXBhcmVzIHB1dHRpbmcgZHJpdmVyX2RhdGEgaW4gYW4gYW5vbnltb3VzIHVuaW9u
IHdoaWNoIHJlcXVpcmVzCmVpdGhlciBubyBpbml0aWFsaXphdGlvbiBvciBuYW1lZCBkZXNpZ25h
dG9ycy4gQnV0IGl0J3MgYWxzbyBhIG5pY2UKY2xlYW51cCBvbiBpdHMgb3duLgoKU2lnbmVkLW9m
Zi1ieTogVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BiYXlsaWJyZS5jb20+Ci0t
LQogZHJpdmVycy91c2IvdHlwZWMvYW54NzQxMS5jICAgICAgICAgICAgICAgfCAyICstCiBkcml2
ZXJzL3VzYi90eXBlYy90Y3BtL2Z1c2IzMDIuYyAgICAgICAgICB8IDQgKystLQogZHJpdmVycy91
c2IvdHlwZWMvdGNwbS90Y3BjaS5jICAgICAgICAgICAgfCAyICstCiBkcml2ZXJzL3VzYi90eXBl
Yy90Y3BtL3RjcGNpX21heGltX2NvcmUuYyB8IDIgKy0KIGRyaXZlcnMvdXNiL3R5cGVjL3Vjc2kv
dWNzaV9jY2cuYyAgICAgICAgIHwgMiArLQogZHJpdmVycy91c2IvdHlwZWMvdWNzaS91Y3NpX3N0
bTMyZzAuYyAgICAgfCA0ICsrLS0KIDYgZmlsZXMgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCA4
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL3R5cGVjL2FueDc0MTEuYyBi
L2RyaXZlcnMvdXNiL3R5cGVjL2FueDc0MTEuYwppbmRleCBiMTJhMDdlZGM3MWIuLjVhNWJmMzUz
MmFkNyAxMDA2NDQKLS0tIGEvZHJpdmVycy91c2IvdHlwZWMvYW54NzQxMS5jCisrKyBiL2RyaXZl
cnMvdXNiL3R5cGVjL2FueDc0MTEuYwpAQCAtMTU2Niw3ICsxNTY2LDcgQEAgc3RhdGljIHZvaWQg
YW54NzQxMV9pMmNfcmVtb3ZlKHN0cnVjdCBpMmNfY2xpZW50ICpjbGllbnQpCiB9CiAKIHN0YXRp
YyBjb25zdCBzdHJ1Y3QgaTJjX2RldmljZV9pZCBhbng3NDExX2lkW10gPSB7Ci0JeyJhbng3NDEx
IiwgMH0sCisJeyAiYW54NzQxMSIgfSwKIAl7fQogfTsKIApkaWZmIC0tZ2l0IGEvZHJpdmVycy91
c2IvdHlwZWMvdGNwbS9mdXNiMzAyLmMgYi9kcml2ZXJzL3VzYi90eXBlYy90Y3BtL2Z1c2IzMDIu
YwppbmRleCBlZjE4YTQ0OGI3NDAuLmUyZmU0NzllMTZhZCAxMDA2NDQKLS0tIGEvZHJpdmVycy91
c2IvdHlwZWMvdGNwbS9mdXNiMzAyLmMKKysrIGIvZHJpdmVycy91c2IvdHlwZWMvdGNwbS9mdXNi
MzAyLmMKQEAgLTE4MjAsOCArMTgyMCw4IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNl
X2lkIGZ1c2IzMDJfZHRfbWF0Y2hbXSBfX21heWJlX3VudXNlZCA9IHsKIE1PRFVMRV9ERVZJQ0Vf
VEFCTEUob2YsIGZ1c2IzMDJfZHRfbWF0Y2gpOwogCiBzdGF0aWMgY29uc3Qgc3RydWN0IGkyY19k
ZXZpY2VfaWQgZnVzYjMwMl9pMmNfZGV2aWNlX2lkW10gPSB7Ci0JeyJ0eXBlY19mdXNiMzAyIiwg
MH0sCi0Je30sCisJeyAidHlwZWNfZnVzYjMwMiIgfSwKKwl7fQogfTsKIE1PRFVMRV9ERVZJQ0Vf
VEFCTEUoaTJjLCBmdXNiMzAyX2kyY19kZXZpY2VfaWQpOwogCmRpZmYgLS1naXQgYS9kcml2ZXJz
L3VzYi90eXBlYy90Y3BtL3RjcGNpLmMgYi9kcml2ZXJzL3VzYi90eXBlYy90Y3BtL3RjcGNpLmMK
aW5kZXggOGExOGQ1NjFiMDYzLi5iODYyZmRmM2ZlMWQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvdXNi
L3R5cGVjL3RjcG0vdGNwY2kuYworKysgYi9kcml2ZXJzL3VzYi90eXBlYy90Y3BtL3RjcGNpLmMK
QEAgLTk0Nyw3ICs5NDcsNyBAQCBzdGF0aWMgdm9pZCB0Y3BjaV9yZW1vdmUoc3RydWN0IGkyY19j
bGllbnQgKmNsaWVudCkKIH0KIAogc3RhdGljIGNvbnN0IHN0cnVjdCBpMmNfZGV2aWNlX2lkIHRj
cGNpX2lkW10gPSB7Ci0JeyAidGNwY2kiLCAwIH0sCisJeyAidGNwY2kiIH0sCiAJeyB9CiB9Owog
TU9EVUxFX0RFVklDRV9UQUJMRShpMmMsIHRjcGNpX2lkKTsKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
dXNiL3R5cGVjL3RjcG0vdGNwY2lfbWF4aW1fY29yZS5jIGIvZHJpdmVycy91c2IvdHlwZWMvdGNw
bS90Y3BjaV9tYXhpbV9jb3JlLmMKaW5kZXggZWVjM2JjZWMxMTljLi43NjBlMmY5MmI5NTggMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvdXNiL3R5cGVjL3RjcG0vdGNwY2lfbWF4aW1fY29yZS5jCisrKyBi
L2RyaXZlcnMvdXNiL3R5cGVjL3RjcG0vdGNwY2lfbWF4aW1fY29yZS5jCkBAIC01MzgsNyArNTM4
LDcgQEAgc3RhdGljIHZvaWQgbWF4X3RjcGNpX3JlbW92ZShzdHJ1Y3QgaTJjX2NsaWVudCAqY2xp
ZW50KQogfQogCiBzdGF0aWMgY29uc3Qgc3RydWN0IGkyY19kZXZpY2VfaWQgbWF4X3RjcGNpX2lk
W10gPSB7Ci0JeyAibWF4dGNwYyIsIDAgfSwKKwl7ICJtYXh0Y3BjIiB9LAogCXsgfQogfTsKIE1P
RFVMRV9ERVZJQ0VfVEFCTEUoaTJjLCBtYXhfdGNwY2lfaWQpOwpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy91c2IvdHlwZWMvdWNzaS91Y3NpX2NjZy5jIGIvZHJpdmVycy91c2IvdHlwZWMvdWNzaS91Y3Np
X2NjZy5jCmluZGV4IGJhNGRiMjMxMGEwNS4uYjNlYzc5OWZjODczIDEwMDY0NAotLS0gYS9kcml2
ZXJzL3VzYi90eXBlYy91Y3NpL3Vjc2lfY2NnLmMKKysrIGIvZHJpdmVycy91c2IvdHlwZWMvdWNz
aS91Y3NpX2NjZy5jCkBAIC0xNTAxLDcgKzE1MDEsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG9m
X2RldmljZV9pZCB1Y3NpX2NjZ19vZl9tYXRjaF90YWJsZVtdID0gewogTU9EVUxFX0RFVklDRV9U
QUJMRShvZiwgdWNzaV9jY2dfb2ZfbWF0Y2hfdGFibGUpOwogCiBzdGF0aWMgY29uc3Qgc3RydWN0
IGkyY19kZXZpY2VfaWQgdWNzaV9jY2dfZGV2aWNlX2lkW10gPSB7Ci0JeyJjY2d4LXVjc2kiLCAw
fSwKKwl7ICJjY2d4LXVjc2kiIH0sCiAJe30KIH07CiBNT0RVTEVfREVWSUNFX1RBQkxFKGkyYywg
dWNzaV9jY2dfZGV2aWNlX2lkKTsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL3R5cGVjL3Vjc2kv
dWNzaV9zdG0zMmcwLmMgYi9kcml2ZXJzL3VzYi90eXBlYy91Y3NpL3Vjc2lfc3RtMzJnMC5jCmlu
ZGV4IGQ5NDhjM2Y1NzllMS4uZGRiZWMyYjc4YzhlIDEwMDY0NAotLS0gYS9kcml2ZXJzL3VzYi90
eXBlYy91Y3NpL3Vjc2lfc3RtMzJnMC5jCisrKyBiL2RyaXZlcnMvdXNiL3R5cGVjL3Vjc2kvdWNz
aV9zdG0zMmcwLmMKQEAgLTczOSw4ICs3MzksOCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2Rl
dmljZV9pZCBfX21heWJlX3VudXNlZCB1Y3NpX3N0bTMyZzBfdHlwZWNfb2ZfbWF0Y2hbXSA9CiBN
T0RVTEVfREVWSUNFX1RBQkxFKG9mLCB1Y3NpX3N0bTMyZzBfdHlwZWNfb2ZfbWF0Y2gpOwogCiBz
dGF0aWMgY29uc3Qgc3RydWN0IGkyY19kZXZpY2VfaWQgdWNzaV9zdG0zMmcwX3R5cGVjX2kyY19k
ZXZpZFtdID0gewotCXsic3RtMzJnMC10eXBlYyIsIDB9LAotCXt9LAorCXsgInN0bTMyZzAtdHlw
ZWMiIH0sCisJe30KIH07CiBNT0RVTEVfREVWSUNFX1RBQkxFKGkyYywgdWNzaV9zdG0zMmcwX3R5
cGVjX2kyY19kZXZpZCk7CiAKCmJhc2UtY29tbWl0OiA4MmQwMWZlNmVlNTIwODYwMzViMjAxY2Zh
MTQxMGEzYjA0Mzg0MjU3Ci0tIAoyLjQzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBz
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJl
cGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
