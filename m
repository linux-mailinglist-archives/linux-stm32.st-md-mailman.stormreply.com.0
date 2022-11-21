Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A292631A97
	for <lists+linux-stm32@lfdr.de>; Mon, 21 Nov 2022 08:49:14 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AF0D2C65E44;
	Mon, 21 Nov 2022 07:49:13 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1F621C0D2C0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Nov 2022 01:55:07 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id me22so8764196ejb.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 20 Nov 2022 17:55:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=gAysW166qthpFtRZ9EW6Y4KLPHdWslBVungLYLisyNA=;
 b=ZRBRWoq45blSrBIsZeUEcGgKoTyiBsBgIbXIx9gBoRXZ3isfHzKRuMWAbHxfMZ8Ria
 i54KoxOXJgcZuR8kWiDXANkBtc+D/hKUrwzPYAgFY6v0H/pNeGBmon0e61yaqt8dLCUE
 7xjjino+23/7fckPFV+kZ4ZY3/cuWFTqAXQXka6YpIjKd1mL8MFeZGe9HDi2tX5nxlpW
 TA/xPPa/OTtGS/rfl4nvqC3t9lLHhE15qs2/KT1z4m0LWJ2lvwntAH3ez/CsVT3hpmVP
 pTNjzUL2GEyzASGG4cdhrihanSEjbkGw64DH875rnxT0t60KpikVel093FHWvLZlJtpn
 GQjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gAysW166qthpFtRZ9EW6Y4KLPHdWslBVungLYLisyNA=;
 b=6d+anr1vUBzKHOjYVRl+i8ur/t7DgeLTdov0n0sRiIkqAQyvG8uu2p/gjYynaEITR8
 GJkBUG4c52oqYVTBGjCBQQq/6l1hkF4Mr99OUH0olcf/MsUywh0/9RMztcOd1qFnClOI
 xXdDYyHcjLSjHFeKZl8s6yGoQ3WUP0KeriFjNpGh35qu1Id7DVw0oaOXM1W3a5f9VugK
 Rc+soDNViyBjACxU3kJIQ+dhUQMuEoLpcRs+x9DXQuaFbQ/vV6BM5XsOHhqk4ePsOy3B
 h+lWCP9wXSvimvz0J1Qu1953paBdGoLicZrSvHQfvTsgYp2YP63Ju1UPquXJEDUq9FkT
 sjFg==
X-Gm-Message-State: ANoB5pmPB76jCPodfJcVUWBuhg7NCpd3dSJw5UpQAr/zkzGpjZzU/NFv
 oqZwxC01kiymLssSP5fFQTaHHg==
X-Google-Smtp-Source: AA0mqf42ju9Ig9HbCEQ5Tf/VyWWVHTWoYqPNy4F1KF/X0xBB0zr44Zdgv5HAUw2wXJEHDsc4lmFxWA==
X-Received: by 2002:a17:906:34d0:b0:78d:c16e:dfc9 with SMTP id
 h16-20020a17090634d000b0078dc16edfc9mr13749226ejb.327.1668995706654; 
 Sun, 20 Nov 2022 17:55:06 -0800 (PST)
Received: from c64.fritz.box ([2a01:2a8:8108:8301:7643:bec8:f62b:b074])
 by smtp.gmail.com with ESMTPSA id
 g2-20020a170906538200b00782e3cf7277sm4415513ejo.120.2022.11.20.17.55.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Nov 2022 17:55:06 -0800 (PST)
From: =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>
To: devicetree@vger.kernel.org
Date: Mon, 21 Nov 2022 02:54:42 +0100
Message-Id: <20221121015451.2471196-1-bero@baylibre.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 21 Nov 2022 07:49:11 +0000
Cc: khilman@baylibre.com, krzysztof.kozlowski@linaro.org,
 linux-mediatek@lists.infradead.org, mcoquelin.stm32@gmail.com,
 matthias.bgg@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 0/9] Remove the pins-are-numbered DT property
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

During the review of my MT8365 support patchset
(https://lore.kernel.org/linux-mediatek/20221117210356.3178578-1-bero@baylibre.com/),
the issue of the "pins-are-numbered" DeviceTree property has come up.

This property is unique to Mediatek MT65xx and STM32 pinctrls, and
doesn't seem to serve any purpose (both the Mediatek and STM32 drivers
simply refuse to deal with a device unless pins-are-numbered is set to
true).

There is no other use of this property in the kernel or in other projects
using DeviceTrees (checked u-boot and FreeBSD -- in both of those, the
flag is present in Mediatek and STM devicetrees, but not used anywhere).

There is also no known use in userspace (in fact, a userland application
relying on the property would be broken because it would get true on
any Mediatek or STM chipset and false on all others, even though other
chipsets use numbered pins).

This patchset removes all uses of pins-are-numbered.


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
