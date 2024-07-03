Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B2B64925A7A
	for <lists+linux-stm32@lfdr.de>; Wed,  3 Jul 2024 13:00:31 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3C437C71280;
	Wed,  3 Jul 2024 11:00:31 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F1584C6DD9E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 Jul 2024 11:00:23 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-36794da7c96so235776f8f.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 03 Jul 2024 04:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1720004423; x=1720609223;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=EtisqDMXNi+4gJuWXZy25aio20MDv0fW59jKl/DfJmI=;
 b=WwXSXM7zIxKwaPR1Uamc06t1iTlboPtxiXNe8KZxUJApwUzqkEDC2ZZmUFNO+1twmc
 eGP/E1Ds3EH+QVF+C/yjfcJOnB0AZ7576SpD1nR1BMXRNXk62utG0LVT2vmf1fPTuPZY
 Bsu37lahdUpF5R4jxISNOBDm971uU4DvLEsYXcqDR0g4aF2f/utL45EkPjkOS4CIfi5e
 UofEIyXw5vzTaszGjc7CBRkxUkzBt5X7NPIfK2/TWIqo+gNePe1aY2/Dl7nYjP37Zd3f
 r2ZSWw+rSaHgmC+vEVXoJ5NdrRduSofGf83LPMk/gaUKpsk9dzqiROJQSV+3wcW1JoeD
 AAlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720004423; x=1720609223;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EtisqDMXNi+4gJuWXZy25aio20MDv0fW59jKl/DfJmI=;
 b=IbxfWzUbV9CAqlqxfp8lO56sSEWhCYxsQLkLH/CyM3dnj9+LWTaoVb5+uG/tDibZ5a
 vMUE731Cp5AG/VTAlMuAG3kKrvAUxjGEdGHrlQG3wZTdHn7IcI55z0bIsqkurFPKiJcV
 lZFhW66LJiS2X9foUop42pXjJ2EOWLkUe2b76Tt9B3c6FyqWAAEb0Fw88VokZPBq5mGq
 YPcQqpp8Ldyqv4Qqq0K9dLXOLpvByRpHJn3WRnwpKFnEWislvnJ7E1XOZf7eO46XSiix
 tqx+ZmvOQaOFPgOyTclDHJdpawNHuqkWO7jUhj279BiWxRPR+EDIHRpMLkSEYohK3Jyl
 +nNw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWSWuXKZ616nWJtL0xRAwa22hOhzdA6EBBblvqLQbzKeY8dSkm8VeJ0//nZiBRLohiwMpjIlHuC2rxtB9OOBI7LTaQM6IU/oR6mDEO42bn0Nlj3YF9aQo4s
X-Gm-Message-State: AOJu0Yx4GzHcV54g2wR77R4r+PDMQOFrtVSDU/H7Lc1aQ515cQ/L7q9o
 snBPevDL2rJgna0GPmtrMA29N3pAx0BZrUq2079Iz/so7qQl6OsKE1HOsVoep5w=
X-Google-Smtp-Source: AGHT+IGO43C86ulPQhwH3Aoxdh6WYDHyi8aYiyMUrl6XRbUbgoH04VEiYXx2FjA/4gS9pUkkEHf9aw==
X-Received: by 2002:adf:e6d1:0:b0:367:9387:e48f with SMTP id
 ffacd0b85a97d-3679387e567mr785575f8f.66.1720004423383; 
 Wed, 03 Jul 2024 04:00:23 -0700 (PDT)
Received: from localhost (p50915e7b.dip0.t-ipconnect.de. [80.145.94.123])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36794e6863dsm1166471f8f.50.2024.07.03.04.00.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jul 2024 04:00:23 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>
Date: Wed,  3 Jul 2024 13:00:06 +0200
Message-ID: <20240703110010.672654-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1456;
 i=u.kleine-koenig@baylibre.com; h=from:subject;
 bh=+HpQU6gozfMhxx/gK3ptpRjLMLOdhZfsXR4twlS01fQ=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBmhS86WGTNadNOW9022Y1BJVZ0YoeD9AI4auTyP
 oXqPps71u+JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZoUvOgAKCRCPgPtYfRL+
 Tqu8B/wI+eGBZNzv4A1QkDusnMYU4hP2fpp2SYqvFd57lIMZtXJWJxiS5a5DBRXlf7lvxoadkn+
 h43doYvsd7Rg0y5hmHZqye1bH7hTM2sSo4YjkLcVUleO0Ay9D/fv6MmQ486KDaE7CQ2Ck/3JgNM
 7zSmQ5Xj3H7vsO03Hq3cxyJuvXS4kyGmy7mTgEbToRGaWtMqOqdBPUjxST2nevCuklD2QSNPGOS
 Q/g5tDpDeF+erR2rSMDRZN0DdY6Npe/UE1gE6Xs2EmmHykVr4UQ2KO1RUImrI7OKpYas2JNNi8z
 M/mo6b/EhVtyq+f5LLyCI2pQ6F9ck9HeopPW2ejiszIrHLYk
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Cc: linux-pwm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] pwm: stm32: Always do lazy disabling
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

V2hlbiB0aGUgc3RhdGUgY2hhbmdlcyBmcm9tIGVuYWJsZWQgdG8gZGlzYWJsZWQsIHBvbGFyaXR5
LCBkdXR5X2N5Y2xlCmFuZCBwZXJpb2QgYXJlIG5vdCBjb25maWd1cmVkIGluIGhhcmR3YXJlIGFu
ZCBUSU1fQ0NFUl9DQ3hFIGlzIGp1c3QKY2xlYXJlZC4gSG93ZXZlciBpZiB0aGUgc3RhdGUgY2hh
bmdlcyBmcm9tIG9uZSBkaXNhYmxlZCBzdGF0ZSB0bwphbm90aGVyLCBhbGwgcGFyYW1ldGVycyBh
cmUgd3JpdHRlbiB0byBoYXJkd2FyZSBiZWNhdXNlIHRoZSBlYXJseSBleGl0CmZyb20gc3RtMzJf
cHdtX2FwcGx5KCkgaXMgb25seSB0YWtlbiBpZiB0aGUgcHdtIGlzIGN1cnJlbnRseSBlbmFibGVk
LgoKVGhpcyB5aWVsZHMgc3VycHJpc2VzIGxpa2U6IEFwcGx5aW5nCgoJeyAucGVyaW9kID0gMSwg
LmR1dHlfY3ljbGUgPSAwLCAuZW5hYmxlZCA9IGZhbHNlIH0KCnN1Y2NlZWRzIGlmIHRoZSBwd20g
aXMgaW5pdGlhbGx5IG9uLCBidXQgZmFpbHMgaWYgaXQncyBhbHJlYWR5IG9mZgpiZWNhdXNlIDEg
aXMgYSB0b28gc21hbGwgcGVyaW9kLgoKVXBkYXRlIHRoZSBjaGVjayBmb3IgbGF6eSBkaXNhYmxl
IHRvIGFsd2F5cyBleGl0IGVhcmx5IGlmIHRoZSB0YXJnZXQKc3RhdGUgaXMgZGlzYWJsZWQsIG5v
IG1hdHRlciB3aGF0IGlzIGN1cnJlbnRseSBjb25maWd1cmVkLgoKRml4ZXM6IDdlZGY3MzY5MjA1
YiAoInB3bTogQWRkIGRyaXZlciBmb3IgU1RNMzIgcGxhZnRvcm0iKQpTaWduZWQtb2ZmLWJ5OiBV
d2UgS2xlaW5lLUvDtm5pZyA8dS5rbGVpbmUta29lbmlnQGJheWxpYnJlLmNvbT4KLS0tCiBkcml2
ZXJzL3B3bS9wd20tc3RtMzIuYyB8IDUgKysrLS0KIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlv
bnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9wd20vcHdtLXN0bTMy
LmMgYi9kcml2ZXJzL3B3bS9wd20tc3RtMzIuYwppbmRleCBmYmEwODBkYWY0NDUuLmZkNzU0YTk5
Y2YyZSAxMDA2NDQKLS0tIGEvZHJpdmVycy9wd20vcHdtLXN0bTMyLmMKKysrIGIvZHJpdmVycy9w
d20vcHdtLXN0bTMyLmMKQEAgLTQ1Miw4ICs0NTIsOSBAQCBzdGF0aWMgaW50IHN0bTMyX3B3bV9h
cHBseShzdHJ1Y3QgcHdtX2NoaXAgKmNoaXAsIHN0cnVjdCBwd21fZGV2aWNlICpwd20sCiAKIAll
bmFibGVkID0gcHdtLT5zdGF0ZS5lbmFibGVkOwogCi0JaWYgKGVuYWJsZWQgJiYgIXN0YXRlLT5l
bmFibGVkKSB7Ci0JCXN0bTMyX3B3bV9kaXNhYmxlKHByaXYsIHB3bS0+aHdwd20pOworCWlmICgh
c3RhdGUtPmVuYWJsZWQpIHsKKwkJaWYgKGVuYWJsZWQpCisJCQlzdG0zMl9wd21fZGlzYWJsZShw
cml2LCBwd20tPmh3cHdtKTsKIAkJcmV0dXJuIDA7CiAJfQogCgpiYXNlLWNvbW1pdDogYjg2ODli
YjliOTAxZTVlMmJjMGYwOTA1MzIwYjMyZThjODk4YTU4YgotLSAKMi40My4wCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5n
IGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0
LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
