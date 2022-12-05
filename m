Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AD8AC6429DF
	for <lists+linux-stm32@lfdr.de>; Mon,  5 Dec 2022 14:52:12 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6BF80C65E6C;
	Mon,  5 Dec 2022 13:52:12 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E642AC6507A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 Dec 2022 13:52:10 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 125-20020a1c0283000000b003d076ee89d6so9122285wmc.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 05 Dec 2022 05:52:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=M8Z/CuSU+65/xoefFvoUYNSAqkT5w7zFjiS9CzpEsgo=;
 b=wsgdxTuhatf3mw1TVkJQeXcqLfocJhxhj74YDevQF9YeRF3dfceSwSOa7IojVzyb7L
 B5YvTchNNBM8QERb8Z7fZ00Jr+oRZR0N/NuKpDCFANoDerZjz9ZdYHt82uWhTHHbAOCQ
 vXVW0fi+9ldGrDVOsSuL8bIFpJXG8/m/TfObyMHBcJ8DmBJ1sTkaZf1o5lOuo3ghvqsi
 ZPcAfUwmTSACNF3BiQwmC2Prh5kU/b4NT3DCQd1ANXM4wBVZdEuaevnv+aFsnxuVEiWy
 ebRpiQCTG3e/og2yEhXh3KrXQQVDdzNur2s96I56dkMdMoZRBpPh53XbFOQXhbNr8WYf
 clNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=M8Z/CuSU+65/xoefFvoUYNSAqkT5w7zFjiS9CzpEsgo=;
 b=OJ8ATgs4MDZD8tZ9aTlkGSiKo5n1SjR0gB5//68cL8ScR8YKftMUxPR5fYr28Sdsnn
 rIjC0RSddsg66uMOUIzOrsOiAmVttTz86cGCiUI1AXMiTqO3gtbE0rRAMAtpBiONbLFg
 PYbfQqjCoGeI/TiWW/6GgJ9HHBwd9IPPsoziz26TIMUSckf9P7MU7hU25mB0DtByzxqr
 RxLaF9lBd8iz/QYva3bkHqV4y6VTrGRS1P7IvG4gZoa/Az0JDQ+qcp5xe0HEGKhDyD7q
 fDqzm1C0bUMPBBWAfpc9MBi4/V8zaJJj+PhFJrrrVFkxM4OojpPByC/2yexejTKjb9Yu
 HDzQ==
X-Gm-Message-State: ANoB5pkLbPXZjf9nQ2jLg+oDZ1v1q4aVdn6xll+I++NF1Y6D+124h8vx
 5Jyw+A4CGfCwUdwywUOA8VWJEg==
X-Google-Smtp-Source: AA0mqf52PvQXYzT5vaPuTGBXNCz91Q2KV0iCLC9fNEbt3klSJRTAtpx67PD5xqTxQIpCyNL0zdkknw==
X-Received: by 2002:a05:600c:350a:b0:3d0:74be:a059 with SMTP id
 h10-20020a05600c350a00b003d074bea059mr16204523wmq.177.1670248330589; 
 Mon, 05 Dec 2022 05:52:10 -0800 (PST)
Received: from predatorhelios.baylibre
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id
 a3-20020adffac3000000b0024245e543absm9012700wrs.88.2022.12.05.05.52.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Dec 2022 05:52:10 -0800 (PST)
From: =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>
To: devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, krzysztof.kozlowski@linaro.org,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 khilman@baylibre.com, linux-gpio@vger.kernel.org
Date: Mon,  5 Dec 2022 14:51:57 +0100
Message-Id: <20221205135158.1842465-3-bero@baylibre.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221205135158.1842465-1-bero@baylibre.com>
References: <20221205135158.1842465-1-bero@baylibre.com>
MIME-Version: 1.0
Subject: [Linux-stm32] [PATCH v4 2/3] ARM: dts: mediatek: Remove
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

UmVtb3ZlIHRoZSB1bm5lY2Vzc2FyeSBwaW5zLWFyZS1udW1iZXJlZCBwcm9wZXJ0eSBmcm9tCk1l
ZGlhdGVrIEFSTSBEZXZpY2VUcmVlcwoKU2lnbmVkLW9mZi1ieTogQmVybmhhcmQgUm9zZW5rcsOk
bnplciA8YmVyb0BiYXlsaWJyZS5jb20+ClJldmlld2VkLWJ5OiBBbmdlbG9HaW9hY2NoaW5vIERl
bCBSZWdubyA8YW5nZWxvZ2lvYWNjaGluby5kZWxyZWdub0Bjb2xsYWJvcmEuY29tPgpBY2tlZC1i
eTogS2V2aW4gSGlsbWFuIDxraGlsbWFuQGJheWxpYnJlLmNvbT4KLS0tCiBhcmNoL2FybS9ib290
L2R0cy9tdDI3MDEuZHRzaSB8IDEgLQogYXJjaC9hcm0vYm9vdC9kdHMvbXQ3NjIzLmR0c2kgfCAx
IC0KIGFyY2gvYXJtL2Jvb3QvZHRzL210ODEzNS5kdHNpIHwgMSAtCiAzIGZpbGVzIGNoYW5nZWQs
IDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vYm9vdC9kdHMvbXQyNzAxLmR0
c2kgYi9hcmNoL2FybS9ib290L2R0cy9tdDI3MDEuZHRzaQppbmRleCBiOGViYTNiYTE1M2MyLi4w
YTBmZThjNWE0MDU5IDEwMDY0NAotLS0gYS9hcmNoL2FybS9ib290L2R0cy9tdDI3MDEuZHRzaQor
KysgYi9hcmNoL2FybS9ib290L2R0cy9tdDI3MDEuZHRzaQpAQCAtMTc4LDcgKzE3OCw2IEBAIHBp
bzogcGluY3RybEAxMDAwYjAwMCB7CiAJCWNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQyNzAxLXBp
bmN0cmwiOwogCQlyZWcgPSA8MCAweDEwMDBiMDAwIDAgMHgxMDAwPjsKIAkJbWVkaWF0ZWsscGN0
bC1yZWdtYXAgPSA8JnN5c2NmZ19wY3RsX2E+OwotCQlwaW5zLWFyZS1udW1iZXJlZDsKIAkJZ3Bp
by1jb250cm9sbGVyOwogCQkjZ3Bpby1jZWxscyA9IDwyPjsKIAkJaW50ZXJydXB0LWNvbnRyb2xs
ZXI7CmRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9tdDc2MjMuZHRzaSBiL2FyY2gvYXJt
L2Jvb3QvZHRzL210NzYyMy5kdHNpCmluZGV4IDI1ZDMxZTQwYTU1MzUuLjExMzc5YzNlNmI0Y2Eg
MTAwNjQ0Ci0tLSBhL2FyY2gvYXJtL2Jvb3QvZHRzL210NzYyMy5kdHNpCisrKyBiL2FyY2gvYXJt
L2Jvb3QvZHRzL210NzYyMy5kdHNpCkBAIC0yNTMsNyArMjUzLDYgQEAgcGlvOiBwaW5jdHJsQDEw
MDA1MDAwIHsKIAkJY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDc2MjMtcGluY3RybCI7CiAJCXJl
ZyA9IDwwIDB4MTAwMGIwMDAgMCAweDEwMDA+OwogCQltZWRpYXRlayxwY3RsLXJlZ21hcCA9IDwm
c3lzY2ZnX3BjdGxfYT47Ci0JCXBpbnMtYXJlLW51bWJlcmVkOwogCQlncGlvLWNvbnRyb2xsZXI7
CiAJCSNncGlvLWNlbGxzID0gPDI+OwogCQlpbnRlcnJ1cHQtY29udHJvbGxlcjsKZGlmZiAtLWdp
dCBhL2FyY2gvYXJtL2Jvb3QvZHRzL210ODEzNS5kdHNpIGIvYXJjaC9hcm0vYm9vdC9kdHMvbXQ4
MTM1LmR0c2kKaW5kZXggYTAzMWIzNjM2MzE4Ny4uMGYyOTFhZDIyZDNhZiAxMDA2NDQKLS0tIGEv
YXJjaC9hcm0vYm9vdC9kdHMvbXQ4MTM1LmR0c2kKKysrIGIvYXJjaC9hcm0vYm9vdC9kdHMvbXQ4
MTM1LmR0c2kKQEAgLTE1Miw3ICsxNTIsNiBAQCBwaW86IHBpbmN0cmxAMTAwMDUwMDAgewogCQkJ
Y29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDgxMzUtcGluY3RybCI7CiAJCQlyZWcgPSA8MCAweDEw
MDBiMDAwIDAgMHgxMDAwPjsKIAkJCW1lZGlhdGVrLHBjdGwtcmVnbWFwID0gPCZzeXNjZmdfcGN0
bF9hICZzeXNjZmdfcGN0bF9iPjsKLQkJCXBpbnMtYXJlLW51bWJlcmVkOwogCQkJZ3Bpby1jb250
cm9sbGVyOwogCQkJI2dwaW8tY2VsbHMgPSA8Mj47CiAJCQlpbnRlcnJ1cHQtY29udHJvbGxlcjsK
LS0gCjIuMzguMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4v
bGlzdGluZm8vbGludXgtc3RtMzIK
