Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E9F5631A9A
	for <lists+linux-stm32@lfdr.de>; Mon, 21 Nov 2022 08:49:14 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0A62CC65E4D;
	Mon, 21 Nov 2022 07:49:14 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5CADEC0D2C0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Nov 2022 01:55:09 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id b8so3495621edf.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 20 Nov 2022 17:55:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9CB+PKSY77gd3fDCjTpTtL8yvYXbKEU7hxFHC5zM8QI=;
 b=Y/jhLVoxc5NITt+vyfGKjmI2MXk68J/n5/gDbcTVHtDrq+qHydLcpWCsqOLT+1tx4K
 vJGHmCzBcZprPMxttoFB4QAqBGD5FTiUZurSUlx8DwZbnsbuBN5KPdfLfSh12xI5q+45
 ewkXZiWodF0uOn4CbYPKzFB+wkOvdmACfiHT6TIbZ9oR1yWZ2VZV07itjNQh0y0ERljn
 72Pp4i82m1BgTZfFpIEihqSdWbivHdk9jukMKe9aFRW5kzdT9k7mPZiEcYoeksjZMeQi
 /4zaGQxnrqeC5FbdRmBZ5Fsw2EP2rTwytcD718KgJENUc9W0BT2cS1f0N20MjqK6Xjum
 +j2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9CB+PKSY77gd3fDCjTpTtL8yvYXbKEU7hxFHC5zM8QI=;
 b=gBjIA8949Pl1F88eEMUkEYRoDyN3VxlnKvejF3lQ66NwnUY9MMnSR+I6+HDX/zptMH
 vJvK8DTw9GeZxwr0XmgGWwh+dvTg6OVHBy/4xzzh43yQ/S76lAkmPqq6Q/jbFf0MTudB
 ia48Vuobo1DoNGaXfe9YJGnZf+ttbGuWAr525u9/bq6bLAE1aOadp0PU8iTDihgKl8zO
 Vjsgo4Xi1l62n0ZLhXQRZK1ZGyuBKxHejL3XgMnEA1vFNsSVPzfCipGEo141bmJuk+WC
 sNibTca6i9VQWT8KxseE8TK6rrOHezx4pqRpmhT8amgadyRsvoSl9KKRz/QQF56NwhD4
 2tsw==
X-Gm-Message-State: ANoB5pk5guZR/SXY1ZXWy78NO62nBNpmIfPSTO/00obtdKt3BbO+X7KT
 cgJp8Ns6VVU8aSdNzLjd3TxonA==
X-Google-Smtp-Source: AA0mqf4SwjNK10hTsB4MvtZoRkF217NrnXjf0sIG6lLeKQigxLHaLKrlPchFql7FjvHVNq3vPF2dIA==
X-Received: by 2002:aa7:c055:0:b0:45a:1af2:ed6d with SMTP id
 k21-20020aa7c055000000b0045a1af2ed6dmr52132edo.364.1668995708996; 
 Sun, 20 Nov 2022 17:55:08 -0800 (PST)
Received: from c64.fritz.box ([2a01:2a8:8108:8301:7643:bec8:f62b:b074])
 by smtp.gmail.com with ESMTPSA id
 g2-20020a170906538200b00782e3cf7277sm4415513ejo.120.2022.11.20.17.55.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Nov 2022 17:55:08 -0800 (PST)
From: =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>
To: devicetree@vger.kernel.org
Date: Mon, 21 Nov 2022 02:54:45 +0100
Message-Id: <20221121015451.2471196-4-bero@baylibre.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221121015451.2471196-1-bero@baylibre.com>
References: <20221121015451.2471196-1-bero@baylibre.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 21 Nov 2022 07:49:11 +0000
Cc: khilman@baylibre.com, krzysztof.kozlowski@linaro.org,
 linux-mediatek@lists.infradead.org, mcoquelin.stm32@gmail.com,
 matthias.bgg@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 3/9] dt-bindings: pinctrl: mediatek,
	mt65xx: Make pins-are-numbered optional
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

RG9uJ3QgbGlzdCB0aGUgcGlucy1hcmUtbnVtYmVyZWQgcHJvcGVydHkgYXMgcmVxdWlyZWQKClNp
Z25lZC1vZmYtYnk6IEJlcm5oYXJkIFJvc2Vua3LDpG56ZXIgPGJlcm9AYmF5bGlicmUuY29tPgot
LS0KIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BpbmN0cmwvbWVkaWF0ZWssbXQ2NXh4LXBpbmN0
cmwueWFtbCAgICAgfCAxIC0KIDEgZmlsZSBjaGFuZ2VkLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0t
Z2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BpbmN0cmwvbWVkaWF0ZWss
bXQ2NXh4LXBpbmN0cmwueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9w
aW5jdHJsL21lZGlhdGVrLG10NjV4eC1waW5jdHJsLnlhbWwKaW5kZXggMzNiNWY3OWU3NDFhYi4u
Y2NhOWNjNThhNjkzNCAxMDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL3BpbmN0cmwvbWVkaWF0ZWssbXQ2NXh4LXBpbmN0cmwueWFtbAorKysgYi9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGluY3RybC9tZWRpYXRlayxtdDY1eHgtcGluY3RybC55
YW1sCkBAIC02Miw3ICs2Miw2IEBAIHByb3BlcnRpZXM6CiAKIHJlcXVpcmVkOgogICAtIGNvbXBh
dGlibGUKLSAgLSBwaW5zLWFyZS1udW1iZXJlZAogICAtIGdwaW8tY29udHJvbGxlcgogICAtICIj
Z3Bpby1jZWxscyIKIAotLSAKMi4zOC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3Qt
bWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBs
eS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
