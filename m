Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4EHhFV1uDGpKhgUAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 19 May 2026 16:06:21 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F3F6D580397
	for <lists+linux-stm32@lfdr.de>; Tue, 19 May 2026 16:06:20 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 76E73C8F294;
	Tue, 19 May 2026 14:06:20 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EA87AC349C4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 May 2026 14:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1779199576;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vw8Hh4r9dRAzD/JG3jLtKlSPp2FykYGxNH+YocMZs0c=;
 b=AaGhzsCezS+TVkuaIMGd9Qoh2z1KZqSZBfOHge2gRTlGhLsRi7KxP1mBQUCMXVo4v2o1RL
 GA7uCtNXpPYSa+0KVZfJcgngo2p5kIxaQXU93KScRRh0sDDeP+SBdZIp82gFXkTKTA+oRA
 3KvRHX1YL3RcoM6USiMGWdJ57hMrp2E=
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com
 [209.85.161.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-629-vtMz1TtnO6akNAK8_BtKqw-1; Tue, 19 May 2026 10:06:07 -0400
X-MC-Unique: vtMz1TtnO6akNAK8_BtKqw-1
X-Mimecast-MFC-AGG-ID: vtMz1TtnO6akNAK8_BtKqw_1779199566
Received: by mail-oo1-f72.google.com with SMTP id
 006d021491bc7-69b8c3e1516so7605578eaf.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 May 2026 07:06:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779199566; x=1779804366;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=vw8Hh4r9dRAzD/JG3jLtKlSPp2FykYGxNH+YocMZs0c=;
 b=AxILDDLlxxgbvwqfU1ozjbkgK5CFlpF+x5x5I6yCqSCjNarbhYSgZY3WrGS/qCw3Ki
 Xzmlle3uEZeIcp1RlkwMNn/ORl9SUFX0UrgusdJ8Zh3wMkSbwXU3hjXnGliFm4zGcQys
 IpLiI9bpDUHJ0MSFep5woz21VX/feNDVfHGS2GaavdNisKovAZ6ajYozzTgpnlLIvz0c
 fLdk7DpUqpiNrOP8P2t1eqwxhh+mgIR7Y2iEJ6VMckOZUeHz2qHEdlS6mnuD5ExEFetM
 GKZZeKC03mDmq2Gw8P8GDs/IK+cZg6KhgfeNtZUgzMCQ80LEE5SOSALQt7QH2ohmlpiC
 y5CQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ/+7B4d3KAkOFvAF0to2CR0p77y1H3X8i+r58YLLGz//QNTgIXO6zg05+LnC7l+0Hos4hqQXiENGO62ZA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzkUNDSarhIXYn70GVpd9Wz10TU9NWpXD/GnZmiBt1UK5rUm8aY
 PAXPTqbM2AJaTh67N4yfwX48XtU1H+2BCjtCvTPBob5shXA1EGDofj4z5ka/0W8WxiancMIGKj2
 AEayYc7ua7XOHySeBndIGxz4LmDW55X/DIIw0KM1OT5QQkRKw0cuIs4E167rBRqWVBOyUoqUQq7
 EVmr90Nw==
X-Gm-Gg: Acq92OFwVz0RLGIekHy6/K4dmMw5P5XUOKre8m6Z4Pu8TKRcL7rWD0oh2+EaNILm9Ri
 nXfx5i/cZiODQgzP7POD8rzHQ6g9fXR6kvQlzL76CTXvA32afHgQcF8BqS52Mt2OfIjLxmGT1F2
 a/aoItWqRnIEvqihWBotVtnu7lMI1/EwhLpGTj43Id0YGcVhSkA6oUL8B8Yu41j7RFn7EVV5aEX
 Dl2s47gWvrTp82uM3cV3kWE5FnKdnsR3yAlKFR4OTU+olPCSzWaqdxYK4Q1TQo49jdfO0CX2Yri
 aLCvCU0yH7p8z0gazVtFuY5TxedXYBaIhyl6lptxDIFAjo91ZDfSFWvGXc2IGXLz3Ap2kE+1huQ
 AK+mR54GYy6jnzvTg+0ll4M5vYHznMB+9MRzr6SNY6ktjrLaINIbo5lib
X-Received: by 2002:a05:6820:6189:b0:69d:521d:a4f1 with SMTP id
 006d021491bc7-69d521da817mr581318eaf.55.1779199566351; 
 Tue, 19 May 2026 07:06:06 -0700 (PDT)
X-Received: by 2002:a05:6820:6189:b0:69d:521d:a4f1 with SMTP id
 006d021491bc7-69d521da817mr581253eaf.55.1779199565643; 
 Tue, 19 May 2026 07:06:05 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net.
 [73.183.52.120]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8ca3608bb6bsm91862306d6.6.2026.05.19.07.06.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 May 2026 07:06:04 -0700 (PDT)
Date: Tue, 19 May 2026 10:06:02 -0400
From: Brian Masney <bmasney@redhat.com>
To: Rosen Penev <rosenp@gmail.com>
Message-ID: <agxuSsAhreZJVYcc@redhat.com>
References: <20260518221230.19879-1-rosenp@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20260518221230.19879-1-rosenp@gmail.com>
User-Agent: Mutt/2.3.1 (2026-03-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: xTOgGCM8_vGSLLw4788vBI-6OaHah2R2fg25pkujh8Y_1779199566
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: "open list:CLANG/LLVM BUILD SUPPORT:Keyword:b\(?i:clang|llvm\)b"
 <llvm@lists.linux.dev>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Justin Stitt <justinstitt@google.com>,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
 open list <linux-kernel@vger.kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, Bill Wendling <morbo@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, linux-clk@vger.kernel.org,
 "moderated list:ARM/STM32 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH] clk: stm32: allow STM32MP COMPILE_TEST
	builds
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
X-Spamd-Result: default: False [4.79 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[redhat.com : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[redhat.com:s=mimecast20190719];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:rosenp@gmail.com,m:llvm@lists.linux.dev,m:sboyd@kernel.org,m:mturquette@baylibre.com,m:justinstitt@google.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-kernel@vger.kernel.org,m:nathan@kernel.org,m:morbo@google.com,m:mcoquelin.stm32@gmail.com,m:nick.desaulniers+lkml@gmail.com,m:linux-clk@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:mcoquelinstm32@gmail.com,m:nickdesaulniers@gmail.com,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[bmasney@redhat.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[lists.linux.dev,kernel.org,baylibre.com,google.com,st-md-mailman.stormreply.com,vger.kernel.org,gmail.com,lists.infradead.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bmasney@redhat.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[redhat.com:-];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,lkml];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,stormreply.com:url,stormreply.com:email]
X-Rspamd-Queue-Id: F3F6D580397
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Rosen,

On Mon, May 18, 2026 at 03:12:30PM -0700, Rosen Penev wrote:
> COMMON_CLK_STM32MP already allows COMPILE_TEST, but the parent clock
> Makefile only descends into drivers/clk/stm32 for ARCH_STM32.  Use the
> STM32MP clock symbol for that directory gate instead.
> 
> Building the STM32MP21 and STM32MP25 clock drivers then requires direct
> linux/bitfield.h includes for FIELD_GET(), so add them as part of exposing
> that compile-test coverage.

The second one needs to be it's own separate patch, along with a Fixes
tag.

Brian

> 
> Tested with:
> make LLVM=1 ARCH=loongarch drivers/clk/stm32/
> 
> Assisted-by: Codex:GPT-5.5
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  drivers/clk/Makefile              | 2 +-
>  drivers/clk/stm32/clk-stm32mp21.c | 1 +
>  drivers/clk/stm32/clk-stm32mp25.c | 1 +
>  3 files changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
> index 9c3a9703ad92..0cd2223de3ca 100644
> --- a/drivers/clk/Makefile
> +++ b/drivers/clk/Makefile
> @@ -150,7 +150,7 @@ obj-y					+= spacemit/
>  obj-$(CONFIG_PLAT_SPEAR)		+= spear/
>  obj-y					+= sprd/
>  obj-$(CONFIG_ARCH_STI)			+= st/
> -obj-$(CONFIG_ARCH_STM32)		+= stm32/
> +obj-$(CONFIG_COMMON_CLK_STM32MP)	+= stm32/
>  obj-y					+= starfive/
>  obj-$(CONFIG_ARCH_SUNXI)		+= sunxi/
>  obj-y					+= sunxi-ng/
> diff --git a/drivers/clk/stm32/clk-stm32mp21.c b/drivers/clk/stm32/clk-stm32mp21.c
> index c8a37b716bd5..3c143371c77e 100644
> --- a/drivers/clk/stm32/clk-stm32mp21.c
> +++ b/drivers/clk/stm32/clk-stm32mp21.c
> @@ -5,6 +5,7 @@
>   */
>  
>  #include <linux/bus/stm32_firewall_device.h>
> +#include <linux/bitfield.h>
>  #include <linux/clk-provider.h>
>  #include <linux/io.h>
>  #include <linux/platform_device.h>
> diff --git a/drivers/clk/stm32/clk-stm32mp25.c b/drivers/clk/stm32/clk-stm32mp25.c
> index 52f0e8a12926..cc95fac66449 100644
> --- a/drivers/clk/stm32/clk-stm32mp25.c
> +++ b/drivers/clk/stm32/clk-stm32mp25.c
> @@ -5,6 +5,7 @@
>   */
>  
>  #include <linux/bus/stm32_firewall_device.h>
> +#include <linux/bitfield.h>
>  #include <linux/clk-provider.h>
>  #include <linux/io.h>
>  #include <linux/platform_device.h>
> -- 
> 2.54.0
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
