Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C251AF0F3A
	for <lists+linux-stm32@lfdr.de>; Wed,  2 Jul 2025 11:10:58 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 855B0C3F93A;
	Wed,  2 Jul 2025 09:10:56 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1608EC36B3D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  2 Jul 2025 09:10:55 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-450ce3a2dd5so32905915e9.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 02 Jul 2025 02:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751447455; x=1752052255;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SCvgBdrIzmyxvo92jPpKMB/LyPu8S/mztJbd6iPipx0=;
 b=ClTS6wDaBfwyxpgUVNjlcK+7OhxfQSOsAiZbGY69TenyoEHTmH4u6ajZdU2cuqckWX
 cTLoP1kJY6Gakt9ZOeY9GpfuEgvs3KPAaptrUHLQqsK26HkKgVJ6IMSo5H7ISsQ6zoj+
 1NF376dlrG9WqAn0UKQCRFR6OsCAbh42KY/u1ZatcmV3+d+shZzdMhuRgPsWolO/BWqX
 Pv3l+y/tlsmnH0zy0oNxiiXShkBL7bIOwzjBTddP1IBV22ZIibtKEXIOvTHf8KHw3cMM
 51Yq+R69tx01G+K9vAhJGNQ0h0JV9g9b7cUETwjcmrsFMjAM80EZ2PL4Bj+SuiKTESm7
 5VQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751447455; x=1752052255;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SCvgBdrIzmyxvo92jPpKMB/LyPu8S/mztJbd6iPipx0=;
 b=RLEUYGuycMeHxD9piTTdl/R0OHCznhIh/jeQ5XiHk16e0Y0G9g+hDSuaQjpFBn3apK
 rgc05rOi9QQyqzV4ZCA7DPx81fqo1I0fykvEOljgjXGwBxE3AEdKQRk2SFn7OhBsP/QS
 Eeglnhc+mWp1eqi3r6pdd470rtqH+3BxntSc/n0E8pvDA6bN/xOILXR52lwdjaW7c0gy
 kgOWT1ypAGX1Z7Gyctrs7ylMqZ70E+o6Fu/sRKA3qsrdBgtyCbh+bR1KwUoOriVskLSo
 iif95FaYT7/wRCky0aWnDRYEWCTOCcvictmWQYGvpYf/lMJzOrn/pKMeSS4JERycVyGE
 7b1g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWTO8BzSTzPgG8eokGuPwlq9IvL5H+V1eThcGTTPDHd3DfCBUuFzK2/cmapReHwsnpfnq/qpeFqnSzgFA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyJ2hS8C68XvcpOdiPA1kOabxaFPXxRNkp85vPkDnP4m0cDAdOI
 U3ESeeNMG+Q1Rc2yxoB8QbtF1c0KjKGVi7ftxeGzGOJNtY3tzfz1MsKAgLujKwQzkt0=
X-Gm-Gg: ASbGncvdnRO42RjbwOjYJ9ZtBdsROcU+r8NIRea8/TTKN/rrCjGeSxo98BiDdouRLI/
 Q/tCUmKY+gUExCSX9CLENepBcpEU3ORZkRl+MmsEDBaBU1JN3YH8OV7VvwNENawD7e4zZZuWeBi
 C0U8eaeQBW8HtLJm9jvV8H70kHAWxoHSd8fEW++/MR27GEAoN7B2TXyYWcXj9nxSBDnvoOmicoO
 u5ynkLOEhXTJ+RTEyw2ScOKSirZEM3pNn9rm5/3utf09pcqbpkNTyOlsYo7AGbw7VvBe0V3kwBz
 PpPHdfvp/uGXbfC+nLut42P0S0sYlCyyt1zP4+CC90P4KpvZ9G0j/N+CTAAj
X-Google-Smtp-Source: AGHT+IE2uNkHx82MMiG8CGeHGUvRcCCh7iICIVjsq7NBy92UZNfJfN/G6zonzIOaQuM2K57woKCLRg==
X-Received: by 2002:a05:600c:6818:b0:442:ccfa:1461 with SMTP id
 5b1f17b1804b1-454a36e3ec8mr22278755e9.13.1751447455288; 
 Wed, 02 Jul 2025 02:10:55 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:8827:d0e:25e:834a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4538a3fe28dsm192866295e9.20.2025.07.02.02.10.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jul 2025 02:10:54 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Ludovic Desroches <ludovic.desroches@microchip.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Andy Shevchenko <andy@kernel.org>,
 Thorsten Scherer <t.scherer@eckelmann.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Orson Zhai <orsonzhai@gmail.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed,  2 Jul 2025 11:10:51 +0200
Message-ID: <175144745011.23577.5985560691841779187.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250625-gpiochip-set-rv-gpio-round2-v1-0-bc110a3b52ff@linaro.org>
References: <20250625-gpiochip-set-rv-gpio-round2-v1-0-bc110a3b52ff@linaro.org>
MIME-Version: 1.0
Cc: linux-gpio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [Linux-stm32] [PATCH 00/12] gpio: use new GPIO line value
	setter callbacks
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Wed, 25 Jun 2025 12:33:23 +0200, Bartosz Golaszewski wrote:
> Commit 98ce1eb1fd87e ("gpiolib: introduce gpio_chip setters that return
> values") added new line setter callbacks to struct gpio_chip. They allow
> to indicate failures to callers. We're in the process of converting all
> GPIO controllers to using them before removing the old ones. This series
> converts another round of GPIO drivers.
> 
> 
> [...]

Applied, thanks!

[01/12] gpio: sama5d2-piobu: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/df213abe6913cae8d1d69efa66b725831f63e663
[02/12] gpio: sch311x: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/e932e894aec6ee22d7314f74e0a27db244a14fdb
[03/12] gpio: sch: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/883c7eb2c4a9e143b2662ba754f9c16fb31adced
[04/12] gpio: siox: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/d5297b0f861a124efe7965619212a632d5138281
[05/12] gpio: spear-spics: remove unneeded callbacks
        https://git.kernel.org/brgl/linux/c/e9a5f9ac245fd58b8477f1d2fe5a077803631460
[06/12] gpio: spear-spics: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/70c8f51ff68147176a41d549587a67ea377ed2e2
[07/12] gpio: sprd: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/ae35dd91ad2ea4ae446e74364edd6428a26f5080
[08/12] gpio: stmpe: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/c9148553ac13565ad06d83d7baebef133245ebe6
[09/12] gpio: stp-xway: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/e87dff29ff6b919f64ca25b066c44bbacdc08ac3
[10/12] gpio: syscon: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/c203705c9b46ad0b66ef3bdc93ec9073b00efed1
[11/12] gpio: tangier: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/f3c9b6a51cb31a8816feb801c8c8a2265432143e
[12/12] gpio: tc3589x: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/b033bc5a9a7d95b8dc206dd7455a033b0670d8e7

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
