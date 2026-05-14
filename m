Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gNzdOBglBWq3SwIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 14 May 2026 03:27:52 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 913C353CB36
	for <lists+linux-stm32@lfdr.de>; Thu, 14 May 2026 03:27:51 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 62DF9C8F290;
	Thu, 14 May 2026 01:27:51 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7D814C01FB6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 May 2026 01:27:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 6225760052;
 Thu, 14 May 2026 01:27:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81F48C19425;
 Thu, 14 May 2026 01:27:44 +0000 (UTC)
Message-ID: <734e2323-78dc-43c7-b5fc-0a35cc72e035@linux-m68k.org>
Date: Thu, 14 May 2026 11:27:40 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Angelo Dureghello <adureghello@baylibre.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Steven King <sfking@fdwdc.com>,
 Arnd Bergmann <arnd@arndb.de>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>,
 =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>
References: <20260513-wip-stmark2-dac-v2-0-fcdae50cf51a@baylibre.com>
 <20260513-wip-stmark2-dac-v2-3-fcdae50cf51a@baylibre.com>
Content-Language: en-US
From: Greg Ungerer <gerg@linux-m68k.org>
In-Reply-To: <20260513-wip-stmark2-dac-v2-3-fcdae50cf51a@baylibre.com>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, Greg Ungerer <gerg@uclinux.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 03/11] m68k: mcf5441x: setup DAC clock
 name as per driver name
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Rspamd-Queue-Id: 913C353CB36
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.29 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[linux-m68k.org];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:adureghello@baylibre.com,m:geert@linux-m68k.org,m:sfking@fdwdc.com,m:arnd@arndb.de,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:jic23@kernel.org,m:dlechner@baylibre.com,m:nuno.sa@analog.com,m:andy@kernel.org,m:linux-iio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-m68k@lists.linux-m68k.org,m:gerg@uclinux.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[gerg@linux-m68k.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_TO(0.00)[baylibre.com,linux-m68k.org,fdwdc.com,arndb.de,gmail.com,foss.st.com,kernel.org,analog.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[gerg@linux-m68k.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[baylibre.com:email,st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo,stormreply.com:email,stormreply.com:url]
X-Rspamd-Action: no action

Hi Angelo,

On 13/5/26 19:14, Angelo Dureghello wrote:
> From: Angelo Dureghello <adureghello@baylibre.com>
> 
> Later in this patchset, the mcf54415 DAC driver is added.
> Considering some other different ColdFire cpu DACs exists, the DAC driver
> is named as "mcf54415_dac", related to the mcf5441x family SoCs with
> DACs (mcf54415/6/7/8).
> 
> So updating DAC clock names to bind with proper driver name.

I am not sure I like naming the clocks here with a prefix for the
specific SoC part number this is in. It might be unlikely now, but
what if another ColdFire family SoC member uses this same hardware block?
That is very common amongst other hardware blocks within the ColdFire
family. Can we come up with a name more specific to just this type
of DAC hardware block?

Regards
Greg




> Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
> ---
>   arch/m68k/coldfire/m5441x.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/m68k/coldfire/m5441x.c b/arch/m68k/coldfire/m5441x.c
> index 5b5e09ecf487..b724d7fc1a08 100644
> --- a/arch/m68k/coldfire/m5441x.c
> +++ b/arch/m68k/coldfire/m5441x.c
> @@ -43,8 +43,8 @@ DEFINE_CLK(0, "mcfpit.2", 34, MCF_BUSCLK);
>   DEFINE_CLK(0, "mcfpit.3", 35, MCF_BUSCLK);
>   DEFINE_CLK(0, "mcfeport.0", 36, MCF_CLK);
>   DEFINE_CLK(0, "mcfadc.0", 37, MCF_CLK);
> -DEFINE_CLK(0, "mcfdac.0", 38, MCF_CLK);
> -DEFINE_CLK(0, "mcfdac.1", 39, MCF_CLK);
> +DEFINE_CLK(0, "mcf54415_dac.0", 38, MCF_CLK);
> +DEFINE_CLK(0, "mcf54415_dac.1", 39, MCF_CLK);
>   DEFINE_CLK(0, "mcfrtc.0", 42, MCF_CLK);
>   DEFINE_CLK(0, "mcfsim.0", 43, MCF_CLK);
>   DEFINE_CLK(0, "mcfusb-otg.0", 44, MCF_CLK);
> @@ -106,8 +106,8 @@ static struct clk_lookup m5411x_clk_lookup[] = {
>   	CLKDEV_INIT("mcfpit.3", NULL, &__clk_0_35),
>   	CLKDEV_INIT("mcfeport.0", NULL, &__clk_0_36),
>   	CLKDEV_INIT("mcfadc.0", NULL, &__clk_0_37),
> -	CLKDEV_INIT("mcfdac.0", NULL, &__clk_0_38),
> -	CLKDEV_INIT("mcfdac.1", NULL, &__clk_0_39),
> +	CLKDEV_INIT("mcf54415_dac.0", NULL, &__clk_0_38),
> +	CLKDEV_INIT("mcf54415_dac.1", NULL, &__clk_0_39),
>   	CLKDEV_INIT("mcfrtc.0", NULL, &__clk_0_42),
>   	CLKDEV_INIT("mcfsim.0", NULL, &__clk_0_43),
>   	CLKDEV_INIT("mcfusb-otg.0", NULL, &__clk_0_44),
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
