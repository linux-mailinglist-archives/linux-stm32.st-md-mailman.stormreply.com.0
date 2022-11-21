Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 80C6C631A9D
	for <lists+linux-stm32@lfdr.de>; Mon, 21 Nov 2022 08:49:14 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 42480C65E56;
	Mon, 21 Nov 2022 07:49:14 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A8A7FC65052
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Nov 2022 01:55:11 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id f27so25438847eje.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 20 Nov 2022 17:55:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NoxTVndE6utEsycgOunzP3TlGL6F5OaVH50FoV3RT0w=;
 b=c8RklIxEnH+bwi8XLTfM85hE6aBFPgxxuk5SRbLV4GnTAc9I1o66ZPMCRqd5G44t8S
 FFLLsr7cdGMGO+muPHBrsAcDZcTy0X3y0UR7DV7gl3ExGa7m3mzUX0GzJz1qfZFMvxNV
 Hti/gyCQ6giO7W0G4LOdzuNyq7BDC4HdLLdaEUCCwA00SGOMgwbGxe8ouBJvXmI22iR8
 w7dDQbDWshTUDS75xIZlGmgBeSrQhdphVUO4efjj0X0G605d3tX/6MVCi1/a8qbymqi0
 fgmJSKJQKrixDOyuPPWCHYRIHLuZZCdJGWDa9cxy89rPTTMv2hU3Zyodk45jBvrhkK5E
 nvmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NoxTVndE6utEsycgOunzP3TlGL6F5OaVH50FoV3RT0w=;
 b=QqJd2VuL4h0efK77gQZiec4Q75SI9PEgobrl0QwP+Ys5thSPGyTFSlniVEbMmMaoWi
 4ZHlzup++PPMgZfjHYgUVHKVqvmSFIwZQDniTWTcxTsGUkxu5BwKaRprZKUpWislG97K
 c83DlHI/1vkgiglIQPyVQdFQ4y+fWxpUXpbbkuDdprk1ZKGoscbTpK25838vVmKC7JCE
 Q2S+ka7dZ3o0/Td9nnzG3OyPvKR2vwTxNHIHBTZe+OMd/zfcmd1JTgsuusMqK/X15D7D
 05jRbBdpPBDcWm1UMQMarqgE+LCGdDtZyJUJ70XIF9NUeo+VDf7u8aP38GRPwiJlOLHa
 wPpg==
X-Gm-Message-State: ANoB5pmMMaB4Y5DCv5kSZbVKdA+K9apZ1ABPCs3AC5CqU1328asDgqZj
 c/eGhMPrpP0V07dhdoIipXumIQ==
X-Google-Smtp-Source: AA0mqf5Iqh1KYyEXUYiziJt2kTgwKqDfHW88f2Xpo6/pLRnXD2QGrPnKm2FyiFj0g7dD6P3SWqd7zQ==
X-Received: by 2002:a17:906:35c8:b0:78d:3a04:e41d with SMTP id
 p8-20020a17090635c800b0078d3a04e41dmr14088753ejb.39.1668995711474; 
 Sun, 20 Nov 2022 17:55:11 -0800 (PST)
Received: from c64.fritz.box ([2a01:2a8:8108:8301:7643:bec8:f62b:b074])
 by smtp.gmail.com with ESMTPSA id
 g2-20020a170906538200b00782e3cf7277sm4415513ejo.120.2022.11.20.17.55.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Nov 2022 17:55:11 -0800 (PST)
From: =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>
To: devicetree@vger.kernel.org
Date: Mon, 21 Nov 2022 02:54:48 +0100
Message-Id: <20221121015451.2471196-7-bero@baylibre.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221121015451.2471196-1-bero@baylibre.com>
References: <20221121015451.2471196-1-bero@baylibre.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 21 Nov 2022 07:49:11 +0000
Cc: khilman@baylibre.com, krzysztof.kozlowski@linaro.org,
 linux-mediatek@lists.infradead.org, mcoquelin.stm32@gmail.com,
 matthias.bgg@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 6/9] ARM: dts: mediatek: Remove
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
bnplciA8YmVyb0BiYXlsaWJyZS5jb20+Ci0tLQogYXJjaC9hcm0vYm9vdC9kdHMvbXQyNzAxLmR0
c2kgfCAxIC0KIGFyY2gvYXJtL2Jvb3QvZHRzL210NzYyMy5kdHNpIHwgMSAtCiBhcmNoL2FybS9i
b290L2R0cy9tdDgxMzUuZHRzaSB8IDEgLQogMyBmaWxlcyBjaGFuZ2VkLCAzIGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jvb3QvZHRzL210MjcwMS5kdHNpIGIvYXJjaC9hcm0v
Ym9vdC9kdHMvbXQyNzAxLmR0c2kKaW5kZXggYjhlYmEzYmExNTNjMi4uMGEwZmU4YzVhNDA1OSAx
MDA2NDQKLS0tIGEvYXJjaC9hcm0vYm9vdC9kdHMvbXQyNzAxLmR0c2kKKysrIGIvYXJjaC9hcm0v
Ym9vdC9kdHMvbXQyNzAxLmR0c2kKQEAgLTE3OCw3ICsxNzgsNiBAQCBwaW86IHBpbmN0cmxAMTAw
MGIwMDAgewogCQljb21wYXRpYmxlID0gIm1lZGlhdGVrLG10MjcwMS1waW5jdHJsIjsKIAkJcmVn
ID0gPDAgMHgxMDAwYjAwMCAwIDB4MTAwMD47CiAJCW1lZGlhdGVrLHBjdGwtcmVnbWFwID0gPCZz
eXNjZmdfcGN0bF9hPjsKLQkJcGlucy1hcmUtbnVtYmVyZWQ7CiAJCWdwaW8tY29udHJvbGxlcjsK
IAkJI2dwaW8tY2VsbHMgPSA8Mj47CiAJCWludGVycnVwdC1jb250cm9sbGVyOwpkaWZmIC0tZ2l0
IGEvYXJjaC9hcm0vYm9vdC9kdHMvbXQ3NjIzLmR0c2kgYi9hcmNoL2FybS9ib290L2R0cy9tdDc2
MjMuZHRzaQppbmRleCAyNWQzMWU0MGE1NTM1Li4xMTM3OWMzZTZiNGNhIDEwMDY0NAotLS0gYS9h
cmNoL2FybS9ib290L2R0cy9tdDc2MjMuZHRzaQorKysgYi9hcmNoL2FybS9ib290L2R0cy9tdDc2
MjMuZHRzaQpAQCAtMjUzLDcgKzI1Myw2IEBAIHBpbzogcGluY3RybEAxMDAwNTAwMCB7CiAJCWNv
bXBhdGlibGUgPSAibWVkaWF0ZWssbXQ3NjIzLXBpbmN0cmwiOwogCQlyZWcgPSA8MCAweDEwMDBi
MDAwIDAgMHgxMDAwPjsKIAkJbWVkaWF0ZWsscGN0bC1yZWdtYXAgPSA8JnN5c2NmZ19wY3RsX2E+
OwotCQlwaW5zLWFyZS1udW1iZXJlZDsKIAkJZ3Bpby1jb250cm9sbGVyOwogCQkjZ3Bpby1jZWxs
cyA9IDwyPjsKIAkJaW50ZXJydXB0LWNvbnRyb2xsZXI7CmRpZmYgLS1naXQgYS9hcmNoL2FybS9i
b290L2R0cy9tdDgxMzUuZHRzaSBiL2FyY2gvYXJtL2Jvb3QvZHRzL210ODEzNS5kdHNpCmluZGV4
IGEwMzFiMzYzNjMxODcuLjBmMjkxYWQyMmQzYWYgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtL2Jvb3Qv
ZHRzL210ODEzNS5kdHNpCisrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL210ODEzNS5kdHNpCkBAIC0x
NTIsNyArMTUyLDYgQEAgcGlvOiBwaW5jdHJsQDEwMDA1MDAwIHsKIAkJCWNvbXBhdGlibGUgPSAi
bWVkaWF0ZWssbXQ4MTM1LXBpbmN0cmwiOwogCQkJcmVnID0gPDAgMHgxMDAwYjAwMCAwIDB4MTAw
MD47CiAJCQltZWRpYXRlayxwY3RsLXJlZ21hcCA9IDwmc3lzY2ZnX3BjdGxfYSAmc3lzY2ZnX3Bj
dGxfYj47Ci0JCQlwaW5zLWFyZS1udW1iZXJlZDsKIAkJCWdwaW8tY29udHJvbGxlcjsKIAkJCSNn
cGlvLWNlbGxzID0gPDI+OwogCQkJaW50ZXJydXB0LWNvbnRyb2xsZXI7Ci0tIAoyLjM4LjEKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMy
IG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0
dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXN0bTMyCg==
