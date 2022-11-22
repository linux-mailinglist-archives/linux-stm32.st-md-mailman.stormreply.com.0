Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A57896331E6
	for <lists+linux-stm32@lfdr.de>; Tue, 22 Nov 2022 02:08:18 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 669F3C65E44;
	Tue, 22 Nov 2022 01:08:18 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6088DC03FE0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Nov 2022 01:08:14 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id gv23so32381496ejb.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Nov 2022 17:08:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pVZ6+cmK/ek0Z/OEVG5B02bFoCV8UTRj8V3VuqIql3A=;
 b=7PU/zr3G+t8KUIvLexsH+u2860yRH86YCPctKi6jVpZSG9hKr2LozoPqCT7fp1IExo
 joSPMv6kkdUSMTdaZCnPHw3m8evHyxRsEDYj3/qxFmNd0A9KFH0rsN2PgyBuIih0iqUA
 6we61TpVhNxM7+aQXSP5/RNgxtlvO0Qu245bz/cuQBYWKdR9VNIYV25I5bBBNq/xSrVc
 BuYoER6H0JiFUAa815Nu9UiiQsIJ117Vr8396/HXMopJKy3S0DYWWrLtx5UBYNsFkU4R
 oDdP2/YMozV/5nG3e0N8e61TqipuSN3ioLPxbu8JiQoHxqnvjgSFKwxlGIWoJO6dN5mj
 xgAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pVZ6+cmK/ek0Z/OEVG5B02bFoCV8UTRj8V3VuqIql3A=;
 b=vIApCv1Nygj8eKseV8B1KnRXTDXyz/hg4sYrjUS2x9A2psRguyQHWqC5kYLrqW1+ih
 Dird4mQI/wm8b+RBoM70SOvaos6su/ZuZ0cAv1/6aHftD6swZN4s4wsrpmOOwk1Yr1dr
 xWFB8vPhFa6gkWABxnJs/ZnOHvSNTRzX590pk6Jh6oKydCM6mANS6MN2zFLchoZ2/+t0
 TMv1ar+K5YI8Hr6YL8C/StXCLveknq+SQbEUJkdCSvlzC+80WlEza+AjJZOvTWk18Zgj
 eaHOHaVFuPv2N9njcp6J9sChbSiomlBCeCVQiUfnOvKUwuTPZyU7+NzUtkz2pI7ZjO7K
 jR8Q==
X-Gm-Message-State: ANoB5pmm9jFjua8VQZsofQwcpS4BQHyIFXVlg8SWE9VwmMBPcZ83ewvE
 AUOvGIIK1QVss+zb3z5A4YCH3w==
X-Google-Smtp-Source: AA0mqf6Rscbb2Xk+Iw5+n43aJADKV4pLrXNsz2Omd130tyO43/THJlxoYpPQi8bWlXolQfLcDJw0kg==
X-Received: by 2002:a17:906:5055:b0:78d:cdce:bc52 with SMTP id
 e21-20020a170906505500b0078dcdcebc52mr1581398ejk.469.1669079294070; 
 Mon, 21 Nov 2022 17:08:14 -0800 (PST)
Received: from c64.fritz.box ([2a01:2a8:8108:8301:7643:bec8:f62b:b074])
 by smtp.gmail.com with ESMTPSA id
 f13-20020a1709064dcd00b007030c97ae62sm5514683ejw.191.2022.11.21.17.08.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Nov 2022 17:08:13 -0800 (PST)
From: =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>
To: devicetree@vger.kernel.org
Date: Tue, 22 Nov 2022 02:07:53 +0100
Message-Id: <20221122010753.3126828-8-bero@baylibre.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221122010753.3126828-1-bero@baylibre.com>
References: <20221122010753.3126828-1-bero@baylibre.com>
MIME-Version: 1.0
Cc: khilman@baylibre.com, linux-kernel@vger.kernel.org,
 krzysztof.kozlowski@linaro.org, linux-mediatek@lists.infradead.org,
 mcoquelin.stm32@gmail.com, matthias.bgg@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com
Subject: [Linux-stm32] [PATCH v2 7/7] ARM: dts: stm32: Remove the
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

UmVtb3ZlIHRoZSBwaW5zLWFyZS1udW1iZXJlZCBwcm9wZXJ0eSBmcm9tIFNUTTMyIERldmljZVRy
ZWVzCgpTaWduZWQtb2ZmLWJ5OiBCZXJuaGFyZCBSb3Nlbmtyw6RuemVyIDxiZXJvQGJheWxpYnJl
LmNvbT4KLS0tCiBhcmNoL2FybS9ib290L2R0cy9zdG0zMmY0LXBpbmN0cmwuZHRzaSB8IDEgLQog
YXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJmNy1waW5jdHJsLmR0c2kgfCAxIC0KIGFyY2gvYXJtL2Jv
b3QvZHRzL3N0bTMyaDc0My5kdHNpICAgICAgIHwgMSAtCiBhcmNoL2FybS9ib290L2R0cy9zdG0z
Mm1wMTMxLmR0c2kgICAgICB8IDEgLQogYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJtcDE1MS5kdHNp
ICAgICAgfCAyIC0tCiA1IGZpbGVzIGNoYW5nZWQsIDYgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0
IGEvYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJmNC1waW5jdHJsLmR0c2kgYi9hcmNoL2FybS9ib290
L2R0cy9zdG0zMmY0LXBpbmN0cmwuZHRzaQppbmRleCA1MDBiY2MzMDJkNDIyLi40NTIzYzYzNDc1
ZTRjIDEwMDY0NAotLS0gYS9hcmNoL2FybS9ib290L2R0cy9zdG0zMmY0LXBpbmN0cmwuZHRzaQor
KysgYi9hcmNoL2FybS9ib290L2R0cy9zdG0zMmY0LXBpbmN0cmwuZHRzaQpAQCAtNTEsNyArNTEs
NiBAQCBwaW5jdHJsOiBwaW5jdHJsQDQwMDIwMDAwIHsKIAkJCXJhbmdlcyA9IDwwIDB4NDAwMjAw
MDAgMHgzMDAwPjsKIAkJCWludGVycnVwdC1wYXJlbnQgPSA8JmV4dGk+OwogCQkJc3Qsc3lzY2Zn
ID0gPCZzeXNjZmcgMHg4PjsKLQkJCXBpbnMtYXJlLW51bWJlcmVkOwogCiAJCQlncGlvYTogZ3Bp
b0A0MDAyMDAwMCB7CiAJCQkJZ3Bpby1jb250cm9sbGVyOwpkaWZmIC0tZ2l0IGEvYXJjaC9hcm0v
Ym9vdC9kdHMvc3RtMzJmNy1waW5jdHJsLmR0c2kgYi9hcmNoL2FybS9ib290L2R0cy9zdG0zMmY3
LXBpbmN0cmwuZHRzaQppbmRleCA4ZjM3YWVmYTczMTUwLi5jOGU2YzUyZmIyNDhlIDEwMDY0NAot
LS0gYS9hcmNoL2FybS9ib290L2R0cy9zdG0zMmY3LXBpbmN0cmwuZHRzaQorKysgYi9hcmNoL2Fy
bS9ib290L2R0cy9zdG0zMmY3LXBpbmN0cmwuZHRzaQpAQCAtMTUsNyArMTUsNiBAQCBwaW5jdHJs
OiBwaW5jdHJsQDQwMDIwMDAwIHsKIAkJCXJhbmdlcyA9IDwwIDB4NDAwMjAwMDAgMHgzMDAwPjsK
IAkJCWludGVycnVwdC1wYXJlbnQgPSA8JmV4dGk+OwogCQkJc3Qsc3lzY2ZnID0gPCZzeXNjZmcg
MHg4PjsKLQkJCXBpbnMtYXJlLW51bWJlcmVkOwogCiAJCQlncGlvYTogZ3Bpb0A0MDAyMDAwMCB7
CiAJCQkJZ3Bpby1jb250cm9sbGVyOwpkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vYm9vdC9kdHMvc3Rt
MzJoNzQzLmR0c2kgYi9hcmNoL2FybS9ib290L2R0cy9zdG0zMmg3NDMuZHRzaQppbmRleCAyOGUz
ZGViMjBlMWUxLi5mMzA3OTZmN2FkZjM2IDEwMDY0NAotLS0gYS9hcmNoL2FybS9ib290L2R0cy9z
dG0zMmg3NDMuZHRzaQorKysgYi9hcmNoL2FybS9ib290L2R0cy9zdG0zMmg3NDMuZHRzaQpAQCAt
NTg4LDcgKzU4OCw2IEBAIHBpbmN0cmw6IHBpbmN0cmxANTgwMjAwMDAgewogCQkJcmFuZ2VzID0g
PDAgMHg1ODAyMDAwMCAweDMwMDA+OwogCQkJaW50ZXJydXB0LXBhcmVudCA9IDwmZXh0aT47CiAJ
CQlzdCxzeXNjZmcgPSA8JnN5c2NmZyAweDg+OwotCQkJcGlucy1hcmUtbnVtYmVyZWQ7CiAKIAkJ
CWdwaW9hOiBncGlvQDU4MDIwMDAwIHsKIAkJCQlncGlvLWNvbnRyb2xsZXI7CmRpZmYgLS1naXQg
YS9hcmNoL2FybS9ib290L2R0cy9zdG0zMm1wMTMxLmR0c2kgYi9hcmNoL2FybS9ib290L2R0cy9z
dG0zMm1wMTMxLmR0c2kKaW5kZXggMmE5YjNhNWJiYTgzMC4uYWRhZWUwZjllMTI2MyAxMDA2NDQK
LS0tIGEvYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJtcDEzMS5kdHNpCisrKyBiL2FyY2gvYXJtL2Jv
b3QvZHRzL3N0bTMybXAxMzEuZHRzaQpAQCAtNTQ5LDcgKzU0OSw2IEBAIHBpbmN0cmw6IHBpbmN0
cmxANTAwMDIwMDAgewogCQkJcmFuZ2VzID0gPDAgMHg1MDAwMjAwMCAweDg0MDA+OwogCQkJaW50
ZXJydXB0LXBhcmVudCA9IDwmZXh0aT47CiAJCQlzdCxzeXNjZmcgPSA8JmV4dGkgMHg2MCAweGZm
PjsKLQkJCXBpbnMtYXJlLW51bWJlcmVkOwogCiAJCQlncGlvYTogZ3Bpb0A1MDAwMjAwMCB7CiAJ
CQkJZ3Bpby1jb250cm9sbGVyOwpkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJt
cDE1MS5kdHNpIGIvYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJtcDE1MS5kdHNpCmluZGV4IDU0OTFi
NmM0ZGVjMjAuLjRlNDM3ZDNmMmVkNjYgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtL2Jvb3QvZHRzL3N0
bTMybXAxNTEuZHRzaQorKysgYi9hcmNoL2FybS9ib290L2R0cy9zdG0zMm1wMTUxLmR0c2kKQEAg
LTE2NjAsNyArMTY2MCw2IEBAIHBpbmN0cmw6IHBpbmN0cmxANTAwMDIwMDAgewogCQkJcmFuZ2Vz
ID0gPDAgMHg1MDAwMjAwMCAweGE0MDA+OwogCQkJaW50ZXJydXB0LXBhcmVudCA9IDwmZXh0aT47
CiAJCQlzdCxzeXNjZmcgPSA8JmV4dGkgMHg2MCAweGZmPjsKLQkJCXBpbnMtYXJlLW51bWJlcmVk
OwogCiAJCQlncGlvYTogZ3Bpb0A1MDAwMjAwMCB7CiAJCQkJZ3Bpby1jb250cm9sbGVyOwpAQCAt
MTc4OSw3ICsxNzg4LDYgQEAgcGluY3RybF96OiBwaW5jdHJsQDU0MDA0MDAwIHsKIAkJCSNzaXpl
LWNlbGxzID0gPDE+OwogCQkJY29tcGF0aWJsZSA9ICJzdCxzdG0zMm1wMTU3LXotcGluY3RybCI7
CiAJCQlyYW5nZXMgPSA8MCAweDU0MDA0MDAwIDB4NDAwPjsKLQkJCXBpbnMtYXJlLW51bWJlcmVk
OwogCQkJaW50ZXJydXB0LXBhcmVudCA9IDwmZXh0aT47CiAJCQlzdCxzeXNjZmcgPSA8JmV4dGkg
MHg2MCAweGZmPjsKIAotLSAKMi4zOC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3Qt
bWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBs
eS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
