Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 77A2D6331E3
	for <lists+linux-stm32@lfdr.de>; Tue, 22 Nov 2022 02:08:15 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 38214C65E49;
	Tue, 22 Nov 2022 01:08:15 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ED88BC6507B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Nov 2022 01:08:10 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id l11so18601940edb.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Nov 2022 17:08:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6dAFpXKIv4puqT755UmrarGTxUh3Es/8fltMsnQhNuw=;
 b=OoAvwrY7aemhhCyOJ9zQyu3xRAr62IjaFsmbLb3fhhmH+xw8SG9fVcwZKDhk2dVyiH
 qGK0hUbZ1vbtWqMiU87Kl7du7cyN7qxXi+f5sMP+2tLCthMcvSqwIkIiUSF5r0aLyk9y
 P+rLandzlleGuR/xZ2MHheYFu+VH+3AcQrKEp+Tdr1yr0F7nrpo+py4BVMA/G5jy+kah
 rmjBihFvkwg9DaPgynNHvsj0DUvIA2WZ8vBalDIef7sOG2bdn0teap8OsSqCGfvrG8M5
 7z+vsuW83jb1yBrInRXoUWigvsJiVR46DnaRWoXyJSxV6KCFm8vPkuYvQ66zl4BvTerz
 o16w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6dAFpXKIv4puqT755UmrarGTxUh3Es/8fltMsnQhNuw=;
 b=TnszzqGaT3dISUHQzHn+KNkhkWB2XJBiKHzGPHGwRa9JuCaot1xAPZHAHppCRKpLe8
 Pj56UIXb9cthhbse7MXFmpLGQrlefa3U2H/NvASDlFO8WqMW4QuANmy6Pqq/ObTmdSDu
 lna+SlUBhgUEyyBtle+QpIhUjmU/LQenNPBBnHBYFYN2QDQSoKaBkyuIx3pOszN48Iq7
 usbV6aTcH9EvIWp9EZBga7gyu9AhObO1v4MiZas3lZcMr5C3XBCAJA/Xw6f0vHzMbK0H
 5AZo5k49d9wJlm9HvN4Ku8O8wrrNfuk0lvnxh5hoIHIpGMihJE53FRLTasmQDJf4TSQT
 nfTg==
X-Gm-Message-State: ANoB5pl3hd36QEnSuHzT4nfJX+CSc6DZiOBeOq8xUMbkJ5Vt6ipqcxK3
 bOax2/UblL5SLSqpWlNF/PtMRA==
X-Google-Smtp-Source: AA0mqf6g+E2Xe8Q5GHhLbNsGIt7qeLTBsdEBE9OD1a0hhvSG2woUFOOuUnVrId7WZa7SPT0HgCLPFg==
X-Received: by 2002:aa7:dc0c:0:b0:461:6f87:20bb with SMTP id
 b12-20020aa7dc0c000000b004616f8720bbmr18692156edu.300.1669079290461; 
 Mon, 21 Nov 2022 17:08:10 -0800 (PST)
Received: from c64.fritz.box ([2a01:2a8:8108:8301:7643:bec8:f62b:b074])
 by smtp.gmail.com with ESMTPSA id
 f13-20020a1709064dcd00b007030c97ae62sm5514683ejw.191.2022.11.21.17.08.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Nov 2022 17:08:10 -0800 (PST)
From: =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>
To: devicetree@vger.kernel.org
Date: Tue, 22 Nov 2022 02:07:49 +0100
Message-Id: <20221122010753.3126828-4-bero@baylibre.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221122010753.3126828-1-bero@baylibre.com>
References: <20221122010753.3126828-1-bero@baylibre.com>
MIME-Version: 1.0
Cc: khilman@baylibre.com, linux-kernel@vger.kernel.org,
 krzysztof.kozlowski@linaro.org, linux-mediatek@lists.infradead.org,
 mcoquelin.stm32@gmail.com, matthias.bgg@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com
Subject: [Linux-stm32] [PATCH v2 3/7] dt-bindings: pinctrl: mediatek,
	mt65xx: Deprecate pins-are-numbered
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

TWFrZSBwaW5zLWFyZS1udW1iZXJlZCBvcHRpb25hbCBhbmQgZGVwcmVjYXRlIGl0CgpTaWduZWQt
b2ZmLWJ5OiBCZXJuaGFyZCBSb3Nlbmtyw6RuemVyIDxiZXJvQGJheWxpYnJlLmNvbT4KLS0tCiAu
Li4vZGV2aWNldHJlZS9iaW5kaW5ncy9waW5jdHJsL21lZGlhdGVrLG10NjV4eC1waW5jdHJsLnlh
bWwgfCA1ICsrLS0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9waW5j
dHJsL21lZGlhdGVrLG10NjV4eC1waW5jdHJsLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvcGluY3RybC9tZWRpYXRlayxtdDY1eHgtcGluY3RybC55YW1sCmluZGV4IDMz
YjVmNzllNzQxYWIuLjFiNDQzMzViMWU5NDcgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9waW5jdHJsL21lZGlhdGVrLG10NjV4eC1waW5jdHJsLnlhbWwKKysr
IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BpbmN0cmwvbWVkaWF0ZWssbXQ2
NXh4LXBpbmN0cmwueWFtbApAQCAtMzEsNyArMzEsOCBAQCBwcm9wZXJ0aWVzOgogICBwaW5zLWFy
ZS1udW1iZXJlZDoKICAgICAkcmVmOiAvc2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy9m
bGFnCiAgICAgZGVzY3JpcHRpb246IHwKLSAgICAgIFNwZWNpZnkgdGhlIHN1Ym5vZGVzIGFyZSB1
c2luZyBudW1iZXJlZCBwaW5tdXggdG8gc3BlY2lmeSBwaW5zLgorICAgICAgU3BlY2lmeSB0aGUg
c3Vibm9kZXMgYXJlIHVzaW5nIG51bWJlcmVkIHBpbm11eCB0byBzcGVjaWZ5IHBpbnMuIChVTlVT
RUQpCisgICAgZGVwcmVjYXRlZDogdHJ1ZQogCiAgIGdwaW8tY29udHJvbGxlcjogdHJ1ZQogCkBA
IC02Miw3ICs2Myw2IEBAIHByb3BlcnRpZXM6CiAKIHJlcXVpcmVkOgogICAtIGNvbXBhdGlibGUK
LSAgLSBwaW5zLWFyZS1udW1iZXJlZAogICAtIGdwaW8tY29udHJvbGxlcgogICAtICIjZ3Bpby1j
ZWxscyIKIApAQCAtMTUwLDcgKzE1MCw2IEBAIGV4YW1wbGVzOgogICAgICAgICAgIGNvbXBhdGli
bGUgPSAibWVkaWF0ZWssbXQ4MTM1LXBpbmN0cmwiOwogICAgICAgICAgIHJlZyA9IDwwIDB4MTAw
MEIwMDAgMCAweDEwMDA+OwogICAgICAgICAgIG1lZGlhdGVrLHBjdGwtcmVnbWFwID0gPCZzeXNj
ZmdfcGN0bF9hPiwgPCZzeXNjZmdfcGN0bF9iPjsKLSAgICAgICAgICBwaW5zLWFyZS1udW1iZXJl
ZDsKICAgICAgICAgICBncGlvLWNvbnRyb2xsZXI7CiAgICAgICAgICAgI2dwaW8tY2VsbHMgPSA8
Mj47CiAgICAgICAgICAgaW50ZXJydXB0LWNvbnRyb2xsZXI7Ci0tIAoyLjM4LjEKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxp
bmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8v
c3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMy
Cg==
