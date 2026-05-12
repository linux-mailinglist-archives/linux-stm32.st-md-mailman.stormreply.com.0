Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YITBNorRAmoNxgEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 12 May 2026 09:06:50 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A34451B773
	for <lists+linux-stm32@lfdr.de>; Tue, 12 May 2026 09:06:50 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D6607C87EC1;
	Tue, 12 May 2026 07:06:49 +0000 (UTC)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com
 [209.85.217.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F419CC36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 May 2026 07:06:47 +0000 (UTC)
Received: by mail-vs1-f45.google.com with SMTP id
 ada2fe7eead31-6314cc192a4so1030625137.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 May 2026 00:06:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778569607; x=1779174407;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6U9R02UyT6PCn4mJzYYl/CPWidpbIlIhzjolxdPX7hg=;
 b=lAwO86pO3aV4zcz/Scz0tBoR8nM/JtUmWT0DZR3WmWsEcZkOccfY2vGDYDJOR9jl7L
 +dbTUFTl4th6EdyKmIXlxUuKEBjvtV1XZzwpvnQd6CBBRyCCAMHM1jRTI6esssfGSo2c
 YFgXUgQJHuWPUnGm4Sm6tHQP/fZccP/sNiCYIQg61sFTUsQZWPkVhhCge2ISOuaSWMGC
 odtJed4pWsS4o3rNEImA51x1EPpp3InTYuDjjCfzHCbwE+mLhEas7NpGjWMkI/yxT710
 JPWj33jDaD2qD2fHUxjdsUaE0V6nNMPHRKDoL8DyPOc9JM8keXCu8LSi2hdOpU/HEiRw
 v5GQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ8I9tUo+jwcfN1S5y8eOGF8q2w8MxPNJbi9N1RdEOFX5XjPqByxCgzYthsefQSTaNWMVExTLCivMibpXQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwzSsbrAgwytjx38oDTWJpsmDuvPvwIV7+6sgu3c8jafhIucCV2
 YUZpR4JJfk5natQyxeanl4XK4afK83qiAgAkG7kE68ns/3PiFF5Kpbnvfy5KEhv5
X-Gm-Gg: Acq92OGbtzl53uYdhi7FUl1xauTXeLISLiOjk29Y5/A6sa4SULI38g2NEnyZ8Biirzm
 uaD6eJ4gy7yFGOdZBgyPminBKvvBTVaFjx+FSkh55mLefQe1jAhiH+e/XXSZ8EV7B1oXVTTDhrf
 OMoIQYeJ5R1jekAgXSYtfLX8s14NKvxLEmN+27O5s0cvHjtEKnRLHnXBLMXpgrVpmoF3SCP+eIA
 cNYGpVmpUBOZIjpFXcyQ9I5eUwqml99Jqvr1UkqbN+Ylj0gR2EvSlnoqmQRZyGP160t8Bhd0WOZ
 qePLTiwmZc2no9NTCARVjANSm9FP3wfHkRwUBmDqH9GKMCjhPfQsub59o1YVktKS7Xj4Xb2l2mY
 zwpCEHPVbKP3yvLIhf74/ryLMnnZvXVmoY7RYB+BIrF5gcG6x9G2srI2Se3r4cYo7zWvLNpfIfD
 cMKgVflqtbFZCzBiQVVMZC1qlSpOoBPxuapiQVOxuHREhZXpziJ+O4hLOgWMu3
X-Received: by 2002:a05:6102:5e88:b0:5ff:c5c8:2734 with SMTP id
 ada2fe7eead31-63617dd4204mr601809137.25.1778569606485; 
 Tue, 12 May 2026 00:06:46 -0700 (PDT)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com.
 [209.85.217.43]) by smtp.gmail.com with ESMTPSA id
 ada2fe7eead31-6313fdbf5c4sm8339102137.0.2026.05.12.00.06.45
 for <linux-stm32@st-md-mailman.stormreply.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 May 2026 00:06:45 -0700 (PDT)
Received: by mail-vs1-f43.google.com with SMTP id
 ada2fe7eead31-63319183a49so715204137.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 May 2026 00:06:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AFNElJ/ZxMwb/NmN/IlUfzEBooLSiOUkF2iAqO4jVGkn/zss1IOwoHB+IltE1ffETzyfPAzDZNT7M/uVmMU+qA==@st-md-mailman.stormreply.com
X-Received: by 2002:a67:e7c5:0:b0:631:26f6:701c with SMTP id
 ada2fe7eead31-636187cd6ffmr637420137.31.1778569604976; Tue, 12 May 2026
 00:06:44 -0700 (PDT)
MIME-Version: 1.0
References: <20260511211841.284809-1-ben.levinsky@amd.com>
 <20260511211841.284809-3-ben.levinsky@amd.com>
In-Reply-To: <20260511211841.284809-3-ben.levinsky@amd.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 12 May 2026 09:06:33 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXn8G-nJ-=_eVRnZO_1nzWuP-AjTVL5SWH-D1w2F2QVfA@mail.gmail.com>
X-Gm-Features: AVHnY4Jzn5XG3w_TFgzZrTYfNPhFMcAA9wRYKEMGtDIRqvMdxDHMc6dhfvtpVZA
Message-ID: <CAMuHMdXn8G-nJ-=_eVRnZO_1nzWuP-AjTVL5SWH-D1w2F2QVfA@mail.gmail.com>
To: Ben Levinsky <ben.levinsky@amd.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, imx@lists.linux.dev,
 tanmay.shah@amd.com, linux-remoteproc@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 linux-renesas-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 2/4] remoteproc: switch exact-match
	drivers to wc-ioremap callbacks
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
X-Rspamd-Queue-Id: 6A34451B773
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.29 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,glider.be,linaro.org,lists.linux.dev,amd.com,kernel.org,nxp.com,foss.st.com,st-md-mailman.stormreply.com,pengutronix.de,lists.infradead.org];
	FORGED_SENDER(0.00)[geert@linux-m68k.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ben.levinsky@amd.com,m:mcoquelin.stm32@gmail.com,m:magnus.damm@gmail.com,m:linux-kernel@vger.kernel.org,m:geert+renesas@glider.be,m:mathieu.poirier@linaro.org,m:imx@lists.linux.dev,m:tanmay.shah@amd.com,m:linux-remoteproc@vger.kernel.org,m:andersson@kernel.org,m:Frank.Li@nxp.com,m:patrice.chotard@foss.st.com,m:linux-renesas-soc@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:kernel@pengutronix.de,m:festevam@gmail.com,m:s.hauer@pengutronix.de,m:linux-arm-kernel@lists.infradead.org,m:mcoquelinstm32@gmail.com,m:magnusdamm@gmail.com,m:geert@glider.be,s:lists@lfdr.de];
	DMARC_NA(0.00)[linux-m68k.org];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.685];
	TAGGED_RCPT(0.00)[linux-stm32,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,mail.gmail.com:mid,glider.be:email,linux-m68k.org:email]
X-Rspamd-Action: no action

Hi Ben,

On Mon, 11 May 2026 at 23:18, Ben Levinsky <ben.levinsky@amd.com> wrote:
> Replace the exact-match carveout map and unmap callbacks in the
> existing remoteproc drivers with the common wc-ioremap helpers. Leave
> the zynqmp R5 TCM callbacks alone because they also clear the mapped
> memory and are not exact matches.
>
> Signed-off-by: Ben Levinsky <ben.levinsky@amd.com>

Thanks for your patch!

>  drivers/remoteproc/rcar_rproc.c         | 33 ++---------------

This change also makes sure mem->is_iomem is true, which looks like
a valid bug fix. Do you know what was the impact of not setting
this before?

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be> # renesas

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
