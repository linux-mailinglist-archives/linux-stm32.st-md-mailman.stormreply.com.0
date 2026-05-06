Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6B2EDKVW+2mvZgMAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 06 May 2026 16:56:37 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A8D304DCB86
	for <lists+linux-stm32@lfdr.de>; Wed, 06 May 2026 16:56:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 55B3CC8F289;
	Wed,  6 May 2026 14:56:36 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9EF72C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  6 May 2026 14:56:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 8EE4760180;
 Wed,  6 May 2026 14:56:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DBF4C2BCC7;
 Wed,  6 May 2026 14:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1778079393;
 bh=bsx0g8RkKR5HeXJ4S13Js2wdRNvek52tucLoRCTiuXk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=QoBC5/IYlle6Vq2hjQXnBQOo894nXVp5QJ02RZ89WtAhqUTM0tDM14RkOaO4LxJNA
 AErds4eMBwdMIOkKRD8PKrNYGvPi1XUBXkr8ypSBq0fN3sO+nTMgXAyYsIzeWODE9B
 bxtD6SYSYRb/ip5194RD2Qr9eaOnfGUS0pGbcHkTWZedRvUuNMH02KrlVLCxkJdJnj
 gYCoblx/GOqMgQxusTpuEcGEbQalUhI8/ovIMtDlB6d1Tx999WliDiGOUrgZdw6cp3
 j8N2q/JdYSd+dZ1F5DWpJ5lO5oACn4EFQunWZz2O088S8aLgH/tYu8y9Niu00dQdbk
 c7GVGPFYi9o6Q==
Date: Wed, 6 May 2026 15:56:21 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Angelo Dureghello <angelo@kernel-space.org>
Message-ID: <20260506155621.5b858f6f@jic23-huawei>
In-Reply-To: <20260504-wip-stmark2-dac-v1-7-874c36a4910d@baylibre.com>
References: <20260504-wip-stmark2-dac-v1-0-874c36a4910d@baylibre.com>
 <20260504-wip-stmark2-dac-v1-7-874c36a4910d@baylibre.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: Andy Shevchenko <andy@kernel.org>,
 Angelo Dureghello <adureghello@baylibre.com>, Arnd Bergmann <arnd@arndb.de>,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Steven King <sfking@fdwdc.com>,
 linux-m68k@lists.linux-m68k.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Greg Ungerer <gerg@uclinux.org>,
 David Lechner <dlechner@baylibre.com>, Greg Ungerer <gerg@linux-m68k.org>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 07/10] m68k: mcf5441x: add CCR MISCCR2
	bitfields
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
X-Rspamd-Queue-Id: A8D304DCB86
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [5.29 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	MID_RHS_NOT_FQDN(0.50)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[jic23@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_RECIPIENTS(0.00)[m:angelo@kernel-space.org,m:andy@kernel.org,m:adureghello@baylibre.com,m:arnd@arndb.de,m:linux-iio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:nuno.sa@analog.com,m:sfking@fdwdc.com,m:linux-m68k@lists.linux-m68k.org,m:geert@linux-m68k.org,m:mcoquelin.stm32@gmail.com,m:gerg@uclinux.org,m:dlechner@baylibre.com,m:gerg@linux-m68k.org,m:linux-arm-kernel@lists.infradead.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:-];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[jic23@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,baylibre.com,arndb.de,vger.kernel.org,st-md-mailman.stormreply.com,analog.com,fdwdc.com,lists.linux-m68k.org,linux-m68k.org,gmail.com,uclinux.org,lists.infradead.org];
	NEURAL_HAM(-0.00)[-0.884];
	TAGGED_RCPT(0.00)[linux-stm32];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[baylibre.com:email,kernel-space.org:email,sashiko.dev:url,st-md-mailman.stormreply.com:rdns]

On Mon, 04 May 2026 19:16:45 +0200
Angelo Dureghello <angelo@kernel-space.org> wrote:

> From: Angelo Dureghello <adureghello@baylibre.com>
> 
> Add CCR MISCCR2 register bitfields.
> 
> Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
https://sashiko.dev/#/patchset/20260504-wip-stmark2-dac-v1-0-874c36a4910d%40baylibre.com
has valid suggestion that if you are using BIT() and GENMASK() you need
a suitable header include.


> ---
>  arch/m68k/include/asm/m5441xsim.h | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/arch/m68k/include/asm/m5441xsim.h b/arch/m68k/include/asm/m5441xsim.h
> index 9ce2cbb05316..93f7943d5550 100644
> --- a/arch/m68k/include/asm/m5441xsim.h
> +++ b/arch/m68k/include/asm/m5441xsim.h
> @@ -145,6 +145,21 @@
>  #define MCF_CCM_SBFCR		0xec090022
>  #define MCF_CCM_FNACR		0xec090024
>  
> +/* Bit definitions and macros for MCF_CCM_MISCCR2 */
> +#define MCF_CCM_MISCCR2_ULPI		BIT(0)
> +#define MCF_CCM_MISCCR2_FB_HALF		BIT(1)
> +#define MCF_CCM_MISCCR2_ADC3_EN		BIT(2)
> +#define MCF_CCM_MISCCR2_ADC7_EN		BIT(3)
> +#define MCF_CCM_MISCCR2_ADC_EN		BIT(4)
> +#define MCF_CCM_MISCCR2_DAC0_SEL	BIT(5)
> +#define MCF_CCM_MISCCR2_DAC1_SEL	BIT(6)
> +#define MCF_CCM_MISCCR2_DCC_BYP		BIT(7)
> +#define MCF_CCM_MISCCR2_PLL_MODE	GENMASK(9, 7)
> +#define MCF_CCM_MISCCR2_SWT_SCR		BIT(12)
> +#define MCF_CCM_MISCCR2_RGPIO_HALF	BIT(13)
> +#define MCF_CCM_MISCCR2_DDR2_CLK	BIT(14)
> +#define MCF_CCM_MISCCR2_EXTCLK_BYP	BIT(15)
> +
>  /*
>   *  UART module.
>   */
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
