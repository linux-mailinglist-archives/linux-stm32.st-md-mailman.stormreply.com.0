Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F25C7767FDD
	for <lists+linux-stm32@lfdr.de>; Sat, 29 Jul 2023 16:01:04 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7B032C6B469;
	Sat, 29 Jul 2023 14:01:04 +0000 (UTC)
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com
 [209.85.221.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B728CC6B467
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 29 Jul 2023 14:01:02 +0000 (UTC)
Received: by mail-vk1-f178.google.com with SMTP id
 71dfb90a1353d-48668399b29so844452e0c.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 29 Jul 2023 07:01:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1690639261; x=1691244061;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MZVAQTl/KJwMx5MiWB8LXWVD/Og4xmNjpD5ZpeSnK7c=;
 b=ln2TgybqxMOQuiLgVhRhLYsqCFV+8HwlugaM1KqCgC8XMYyjTTJNTczBAf5RteyRiu
 EnUxo6Gpx7MnahdGEifLBxDmjnoVDHsU27yOxV0EIgSw/JqfZgF2ut6XolsFdcpXFgY/
 NLRO6vNtbqi4z7Wb2HqwcIQnCUk/VasMlHM5rjHx0EsvjMseLj2EFhhA3Ge2jCMmxm1p
 JwExs0c8Fz+1a7PfrbKqaeukn5dPUJ5eMgKPTD1GYc3f3LXY6uta9uVlq9eSrmmni1iB
 pTg1bU2dZouz/HV0Hh7D1+Qsgbzk6Lg2vxhW0bCyG6Ok0JRfsIhDE5Sl1s+eJc6EU1R8
 skIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690639261; x=1691244061;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MZVAQTl/KJwMx5MiWB8LXWVD/Og4xmNjpD5ZpeSnK7c=;
 b=f+HUxAgyJ3jEarpsuYI2yp+3Bmks6qVHBjoa72b43B3JPCsPui2m1NFTFsyYrPSWkx
 Dvm5y7rVxnqODgijHPYqtd7NxOpHGEVHU8ni0KAEAwH25AMh0AVOYl5FasMNkvKPGMv9
 TMFfYKMpWb0CEyof12N5rVcMskVdNqgc/BCu/yOFeIkd2bcTHV3I7ylYAugRAWZBXKc2
 LSYa13hX2P4EfvwEvllEyaivaHzQ1rldJPYMcSYtLijEaO07CuQv2uN18aOjs3HOO0gf
 cDaAEiGOGeqS7n8KKU/7Afyi705f+vTy9kU/9Jt5O3h4xG1IEMRHIkqkt6KObAprNJqn
 1Nvg==
X-Gm-Message-State: ABy/qLb1KiMadJhCiRunkX86c5EP0uZfNlEoaC0SJcJf22sYoXJdP/9E
 +pjBTLNsWnhGvX8R1PkD8++2jXmYxsUqP4T+o4ZRqw==
X-Google-Smtp-Source: APBJJlEi2RKDbITIjmlsevHI7wqEnXUgQewcF8UvMqd3GbsnOxKtGzuN1hsrPvplsPt4ahSEpNWCfRcs3dx1OhXil1E=
X-Received: by 2002:a1f:ed83:0:b0:471:1785:e838 with SMTP id
 l125-20020a1fed83000000b004711785e838mr3717737vkh.2.1690639261551; Sat, 29
 Jul 2023 07:01:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230724063520.182888-1-alexander.stein@ew.tq-group.com>
In-Reply-To: <20230724063520.182888-1-alexander.stein@ew.tq-group.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Sat, 29 Jul 2023 16:00:50 +0200
Message-ID: <CAMRc=Me3PAf7vuBS9MbLDh1t2MMWiTjA1CTW38UyMLmioYEowg@mail.gmail.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Andy Shevchenko <andy@kernel.org>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Pavel Machek <pavel@ucw.cz>, Linus Walleij <linus.walleij@linaro.org>,
 Lee Jones <lee@kernel.org>, linux-gpio@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-leds@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 1/2] dt-bindings: gpio: Add
	gpio-line-names to STMPE GPIO
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

T24gTW9uLCBKdWwgMjQsIDIwMjMgYXQgODozNeKAr0FNIEFsZXhhbmRlciBTdGVpbgo8YWxleGFu
ZGVyLnN0ZWluQGV3LnRxLWdyb3VwLmNvbT4gd3JvdGU6Cj4KPiBUaGlzIGlzIGEgZ3Bpby1jb250
cm9sbGVyLCBzbyBncGlvLWxpbmUtbmFtZXMgc2hvdWxkIGJlIGFsbG93ZWQgYXMgd2VsbC4KPiBz
dG1wZTI0MDMgc3VwcG9ydHMgdXAgdG8gMjQgR1BJT3MuCj4KPiBTaWduZWQtb2ZmLWJ5OiBBbGV4
YW5kZXIgU3RlaW4gPGFsZXhhbmRlci5zdGVpbkBldy50cS1ncm91cC5jb20+Cj4gLS0tCj4gQ2hh
bmdlcyBpbiB2MjoKPiAqIEFkZCBtaW4vbWF4SXRlbXMKPgo+ICBEb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvZ3Bpby9zdCxzdG1wZS1ncGlvLnlhbWwgfCA0ICsrKysKPiAgMSBmaWxl
IGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9ncGlvL3N0LHN0bXBlLWdwaW8ueWFtbCBiL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9ncGlvL3N0LHN0bXBlLWdwaW8ueWFtbAo+IGluZGV4IDIy
YzBjYWU3MzQyNS4uNDU1NWYxNjQ0YTRkIDEwMDY0NAo+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9ncGlvL3N0LHN0bXBlLWdwaW8ueWFtbAo+ICsrKyBiL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9ncGlvL3N0LHN0bXBlLWdwaW8ueWFtbAo+IEBAIC0y
OCw2ICsyOCwxMCBAQCBwcm9wZXJ0aWVzOgo+Cj4gICAgZ3Bpby1jb250cm9sbGVyOiB0cnVlCj4K
PiArICBncGlvLWxpbmUtbmFtZXM6Cj4gKyAgICBtaW5JdGVtczogMQo+ICsgICAgbWF4SXRlbXM6
IDI0Cj4gKwo+ICAgIGludGVycnVwdC1jb250cm9sbGVyOiB0cnVlCj4KPiAgICBzdCxub3JlcXVl
c3QtbWFzazoKPiAtLQo+IDIuMzQuMQo+CgpBcHBsaWVkLCB0aGFua3MhCgpCYXJ0Cl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxp
bmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8v
c3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMy
Cg==
