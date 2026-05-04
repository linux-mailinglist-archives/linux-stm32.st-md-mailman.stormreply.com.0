Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YLfPE5SW+WmA+AIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 05 May 2026 09:04:52 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0320F4C773E
	for <lists+linux-stm32@lfdr.de>; Tue, 05 May 2026 09:04:50 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 47E01C8F29A;
	Tue,  5 May 2026 07:04:49 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 81F2EC055F4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  4 May 2026 19:57:47 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-445795cf6f1so2658919f8f.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 04 May 2026 12:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1777924667; x=1778529467;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pfzVxf9MxCl5JbzWkX8z2mAnOzxMNsJA4qw2p63tW68=;
 b=aaEpOlax8SQEVryU/1VXdNV4EMyqQOl0ubGYDBh8DDBviNUnAFdd1R88gKBC4JW02j
 DXyMUdUfRHBm4PotbvRWE5Pht0VB5FX1Zs79tcPcRKKSYNO21uUjw2UfGsQleu53b1AT
 99CXNC9zwYKkY0ULgRg6t1yfNow7ZvHgEwEfLqiJb8lARjOxF5ZntTvnt07vvYvqebMi
 wmUz5M5+2S744/OfD3w9woSu8tkJq6kpGsDTsJ9MzwrNpK2SfaFb3BZfa0DaXTBxywBa
 Dm8YxZLXeP3Ckjzem+hlcGf7VGPw2Xt7dqugs1mPvTjGXKoNBTCt9LdZJExN4IrNWWeO
 KeUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777924667; x=1778529467;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pfzVxf9MxCl5JbzWkX8z2mAnOzxMNsJA4qw2p63tW68=;
 b=FAe/ZgfLNqNAEUOLOhxtUhNINHTXtORAYzJJkV94SAXZo0cdmr+/tbEjbtk89D//Vt
 SnIvtvUGgN6Sys3OMfx/JzAdhtDaPJSmlj8GqwTsjIP+mdflDNrF6KrR2Km0ElwLTzx5
 Gj4Hk3ASmJ6eWZvK7bRgVtaoc7ZdKpFeFpnptZ3Po5T2ESm+Nlheq08/0Zbj8rBvJOog
 b66lUpZE05x0eD5o802vtWWDbjIPuew56cUs58SgPA8iLn4L8rDoHOToC79l/N/4hq5p
 eXQ+ER2EgWdFnMTTYdIra5yxQ1Zq0swF1m9NkD2FrHE0gEW8skOgtVjZGGiBBz2RjBDz
 wJVA==
X-Forwarded-Encrypted: i=1;
 AFNElJ+DM1xe3Q7B6VKRLG2SIYcCUElJOoOjgIvefapdJ3kIzUbSpIXV9LE4ESa+QllEeds1sMhW7xbCRb+vGg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxWO+6YyA4dxY/QM3hK4rO/XkjTR4Ap7f3PEgyuRqCvU6/PlI0g
 oLRy4xoF6RjEd5s+SPMFp7pZHmgXqodoTA21C2Deqf93Kpp4Dr/ltdj752DNpv8mVT8=
X-Gm-Gg: AeBDieu4BCWuOSgFpEZ0sYZzWDotfI5IGzXpdg2XM4Faxy05ofsP04STF46Z7qsfhCI
 C8JTsVyiJc5nAez9e8vEwqDfHB3qWUawFPn2fP//7wCLvoZJ/aZEQ7RL7ybzYhptIVc+sQQlTi8
 Ewy1ht0YeVqRAJzXgeg6xLDU8dZNXGf9kO6HK/TQdMZPVRyJLyeBxxVmfAVmWiyJGuYpdjUJ1J4
 X7je1aXss7RxJzyyVU57IJ1Inv9q0s2NlW7jvmjknAzvAc5sV8403+5WJYAMz52GP1GWwNZh3hY
 ZRJTgTYjkmtE/4xBWWDA3YiVxFnwvpiaMU7zOD7LVQez8MvJ5Be3ZSGv1QmMyefJqWzQ/sDwLvX
 lbQAHhz8ZXM4balz1IIyPXbXOb7btDp/MnZdaXoc/ACGRgAUYc0W+WTb6EBKQVyf5BcnguwoKzV
 ROeIyR4n3HvuSKIa+ayzjsTAp/ERV4q1/RRKJM8BDYyjr9wtg=
X-Received: by 2002:a05:6000:2f82:b0:43c:fa96:d939 with SMTP id
 ffacd0b85a97d-45005c81608mr489564f8f.22.1777924666722; 
 Mon, 04 May 2026 12:57:46 -0700 (PDT)
Received: from archlinux ([2a07:7e81:7daa:0:62cf:84ff:feee:627])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4500d734654sm373291f8f.12.2026.05.04.12.57.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 May 2026 12:57:46 -0700 (PDT)
Date: Mon, 4 May 2026 21:57:45 +0200
From: Angelo Dureghello <adureghello@baylibre.com>
To: Angelo Dureghello <angelo@kernel-space.org>
Message-ID: <p2pkvbvj2ksdws3rsrt4d3gqjvkmgwt4gvc2jwjkc7dhybqibd@lhfsyf33ba46>
Mail-Followup-To: Angelo Dureghello <angelo@kernel-space.org>, 
 Greg Ungerer <gerg@linux-m68k.org>, Geert Uytterhoeven <geert@linux-m68k.org>, 
 Steven King <sfking@fdwdc.com>, Arnd Bergmann <arnd@arndb.de>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
 Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, 
 Greg Ungerer <gerg@uclinux.org>, linux-m68k@lists.linux-m68k.org,
 linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-iio@vger.kernel.org
References: <20260504-wip-stmark2-dac-v1-0-874c36a4910d@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260504-wip-stmark2-dac-v1-0-874c36a4910d@baylibre.com>
X-Mailman-Approved-At: Tue, 05 May 2026 07:04:46 +0000
Cc: Andy Shevchenko <andy@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, Steven King <sfking@fdwdc.com>,
 linux-m68k@lists.linux-m68k.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Greg Ungerer <gerg@uclinux.org>,
 David Lechner <dlechner@baylibre.com>, Greg Ungerer <gerg@linux-m68k.org>,
 Jonathan Cameron <jic23@kernel.org>
Subject: Re: [Linux-stm32] [PATCH 00/10] add mcf54415 DAC driver
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
X-Rspamd-Queue-Id: 0320F4C773E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.79 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[baylibre-com.20251104.gappssmtp.com:s=20251104];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	MID_RHS_NOT_FQDN(0.50)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[baylibre.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:angelo@kernel-space.org,m:andy@kernel.org,m:arnd@arndb.de,m:linux-iio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:nuno.sa@analog.com,m:sfking@fdwdc.com,m:linux-m68k@lists.linux-m68k.org,m:geert@linux-m68k.org,m:linux-arm-kernel@lists.infradead.org,m:mcoquelin.stm32@gmail.com,m:gerg@uclinux.org,m:dlechner@baylibre.com,m:gerg@linux-m68k.org,m:jic23@kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[adureghello@baylibre.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[baylibre-com.20251104.gappssmtp.com:-];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-0.823];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[adureghello@baylibre.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[kernel.org,arndb.de,vger.kernel.org,st-md-mailman.stormreply.com,analog.com,fdwdc.com,lists.linux-m68k.org,linux-m68k.org,lists.infradead.org,gmail.com,uclinux.org,baylibre.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email]

Hi,

just seen i sent with git send-email configured with my private email.
Will fix the sender email to BayLibre in v2.

Regards,
angelo

On 04.05.2026 19:16, Angelo Dureghello wrote:
> This patchset adds a minimalistic DAC driver for the NXP mcf54415/6/7/8
> builtin DACs.
> 
> Currently the driver enables the raw write only. Feature as dma, sync, or
> format are not supoprted for this version.
> 
> Additional options suppoerted by the DAC module will be added to the driver
> later on, as needed.
> 
> The same patchset prepares the m68k/coldfire architecture to support
> the driver.
> 
> ---
> Angelo Dureghello (10):
>       m68k: mcf5441x: fix clocks numbering
>       m68k: mcf5441x: add clock for DAC channel 1
>       m68k: mcf5441x: setup DAC clock name as per driver name
>       m68k: defconfig: update stmark2 defconfig
>       m68k: add DAC modules base addresses
>       m68k: mcf5441x: add CCM registers
>       m68k: mcf5441x: add CCR MISCCR2 bitfields
>       m68k: stmark2: add mcf5441x DAC platform devices
>       m68k: stmark2: enable DACs outputs
>       iio: dac: add mcf54415 DAC
> 
>  arch/m68k/coldfire/m5441x.c         |  21 ++--
>  arch/m68k/coldfire/stmark2.c        |  42 ++++++++
>  arch/m68k/configs/stmark2_defconfig |   2 +
>  arch/m68k/include/asm/m5441xsim.h   |  40 ++++++++
>  drivers/iio/dac/Kconfig             |  10 ++
>  drivers/iio/dac/Makefile            |   1 +
>  drivers/iio/dac/mcf54415_dac.c      | 200 ++++++++++++++++++++++++++++++++++++
>  7 files changed, 307 insertions(+), 9 deletions(-)
> ---
> base-commit: 8b4b975922f607411217c81942e82f1d206ebc61
> change-id: 20260430-wip-stmark2-dac-7060f49dd94f
> 
> Best regards,
> --  
> Angelo Dureghello <adureghello@baylibre.com>
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
