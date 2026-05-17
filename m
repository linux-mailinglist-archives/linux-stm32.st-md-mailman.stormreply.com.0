Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KIAXBPqpCWq/kAQAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Sun, 17 May 2026 13:43:54 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BF9F3560C9C
	for <lists+linux-stm32@lfdr.de>; Sun, 17 May 2026 13:43:49 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 60EDBC8F281;
	Sun, 17 May 2026 11:43:49 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1F815C01FB6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 17 May 2026 11:43:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 13B8D600BB;
 Sun, 17 May 2026 11:43:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EBCEC2BCB0;
 Sun, 17 May 2026 11:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1779018226;
 bh=S2hLW0ECNDf1VAnqrTJ4Mw0W1eh9WjufgWQJI7GfTws=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=fo7pCTs5v/OzRFKbx5k9YCj/rghUcBhldH+5CLLSwdZsLNoVl584fJVoCPPXI5U90
 fw7YgLqxkcV9YolrACZb6plA1swzMCM7nC/gnktIikW1/jSSsFfRpVv9Bjb5ruIsXy
 LnNIJVXTMTdlLZr81uPMpJSBh8f2gEeWf07Qkg/D9MGdVuCudTVQd18tjC/S99dMfj
 ooSluCxCmFQtf+oBLjLfYa4vl/1/7N1xPq4vojDZ8hYeBSud2VPC2e/wzsQkIRvtrn
 NJCUgziPa7K5+REs7TOAR+9jXJ0VCFsp5hb5KYKN/yIAjIy3pk4LnlGS7xHu/ShHpI
 R0i09NBKSQn7A==
Date: Sun, 17 May 2026 12:43:36 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Angelo Dureghello <adureghello@baylibre.com>
Message-ID: <20260517124336.242ffb6a@jic23-huawei>
In-Reply-To: <CALSJ-wAqFni+OwSUcQS+KESfe7SbWMxc0aCURHtTZ93Rx6GZhw@mail.gmail.com>
References: <CALSJ-wAqFni+OwSUcQS+KESfe7SbWMxc0aCURHtTZ93Rx6GZhw@mail.gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: Andy Shevchenko <andy@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Steven King <sfking@fdwdc.com>,
 linux-m68k@lists.linux-m68k.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Greg Ungerer <gerg@uclinux.org>,
 David Lechner <dlechner@baylibre.com>, Greg Ungerer <gerg@linux-m68k.org>,
 linux-arm-kernel@lists.infradead.org
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Rspamd-Queue-Id: BF9F3560C9C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [5.29 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	MID_RHS_NOT_FQDN(0.50)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:adureghello@baylibre.com,m:andy@kernel.org,m:arnd@arndb.de,m:linux-iio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:nuno.sa@analog.com,m:sfking@fdwdc.com,m:linux-m68k@lists.linux-m68k.org,m:geert@linux-m68k.org,m:mcoquelin.stm32@gmail.com,m:gerg@uclinux.org,m:dlechner@baylibre.com,m:gerg@linux-m68k.org,m:linux-arm-kernel@lists.infradead.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jic23@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	GREYLIST(0.00)[pass,meta];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:-];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[jic23@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,arndb.de,vger.kernel.org,st-md-mailman.stormreply.com,analog.com,fdwdc.com,lists.linux-m68k.org,linux-m68k.org,gmail.com,uclinux.org,baylibre.com,lists.infradead.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_RCPT(0.00)[linux-stm32];
	NEURAL_SPAM(0.00)[0.140];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

On Sun, 17 May 2026 02:11:33 -0700
Angelo Dureghello <adureghello@baylibre.com> wrote:

> Hi Greg,
> 
> jfyi, for some reason i was not in to/cc, but i could grab the message
> in lore.
> 
> On Thu, May 14, 2026 at 10:54:32PM +1000, Greg Ungerer wrote:
> > Hi Angelo,
> >
> > On 14/5/26 17:05, Angelo Dureghello wrote:  
> > > Hi Greg,
> > >
> > > On 14.05.2026 11:27, Greg Ungerer wrote:  
> > > > Hi Angelo,
> > > >
> > > > On 13/5/26 19:14, Angelo Dureghello wrote:  
> > > > > From: Angelo Dureghello <adureghello@baylibre.com>
> > > > >
> > > > > Later in this patchset, the mcf54415 DAC driver is added.
> > > > > Considering some other different ColdFire cpu DACs exists, the DAC driver
> > > > > is named as "mcf54415_dac", related to the mcf5441x family SoCs with
> > > > > DACs (mcf54415/6/7/8).
> > > > >
> > > > > So updating DAC clock names to bind with proper driver name.  
> > > >
> > > > I am not sure I like naming the clocks here with a prefix for the
> > > > specific SoC part number this is in. It might be unlikely now, but
> > > > what if another ColdFire family SoC member uses this same hardware block?
> > > > That is very common amongst other hardware blocks within the ColdFire
> > > > family. Can we come up with a name more specific to just this type
> > > > of DAC hardware block?
> > > >  
> > >
> > > from a brief study, this 12bit DAC, and DAC module in general, is only on
> > > this mcf45441x family. There are some ColdFire with ADC only, as those
> > > mcf5249/53/82.
> > > The mcf51mm/ag/je are the opnly to have a 5bit dacs, but these are mcus.
> > > So, if i don't miss any existing model, the name may be correct,
> > > unless we want rename it to a more generic mcf_dac.  
> >
> > Yes, I would suggest just leaving it as is, "mcfdac".
> > That is not currently used by any other ColdFire variants supported by
> > the kernel.
> >  
> 
> Ok, will fix this in a v3, just asking confirmation on the name to
> Jonathan and all, since it involves iio too.
> 
> Chaches are:
> mcfdac
> mcf-dac  or mcf_dac (we have drivers as vf610_dac and cio-dac)

I'm a bit lost.  If we are talking about clocks that's fine as confusion is very
unlikely.  If we are talking driver naming - pick a part on which it exists and
name it after that.

Historically we made a few mistakes letting in very generic driver names
and it causes confusion when a non compatible part comes along.

If we know these have 'versions' of IP like the QC ones do, then we could name
them after generations but that is often not actually documented anywhere
so would need confirmation from Coldfire folk.

Jonathan

> 
> Regards,
> angelo
> 
> > Regards
> > Greg
> >
> >  
> 
> 
> 
> >  
> > > > Regards
> > > > Greg
> > > >
> > > >  
> > >
> > > Regards,
> > > angelo  
> > > >
> > > >  
> > > > > Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
> > > > > ---
> > > > >    arch/m68k/coldfire/m5441x.c | 8 ++++----
> > > > >    1 file changed, 4 insertions(+), 4 deletions(-)
> > > > >
> > > > > diff --git a/arch/m68k/coldfire/m5441x.c b/arch/m68k/coldfire/m5441x.c
> > > > > index 5b5e09ecf487..b724d7fc1a08 100644
> > > > > --- a/arch/m68k/coldfire/m5441x.c
> > > > > +++ b/arch/m68k/coldfire/m5441x.c
> > > > > @@ -43,8 +43,8 @@ DEFINE_CLK(0, "mcfpit.2", 34, MCF_BUSCLK);
> > > > >    DEFINE_CLK(0, "mcfpit.3", 35, MCF_BUSCLK);
> > > > >    DEFINE_CLK(0, "mcfeport.0", 36, MCF_CLK);
> > > > >    DEFINE_CLK(0, "mcfadc.0", 37, MCF_CLK);
> > > > > -DEFINE_CLK(0, "mcfdac.0", 38, MCF_CLK);
> > > > > -DEFINE_CLK(0, "mcfdac.1", 39, MCF_CLK);
> > > > > +DEFINE_CLK(0, "mcf54415_dac.0", 38, MCF_CLK);
> > > > > +DEFINE_CLK(0, "mcf54415_dac.1", 39, MCF_CLK);
> > > > >    DEFINE_CLK(0, "mcfrtc.0", 42, MCF_CLK);
> > > > >    DEFINE_CLK(0, "mcfsim.0", 43, MCF_CLK);
> > > > >    DEFINE_CLK(0, "mcfusb-otg.0", 44, MCF_CLK);
> > > > > @@ -106,8 +106,8 @@ static struct clk_lookup m5411x_clk_lookup[] = {
> > > > >    	CLKDEV_INIT("mcfpit.3", NULL, &__clk_0_35),
> > > > >    	CLKDEV_INIT("mcfeport.0", NULL, &__clk_0_36),
> > > > >    	CLKDEV_INIT("mcfadc.0", NULL, &__clk_0_37),
> > > > > -	CLKDEV_INIT("mcfdac.0", NULL, &__clk_0_38),
> > > > > -	CLKDEV_INIT("mcfdac.1", NULL, &__clk_0_39),
> > > > > +	CLKDEV_INIT("mcf54415_dac.0", NULL, &__clk_0_38),
> > > > > +	CLKDEV_INIT("mcf54415_dac.1", NULL, &__clk_0_39),
> > > > >    	CLKDEV_INIT("mcfrtc.0", NULL, &__clk_0_42),
> > > > >    	CLKDEV_INIT("mcfsim.0", NULL, &__clk_0_43),
> > > > >    	CLKDEV_INIT("mcfusb-otg.0", NULL, &__clk_0_44),
> > > > >  
> > > >  
> >
> >  

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
