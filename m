Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A1EF90B00D
	for <lists+linux-stm32@lfdr.de>; Mon, 17 Jun 2024 15:50:04 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 403DFC78012;
	Mon, 17 Jun 2024 13:50:04 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com
 [209.85.222.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ED397C78012
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Jun 2024 13:50:02 +0000 (UTC)
Received: by mail-qk1-f170.google.com with SMTP id
 af79cd13be357-795569eedcaso228699585a.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Jun 2024 06:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718632202; x=1719237002;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=/J+uii6o7EZaRWTf6fwT0Zq6b6sr2oRr59Sqisc7RFA=;
 b=sWJuNe2vd470n0Teu8qQxQnp8bhSlY6g0pdgdDn70zmNv7XOlB++kpO1h6hU4SOR1A
 qByDpD9A3LTT+OPRkG9UmFrq2zoWZowU95981b4ionGmONZLYvAeUlTYn0Cl8OcDGiNq
 ZQ5MGA9K0lOFBTfVmh8Gnpl+Y19YTsXBbqcNn3GhXyYy90P/DAlebHaxgsZdNf3sxYCv
 3FppLF9x/6oQSxljTL6ixshL8Sx+9t1MIXNcFAbJui2ZDhjweeIUNusyY09CyIsJF79Y
 9pY2wyYxX6oiKuww2fIRfbagqtHbMjfH37HfrVqPi8w29pIz0A9wUfg5HUc1mWJDwPbq
 Phpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718632202; x=1719237002;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/J+uii6o7EZaRWTf6fwT0Zq6b6sr2oRr59Sqisc7RFA=;
 b=vXj1wpI+2mbzMVIMxvf3SiPTglxm5T2+bpinTjkNbq/3WIqp5bDGogDFSiyGAGN/eA
 UcdXLcSIOk74Eq8Suh2RV2wkWlf0UhxhNcq5X8/FosekqT9nI3j/mLUG4v9heZCSELTJ
 IE9p8oQgj5qnaJ9wgx2ySitKUhVBDhkAF8LVaBiEhGWkGvPEOqZMVE/BXeKPBu+zAudt
 v7HiLE74gVR9Ozq2HMzZDCR7bZvw8QtxbsD53aKGuBHzVWqn79eoQMZirL+4W0KcFBxB
 pd6HoE7hJY6t2Mv2/QnMKHctmdC/BHsbsPLB66fPPSOOeMiXP2dnh5JveOivyrH2jcWX
 UTRA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWOG8F0lapepHbT/XrjO8oNYJSeGGOgN/Vb8hecccVqZ461F/p1CHjmx7IVVfWXbT2BQ5JDvXfGUUeOg9MOYuWdo1lfvK6zHxR1hPWHvMIrWBc85AbdHlQ/
X-Gm-Message-State: AOJu0Yxw8KiYE35D0w43xF47OgE7qY0QNjbU4r8cHie1rtyCPO9wyyOg
 UtePRRwC5n926HMwbjUQYKBc/IvRzv7U6v9IPXOs9r1yPKlR0uqtI1XW02cjn3Y=
X-Google-Smtp-Source: AGHT+IHQO7lDiG1TVDzbCtPAbJI8uHKSdU2/yIiDIlagRddBfJsOkXoStyLOw9TY/mBvF1osZeRq9Q==
X-Received: by 2002:a05:620a:2955:b0:792:c34d:482 with SMTP id
 af79cd13be357-798d2413b26mr1228938285a.25.1718632201881; 
 Mon, 17 Jun 2024 06:50:01 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net.
 [24.150.219.207]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-798aaecc004sm432892285a.31.2024.06.17.06.49.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jun 2024 06:50:01 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
Date: Mon, 17 Jun 2024 09:49:48 -0400
MIME-Version: 1.0
Message-Id: <20240617-review-v3-8-88d1338c4cca@baylibre.com>
References: <20240617-review-v3-0-88d1338c4cca@baylibre.com>
In-Reply-To: <20240617-review-v3-0-88d1338c4cca@baylibre.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 Lars-Peter Clausen <lars@metafoo.de>, 
 Dmitry Rokosov <ddrokosov@sberdevices.ru>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Cosmin Tanislav <cosmin.tanislav@analog.com>, Chen-Yu Tsai <wens@csie.org>, 
 Hans de Goede <hdegoede@redhat.com>, Ray Jui <rjui@broadcom.com>, 
 Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Saravanan Sekar <sravanhome@gmail.com>, Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Jean-Baptiste Maneyrol <jmaneyrol@invensense.com>, 
 Crt Mori <cmo@melexis.com>
X-Mailer: b4 0.13.0
Cc: Trevor Gamblin <tgamblin@baylibre.com>, imx@lists.linux.dev,
 linux-iio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 linux-amlogic@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3 08/41] iio: adc: berlin2-adc: make use of
 regmap_clear_bits(), regmap_set_bits()
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

SW5zdGVhZCBvZiB1c2luZyByZWdtYXBfdXBkYXRlX2JpdHMoKSBhbmQgcGFzc2luZyB0aGUgbWFz
ayB0d2ljZSwgdXNlCnJlZ21hcF9zZXRfYml0cygpLgoKSW5zdGVhZCBvZiB1c2luZyByZWdtYXBf
dXBkYXRlX2JpdHMoKSBhbmQgcGFzc2luZyB2YWwgPSAwLCB1c2UKcmVnbWFwX2NsZWFyX2JpdHMo
KS4KClN1Z2dlc3RlZC1ieTogVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BiYXls
aWJyZS5jb20+ClNpZ25lZC1vZmYtYnk6IFRyZXZvciBHYW1ibGluIDx0Z2FtYmxpbkBiYXlsaWJy
ZS5jb20+Ci0tLQogZHJpdmVycy9paW8vYWRjL2JlcmxpbjItYWRjLmMgfCAyNCArKysrKysrKysr
Ky0tLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCAxMyBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2lpby9hZGMvYmVybGluMi1hZGMuYyBiL2Ry
aXZlcnMvaWlvL2FkYy9iZXJsaW4yLWFkYy5jCmluZGV4IGE0ZTdjN2VmZjVhYy4uNGNkZGRjNmUz
NmU5IDEwMDY0NAotLS0gYS9kcml2ZXJzL2lpby9hZGMvYmVybGluMi1hZGMuYworKysgYi9kcml2
ZXJzL2lpby9hZGMvYmVybGluMi1hZGMuYwpAQCAtMTI5LDggKzEyOSw4IEBAIHN0YXRpYyBpbnQg
YmVybGluMl9hZGNfcmVhZChzdHJ1Y3QgaWlvX2RldiAqaW5kaW9fZGV2LCBpbnQgY2hhbm5lbCkK
IAkJCQkJICAgICAgIG1zZWNzX3RvX2ppZmZpZXMoMTAwMCkpOwogCiAJLyogRGlzYWJsZSB0aGUg
aW50ZXJydXB0cyAqLwotCXJlZ21hcF91cGRhdGVfYml0cyhwcml2LT5yZWdtYXAsIEJFUkxJTjJf
U01fQURDX1NUQVRVUywKLQkJCSAgIEJFUkxJTjJfU01fQURDX1NUQVRVU19JTlRfRU4oY2hhbm5l
bCksIDApOworCXJlZ21hcF9jbGVhcl9iaXRzKHByaXYtPnJlZ21hcCwgQkVSTElOMl9TTV9BRENf
U1RBVFVTLAorCQkJICBCRVJMSU4yX1NNX0FEQ19TVEFUVVNfSU5UX0VOKGNoYW5uZWwpKTsKIAog
CWlmIChyZXQgPT0gMCkKIAkJcmV0ID0gLUVUSU1FRE9VVDsKQEAgLTEzOSw4ICsxMzksOCBAQCBz
dGF0aWMgaW50IGJlcmxpbjJfYWRjX3JlYWQoc3RydWN0IGlpb19kZXYgKmluZGlvX2RldiwgaW50
IGNoYW5uZWwpCiAJCXJldHVybiByZXQ7CiAJfQogCi0JcmVnbWFwX3VwZGF0ZV9iaXRzKHByaXYt
PnJlZ21hcCwgQkVSTElOMl9TTV9DVFJMLAotCQkJICAgQkVSTElOMl9TTV9DVFJMX0FEQ19TVEFS
VCwgMCk7CisJcmVnbWFwX2NsZWFyX2JpdHMocHJpdi0+cmVnbWFwLCBCRVJMSU4yX1NNX0NUUkws
CisJCQkgIEJFUkxJTjJfU01fQ1RSTF9BRENfU1RBUlQpOwogCiAJZGF0YSA9IHByaXYtPmRhdGE7
CiAJcHJpdi0+ZGF0YV9hdmFpbGFibGUgPSBmYWxzZTsKQEAgLTE4MCw4ICsxODAsOCBAQCBzdGF0
aWMgaW50IGJlcmxpbjJfYWRjX3RzZW5fcmVhZChzdHJ1Y3QgaWlvX2RldiAqaW5kaW9fZGV2KQog
CQkJCQkgICAgICAgbXNlY3NfdG9famlmZmllcygxMDAwKSk7CiAKIAkvKiBEaXNhYmxlIGludGVy
cnVwdHMgKi8KLQlyZWdtYXBfdXBkYXRlX2JpdHMocHJpdi0+cmVnbWFwLCBCRVJMSU4yX1NNX1RT
RU5fU1RBVFVTLAotCQkJICAgQkVSTElOMl9TTV9UU0VOX1NUQVRVU19JTlRfRU4sIDApOworCXJl
Z21hcF9jbGVhcl9iaXRzKHByaXYtPnJlZ21hcCwgQkVSTElOMl9TTV9UU0VOX1NUQVRVUywKKwkJ
CSAgQkVSTElOMl9TTV9UU0VOX1NUQVRVU19JTlRfRU4pOwogCiAJaWYgKHJldCA9PSAwKQogCQly
ZXQgPSAtRVRJTUVET1VUOwpAQCAtMTkwLDggKzE5MCw4IEBAIHN0YXRpYyBpbnQgYmVybGluMl9h
ZGNfdHNlbl9yZWFkKHN0cnVjdCBpaW9fZGV2ICppbmRpb19kZXYpCiAJCXJldHVybiByZXQ7CiAJ
fQogCi0JcmVnbWFwX3VwZGF0ZV9iaXRzKHByaXYtPnJlZ21hcCwgQkVSTElOMl9TTV9UU0VOX0NU
UkwsCi0JCQkgICBCRVJMSU4yX1NNX1RTRU5fQ1RSTF9TVEFSVCwgMCk7CisJcmVnbWFwX2NsZWFy
X2JpdHMocHJpdi0+cmVnbWFwLCBCRVJMSU4yX1NNX1RTRU5fQ1RSTCwKKwkJCSAgQkVSTElOMl9T
TV9UU0VOX0NUUkxfU1RBUlQpOwogCiAJZGF0YSA9IHByaXYtPmRhdGE7CiAJcHJpdi0+ZGF0YV9h
dmFpbGFibGUgPSBmYWxzZTsKQEAgLTI4NCw4ICsyODQsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0
IGlpb19pbmZvIGJlcmxpbjJfYWRjX2luZm8gPSB7CiAKIHN0YXRpYyB2b2lkIGJlcmxpbjJfYWRj
X3Bvd2VyZG93bih2b2lkICpyZWdtYXApCiB7Ci0JcmVnbWFwX3VwZGF0ZV9iaXRzKHJlZ21hcCwg
QkVSTElOMl9TTV9DVFJMLAotCQkJICAgQkVSTElOMl9TTV9DVFJMX0FEQ19QT1dFUiwgMCk7CisJ
cmVnbWFwX2NsZWFyX2JpdHMocmVnbWFwLCBCRVJMSU4yX1NNX0NUUkwsIEJFUkxJTjJfU01fQ1RS
TF9BRENfUE9XRVIpOwogCiB9CiAKQEAgLTMzOSw5ICszMzgsOCBAQCBzdGF0aWMgaW50IGJlcmxp
bjJfYWRjX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJaW5kaW9fZGV2LT5u
dW1fY2hhbm5lbHMgPSBBUlJBWV9TSVpFKGJlcmxpbjJfYWRjX2NoYW5uZWxzKTsKIAogCS8qIFBv
d2VyIHVwIHRoZSBBREMgKi8KLQlyZWdtYXBfdXBkYXRlX2JpdHMocHJpdi0+cmVnbWFwLCBCRVJM
SU4yX1NNX0NUUkwsCi0JCQkgICBCRVJMSU4yX1NNX0NUUkxfQURDX1BPV0VSLAotCQkJICAgQkVS
TElOMl9TTV9DVFJMX0FEQ19QT1dFUik7CisJcmVnbWFwX3NldF9iaXRzKHByaXYtPnJlZ21hcCwg
QkVSTElOMl9TTV9DVFJMLAorCQkJQkVSTElOMl9TTV9DVFJMX0FEQ19QT1dFUik7CiAKIAlyZXQg
PSBkZXZtX2FkZF9hY3Rpb25fb3JfcmVzZXQoJnBkZXYtPmRldiwgYmVybGluMl9hZGNfcG93ZXJk
b3duLAogCQkJCSAgICAgICBwcml2LT5yZWdtYXApOwoKLS0gCjIuNDUuMgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBs
aXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1t
ZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
