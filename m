Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3236D46A330
	for <lists+linux-stm32@lfdr.de>; Mon,  6 Dec 2021 18:41:37 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D9867C5F1E5;
	Mon,  6 Dec 2021 17:41:36 +0000 (UTC)
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com
 [209.85.167.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5C657C597BA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  6 Dec 2021 17:41:36 +0000 (UTC)
Received: by mail-oi1-f172.google.com with SMTP id m6so22819141oim.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 06 Dec 2021 09:41:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=etHzQ9NM1GZEqBXMjqlYDuSFEcEX2xS/LEQ7h5EquGo=;
 b=Tr8mdfgc/HVQ7kL3YR2eF0Xrz9Yco1L5m1ALjIZukzpbqwZw2IaSIyWAg+UXlCXQW7
 Oxc8mq3GKMwZNp/5FhAI58bFqLcyAy41h0R/Ep5sie9kiaUfWIEXlnmPjoMoYNIMUuH3
 LJN6ITlknuWDWstxdvRV4tR06+P+oDOHn7/8oOODIkY4BqZXTXTxJBKchTsf/eQRjESO
 CTLhAHqNxYdFkDRRrn88jBiD5/VZbfel4YxUMOqPxtriFpC2g8SKYJGkTCCM8zwLkwuL
 ArhZ/bvlF4v1a3r6S1Una9zPdLI8GdZaPdpFjbBro+KcEGXVHihLPMuoqjsg4R2drsrK
 ePvg==
X-Gm-Message-State: AOAM530dWArIgoY4uvTAvhP1GEm1p6nKvO9Cgx1O+fqaXSreAb6C6qSO
 uu48DPghh+JmmQ7jzjEhvQ==
X-Google-Smtp-Source: ABdhPJwwxTmZ7Eqr9wMl8P5TiW8Ov5GJd5FOiHq71uFdfxjXaV9kDi+hp+5N1L25yBtoBolRABsZEA==
X-Received: by 2002:a05:6808:2309:: with SMTP id
 bn9mr24795493oib.42.1638812495150; 
 Mon, 06 Dec 2021 09:41:35 -0800 (PST)
Received: from xps15.herring.priv (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.googlemail.com with ESMTPSA id u13sm2244644oop.28.2021.12.06.09.41.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Dec 2021 09:41:34 -0800 (PST)
From: Rob Herring <robh@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Saenz Julienne <nsaenzjulienne@suse.de>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Date: Mon,  6 Dec 2021 11:41:33 -0600
Message-Id: <20211206174133.2296265-1-robh@kernel.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] dt-bindings: nvmem: Add missing 'reg' property
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

V2l0aCAndW5ldmFsdWF0ZWRQcm9wZXJ0aWVzJyBzdXBwb3J0IGltcGxlbWVudGVkLCB0aGUgZm9s
bG93aW5nIHdhcm5pbmdzCmFyZSBnZW5lcmF0ZWQgaW4gdGhlIG52bWVtIGV4YW1wbGVzOgoKRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL252bWVtL3N0LHN0bTMyLXJvbWVtLmV4YW1w
bGUuZHQueWFtbDogZWZ1c2VAMWZmZjc4MDA6IFVuZXZhbHVhdGVkIHByb3BlcnRpZXMgYXJlIG5v
dCBhbGxvd2VkICgncmVnJyB3YXMgdW5leHBlY3RlZCkKRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL252bWVtL3JtZW0uZXhhbXBsZS5kdC55YW1sOiBudnJhbUAxMDAwMDAwMDogVW5l
dmFsdWF0ZWQgcHJvcGVydGllcyBhcmUgbm90IGFsbG93ZWQgKCdyZWcnIHdhcyB1bmV4cGVjdGVk
KQpEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbnZtZW0vYnJjbSxudnJhbS5leGFt
cGxlLmR0LnlhbWw6IG52cmFtQDFlZmYwMDAwOiBVbmV2YWx1YXRlZCBwcm9wZXJ0aWVzIGFyZSBu
b3QgYWxsb3dlZCAoJ3JlZycgd2FzIHVuZXhwZWN0ZWQpCgpBZGQgdGhlIG1pc3NpbmcgJ3JlZycg
cHJvcGVydHkgZGVmaW5pdGlvbi4KCkNjOiBTcmluaXZhcyBLYW5kYWdhdGxhIDxzcmluaXZhcy5r
YW5kYWdhdGxhQGxpbmFyby5vcmc+CkNjOiBNYXhpbWUgQ29xdWVsaW4gPG1jb3F1ZWxpbi5zdG0z
MkBnbWFpbC5jb20+CkNjOiBBbGV4YW5kcmUgVG9yZ3VlIDxhbGV4YW5kcmUudG9yZ3VlQGZvc3Mu
c3QuY29tPgpDYzogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgpDYzogU2Flbnog
SnVsaWVubmUgPG5zYWVuemp1bGllbm5lQHN1c2UuZGU+CkNjOiBGYWJyaWNlIEdhc25pZXIgPGZh
YnJpY2UuZ2FzbmllckBmb3NzLnN0LmNvbT4KQ2M6IGxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4u
c3Rvcm1yZXBseS5jb20KQ2M6IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwpT
aWduZWQtb2ZmLWJ5OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgotLS0KIERvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9udm1lbS9icmNtLG52cmFtLnlhbWwgICAgIHwgMyAr
KysKIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9udm1lbS9ybWVtLnlhbWwgICAg
ICAgICAgIHwgMyArKysKIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9udm1lbS9z
dCxzdG0zMi1yb21lbS55YW1sIHwgMyArKysKIDMgZmlsZXMgY2hhbmdlZCwgOSBpbnNlcnRpb25z
KCspCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL252bWVt
L2JyY20sbnZyYW0ueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9udm1l
bS9icmNtLG52cmFtLnlhbWwKaW5kZXggNThmZjZiMGJkYjFhLi44YzNmMGNkMjI4MjEgMTAwNjQ0
Ci0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9udm1lbS9icmNtLG52cmFt
LnlhbWwKKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL252bWVtL2JyY20s
bnZyYW0ueWFtbApAQCAtMjQsNiArMjQsOSBAQCBwcm9wZXJ0aWVzOgogICBjb21wYXRpYmxlOgog
ICAgIGNvbnN0OiBicmNtLG52cmFtCiAKKyAgcmVnOgorICAgIG1heEl0ZW1zOiAxCisKIHVuZXZh
bHVhdGVkUHJvcGVydGllczogZmFsc2UKIAogZXhhbXBsZXM6CmRpZmYgLS1naXQgYS9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbnZtZW0vcm1lbS55YW1sIGIvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL252bWVtL3JtZW0ueWFtbAppbmRleCAxZDg1YTBhMzA4NDYu
LmE0YTc1NWRjZmM0MyAxMDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL252bWVtL3JtZW0ueWFtbAorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvbnZtZW0vcm1lbS55YW1sCkBAIC0xOSw2ICsxOSw5IEBAIHByb3BlcnRpZXM6CiAgICAgICAg
ICAgLSByYXNwYmVycnlwaSxib290bG9hZGVyLWNvbmZpZwogICAgICAgLSBjb25zdDogbnZtZW0t
cm1lbQogCisgIHJlZzoKKyAgICBtYXhJdGVtczogMQorCiAgIG5vLW1hcDoKICAgICAkcmVmOiAv
c2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy9mbGFnCiAgICAgZGVzY3JpcHRpb246CmRp
ZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbnZtZW0vc3Qsc3Rt
MzItcm9tZW0ueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9udm1lbS9z
dCxzdG0zMi1yb21lbS55YW1sCmluZGV4IGE0OGM4ZmE1NmJjZS4uNDQ4YTI2NzhkYzYyIDEwMDY0
NAotLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbnZtZW0vc3Qsc3RtMzIt
cm9tZW0ueWFtbAorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbnZtZW0v
c3Qsc3RtMzItcm9tZW0ueWFtbApAQCAtMjQsNiArMjQsOSBAQCBwcm9wZXJ0aWVzOgogICAgICAg
LSBzdCxzdG0zMmY0LW90cAogICAgICAgLSBzdCxzdG0zMm1wMTUtYnNlYwogCisgIHJlZzoKKyAg
ICBtYXhJdGVtczogMQorCiBwYXR0ZXJuUHJvcGVydGllczoKICAgIl4uKkBbMC05YS1mXSskIjoK
ICAgICB0eXBlOiBvYmplY3QKLS0gCjIuMzIuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMy
QHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3Jt
cmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
