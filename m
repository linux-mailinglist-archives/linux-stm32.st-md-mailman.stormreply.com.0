Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F6409127FA
	for <lists+linux-stm32@lfdr.de>; Fri, 21 Jun 2024 16:37:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CF0EFC78012;
	Fri, 21 Jun 2024 14:37:46 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7EB63C7128E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 21 Jun 2024 14:37:44 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-2eaea28868dso27765271fa.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 21 Jun 2024 07:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718980663; x=1719585463;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ysq3uDxdRX+lWPBKjGMKWeUw8FNy+OKaKwytbRkcytM=;
 b=U5ba4sED36Has1JfYUwskeNAhHS62Q/DUqWqjOKJsFTVV6jI8Nvc1XXmb1NqAod9Rf
 Szy9lvGBNZZKw1znbRjUHU6nftQL0fy2A/CLr0gUAjlUQYW47dl4YsfGGH9V73SFtLRI
 SM0PeLke+cBjlYe3hZi6a3R0GZwlmTXetSx6BHLV9fNeYN1G2Lyjp44LRDKQRPNV8ppM
 SG/uKTWQQQOkJdWuByNUgTMatX2xTEnP7q5qcB0Yp2P9KyoouZDHtlMdfFT8L194Lke5
 4Hn99jeT0h1jUcdR7JBIIBAHblWw1kqESWzm/cGdHZ2IJtkrz37SSVAX37EE23qnRBD8
 UEEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718980663; x=1719585463;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ysq3uDxdRX+lWPBKjGMKWeUw8FNy+OKaKwytbRkcytM=;
 b=n44w/Y7Erq9U7OTsejUc3Q7vjcHlABW1uM7U4s9OvUSGNdEUw2YqHS8cI0z4fhAVmk
 DlzrB93MxCkABGxwydob29bXxRthPRo66aMn0Z3lzh5vk2a32DpK9/gGFxgg62EHhn8z
 6QBPKaag+6s5hzNoE3S5hbepabuhBxFe3ou9YB4w0PicpI22rmvNNqN5P+7v2PY1/qUE
 ODQ2Piad3ikdGhvzMmx08zOtdmGrkhx74Hp4zZYfJMHpAHuy1ueExsPg64+aTMf0J1ku
 z6AMBITeB9QCf9ugdLmJ8IDxRGT3qyfkT47gd6kOITn99LAx/DITdcVP6EX5Zfza3Az+
 v2Hg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXtfvalDLbW0bRqjmdXOh4U8F7Uqcw1GAw3T/4Jx8yI4RA2fF7kRPz8UsreC1JIF7Vge2LHFhM1BHpsgcwHxy1uL7S82w1u4HLaXDeoi15/7OtB9ogtHVBz
X-Gm-Message-State: AOJu0YwZHeAImZKk8AjB+jJZFMbBrE6SzYjhMobPXNL/yGDaOykRlsoK
 cEeiwVG73OXkJylx1HDgJ0ql9vRMpWMCtWQiOaF9iCubxm0n0Qb4sjZP+n6HEh8=
X-Google-Smtp-Source: AGHT+IFLJYSC6FgjmimkqI552OEyvALn0atKDFSRu4RIfBpKfbrvs9j00kDHZDdQpT6hofjonr2dCw==
X-Received: by 2002:a2e:860e:0:b0:2eb:d963:d8cc with SMTP id
 38308e7fff4ca-2ec3cffc54dmr66022471fa.49.1718980663095; 
 Fri, 21 Jun 2024 07:37:43 -0700 (PDT)
Received: from localhost (p5091583d.dip0.t-ipconnect.de. [80.145.88.61])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6fcf560632sm89872266b.160.2024.06.21.07.37.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jun 2024 07:37:42 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Lee Jones <lee@kernel.org>, Thierry Reding <treding@nvidia.com>
Date: Fri, 21 Jun 2024 16:37:14 +0200
Message-ID: <285182163211203fc823a65b180761f46e828dcb.1718979150.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1718979150.git.u.kleine-koenig@baylibre.com>
References: <cover.1718979150.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=997;
 i=u.kleine-koenig@baylibre.com; h=from:subject:message-id;
 bh=SfN1/kmbTsUXBRgADyC88RwGMUteJe+oranzSQBC5Fk=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBmdZAfb+L0dKnD/968LLQzw7aJDYzoGaDBtRJAB
 NS3vUyhQRCJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZnWQHwAKCRCPgPtYfRL+
 TpYoCACUHHNFQz4vsijVkCs9ya+JpnFPamzXqQOcAYtZspgBby/vtiTojF3PA+ZxfJwj7G430Jx
 9ifJDujnDwnuPMbRfJFgXPJomcN5p3Ijc7iSJ2ToVfDkY4T9MUjYbl5Kzff22KmeOj0IfCOEpl4
 4uoU9zsubXjvbpq5G/MnS7CnM7DJP3j8wE7icIh2aOMHqkCsDT36QAKpUAzhlyJdmJW2Lvhm51+
 wn+O4Q4fa8z6CtH8UuaWMugsrFsJ6AXsA5PqGjVq0v0dFeE4Ava0FCLo1QwXh6zxhnXYXWawKlt
 4MHbZtWkTvogh8CUvJ77vCWrdOkRqtuYrmTkH5dsC7khnrSK
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Cc: Trevor Gamblin <tgamblin@baylibre.com>, linux-pwm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 3/3] pwm: stm32: Fix error message to not
	describe the previous error path
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

IkZhaWxlZCB0byBsb2NrIHRoZSBjbG9jayIgaXMgYW4gYXBwcm9wcmlhdGUgZXJyb3IgbWVzc2Fn
ZSBmb3IKY2xrX3JhdGVfZXhjbHVzaXZlX2dldCgpIGZhaWxpbmcsIGJ1dCBub3QgZm9yIHRoZSBj
bG9jayBydW5uaW5nIHRvbwpmYXN0IGZvciB0aGUgZHJpdmVyJ3MgY2FsY3VsYXRpb25zLgoKQWRh
cHQgdGhlIGVycm9yIG1lc3NhZ2UgYWNjb3JkaW5nbHkuCgpGaXhlczogZDQ0ZDYzNTYzNWE3ICgi
cHdtOiBzdG0zMjogRml4IGZvciBzZXR0aW5ncyB1c2luZyBwZXJpb2QgPiBVSU5UMzJfTUFYIikK
U2lnbmVkLW9mZi1ieTogVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BiYXlsaWJy
ZS5jb20+Ci0tLQogZHJpdmVycy9wd20vcHdtLXN0bTMyLmMgfCAzICsrLQogMSBmaWxlIGNoYW5n
ZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
cHdtL3B3bS1zdG0zMi5jIGIvZHJpdmVycy9wd20vcHdtLXN0bTMyLmMKaW5kZXggYTdmZjM5ZTlm
YzI4Li5iYzMyZTlhYmYyYjEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvcHdtL3B3bS1zdG0zMi5jCisr
KyBiL2RyaXZlcnMvcHdtL3B3bS1zdG0zMi5jCkBAIC02ODEsNyArNjgxLDggQEAgc3RhdGljIGlu
dCBzdG0zMl9wd21fcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAkgKiAuYXBw
bHkoKSB3b24ndCBvdmVyZmxvdy4KIAkgKi8KIAlpZiAoY2xrX2dldF9yYXRlKHByaXYtPmNsaykg
PiAxMDAwMDAwMDAwKQotCQlyZXR1cm4gZGV2X2Vycl9wcm9iZShkZXYsIC1FSU5WQUwsICJGYWls
ZWQgdG8gbG9jayBjbG9ja1xuIik7CisJCXJldHVybiBkZXZfZXJyX3Byb2JlKGRldiwgLUVJTlZB
TCwgIkNsb2NrIGZyZXEgdG9vIGhpZ2ggKCVsdSlcbiIsCisJCQkJICAgICBjbGtfZ2V0X3JhdGUo
cHJpdi0+Y2xrKSk7CiAKIAljaGlwLT5vcHMgPSAmc3RtMzJwd21fb3BzOwogCi0tIAoyLjQzLjAK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0
bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29t
Cmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXN0bTMyCg==
