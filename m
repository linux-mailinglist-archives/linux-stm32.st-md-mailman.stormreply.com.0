Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 40E7FB022F5
	for <lists+linux-stm32@lfdr.de>; Fri, 11 Jul 2025 19:45:01 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C666AC3087A;
	Fri, 11 Jul 2025 17:44:51 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 19B53C36B0E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 11 Jul 2025 17:44:50 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-32f2947ab0bso16935871fa.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 11 Jul 2025 10:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752255889; x=1752860689;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u+ZM5SO8L4rZ2xYIS3dtWrMrDyHsyXlquIkrSDaXE+w=;
 b=oWOqQZhfDqFTjDNIw/cykQXMEnFZT4wEtiV8xAVcnXNZd4lPqwNNWor6lGuOmWcnvh
 TwvBO6hjWDJIR0E9lifLrhBlIqg3t23E0zYXbJ+TQe9tLbx88pvmo/8R+A48z5ba5N92
 xHsMECxQYUVEkdFuYd+BPZa00X8hWQIfozJKkomJSFjfu8M56S3HOzcCWIIlaL02uHlK
 oZ+Vicp0Fc3U8Ps8D8xzbnc1SnuqhCO+9PRMOoMnI05xrqVqjjLbUHbijucdoS9+gQSe
 Z/cEPLmmFAwgT8a31PuwAp5U3y7RNYDYffzVEnA/7HpamAgSwNel/cUNchoMxl0TuRzi
 s8MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752255889; x=1752860689;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=u+ZM5SO8L4rZ2xYIS3dtWrMrDyHsyXlquIkrSDaXE+w=;
 b=G8ISVxjju4fI+FtY+NJ15NNrvYIjfJ5UjqlBFqyEuyznLhL3D/L+gMfXb9oaVroCGV
 byj8tL+R/lPJK3nWa0bSQd8vW5bHIKJT6M2XM9XLXAss7Rwyn+prkAr9W0K41fK2IGsA
 JZ8T4hORZuGrBv9z9qzOQ5fNGthxH275fujagNmRx5pJ53ynjIlQLKto0+V7pqp5T+aU
 IoGVtSL/pFf2wTvvwbT35FOWA3eLzuYoUdhYVVj0OtQZzlKzvO0lzIHOsUtdxKtNzzcn
 ZqxFvfM6hVYTPDUXbcm4E5vtwyjgX9/Ea3YlOPy+75ZKu4U/GnlKkqOiFIpEyCWh5Z1y
 yR+g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVLW5FpYEYg4yap3bj+d7XHVNV9khSkyZ7gQs3yh74KAut6t+/6fo97J+JJCVVI2fERc0nLC+r88lPptA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzjVv+e5Wz9BUnZv8vfz9gFRbbga7JijwNEnsjU/ZkIrGoRvZGJ
 RP4FA1rWVOvdJOT6TdZYYko/d4BeSbbg3sx4Jk4sJddtB3Mn07EzuQ4AdGcK0fngrQs+hCKfJYI
 oqTObMkWKmkBKYIPXYrBacLTI8qKkrOdClCbOoNu/0w==
X-Gm-Gg: ASbGncsI6ZGeOl4jIJ0VHEWibIibLz5rB7+xfxf6znj15Qi53gHVkvjmevtnIwbHjW+
 eyzSYJiZHrL3EnH3PUAKGxA3gDJ31gooFy8oGrxtqvpB3y5lfR30M+kS7Pv2bWfPbwtlzATXGY3
 io3A+fymDvSufMy93E6RZNzMpwz+S9lA8QlkreYij+5By+ct6F96Df+YdAfx1bAqrYf0o0JSV+I
 bkZUAw=
X-Google-Smtp-Source: AGHT+IH6ZOzBfHIgYUwgOc3NHyt2gji+Em8NzLEp8xFU4pLvltizLDn2SrTtw5BwtYgzrpRFDHd1anYmDStmm3/BYxA=
X-Received: by 2002:a2e:ae05:0:b0:32b:75f0:cfa4 with SMTP id
 38308e7fff4ca-3305343ffbdmr14799021fa.25.1752255889239; Fri, 11 Jul 2025
 10:44:49 -0700 (PDT)
MIME-Version: 1.0
References: <20250710-drm-clk-round-rate-v1-0-601b9ea384c3@redhat.com>
 <20250710-drm-clk-round-rate-v1-5-601b9ea384c3@redhat.com>
In-Reply-To: <20250710-drm-clk-round-rate-v1-5-601b9ea384c3@redhat.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 11 Jul 2025 19:44:38 +0200
X-Gm-Features: Ac12FXxUNTUQvVOGg3MoOkpShRe7WywXW6kbpP4WvN3P-CcJwwv5gR7MoObTWCg
Message-ID: <CACRpkda3R+2hhzvd+snkTGrRb-gZ8OUvzAhFE5Cg6yXfZ+E4nQ@mail.gmail.com>
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
Subject: Re: [Linux-stm32] [PATCH 5/9] drm/pl111: convert from round_rate()
	to determine_rate()
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
