Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CFBCB8F6D3
	for <lists+linux-stm32@lfdr.de>; Mon, 22 Sep 2025 10:12:34 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 51965C3F92E;
	Mon, 22 Sep 2025 08:12:34 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 56A20C3089E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Sep 2025 08:12:33 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-45f29e5e89bso49198585e9.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Sep 2025 01:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758528753; x=1759133553;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=LPzMl9444DyFsyhIlxZU2alp+KEUomV9x8N6sGCMpt4=;
 b=WVFbcNqlVx6QvZJt61csSLnO6SMsl/c5ptdNRIkaFnTOr+IsQtyluX73IIAYjtuk8Y
 KIpbBwqZa2TyxIxLyO+osmLAzPPER1EXJAQbjClo/O7AvBlZAo3pE7nzASAIMnpkqg8g
 lGMFkBY7Wl2+rYSJgG6YA34NrgoLU6RV5fAv3/B+pVyS8F0XyndspGBXFgqhSs+6iEsP
 Ra6loe+eVp2ifRtfpCuEg8vJEmUUiyWxNY/TJgC+8TIAolc1OLU9vI1NZU4GJo/7KSrs
 XYrj4URbM61AkOgkx7TaPuwvtf/1wbjUCHblv6C2HVTiUM2N/VyfFimAetdHIfqxbcJf
 zSZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758528753; x=1759133553;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LPzMl9444DyFsyhIlxZU2alp+KEUomV9x8N6sGCMpt4=;
 b=RFHs9VdUxt/bLUVUm5M6XkJ0KsTAZW22jJ63NGQptWq029yiVsbzYtCm0xGXl71tBX
 /Z38USbkIyqyTMq3ezzT3H5N5EdWJnwWcfA7JkNR6tfq+x2B2BCqnWV/4EdoGD2wirr+
 VivdTuVsebX/q0PeMVJVNYQahLFqn/MBkq+bwv8ivedmZRB5/xRn/nXUFQ7P2iCwqNin
 6YdAbs98DXgsui5l0sqMogojN1KX99MfPjYbN8LRZC1Wr+aRBeckXcvMUM1jkOo8FQZl
 xUv8knt4Qto+zwtNhDmsN3F5BrC8YRHIjr6WiQwCCiP0oWXncKA4d4YSky8L+hgB6Qad
 etgw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW5rkDrtRBQ6f8uKNMK3AT0s+mngQYu+flpcsvyTRYJmP927wCyEWf/OoOPf9OQQXp61TDyGP2g/ETqFw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwkonVINRHkkZuUQBn4yu8Pz/ZWEVrp93QuY1U5sQ4CaS3gamaR
 UL61ybOPrert4POJzSQD6AqPo47+l1qoqiR19OCUw00Ynx4ciSdEPSpOEllayg==
X-Gm-Gg: ASbGncu0ws/Z/RFZQVlCbJwS7LBzCfpv/7+dAQcoPlRxXyBum7c1eLGhWtwhcummEII
 onpGOZcJ36SN/SHiy/nmH6hTNWbIirsLmsOcxMB9RECPpq/cAlQ9l8mz+KvO3eHVohqPUQ+Kb2f
 1Cz9gZGg0cYxFsAid9RSGs7ztOYiDzAFabGpm1mNjtDLF7YBd5OPxBud7KJo1skwBW1YDZwD5Hl
 JBDOsbzSGUf8iuMkULUxD9zpo0kUKPiLf71P2VP9eRlri9m3DxvmF/enK5Pyb68jPUiuVaTPvIg
 Hi/Gf1CV9HhmIWEybfxLkDz6kY2XSkQlBAmnBQZmwI+98vwuJ4bOrv3lVKk5AOoGIiM+VnD73+1
 cfn2DqhgUkZkQKqsaUTrLm4KBWvWp+H9T+Lf0ffiZY/KJditUqNrOSF3OrpT93iA27p58bUVoAG
 iOLMijxic1hMCgzwa3
X-Google-Smtp-Source: AGHT+IHErk/g/+nIENyJ6+q+pyXV8qOgYAZOyjvomg2ntIsCHA25Lz454iGFXy1dqVhhd2gwP8RBKA==
X-Received: by 2002:a05:600c:4ecf:b0:45d:cfc6:5166 with SMTP id
 5b1f17b1804b1-467ea89db1bmr112950935e9.23.1758528752582; 
 Mon, 22 Sep 2025 01:12:32 -0700 (PDT)
Received: from localhost (2a02-8440-750d-3377-171e-75f8-f2d4-2af8.rev.sfr.net.
 [2a02:8440:750d:3377:171e:75f8:f2d4:2af8])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3ee073f3d8csm17958416f8f.9.2025.09.22.01.12.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Sep 2025 01:12:32 -0700 (PDT)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
Date: Mon, 22 Sep 2025 10:12:19 +0200
MIME-Version: 1.0
Message-Id: <20250922-b4-rcc-upstream-v7-2-2dfc4e018f40@gmail.com>
References: <20250922-b4-rcc-upstream-v7-0-2dfc4e018f40@gmail.com>
In-Reply-To: <20250922-b4-rcc-upstream-v7-0-2dfc4e018f40@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>
X-Mailer: b4 0.15-dev-0dae4
Cc: devicetree@vger.kernel.org,
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v7 2/3] clk: stm32mp25: add firewall
	grant_access ops
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
T24gU1RNMzJNUDI1LCB0aGUgUkNDIHBlcmlwaGVyYWwgbWFuYWdlcyB0aGUgc2VjdXJlIGxldmVs
IG9mIHJlc291cmNlcwp0aGF0IGFyZSB1c2VkIGJ5IG90aGVyIGRldmljZXMgc3VjaCBhcyBjbG9j
a3MuCkRlY2xhcmUgdGhpcyBwZXJpcGhlcmFsIGFzIGEgZmlyZXdhbGwgY29udHJvbGxlci4KClNp
Z25lZC1vZmYtYnk6IENsw6ltZW50IExlIEdvZmZpYyA8Y2xlbWVudC5sZWdvZmZpY0Bmb3NzLnN0
LmNvbT4KU2lnbmVkLW9mZi1ieTogQ2zDqW1lbnQgTGUgR29mZmljIDxsZWdvZmZpYy5jbGVtZW50
QGdtYWlsLmNvbT4KLS0tCiBkcml2ZXJzL2Nsay9zdG0zMi9jbGstc3RtMzJtcDI1LmMgfCA0MCAr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCAz
OSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9jbGsv
c3RtMzIvY2xrLXN0bTMybXAyNS5jIGIvZHJpdmVycy9jbGsvc3RtMzIvY2xrLXN0bTMybXAyNS5j
CmluZGV4IDUyZjBlOGExMjkyNi4uYWY0YmMwNmQ3MDNhIDEwMDY0NAotLS0gYS9kcml2ZXJzL2Ns
ay9zdG0zMi9jbGstc3RtMzJtcDI1LmMKKysrIGIvZHJpdmVycy9jbGsvc3RtMzIvY2xrLXN0bTMy
bXAyNS5jCkBAIC00LDggKzQsMTAgQEAKICAqIEF1dGhvcjogR2FicmllbCBGZXJuYW5kZXogPGdh
YnJpZWwuZmVybmFuZGV6QGZvc3Muc3QuY29tPiBmb3IgU1RNaWNyb2VsZWN0cm9uaWNzLgogICov
CiAKKyNpbmNsdWRlIDxsaW51eC9idXMvc3RtMzJfZmlyZXdhbGwuaD4KICNpbmNsdWRlIDxsaW51
eC9idXMvc3RtMzJfZmlyZXdhbGxfZGV2aWNlLmg+CiAjaW5jbHVkZSA8bGludXgvY2xrLXByb3Zp
ZGVyLmg+CisjaW5jbHVkZSA8bGludXgvZGV2aWNlLmg+CiAjaW5jbHVkZSA8bGludXgvaW8uaD4K
ICNpbmNsdWRlIDxsaW51eC9wbGF0Zm9ybV9kZXZpY2UuaD4KIApAQCAtMTYwMiw2ICsxNjA0LDEx
IEBAIHN0YXRpYyBpbnQgc3RtMzJfcmNjX2dldF9hY2Nlc3Modm9pZCBfX2lvbWVtICpiYXNlLCB1
MzIgaW5kZXgpCiAJcmV0dXJuIDA7CiB9CiAKK3N0YXRpYyBpbnQgc3RtMzJtcDI1X3JjY19ncmFu
dF9hY2Nlc3Moc3RydWN0IHN0bTMyX2ZpcmV3YWxsX2NvbnRyb2xsZXIgKmN0cmwsIHUzMiBmaXJl
d2FsbF9pZCkKK3sKKwlyZXR1cm4gc3RtMzJfcmNjX2dldF9hY2Nlc3MoY3RybC0+bW1pbywgZmly
ZXdhbGxfaWQpOworfQorCiBzdGF0aWMgaW50IHN0bTMybXAyNV9jaGVja19zZWN1cml0eShzdHJ1
Y3QgZGV2aWNlX25vZGUgKm5wLCB2b2lkIF9faW9tZW0gKmJhc2UsCiAJCQkJICAgIGNvbnN0IHN0
cnVjdCBjbG9ja19jb25maWcgKmNmZykKIHsKQEAgLTE5NzAsNiArMTk3Nyw3IEBAIE1PRFVMRV9E
RVZJQ0VfVEFCTEUob2YsIHN0bTMybXAyNV9tYXRjaF9kYXRhKTsKIAogc3RhdGljIGludCBzdG0z
Mm1wMjVfcmNjX2Nsb2Nrc19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogewor
CXN0cnVjdCBzdG0zMl9maXJld2FsbF9jb250cm9sbGVyICpyY2NfY29udHJvbGxlcjsKIAlzdHJ1
Y3QgZGV2aWNlICpkZXYgPSAmcGRldi0+ZGV2OwogCXZvaWQgX19pb21lbSAqYmFzZTsKIAlpbnQg
cmV0OwpAQCAtMTk4Miw3ICsxOTkwLDM2IEBAIHN0YXRpYyBpbnQgc3RtMzJtcDI1X3JjY19jbG9j
a3NfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAlpZiAocmV0KQogCQlyZXR1
cm4gcmV0OwogCi0JcmV0dXJuIHN0bTMyX3JjY19pbml0KGRldiwgc3RtMzJtcDI1X21hdGNoX2Rh
dGEsIGJhc2UpOworCXJldCA9IHN0bTMyX3JjY19pbml0KGRldiwgc3RtMzJtcDI1X21hdGNoX2Rh
dGEsIGJhc2UpOworCWlmIChyZXQpCisJCXJldHVybiByZXQ7CisKKwlyY2NfY29udHJvbGxlciA9
IGRldm1fa3phbGxvYygmcGRldi0+ZGV2LCBzaXplb2YoKnJjY19jb250cm9sbGVyKSwgR0ZQX0tF
Uk5FTCk7CisJaWYgKCFyY2NfY29udHJvbGxlcikKKwkJcmV0dXJuIC1FTk9NRU07CisKKwlyY2Nf
Y29udHJvbGxlci0+ZGV2ID0gZGV2OworCXJjY19jb250cm9sbGVyLT5tbWlvID0gYmFzZTsKKwly
Y2NfY29udHJvbGxlci0+bmFtZSA9IGRldl9kcml2ZXJfc3RyaW5nKGRldik7CisJcmNjX2NvbnRy
b2xsZXItPnR5cGUgPSBTVE0zMl9QRVJJUEhFUkFMX0ZJUkVXQUxMOworCXJjY19jb250cm9sbGVy
LT5ncmFudF9hY2Nlc3MgPSBzdG0zMm1wMjVfcmNjX2dyYW50X2FjY2VzczsKKworCXBsYXRmb3Jt
X3NldF9kcnZkYXRhKHBkZXYsIHJjY19jb250cm9sbGVyKTsKKworCXJldCA9IHN0bTMyX2ZpcmV3
YWxsX2NvbnRyb2xsZXJfcmVnaXN0ZXIocmNjX2NvbnRyb2xsZXIpOworCWlmIChyZXQpIHsKKwkJ
ZGV2X2VycihkZXYsICJDb3VsZG4ndCByZWdpc3RlciBhcyBhIGZpcmV3YWxsIGNvbnRyb2xsZXI6
ICVkXG4iLCByZXQpOworCQlyZXR1cm4gcmV0OworCX0KKworCXJldHVybiAwOworfQorCitzdGF0
aWMgdm9pZCBzdG0zMm1wMjVfcmNjX2Nsb2Nrc19yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2Rldmlj
ZSAqcGRldikKK3sKKwlzdHJ1Y3Qgc3RtMzJfZmlyZXdhbGxfY29udHJvbGxlciAqcmNjX2NvbnRy
b2xsZXIgPSBwbGF0Zm9ybV9nZXRfZHJ2ZGF0YShwZGV2KTsKKworCXN0bTMyX2ZpcmV3YWxsX2Nv
bnRyb2xsZXJfdW5yZWdpc3RlcihyY2NfY29udHJvbGxlcik7CiB9CiAKIHN0YXRpYyBzdHJ1Y3Qg
cGxhdGZvcm1fZHJpdmVyIHN0bTMybXAyNV9yY2NfY2xvY2tzX2RyaXZlciA9IHsKQEAgLTE5OTEs
NiArMjAyOCw3IEBAIHN0YXRpYyBzdHJ1Y3QgcGxhdGZvcm1fZHJpdmVyIHN0bTMybXAyNV9yY2Nf
Y2xvY2tzX2RyaXZlciA9IHsKIAkJLm9mX21hdGNoX3RhYmxlID0gc3RtMzJtcDI1X21hdGNoX2Rh
dGEsCiAJfSwKIAkucHJvYmUgPSBzdG0zMm1wMjVfcmNjX2Nsb2Nrc19wcm9iZSwKKwkucmVtb3Zl
ID0gc3RtMzJtcDI1X3JjY19jbG9ja3NfcmVtb3ZlLAogfTsKIAogc3RhdGljIGludCBfX2luaXQg
c3RtMzJtcDI1X2Nsb2Nrc19pbml0KHZvaWQpCgotLSAKMi40My4wCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QK
TGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1h
aWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
