Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DEDD290B01A
	for <lists+linux-stm32@lfdr.de>; Mon, 17 Jun 2024 15:50:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A55C7C78002;
	Mon, 17 Jun 2024 13:50:23 +0000 (UTC)
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com
 [209.85.160.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 95948C78001
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Jun 2024 13:50:22 +0000 (UTC)
Received: by mail-oa1-f51.google.com with SMTP id
 586e51a60fabf-2508320e62dso2268659fac.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Jun 2024 06:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718632221; x=1719237021;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=pghOqqoUrgqxulm8czqYmTg2ejQ+jCMFTS9OcdLe8gI=;
 b=cD93KrbdNfnmViFavQCsZV5OCoQfEHdSelECZI53rRUPqA7HGc9D2UK0a0tcM06pSD
 3YYDVDFDxwXBpxqPitawX/yPs+0tFJIj3MF6dXkg1hTNbxmt75Z5GFBzKgmkaxJy+8O/
 K/ly0dl6PzSKRuPephNRRvDehZQHC/+kvWooSNoW5zTi1FA05P+z/AMtSryTPR7TE/wV
 vO2hMckan4bl+goVYsSl2FjasLmGILw22sSgUGcjUDdXFxCI7XIIk1Ul+XIgslDfevbk
 VloY9y0EVInFts9VYbMfj3Nx7vA29uZ6Pcv6XW2vqtDr1M4Ciik2eDe9rHxYyqPYcou2
 dk/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718632221; x=1719237021;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pghOqqoUrgqxulm8czqYmTg2ejQ+jCMFTS9OcdLe8gI=;
 b=eXhzqKhi46wAyR3jdj84hA/w9v3wgIPI1cGlriRP7pe7EcAaatXoeKVA6tq3ie4nyD
 qj7j94K8r3xKQmnBwxgy6wSo93CIT7+UQzF8Lvz5DOKpz8AJhdMO3FXVu11Zgz8NASCj
 fOsvI7HyOQV3vXviEKLnnzjrEAhmcWaH1khY0ADb/cUKSXJobNZvBvipskMU877XiVtK
 T7tQDR7kq96xrm7U+LgWAh7AMdQ6uKjPY7IIq23ahCYtVSJdhKV2SgtDuF3bJlbgl75r
 k7p013HGv1IFRrftkrlMjEOh/BY+IpPFifx7O00V/3Bpt68O5V2Dgk+Rj5dgovEU+v0A
 x7Kg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUw0gyrVgBrBFQPBiUucZEU/oeXi4parTxtAUIa2gQynUjt8xrhPpt3z6KXvqCm6epcU1pfLKNoPZYCSEPPFeAdvMZ9R0h2b0qqYd63SeGBHxKKuT6cnTxj
X-Gm-Message-State: AOJu0Yy6m/oWruF/YQNdsuWLISUQeVHxGva/p8SNuWn6C32nk0/x5zIL
 fJYlcHxKrhFZbobehe1pzVrip0p2vPHy/pLM6A2uxahNkYRQebCUzTBgqWyPBNk=
X-Google-Smtp-Source: AGHT+IHPRFjhQJMl5A95ZWgXFtrQQKsMmXYW6RVDp9V1gMjS9xuHYY98wxPGrZXsyYueeiP6Xe3wcg==
X-Received: by 2002:a05:6871:5c9:b0:254:94a4:35d2 with SMTP id
 586e51a60fabf-25842b7af81mr10339918fac.45.1718632221358; 
 Mon, 17 Jun 2024 06:50:21 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net.
 [24.150.219.207]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-798aaecc004sm432892285a.31.2024.06.17.06.50.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jun 2024 06:50:21 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
Date: Mon, 17 Jun 2024 09:49:57 -0400
MIME-Version: 1.0
Message-Id: <20240617-review-v3-17-88d1338c4cca@baylibre.com>
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
Subject: [Linux-stm32] [PATCH v3 17/41] iio: adc: sc27xx_adc: make use of
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
aWJyZS5jb20+ClJldmlld2VkLWJ5OiBCYW9saW4gV2FuZyA8YmFvbGluLndhbmdAbGludXguYWxp
YmFiYS5jb20+ClNpZ25lZC1vZmYtYnk6IFRyZXZvciBHYW1ibGluIDx0Z2FtYmxpbkBiYXlsaWJy
ZS5jb20+Ci0tLQogZHJpdmVycy9paW8vYWRjL3NjMjd4eF9hZGMuYyB8IDQxICsrKysrKysrKysr
KysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMjAgaW5zZXJ0
aW9ucygrKSwgMjEgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9paW8vYWRjL3Nj
Mjd4eF9hZGMuYyBiL2RyaXZlcnMvaWlvL2FkYy9zYzI3eHhfYWRjLmMKaW5kZXggYjRhMmUwNTdk
ODBmLi4yNTM1YzJjM2U2MGIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvaWlvL2FkYy9zYzI3eHhfYWRj
LmMKKysrIGIvZHJpdmVycy9paW8vYWRjL3NjMjd4eF9hZGMuYwpAQCAtNTA4LDEzICs1MDgsMTMg
QEAgc3RhdGljIGludCBzYzI3eHhfYWRjX3JlYWQoc3RydWN0IHNjMjd4eF9hZGNfZGF0YSAqZGF0
YSwgaW50IGNoYW5uZWwsCiAJCX0KIAl9CiAKLQlyZXQgPSByZWdtYXBfdXBkYXRlX2JpdHMoZGF0
YS0+cmVnbWFwLCBkYXRhLT5iYXNlICsgU0MyN1hYX0FEQ19DVEwsCi0JCQkJIFNDMjdYWF9BRENf
RU4sIFNDMjdYWF9BRENfRU4pOworCXJldCA9IHJlZ21hcF9zZXRfYml0cyhkYXRhLT5yZWdtYXAs
IGRhdGEtPmJhc2UgKyBTQzI3WFhfQURDX0NUTCwKKwkJCSAgICAgIFNDMjdYWF9BRENfRU4pOwog
CWlmIChyZXQpCiAJCWdvdG8gcmVndWxhdG9yX3Jlc3RvcmU7CiAKLQlyZXQgPSByZWdtYXBfdXBk
YXRlX2JpdHMoZGF0YS0+cmVnbWFwLCBkYXRhLT5iYXNlICsgU0MyN1hYX0FEQ19JTlRfQ0xSLAot
CQkJCSBTQzI3WFhfQURDX0lSUV9DTFIsIFNDMjdYWF9BRENfSVJRX0NMUik7CisJcmV0ID0gcmVn
bWFwX3NldF9iaXRzKGRhdGEtPnJlZ21hcCwgZGF0YS0+YmFzZSArIFNDMjdYWF9BRENfSU5UX0NM
UiwKKwkJCSAgICAgIFNDMjdYWF9BRENfSVJRX0NMUik7CiAJaWYgKHJldCkKIAkJZ290byBkaXNh
YmxlX2FkYzsKIApAQCAtNTM3LDggKzUzNyw4IEBAIHN0YXRpYyBpbnQgc2MyN3h4X2FkY19yZWFk
KHN0cnVjdCBzYzI3eHhfYWRjX2RhdGEgKmRhdGEsIGludCBjaGFubmVsLAogCWlmIChyZXQpCiAJ
CWdvdG8gZGlzYWJsZV9hZGM7CiAKLQlyZXQgPSByZWdtYXBfdXBkYXRlX2JpdHMoZGF0YS0+cmVn
bWFwLCBkYXRhLT5iYXNlICsgU0MyN1hYX0FEQ19DVEwsCi0JCQkJIFNDMjdYWF9BRENfQ0hOX1JV
TiwgU0MyN1hYX0FEQ19DSE5fUlVOKTsKKwlyZXQgPSByZWdtYXBfc2V0X2JpdHMoZGF0YS0+cmVn
bWFwLCBkYXRhLT5iYXNlICsgU0MyN1hYX0FEQ19DVEwsCisJCQkgICAgICBTQzI3WFhfQURDX0NI
Tl9SVU4pOwogCWlmIChyZXQpCiAJCWdvdG8gZGlzYWJsZV9hZGM7CiAKQEAgLTU1OSw4ICs1NTks
OCBAQCBzdGF0aWMgaW50IHNjMjd4eF9hZGNfcmVhZChzdHJ1Y3Qgc2MyN3h4X2FkY19kYXRhICpk
YXRhLCBpbnQgY2hhbm5lbCwKIAl2YWx1ZSAmPSBTQzI3WFhfQURDX0RBVEFfTUFTSzsKIAogZGlz
YWJsZV9hZGM6Ci0JcmVnbWFwX3VwZGF0ZV9iaXRzKGRhdGEtPnJlZ21hcCwgZGF0YS0+YmFzZSAr
IFNDMjdYWF9BRENfQ1RMLAotCQkJICAgU0MyN1hYX0FEQ19FTiwgMCk7CisJcmVnbWFwX2NsZWFy
X2JpdHMoZGF0YS0+cmVnbWFwLCBkYXRhLT5iYXNlICsgU0MyN1hYX0FEQ19DVEwsCisJCQkgIFND
MjdYWF9BRENfRU4pOwogcmVndWxhdG9yX3Jlc3RvcmU6CiAJaWYgKChkYXRhLT52YXJfZGF0YS0+
c2V0X3ZvbHJlZikgJiYgKGNoYW5uZWwgPT0gMzAgfHwgY2hhbm5lbCA9PSAzMSkpIHsKIAkJcmV0
X3ZvbHJlZiA9IHJlZ3VsYXRvcl9zZXRfdm9sdGFnZShkYXRhLT52b2xyZWYsCkBAIC03NjUsMTUg
Kzc2NSwxNCBAQCBzdGF0aWMgaW50IHNjMjd4eF9hZGNfZW5hYmxlKHN0cnVjdCBzYzI3eHhfYWRj
X2RhdGEgKmRhdGEpCiB7CiAJaW50IHJldDsKIAotCXJldCA9IHJlZ21hcF91cGRhdGVfYml0cyhk
YXRhLT5yZWdtYXAsIGRhdGEtPnZhcl9kYXRhLT5tb2R1bGVfZW4sCi0JCQkJIFNDMjdYWF9NT0RV
TEVfQURDX0VOLCBTQzI3WFhfTU9EVUxFX0FEQ19FTik7CisJcmV0ID0gcmVnbWFwX3NldF9iaXRz
KGRhdGEtPnJlZ21hcCwgZGF0YS0+dmFyX2RhdGEtPm1vZHVsZV9lbiwKKwkJCSAgICAgIFNDMjdY
WF9NT0RVTEVfQURDX0VOKTsKIAlpZiAocmV0KQogCQlyZXR1cm4gcmV0OwogCiAJLyogRW5hYmxl
IEFEQyB3b3JrIGNsb2NrIGFuZCBjb250cm9sbGVyIGNsb2NrICovCi0JcmV0ID0gcmVnbWFwX3Vw
ZGF0ZV9iaXRzKGRhdGEtPnJlZ21hcCwgZGF0YS0+dmFyX2RhdGEtPmNsa19lbiwKLQkJCQkgU0My
N1hYX0NMS19BRENfRU4gfCBTQzI3WFhfQ0xLX0FEQ19DTEtfRU4sCi0JCQkJIFNDMjdYWF9DTEtf
QURDX0VOIHwgU0MyN1hYX0NMS19BRENfQ0xLX0VOKTsKKwlyZXQgPSByZWdtYXBfc2V0X2JpdHMo
ZGF0YS0+cmVnbWFwLCBkYXRhLT52YXJfZGF0YS0+Y2xrX2VuLAorCQkJICAgICAgU0MyN1hYX0NM
S19BRENfRU4gfCBTQzI3WFhfQ0xLX0FEQ19DTEtfRU4pOwogCWlmIChyZXQpCiAJCWdvdG8gZGlz
YWJsZV9hZGM7CiAKQEAgLTc4OSwxMSArNzg4LDExIEBAIHN0YXRpYyBpbnQgc2MyN3h4X2FkY19l
bmFibGUoc3RydWN0IHNjMjd4eF9hZGNfZGF0YSAqZGF0YSkKIAlyZXR1cm4gMDsKIAogZGlzYWJs
ZV9jbGs6Ci0JcmVnbWFwX3VwZGF0ZV9iaXRzKGRhdGEtPnJlZ21hcCwgZGF0YS0+dmFyX2RhdGEt
PmNsa19lbiwKLQkJCSAgIFNDMjdYWF9DTEtfQURDX0VOIHwgU0MyN1hYX0NMS19BRENfQ0xLX0VO
LCAwKTsKKwlyZWdtYXBfY2xlYXJfYml0cyhkYXRhLT5yZWdtYXAsIGRhdGEtPnZhcl9kYXRhLT5j
bGtfZW4sCisJCQkgIFNDMjdYWF9DTEtfQURDX0VOIHwgU0MyN1hYX0NMS19BRENfQ0xLX0VOKTsK
IGRpc2FibGVfYWRjOgotCXJlZ21hcF91cGRhdGVfYml0cyhkYXRhLT5yZWdtYXAsIGRhdGEtPnZh
cl9kYXRhLT5tb2R1bGVfZW4sCi0JCQkgICBTQzI3WFhfTU9EVUxFX0FEQ19FTiwgMCk7CisJcmVn
bWFwX2NsZWFyX2JpdHMoZGF0YS0+cmVnbWFwLCBkYXRhLT52YXJfZGF0YS0+bW9kdWxlX2VuLAor
CQkJICBTQzI3WFhfTU9EVUxFX0FEQ19FTik7CiAKIAlyZXR1cm4gcmV0OwogfQpAQCAtODAzLDEx
ICs4MDIsMTEgQEAgc3RhdGljIHZvaWQgc2MyN3h4X2FkY19kaXNhYmxlKHZvaWQgKl9kYXRhKQog
CXN0cnVjdCBzYzI3eHhfYWRjX2RhdGEgKmRhdGEgPSBfZGF0YTsKIAogCS8qIERpc2FibGUgQURD
IHdvcmsgY2xvY2sgYW5kIGNvbnRyb2xsZXIgY2xvY2sgKi8KLQlyZWdtYXBfdXBkYXRlX2JpdHMo
ZGF0YS0+cmVnbWFwLCBkYXRhLT52YXJfZGF0YS0+Y2xrX2VuLAotCQkJICAgU0MyN1hYX0NMS19B
RENfRU4gfCBTQzI3WFhfQ0xLX0FEQ19DTEtfRU4sIDApOworCXJlZ21hcF9jbGVhcl9iaXRzKGRh
dGEtPnJlZ21hcCwgZGF0YS0+dmFyX2RhdGEtPmNsa19lbiwKKwkJCSAgU0MyN1hYX0NMS19BRENf
RU4gfCBTQzI3WFhfQ0xLX0FEQ19DTEtfRU4pOwogCi0JcmVnbWFwX3VwZGF0ZV9iaXRzKGRhdGEt
PnJlZ21hcCwgZGF0YS0+dmFyX2RhdGEtPm1vZHVsZV9lbiwKLQkJCSAgIFNDMjdYWF9NT0RVTEVf
QURDX0VOLCAwKTsKKwlyZWdtYXBfY2xlYXJfYml0cyhkYXRhLT5yZWdtYXAsIGRhdGEtPnZhcl9k
YXRhLT5tb2R1bGVfZW4sCisJCQkgIFNDMjdYWF9NT0RVTEVfQURDX0VOKTsKIH0KIAogc3RhdGlj
IGNvbnN0IHN0cnVjdCBzYzI3eHhfYWRjX3ZhcmlhbnRfZGF0YSBzYzI3MzFfZGF0YSA9IHsKCi0t
IAoyLjQ1LjIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3Jt
cmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXN0bTMyCg==
