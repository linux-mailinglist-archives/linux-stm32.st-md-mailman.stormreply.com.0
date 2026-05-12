Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6G7SHPklA2oF1AEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 12 May 2026 15:07:05 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 02C2A520BC7
	for <lists+linux-stm32@lfdr.de>; Tue, 12 May 2026 15:07:04 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8E967C87ED8;
	Tue, 12 May 2026 13:07:04 +0000 (UTC)
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com
 [209.85.221.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 42578C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 May 2026 07:12:27 +0000 (UTC)
Received: by mail-vk1-f175.google.com with SMTP id
 71dfb90a1353d-56f6afbd205so2846942e0c.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 May 2026 00:12:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778569946; x=1779174746;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2FuciPnJNj5AwtRdMcxDTBtjQGaobaVWkr7dCuNdv28=;
 b=JWmxCo4M34ZX8TAHE/So/GvVV/PnlXcldzolsmLupLVHT/kOjfIfOHDTGlLc1KfhU8
 g4B57sGDT6uRLaTqPJXgAzoqRwYdUr57JRbML1171P/aiy4Ppgd9CYKdGAAWyNC/x4t2
 TvbIGgL2JYgWN1TNXOuXJiDWiUdqFAw99no61lxR3zC7JSVdhlF9HPZPwiUQm0gJb+Uu
 O2G7O3zostq762eowQ50s3Jzn44j6ZJalDArD2TiNZnMQmKSxB41bfyGiena6z7CD9uI
 kDdha1/jbKyUId8aq7YLRCnp2tcNE3kGRhfY2UKk4aCG58JYgGC/iYguBX35mBEc3BNt
 jD8Q==
X-Forwarded-Encrypted: i=1;
 AFNElJ9IYd8Umnsy2MFLi+VArMrYUhouXOtK2dQ7vIZ5fUydywjqkFSdN6+Zv1q5eOppePDKvnpu+/KKpF4uIw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyabmbdHBteOBdU4x9aade5HwzeT53V75PsEuitVwZjLBfHusZf
 d9G0dbB2wYLtXWrQS4XxSia+eV/vWqSpKRSDV1f+dzT257RD6BRyu4w+J/GV64lC
X-Gm-Gg: Acq92OFjPQ2mXk8jZ1P9tablxdtVAlUBElFDP9LWvr5E5V3gL7hVjx1M926yJ42BLg5
 KxAa6NtcyXBVPbgzhHgDmVjnWucwOYnbd/3aqCYvLMBy9l5nW3C9aLBK+DbDhT2Y/P05SLraajY
 NZbmihL/5tBeYHlpHjMExSmCHJMG5uZS1+3jxZ0dHwtPF7oL3xAPHRfgEH+A4to7Sc53bcJyTC/
 iRxbMZ8hoXPFo+aQhvmW+5dwI1vvEpj+jbp/0nAJVbDxHTI/dx6B047gcQnH9D1/fzPMXwJgyS4
 zebqg5h3pEPgIn9643ka+UR8GwXmrc1m+o7puLACFg+ZblMl4XTJvHs/jFpUvYH5nOlJD23b6im
 wkxCm9F3aaJVHPMZwmGqIdQnbx+IGEMBe0v5F5FD1mP/aSkWFwDUL6FdM92NL+JFASiKmIeYIZB
 XZMtKLyJ8OQrhRmXg1lUFG9JhcU0vLNqS/BuyVaHEex5SkofMWu2hliamrluVM
X-Received: by 2002:a05:6122:7d1:b0:56b:8ba0:fd58 with SMTP id
 71dfb90a1353d-575cfd01eb6mr1213131e0c.6.1778569946127; 
 Tue, 12 May 2026 00:12:26 -0700 (PDT)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com.
 [209.85.217.52]) by smtp.gmail.com with ESMTPSA id
 71dfb90a1353d-575869968e5sm7549795e0c.5.2026.05.12.00.12.25
 for <linux-stm32@st-md-mailman.stormreply.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 May 2026 00:12:25 -0700 (PDT)
Received: by mail-vs1-f52.google.com with SMTP id
 ada2fe7eead31-6312bdd281eso3726002137.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 May 2026 00:12:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AFNElJ9jOyk3QRSx8PqyJLTbynA7y2cuVrRZCJePN9Qmx/+aBNQZEYiOk5i1kjfuHyZzAKKmow14Ji0xEbZh7Q==@st-md-mailman.stormreply.com
X-Received: by 2002:a05:6102:41a7:b0:631:5717:5248 with SMTP id
 ada2fe7eead31-635d27ded2cmr1082007137.21.1778569642797; Tue, 12 May 2026
 00:07:22 -0700 (PDT)
MIME-Version: 1.0
References: <20260511211841.284809-1-ben.levinsky@amd.com>
 <20260511211841.284809-5-ben.levinsky@amd.com>
In-Reply-To: <20260511211841.284809-5-ben.levinsky@amd.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 12 May 2026 09:07:10 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV5UjAB35nPA9ghNm3J9oFavuEv3NHxkxxW3nOU5ZsMwQ@mail.gmail.com>
X-Gm-Features: AVHnY4IHIx-N6TjHjhDj_v4IyNJlawKxUXPhLNy1xplrNwtoo77SAjjbsdZbWCo
Message-ID: <CAMuHMdV5UjAB35nPA9ghNm3J9oFavuEv3NHxkxxW3nOU5ZsMwQ@mail.gmail.com>
To: Ben Levinsky <ben.levinsky@amd.com>
X-Mailman-Approved-At: Tue, 12 May 2026 13:07:03 +0000
Cc: imx@lists.linux.dev, Magnus Damm <magnus.damm@gmail.com>,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, tanmay.shah@amd.com,
 linux-remoteproc@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Frank Li <Frank.Li@nxp.com>, Patrice Chotard <patrice.chotard@foss.st.com>,
 linux-renesas-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 4/4] remoteproc: switch drivers to
	optional resource-table helper
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
X-Rspamd-Queue-Id: 02C2A520BC7
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
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_CC(0.00)[lists.linux.dev,gmail.com,vger.kernel.org,linaro.org,amd.com,kernel.org,nxp.com,foss.st.com,st-md-mailman.stormreply.com,pengutronix.de,lists.infradead.org];
	FORGED_SENDER(0.00)[geert@linux-m68k.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ben.levinsky@amd.com,m:imx@lists.linux.dev,m:magnus.damm@gmail.com,m:linux-kernel@vger.kernel.org,m:mcoquelin.stm32@gmail.com,m:mathieu.poirier@linaro.org,m:tanmay.shah@amd.com,m:linux-remoteproc@vger.kernel.org,m:andersson@kernel.org,m:Frank.Li@nxp.com,m:patrice.chotard@foss.st.com,m:linux-renesas-soc@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:kernel@pengutronix.de,m:festevam@gmail.com,m:s.hauer@pengutronix.de,m:linux-arm-kernel@lists.infradead.org,m:magnusdamm@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.814];
	TAGGED_RCPT(0.00)[linux-stm32];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,linux-m68k.org:email,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Action: no action

On Mon, 11 May 2026 at 23:18, Ben Levinsky <ben.levinsky@amd.com> wrote:
> Use the shared optional resource-table helper in the remoteproc
> drivers that currently ignore a missing table. This keeps the missing
> resource-table case non-fatal while letting other parsing failures
> propagate to the caller.
>
> Signed-off-by: Ben Levinsky <ben.levinsky@amd.com>

>  drivers/remoteproc/rcar_rproc.c         | 13 +----------

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be> # rcar

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
