Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A7C0DB4A9B2
	for <lists+linux-stm32@lfdr.de>; Tue,  9 Sep 2025 12:12:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6B6B6C3F93B;
	Tue,  9 Sep 2025 10:12:23 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0D2A9C3F93A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Sep 2025 10:12:22 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-45de6ab6ce7so12357155e9.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 09 Sep 2025 03:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757412741; x=1758017541;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=XI2ZZStM3cXWCSi8KK5fyFVb5U1Xw6ZX1EuBWF2OM9M=;
 b=Fwc2ekcIa/Esy2blnLxLUTXcBtrvAYGnKgwJpOwDygi5pG4kewshFPaZuzxoNqSRKD
 KWWZxF2Bvm5PZz+b135RfNdlxIBqBWMs5p7qMsQrqBigEw0AXMbNxc26HFewK3/y7UaF
 /0g9gkhQrrvP0rOiN/sN9ADJ5Z44YGcAzii8hRa3Eez18AwTlUF0OZ8flAijCuMHwyx7
 g5FU4VjxI6ZIbVw5gl2bG44uYwc1qiLa2/4veubJbUIcW2zxYJHuZa4MNUDfu4HSxRkP
 /UYZGYFSYm/Hf/1tyTM3O02qfP0yggIMV/XDJgd2y/yYtX7umve8SpQs9eexzH+id4qi
 V9ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757412741; x=1758017541;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XI2ZZStM3cXWCSi8KK5fyFVb5U1Xw6ZX1EuBWF2OM9M=;
 b=bxIZqv6V76RjGHaGC0CZHZqsu5kIYYteJtmWBt9Cizq/pQ3ZmIvUjPwG1octOiA7Cg
 /1n3p4JnZsYaAl6LeNoaXDy120EYdr8TBbjmL3TjGK3Vi/fUYsNQX6pUqBOO85f3TuXu
 pZE4+bn/+QZw8oLnZd4mRjd94WoIKN0S0qRFIfhuFiNYICbi3wWJYNtMZyzVVEK2mfx6
 il4+n0Hvyv/t2NBh0LvTBnHEnycMvxg2jzPtl9KAStoA5FPKkP3hUegSAQZ4g+DJV/+I
 cxizGLddiFcs4TV8d13m1E7LKlD9umfGWUAnTycKJMgyvWM3W4HxhDWayLVFKjEywto7
 46Mw==
X-Gm-Message-State: AOJu0YxNHyr7X96P6daypq9bpGyYXnUx+aM8VTjHuDCTGn+cPupjg36c
 y3mMB71PZ8HhBzM8avRxXuWJN+TbeskwblYxbm80pfk/a8O+CZmHBoGn
X-Gm-Gg: ASbGncu45Essn+TAAxY/805aYx2OmgnWQfiv00XAiWkgkU7elP4xKaBiDPhH9pqqy73
 idXkiGrj/0KL3yzCMAbQqoROFqJEfbnAiOT+5TS65pOf9dWPsCmy9ocZbLdOd6hGF07YMJmWd4H
 G6OhfuBWyxLP74MjaUYI4GYS/yiEt1PoQnC5OR+P5Im4sI6Mj+TOJlRczhrpWL0DhrEU5PXq7ck
 Q3pqip8oH+s8xassJlvq+G54N+6c5FBwCrbaYGjWaVCvmW8fzFHWeFsac9YbcD7QH2LBWXl6LnZ
 QVtQ0+kWeMLJUtJ+eFK599LE8JO+N3th8tY+EFfRA++XqzdlN8FlRkGKiLdhVUtZnBbAwNx6/5P
 /kegvVNJvTQJ/xXZlOMDmW7NBtrhbHqS0NJAVpN2IT+/itboTrXxwSBtKF/Z6S/12e2IklSyzem
 FsnNAuHded5Fa8MoTRoe08o6AuCA==
X-Google-Smtp-Source: AGHT+IGMq3YRNccUPXUDuQKWqwTrrYGimoWd2y4QrCx0yTnHMLewx8Uj16eSzaAZy993XHeIO/nPgA==
X-Received: by 2002:a05:600c:45cc:b0:459:dde3:1a55 with SMTP id
 5b1f17b1804b1-45dddec78d3mr98422505e9.24.1757412741076; 
 Tue, 09 Sep 2025 03:12:21 -0700 (PDT)
Received: from localhost (2a02-8440-7136-74e7-5ebf-4282-0e1a-b885.rev.sfr.net.
 [2a02:8440:7136:74e7:5ebf:4282:e1a:b885])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45c6faad9cfsm304908725e9.0.2025.09.09.03.12.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Sep 2025 03:12:20 -0700 (PDT)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
Date: Tue, 09 Sep 2025 12:12:08 +0200
MIME-Version: 1.0
Message-Id: <20250909-b4-ddrperfm-upstream-v6-1-ce082cc801b5@gmail.com>
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
Subject: [Linux-stm32] [PATCH v6 01/20] bus: firewall: move stm32_firewall
 header file in include folder
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
T3RoZXIgZHJpdmVyIHRoYW4gcmlmc2MgYW5kIGV0enBjIGNhbiBpbXBsZW1lbnQgZmlyZXdhbGwg
b3BzLCBzdWNoIGFzCnJjYy4KSW4gb3JkZXIgZm9yIHRoZW0gdG8gaGF2ZSBhY2Nlc3MgdG8gdGhl
IG9wcyBhbmQgdHlwZSBvZiB0aGlzIGZyYW1ld29yaywKd2UgbmVlZCB0byBnZXQgdGhlIGBzdG0z
Ml9maXJld2FsbC5oYCBmaWxlIGluIHRoZSBpbmNsdWRlLyBmb2xkZXIuCgpTaWduZWQtb2ZmLWJ5
OiBDbMOpbWVudCBMZSBHb2ZmaWMgPGNsZW1lbnQubGVnb2ZmaWNAZm9zcy5zdC5jb20+ClNpZ25l
ZC1vZmYtYnk6IENsw6ltZW50IExlIEdvZmZpYyA8bGVnb2ZmaWMuY2xlbWVudEBnbWFpbC5jb20+
Ci0tLQogZHJpdmVycy9idXMvc3RtMzJfZXR6cGMuYyAgICAgICAgICAgICAgICAgICAgICAgfCAz
ICstLQogZHJpdmVycy9idXMvc3RtMzJfZmlyZXdhbGwuYyAgICAgICAgICAgICAgICAgICAgfCAz
ICstLQogZHJpdmVycy9idXMvc3RtMzJfcmlmc2MuYyAgICAgICAgICAgICAgICAgICAgICAgfCAz
ICstLQoge2RyaXZlcnMgPT4gaW5jbHVkZS9saW51eH0vYnVzL3N0bTMyX2ZpcmV3YWxsLmggfCAw
CiA0IGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2J1cy9zdG0zMl9ldHpwYy5jIGIvZHJpdmVycy9idXMvc3RtMzJfZXR6
cGMuYwppbmRleCA3ZmMwZjE2OTYwYmUuLjQ5MThhMTRlNTA3ZSAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9idXMvc3RtMzJfZXR6cGMuYworKysgYi9kcml2ZXJzL2J1cy9zdG0zMl9ldHpwYy5jCkBAIC01
LDYgKzUsNyBAQAogCiAjaW5jbHVkZSA8bGludXgvYml0ZmllbGQuaD4KICNpbmNsdWRlIDxsaW51
eC9iaXRzLmg+CisjaW5jbHVkZSA8bGludXgvYnVzL3N0bTMyX2ZpcmV3YWxsLmg+CiAjaW5jbHVk
ZSA8bGludXgvZGV2aWNlLmg+CiAjaW5jbHVkZSA8bGludXgvZXJyLmg+CiAjaW5jbHVkZSA8bGlu
dXgvaW5pdC5oPgpAQCAtMTYsOCArMTcsNiBAQAogI2luY2x1ZGUgPGxpbnV4L3BsYXRmb3JtX2Rl
dmljZS5oPgogI2luY2x1ZGUgPGxpbnV4L3R5cGVzLmg+CiAKLSNpbmNsdWRlICJzdG0zMl9maXJl
d2FsbC5oIgotCiAvKgogICogRVRaUEMgcmVnaXN0ZXJzCiAgKi8KZGlmZiAtLWdpdCBhL2RyaXZl
cnMvYnVzL3N0bTMyX2ZpcmV3YWxsLmMgYi9kcml2ZXJzL2J1cy9zdG0zMl9maXJld2FsbC5jCmlu
ZGV4IDJmYzk3NjFkYWRlYy4uZWY0OTg4MDU0YjQ0IDEwMDY0NAotLS0gYS9kcml2ZXJzL2J1cy9z
dG0zMl9maXJld2FsbC5jCisrKyBiL2RyaXZlcnMvYnVzL3N0bTMyX2ZpcmV3YWxsLmMKQEAgLTUs
NiArNSw3IEBACiAKICNpbmNsdWRlIDxsaW51eC9iaXRmaWVsZC5oPgogI2luY2x1ZGUgPGxpbnV4
L2JpdHMuaD4KKyNpbmNsdWRlIDxsaW51eC9idXMvc3RtMzJfZmlyZXdhbGwuaD4KICNpbmNsdWRl
IDxsaW51eC9idXMvc3RtMzJfZmlyZXdhbGxfZGV2aWNlLmg+CiAjaW5jbHVkZSA8bGludXgvZGV2
aWNlLmg+CiAjaW5jbHVkZSA8bGludXgvZXJyLmg+CkBAIC0xOCw4ICsxOSw2IEBACiAjaW5jbHVk
ZSA8bGludXgvdHlwZXMuaD4KICNpbmNsdWRlIDxsaW51eC9zbGFiLmg+CiAKLSNpbmNsdWRlICJz
dG0zMl9maXJld2FsbC5oIgotCiAvKiBDb3JyZXNwb25kcyB0byBTVE0zMl9GSVJFV0FMTF9NQVhf
RVhUUkFfQVJHUyArIGZpcmV3YWxsIElEICovCiAjZGVmaW5lIFNUTTMyX0ZJUkVXQUxMX01BWF9B
UkdTCQkoU1RNMzJfRklSRVdBTExfTUFYX0VYVFJBX0FSR1MgKyAxKQogCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2J1cy9zdG0zMl9yaWZzYy5jIGIvZHJpdmVycy9idXMvc3RtMzJfcmlmc2MuYwppbmRl
eCA0Y2YxYjYwMDE0YjcuLjY0M2RkZDBhNWY1NCAxMDA2NDQKLS0tIGEvZHJpdmVycy9idXMvc3Rt
MzJfcmlmc2MuYworKysgYi9kcml2ZXJzL2J1cy9zdG0zMl9yaWZzYy5jCkBAIC01LDYgKzUsNyBA
QAogCiAjaW5jbHVkZSA8bGludXgvYml0ZmllbGQuaD4KICNpbmNsdWRlIDxsaW51eC9iaXRzLmg+
CisjaW5jbHVkZSA8bGludXgvYnVzL3N0bTMyX2ZpcmV3YWxsLmg+CiAjaW5jbHVkZSA8bGludXgv
ZGV2aWNlLmg+CiAjaW5jbHVkZSA8bGludXgvZXJyLmg+CiAjaW5jbHVkZSA8bGludXgvaW5pdC5o
PgpAQCAtMTYsOCArMTcsNiBAQAogI2luY2x1ZGUgPGxpbnV4L3BsYXRmb3JtX2RldmljZS5oPgog
I2luY2x1ZGUgPGxpbnV4L3R5cGVzLmg+CiAKLSNpbmNsdWRlICJzdG0zMl9maXJld2FsbC5oIgot
CiAvKgogICogUklGU0Mgb2Zmc2V0IHJlZ2lzdGVyCiAgKi8KZGlmZiAtLWdpdCBhL2RyaXZlcnMv
YnVzL3N0bTMyX2ZpcmV3YWxsLmggYi9pbmNsdWRlL2xpbnV4L2J1cy9zdG0zMl9maXJld2FsbC5o
CnNpbWlsYXJpdHkgaW5kZXggMTAwJQpyZW5hbWUgZnJvbSBkcml2ZXJzL2J1cy9zdG0zMl9maXJl
d2FsbC5oCnJlbmFtZSB0byBpbmNsdWRlL2xpbnV4L2J1cy9zdG0zMl9maXJld2FsbC5oCgotLSAK
Mi40My4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJl
cGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0
aW5mby9saW51eC1zdG0zMgo=
