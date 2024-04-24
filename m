Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8371E8B018D
	for <lists+linux-stm32@lfdr.de>; Wed, 24 Apr 2024 08:10:15 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3C951C6DD6D;
	Wed, 24 Apr 2024 06:10:15 +0000 (UTC)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com
 [209.85.219.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A5715C03FC3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Apr 2024 06:10:14 +0000 (UTC)
Received: by mail-yb1-f182.google.com with SMTP id
 3f1490d57ef6-de4bfdb606dso873943276.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 23 Apr 2024 23:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1713939013; x=1714543813;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=CQD62Ewa/Pm8/wvoE00gVyYTVUY/vDTMKiupQNjrTRQ=;
 b=VQIdEoZgsNVGzgXdwHc6VYxVF0g6JI6FPuyGP9FmeocCZxtA5SSYyd11PZTEaSePme
 U+xhf7YSrL0P56TAeZ2WlCkxLfkQkfyXuP2tXv9In+t4MFwrH7glfYnJ3zRrJH/w7RVu
 v51zbv0bOSu378+8cyMk+VCYEc2bl0Qz5hu/uet6cgFdQsVRjzfc32HUUoGkRQu7WHJ/
 oNPQE7DtsxVv1e4xdxVoT9s53set93lhMtdhUiCmlTXlVABYvitGviI6Zh+W24xTxWX5
 My2zCL/yKQskWwxaYzBgCEbGwmEA4lNrLJpoTjVtgNRCTgZs37K+571UxNMo/JCvfzny
 hooQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713939013; x=1714543813;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CQD62Ewa/Pm8/wvoE00gVyYTVUY/vDTMKiupQNjrTRQ=;
 b=J4kQTozF8NyrUQIk/AoTe/5F3hj4i/DGxQuq7+uPGGcACvAPibSqsoggn4y/VruW13
 cD0v2/c2QOEqtOW4LG1ZF44AyEo69PEZllxy62hIiJnlxQJDA1QCbkm4glAUKCY7ER2d
 aSbpAstW+MXEKzG07bW/YsdPpqKea/NtCtuWu4/zHfQaKF5hGY31ET56JOvwaxZXfKo+
 3JlEa07E9RxO9Il95MFQORprn/ohPTGpZBoncduJqdp9rUSiE2ZEvamVs3Bg+8uw8Aw8
 6lyytMsbUbh2NmRXwXZ0BjkaqYfIbkDGh0EaO43iMWBBOq/mRdepv/8HnsIIL31MJNgT
 gSJA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXOtRMAeeLK7pXJbVphkVwgVC0uI2B+53ft0Vqq0CZEBQJjbXX7gnpyHfPBRvsUy0s2Q+Zxz8qwmYgFMEqwXCn3J5spOBhveNGMUbpQ+zheg6KjuVdDTo8q
X-Gm-Message-State: AOJu0Yw9wy1cBBkUCIV8c/OCsvr3kHiIQ+2E7ZjUjFb8G5vnadBOWQOw
 +IsadDq53oPsCtYURMoDLsZaoJwj8vs7fHMnWY9no+h8DnJYFoWx
X-Google-Smtp-Source: AGHT+IEaOALM/yuZxT0gddoKfUFAo2OImPPHSqyQT2w2gYutI2hgjCyWDDRGbA+qwsEQlonnW4QUSA==
X-Received: by 2002:a0d:f385:0:b0:618:55bf:d023 with SMTP id
 c127-20020a0df385000000b0061855bfd023mr1127114ywf.5.1713939013421; 
 Tue, 23 Apr 2024 23:10:13 -0700 (PDT)
Received: from hoboy.vegasvil.org ([2600:1700:2430:6f6f:e2d5:5eff:fea5:802f])
 by smtp.gmail.com with ESMTPSA id
 dg13-20020a05690c0fcd00b0061b0f6d3e4esm2802120ywb.128.2024.04.23.23.10.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Apr 2024 23:10:12 -0700 (PDT)
Date: Tue, 23 Apr 2024 23:10:09 -0700
From: Richard Cochran <richardcochran@gmail.com>
To: Oleksij Rempel <o.rempel@pengutronix.de>
Message-ID: <ZiiiQY9Z5-uyGZxR@hoboy.vegasvil.org>
References: <20240417164316.1755299-1-o.rempel@pengutronix.de>
 <20240417164316.1755299-3-o.rempel@pengutronix.de>
 <c8e3f5d0-832b-4ab1-a65f-52f983ff110a@lunn.ch>
 <ZiAtREiqPuvXkB4S@pengutronix.de>
 <b44a4aee-f76f-4472-9b5c-343a09ed0d33@lunn.ch>
 <ZiITWEZgTx9aPqIy@hoboy.vegasvil.org>
 <ZideTxpOcPTbR9yt@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZideTxpOcPTbR9yt@pengutronix.de>
Cc: Woojung Huh <woojung.huh@microchip.com>, Andrew Lunn <andrew@lunn.ch>,
 Arun Ramadoss <arun.ramadoss@microchip.com>, kernel@pengutronix.de,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Russell King <linux@armlinux.org.uk>, UNGLinuxDriver@microchip.com,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next v1 2/4] net: phy: micrel:
 lan8841: set default PTP latency values
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

On Tue, Apr 23, 2024 at 09:07:59AM +0200, Oleksij Rempel wrote:

> Are the recommended FOSS projects managing calibration values per-
> linkmode/port/device in user space?

No, I haven't seen this.  I think the vendors should provide the
numbers, like in the data sheet.  This is more useful and flexible
than letting vendors hard code the numbers into the source code of
device drivers.
 
> What is recommended way for calibration? Using some recommended device?

You can try the "Calibration procedures" in IEEE 1588-2019, Annex N.

Or if you have end to end PPS outputs (from the GM server and the
client) then you can simply compare them with an oscilloscope and
correct any static offset with the ptp4l "delayAsymmetry"
configuration option.

Or if you have auxiliary event inputs on both server and client, feed
a pulse generator into both, compare time stamps, etc.

Also linuxptp supports Meinberg's NetSync Monitor method.

Also there are commercial vendors that rent/sell test equipment for
PTP networks.

So there are many possibilities.

HTH,
Richard


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
