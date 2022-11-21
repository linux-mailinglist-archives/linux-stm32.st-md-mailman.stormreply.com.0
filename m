Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A1867632BF8
	for <lists+linux-stm32@lfdr.de>; Mon, 21 Nov 2022 19:21:13 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 68F38C64104;
	Mon, 21 Nov 2022 18:21:13 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
 [209.85.215.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2569BC03FC9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Nov 2022 18:21:12 +0000 (UTC)
Received: by mail-pg1-f179.google.com with SMTP id 62so11843804pgb.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Nov 2022 10:21:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:references
 :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=YfT/StUdt/TNq97yOnqXZF2EgZ5co+Uc0ASQ93hBnik=;
 b=cfvLq7cKsH0LKUiHU/LSJ9scbNoTqsIm8PBhOwUZ3mdmoHignjA5gIbEv8ndjOv6Ab
 O48djvnHOxrQuVkOGaTjK6x4fsdhs3/HTXlTsnyUzq5DEBwNzxR8zfoGxTnL1N/dZILu
 1MNH+W1BxFXZvO6S/WLRRQoae673G8oSaVd7NJeUtF8pnRMTFiasmqnV/T8biiWRG2QJ
 KCWbw5MZ4GVLChkiUhuurkLLOrMCyvTdyfJt83NbipLu/yAHIABzcn21GR20ELMlGsnn
 5tP2S0Ig9kpd2NrFtIpfegly+3baiB/KGaXigOwihiUGBmMVn5/SJHw41znvZX6HJY6K
 FJmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YfT/StUdt/TNq97yOnqXZF2EgZ5co+Uc0ASQ93hBnik=;
 b=hB5KHH66dNSq6kGCTTIG6yt7M0Jyu/jx42wMXHRCpUSz7fgszwrDCTpLTYfsHT92Gx
 fUAGQkSx9LmVC1rUnsOBY8aeSPFrRmEoYx2tCOPDIJEURM3L/dXQly30DDZw+UHyftB2
 rM1RmIQwQKlwKP4L39i/IcAOn69aTytYS3QqSe7lckw1qOwErJ25AogMTO4NJ06dsbEq
 zyBiIBLtx1pLHpE9RB/pW9dh23LSWb0SWkleeoWhuAo6Uf3omngL24LVMFH9yTqJLyyY
 CiwSFKgbFB1hoH44mlNI1r5lEQqVuXKfM6MJx62XGeLwXZfwYPHAYZLpIPW/XM1fswv4
 dGdg==
X-Gm-Message-State: ANoB5pkXkgDRrERvY8KMP+9pUPADPtwCiwCVmn7Ka7yrrK+h8QxbHmfi
 gRD29DVrFcq/NLC7U3jkKEJjRQ==
X-Google-Smtp-Source: AA0mqf481SzQ29SDy4sok5GUrhFWQwmFscxt8EGYSysGEqUvu7DGXe8SO/aW0ouOWM3XTCimC3Beww==
X-Received: by 2002:a63:5d63:0:b0:462:85d6:6276 with SMTP id
 o35-20020a635d63000000b0046285d66276mr13659pgm.293.1669054870822; 
 Mon, 21 Nov 2022 10:21:10 -0800 (PST)
Received: from localhost ([75.172.139.56]) by smtp.gmail.com with ESMTPSA id
 b8-20020a1709027e0800b0016c0c82e85csm10058866plm.75.2022.11.21.10.21.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Nov 2022 10:21:10 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Bernhard =?utf-8?Q?Rosenkr=C3=A4nzer?= <bero@baylibre.com>,
 devicetree@vger.kernel.org
In-Reply-To: <20221121015451.2471196-6-bero@baylibre.com>
References: <20221121015451.2471196-1-bero@baylibre.com>
 <20221121015451.2471196-6-bero@baylibre.com>
Date: Mon, 21 Nov 2022 10:21:10 -0800
Message-ID: <7hsfic88yx.fsf@baylibre.com>
MIME-Version: 1.0
Cc: krzysztof.kozlowski@linaro.org, linux-mediatek@lists.infradead.org,
 mcoquelin.stm32@gmail.com, matthias.bgg@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 5/9] arm64: dts: mediatek: Remove
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

QmVybmhhcmQgUm9zZW5rcsOkbnplciA8YmVyb0BiYXlsaWJyZS5jb20+IHdyaXRlczoKCj4gUmVt
b3ZlIHRoZSB1bm5lY2Vzc2FyeSBwaW5zLWFyZS1udW1iZXJlZCBwcm9wZXJ0eSBmcm9tCj4gYXJt
NjQgTWVkaWF0ZWsgRGV2aWNlVHJlZXMKPgo+IFNpZ25lZC1vZmYtYnk6IEJlcm5oYXJkIFJvc2Vu
a3LDpG56ZXIgPGJlcm9AYmF5bGlicmUuY29tPgoKQWNrZWQtYnk6IEtldmluIEhpbG1hbiA8a2hp
bG1hbkBiYXlsaWJyZS5jb20+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWls
bWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
