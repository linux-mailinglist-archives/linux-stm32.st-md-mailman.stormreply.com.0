Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 96C7584C71A
	for <lists+linux-stm32@lfdr.de>; Wed,  7 Feb 2024 10:19:18 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3D41BC6DD68;
	Wed,  7 Feb 2024 09:19:18 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2E66CC6B463
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  7 Feb 2024 09:19:17 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-33b0f36b808so301565f8f.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 07 Feb 2024 01:19:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707297556; x=1707902356;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=THgk+e9Cb62XQUQpCM4anGjiBdgkprTbUp5Xnr6DNDA=;
 b=Av23/iW6RRf7zdNhEFEO/8CwPEsQZHjlZ0dpyIh36BMzWJR5kWOYGzLz9kRim9F1dQ
 xr6p75sa91lXwzwnmNSLOq6ZDDC7MKx7J7/4pgIgGKtcuuKBcv9GVf6SdVpVYSHg+ti3
 6wdr2LaRVhmjplJx4b9GYPKX4ZpkxQo1d5ZhvyCdlyAAbMIfp6bKf1QuuJ0JS7cimc9P
 WwvZNCLnZzzuhVfJVvbzJHtnnFAAAyGq+sTF7IIQLXLPXnyE+G4ZsxVVP30cH2og80Fb
 i938PIhzldk/GxtkCvgQXVasmVxbRe+SzgxjjFPrDJRlCtSovvuGfwhwyCHzIcvtVZs0
 LHKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707297556; x=1707902356;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=THgk+e9Cb62XQUQpCM4anGjiBdgkprTbUp5Xnr6DNDA=;
 b=T+Ec6R0yQ5mX3+RRt2bE9qmP+v+uH8A3gaznnIi6iZbi85Ju6KAYjIfmBCLzzQSnkQ
 4OqYPXFxHl6tKsU1O4TnyqRopohY0LKmh1vToeji0usBUOYrpWsBBZgEz2WNlqy5qveB
 lvvWQGiDK/4bAgbIi70WFuOQNVNr3XUPQCw/HNRZlYBXQ2YHuQ9KWnEmSxfdJOr9QUvb
 6S5CWZOv0kVhRE1MtBM0op3DBBHJSDU2iT5AfF5vlc/7p89kYF+3vxSxNP5mwego65UB
 cGteZ5feK62fNxdGQ7FGa9eZvHQqsbhUSGQWjWQdaONEOCoAXNa8ww0cdZ5SZuC+yHzF
 hdIQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW111JIq0gnPBX69alIq9OGgfNwadM7yT9vnzmpyLCgjHqFQ3/RApCi/8zhtD1c0KO3gErCAIwthkPGTWx+3SPEi83xRxcuxy9mYtZiuWoxFSfRAVdZ6OkJ
X-Gm-Message-State: AOJu0YzwmXSy5HLGUUOesSzNZsuoKwKv8DUQlNn0uGWzYWcpMOMKD+dx
 WhB84aD/8oMDJ4r4i91g0OSwJaoOaoLVuAExZQUbLJrfevF3igO0qOVW50OiAM4=
X-Google-Smtp-Source: AGHT+IFH3IS82L5gMUchaVBxO2U3Dm3TiOIG6AHHKdxNIxx731oN2gzwqakpiXj2hF5Y0reTcfq/wQ==
X-Received: by 2002:adf:f051:0:b0:33b:26de:ea with SMTP id
 t17-20020adff051000000b0033b26de00eamr3532439wro.37.1707297556498; 
 Wed, 07 Feb 2024 01:19:16 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVWiN+qIiZ+TGCqz6O1ozMaHDU937wmh5nPirJyx1NADCaa8DhzV5aRPcP1mlSeh8HS9tGnzuRYwqGdTodkvALK0+mgXVO87Ajgg1qFaP+36SZu+xs4ctMTJbe/QTi8UKQxz3AuxRxWHghJ+tBTDjP4e2aU8XK7L/Zar6hb1TtfUqdDk+Pajvg6A17Z3ehLjk3EtAKAcNlBMimPGFU9ZutwTsgzR1zDTLoB3Vj6BV+7awo2Qd4kKbzadF7nF1q8g23bprCMoLIidVw+9+tnq5/wJx4eYmATRg+HQIU/QdohVTyula19yRXkyRerG3hRJ08bn2+xB2GsYfsmI3x7Ciu69xbME6dZV7T5d2ezhFUXR//dk/5wwIYwptRGp3MyJumTFHXfgpeRfDlhIELN1Fhoio9bOSQak669MwUghfOz1/s5GNChseQ4qFsej674RQuAETJjWjoQeLjMpuqasSopZBGNY7JhW5OTtd5IbYJXWVtXcdhuN3jqbQ5CqWU6gyhqIwIHUwjaWj/CzcoAGniVOfgsonolBAV5O/qlCp7Mk4rMC3UfJxZyxU/B1JkE2Qsh4CuI5z12vEQWa8xue9rfLQP25L6RiTR5WNAvmNXiFNdtpVTZHS0/5oV5iKdcCqEWXasnhSIycPntk8LJkIkVQOm39whjVtj2rFJpbigZyHSFgKvtiJ5B
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 r20-20020adfb1d4000000b00337d6f0013esm1003490wra.107.2024.02.07.01.19.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Feb 2024 01:19:16 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
In-Reply-To: <20240205-ltdc_mp13-v1-0-072d24bf1b36@foss.st.com>
References: <20240205-ltdc_mp13-v1-0-072d24bf1b36@foss.st.com>
Message-Id: <170729755552.1647630.4818786052103823648.b4-ty@linaro.org>
Date: Wed, 07 Feb 2024 10:19:15 +0100
MIME-Version: 1.0
X-Mailer: b4 0.12.4
Cc: devicetree@vger.kernel.org, Yannick Fertre <yannick.fertre@foss.st.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] (subset) [PATCH 0/5] Add display support for
 stm32mp135f-dk board
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

Hi,

On Mon, 05 Feb 2024 10:06:50 +0100, Raphael Gallais-Pou wrote:
> This serie aims to enable display support for the stm32mp135f-dk board
> 
> Those are only patches of the device-tree since the driver support has
> already been added [1].
> 
> It respectivelly:
> 	- adds support for the display controller on stm32mp135
> 	- adds pinctrl for the display controller
> 	- enables panel, backlight and display controller on
> 	  stm32mp135f-dk
> 
> [...]

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)

[4/5] drm/panel: simple: fix flags on RK043FN48H
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=536090b695c429e9d672f72341a5b6fb147d389d

-- 
Neil

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
