Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 83B55A9FAD1
	for <lists+linux-stm32@lfdr.de>; Mon, 28 Apr 2025 22:54:08 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3A579C7802F;
	Mon, 28 Apr 2025 20:54:08 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DD530C78011
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Apr 2025 20:54:06 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id
 d2e1a72fcca58-7369ce5d323so4375720b3a.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Apr 2025 13:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1745873645; x=1746478445;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=duqrSY39uZvRf9QP4FI5wn82Hvp3y0G6BGsbl6wCfsU=;
 b=QXgFdSBWr7zQOZG4j06hk83uXml4WiDb2h7hIzbPwHR3mXvO6aRwFhgoA2DHVWvDIV
 /2gGEmmLnTNjV80LaeDOzh6joqAJ/73gvm4vf2TQpgxzDgvzWM2fOyusph0Tmw0P/obP
 gZt7VckshPNCQ3kdCgtLxyUhYUExtLRxAxYGg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745873645; x=1746478445;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=duqrSY39uZvRf9QP4FI5wn82Hvp3y0G6BGsbl6wCfsU=;
 b=NRUEWC+EgAujAkkOwRqF8wsdX1Esg6XD8mWhBAB40nEGdKWJ6WkxsCnQYlGQWdCjS+
 Nv9t9mLqjj1z5mZRuWh1uT6G6QNaveONd3M86lz56T+3MXTnxcRMqHQSTOYNZTvE9Zml
 aktSrMvifboPLMfsupC98dRYx3k9MonkNCByphINvOXiVp8eM7Cwm58tLuvNJbED6B9o
 4PcNj3P+Igy4z1m+uudYIDi3VBdRjLQ8RsDCJ14pJHpdqEv3j2OqGZIld6Wf6k7sBs3i
 BzRldlkKDg63HRQwn+MNxunQreTHOxICX7LyTOtTuvJ2SQpDvG6dVV3ngpXHD3EE/q9F
 x05w==
X-Forwarded-Encrypted: i=1;
 AJvYcCValywebaj9x2cMVEdxXvrCWARJ7c7NgR03ObtkvuP0EOp/uM+KA+YjdpRjGfuoDabUJEKkC+FiFyQllw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwZcz8P8+xuoAiIHjhBratkhm47t6qT21Bq5K0BWy8JYWuKp4rV
 8cHgp1Lm8A3REbDuQoceUl/HgGs17YD+p6OOP8QFp3VxfDFxgGsP1HkzM7L3iK/rSBJmV9Jk+1s
 =
X-Gm-Gg: ASbGnctoxClTJyOLmVM9w9aDxIg5y3SC3BuH7V98h0h+YjSzMbQ9mNNwTD4bWZCKiJR
 7/NBpPwBZtDaG9A7shIZq7WA1El5lfsrZn0j5W0xUJrhTl1yBdMuNPkvtuzbcM9hYZLOmpeazn7
 Af7ZjFe6xpb6YFlYqAcc2+eiPRRzvdu+Bt2iMEzNNL6T57rIcTWlZX2Xpejmnw/BYiqoewFGjfZ
 IJAQyJdSke1Rn8Yn0/KIBuzPWO+6qQP7c4SpYkAURJtGy51Kp9a0vkG7m0SSwNyBEV3FofJf8q+
 CId4PpBaXJZNvqLBZSM2GxtL2M9dFc8t2GJM++OR46kCG2IQBSqsZkyIzaCeOSEFesojXipMMZ4
 iS5oP
X-Google-Smtp-Source: AGHT+IF0koe8R0mVN/SUvwhOIiuAbzknDsEYdlTGQ/0YpGezVjMaPPasWDOirE+U72DsTvyvQHnIPQ==
X-Received: by 2002:a05:6a00:22c5:b0:736:4e0a:7e82 with SMTP id
 d2e1a72fcca58-7402713d45emr1818724b3a.10.1745873645377; 
 Mon, 28 Apr 2025 13:54:05 -0700 (PDT)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com.
 [209.85.216.53]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73e25a6b462sm8481869b3a.114.2025.04.28.13.54.04
 for <linux-stm32@st-md-mailman.stormreply.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Apr 2025 13:54:05 -0700 (PDT)
Received: by mail-pj1-f53.google.com with SMTP id
 98e67ed59e1d1-3035858c687so4431846a91.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Apr 2025 13:54:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUQqtEjvRmmdvwJ9LhmIo/WY0MZBztSex3tKBHJ37Y5koC3dtlMALAOdgxMLX7ETHsJ9B2rJ+OSSYTaAg==@st-md-mailman.stormreply.com
X-Received: by 2002:a17:90b:2d08:b0:2fe:b9be:216 with SMTP id
 98e67ed59e1d1-30a215a9e35mr1596359a91.31.1745873644318; Mon, 28 Apr 2025
 13:54:04 -0700 (PDT)
MIME-Version: 1.0
References: <20250424-drm-bridge-convert-to-alloc-api-v2-0-8f91a404d86b@bootlin.com>
 <20250424-drm-bridge-convert-to-alloc-api-v2-13-8f91a404d86b@bootlin.com>
In-Reply-To: <20250424-drm-bridge-convert-to-alloc-api-v2-13-8f91a404d86b@bootlin.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 28 Apr 2025 13:53:52 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WBxgJ9HZK=UyE8R17OiM0+ME2Lp5O7zoZRVOw2z6_sng@mail.gmail.com>
X-Gm-Features: ATxdqUGX6srhk44LYXds4__tJ7VKjYOOGbCee4VbhetmdBaO7SswZM-oniFpcj8
Message-ID: <CAD=FV=WBxgJ9HZK=UyE8R17OiM0+ME2Lp5O7zoZRVOw2z6_sng@mail.gmail.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: imx@lists.linux.dev, Herve Codina <herve.codina@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Paul Kocialkowski <paulk@sys-base.io>, platform-driver-x86@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Simona Vetter <simona@ffwll.ch>,
 chrome-platform@lists.linux.dev, Krzysztof Kozlowski <krzk@kernel.org>,
 Robert Foss <rfoss@kernel.org>, David Airlie <airlied@gmail.com>,
 Anusha Srivatsa <asrivats@redhat.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Jonas Karlman <jonas@kwiboo.se>, linux-arm-msm@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, linux-samsung-soc@vger.kernel.org,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Hui Pu <Hui.Pu@gehealthcare.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Dmitry Baryshkov <lumag@kernel.org>, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 asahi@lists.linux.dev, Thomas Zimmermann <tzimmermann@suse.de>,
 Shawn Guo <shawnguo@kernel.org>
Subject: Re: [Linux-stm32] [PATCH v2 13/34] drm/bridge: ti-sn65dsi86:
 convert to devm_drm_bridge_alloc() API
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

SGksCgpPbiBUaHUsIEFwciAyNCwgMjAyNSBhdCAxMjowMOKAr1BNIEx1Y2EgQ2VyZXNvbGkKPGx1
Y2EuY2VyZXNvbGlAYm9vdGxpbi5jb20+IHdyb3RlOgo+Cj4gVGhpcyBpcyB0aGUgbmV3IEFQSSBm
b3IgYWxsb2NhdGluZyBEUk0gYnJpZGdlcy4KPgo+IFJldmlld2VkLWJ5OiBIZXJ2ZSBDb2RpbmEg
PGhlcnZlLmNvZGluYUBib290bGluLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBMdWNhIENlcmVzb2xp
IDxsdWNhLmNlcmVzb2xpQGJvb3RsaW4uY29tPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vYnJp
ZGdlL3RpLXNuNjVkc2k4Ni5jIHwgNyArKystLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2Vy
dGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpSZXZpZXdlZC1ieTogRG91Z2xhcyBBbmRlcnNvbiA8
ZGlhbmRlcnNAY2hyb21pdW0ub3JnPgoKSSBjYW4gY29uZmlybSB0aGF0IEkgY2FuIHN0aWxsIGJ1
aWxkL2Jvb3Qgb24gYSBib2FyZCB3aXRoIHRpLXNuNjVkc2k4NgphZnRlciB0aGlzIHBhdGNoLiBU
aHVzLCBoYXBweSB3aXRoOgoKVGVzdGVkLWJ5OiBEb3VnbGFzIEFuZGVyc29uIDxkaWFuZGVyc0Bj
aHJvbWl1bS5vcmc+CgpIYXBweSB0byBoYXZlIHNvbWVvbmUgZWxzZSBsYW5kIHRoaXMgdGhyb3Vn
aCBkcm0tbWlzYy1uZXh0IG9yIEkgY2FuCmxhbmQgaXQgdGhlcmUgbXlzZWxmLgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5n
IGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0
LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
