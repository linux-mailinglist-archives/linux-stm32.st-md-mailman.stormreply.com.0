Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F41078982FE
	for <lists+linux-stm32@lfdr.de>; Thu,  4 Apr 2024 10:18:42 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AF7EAC6B45B;
	Thu,  4 Apr 2024 08:18:42 +0000 (UTC)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com
 [209.85.219.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2C2E4CFAC50
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  4 Apr 2024 08:18:42 +0000 (UTC)
Received: by mail-yb1-f180.google.com with SMTP id
 3f1490d57ef6-dcc80d6004bso848603276.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 04 Apr 2024 01:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712218721; x=1712823521;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eyAd8Fm3t44gc7qEKT0d4Zv8xoYimRNogrja13Iomu4=;
 b=Xf4chGow+r/7htYHevG3xPwdj1+ASxznXKH96JxZTCbk4yn8jauWlyKj7seKDeCA6P
 0OgZ3T/RF9MdnDz5zFrv63THKm8+zkUcwmAnJ1OasMFeipG+Wvm/bVrF5/BavDAkxw+p
 gUKXQUpKnkg4h4BdaVhJciQMCBHYB6/PTpNVfH5riVBNmXuq0oO6vjidUuyy9nl9sMBJ
 5up2XlZ0E6rEkb4NG8Zo1zTgeCzgciaT8sUiCmMS9ova9W8rz2AYlyYLVIVwui+IFPAz
 8ywKtiKHpJLuioAb6TjkUdor4QZDQLEN+YS+1tUCQ4TcY0lDtwS1mJj5Ss6WXe4mgQEZ
 9Q/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712218721; x=1712823521;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eyAd8Fm3t44gc7qEKT0d4Zv8xoYimRNogrja13Iomu4=;
 b=epleJNeDOQoT0vb0x+vPK++SE2NT+//bkavUuOGzqE3YJBG8KXXXBdh41+oZ6sYVUz
 /MeQ8XVxn7DhsMovWRB6C2Ab4i7ddBOLvSCXENJSL0rJQhjGiaEfY5TZV2rdboU7vGro
 S/ryDY59QajtnVZOHI5ez7ey8ydy/z1LHJ8S4leXPmT6iOWz+06DT646tiQKUQhyy7ro
 hBV0Tn28LheNf5yeAHDRC3k7grA/JEACd5ZCR2fyKX6xGnJwB3B2KhTHsNy28BAvYsvd
 HayQ7VIT/0oQTp/31G4KwZ/aTkMQMztpQtYpFLK2GF8OUlK++khJb6uqVBapmCMLgzXx
 trIQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWqCrfwozjq0ldk5nkwge8KzimVbspbXlqZopFUFDH6bi0IMJHSPidDI6CsVr1sDZSLba7mBd9XNq9xauO+vItw9TGmPmtOUS8uR008WPg3z682SA64Hrwi
X-Gm-Message-State: AOJu0Yyf8BdEYgZuWG9XVo9qkx22j/OPSPS1/G7OmJZFFLcxKC78tkqD
 S7uFAYKdSsYUCSGyMmi82biZyvLZgqrcTxkbOqDpZy9T0gIrdvhRNGboy9TYsTctOOzSUjmHqcL
 2SNiVK9npbliocp/CyL1ioqGkwKxo8W/K+PRCrg==
X-Google-Smtp-Source: AGHT+IF10RS0Ghp5cgYZUvg6PBzUDvxfLN9KgcqveP0TSNC3zgxigAL30JAOcgZTHb+RkMpEFaPK7ZHMMNnVTswBtzY=
X-Received: by 2002:a5b:d06:0:b0:dd0:6f7:bc3b with SMTP id
 y6-20020a5b0d06000000b00dd006f7bc3bmr1651889ybp.10.1712218721029; 
 Thu, 04 Apr 2024 01:18:41 -0700 (PDT)
MIME-Version: 1.0
References: <20240326-module-owner-amba-v1-0-4517b091385b@linaro.org>
 <20240326-module-owner-amba-v1-15-4517b091385b@linaro.org>
In-Reply-To: <20240326-module-owner-amba-v1-15-4517b091385b@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 4 Apr 2024 10:18:30 +0200
Message-ID: <CACRpkdZa7mszi45M72qKPM=NJtou1A5DjVVUFzChFtZwzwVZyA@mail.gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: kvm@vger.kernel.org,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 linux-i2c@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Herbert Xu <herbert@gondor.apana.org.au>, Russell King <linux@armlinux.org.uk>,
 linux-input@vger.kernel.org, Mike Leach <mike.leach@linaro.org>,
 Andi Shyti <andi.shyti@kernel.org>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 coresight@lists.linaro.org, Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Olivia Mackall <olivia@selenic.com>, Michal Simek <michal.simek@amd.com>,
 linux-arm-kernel@lists.infradead.org,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-kernel@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>, linux-crypto@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, dmaengine@vger.kernel.org,
 James Clark <james.clark@arm.com>
Subject: Re: [Linux-stm32] [PATCH 15/19] hwrng: nomadik: drop owner
	assignment
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

T24gVHVlLCBNYXIgMjYsIDIwMjQgYXQgOToyNOKAr1BNIEtyenlzenRvZiBLb3psb3dza2kKPGty
enlzenRvZi5rb3psb3dza2lAbGluYXJvLm9yZz4gd3JvdGU6Cgo+IEFtYmEgYnVzIGNvcmUgYWxy
ZWFkeSBzZXRzIG93bmVyLCBzbyBkcml2ZXIgZG9lcyBub3QgbmVlZCB0by4KPgo+IFNpZ25lZC1v
ZmYtYnk6IEtyenlzenRvZiBLb3psb3dza2kgPGtyenlzenRvZi5rb3psb3dza2lAbGluYXJvLm9y
Zz4KCkFja2VkLWJ5OiBMaW51cyBXYWxsZWlqIDxsaW51cy53YWxsZWlqQGxpbmFyby5vcmc+CgpZ
b3VycywKTGludXMgV2FsbGVpagpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFp
bG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20v
bWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
