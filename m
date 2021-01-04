Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D91E2E9A8A
	for <lists+linux-stm32@lfdr.de>; Mon,  4 Jan 2021 17:13:26 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DF2B3C56638;
	Mon,  4 Jan 2021 16:13:25 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
 [209.85.210.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1BD43C56632
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  4 Jan 2021 16:13:23 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id x126so16683094pfc.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 04 Jan 2021 08:13:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=XDfsTJvF8BHWT/MwLCJjoGuI8FbQRWjKjuVmDMQxU8M=;
 b=mVSg0/91IdSUQNfDZ1CuvV95N73XydEpcMZEkS9cLA7xrpuWEiKRa2CwBZBPaqSQbf
 ocOEQT2NMLlRGb0bYAlWV0tAEwWiBQT6oD0B3R2HBOzslWIJuKCKxOvRcA8YVg8RuZCJ
 d+vXwIENA93kVBVD0o4HxoNca6TMZj6dR+MSqlqg3SsF3LCbMyiItxYf45L2Fx9mIXCT
 EgYSdh8fowgKMvxdlF0b62BbRW/O/kTFqHWpWr2nu2pXEiS1+moU7WAnHxO4/Vxa9+fC
 DCn11syJR9zxjIk3rNxjyZn4kIqPwvbR2yyRVqEYwC7dBZ1wEJnAMiB02GypqSDIEU8r
 wvfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=XDfsTJvF8BHWT/MwLCJjoGuI8FbQRWjKjuVmDMQxU8M=;
 b=DjAN/Xr5wqVaOR1tIPM1b+WWSz1W6ewUbC7GtSMTOLmfy5r+vmPWxHGgZeXaV5Ap3X
 ETeTEcnv1BgDCe67AG/OzyFr0BFyoWzkcvMbbRr8ZcbXvNpIk/lKF5yVC/SK8RKEaAQf
 7IlcsjPD38k0LNz47nvEaqdzCEEsojmOit1x3f2p7gNYcK1+T3jgFmlzJmINQXm6p7f8
 GmHDDEHEbEBLeEFXZIWnqlKLlvjBYkTQa0f06ji5IOfDrI9fPAb1m4rJGU9tY8mEMnm1
 HGFZaKDb4dqBrLfeTpTO52Fwarfc/UJYlxtgIjJq1DjZypmVd93EiuWhCzPCzChm/gm7
 czVQ==
X-Gm-Message-State: AOAM531TORx912goSuQfYCJ+YN2Mhl44venKSEJP4c8eqNoOLGX7uoNr
 aQeupTTMfYdZFlwP7ilg/CoKug==
X-Google-Smtp-Source: ABdhPJxiSbquKtEEXiVFyDA3gyCmMk8WaU6Pzjy6k497zwZtHFZ3/TlUj90UnzII6zSWOz9L7Y+WYQ==
X-Received: by 2002:a65:6659:: with SMTP id z25mr61934189pgv.427.1609776801878; 
 Mon, 04 Jan 2021 08:13:21 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id q23sm57413879pfg.18.2021.01.04.08.13.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Jan 2021 08:13:21 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Alexander Dahl <post@lespocky.de>, Rob Herring <robh+dt@kernel.org>
In-Reply-To: <20201228163217.32520-5-post@lespocky.de>
References: <20201228163217.32520-1-post@lespocky.de>
 <20201228163217.32520-5-post@lespocky.de>
Date: Mon, 04 Jan 2021 08:13:20 -0800
Message-ID: <7hv9ccn0in.fsf@baylibre.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 Alexander Dahl <ada@thorsis.com>, linux-kernel@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Alexander Dahl <post@lespocky.de>, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-leds@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [Linux-stm32] [PATCH v9 4/4] arm64: dts: meson: Fix schema
	warnings for pwm-leds
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

Alexander Dahl <post@lespocky.de> writes:

> The node names for devices using the pwm-leds driver follow a certain
> naming scheme (now).  Parent node name is not enforced, but recommended
> by DT project.
>
> Signed-off-by: Alexander Dahl <post@lespocky.de>
> Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

Queued for 5.12,

Thanks,

Kevin
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
