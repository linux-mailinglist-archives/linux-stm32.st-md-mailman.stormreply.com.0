Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5037BAC69D4
	for <lists+linux-stm32@lfdr.de>; Wed, 28 May 2025 14:54:08 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0917DC36B35;
	Wed, 28 May 2025 12:54:08 +0000 (UTC)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com
 [209.85.222.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 15F51C36B31
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 May 2025 12:54:05 +0000 (UTC)
Received: by mail-qk1-f173.google.com with SMTP id
 af79cd13be357-7c5ba363f1aso560354885a.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 May 2025 05:54:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748436844; x=1749041644;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kpBCbmssZZU2OxX6932Syq4YOVYfQLXpGhSUVPiLHKA=;
 b=HZjpXrEfZ8csZ3VOYc26DIhDTrR5b+xs1aLKvWGeWgy2ifiN1uJ5b2hFXVJdaO593w
 RVtDEwTHLHrWYgsQ5+6sA5twvu+QkzC69+j19Jbyd2adNH4IC8i5j3bLbsJEfqWAOynO
 3/HLZNoHfWZkgf9dbvUpg+zg2x+5Lm0BTA9+xLAOu6i+n9J6EqisO2CHtwY6PZ4QO6fQ
 2EARXPARS0q6OxafqM1UnM2bPgQNXVGMdgkDn6XNU4gv4Zry8Ij9D7QPicsHVYs5ntWI
 v0NjU5nUjqsx2gDahYdZjXihf7xzAmrV1C8WaQ/BcE4DDnVf+Sg23eUdohrDRoOHd8AJ
 RypA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUbIkV5IZ1a1i1u9A0nMbewgMOQ9f/1bjZcsWTyyRAiGydHHixgcEFVQeeOQnPRFQIzWzSk3+EYxOSMWQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxsPKhhZEMcSJYDfIya9nUTWzV+c3BhJcVXXrmKANH/xSHpi8vj
 /9D1GYRQZ8ShlQKA7yF7V06pSq/7xFZMb2+zIjVIdDavhkkFT+zW06TQEFwmqHKH
X-Gm-Gg: ASbGncun/odKEkqswJey05g608jgPkYcVbaOJp2Zlhm5w4iB/WwzcX8KmzvA6Md/R85
 7bc1tLTPluFvkib0T5BHzEkKfH1xyAF2trCikcPZzBd3DPjQaDm2xBkJjurFh3JFSfqpJWaUKzx
 k77sVxmNyonoLLEl+u0TNziWGhwVEpHsLR0alFxA1DAQ5bhNlCBdc9gLz/qdNlTTNZ3oWLQvqTZ
 cobYXfsFlnW7tG7IAzhV2EbEfveFyha2zTyZ4sZf6eCYLeMUb48tuN2XaXSFKITb0GxKNo+HIMf
 1hD9cjui9evZ7lhwt1tRF8wyOiZuHeM2dAspMPEtLLQ+BI8hx1NTSDJml2rhhRDrdoCjRGpVND6
 5uYqAM99kenJLybKIIg==
X-Google-Smtp-Source: AGHT+IEQ16juGyTFBcjwpyH6WSIxC6Qi99YN7KVFJZVJ5FkCYSUXCBTI3QLf9UUvXVZ7SB92Fo7E1A==
X-Received: by 2002:a05:620a:1a07:b0:7ca:f3e2:92b0 with SMTP id
 af79cd13be357-7ceecbbff2dmr2277147985a.3.1748436844377; 
 Wed, 28 May 2025 05:54:04 -0700 (PDT)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com.
 [209.85.222.180]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7cfb82002bdsm66054485a.17.2025.05.28.05.54.04
 for <linux-stm32@st-md-mailman.stormreply.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 May 2025 05:54:04 -0700 (PDT)
Received: by mail-qk1-f180.google.com with SMTP id
 af79cd13be357-7c59e7039eeso601298585a.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 May 2025 05:54:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWhmdlBdvOzS2TUBg4kWB4wm/DK9tQ455Byp6t7zInnlu+leYpxOyMTAwYJWlsXzje233qKk3c6TjBMMA==@st-md-mailman.stormreply.com
X-Received: by 2002:a05:6102:3e94:b0:4dd:b9bc:df71 with SMTP id
 ada2fe7eead31-4e4240b1619mr13395283137.10.1748436481362; Wed, 28 May 2025
 05:48:01 -0700 (PDT)
MIME-Version: 1.0
References: <20250528-pinctrl-const-desc-v1-0-76fe97899945@linaro.org>
 <20250528-pinctrl-const-desc-v1-4-76fe97899945@linaro.org>
In-Reply-To: <20250528-pinctrl-const-desc-v1-4-76fe97899945@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 28 May 2025 14:47:49 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUWqvHGKHqUWf6xdVBzaungUq1Fq=g_+qFQRO5+fq4=vQ@mail.gmail.com>
X-Gm-Features: AX0GCFtImpXXWdP8CtUa2VgvQDuwNbZqXjPeWpaGOsf8DlxmYUgiiqknnvQgxJg
Message-ID: <CAMuHMdUWqvHGKHqUWf6xdVBzaungUq1Fq=g_+qFQRO5+fq4=vQ@mail.gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 Tomer Maimon <tmaimon77@gmail.com>, linux-aspeed@lists.ozlabs.org,
 Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
 Linus Walleij <linus.walleij@linaro.org>, Tali Perry <tali.perry1@gmail.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 Emil Renner Berthing <kernel@esmil.dk>, linux-rtc@vger.kernel.org,
 Jesper Nilsson <jesper.nilsson@axis.com>,
 Benjamin Fair <benjaminfair@google.com>, openbmc@lists.ozlabs.org,
 linux-arm-kernel@axis.com, Hal Feng <hal.feng@starfivetech.com>,
 Nancy Yuen <yuenn@google.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 Lorenzo Bianconi <lorenzo@kernel.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>, Ray Jui <rjui@broadcom.com>,
 =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 linux-sound@vger.kernel.org, Vladimir Zapolskiy <vz@mleia.com>,
 linux-gpio@vger.kernel.org, Richard Fitzgerald <rf@opensource.cirrus.com>,
 Damien Le Moal <dlemoal@kernel.org>, linux-mediatek@lists.infradead.org,
 Lars Persson <lars.persson@axis.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 David Rhodes <david.rhodes@cirrus.com>, Michal Simek <michal.simek@amd.com>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Scott Branden <sbranden@broadcom.com>, Avi Fishman <avifishman70@gmail.com>,
 Patrick Venture <venture@google.com>, Sean Wang <sean.wang@kernel.org>,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Jianlong Huang <jianlong.huang@starfivetech.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, patches@opensource.cirrus.com
Subject: Re: [Linux-stm32] [PATCH 04/17] pinctrl: Constify pointers to
	'pinctrl_desc'
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

On Wed, 28 May 2025 at 12:41, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
> Pin controller core code only stores the pointer to
> 'struct pinctrl_desc' and does not modify it anywhere.  The pointer can
> be changed to pointer to const which makes the code safer, explicit and
> later allows constifying 'pinctrl_desc' allocations in individual
> drivers.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
