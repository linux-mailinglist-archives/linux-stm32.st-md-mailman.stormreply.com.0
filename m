Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 18822AEFE81
	for <lists+linux-stm32@lfdr.de>; Tue,  1 Jul 2025 17:40:06 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7D19AC3F931;
	Tue,  1 Jul 2025 15:40:04 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5DBD0C3F930
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  1 Jul 2025 15:40:03 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id
 a640c23a62f3a-ade5a0442dfso1114509666b.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 01 Jul 2025 08:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751384403; x=1751989203;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zu/aUYBf0PlNS00AS61bNHCusGOm1IQrumCJLXD9I7E=;
 b=MurIJ4N+nxQpYklCOm61dnCO6vKNvin/lpVqtFS72rk8XE+SqKt4pKiJCBdN/AdRVI
 RYLTaKZSgAXn9qbz8U4tzaR8IBA9jXfPZM172h+z2ENIV5v3Ux8utcE+0O3pJRfa/NPl
 XfS/VKEwLHmKoyhkRAddf1jLUCqdeLf2SnzpZc/CEZ2raOMSi16Z/kObVgDhdYvEc89S
 3sT7MF0/221ifbDu3S9SJHqXlRgPvSpIGpZjQuBd9tXBzVtjb6T5+3P5aNcEiPlHdFAT
 L9vj2mMk0ISmS/RYiS74VYa7YlCYfWOBKrtsiv5IV7PKVYMisb++yNLYj6pGLO7aK+rK
 Yzhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751384403; x=1751989203;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zu/aUYBf0PlNS00AS61bNHCusGOm1IQrumCJLXD9I7E=;
 b=Mh3xaBLv0HQC/ixWTCbYlLG9qaG3aRnB+GE5Uf/Cn0V+Cts7Ua9LCszY9dfP4N+JS7
 hS58FA2sjqWb3eMHHnWs/r85wi4D8xXNArwjMYD/FWzamEMjDlsl3fPmL5HCmn6vFAZ4
 3MBb+YcBeePipBpiXnpMckcNzojLF4Tij4OWxyIX0Mv/YByKqVpiDyXu/YtPyzTPU9dD
 VYMBfz9NHhEuIzsF6F1TJri8F6MYPshXBxNdCNWKcWohlTmX4hSJ8WJkARYtdVs6xMXh
 dbEYcE9xAcJGgzsUBZtFVEmTEGH8/a/ECgXvMNFGkX+c7WUucgDjiiaIgYltUQrUkIxn
 f08A==
X-Gm-Message-State: AOJu0YwKnnLPyK4w1XhU1hx5UQh4YnUkBmw3S396T6AZ4g5gnVktc3G3
 HzxvkgAv+wGCKU6oPRCsatU9/X6p1AGvSzT7+c5a1aajy1iv0APgvASa7lJlB2R6f0o=
X-Gm-Gg: ASbGncuzOvquVIiolikhWHUzaS4BCpr7Ecb9Rhgt2kwJQniUwHDkq9M+UeET0o5My0O
 YR15jYWZvcUAQ1zthFnJBZT7aYY/rTtNQYUDtjkHDgcnWJpbwVzgxuFnsc46oa50hgw/axLh9Td
 mPhm0genz+6H8N5a8woVfCxPJBlnxZ5NJKsEqs3+slaY8zFAX1IQg/S+3yw8xVGTGYgbBL5O06d
 QrpqVodgKX1S5vxjLyqQQSNxLFoZFWwZvAuxNr53jhrsSugdpBasrZY7x6QCFh7hmMdaNyUdsMp
 kO4KpYMb+uvBDsk8ZjJ9wtWGMZ7s2I7HdFWsTuq3jb5jiTwB6HIoxIl2m5yuHpWrqQ+niL9J2VS
 aBjbFO2bnBT9zp0jXj49kpJrdMaPD
X-Google-Smtp-Source: AGHT+IFbVlpj3QgOb1lb2mwjuHq/uY0ogPM6n+DDSiv55WQWMetHGs7+SzXxABdKNyldpmd3rH0BFg==
X-Received: by 2002:a17:907:3c89:b0:adb:2e9d:bc27 with SMTP id
 a640c23a62f3a-ae3501a3fdfmr1843016566b.54.1751384402511; 
 Tue, 01 Jul 2025 08:40:02 -0700 (PDT)
Received: from localhost
 (p200300f65f06ab0400000000000001b9.dip0.t-ipconnect.de.
 [2003:f6:5f06:ab04::1b9]) by smtp.gmail.com with UTF8SMTPSA id
 a640c23a62f3a-ae35365a149sm902911966b.64.2025.07.01.08.40.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Jul 2025 08:40:01 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>
Date: Tue,  1 Jul 2025 17:39:56 +0200
Message-ID: <20250701153956.151075-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1766;
 i=u.kleine-koenig@baylibre.com; h=from:subject;
 bh=xIDuTWlVNtbxYRGDgUiY1kjsuLGle4dbWyJlIAE+380=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBoZAFMd9hfYvSDdH6NlNBCtd+mWzxIpcu7SzyJL
 Vv4ihk8tK+JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaGQBTAAKCRCPgPtYfRL+
 TqoQB/4rMtlq6IeeAFEak8bwAIxskqFVJckOHDLYXcaqI/AQtZonNEwemRE5kIU49xfq0xBknb8
 WhbD/au1vD8NX+pejwkunkUi5xvElERYZRYVKvWQFVAEw1BMBdrlv6kvnn9TWJxTv87WAynCtIr
 SWR2UwkRj10qxtpywXotdOkYjDCLCgCiKaFSTrrIk++QUOF9RPF0U3BaPi73Klw9UXo4ULu9ezt
 BnyyX4XQ5OcLWlmOo/xIXUBxTEGqeZe62jhHXhB1ulxXU/EVYUhc5JrgqSiEIHGhO7DLzxbILD3
 MET4Jx+ac2dRs2Nzp2FOUYMXZilVx0hHfkvu/t9LewvM9oqj
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Cc: linux-kbuild@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org,
 Markus Schneider-Pargmann <msp@baylibre.com>
Subject: [Linux-stm32] [PATCH] clocksource/drivers/nxp-timer: Don't call
	platform driver struct nxp_stm_probe
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

VGhlcmUgYXJlIGEgZmV3IHJ1bGVzIGluIHRoZSBtb2Rwb3N0IHN0ZXAgY2hlY2tpbmcgZm9yIHNl
Y3Rpb24KbWlzbWF0Y2hlcyB0aGF0IGRlcGVuZCBvbiBhbiBvYmplY3QncyBuYW1lLiBUaGUgY2hl
Y2tzIGZvciBvYmplY3RzIHdpdGgKYSBuYW1lIGVuZGluZyBpbiAoZS5nLikgX3Byb2JlIGFyZSBt
b3JlIGxheCB0aGFuIHRoZXkgc2hvdWxkIGJlIGZvcgpwbGF0Zm9ybSBkcml2ZXJzLgoKU28gcmVu
YW1lIHRoZSBkcml2ZXIgc3RydWN0IHRvIGVuZCBpbiAiX2RyaXZlciIgd2hpY2ggaXMgdGhlIGNv
bW1vbgp0aGluZyB0byBkby4KCk5vdGUgdGhhdCB0aGlzIHJlc3VsdHMgaW5kZWVkIGluIGEgc2Vj
dGlvbiBtaXNtYXRjaCwgaS5lLjoKCglXQVJOSU5HOiBtb2Rwb3N0OiB2bWxpbnV4OiBzZWN0aW9u
IG1pc21hdGNoIGluIHJlZmVyZW5jZTogbnhwX3N0bV9kcml2ZXIrMHgwIChzZWN0aW9uOiAuZGF0
YSkgLT4gbnhwX3N0bV90aW1lcl9wcm9iZSAoc2VjdGlvbjogLmluaXQudGV4dCkKCnRoYXQgc2hv
dWxkIGJlIGZpeGVkLiBJZiB0aGUgcmVsZXZhbnQgZGV2aWNlIGlzIGFscmVhZHkgYXZhaWxhYmxl
IHdpdGgKYWxsIGRlcGVuZGVuY2llcyBwcm9iZWQgd2hlbiB0aGUgZHJpdmVyIGlzIHJlZ2lzdGVy
ZWQsIHRoZSByaWdodAphcHByb2FjaCB0byBkbyB0aGF0IGlzIHVzaW5nIG1vZHVsZV9wbGF0Zm9y
bV9kcml2ZXJfcHJvYmUoKSBpbnN0ZWFkIG9mCm1vZHVsZV9wbGF0Zm9ybV9kcml2ZXIoKS4gT3Ro
ZXJ3aXNlIGl0J3MgbW9yZSBjb21wbGljYXRlZC4KClNpZ25lZC1vZmYtYnk6IFV3ZSBLbGVpbmUt
S8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAYmF5bGlicmUuY29tPgotLS0KIGRyaXZlcnMvY2xvY2tz
b3VyY2UvdGltZXItbnhwLXN0bS5jIHwgNCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRp
b25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvY2xvY2tzb3VyY2Uv
dGltZXItbnhwLXN0bS5jIGIvZHJpdmVycy9jbG9ja3NvdXJjZS90aW1lci1ueHAtc3RtLmMKaW5k
ZXggZDdjY2Y5MDAxNzI5Li4xYTcwYzkwMTM5MjEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvY2xvY2tz
b3VyY2UvdGltZXItbnhwLXN0bS5jCisrKyBiL2RyaXZlcnMvY2xvY2tzb3VyY2UvdGltZXItbnhw
LXN0bS5jCkBAIC00ODIsMTQgKzQ4MiwxNCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2Rldmlj
ZV9pZCBueHBfc3RtX29mX21hdGNoW10gPSB7CiB9OwogTU9EVUxFX0RFVklDRV9UQUJMRShvZiwg
bnhwX3N0bV9vZl9tYXRjaCk7CiAKLXN0YXRpYyBzdHJ1Y3QgcGxhdGZvcm1fZHJpdmVyIG54cF9z
dG1fcHJvYmUgPSB7CitzdGF0aWMgc3RydWN0IHBsYXRmb3JtX2RyaXZlciBueHBfc3RtX2RyaXZl
ciA9IHsKIAkucHJvYmUJPSBueHBfc3RtX3RpbWVyX3Byb2JlLAogCS5kcml2ZXIJPSB7CiAJCS5u
YW1lCQk9ICJueHAtc3RtIiwKIAkJLm9mX21hdGNoX3RhYmxlCT0gbnhwX3N0bV9vZl9tYXRjaCwK
IAl9LAogfTsKLW1vZHVsZV9wbGF0Zm9ybV9kcml2ZXIobnhwX3N0bV9wcm9iZSk7Cittb2R1bGVf
cGxhdGZvcm1fZHJpdmVyKG54cF9zdG1fZHJpdmVyKTsKIAogTU9EVUxFX0RFU0NSSVBUSU9OKCJO
WFAgU3lzdGVtIFRpbWVyIE1vZHVsZSBkcml2ZXIiKTsKIE1PRFVMRV9MSUNFTlNFKCJHUEwiKTsK
CmJhc2UtY29tbWl0OiAxMzQzNDMzZWQzODkyM2EyMTQyNWM2MDJlOTIxMjBhMWYxZGI1ZjdhCi0t
IAoyLjQ5LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3Jt
cmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXN0bTMyCg==
