Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 16CC26331DF
	for <lists+linux-stm32@lfdr.de>; Tue, 22 Nov 2022 02:08:15 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B3838C65041;
	Tue, 22 Nov 2022 01:08:14 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E7815C64104
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Nov 2022 01:08:11 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id n12so32308324eja.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Nov 2022 17:08:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DluvA8nTnzf/xofArynYdkv9W1c4RsYObyGmy30CGd0=;
 b=odpFpCw5aHWfS+pOQs4yWZQ5jGoFsNm1SxAmKBOYgGnF80lSJTac93dQPGzxjY4eF2
 FA59KdnuY3aY71rJ7sPgucxZ1iCCrlI2CdQCHQdS/9UJ6GF/AvGZEB0yiV1nLDGeLXld
 64SZO5Ps0gOHJoWh0aaSfPsEgrRc9Kq37lCKPhtdxWwiXGUGpXAeJCdsZlXFMMCX5/BU
 py0VbF67K6EiiaYw1UgKZgPfhjUOkvh2KoKj3Ai/YYuBwH7vuUMPinf4jOPdAwNDbfwg
 VAPQ8tk9dba7xiAiEAywXPbB1eGVCc0gQKnfYqMhEU1/QE8LdRiZdI5boTvdZnSw3INe
 Nk/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DluvA8nTnzf/xofArynYdkv9W1c4RsYObyGmy30CGd0=;
 b=gdXRj0tueuDCD/ZQ8nnWvfdfj7AHvaO8UAULBSn0QnYmzYfQgAK1JPMXWiTnxTdRhA
 RUDpPhe7bPix2H6yfGQyTHl0kGcn74jIFlRj2O09Et0E2p+qlOeXJBMkHW75Q7PX0jP6
 ahaZ2zhT9tsuFu0LmM3dLghdargOZU/RckzbTW97kFACcCYP8JHMpP4D8E80Ypr6rmu7
 oIRu/xma/AY2zNKjUAOGgO3wpj3ajDGV0qNzETLxSY6lFeheQyOaeqT+TkIuPylRWtHy
 m6n8o2S/77jbah8HoA8oICArDM6mEGJvFs08skGZ3koAfA1iN7ZS+2IonjbMnCtxcfIV
 xrAA==
X-Gm-Message-State: ANoB5pk6koe371QNpeIEc12TQtwg57pCk/S2iydurlx+iKwgzacbjABM
 Ar6eslQNur/N5YEo0O0IHRMB+Q==
X-Google-Smtp-Source: AA0mqf68LT1nby+adF0ovbjDlH26Pq2EQGd6MYppzkQjHPVpfeEgxIrxpdLea9WAWiFKcu3RwSWFWg==
X-Received: by 2002:a17:906:a291:b0:782:9b27:94aa with SMTP id
 i17-20020a170906a29100b007829b2794aamr16869217ejz.542.1669079291383; 
 Mon, 21 Nov 2022 17:08:11 -0800 (PST)
Received: from c64.fritz.box ([2a01:2a8:8108:8301:7643:bec8:f62b:b074])
 by smtp.gmail.com with ESMTPSA id
 f13-20020a1709064dcd00b007030c97ae62sm5514683ejw.191.2022.11.21.17.08.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Nov 2022 17:08:11 -0800 (PST)
From: =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>
To: devicetree@vger.kernel.org
Date: Tue, 22 Nov 2022 02:07:50 +0100
Message-Id: <20221122010753.3126828-5-bero@baylibre.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221122010753.3126828-1-bero@baylibre.com>
References: <20221122010753.3126828-1-bero@baylibre.com>
MIME-Version: 1.0
Cc: khilman@baylibre.com, linux-kernel@vger.kernel.org,
 krzysztof.kozlowski@linaro.org, linux-mediatek@lists.infradead.org,
 mcoquelin.stm32@gmail.com, matthias.bgg@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com
Subject: [Linux-stm32] [PATCH v2 4/7] dt-bindings: pinctrl: st,
	stm32: Deprecate pins-are-numbered
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

RGVwcmVjYXRlIHRoZSBwaW5zLWFyZS1udW1iZXJlZCBwcm9wZXJ0eQoKU2lnbmVkLW9mZi1ieTog
QmVybmhhcmQgUm9zZW5rcsOkbnplciA8YmVyb0BiYXlsaWJyZS5jb20+Ci0tLQogLi4uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvcGluY3RybC9zdCxzdG0zMi1waW5jdHJsLnlhbWwgICAgICB8IDcgKysr
LS0tLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGluY3RybC9zdCxz
dG0zMi1waW5jdHJsLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGlu
Y3RybC9zdCxzdG0zMi1waW5jdHJsLnlhbWwKaW5kZXggOWQ1OTIwOGQ4M2MxOC4uZWViMjliNGFk
NGQxYSAxMDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BpbmN0
cmwvc3Qsc3RtMzItcGluY3RybC55YW1sCisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9waW5jdHJsL3N0LHN0bTMyLXBpbmN0cmwueWFtbApAQCAtMzQsNyArMzQsOSBAQCBw
cm9wZXJ0aWVzOgogICAgIGNvbnN0OiAxCiAKICAgcmFuZ2VzOiB0cnVlCi0gIHBpbnMtYXJlLW51
bWJlcmVkOiB0cnVlCisgIHBpbnMtYXJlLW51bWJlcmVkOgorICAgICRyZWY6IC9zY2hlbWFzL3R5
cGVzLnlhbWwjL2RlZmluaXRpb25zL2ZsYWcKKyAgICBkZXByZWNhdGVkOiB0cnVlCiAgIGh3bG9j
a3M6IHRydWUKIAogICBpbnRlcnJ1cHRzOgpAQCAtMjA2LDcgKzIwOCw2IEBAIHJlcXVpcmVkOgog
ICAtICcjYWRkcmVzcy1jZWxscycKICAgLSAnI3NpemUtY2VsbHMnCiAgIC0gcmFuZ2VzCi0gIC0g
cGlucy1hcmUtbnVtYmVyZWQKIAogYWRkaXRpb25hbFByb3BlcnRpZXM6IGZhbHNlCiAKQEAgLTIy
MCw3ICsyMjEsNiBAQCBleGFtcGxlczoKICAgICAgICAgICAgICAgI3NpemUtY2VsbHMgPSA8MT47
CiAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAic3Qsc3RtMzJmNDI5LXBpbmN0cmwiOwogICAg
ICAgICAgICAgICByYW5nZXMgPSA8MCAweDQwMDIwMDAwIDB4MzAwMD47Ci0gICAgICAgICAgICAg
IHBpbnMtYXJlLW51bWJlcmVkOwogCiAgICAgICAgICAgICAgIGdwaW9hOiBncGlvQDAgewogICAg
ICAgICAgICAgICAgICAgICAgIGdwaW8tY29udHJvbGxlcjsKQEAgLTIzOCw3ICsyMzgsNiBAQCBl
eGFtcGxlczoKICAgICAgICAgICAgICAgI3NpemUtY2VsbHMgPSA8MT47CiAgICAgICAgICAgICAg
IGNvbXBhdGlibGUgPSAic3Qsc3RtMzJmNDI5LXBpbmN0cmwiOwogICAgICAgICAgICAgICByYW5n
ZXMgPSA8MCAweDUwMDIwMDAwIDB4MzAwMD47Ci0gICAgICAgICAgICAgIHBpbnMtYXJlLW51bWJl
cmVkOwogCiAgICAgICAgICAgICAgIGdwaW9iOiBncGlvQDEwMDAgewogICAgICAgICAgICAgICAg
ICAgICAgIGdwaW8tY29udHJvbGxlcjsKLS0gCjIuMzguMQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4
LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFu
LnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
