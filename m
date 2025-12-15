Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B2411CBE3DC
	for <lists+linux-stm32@lfdr.de>; Mon, 15 Dec 2025 15:17:48 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 80279C35E2B;
	Mon, 15 Dec 2025 14:17:48 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 90CB6C36B2A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Dec 2025 14:17:47 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id
 4fb4d7f45d1cf-64165cd689eso5528143a12.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Dec 2025 06:17:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1765808267; x=1766413067;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/lBoMkq+p5dQ2OsBBFnXVtnCRh4ggCKmjrfxDYkmgHo=;
 b=sK0jyso/xlk906byP6YETJHBw8bVedaFX4BB0PJECFHE0HHkbI1CYwSspRWNSGa8fR
 e6pylPXrt9B7BaIj3EtwO3naOLFvfrZyESfT+FL6aeO9eZU35zOqUSUDRQkpXbIBDyCv
 m1P862VMSQdkjeW2d+ioko2E692FlPAmqfdaXnYIL3e+NEXs22FoXFscJ82doVLrGOre
 vLNPYz6mCj2M/wcYQ+djr1xRpmUHJPfThf5A6ovukt3+l/xNJudWQTybSdnrfPjZqJEk
 8nT6R8TUIX4g8KJ1hkpkBcpIcBOuEIC4Rlhpl0l0sbQtSUZ3o1r/2j29VvZArQIilP2H
 1Eaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765808267; x=1766413067;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=/lBoMkq+p5dQ2OsBBFnXVtnCRh4ggCKmjrfxDYkmgHo=;
 b=WyvCdOuMsfqWoUvdI8RUzbYna2bJ1M2Bo6sAZ0Yqme/fPlA1N0GnklKOxlPdwdnMK8
 66NzKTO31ivuMRvsID8TcOPMWW6T6ZQ2rJ/bsBW5X6ZZE8hghlEMwtHu355aUVM3odxP
 pQpy8LQtzt66vdV6YtKnS5T1Bt+xK/1fIW7TEGAlWSnk3ymo0yjLAuQ1+mKdFbyzLxYC
 Sn6hgkFzmpsEoLkJZKHPgXzE1cifhS5McUZ2RLqKI7JrbwL7XPlsmAASowp4ASBkXlMh
 bzRWYIytIbm47Gv317HAIA0NXBYKLfTGTmNESMJdYKOCDB+N2DxHY3KfBd87GXSw4l4Q
 FM/A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUdE4ycX2gpaTLc05/JSWYLelOrnWfdRPulC3k+9i8hfBFS50cJEPdJNPfvmncmzI11Tf1qmVfs/VyPZw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzH5y2hLhQMXqRyIjXNvHh464K3IxvRCAzUQaVP6/lbNOOoH50T
 bPpB+KXIU8HLv/QNPveKyGX5er3nTURUgLV9yJTLMfTFgHBY6b7+pH+0bIjozpkXK9I=
X-Gm-Gg: AY/fxX4MGf2GZ7Og92mQYG6pdk/qtklWbuA1PJ8ht1gdp70lDCKcrPEVqGIqRlzH/hU
 YZ0w1v2izuII+GncmS0rm4wkuAKfnTk/6hHrf91oZafJoJI4mIVmZYSg068ZKEOvOCBzod8motY
 Jo2K7fJANzws4KLp7krcS5oBu3UbD013lAx3+O/uJOBOd90DjagdcwIoPDcfW+SHFwgLnc52eJ6
 WcMhhwoNZYy0wxsyZgyS/eg631yY4omGEV2XlK6RqJbg7f37LRDojSGNbnyXGG5IzaI5zOsMbDW
 lfbKlSD7Y0QohBSYqXTJg+69lzmvIaJfMsNujlsAemPXjHntpHsfx3iwdxAWWgGPdkx+G3hhNV1
 qJXI8JSb8RvHwnLch9JPWloTecMGD5mNgo9HEIMFpdggjpHVdn3dIVc2ICHwrHzu9qqY+AMj0Ud
 sA+kpb9o5zeim0RVFvfjaTg75ki8JoBrqDmGegpidX5rqPF9BpesumS8NI2udqXEBStWI4
X-Google-Smtp-Source: AGHT+IEwhpzpbutxcSFXZMLWPGgvdTBRCn78tGwOj7IZhNrS+hZ8IxpcNZHWAUSqv1MI4HUnh3hlrQ==
X-Received: by 2002:a17:907:dab:b0:b07:87f1:fc42 with SMTP id
 a640c23a62f3a-b7d217ed7d2mr1308406266b.16.1765808266933; 
 Mon, 15 Dec 2025 06:17:46 -0800 (PST)
Received: from localhost (ip-046-005-122-062.um12.pools.vodafone-ip.de.
 [46.5.122.62]) by smtp.gmail.com with UTF8SMTPSA id
 a640c23a62f3a-b7fbd7a55dfsm554177066b.25.2025.12.15.06.17.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Dec 2025 06:17:46 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Jens Wiklander <jens.wiklander@linaro.org>,
 Ard Biesheuvel <ardb@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Sumit Garg <sumit.garg@oss.qualcomm.com>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Jan Kiszka <jan.kiszka@siemens.com>,
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Date: Mon, 15 Dec 2025 15:16:38 +0100
Message-ID: <6a56ee61e485703d548e9e44d53b2920b4e43ca6.1765791463.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1765791463.git.u.kleine-koenig@baylibre.com>
References: <cover.1765791463.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1393;
 i=u.kleine-koenig@baylibre.com; h=from:subject:message-id;
 bh=yB7VDr3EZSkvb6JHyGDNmAwFJZy2w/A1L0P7+9qGdqk=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBpQBhgZ97MgwPHXb+Xx9vet2pJx/fRw7XXThLnp
 2crAvT8GvSJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaUAYYAAKCRCPgPtYfRL+
 ToTlCACS5iflL8JzBfIHFC4dd9QU1VLCJ23/o3MwueoTbG3c0T+3+Ab5eAFzodoVurAYliob5pu
 dCvIygjW7D5m9ySrn4/XgKkHiY54AGvSbmsSNrVesGd4oFJGf3Nbo3TsaUZZWYnmY0+ypytx3sC
 jYoNu+MOi8Cr8BnQTHvWqdqh3lzQzJ8TOJIedFd0Wdh/LeHfoC6mf8mhe6wrufJ5R6QAS3sVl5y
 1KnEG5sqI8XvYvgx261qZIjrxPtBeaWahLjOKNLFkGpC7HWMfBbAVP8nVWNbNXWRUZ3IVjMiJlW
 5seuM+gr+TKUjwts24xtV5LeZbaCTzjo6uZIsnOl+ujpHHdr
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Cc: linux-arm-kernel@lists.infradead.org, linux-efi@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, op-tee@lists.trustedfirmware.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH v2 08/17] efi: stmm: Make use of
	module_tee_client_driver()
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

UmVkdWNlIGJvaWxlcnBsYXRlIGJ5IHVzaW5nIHRoZSBuZXdseSBpbnRyb2R1Y2VkIG1vZHVsZV90
ZWVfY2xpZW50X2RyaXZlcigpLgpUaGF0IHRha2VzIGNhcmUgb2YgYXNzaWduaW5nIHRoZSBkcml2
ZXIncyBidXMsIHNvIHRoZSBleHBsaWNpdCBhc3NpZ25pbmcKaW4gdGhpcyBkcml2ZXIgY2FuIGJl
IGRyb3BwZWQuCgpSZXZpZXdlZC1ieTogU3VtaXQgR2FyZyA8c3VtaXQuZ2FyZ0Bvc3MucXVhbGNv
bW0uY29tPgpTaWduZWQtb2ZmLWJ5OiBVd2UgS2xlaW5lLUvDtm5pZyA8dS5rbGVpbmUta29lbmln
QGJheWxpYnJlLmNvbT4KLS0tCiBkcml2ZXJzL2Zpcm13YXJlL2VmaS9zdG1tL3RlZV9zdG1tX2Vm
aS5jIHwgMTQgKy0tLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwg
MTMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9maXJtd2FyZS9lZmkvc3RtbS90
ZWVfc3RtbV9lZmkuYyBiL2RyaXZlcnMvZmlybXdhcmUvZWZpL3N0bW0vdGVlX3N0bW1fZWZpLmMK
aW5kZXggNjVjMGZlMWJhMjc1Li41OTAzODExODU4YjYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZmly
bXdhcmUvZWZpL3N0bW0vdGVlX3N0bW1fZWZpLmMKKysrIGIvZHJpdmVycy9maXJtd2FyZS9lZmkv
c3RtbS90ZWVfc3RtbV9lZmkuYwpAQCAtNTg0LDI0ICs1ODQsMTIgQEAgc3RhdGljIHN0cnVjdCB0
ZWVfY2xpZW50X2RyaXZlciB0ZWVfc3RtbV9lZmlfZHJpdmVyID0gewogCS5pZF90YWJsZQk9IHRl
ZV9zdG1tX2VmaV9pZF90YWJsZSwKIAkuZHJpdmVyCQk9IHsKIAkJLm5hbWUJCT0gInRlZS1zdG1t
LWVmaSIsCi0JCS5idXMJCT0gJnRlZV9idXNfdHlwZSwKIAkJLnByb2JlCQk9IHRlZV9zdG1tX2Vm
aV9wcm9iZSwKIAkJLnJlbW92ZQkJPSB0ZWVfc3RtbV9lZmlfcmVtb3ZlLAogCX0sCiB9OwogCi1z
dGF0aWMgaW50IF9faW5pdCB0ZWVfc3RtbV9lZmlfbW9kX2luaXQodm9pZCkKLXsKLQlyZXR1cm4g
ZHJpdmVyX3JlZ2lzdGVyKCZ0ZWVfc3RtbV9lZmlfZHJpdmVyLmRyaXZlcik7Ci19Ci0KLXN0YXRp
YyB2b2lkIF9fZXhpdCB0ZWVfc3RtbV9lZmlfbW9kX2V4aXQodm9pZCkKLXsKLQlkcml2ZXJfdW5y
ZWdpc3RlcigmdGVlX3N0bW1fZWZpX2RyaXZlci5kcml2ZXIpOwotfQotCi1tb2R1bGVfaW5pdCh0
ZWVfc3RtbV9lZmlfbW9kX2luaXQpOwotbW9kdWxlX2V4aXQodGVlX3N0bW1fZWZpX21vZF9leGl0
KTsKK21vZHVsZV90ZWVfY2xpZW50X2RyaXZlcih0ZWVfc3RtbV9lZmlfZHJpdmVyKTsKIAogTU9E
VUxFX0xJQ0VOU0UoIkdQTCIpOwogTU9EVUxFX0FVVEhPUigiSWxpYXMgQXBhbG9kaW1hcyA8aWxp
YXMuYXBhbG9kaW1hc0BsaW5hcm8ub3JnPiIpOwotLSAKMi40Ny4zCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QK
TGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1h
aWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
