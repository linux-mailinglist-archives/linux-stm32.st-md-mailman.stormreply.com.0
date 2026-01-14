Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 79E95D1F096
	for <lists+linux-stm32@lfdr.de>; Wed, 14 Jan 2026 14:20:24 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1662DC8F26F;
	Wed, 14 Jan 2026 13:20:24 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 068D1C349C4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Jan 2026 13:20:22 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-42fbc305882so4735685f8f.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Jan 2026 05:20:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1768396822; x=1769001622;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=sWiGwjTB0ZEpbDkwRFO+MVJzM9uZpDrSFPQIlzRZfsU=;
 b=OZG3t3JvxLVomlNezOCRfIB1n7PNUZN3GKoXCJVWtL9yA+ExC9QdOgG+v6eAJu4gjJ
 E5LchK9V6oNgStlhrysZSQ/97EbDvR0/6Zs24c/d+DxZscdwhA2MwJn0cOc4hkmtD7Kr
 ED1h666nZzlT0XSTfIQg6MIxM4OFfjI4yUh4DCCxA9LeYxGnE33uWBtguobp9uuN7k0O
 rRIy9lliUSUBOBJy7LcSUxJAYXtcWTe8t6YGOeSo6Qh1FMED/Wn+ZGR92l5iMoepSwGa
 a7a8wxvXpm6ZyMr9pMEgnyW+W9L5tLrRRyvQquYuAfIVht6Mo9a3nDS2GLS9ZEc1Wlhq
 CEAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768396822; x=1769001622;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sWiGwjTB0ZEpbDkwRFO+MVJzM9uZpDrSFPQIlzRZfsU=;
 b=eKP/dyGUt+6H3L3r8DBr9lfUl1y45XhCwIdcKyWmXEMuomvjV9wA49iUw9M8DBT6M7
 a3sj8JAxJw0ajjwS3NOlq+G5qKItDLm+x2m16eOtJQKOPxpvMa6YxOT74dA9OPfMGFaf
 rLsLqahn6SWBFWEFjVej2vUMJ/Ob8ELbml8hk7TOvs68MSa8A/snULV9X4STlmuRa7K7
 dooRi+7HkS3RB4jHJRCMsndX/6BY4XXwcUhMKTRhGMPFuZGELpx6JTb2iZItWhZOYErK
 TryZs/NV4eU2Fr+hZkfC0/G6mpBRZago72INtCobByjiEAZf7lu5razc5yX0ohVb7V+0
 zUYw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUIwckJhGHKeVxl7GLXtO/qTeLbGNCT5/CJXXfGq5OAxTEqqlwsKnWvv+ezSgCyf7AiLPzqN2zQSfla/Q==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwdCm2ef2b2WLrHu+dItE20FXG6OsGtFzbiHvrAtmtlJJokpwd/
 0R8HNUOIjXlnnPx8F4kXAOz9ixtVzVqTCeIa+jaiDFfZiZM7HkJOxOVmldHbRY1cEEc=
X-Gm-Gg: AY/fxX452li4Tsnb8Ub+lTdCdtfyVXPz0lSBX8K/tOOY0d3/gt6hMGByNl+oAS8puOG
 Jc5GzbSuDIl71AydVmU1whWbkdOclUBGbe3UdRjJ5FzZiFC3JOWdEhr4fPz0hEvVsvyGW7TglGd
 9aScmmtyyg0rmMKSXtD3h96b1H/MIxVl/h0FEJ82K2gDW12B6dEGFXc+XXVQEnoZ8oJ+PAv/zLu
 Cf2SaZuMaVf20Ea93rbrWtjejngdXdsvkRxInCSSO6xL+JjU8ymo5syKyTNO0e2kU27Ho/8lGeF
 8wwFylAYO4rPmxi2CsEv+Vk9mDGaysYUn1e6xdUe894yqILHn85V5OMubcy7v/eLRbqLz7HuWoi
 MnJn3w+Ko6hQKg4NjHAr7Ioct94FJiBmCgVwJN828V3p3LSlPvWrvnEI+p9zxai7uO3WNpHycEX
 97UUsmuWFA3XYlPQ==
X-Received: by 2002:a05:6000:2511:b0:431:9b2:61c0 with SMTP id
 ffacd0b85a97d-4342d5b2ab9mr2581603f8f.24.1768396817421; 
 Wed, 14 Jan 2026 05:20:17 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-432bd0dacd1sm49153435f8f.4.2026.01.14.05.20.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jan 2026 05:20:16 -0800 (PST)
Date: Wed, 14 Jan 2026 14:20:14 +0100
From: Petr Mladek <pmladek@suse.com>
To: Marcos Paulo de Souza <mpdesouza@suse.com>
Message-ID: <aWeYDoMsdBNkJEqO@pathway.suse.cz>
References: <20251227-printk-cleanup-part3-v1-0-21a291bcf197@suse.com>
 <20251227-printk-cleanup-part3-v1-5-21a291bcf197@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251227-printk-cleanup-part3-v1-5-21a291bcf197@suse.com>
Cc: Andreas Larsson <andreas@gaisler.com>, Kees Cook <kees@kernel.org>,
 kgdb-bugreport@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 Shan-Chun Hung <schung@nuvoton.com>, Eric Dumazet <edumazet@google.com>,
 netdev@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
 Breno Leitao <leitao@debian.org>, Jiri Slaby <jirislaby@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>, sparclinux@vger.kernel.org,
 Madhavan Srinivasan <maddy@linux.ibm.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Richard Weinberger <richard@nod.at>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-serial@vger.kernel.org,
 Daniel Thompson <danielt@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Jacky Huang <ychuang3@nuvoton.com>, John Ogness <john.ogness@linutronix.de>,
 Sergey Senozhatsky <senozhatsky@chromium.org>, linux-um@lists.infradead.org,
 Steven Rostedt <rostedt@goodmis.org>, linux-m68k@lists.linux-m68k.org,
 Nicholas Piggin <npiggin@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Laurentiu Tudor <laurentiu.tudor@nxp.com>, Tony Luck <tony.luck@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Douglas Anderson <dianders@chromium.org>,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jason Wessel <jason.wessel@windriver.com>, linux-fsdevel@vger.kernel.org,
 Johannes Berg <johannes@sipsolutions.net>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>, linux-hardening@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 05/19] printk: Add more context to
 suspend/resume functions
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

On Sat 2025-12-27 09:16:12, Marcos Paulo de Souza wrote:
> The new comments clarifies from where the functions are supposed to be
> called.
> 
> Signed-off-by: Marcos Paulo de Souza <mpdesouza@suse.com>

The improved comments would have helped to understand the previous patch.
I would either merge it into the previous patch or switch the
ordering.

If this stays as a separate patch, feel free to use:

Reviewed-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
