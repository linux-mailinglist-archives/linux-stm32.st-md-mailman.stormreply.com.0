Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BD4D96B8D88
	for <lists+linux-stm32@lfdr.de>; Tue, 14 Mar 2023 09:38:28 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 709D6C65E60;
	Tue, 14 Mar 2023 08:38:28 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B529EC65043
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Mar 2023 08:38:26 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id
 k18-20020a17090a591200b0023d36e30cb5so1520653pji.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Mar 2023 01:38:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678783105;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UPJYNbXFi/Ctx3xjjqRBnzpF+Xg2J0/zDi2z4/kZT+U=;
 b=ymM7vtMg3u9UwyiW7tHFqEfu4rRGdh5Fwx0h2UlZfo8KHrJV4NpDW7wKThne67vX54
 NzPJZD8BRbBVlXDMcefVRh/nb9rohHr7qoi9VDqIxxRcgMgYlfmV405deF2VQieH4hY7
 DVS5A4HvJWxHt1sIIwJElJWJ9vyxsfCUeLWyHAg0enQGVfpYQHVQNKP7fT7DkppWM4d3
 v/Dxd5Vtxn+3IE8nbJ21jOAyVg5pzy4yDpO1Sih5yFDR3thE0MMS7LqIgbWenyOnvHqD
 3g5aFjD0idXU/2MCbtu9ehIIMJk6txSdpxq6ouaCsC/TrkmZIJV0DrOs/UfDmEmaGhIM
 M7vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678783105;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UPJYNbXFi/Ctx3xjjqRBnzpF+Xg2J0/zDi2z4/kZT+U=;
 b=r99TPf5S1EMrkEFKwcyk1xUaNJNXrw8rL9K/1EeZXmotQnBzKPEEy6gjrI067BZgii
 SZj+vvOO4fbbz2Bl/re9O4KI4Opxo4dgdnrxUVAbVG1MvbMGRf113PdEEpqGbFhJqvZA
 u/3EnWmP35rcyZ6rCEg/wZWbrsc7UBcrtCVBTSV8wqa2WVkDXsMuPZBY6yhk+ig+52Py
 yu8RNn2STJ9LrjeEG/evneE4V7XT9aUHMvlyt4LIxxiWU138IUScxN7V6nuViU8fGz1L
 kT+pC80tHDmtaNXhFAQ4MC3g8FDepqfIGgrHLe07V92iPA6vvtMEv9/iWwpQEDDKpjQ4
 CE2g==
X-Gm-Message-State: AO0yUKVPtk3SdP4WdeNRzofT1UQP/VkI7guVr/aL20Y1u8nBquN472dI
 tVtcOplWYpOWqkwVJh1WsMw9NA==
X-Google-Smtp-Source: AK7set+mSOw6/Z7UNLusxu0cPog1WBuZ2ETFik07TEQE4ZtEVrHe5a/SxmqywsMBcH6uKFj1OvL0hg==
X-Received: by 2002:a05:6a20:a88a:b0:d5:1f75:669a with SMTP id
 ca10-20020a056a20a88a00b000d51f75669amr2842812pzb.13.1678783105070; 
 Tue, 14 Mar 2023 01:38:25 -0700 (PDT)
Received: from localhost.localdomain ([49.206.34.126])
 by smtp.gmail.com with ESMTPSA id
 p14-20020a65490e000000b004fb95c8f63esm1036839pgs.44.2023.03.14.01.38.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Mar 2023 01:38:24 -0700 (PDT)
From: Naresh Kamboju <naresh.kamboju@linaro.org>
To: u.kleine-koenig@pengutronix.de
Date: Tue, 14 Mar 2023 14:08:13 +0530
Message-Id: <20230314083813.38074-1-naresh.kamboju@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230303213716.2123717-1-u.kleine-koenig@pengutronix.de>
References: <20230303213716.2123717-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Cc: alexandre.belloni@bootlin.com, nicolas.ferre@microchip.com,
 alim.akhtar@samsung.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-watchdog@vger.kernel.org, leela.krishna@linaro.org, f.fainelli@gmail.com,
 bcm-kernel-feedback-list@broadcom.com,
 Linux Kernel Functional Testing <lkft@linaro.org>, linux@roeck-us.net,
 kernel@pengutronix.de, rjui@broadcom.com, vz@mleia.com,
 linux-samsung-soc@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 wim@linux-watchdog.org, linux-arm-kernel@lists.infradead.org,
 sbranden@broadcom.com, patches@opensource.cirrus.com, dianders@chromium.org,
 krzysztof.kozlowski@linaro.org, mcoquelin.stm32@gmail.com,
 claudiu.beznea@microchip.com
Subject: [Linux-stm32] [PATCH 00/34] watchdog: Convert to platform remove
	callback returning void
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


> Hello,
> 
> this patch series adapts the platform drivers below drivers/watchdog to
> use the .remove_new() callback. Compared to the traditional .remove()
> callback .remove_new() returns no value. This is a good thing because
> the driver core doesn't (and cannot) cope for errors during remove. The
> only effect of a non-zero return value in .remove() is that the driver
> core emits a warning. The device is removed anyhow and an early return
> from .remove() usually yields a resource leak. One driver suffering from
> this problem (s3c2410) is fixed by the first patch.

This patch set applied on top of Linux next.

Build tested with gcc-12, clang-16 and clang nightly.
Boot and LTP smoketests performed on
 - qemu-x86_64
 - qemu-arm64
 - fvp-aemva
 - qemu-armv7
 - qemu-i386

Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>

--
Linaro LKFT
https://lkft.linaro.org
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
