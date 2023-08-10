Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C4A44777204
	for <lists+linux-stm32@lfdr.de>; Thu, 10 Aug 2023 10:02:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7EF56C6B471;
	Thu, 10 Aug 2023 08:02:16 +0000 (UTC)
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com
 [209.85.167.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B5310C6B45B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Aug 2023 08:02:15 +0000 (UTC)
Received: by mail-oi1-f170.google.com with SMTP id
 5614622812f47-3a3373211a1so479904b6e.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Aug 2023 01:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691654534; x=1692259334;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RMKiJP9PwsAWvDuO6MkUcwKguB3RiOk5A4iPaJAWueQ=;
 b=qEL5eGpx3R1tGDnwFwbzoOd17uJ974M4YHJNL9ecktLrW7gE2xzpRITpGmyw+K7r0h
 X5jHgyLRc+kyZpRtNyJ/GK0opTjPFd/R6GdtXjXHz3xe+9y1hyUtDdIYGsJPaKphQJ2p
 3fNLGBdEYV6jDXBo3a6rG7D9I04puqMP4IwsFr34BWWh2yMSlRFEKkvLjAx52FHxmRbW
 OzUvkynWacCeFIi8URjbXP6xk7/JAQV9Wd/cClpwCMTHuHI6zBSSVlhieWObku/7Xaip
 V41FUMA6V/c31pMaJabmUXHrZFZ4FflNWHNRW08+K2964Wxnt/Ha1STq6oucnJ7jIJRG
 Xgxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691654534; x=1692259334;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RMKiJP9PwsAWvDuO6MkUcwKguB3RiOk5A4iPaJAWueQ=;
 b=k37XyV9h8rukwcKb5Q3+5QdqB4qwLB0+xeu7RIzI60j1Cq/qmqL6uWsoCSgRvikSxh
 y1LMiSYD+7QGU6wDHuWC9mG9AtV6r1A3LbwasePbQQIxX8ei4dJsJXwZPqfLSVCHQGDp
 t7qfqIug92HEVCklBRxOwEtyhAJjPtsnaRlMgGW8mhUrXLePDAy6veatcI3nhil8np0M
 WwjfGdx7JHvUMh7EaryE6jJY0LJCwQ4rzWpZRqs2t5Myk52Lycsh4yTxN27HIRYP8Tkn
 aYoBpY8+XRAXBNqptgym28n0/5P7XJ9DPhI7pAmSNwPDNQH0LqBELWKMgI0+uNcZD4so
 T9PA==
X-Gm-Message-State: AOJu0YxCNAS1HycXvrzmVzpbYgMp2xoy2m74MsyNKW2ziD/ysg33iFv1
 1DhWOQO7bl04chlFaMTw/Y7raB02YfOhN3A1rFOwlQ==
X-Google-Smtp-Source: AGHT+IG7LOqODLO4XzzBQe6xjH9VCYPGuG47m7VY+spU3s+lQHTx7nqOVDrJK/EgUZKq9lp5grUSW9v+4kD1trQ+qgI=
X-Received: by 2002:a05:6808:4389:b0:3a7:1d15:28fe with SMTP id
 dz9-20020a056808438900b003a71d1528femr1706802oib.56.1691654534562; Thu, 10
 Aug 2023 01:02:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230726070353.103989-1-krzysztof.kozlowski@linaro.org>
 <20230726070353.103989-3-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230726070353.103989-3-krzysztof.kozlowski@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 10 Aug 2023 10:02:03 +0200
Message-ID: <CACRpkdZXUEh2cCyWaNyMnBot40DHQa0O8LPHOB14hpk8sXRM9w@mail.gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 3/4] AMR: dts: st: ste: switch to
	enable-gpios
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

T24gV2VkLCBKdWwgMjYsIDIwMjMgYXQgOTowM+KAr0FNIEtyenlzenRvZiBLb3psb3dza2kKPGty
enlzenRvZi5rb3psb3dza2lAbGluYXJvLm9yZz4gd3JvdGU6Cgo+IFRoZSByZWNvbW1lbmRlZCBu
YW1lIGZvciBlbmFibGUgR1BJT3MgcHJvcGVydHkgaW4gcmVndWxhdG9yLWdwaW8gaXMKPiAiZW5h
YmxlLWdwaW9zIi4gIFRoaXMgaXMgYWxzbyByZXF1aXJlZCBieSBiaW5kaW5nczoKPgo+ICAgc3Rl
LWhyZWZ2NjBwbHVzLXN0dWliLmR0YjogcmVndWxhdG9yLWdwaW86IFVuZXZhbHVhdGVkIHByb3Bl
cnRpZXMgYXJlIG5vdCBhbGxvd2VkICgnZW5hYmxlLWdwaW8nIHdhcyB1bmV4cGVjdGVkKQo+Cj4g
U2lnbmVkLW9mZi1ieTogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6eXN6dG9mLmtvemxvd3NraUBs
aW5hcm8ub3JnPgoKSG0gaWYgdGhlIHN1YmplY3Qgc3RhcnQgdHVybmluZyBBUk06IGR0czogc3Q6
IHN0ZTogb24gdGhlc2UgSSBtaWdodApuZWVkIHRvIGNvbnNpZGVyCnRvIG1vdmUgdGhlIHN0ZShy
aWNzc29uKSBzdHVmZiBvdXQgb2YgZHRzL3N0LCB0aGlzIHNlcmllcyBtaXhlcyB1cCB0aGUgVXg1
MDAgYW5kCnN0IG1haW50YWluZXJzLiBJIGNhbiBkZWFsIHdpdGggdGhpcyBvbmUgYnV0IGlmIGl0
IGNvbmZ1c2VzIHRoZSBzY3JpcHRzIHRoYXQncwpub3QgZ29vZC4KCkFueXdheXMsIHBhdGNoIGFw
cGxpZWQhIChXaXRoIHN1YmplY3QgZml4ZWQuKQoKWW91cnMsCkxpbnVzIFdhbGxlaWoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFp
bGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6
Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3Rt
MzIK
