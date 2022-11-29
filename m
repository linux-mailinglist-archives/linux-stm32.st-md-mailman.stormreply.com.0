Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AECA63B7E6
	for <lists+linux-stm32@lfdr.de>; Tue, 29 Nov 2022 03:34:05 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 17136C65E60;
	Tue, 29 Nov 2022 02:34:05 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E796FC65E5E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Nov 2022 02:34:03 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id m19so16736627edj.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Nov 2022 18:34:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=p2wIPJTHkD+bylj39gTMFm3DTXuPW9bL6vkGIzsV8aw=;
 b=kZurQYlwJIRzTT+7zqhkAVIxZypR4Ym0x21fe9bnwCAsqwvJR3TgpGxd88mHYJPm60
 LX3Zp6nshIqrm/lDU+Va90uCJdbBfnFx54Pa1g98o7iTTEH/uIS7obpjSO+yHcX+15q7
 jtfPifPzJKnKO6y1bWCOOeVy05p0Lu1/MRZ6+n6HSI3Ak1OSE5/P1MbgdRr8cP+b92QP
 coG/3EtVGGfQ9NRoOUWInj0l71Yrm5wOABzV725Ia6FZQZjeAeNlVjIZjteS9eAogSyA
 11LA1BueA/e0g3FQ6uoXH7ehNiaD42FNk/FB1CO/tGlEeiyz1+fbvFgyOSSvvpuW+F6U
 sPNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=p2wIPJTHkD+bylj39gTMFm3DTXuPW9bL6vkGIzsV8aw=;
 b=NF/eVf1ug0a/EfLkHCwgYVkv2y23Szuh7WVALuEVEpab5ui7h6d6xWew67fTeOrxTF
 am0fqAOHqymyximEcOUzDziSqNMFPShnDLjZP820Vmf+w95fC5VkDS63I5yQN1vL65ei
 BghMTBihyJUS9Y1UPynj6DbBIWwXl7dFx6rJg4YIrNDiZ7HEYtopP80lmVGegfqL3W4J
 g9mhmMBPkeQhzW+/FoOzrGBsMIuYJlaZtvYA8JOGJ+4ZXPim8eH24PRnqkmjZ5pJmJda
 qncLL4pABAyg5/meMHbqpPRhJmXADUTL7v4AKhBu7Jn/UjuvBZTju2CyRYwCU8ltFtoz
 wAfw==
X-Gm-Message-State: ANoB5pk4XelOcr6hEb3aIvJ2Z4M2kwpo35dYaPwuLa2tFmfbmZfxpMEo
 KpgPu/5EdPLz3/+WZ5Mnd/8LBA==
X-Google-Smtp-Source: AA0mqf4bZWNrCN097oenITVW9XWxiWgQvZ3xepStot6lQY8viV0QFaDmX5vyZpw8BbxpzDBGEe+PQw==
X-Received: by 2002:a05:6402:4008:b0:458:dd63:e339 with SMTP id
 d8-20020a056402400800b00458dd63e339mr31534833eda.81.1669689243478; 
 Mon, 28 Nov 2022 18:34:03 -0800 (PST)
Received: from c64.fritz.box ([81.221.122.240])
 by smtp.gmail.com with ESMTPSA id
 a4-20020aa7d744000000b004615f7495e0sm5733817eds.8.2022.11.28.18.34.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Nov 2022 18:34:03 -0800 (PST)
From: =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>
To: devicetree@vger.kernel.org
Date: Tue, 29 Nov 2022 03:33:54 +0100
Message-Id: <20221129023401.278780-1-bero@baylibre.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Cc: khilman@baylibre.com, linus.walleij@linaro.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 krzysztof.kozlowski@linaro.org, linux-mediatek@lists.infradead.org,
 mcoquelin.stm32@gmail.com, matthias.bgg@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com
Subject: [Linux-stm32] [PATCH v3 0/7] Remove the pins-are-numbered DT
	property
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

RHVyaW5nIHRoZSByZXZpZXcgb2YgbXkgTVQ4MzY1IHN1cHBvcnQgcGF0Y2hzZXQKKGh0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL2xpbnV4LW1lZGlhdGVrLzIwMjIxMTE3MjEwMzU2LjMxNzg1NzgtMS1i
ZXJvQGJheWxpYnJlLmNvbS8pLAp0aGUgaXNzdWUgb2YgdGhlICJwaW5zLWFyZS1udW1iZXJlZCIg
RGV2aWNlVHJlZSBwcm9wZXJ0eSBoYXMgY29tZSB1cC4KClRoaXMgcHJvcGVydHkgaXMgdW5pcXVl
IHRvIE1lZGlhdGVrIE1UNjV4eCBhbmQgU1RNMzIgcGluY3RybHMsIGFuZApkb2Vzbid0IHNlZW0g
dG8gc2VydmUgYW55IHB1cnBvc2UgKGJvdGggdGhlIE1lZGlhdGVrIGFuZCBTVE0zMiBkcml2ZXJz
CnNpbXBseSByZWZ1c2UgdG8gZGVhbCB3aXRoIGEgZGV2aWNlIHVubGVzcyBwaW5zLWFyZS1udW1i
ZXJlZCBpcyBzZXQgdG8KdHJ1ZSkuCgpUaGVyZSBpcyBubyBvdGhlciB1c2Ugb2YgdGhpcyBwcm9w
ZXJ0eSBpbiB0aGUga2VybmVsIG9yIGluIG90aGVyIHByb2plY3RzCnVzaW5nIERldmljZVRyZWVz
IChjaGVja2VkIHUtYm9vdCBhbmQgRnJlZUJTRCAtLSBpbiBib3RoIG9mIHRob3NlLCB0aGUKZmxh
ZyBpcyBwcmVzZW50IGluIE1lZGlhdGVrIGFuZCBTVE0gZGV2aWNldHJlZXMsIGJ1dCBub3QgdXNl
ZCBhbnl3aGVyZSkuCgpUaGVyZSBpcyBhbHNvIG5vIGtub3duIHVzZSBpbiB1c2Vyc3BhY2UgKGlu
IGZhY3QsIGEgdXNlcmxhbmQgYXBwbGljYXRpb24KcmVseWluZyBvbiB0aGUgcHJvcGVydHkgd291
bGQgYmUgYnJva2VuIGJlY2F1c2UgaXQgd291bGQgZ2V0IHRydWUgb24KYW55IE1lZGlhdGVrIG9y
IFNUTSBjaGlwc2V0IGFuZCBmYWxzZSBvbiBhbGwgb3RoZXJzLCBldmVuIHRob3VnaCBvdGhlcgpj
aGlwc2V0cyB1c2UgbnVtYmVyZWQgcGlucykuCgpUaGlzIHBhdGNoc2V0IHJlbW92ZXMgYWxsIHVz
ZXMgb2YgcGlucy1hcmUtbnVtYmVyZWQgYW5kIG1hcmtzIHRoZQpwcm9wZXJ0eSBhcyBkZXByZWNh
dGVkLgoKdjM6CiAgLSBObyBmdW5jdGlvbmFsIGNoYW5nZXM7IGFkZCByZWNlbnQgUmV2aWV3ZWQt
QnlzIGFuZCBBY2tlZC1CeXMsCiAgICBhZGQgbGludXgtZ3BpbyB0byBDYwoKdjI6CiAgLSBEZXBy
ZWNhdGUgdGhlIHByb3BlcnR5IGluc3RlYWQgb2YgcmVtb3ZpbmcgaXQgY29tcGxldGVseSBmcm9t
CiAgICBzY2hlbWFzCiAgLSBzcXVhc2ggc29tZSByZWxhdGVkIGNvbW1pdHMKCgpCZXJuaGFyZCBS
b3Nlbmtyw6RuemVyICg3KToKICBwaW5jdHJsOiBtZWRpYXRlazogY29tbW9uOiBSZW1vdmUgY2hl
Y2sgZm9yIHBpbnMtYXJlLW51bWJlcmVkCiAgcGluY3RybDogc3RtMzI6IFJlbW92ZSBjaGVjayBm
b3IgcGlucy1hcmUtbnVtYmVyZWQKICBkdC1iaW5kaW5nczogcGluY3RybDogbWVkaWF0ZWssbXQ2
NXh4OiBEZXByZWNhdGUgcGlucy1hcmUtbnVtYmVyZWQKICBkdC1iaW5kaW5nczogcGluY3RybDog
c3Qsc3RtMzI6IERlcHJlY2F0ZSBwaW5zLWFyZS1udW1iZXJlZAogIGFybTY0OiBkdHM6IG1lZGlh
dGVrOiBSZW1vdmUgcGlucy1hcmUtbnVtYmVyZWQgcHJvcGVydHkKICBBUk06IGR0czogbWVkaWF0
ZWs6IFJlbW92ZSBwaW5zLWFyZS1udW1iZXJlZCBwcm9wZXJ0eQogIEFSTTogZHRzOiBzdG0zMjog
UmVtb3ZlIHRoZSBwaW5zLWFyZS1udW1iZXJlZCBwcm9wZXJ0eQoKIC4uLi9iaW5kaW5ncy9waW5j
dHJsL21lZGlhdGVrLG10NjV4eC1waW5jdHJsLnlhbWwgICAgICAgICAgfCA1ICsrLS0tCiAuLi4v
ZGV2aWNldHJlZS9iaW5kaW5ncy9waW5jdHJsL3N0LHN0bTMyLXBpbmN0cmwueWFtbCAgICAgIHwg
NyArKystLS0tCiBhcmNoL2FybS9ib290L2R0cy9tdDI3MDEuZHRzaSAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHwgMSAtCiBhcmNoL2FybS9ib290L2R0cy9tdDc2MjMuZHRzaSAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHwgMSAtCiBhcmNoL2FybS9ib290L2R0cy9tdDgxMzUuZHRz
aSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgMSAtCiBhcmNoL2FybS9ib290L2R0cy9z
dG0zMmY0LXBpbmN0cmwuZHRzaSAgICAgICAgICAgICAgICAgICAgIHwgMSAtCiBhcmNoL2FybS9i
b290L2R0cy9zdG0zMmY3LXBpbmN0cmwuZHRzaSAgICAgICAgICAgICAgICAgICAgIHwgMSAtCiBh
cmNoL2FybS9ib290L2R0cy9zdG0zMmg3NDMuZHRzaSAgICAgICAgICAgICAgICAgICAgICAgICAg
IHwgMSAtCiBhcmNoL2FybS9ib290L2R0cy9zdG0zMm1wMTMxLmR0c2kgICAgICAgICAgICAgICAg
ICAgICAgICAgIHwgMSAtCiBhcmNoL2FybS9ib290L2R0cy9zdG0zMm1wMTUxLmR0c2kgICAgICAg
ICAgICAgICAgICAgICAgICAgIHwgMiAtLQogYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9t
dDI3MTJlLmR0c2kgICAgICAgICAgICAgICAgICB8IDEgLQogYXJjaC9hcm02NC9ib290L2R0cy9t
ZWRpYXRlay9tdDgxNjcuZHRzaSAgICAgICAgICAgICAgICAgICB8IDEgLQogYXJjaC9hcm02NC9i
b290L2R0cy9tZWRpYXRlay9tdDgxNzMtZWxtLmR0c2kgICAgICAgICAgICAgICB8IDEgLQogYXJj
aC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgxNzMuZHRzaSAgICAgICAgICAgICAgICAgICB8
IDEgLQogYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDg1MTYuZHRzaSAgICAgICAgICAg
ICAgICAgICB8IDEgLQogZHJpdmVycy9waW5jdHJsL21lZGlhdGVrL3BpbmN0cmwtbXRrLWNvbW1v
bi5jICAgICAgICAgICAgICB8IDYgLS0tLS0tCiBkcml2ZXJzL3BpbmN0cmwvc3RtMzIvcGluY3Ry
bC1zdG0zMi5jICAgICAgICAgICAgICAgICAgICAgIHwgNSAtLS0tLQogMTcgZmlsZXMgY2hhbmdl
ZCwgNSBpbnNlcnRpb25zKCspLCAzMiBkZWxldGlvbnMoLSkKCi0tIAoyLjM4LjEKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxp
bmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8v
c3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMy
Cg==
