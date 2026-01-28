Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6Hg7J0daemm35QEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 28 Jan 2026 19:49:43 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 383FEA7E2C
	for <lists+linux-stm32@lfdr.de>; Wed, 28 Jan 2026 19:49:43 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DA89DC56612;
	Wed, 28 Jan 2026 18:49:42 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com
 [209.85.219.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 01392C555BE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 Jan 2026 18:49:41 +0000 (UTC)
Received: by mail-qv1-f47.google.com with SMTP id
 6a1803df08f44-88a26ce6619so2027876d6.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 Jan 2026 10:49:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769626181; x=1770230981;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8t6SLqjvsNW00Dj2Hjf4deNPVV8qylbppXyHu+3S3LI=;
 b=vf4iRX4Q1VSoQjpaommQfeSf038jWHxAwFMf3lLr5aaPEQUPLBk8p6xzWbqRd50rAN
 rf7neaVOdAmw10UwRlFecOm8gMPxXjklWoaqlOj5n09agj1/Lg2RsZj41dfbj0fTARPx
 pXYtPa6I/jJzLEJuRC/ypatx1ATIsD68Bs5rZe69sOzJkQy1cbxn+z7Go4ElIfe70pbO
 wvuQyMzqaZWAuyGp0jXYJgWIk3ATG+qqUd5tnJYzVS9XHd+tsamiV3OkOqyc0ZmQw9cU
 81H+Bu8lYpZPAjThip4HYRVZRLE8bK3u1drXEsi+B3sSqfo+Q/zDrc4ugaYmz2kCtCG1
 IvAA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXNzsicfSEW+uoBlZ6T5Pr2Lg9MFXWw+jsWBBTJXlzStyZIE7sVUtQumezSyqgXRLgLxJqWeuomBASsMQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yz/cZZs8VjLawsYkgH2fi4tkMkOhZ0E9NyrsWdDHjHT5P8UD7pW
 Okr6OMqEC7e8rCEamsFxgjvTM9eNRagvCnzKwAp5kXUOOvOm29A/PpZiDPBJRUlC
X-Gm-Gg: AZuq6aL2XnvjGe0CMPZzNrWfohnaVGqX4ucOt1FVK4FXIWwow4KRFUPbGSx4PDx6Xe8
 pheRqu9YgrL+Q5oY69n/MM6rxl980yUA8ZP3isltqkhaydoS4MJPRez7zOPXq+cAIy2lg/itY+S
 Cv9waxFTY3W/nb9VFrZUdldFbwFI45jC74usPBAXID6NJ8aYFLajCEeiNYzKZPV+oB3v9Ghopq0
 4IZ0R4vHeOFkwlya3dHQLTxu8fnV7Eg/+3M22OdW3PwRFu8cu2YtF+gkLNSGy43VkFncrvnAeSt
 oHPArb2xZlde5kiAEFMsAYS66k7buhkGAQkxkObhoRvjZ2o5geoQcjfJonH6CYSIbDDstW96o3Z
 dyr8/NiQ773JJ6rMyXqZDIJ8kRvq6tQN8WMR0y0BFdlkM3Qz+A/Sg1Vdi2POnYuSetRZOEsBjj6
 eXMx2uCWsDcGj5vNMAZDYPcRI4KXOP+EodcHZkYIWyGM2EqJgUNLTk
X-Received: by 2002:ad4:5943:0:b0:894:628c:940f with SMTP id
 6a1803df08f44-894cc96c860mr85897136d6.66.1769626180472; 
 Wed, 28 Jan 2026 10:49:40 -0800 (PST)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com.
 [209.85.222.174]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-894d37420c5sm22386236d6.31.2026.01.28.10.49.40
 for <linux-stm32@st-md-mailman.stormreply.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Jan 2026 10:49:40 -0800 (PST)
Received: by mail-qk1-f174.google.com with SMTP id
 af79cd13be357-8c0f13e4424so25767885a.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 Jan 2026 10:49:40 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVSx+avP06gMGVzbk0omUwpR5tXIeOR6OeAOYSJbeJE+SMQtRzHLW/vPKAOHpavlhwFh1U+TjOUlVRVFA==@st-md-mailman.stormreply.com
X-Received: by 2002:a05:6102:948:b0:5f1:72a7:f879 with SMTP id
 ada2fe7eead31-5f72378e7a1mr2207053137.28.1769625713444; Wed, 28 Jan 2026
 10:41:53 -0800 (PST)
MIME-Version: 1.0
References: <20260128125850.425264-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260128125850.425264-1-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 28 Jan 2026 19:41:42 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUgnVcwo3b=zQx0wVcH53dm6kBz3nQ5T0DZat4KxastuQ@mail.gmail.com>
X-Gm-Features: AZwV_QggK5aoCgxDwMwUamFclvyMAvDW7y1KAlSqyJcViMQkB2_vluWrOqhRb1Y
Message-ID: <CAMuHMdUgnVcwo3b=zQx0wVcH53dm6kBz3nQ5T0DZat4KxastuQ@mail.gmail.com>
To: Biju <biju.das.au@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 Eric Dumazet <edumazet@google.com>, linux-stm32@st-md-mailman.stormreply.com,
 Rob Herring <robh@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
 Jose Abreu <joabreu@synopsys.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Richard Cochran <richardcochran@gmail.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH net-next 0/8] Add support for Renesas
	RZ/G3L GBETH
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.29 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[glider.be,google.com,st-md-mailman.stormreply.com,kernel.org,gmail.com,synopsys.com,redhat.com,vger.kernel.org,bp.renesas.com,st.com,lists.infradead.org,lunn.ch,davemloft.net];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[geert@linux-m68k.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORGED_RECIPIENTS(0.00)[m:biju.das.au@gmail.com,m:geert+renesas@glider.be,m:edumazet@google.com,m:linux-stm32@st-md-mailman.stormreply.com,m:robh@kernel.org,m:magnus.damm@gmail.com,m:joabreu@synopsys.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:richardcochran@gmail.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:biju.das.jz@bp.renesas.com,m:peppe.cavallaro@st.com,m:linux-arm-kernel@lists.infradead.org,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:andrew+netdev@lunn.ch,m:mcoquelin.stm32@gmail.com,m:krzk+dt@kernel.org,m:davem@davemloft.net,m:bijudasau@gmail.com,m:geert@glider.be,m:magnusdamm@gmail.com,m:conor@kernel.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,m:krzk@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-stm32,renesas,dt,netdev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,mail.gmail.com:mid,linux-m68k.org:email,renesas.com:email,st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: 383FEA7E2C
X-Rspamd-Action: no action

Hi Biju,

On Wed, 28 Jan 2026 at 13:58, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> The Renesas RZ/G3L GBETH IP uses Synopsys DesignWare MAC version 5.30
> compared to other Renesas SoC such as RZ/V2H that use MAC version 5.20.
>
> The RZ/G3L GBETH requires an extra clock compared to RZ/G3E and has pps
> interrupts. Document the Renesas RZ/G3L GBETH IP in bindings and enable
> the Gigabit Ethernet Interface (GBETH0) populated on the RZ/G3L SMARC
> EVK. The eth1, pincontrol definitions and hotplug support will be added
> later.
>
> Biju Das (8):
>   dt-bindings: net: renesas,rzv2h-gbeth: Document Renesas RZ/G3L SoC
>   net: stmmac: dwmac-renesas-gbeth: Add support for RZ/G3L SoC
>   clk: renesas: rzg2l: Drop a check in rzg3s_cpg_pll_clk_recalc_rate()
>   clk: renesas: rzg2l: Add support for enabling PLLs
>   clk: renesas: r8a08g046: Add support for PLL6 clk
>   clk: renesas: r9a08g046: Add clock and reset signals for the GBETH IPs
>   arm64: dts: renesas: r9a08g046: Add GBETH nodes
>   arm64: dts: renesas: rzg3l-smarc-som: Enable eth0 (GBETH) interface

Thanks for your series!

Please don't include "net-next" tags in patches that are not meant
to be applied to the net-next tree.

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
