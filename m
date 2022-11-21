Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BDE4631A9C
	for <lists+linux-stm32@lfdr.de>; Mon, 21 Nov 2022 08:49:14 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2D661C65E53;
	Mon, 21 Nov 2022 07:49:14 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DB3A3C0D2C0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Nov 2022 01:55:10 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id me22so8764407ejb.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 20 Nov 2022 17:55:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bc4Y4SAIFoFn8jPAI1hxh2Ksk+Zr6EYx6OygiPrKgco=;
 b=2U6M1hW2z1IDf9Pi6vhVLi2hcgjGP1H9Xc9hMTZxCCXDju+bFv13kSmaSIR8KgK0gq
 QX6WhTSHFOM919dhLRz/wKu2VG17p7OD8DoD0A2TQBnZtku1Iw7EFdxhhtnn7zkTGhJU
 wCrsUa/VnPXIkDJ932h39+yAy56eHjO3/RutNrdkoJSl40asovIpPyM2Q0szxSDs32zo
 nbaE25+PHY+cJyOKSNSHtm9+jprVsa0iV1jhz+C1X4aOYmgGwFxWdguU+B5zKzb2SKtj
 PweNV5ANsuBva3Pw27HJofSYx1qQex/bqn7zimo6BBHw0TfwIk/+cKRgTPLImMcVfVvJ
 MOJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bc4Y4SAIFoFn8jPAI1hxh2Ksk+Zr6EYx6OygiPrKgco=;
 b=ss18QLTNQLSY2oN81XYgk3xWkVymvRL2swANtm20edIrIA4CFRUzYpxRDdfLwM/POC
 SJCzsBk0qfMzHE4sXBX/CMSZ5NI2DXfz+1oxuu/EeDb0htBKiJf80KCdmaPTk8haVHP/
 TSeBe19hOEFWqhxBeJIKowisN5O1Z4Ps8akgwh3ppSdZ8stE6i6HeIknpHam8IlZK0g0
 RKQCQpOmIYMVlhgNOGaRxbZYaL3yHZET7h43g0BtYQEEM+pqF+4LJcrNct/i2uQYZ32E
 x0lTCohcAtd/UN3BRbEl1OrgCebPpmtwrTlNY9YzqNvv0VmiTE1f90RaITv6STCdU2s7
 a9+w==
X-Gm-Message-State: ANoB5pm8TZyzHEfMPFof5MU3FqLswEGr4CwUpIpecMHL8SafR7EW4egq
 Vl0fMNoMcVCALSwoVEkIG1uJYA==
X-Google-Smtp-Source: AA0mqf6HbQ2JREY6+R1bij4vZP84OeYrnYzMw1GJ9Yd6OfCk6AgctzLAKVQwFVS8h2k0lKKVkxo5BA==
X-Received: by 2002:a17:907:d092:b0:7ad:7e85:8056 with SMTP id
 vc18-20020a170907d09200b007ad7e858056mr13505975ejc.40.1668995710662; 
 Sun, 20 Nov 2022 17:55:10 -0800 (PST)
Received: from c64.fritz.box ([2a01:2a8:8108:8301:7643:bec8:f62b:b074])
 by smtp.gmail.com with ESMTPSA id
 g2-20020a170906538200b00782e3cf7277sm4415513ejo.120.2022.11.20.17.55.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Nov 2022 17:55:10 -0800 (PST)
From: =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>
To: devicetree@vger.kernel.org
Date: Mon, 21 Nov 2022 02:54:47 +0100
Message-Id: <20221121015451.2471196-6-bero@baylibre.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221121015451.2471196-1-bero@baylibre.com>
References: <20221121015451.2471196-1-bero@baylibre.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 21 Nov 2022 07:49:11 +0000
Cc: khilman@baylibre.com, krzysztof.kozlowski@linaro.org,
 linux-mediatek@lists.infradead.org, mcoquelin.stm32@gmail.com,
 matthias.bgg@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 5/9] arm64: dts: mediatek: Remove
	pins-are-numbered property
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

UmVtb3ZlIHRoZSB1bm5lY2Vzc2FyeSBwaW5zLWFyZS1udW1iZXJlZCBwcm9wZXJ0eSBmcm9tCmFy
bTY0IE1lZGlhdGVrIERldmljZVRyZWVzCgpTaWduZWQtb2ZmLWJ5OiBCZXJuaGFyZCBSb3Nlbmty
w6RuemVyIDxiZXJvQGJheWxpYnJlLmNvbT4KLS0tCiBhcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlh
dGVrL210MjcxMmUuZHRzaSAgICB8IDEgLQogYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9t
dDgxNjcuZHRzaSAgICAgfCAxIC0KIGFyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4MTcz
LWVsbS5kdHNpIHwgMSAtCiBhcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODE3My5kdHNp
ICAgICB8IDEgLQogYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDg1MTYuZHRzaSAgICAg
fCAxIC0KIDUgZmlsZXMgY2hhbmdlZCwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNo
L2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210MjcxMmUuZHRzaSBiL2FyY2gvYXJtNjQvYm9vdC9k
dHMvbWVkaWF0ZWsvbXQyNzEyZS5kdHNpCmluZGV4IDlkYzA3OTRmY2QyZTYuLmFjZThlNzUxYzhl
YTQgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQyNzEyZS5kdHNp
CisrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQyNzEyZS5kdHNpCkBAIC0yNzAs
NyArMjcwLDYgQEAgcGlvOiBwaW5jdHJsQDEwMDA1MDAwIHsKIAkJY29tcGF0aWJsZSA9ICJtZWRp
YXRlayxtdDI3MTItcGluY3RybCI7CiAJCXJlZyA9IDwwIDB4MTAwMGIwMDAgMCAweDEwMDA+Owog
CQltZWRpYXRlayxwY3RsLXJlZ21hcCA9IDwmc3lzY2ZnX3BjdGxfYT47Ci0JCXBpbnMtYXJlLW51
bWJlcmVkOwogCQlncGlvLWNvbnRyb2xsZXI7CiAJCSNncGlvLWNlbGxzID0gPDI+OwogCQlpbnRl
cnJ1cHQtY29udHJvbGxlcjsKZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0
ZWsvbXQ4MTY3LmR0c2kgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODE2Ny5kdHNp
CmluZGV4IGZiZTFhMTEyOGNjNmEuLjZhNTQzMTVjZjY1MDIgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJt
NjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4MTY3LmR0c2kKKysrIGIvYXJjaC9hcm02NC9ib290L2R0
cy9tZWRpYXRlay9tdDgxNjcuZHRzaQpAQCAtMTE3LDcgKzExNyw2IEBAIHBpbzogcGluY3RybEAx
MDAwYjAwMCB7CiAJCQljb21wYXRpYmxlID0gIm1lZGlhdGVrLG10ODE2Ny1waW5jdHJsIjsKIAkJ
CXJlZyA9IDwwIDB4MTAwMGIwMDAgMCAweDEwMDA+OwogCQkJbWVkaWF0ZWsscGN0bC1yZWdtYXAg
PSA8JnN5c2NmZ19wY3RsPjsKLQkJCXBpbnMtYXJlLW51bWJlcmVkOwogCQkJZ3Bpby1jb250cm9s
bGVyOwogCQkJI2dwaW8tY2VsbHMgPSA8Mj47CiAJCQlpbnRlcnJ1cHQtY29udHJvbGxlcjsKZGlm
ZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4MTczLWVsbS5kdHNpIGIv
YXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgxNzMtZWxtLmR0c2kKaW5kZXggZTIxZmVi
ODVkODIyYi4uMThlMjE0NDY0YTJkMyAxMDA2NDQKLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9t
ZWRpYXRlay9tdDgxNzMtZWxtLmR0c2kKKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRl
ay9tdDgxNzMtZWxtLmR0c2kKQEAgLTkyOSw3ICs5MjksNiBAQCBjbG9jazogbXQ2Mzk3Y2xvY2sg
ewogCiAJCXBpbzYzOTc6IHBpbmN0cmwgewogCQkJY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDYz
OTctcGluY3RybCI7Ci0JCQlwaW5zLWFyZS1udW1iZXJlZDsKIAkJCWdwaW8tY29udHJvbGxlcjsK
IAkJCSNncGlvLWNlbGxzID0gPDI+OwogCQl9OwpkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290
L2R0cy9tZWRpYXRlay9tdDgxNzMuZHRzaSBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsv
bXQ4MTczLmR0c2kKaW5kZXggNzY0MGI1MTU4ZmY5ZC4uYzQ3ZDdkOTAwZjI4MyAxMDA2NDQKLS0t
IGEvYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgxNzMuZHRzaQorKysgYi9hcmNoL2Fy
bTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODE3My5kdHNpCkBAIC0zNzUsNyArMzc1LDYgQEAgcGlv
OiBwaW5jdHJsQDEwMDBiMDAwIHsKIAkJCWNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ4MTczLXBp
bmN0cmwiOwogCQkJcmVnID0gPDAgMHgxMDAwYjAwMCAwIDB4MTAwMD47CiAJCQltZWRpYXRlayxw
Y3RsLXJlZ21hcCA9IDwmc3lzY2ZnX3BjdGxfYT47Ci0JCQlwaW5zLWFyZS1udW1iZXJlZDsKIAkJ
CWdwaW8tY29udHJvbGxlcjsKIAkJCSNncGlvLWNlbGxzID0gPDI+OwogCQkJaW50ZXJydXB0LWNv
bnRyb2xsZXI7CmRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODUx
Ni5kdHNpIGIvYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDg1MTYuZHRzaQppbmRleCBk
MWI2N2M4MmQ3NjE3Li4xMTgwMjUyNjNhMjliIDEwMDY0NAotLS0gYS9hcmNoL2FybTY0L2Jvb3Qv
ZHRzL21lZGlhdGVrL210ODUxNi5kdHNpCisrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0
ZWsvbXQ4NTE2LmR0c2kKQEAgLTIyOSw3ICsyMjksNiBAQCBwaW86IHBpbmN0cmxAMTAwMGIwMDAg
ewogCQkJY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDg1MTYtcGluY3RybCI7CiAJCQlyZWcgPSA8
MCAweDEwMDBiMDAwIDAgMHgxMDAwPjsKIAkJCW1lZGlhdGVrLHBjdGwtcmVnbWFwID0gPCZzeXNj
ZmdfcGN0bD47Ci0JCQlwaW5zLWFyZS1udW1iZXJlZDsKIAkJCWdwaW8tY29udHJvbGxlcjsKIAkJ
CSNncGlvLWNlbGxzID0gPDI+OwogCQkJaW50ZXJydXB0LWNvbnRyb2xsZXI7Ci0tIAoyLjM4LjEK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0
bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29t
Cmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXN0bTMyCg==
