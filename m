Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 33B50B591B9
	for <lists+linux-stm32@lfdr.de>; Tue, 16 Sep 2025 11:07:20 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 572C2C32EB5;
	Tue, 16 Sep 2025 09:07:19 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 865D1C32EB0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Sep 2025 09:07:18 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-45df7dc1b98so35369075e9.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Sep 2025 02:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758013638; x=1758618438;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=y2sIITgEDWZdcO/sXZ85Mvn3hZAdFIIPOJDbEun6R/M=;
 b=ljAWBIK+Bj3lA5F6vnRAfN9IR4R3KUXNlAYdLgwurt6+vRgebXxiTAazRCF6J/UXpG
 rp3HMS5k0PmtDIzhPku7n+CmPWmU9aalelVYbIL7Sfg4My/Ixa4USAveIJ52qjn03o+s
 B0pCg7g/qpAtbHIfmcOFlriciW+vYCnmlHG1YivOKy2Fy7WQHMhDWlraD8T8CQcvJrkD
 dStoNs02FXQD129cBWcXSyAFfJqmfv0Y3nbbKsOEGo5BUdWTXqA67wBCeZjMmU6LJnEr
 bqSA3siAmnsh8m0U3bUIJ3kN+J9UgSgk0EwN8bZAw6S7O7n5yjo+v8XxFzI2BUPXTn1T
 tUtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758013638; x=1758618438;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=y2sIITgEDWZdcO/sXZ85Mvn3hZAdFIIPOJDbEun6R/M=;
 b=ScglnI/USQoQZRuk7Di627NLsmX0i0otzH1KHzpdYvGN9OsEHi6c7DTtTlfOY4YK3l
 LgCR76rQmgvsRfh5iHZl0429iFqCEQ/ztBJy1iknhSHg3iDS+cMtsPd3AYfALEL9Ga87
 vYoQ9aj8TTsoavgkYHpufv8jsOCag42SNP57VyueRVXTM1i4tOws3FA8Qkzn8poz2eyd
 xyTi46ttsLbHdYRA/+7XK7FceZudnhPE9l77VPdWssWSglgowKQVu1UuDfOG+epLBKLB
 1EwZrYz25syWw71CFeJSf3FLAyF7C4eUq4qAk744Mk+Oe1YdCvz/w4a0jTeFuACGXiKA
 dL2g==
X-Gm-Message-State: AOJu0YzQHMD7DGsb4bCWfNrgYLYBJ0ui2kdbpvDiGbYBvviz8xd8E2V8
 JYLOJ8UBNliW/952MPkRI1cQqBnMCzIS0EH7FCZNbJIA3QkQsSuFrq3X
X-Gm-Gg: ASbGncsFzJKyygFCBTCthuiHP58qD76WQ4f71hXmE2pHaSBb10C4wdm0QEKeLHt76vP
 3UGAZvqrMBDawFj/7wFYA2Zu8t0MvCmLaMaW/rrDURt4Q0sv/LZv76LqrWZd/noBA1r4IGhzW+X
 FYdJNpRTej6nwhAezr/5EV2vSO0/aoy+u9nMlWCWmBQ0RyJPA4GiJKxKsuo8WLGUytu3vijfoXy
 2w3U16YugJw3W03JsrideS8bAc60QrqWdk8ybKZyH4ELqi/E/Wgb3dAttM4l1tnf8EhtEhVAirh
 VIBP/CjDxJ3TMj/t1xiiJdh8mb8TzE4lSKA3azQnCaV7DtxOI4/okjA5WB259NURPpfXoj8HM/i
 D8rn9JIsIS/EApbOJWDGHuHUvnxoJSuKPNQzCQyh4KLgBHB98i67WLRIhOlHpyFx55ashQWaOPH
 hVNijaP5FTjJw1ofKkSy3iLHOIBqU=
X-Google-Smtp-Source: AGHT+IEuR5WQEBjj4/xvD5G9A1WwnGivKz0/sMVmdKU1XiTsdSofMByYMjzCbnjKIX3aOCcY/494jg==
X-Received: by 2002:a05:600c:1992:b0:456:fc1:c26d with SMTP id
 5b1f17b1804b1-45f211c8437mr129293605e9.2.1758013637683; 
 Tue, 16 Sep 2025 02:07:17 -0700 (PDT)
Received: from localhost (2a02-8440-7509-4cd6-9055-f88b-940e-15eb.rev.sfr.net.
 [2a02:8440:7509:4cd6:9055:f88b:940e:15eb])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45f32081248sm15568305e9.0.2025.09.16.02.07.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Sep 2025 02:07:17 -0700 (PDT)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
Date: Tue, 16 Sep 2025 11:07:10 +0200
MIME-Version: 1.0
Message-Id: <20250916-b4-firewall-upstream-v7-1-6038cf1e61d8@gmail.com>
X-B4-Tracking: v=1; b=H4sIAL0oyWgC/x3MSQqAMAxA0atI1ga0WK1eRVxUTTXgROoE4t0tL
 t/i/wc8CZOHKnpA6GTP6xJQxBF0o10GQu6DQSVKJ2WaY5uhY6HLThMem9+F7Iy9I6ONsSp1BkK
 6CTm+/23dvO8HXeR4NGYAAAA=
X-Change-ID: 20250916-b4-firewall-upstream-dfe8588a21f8
To: Gatien Chevallier <gatien.chevallier@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.15-dev-dfb17
Cc: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>,
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH v7] bus: firewall: move stm32_firewall header
 file in include folder
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
Ci0tLQpUaGlzIHY3IGlzIGEgc3Vic2V0IG9mIHRoZSB2NiBhbmQgb3RoZXIgcHJpb3IgdmVyc2lv
bnMsIHNwbGl0ZWQgdG8gc2ltcGxpZnkKdGhlIHJldmlldyBhbmQgbWVyZ2luZyBwcm9jZXNzLgoK
Q2hhbmdlcyBpbiB2NzoKLSBOb25lCi0gTGluayB0byB2NjogaHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvYWxsLzIwMjUwOTA5LWI0LWRkcnBlcmZtLXVwc3RyZWFtLXY2LTEtY2UwODJjYzgwMWI1QGdt
YWlsLmNvbS8KLS0tCiBkcml2ZXJzL2J1cy9zdG0zMl9ldHpwYy5jICAgICAgICAgICAgICAgICAg
ICAgICB8IDMgKy0tCiBkcml2ZXJzL2J1cy9zdG0zMl9maXJld2FsbC5jICAgICAgICAgICAgICAg
ICAgICB8IDMgKy0tCiBkcml2ZXJzL2J1cy9zdG0zMl9yaWZzYy5jICAgICAgICAgICAgICAgICAg
ICAgICB8IDMgKy0tCiB7ZHJpdmVycyA9PiBpbmNsdWRlL2xpbnV4fS9idXMvc3RtMzJfZmlyZXdh
bGwuaCB8IDAKIDQgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvYnVzL3N0bTMyX2V0enBjLmMgYi9kcml2ZXJzL2J1cy9z
dG0zMl9ldHpwYy5jCmluZGV4IDdmYzBmMTY5NjBiZS4uNDkxOGExNGU1MDdlIDEwMDY0NAotLS0g
YS9kcml2ZXJzL2J1cy9zdG0zMl9ldHpwYy5jCisrKyBiL2RyaXZlcnMvYnVzL3N0bTMyX2V0enBj
LmMKQEAgLTUsNiArNSw3IEBACiAKICNpbmNsdWRlIDxsaW51eC9iaXRmaWVsZC5oPgogI2luY2x1
ZGUgPGxpbnV4L2JpdHMuaD4KKyNpbmNsdWRlIDxsaW51eC9idXMvc3RtMzJfZmlyZXdhbGwuaD4K
ICNpbmNsdWRlIDxsaW51eC9kZXZpY2UuaD4KICNpbmNsdWRlIDxsaW51eC9lcnIuaD4KICNpbmNs
dWRlIDxsaW51eC9pbml0Lmg+CkBAIC0xNiw4ICsxNyw2IEBACiAjaW5jbHVkZSA8bGludXgvcGxh
dGZvcm1fZGV2aWNlLmg+CiAjaW5jbHVkZSA8bGludXgvdHlwZXMuaD4KIAotI2luY2x1ZGUgInN0
bTMyX2ZpcmV3YWxsLmgiCi0KIC8qCiAgKiBFVFpQQyByZWdpc3RlcnMKICAqLwpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9idXMvc3RtMzJfZmlyZXdhbGwuYyBiL2RyaXZlcnMvYnVzL3N0bTMyX2ZpcmV3
YWxsLmMKaW5kZXggMmZjOTc2MWRhZGVjLi5lZjQ5ODgwNTRiNDQgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvYnVzL3N0bTMyX2ZpcmV3YWxsLmMKKysrIGIvZHJpdmVycy9idXMvc3RtMzJfZmlyZXdhbGwu
YwpAQCAtNSw2ICs1LDcgQEAKIAogI2luY2x1ZGUgPGxpbnV4L2JpdGZpZWxkLmg+CiAjaW5jbHVk
ZSA8bGludXgvYml0cy5oPgorI2luY2x1ZGUgPGxpbnV4L2J1cy9zdG0zMl9maXJld2FsbC5oPgog
I2luY2x1ZGUgPGxpbnV4L2J1cy9zdG0zMl9maXJld2FsbF9kZXZpY2UuaD4KICNpbmNsdWRlIDxs
aW51eC9kZXZpY2UuaD4KICNpbmNsdWRlIDxsaW51eC9lcnIuaD4KQEAgLTE4LDggKzE5LDYgQEAK
ICNpbmNsdWRlIDxsaW51eC90eXBlcy5oPgogI2luY2x1ZGUgPGxpbnV4L3NsYWIuaD4KIAotI2lu
Y2x1ZGUgInN0bTMyX2ZpcmV3YWxsLmgiCi0KIC8qIENvcnJlc3BvbmRzIHRvIFNUTTMyX0ZJUkVX
QUxMX01BWF9FWFRSQV9BUkdTICsgZmlyZXdhbGwgSUQgKi8KICNkZWZpbmUgU1RNMzJfRklSRVdB
TExfTUFYX0FSR1MJCShTVE0zMl9GSVJFV0FMTF9NQVhfRVhUUkFfQVJHUyArIDEpCiAKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvYnVzL3N0bTMyX3JpZnNjLmMgYi9kcml2ZXJzL2J1cy9zdG0zMl9yaWZz
Yy5jCmluZGV4IDRjZjFiNjAwMTRiNy4uNjQzZGRkMGE1ZjU0IDEwMDY0NAotLS0gYS9kcml2ZXJz
L2J1cy9zdG0zMl9yaWZzYy5jCisrKyBiL2RyaXZlcnMvYnVzL3N0bTMyX3JpZnNjLmMKQEAgLTUs
NiArNSw3IEBACiAKICNpbmNsdWRlIDxsaW51eC9iaXRmaWVsZC5oPgogI2luY2x1ZGUgPGxpbnV4
L2JpdHMuaD4KKyNpbmNsdWRlIDxsaW51eC9idXMvc3RtMzJfZmlyZXdhbGwuaD4KICNpbmNsdWRl
IDxsaW51eC9kZXZpY2UuaD4KICNpbmNsdWRlIDxsaW51eC9lcnIuaD4KICNpbmNsdWRlIDxsaW51
eC9pbml0Lmg+CkBAIC0xNiw4ICsxNyw2IEBACiAjaW5jbHVkZSA8bGludXgvcGxhdGZvcm1fZGV2
aWNlLmg+CiAjaW5jbHVkZSA8bGludXgvdHlwZXMuaD4KIAotI2luY2x1ZGUgInN0bTMyX2ZpcmV3
YWxsLmgiCi0KIC8qCiAgKiBSSUZTQyBvZmZzZXQgcmVnaXN0ZXIKICAqLwpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9idXMvc3RtMzJfZmlyZXdhbGwuaCBiL2luY2x1ZGUvbGludXgvYnVzL3N0bTMyX2Zp
cmV3YWxsLmgKc2ltaWxhcml0eSBpbmRleCAxMDAlCnJlbmFtZSBmcm9tIGRyaXZlcnMvYnVzL3N0
bTMyX2ZpcmV3YWxsLmgKcmVuYW1lIHRvIGluY2x1ZGUvbGludXgvYnVzL3N0bTMyX2ZpcmV3YWxs
LmgKCi0tLQpiYXNlLWNvbW1pdDogNDZhNTFmNGY1ZWRhZGU0M2JhNjZiM2MxNTFmMGUyNWVjOGI2
OWNiNgpjaGFuZ2UtaWQ6IDIwMjUwOTE2LWI0LWZpcmV3YWxsLXVwc3RyZWFtLWRmZTg1ODhhMjFm
OAoKQmVzdCByZWdhcmRzLAotLSAgCkNsw6ltZW50IExlIEdvZmZpYyA8bGVnb2ZmaWMuY2xlbWVu
dEBnbWFpbC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1h
bi9saXN0aW5mby9saW51eC1zdG0zMgo=
