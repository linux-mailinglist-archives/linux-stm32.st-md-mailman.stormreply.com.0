Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AOSdHsFk9GlfBAIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 01 May 2026 10:30:57 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0612D4AB159
	for <lists+linux-stm32@lfdr.de>; Fri, 01 May 2026 10:30:56 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5C3ABC8F262;
	Fri,  1 May 2026 08:30:56 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F12B9C87ECB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  1 May 2026 08:30:54 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-44a5174670eso330807f8f.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 01 May 2026 01:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1777624254; x=1778229054;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xvsqEGiRr2aMUPxm2PwD7DIcDzBPYJDFXn2qMdcwOC0=;
 b=HhnsXx7MBdQpy4w9tqUDQBzY8xl+z1hS5gRSim6qtw0px8LHaPqwDmPm1whq9894Ry
 uaCB3ThuXJlmD5unDqQLC+rMiYawJ4N9PofbLPNbIAN14islvE23TcpDOXUMLkGRMdnu
 HkxrUd4qypuIqamkgEY7m3wXNZUc6dLfOEB3x24eyea6IfdhF7WGdhh3i/fyoSkB30o3
 uYulvMCgW0HSDao34DoMlo+XTPgH/0T48D7clMyWA9CltWCWGV65LYiX1CeGxgUBW8AX
 hEGgpf6kaVEwQObHSt0wMxwvXuM2shdH0moSNsgTkB6w0xb2IzMjeb3pXyWn4BlcXt8K
 ILZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777624254; x=1778229054;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=xvsqEGiRr2aMUPxm2PwD7DIcDzBPYJDFXn2qMdcwOC0=;
 b=jCmSo4Cji1sUK8OaXgOurdvpCsdo2wupqEY35GF9v0+RNnjmWkB4AQkSIpjGEDvMNO
 w+1VhSgxigd4wXXcMrkeuRRuUVOdHSL6X2M/xV6g4uvwUs88hVKs+BfWP4lzPL5m17pz
 HrK5ZfwvTmdgDPa7LiULge4ICo6OBDRL6bMYDwE654aXag+VCdSB6Zz1SNYE/qmGb90c
 uN3xmFS/KRNM7yoVaW4XvJjzG+ojlkj4uGG2L9crCJgrZJ94ZVvL9CoPD9b0n8uRHOYp
 ckZkasM0Pk4fIsF5J3PN+q66TIX5cSAj+T3udjTHaoH7+EhDZAnz14X4hziciipZY0/N
 9K9Q==
X-Forwarded-Encrypted: i=1;
 AFNElJ9Ww/1JJremjw4HtEK0OSv6zlYd97+ICmeTil1Pgj4pRicTMB8AEXw4d71naiytadjfLt7iBpW3/Qpp8w==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyWJ0iH+ESxRlch9QHFBHG+xpBzgOiIz4tSgC3wO3yyeU2uZ+wX
 3EnrJS0ze5naoYbOoUsE4F8syh2Y4HQqvXzfww0KrijUfaFyHtgIJS/8
X-Gm-Gg: AeBDietRuWA1C1/Vq9RGbO5IxTtO6ISkTs7VUhK38nVZH0f6L/49llgRN4SH0fvhI7/
 C5WXROxfUesoBH3qmKsrzg36bS4TmF+1aXZqXYG7rNSL5QCjnZWe+4DRCnwyhX63Qh7ByeZ+E6z
 SIn1/89r1BrEJx3Xy5MPCS6GTvLICJZXeSn/58CNgx0mes2bpEz+5LioAdlyR9jXmrRNY9TbYIu
 d0QNG1E9lQjollNomkPaxXf/GGz821TUGEUtTQmxpxq9YCEZ/u5PuP6gb5KT5dlOTXjDnd/47iv
 b6AbAXSidIWzUKqy2JYQXJdojSQNNHCsIg17NNIilXTXubrLrG8cKOGf9y7wfSM5Bo4XVd+xfXf
 6YPDHnA3aPsn8N2vz/OQ3qZdrVNH5sjgCItCMocIuSoSQxJ3XYPAVOdjByAcyw2j5+RGxh/Ai+G
 pBt574uc4y4r2QJRWZzgugyoB5qTCo4Tqs9IPm/xWR7fMEumL+G1WlhOM/IfSebem8/oiqor5as
 eO+aeGhxkKbMA==
X-Received: by 2002:a05:6000:2582:b0:44a:2cb3:b633 with SMTP id
 ffacd0b85a97d-44a2cb3b668mr6019597f8f.12.1777624252671; 
 Fri, 01 May 2026 01:30:52 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-44a981defbfsm3336950f8f.17.2026.05.01.01.30.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 May 2026 01:30:52 -0700 (PDT)
Date: Fri, 1 May 2026 09:30:50 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Hans Zhang <18255117159@163.com>
Message-ID: <20260501093050.3f97cd3e@pumpkin>
In-Reply-To: <20260430155456.36998-1-18255117159@163.com>
References: <20260430155456.36998-1-18255117159@163.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Cc: linux-arm-kernel@lists.infradead.org, neil.armstrong@linaro.org,
 mcoquelin.stm32@gmail.com, lhjeff911@gmail.com, imx@lists.linux.dev,
 martin.blumenstingl@googlemail.com, khilman@baylibre.com,
 hayashi.kunihiko@socionext.com, haibo.chen@nxp.com, linux-spi@vger.kernel.org,
 broonie@kernel.org, mhiramat@kernel.org, xianwei.zhao@amlogic.com,
 linux-amlogic@lists.infradead.org, han.xu@nxp.com, sunny.luo@amlogic.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 jbrunet@baylibre.com
Subject: Re: [Linux-stm32] [PATCH 00/10] spi: Use FIELD_MODIFY() for
	bitfield operations
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
X-Rspamd-Queue-Id: 0612D4AB159
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.89 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	MID_RHS_NOT_FQDN(0.50)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[163.com];
	FORGED_SENDER(0.00)[davidlaightlinux@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:18255117159@163.com,m:linux-arm-kernel@lists.infradead.org,m:neil.armstrong@linaro.org,m:mcoquelin.stm32@gmail.com,m:lhjeff911@gmail.com,m:imx@lists.linux.dev,m:martin.blumenstingl@googlemail.com,m:khilman@baylibre.com,m:hayashi.kunihiko@socionext.com,m:haibo.chen@nxp.com,m:linux-spi@vger.kernel.org,m:broonie@kernel.org,m:mhiramat@kernel.org,m:xianwei.zhao@amlogic.com,m:linux-amlogic@lists.infradead.org,m:han.xu@nxp.com,m:sunny.luo@amlogic.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-kernel@vger.kernel.org,m:jbrunet@baylibre.com,m:mcoquelinstm32@gmail.com,m:martinblumenstingl@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	TAGGED_FROM(0.00)[];
	FREEMAIL_CC(0.00)[lists.infradead.org,linaro.org,gmail.com,lists.linux.dev,googlemail.com,baylibre.com,socionext.com,nxp.com,vger.kernel.org,kernel.org,amlogic.com,st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[gmail.com:-];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[davidlaightlinux@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.972];
	TAGGED_RCPT(0.00)[linux-stm32];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo]

On Thu, 30 Apr 2026 23:54:46 +0800
Hans Zhang <18255117159@163.com> wrote:

> Replace open-coded bitfield modifications with the standard FIELD_MODIFY()
> macro across multiple SPI controller drivers. This improves readability and
> adds compile-time checking without functional changes.

I don't think these changes are worth the effort.
The readability doesn't change much - you need to know what a slightly
more obscure 'helper' does.
The extra compile-time checks are pretty unlikely to ever find a problem
and mostly just slow down the compile.
The generated code is likely be slightly worse.
And, with the best will in the world, it is easy to make silly mistakes.

	David

> 
> Each patch modifies a single driver, allowing independent review and
> application.
> 
> Hans Zhang (10):
>   spi: amlogic-spifc-a1: Use FIELD_MODIFY()
>   spi: amlogic-spisg: Use FIELD_MODIFY()
>   spi: cadence-xspi: Use FIELD_MODIFY()
>   spi: meson-spicc: Use FIELD_MODIFY()
>   spi: nxp-xspi: Use FIELD_MODIFY()
>   spi: sn-f-ospi: Use FIELD_MODIFY()
>   spi: stm32-ospi: Use FIELD_MODIFY()
>   spi: stm32-qspi: Use FIELD_MODIFY()
>   spi: sunplus-sp7021: Use FIELD_MODIFY()
>   spi: uniphier: Use FIELD_MODIFY()
> 
>  drivers/spi/spi-amlogic-spifc-a1.c |  5 ++---
>  drivers/spi/spi-amlogic-spisg.c    | 13 +++++--------
>  drivers/spi/spi-cadence-xspi.c     |  3 +--
>  drivers/spi/spi-meson-spicc.c      |  5 ++---
>  drivers/spi/spi-nxp-xspi.c         | 12 ++++--------
>  drivers/spi/spi-sn-f-ospi.c        |  5 ++---
>  drivers/spi/spi-stm32-ospi.c       |  7 +++----
>  drivers/spi/spi-stm32-qspi.c       |  5 ++---
>  drivers/spi/spi-sunplus-sp7021.c   |  3 +--
>  drivers/spi/spi-uniphier.c         | 13 +++++--------
>  10 files changed, 27 insertions(+), 44 deletions(-)
> 
> 
> base-commit: 3b3bea6d4b9c162f9e555905d96b8c1da67ecd5b

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
