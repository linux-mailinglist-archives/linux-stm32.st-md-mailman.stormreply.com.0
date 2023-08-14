Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CE5377B9F6
	for <lists+linux-stm32@lfdr.de>; Mon, 14 Aug 2023 15:28:53 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 66315C6B478;
	Mon, 14 Aug 2023 13:28:53 +0000 (UTC)
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
 [209.85.208.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8A902C6B472
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 14 Aug 2023 13:28:52 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id
 38308e7fff4ca-2b9cbaee7a9so67153211fa.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 14 Aug 2023 06:28:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1692019732; x=1692624532;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1Cnwn24kWjSS9OZzuaLMB+FQOsa9xOiEu2l5Cypy8oM=;
 b=Ha0Lm/5JdJ+EloMPJUOSpXMRWOPusaImnP7V/U5+8tMTS1ERCl75AHL7jpF4TCk2AH
 eNHzuPSNiU6sD4pknfspH08DiANuJzxXyAqQwA7OidU/U1EO6dqy78zMXcZosmBWTtw3
 tgc0SrYZDE6uKdIHejhn/Sp/PvAgQ2hgylhZ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692019732; x=1692624532;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1Cnwn24kWjSS9OZzuaLMB+FQOsa9xOiEu2l5Cypy8oM=;
 b=R4jOYeXhLK4hb+oZjaqju1+BA1kJkxwQXwzLQF+79pEHnDMzlv5EslPD4R4cwyBz0/
 XHOVGd66PSgYKSJD20W6z//tqqxCpTE+Om2O5PYCXhMVjqJVITcdMjJCv0RoLoSIFFXh
 UG8+Aesxg6l6uboCAOwYM9c2hggDTCUP2zuG9tfwtWQO/YF14Ugy3XfpD/J/QKJ1EQKS
 uccidgi+yJc7jm5Qaff4olPXJ3QEpF9GPqOR/bzfdic/x0M2kdes5aeFloSvs7MSl2Ne
 y4un+avCAp612Fu+JHUYkyoyHOs2jT7/ana0rnLFpZisBb36SsK3AB3C7xPVMlwsTs07
 7DWA==
X-Gm-Message-State: AOJu0YxRKnqUb5jbRpC0AzYYC/d1N/kkE4K8fLlHvm+GyjlV82tEZGrx
 CQDA7cDwv8pFokLT5H+H6YDx9g==
X-Google-Smtp-Source: AGHT+IHymIkz+nFWS5gxRgDUIjIaONVHvk3MTNBjHs9LM8OVGKYOcHxf76OnwMmZW5wRJc+vAG/nTA==
X-Received: by 2002:a2e:b177:0:b0:2b6:e618:b5a0 with SMTP id
 a23-20020a2eb177000000b002b6e618b5a0mr6918864ljm.6.1692019731835; 
 Mon, 14 Aug 2023 06:28:51 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-80-180-23-204.pool80180.interbusiness.it. [80.180.23.204])
 by smtp.gmail.com with ESMTPSA id
 e3-20020a170906248300b0099d02ca4327sm5662066ejb.54.2023.08.14.06.28.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Aug 2023 06:28:51 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Date: Mon, 14 Aug 2023 15:28:42 +0200
Message-Id: <20230814132844.113312-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230814132844.113312-1-dario.binacchi@amarulasolutions.com>
References: <20230814132844.113312-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 michael@amarulasolutions.com,
 Amarula patchwork <linux-amarula@amarulasolutions.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v8 2/4] ARM: dts: stm32: add pin map for LTDC
	on stm32f7
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

QWRkIHBpbiBjb25maWd1cmF0aW9ucyBmb3IgdXNpbmcgTFREQyAoTENELXRmdCBEaXNwbGF5IENv
bnRyb2xsZXIpIG9uCnN0bTMyZjc0Ni1kaXNjbyBib2FyZC4KClNpZ25lZC1vZmYtYnk6IERhcmlv
IEJpbmFjY2hpIDxkYXJpby5iaW5hY2NoaUBhbWFydWxhc29sdXRpb25zLmNvbT4KUmV2aWV3ZWQt
Ynk6IFJhcGhhw6tsIEdhbGxhaXMtUG91IDxyYXBoYWVsLmdhbGxhaXMtcG91QGZvc3Muc3QuY29t
PgoKLS0tCgoobm8gY2hhbmdlcyBzaW5jZSB2NykKCkNoYW5nZXMgaW4gdjc6Ci0gQWRkICdSZXZp
ZXdlZC1ieScgdGFnIEkgZm9yZ290IGluIHY2LgogIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xp
bnV4LWFybS1rZXJuZWwvMjAyMzA2MjkwODM3MjYuODQ5MTAtMS1kYXJpby5iaW5hY2NoaUBhbWFy
dWxhc29sdXRpb25zLmNvbS9ULwoKQ2hhbmdlcyBpbiB2MzoKLSByZW5hbWUgbHRkYy1waW5zLWEt
MCB0byBsdGRjLTAuCgogYXJjaC9hcm0vYm9vdC9kdHMvc3Qvc3RtMzJmNy1waW5jdHJsLmR0c2kg
fCAzNSArKysrKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDM1IGluc2VydGlv
bnMoKykKCmRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9zdC9zdG0zMmY3LXBpbmN0cmwu
ZHRzaSBiL2FyY2gvYXJtL2Jvb3QvZHRzL3N0L3N0bTMyZjctcGluY3RybC5kdHNpCmluZGV4IDlm
NjU0MDMyOTVjYS4uMzZkYWQ0MGRkMGM3IDEwMDY0NAotLS0gYS9hcmNoL2FybS9ib290L2R0cy9z
dC9zdG0zMmY3LXBpbmN0cmwuZHRzaQorKysgYi9hcmNoL2FybS9ib290L2R0cy9zdC9zdG0zMmY3
LXBpbmN0cmwuZHRzaQpAQCAtMzY1LDYgKzM2NSw0MSBAQCBwaW5zMiB7CiAJCQkJCWJpYXMtcHVs
bC11cDsKIAkJCQl9OwogCQkJfTsKKworCisJCQlsdGRjX3BpbnNfYTogbHRkYy0wIHsKKwkJCQlw
aW5zIHsKKwkJCQkJcGlubXV4ID0gPFNUTTMyX1BJTk1VWCgnRScsIDQsIEFGMTQpPiwgLyogTENE
X0IwICovCisJCQkJCQkgPFNUTTMyX1BJTk1VWCgnRycsMTIsIEFGOSk+LCAgLyogTENEX0I0ICov
CisJCQkJCQkgPFNUTTMyX1BJTk1VWCgnSScsIDksIEFGMTQpPiwgLyogTENEX1ZTWU5DICovCisJ
CQkJCQkgPFNUTTMyX1BJTk1VWCgnSScsMTAsIEFGMTQpPiwgLyogTENEX0hTWU5DICovCisJCQkJ
CQkgPFNUTTMyX1BJTk1VWCgnSScsMTQsIEFGMTQpPiwgLyogTENEX0NMSyAqLworCQkJCQkJIDxT
VE0zMl9QSU5NVVgoJ0knLDE1LCBBRjE0KT4sIC8qIExDRF9SMCAqLworCQkJCQkJIDxTVE0zMl9Q
SU5NVVgoJ0onLCAwLCBBRjE0KT4sIC8qIExDRF9SMSAqLworCQkJCQkJIDxTVE0zMl9QSU5NVVgo
J0onLCAxLCBBRjE0KT4sIC8qIExDRF9SMiAqLworCQkJCQkJIDxTVE0zMl9QSU5NVVgoJ0onLCAy
LCBBRjE0KT4sIC8qIExDRF9SMyAqLworCQkJCQkJIDxTVE0zMl9QSU5NVVgoJ0onLCAzLCBBRjE0
KT4sIC8qIExDRF9SNCAqLworCQkJCQkJIDxTVE0zMl9QSU5NVVgoJ0onLCA0LCBBRjE0KT4sIC8q
IExDRF9SNSAqLworCQkJCQkJIDxTVE0zMl9QSU5NVVgoJ0onLCA1LCBBRjE0KT4sIC8qIExDRF9S
NiAqLworCQkJCQkJIDxTVE0zMl9QSU5NVVgoJ0onLCA2LCBBRjE0KT4sIC8qIExDRF9SNyAqLwor
CQkJCQkJIDxTVE0zMl9QSU5NVVgoJ0onLCA3LCBBRjE0KT4sIC8qIExDRF9HMCAqLworCQkJCQkJ
IDxTVE0zMl9QSU5NVVgoJ0onLCA4LCBBRjE0KT4sIC8qIExDRF9HMSAqLworCQkJCQkJIDxTVE0z
Ml9QSU5NVVgoJ0onLCA5LCBBRjE0KT4sIC8qIExDRF9HMiAqLworCQkJCQkJIDxTVE0zMl9QSU5N
VVgoJ0onLDEwLCBBRjE0KT4sIC8qIExDRF9HMyAqLworCQkJCQkJIDxTVE0zMl9QSU5NVVgoJ0on
LDExLCBBRjE0KT4sIC8qIExDRF9HNCAqLworCQkJCQkJIDxTVE0zMl9QSU5NVVgoJ0onLDEzLCBB
RjE0KT4sIC8qIExDRF9CMSAqLworCQkJCQkJIDxTVE0zMl9QSU5NVVgoJ0onLDE0LCBBRjE0KT4s
IC8qIExDRF9CMiAqLworCQkJCQkJIDxTVE0zMl9QSU5NVVgoJ0onLDE1LCBBRjE0KT4sIC8qIExD
RF9CMyAqLworCQkJCQkJIDxTVE0zMl9QSU5NVVgoJ0snLCAwLCBBRjE0KT4sIC8qIExDRF9HNSAq
LworCQkJCQkJIDxTVE0zMl9QSU5NVVgoJ0snLCAxLCBBRjE0KT4sIC8qIExDRF9HNiAqLworCQkJ
CQkJIDxTVE0zMl9QSU5NVVgoJ0snLCAyLCBBRjE0KT4sIC8qIExDRF9HNyAqLworCQkJCQkJIDxT
VE0zMl9QSU5NVVgoJ0snLCA0LCBBRjE0KT4sIC8qIExDRF9CNSAqLworCQkJCQkJIDxTVE0zMl9Q
SU5NVVgoJ0snLCA1LCBBRjE0KT4sIC8qIExDRF9CNiAqLworCQkJCQkJIDxTVE0zMl9QSU5NVVgo
J0snLCA2LCBBRjE0KT4sIC8qIExDRF9CNyAqLworCQkJCQkJIDxTVE0zMl9QSU5NVVgoJ0snLCA3
LCBBRjE0KT47IC8qIExDRF9ERSAqLworCQkJCQlzbGV3LXJhdGUgPSA8Mj47CisJCQkJfTsKKwkJ
CX07CiAJCX07CiAJfTsKIH07Ci0tIAoyLjM0LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0z
MkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9y
bXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
