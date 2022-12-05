Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B48B06429E0
	for <lists+linux-stm32@lfdr.de>; Mon,  5 Dec 2022 14:52:13 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7B499C65E69;
	Mon,  5 Dec 2022 13:52:13 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CDAF6C6507A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 Dec 2022 13:52:11 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id y16so18701485wrm.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 05 Dec 2022 05:52:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=3uc9R8Uf/pCe2qvKF4aFF/8KuZBFNDVNUUa6PyIFKSQ=;
 b=RkjkX1iZ5R0Yaqz0WAQr37pobuFT+aJMIBmxyWhCn6lx6BNIMq1ZuMmZIi5eq7x44P
 fI58BD0j/5M2j/PhK/mv6zK5XSPQDLjr6cFSQp7/290ryoDIthzp7GH6pCqbcq33Czws
 tu72Agr5scZe48h6R/exhLO7qC5J7LJHAdfIpgHSs/TOAB91haaBQlcCdornhma56CwQ
 ycTatCKwkajBhUQxSrgwuayQvqRmJiKpekpHKYhpb1GxoDvybMyrHy6uIu+xb5lkoK2+
 FovoXA66R3UESptREd5ICtcrnTOQjuIuFFfqsAAV8nHpPZfoa2l91ZG/fM1sUtWdxAEz
 1lXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3uc9R8Uf/pCe2qvKF4aFF/8KuZBFNDVNUUa6PyIFKSQ=;
 b=NO4I4Qd+ua+kkdRAver58WsoiHVFTd4ummWp5toV6KpZ7QZUfHj/LMUp/rbLTC0gpJ
 G6wDabyGJGPC5KNDVSG3VRJwppuKHguDDgdXm8YCclt3rUahtMSvvZFm0mX3Iz7sgc0N
 jdf04LU/RceiMyUmLmmPMLf81RBuEpghMfKucoejmQBRR+kpWoQMBr3xx5LjEKKtxfvW
 UjXlGedHeZd1blNHrY9rSgq5hyqDfBPd83F7NeYBJYRfkHkDv/Loo8yhayoGEzTwFLKh
 92O1N/drFN204wrhYtdOuquhqdjji7EcjdBWyikuEjwlOllnO1eKFGHD2AqITzxPsdV7
 jozA==
X-Gm-Message-State: ANoB5pk+EVsPWOGhmyHpmlRcjQaol/rsABJlvhKO/8xrydZcAgGRAB3j
 K1de+wJojPRj3TevFBLD5ADbbvr7dcLpAEOOfvCAHQ==
X-Google-Smtp-Source: AA0mqf5FPRwt19PLh2T1fJ+ixYYqormZd+LI8rffdiI7G4LLSJQHjGxKOWRYJ5cKOJWEYhztpWv1xA==
X-Received: by 2002:adf:fec6:0:b0:242:4697:d828 with SMTP id
 q6-20020adffec6000000b002424697d828mr8422358wrs.494.1670248331460; 
 Mon, 05 Dec 2022 05:52:11 -0800 (PST)
Received: from predatorhelios.baylibre
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id
 a3-20020adffac3000000b0024245e543absm9012700wrs.88.2022.12.05.05.52.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Dec 2022 05:52:11 -0800 (PST)
From: =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>
To: devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, krzysztof.kozlowski@linaro.org,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 khilman@baylibre.com, linux-gpio@vger.kernel.org
Date: Mon,  5 Dec 2022 14:51:58 +0100
Message-Id: <20221205135158.1842465-4-bero@baylibre.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221205135158.1842465-1-bero@baylibre.com>
References: <20221205135158.1842465-1-bero@baylibre.com>
MIME-Version: 1.0
Subject: [Linux-stm32] [PATCH v4 3/3] ARM: dts: stm32: Remove the
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
LmNvbT4KUmV2aWV3ZWQtYnk6IE1hdHRoaWFzIEJydWdnZXIgPG1hdHRoaWFzLmJnZ0BnbWFpbC5j
b20+Ci0tLQogYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJmNC1waW5jdHJsLmR0c2kgfCAxIC0KIGFy
Y2gvYXJtL2Jvb3QvZHRzL3N0bTMyZjctcGluY3RybC5kdHNpIHwgMSAtCiBhcmNoL2FybS9ib290
L2R0cy9zdG0zMmg3NDMuZHRzaSAgICAgICB8IDEgLQogYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJt
cDEzMS5kdHNpICAgICAgfCAxIC0KIGFyY2gvYXJtL2Jvb3QvZHRzL3N0bTMybXAxNTEuZHRzaSAg
ICAgIHwgMiAtLQogNSBmaWxlcyBjaGFuZ2VkLCA2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L2FyY2gvYXJtL2Jvb3QvZHRzL3N0bTMyZjQtcGluY3RybC5kdHNpIGIvYXJjaC9hcm0vYm9vdC9k
dHMvc3RtMzJmNC1waW5jdHJsLmR0c2kKaW5kZXggNTAwYmNjMzAyZDQyMi4uNDUyM2M2MzQ3NWU0
YyAxMDA2NDQKLS0tIGEvYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJmNC1waW5jdHJsLmR0c2kKKysr
IGIvYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJmNC1waW5jdHJsLmR0c2kKQEAgLTUxLDcgKzUxLDYg
QEAgcGluY3RybDogcGluY3RybEA0MDAyMDAwMCB7CiAJCQlyYW5nZXMgPSA8MCAweDQwMDIwMDAw
IDB4MzAwMD47CiAJCQlpbnRlcnJ1cHQtcGFyZW50ID0gPCZleHRpPjsKIAkJCXN0LHN5c2NmZyA9
IDwmc3lzY2ZnIDB4OD47Ci0JCQlwaW5zLWFyZS1udW1iZXJlZDsKIAogCQkJZ3Bpb2E6IGdwaW9A
NDAwMjAwMDAgewogCQkJCWdwaW8tY29udHJvbGxlcjsKZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jv
b3QvZHRzL3N0bTMyZjctcGluY3RybC5kdHNpIGIvYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJmNy1w
aW5jdHJsLmR0c2kKaW5kZXggOGYzN2FlZmE3MzE1MC4uYzhlNmM1MmZiMjQ4ZSAxMDA2NDQKLS0t
IGEvYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJmNy1waW5jdHJsLmR0c2kKKysrIGIvYXJjaC9hcm0v
Ym9vdC9kdHMvc3RtMzJmNy1waW5jdHJsLmR0c2kKQEAgLTE1LDcgKzE1LDYgQEAgcGluY3RybDog
cGluY3RybEA0MDAyMDAwMCB7CiAJCQlyYW5nZXMgPSA8MCAweDQwMDIwMDAwIDB4MzAwMD47CiAJ
CQlpbnRlcnJ1cHQtcGFyZW50ID0gPCZleHRpPjsKIAkJCXN0LHN5c2NmZyA9IDwmc3lzY2ZnIDB4
OD47Ci0JCQlwaW5zLWFyZS1udW1iZXJlZDsKIAogCQkJZ3Bpb2E6IGdwaW9ANDAwMjAwMDAgewog
CQkJCWdwaW8tY29udHJvbGxlcjsKZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jvb3QvZHRzL3N0bTMy
aDc0My5kdHNpIGIvYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJoNzQzLmR0c2kKaW5kZXggMjhlM2Rl
YjIwZTFlMS4uZjMwNzk2ZjdhZGYzNiAxMDA2NDQKLS0tIGEvYXJjaC9hcm0vYm9vdC9kdHMvc3Rt
MzJoNzQzLmR0c2kKKysrIGIvYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJoNzQzLmR0c2kKQEAgLTU4
OCw3ICs1ODgsNiBAQCBwaW5jdHJsOiBwaW5jdHJsQDU4MDIwMDAwIHsKIAkJCXJhbmdlcyA9IDww
IDB4NTgwMjAwMDAgMHgzMDAwPjsKIAkJCWludGVycnVwdC1wYXJlbnQgPSA8JmV4dGk+OwogCQkJ
c3Qsc3lzY2ZnID0gPCZzeXNjZmcgMHg4PjsKLQkJCXBpbnMtYXJlLW51bWJlcmVkOwogCiAJCQln
cGlvYTogZ3Bpb0A1ODAyMDAwMCB7CiAJCQkJZ3Bpby1jb250cm9sbGVyOwpkaWZmIC0tZ2l0IGEv
YXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJtcDEzMS5kdHNpIGIvYXJjaC9hcm0vYm9vdC9kdHMvc3Rt
MzJtcDEzMS5kdHNpCmluZGV4IGFjY2MzODI0ZjdlOTguLjZiODZlMDMxZjYwZTYgMTAwNjQ0Ci0t
LSBhL2FyY2gvYXJtL2Jvb3QvZHRzL3N0bTMybXAxMzEuZHRzaQorKysgYi9hcmNoL2FybS9ib290
L2R0cy9zdG0zMm1wMTMxLmR0c2kKQEAgLTU0Nyw3ICs1NDcsNiBAQCBwaW5jdHJsOiBwaW5jdHJs
QDUwMDAyMDAwIHsKIAkJCXJhbmdlcyA9IDwwIDB4NTAwMDIwMDAgMHg4NDAwPjsKIAkJCWludGVy
cnVwdC1wYXJlbnQgPSA8JmV4dGk+OwogCQkJc3Qsc3lzY2ZnID0gPCZleHRpIDB4NjAgMHhmZj47
Ci0JCQlwaW5zLWFyZS1udW1iZXJlZDsKIAogCQkJZ3Bpb2E6IGdwaW9ANTAwMDIwMDAgewogCQkJ
CWdwaW8tY29udHJvbGxlcjsKZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jvb3QvZHRzL3N0bTMybXAx
NTEuZHRzaSBiL2FyY2gvYXJtL2Jvb3QvZHRzL3N0bTMybXAxNTEuZHRzaQppbmRleCA1NDkxYjZj
NGRlYzIwLi40ZTQzN2QzZjJlZDY2IDEwMDY0NAotLS0gYS9hcmNoL2FybS9ib290L2R0cy9zdG0z
Mm1wMTUxLmR0c2kKKysrIGIvYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJtcDE1MS5kdHNpCkBAIC0x
NjYwLDcgKzE2NjAsNiBAQCBwaW5jdHJsOiBwaW5jdHJsQDUwMDAyMDAwIHsKIAkJCXJhbmdlcyA9
IDwwIDB4NTAwMDIwMDAgMHhhNDAwPjsKIAkJCWludGVycnVwdC1wYXJlbnQgPSA8JmV4dGk+Owog
CQkJc3Qsc3lzY2ZnID0gPCZleHRpIDB4NjAgMHhmZj47Ci0JCQlwaW5zLWFyZS1udW1iZXJlZDsK
IAogCQkJZ3Bpb2E6IGdwaW9ANTAwMDIwMDAgewogCQkJCWdwaW8tY29udHJvbGxlcjsKQEAgLTE3
ODksNyArMTc4OCw2IEBAIHBpbmN0cmxfejogcGluY3RybEA1NDAwNDAwMCB7CiAJCQkjc2l6ZS1j
ZWxscyA9IDwxPjsKIAkJCWNvbXBhdGlibGUgPSAic3Qsc3RtMzJtcDE1Ny16LXBpbmN0cmwiOwog
CQkJcmFuZ2VzID0gPDAgMHg1NDAwNDAwMCAweDQwMD47Ci0JCQlwaW5zLWFyZS1udW1iZXJlZDsK
IAkJCWludGVycnVwdC1wYXJlbnQgPSA8JmV4dGk+OwogCQkJc3Qsc3lzY2ZnID0gPCZleHRpIDB4
NjAgMHhmZj47CiAKLS0gCjIuMzguMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1k
LW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHku
Y29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
