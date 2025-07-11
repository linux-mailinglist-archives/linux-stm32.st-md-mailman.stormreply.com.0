Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FDADB022F0
	for <lists+linux-stm32@lfdr.de>; Fri, 11 Jul 2025 19:44:31 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B1456C3087A;
	Fri, 11 Jul 2025 17:44:30 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 55F95C36B0E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 11 Jul 2025 17:44:29 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-32f1763673cso31037971fa.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 11 Jul 2025 10:44:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752255868; x=1752860668;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u+ZM5SO8L4rZ2xYIS3dtWrMrDyHsyXlquIkrSDaXE+w=;
 b=giY/v5Y+3+CqNbrjgJXVEcIC0OW5Ju84RXfoDG6oQr8t/FCnHxxATDKzyMpLZpPJOU
 IlSTcOCpQB4SOW/COuMGHP7XT90II8dRA1BhMaDw1lX4CMIgFKOwMNoQwhJrTahTlUYs
 OF2VB8B7jMjrnTAy2x4kr4BbTwpNDkart2ghge8H4Cwvzx1kCSqBXrdrhiVfnUjrJu06
 SNCEseukER/hCyW+JbcYPzzov/Q1j3jRhoS+okoJG+MFzOA/qmKQZI1FEIWZmIsrKJit
 WN+uvNzEDUzNrDqhw7K3ASzv5GQasQSoA6W1kTyxCx1doYSCJYzDN1r6O55RnSuo2vF8
 kWPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752255868; x=1752860668;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=u+ZM5SO8L4rZ2xYIS3dtWrMrDyHsyXlquIkrSDaXE+w=;
 b=THosHe8jNOjF3w9XzVdD3Y+L2qMxZeKDUUCSoM0c0IUnwvMwBqiqpXmVQQ/cCcdyPN
 UfkV8o8ux8gokIF2/1GfbgF6v1ebjYmbYz87DVwuSD0XADN3yBuqL38Kj6RVTMn+a5ge
 KJd94GbRFJAlqNv3ufl+jW3PJO11TAH47WKLfQkSmV6Xtfv9Eaz5XJWBxfIPhWk0iKx0
 DVHq4tOydtt53oyWKcvaYSO0EI0FTre9RSpmYTm4CRo2779/fRVJ8JleXVdlQvF1RByI
 3bXNpl7Rr6B0/MB12SEiMktS3rWsYRYzG37021Rthp9ltU85vcnfd5kR5oDymMFFoiBo
 /6Ww==
X-Forwarded-Encrypted: i=1;
 AJvYcCURvSrbsNzPJSKm+N01cUR3qNTbmZ2h6jHqeU4NOZ9Qt6vTnISRD9RXoYTypAasNiGMDQSTIMMkdKLY8g==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzSywLmhCkblliBd6VBlIuJ9iJi4s5PVJlKxPGb665xU/rEO3GQ
 vK1BzjqTAuxZzFfuY+6bRK5b9QNzIqEBVzwhgWRiChTUyW2USODFtszar+FPlkBWg/5hO7rtOSj
 gwWNrRwAFNj5kKQMhe8/GaIL1JzJW8E0kC8mGRlnZFg==
X-Gm-Gg: ASbGncs8P3+Q3uv7lh+Gx8TB+Jodd67ii9uWM69CwocQ5KgjZpJTlrmDgUKZdDspEL4
 PopaqDO3YSqMGEKRKQdUf1uM6Pegks4ZqqeEXPjfgVGoFCb8ZWZs7FT69Ke1L6lzGh8A7nJEUEj
 C6C5BqH+N3KQW/d1BuyMgMkumFVAsh/b57txk+/8WBWz79U/xFfcGVCRCzxFNRGW0DaovV3BVYW
 Jd9F8M=
X-Google-Smtp-Source: AGHT+IHCwFbr6hM4SofCoKFNuaGsZexul62ZHJaP09xPkxTc5K3eZJNMRyy9Lqm+DJrLEpWrNm0Dt8rNW5UZHZ3ILnk=
X-Received: by 2002:a05:651c:111b:b0:32a:6b23:d3cc with SMTP id
 38308e7fff4ca-3305341163emr16031911fa.25.1752255868348; Fri, 11 Jul 2025
 10:44:28 -0700 (PDT)
MIME-Version: 1.0
References: <20250710-drm-clk-round-rate-v1-0-601b9ea384c3@redhat.com>
 <20250710-drm-clk-round-rate-v1-2-601b9ea384c3@redhat.com>
In-Reply-To: <20250710-drm-clk-round-rate-v1-2-601b9ea384c3@redhat.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 11 Jul 2025 19:44:17 +0200
X-Gm-Features: Ac12FXy5w5LZfYTJ16GWumg6iWoXPYqfrbZ0euf79O43X2SKG618Bj4k3h1lAGY
Message-ID: <CACRpkdZus86rP1BiSw2j24eaSuMrCEorZU9Rc4ouWmmz8iaqhA@mail.gmail.com>
To: Brian Masney <bmasney@redhat.com>
Cc: imx@lists.linux.dev, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Marijn Suijten <marijn.suijten@somainline.org>,
 Fabio Estevam <festevam@gmail.com>, linux-clk@vger.kernel.org,
 Simona Vetter <simona@ffwll.ch>, Samuel Holland <samuel@sholland.org>,
 David Airlie <airlied@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Chen-Yu Tsai <wens@csie.org>,
 linux-sunxi@lists.linux.dev, freedreno@lists.freedesktop.org,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-msm@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org, Dmitry Baryshkov <lumag@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Shawn Guo <shawnguo@kernel.org>
Subject: Re: [Linux-stm32] [PATCH 2/9] drm/mcde/mcde_clk_div: convert from
	round_rate() to determine_rate()
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

T24gVGh1LCBKdWwgMTAsIDIwMjUgYXQgNzo0M+KAr1BNIEJyaWFuIE1hc25leSA8Ym1hc25leUBy
ZWRoYXQuY29tPiB3cm90ZToKCj4gVGhlIHJvdW5kX3JhdGUoKSBjbGsgb3BzIGlzIGRlcHJlY2F0
ZWQsIHNvIG1pZ3JhdGUgdGhpcyBkcml2ZXIgZnJvbQo+IHJvdW5kX3JhdGUoKSB0byBkZXRlcm1p
bmVfcmF0ZSgpIHVzaW5nIHRoZSBDb2NjaW5lbGxlIHNlbWFudGljIHBhdGNoCj4gb24gdGhlIGNv
dmVyIGxldHRlciBvZiB0aGlzIHNlcmllcy4KPgo+IFNpZ25lZC1vZmYtYnk6IEJyaWFuIE1hc25l
eSA8Ym1hc25leUByZWRoYXQuY29tPgoKUmV2aWV3ZWQtYnk6IExpbnVzIFdhbGxlaWogPGxpbnVz
LndhbGxlaWpAbGluYXJvLm9yZz4KCllvdXJzLApMaW51cyBXYWxsZWlqCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlz
dApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQt
bWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
