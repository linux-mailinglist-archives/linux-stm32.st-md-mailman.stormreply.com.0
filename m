Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 99840631A9E
	for <lists+linux-stm32@lfdr.de>; Mon, 21 Nov 2022 08:49:14 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5B1BFC65E5A;
	Mon, 21 Nov 2022 07:49:14 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D0B33C65052
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Nov 2022 01:55:12 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id e13so14289559edj.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 20 Nov 2022 17:55:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pVZ6+cmK/ek0Z/OEVG5B02bFoCV8UTRj8V3VuqIql3A=;
 b=UrZTAU9DJ91/ITNl8HBksYIBkH6PPckbtPpV792SFacfk+4D8+k2NXH2+EUpJNmgLi
 uDsKe6l9kRIqsecIWROxsPAn+MfQLVtFsp7YUd+k+o8hRng3lFTFNlzQO3TDzVFPr6aK
 4JnEprNBokf9bp0dZfv1CnX9xkkoIHKgUHO6PlR67nKmOhK9h5pi3Rz4eZtPMQOASyBz
 Puo2UHqRbwkcXmHQBQ2OvWiZrv62489icvqDBSDMdem+E5/2blNL0Ru9jBPIbIiaiaj2
 1KzAh7krletOJP/ZBL+mgysaqbQ25eUdXSU8boWzASinkoju6TZuDIEl93CNeMeN1CQV
 ylpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pVZ6+cmK/ek0Z/OEVG5B02bFoCV8UTRj8V3VuqIql3A=;
 b=hcscrX01JZuFcNp/YbmmWyDJNcAQQdiOK3nqstxylwitFb2TBQHIXtXQgY4lyotENe
 NA6lgVjXU9Y5KxVRKvh92VzsxAd1qMbzaceNZRuwMyWGWRI1NKHEAMQHwVy4nglZMShC
 +P4wKIX5KrAQi8/YRe+/TbRSPiO2skQFOvBgOb2ivwCs5JFB8Jbsl+MpufqosE4QC4Wt
 w9d5J9DMKqe9rTZyYSqiWUBa6D54DtawT9wxLkIbf+dsiDKkmWctao5OxTQeZdWZkcm1
 djCRbCrxSi/3kuTPKkxOkF/kX/jombSWNnTtFIqxmGKFOWjKS3zXw5PHnUH6So13xvNH
 z6IA==
X-Gm-Message-State: ANoB5pkl6AV88DveYL+AeowD1Hbt4w3RpytQAzjeY+w4XtkxJYp3jpxK
 6errqjeGu8GC4Erp4sF9tsfSZQ==
X-Google-Smtp-Source: AA0mqf6N+HSBBDHGUKvlzZE7JOxzEzxy5+r1AOj/V71TY0IIoaheXBi34rQqarLYme7K/40AR6Argw==
X-Received: by 2002:a05:6402:2925:b0:461:d2ab:3e05 with SMTP id
 ee37-20020a056402292500b00461d2ab3e05mr13768801edb.286.1668995712524; 
 Sun, 20 Nov 2022 17:55:12 -0800 (PST)
Received: from c64.fritz.box ([2a01:2a8:8108:8301:7643:bec8:f62b:b074])
 by smtp.gmail.com with ESMTPSA id
 g2-20020a170906538200b00782e3cf7277sm4415513ejo.120.2022.11.20.17.55.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Nov 2022 17:55:12 -0800 (PST)
From: =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>
To: devicetree@vger.kernel.org
Date: Mon, 21 Nov 2022 02:54:49 +0100
Message-Id: <20221121015451.2471196-8-bero@baylibre.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221121015451.2471196-1-bero@baylibre.com>
References: <20221121015451.2471196-1-bero@baylibre.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 21 Nov 2022 07:49:11 +0000
Cc: khilman@baylibre.com, krzysztof.kozlowski@linaro.org,
 linux-mediatek@lists.infradead.org, mcoquelin.stm32@gmail.com,
 matthias.bgg@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 7/9] ARM: dts: stm32: Remove the
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
