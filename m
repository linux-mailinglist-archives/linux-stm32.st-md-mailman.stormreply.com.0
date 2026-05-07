Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oBStJZ+v/GnlSgAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 07 May 2026 17:28:31 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EB654EB0CB
	for <lists+linux-stm32@lfdr.de>; Thu, 07 May 2026 17:28:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8CEDCC8F289;
	Thu,  7 May 2026 15:28:30 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9FFC4C8F283
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  7 May 2026 15:28:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 3A1C0406BA;
 Thu,  7 May 2026 15:28:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDA90C2BCB2;
 Thu,  7 May 2026 15:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1778167707;
 bh=4eOAk7Jab8Qd0kCNwcOZLlm6jgPUdg90LEM6kZcx/eo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=tsKTlNuOWmgG9OLtgI/cSdYxSyxXfVLEBh/Hx32ww+52sozgT2D19X9rI4dnCrZYZ
 3KlxKsvyAhnRA38+ONp1wmPUDLN0GP04w6w+l8vft+lGDOhn78JAGJVMgipLYMcivc
 fToIuml6bRnmQYKd954N9uirjQcMVJhroSFWR729xxxg32rASs+NQkub4hhYXE0h60
 NHb+svpZkuJgyi0dKwHLgUc37J17blwvMc8t7Ydf123NGnclFbTULRBjJtT4Ly1Ptq
 G9YOWeaOMCmB5XTF4GZjMlRP2MXq5nmNv3LneHX4yBzs7aILSrwtralDGUMzOKY4LI
 ukigsNFZWVJig==
Date: Thu, 7 May 2026 16:28:15 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Angelo Dureghello <angelo@kernel-space.org>
Message-ID: <20260507162815.1135618e@jic23-huawei>
In-Reply-To: <a4b53dc6-e89d-46a5-b4c1-460b0d90ae30@kernel-space.org>
References: <20260504-wip-stmark2-dac-v1-0-874c36a4910d@baylibre.com>
 <20260504-wip-stmark2-dac-v1-8-874c36a4910d@baylibre.com>
 <ef773bbd-1cf2-4cc2-96a8-fccd3355d6b1@app.fastmail.com>
 <20260506155737.6cd625a5@jic23-huawei>
 <a4b53dc6-e89d-46a5-b4c1-460b0d90ae30@kernel-space.org>
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
Subject: Re: [Linux-stm32] [PATCH 08/10] m68k: stmark2: add mcf5441x DAC
	platform devices
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
X-Rspamd-Queue-Id: 2EB654EB0CB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [5.29 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	MID_RHS_NOT_FQDN(0.50)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
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
	NEURAL_HAM(-0.00)[-0.537];
	TAGGED_RCPT(0.00)[linux-stm32];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[kernel-space.org:email,stormreply.com:email,stormreply.com:url,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Action: no action

On Wed, 6 May 2026 23:07:41 +0200
Angelo Dureghello <angelo@kernel-space.org> wrote:

> Hi Jonathan,
> 
> On 5/6/26 16:57, Jonathan Cameron wrote:
> > On Mon, 04 May 2026 19:28:28 +0200
> > "Arnd Bergmann" <arnd@arndb.de> wrote:
> >   
> >> On Mon, May 4, 2026, at 19:16, Angelo Dureghello wrote:  
> >>> @@ -94,8 +94,42 @@ static struct platform_device dspi_spi0_device = {    
> >> ...  
> >>> +static struct resource dspi_dac1_resource[] = {
> >>> +	[0] = {    
> >>
> >> This looks like the name has a copy-paste error: this is not
> >> related to the 'dspi' controller at all but is just the dac, right?
> >>
> >>       Arnd
> >>  
> > 
> > https://sashiko.dev/#/patchset/20260504-wip-stmark2-dac-v1-0-874c36a4910d%40baylibre.com
> > Has noted some more alongside this one.
> > Seems unlikely a DAC has a bus number.
> >   
> 
> that sashiko comment is not clear to me, maybe was related to the comment
> i copy/pasted from dspi.

Yes.  i think that is what it was referring to.

> 
> I have now fixed this as:
> 
> +static struct resource dac0_resource[] = {
> +	DEFINE_RES_MEM(MCFDAC_BASE0, 0x100),
> +};
> +
> +static struct platform_device dac0_device = {
> +	.name = "mcf54415_dac",
> +	.id = 0,
> +	.num_resources = ARRAY_SIZE(dac0_resource),
> +	.resource = dac0_resource,
> +};
> +
> +static struct resource dac1_resource[] = {
> +	DEFINE_RES_MEM(MCFDAC_BASE1, 0x100),
> +};
> +
> +static struct platform_device dac1_device = {
> +	.name = "mcf54415_dac",
> +	.id = 1,
> +	.num_resources = ARRAY_SIZE(dac1_resource),
> +	.resource = dac1_resource,
> +};
> +
>  static struct platform_device *stmark2_devices[] __initdata = {
>  	&dspi_spi0_device,
> +	&dac0_device,
> +	&dac1_device,
>  };
> 
> It should be fine for sashiko too.
> 
> Regards,
> angelo
> 
> > Jonathan  
> 
> 
> 
> 
> 
> -- Angelo
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
