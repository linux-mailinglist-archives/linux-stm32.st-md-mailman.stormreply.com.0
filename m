Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 289DA77F59F
	for <lists+linux-stm32@lfdr.de>; Thu, 17 Aug 2023 13:49:48 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CD700C6B475;
	Thu, 17 Aug 2023 11:49:47 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1F8AEC6B461
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Aug 2023 11:49:46 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D816663802;
 Thu, 17 Aug 2023 11:49:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AC70C433C7;
 Thu, 17 Aug 2023 11:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692272984;
 bh=teEVrb3W2gvTtrNyepUcTV15xxpfZzRsHJzzuAr82LI=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=Zwqw/xL5J3V7Fx4OowaejmPkxkfelnRuDHwLTMgdk9af9sVjy/pyR1Vi++ZtIWBz8
 9ycbbanHTs2uaDN94ct+/LsPyUtz9JFsM5/5KrXKA95tYRUZCZEgX785OtogDyRT8b
 dyeDeVuK8wCsuefYfB0fQyKwa8xSjmTVSjhzlGbUIy0z2zBrlSC8d0RaO1OnSyDThx
 g+D3ixAGOANJ/oQ7P+NWKLlLIXIct1eIDS7LWjybJ9OouaW9URkmcjf8Qy/51Zc89Q
 GGJe77NXOEiJiGnvC+2cwGBByvt5suT6yJArAgN9YVvf04Umiv1Euo40BqDs/wbJbh
 yyeFkPRsUKtzQ==
From: Lee Jones <lee@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>
In-Reply-To: <20230724063520.182888-2-alexander.stein@ew.tq-group.com>
References: <20230724063520.182888-1-alexander.stein@ew.tq-group.com>
 <20230724063520.182888-2-alexander.stein@ew.tq-group.com>
Message-Id: <169227298106.1007427.16180797809612061178.b4-ty@kernel.org>
Date: Thu, 17 Aug 2023 12:49:41 +0100
MIME-Version: 1.0
X-Mailer: b4 0.12.2
Cc: linux-gpio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-leds@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
Subject: Re: [Linux-stm32] (subset) [PATCH v2 2/2] dt-bindings: leds: Add
 gpio-line-names to PCA9532 GPIO
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

T24gTW9uLCAyNCBKdWwgMjAyMyAwODozNToyMCArMDIwMCwgQWxleGFuZGVyIFN0ZWluIHdyb3Rl
Ogo+IFRoaXMgaXMgYSBncGlvLWNvbnRyb2xsZXIsIHNvIGdwaW8tbGluZS1uYW1lcyBzaG91bGQg
YmUgYWxsb3dlZCBhcyB3ZWxsLgo+IHBjYTk1MzIgc3VwcG9ydHMgdXAgdG8gMTYgR1BJT3MuCj4g
Cj4gCgpBcHBsaWVkLCB0aGFua3MhCgpbMi8yXSBkdC1iaW5kaW5nczogbGVkczogQWRkIGdwaW8t
bGluZS1uYW1lcyB0byBQQ0E5NTMyIEdQSU8KICAgICAgY29tbWl0OiA0YWE4ZjdlMjRmMDc2Njlk
Mjc5NDUxNDlhNzI5MDNiYzAzMmZhNmU5CgotLQpMZWUgSm9uZXMgW+adjueQvOaWr10KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1h
aWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBz
Oi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0
bTMyCg==
