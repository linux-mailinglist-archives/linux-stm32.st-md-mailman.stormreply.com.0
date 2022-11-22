Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DE5D6331E4
	for <lists+linux-stm32@lfdr.de>; Tue, 22 Nov 2022 02:08:15 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1E302C65E46;
	Tue, 22 Nov 2022 01:08:15 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EB69FC6504E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Nov 2022 01:08:09 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id ud5so32371206ejc.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Nov 2022 17:08:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZTx+TtbHQiuyemeCcK5ytUKmVUVmCoh0H5eAmJ4K4qk=;
 b=LxkapDROlNg89vbfyOnHNwYtPPUfl2VexbTmKnYd0BjumMyVcRkoBcbPgGQNiCR76Z
 lu71Zfj0axIJ5DX8GAYZYxOcUEcnNsw19VoSTfGwI3jpbvJTC7fpGmm28fhX55YGIDul
 q6HM6mtWmwwZgWn/Jxl0R+IFpAHdrkfwzeiDNe3JLDvu58K0AmooRZlP42VhOD+nOtu8
 Wpn2B0vMSsS3VTfpWqyvY0El80MtzxkC3ni7qpQS2roMk2Nk5Sl0U6kG15gzcX8U/yqw
 CM+eVkiPmV3UsNrgQxJ4fPA3bBMV8yMTG2Cb9YD/l1IjmFGKuLPm6gS44TXGKTDI6kW7
 9BIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZTx+TtbHQiuyemeCcK5ytUKmVUVmCoh0H5eAmJ4K4qk=;
 b=h86ug5iQAKxkUXKJWs8dKqa1Plpu2WIknLsB7c6STaOFAJWUZGr5hGp6Y+L7IVLNYR
 cChwAhUk6J7vmR5Sg0dmj5l/5+xRsweQRV+0UUCRgkFZw8l7VP1MzxJeWTb+gDsz7ARE
 Rzra3bd6FFsVICRRZWAKJpSh8kM9S0f0sFV5nPuF61/0baMMqCcvo1A4Na9GapTSL7bg
 BllVYttu70C1ra/8wFn83LVnNcW5jn4U1BguOSjtrh0wdx1xojlGH9fLvad/zm+jGAOD
 QTq2vbUtNfhsIwf7GBwfy8DLsvODfjj2BoqHypKzHX5RbxQ0fvhCGrKB3nGUTWiMosHH
 lOhQ==
X-Gm-Message-State: ANoB5plbgqDjjRual5nnmSlA8eMDdv6D8AnXnhhfuyCaut53HrwRyj2S
 H6WbBn+WDyyYBXs6Ef8tSjs8Cg==
X-Google-Smtp-Source: AA0mqf7VrdKpG04LpKtWDcLfh9W2BtI6C/41tDew40mV/sen6b/FETzkdsA3/5/JhMJG+02LOvmq5w==
X-Received: by 2002:a17:906:3810:b0:7b5:cab5:2ea8 with SMTP id
 v16-20020a170906381000b007b5cab52ea8mr1036389ejc.222.1669079288692; 
 Mon, 21 Nov 2022 17:08:08 -0800 (PST)
Received: from c64.fritz.box ([2a01:2a8:8108:8301:7643:bec8:f62b:b074])
 by smtp.gmail.com with ESMTPSA id
 f13-20020a1709064dcd00b007030c97ae62sm5514683ejw.191.2022.11.21.17.08.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Nov 2022 17:08:08 -0800 (PST)
From: =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>
To: devicetree@vger.kernel.org
Date: Tue, 22 Nov 2022 02:07:47 +0100
Message-Id: <20221122010753.3126828-2-bero@baylibre.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221122010753.3126828-1-bero@baylibre.com>
References: <20221122010753.3126828-1-bero@baylibre.com>
MIME-Version: 1.0
Cc: khilman@baylibre.com, linux-kernel@vger.kernel.org,
 krzysztof.kozlowski@linaro.org, linux-mediatek@lists.infradead.org,
 mcoquelin.stm32@gmail.com, matthias.bgg@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com
Subject: [Linux-stm32] [PATCH v2 1/7] pinctrl: mediatek: common: Remove
	check for pins-are-numbered
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

UmVtb3ZlIHRoZSBjaGVjayBmb3IgdGhlIHVubmVjZXNzYXJ5IHBpbnMtYXJlLW51bWJlcmVkIERl
dmljZXRyZWUgcHJvcGVydHkuCgpTaWduZWQtb2ZmLWJ5OiBCZXJuaGFyZCBSb3Nlbmtyw6RuemVy
IDxiZXJvQGJheWxpYnJlLmNvbT4KUmV2aWV3ZWQtYnk6IEFuZ2Vsb0dpb2FjY2hpbm8gRGVsIFJl
Z25vIDxhbmdlbG9naW9hY2NoaW5vLmRlbHJlZ25vQGNvbGxhYm9yYS5jb20+ClJldmlld2VkLWJ5
OiBNYXR0aGlhcyBCcnVnZ2VyIDxtYXR0aGlhcy5iZ2dAZ21haWwuY29tPgpBY2tlZC1ieTogS3J6
eXN6dG9mIEtvemxvd3NraSA8a3J6eXN6dG9mLmtvemxvd3NraUBsaW5hcm8ub3JnPgpBY2tlZC1i
eTogS2V2aW4gSGlsbWFuIDxraGlsbWFuQGJheWxpYnJlLmNvbT4KLS0tCiBkcml2ZXJzL3BpbmN0
cmwvbWVkaWF0ZWsvcGluY3RybC1tdGstY29tbW9uLmMgfCA2IC0tLS0tLQogMSBmaWxlIGNoYW5n
ZWQsIDYgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9waW5jdHJsL21lZGlhdGVr
L3BpbmN0cmwtbXRrLWNvbW1vbi5jIGIvZHJpdmVycy9waW5jdHJsL21lZGlhdGVrL3BpbmN0cmwt
bXRrLWNvbW1vbi5jCmluZGV4IDA3NmFlMGIzOGUzZDcuLjU1M2QxNjcwMzQ3NWIgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvcGluY3RybC9tZWRpYXRlay9waW5jdHJsLW10ay1jb21tb24uYworKysgYi9k
cml2ZXJzL3BpbmN0cmwvbWVkaWF0ZWsvcGluY3RybC1tdGstY29tbW9uLmMKQEAgLTEwNTcsNyAr
MTA1Nyw2IEBAIGludCBtdGtfcGN0cmxfaW5pdChzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2
LAogCXN0cnVjdCBwaW5jdHJsX3Bpbl9kZXNjICpwaW5zOwogCXN0cnVjdCBtdGtfcGluY3RybCAq
cGN0bDsKIAlzdHJ1Y3QgZGV2aWNlX25vZGUgKm5wID0gcGRldi0+ZGV2Lm9mX25vZGUsICpub2Rl
OwotCXN0cnVjdCBwcm9wZXJ0eSAqcHJvcDsKIAlpbnQgcmV0LCBpOwogCiAJcGN0bCA9IGRldm1f
a3phbGxvYygmcGRldi0+ZGV2LCBzaXplb2YoKnBjdGwpLCBHRlBfS0VSTkVMKTsKQEAgLTEwNjYs
MTEgKzEwNjUsNiBAQCBpbnQgbXRrX3BjdHJsX2luaXQoc3RydWN0IHBsYXRmb3JtX2RldmljZSAq
cGRldiwKIAogCXBsYXRmb3JtX3NldF9kcnZkYXRhKHBkZXYsIHBjdGwpOwogCi0JcHJvcCA9IG9m
X2ZpbmRfcHJvcGVydHkobnAsICJwaW5zLWFyZS1udW1iZXJlZCIsIE5VTEwpOwotCWlmICghcHJv
cCkKLQkJcmV0dXJuIGRldl9lcnJfcHJvYmUoZGV2LCAtRUlOVkFMLAotCQkJCSAgICAgIm9ubHkg
c3VwcG9ydCBwaW5zLWFyZS1udW1iZXJlZCBmb3JtYXRcbiIpOwotCiAJbm9kZSA9IG9mX3BhcnNl
X3BoYW5kbGUobnAsICJtZWRpYXRlayxwY3RsLXJlZ21hcCIsIDApOwogCWlmIChub2RlKSB7CiAJ
CXBjdGwtPnJlZ21hcDEgPSBzeXNjb25fbm9kZV90b19yZWdtYXAobm9kZSk7Ci0tIAoyLjM4LjEK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0
bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29t
Cmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXN0bTMyCg==
