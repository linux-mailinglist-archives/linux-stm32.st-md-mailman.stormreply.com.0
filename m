Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aKaILMsHimluFQAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 09 Feb 2026 17:14:03 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B05E112623
	for <lists+linux-stm32@lfdr.de>; Mon, 09 Feb 2026 17:14:03 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BBDACC36B3E;
	Mon,  9 Feb 2026 16:14:02 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8A25CC36B3D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  9 Feb 2026 16:14:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 4E61D60138;
 Mon,  9 Feb 2026 16:14:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 632F9C16AAE;
 Mon,  9 Feb 2026 16:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1770653640;
 bh=LOJcn+SmxysmVh2uPMIzBp5pbzxzu9seMnrYNsHRBSg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eUZjPza7FPFYtADnlPyrvUQeLkRIftNqUBdxCxWsmcAxTSEC7h1y3EogopI2EN5yo
 OHmOM4kRW0mWYsaSBWeGG94SFkrQlwoy9ERbFTMTpJ0Io+NbOKNgJNMpqw5vPFTiY6
 qwp352Vg3bCuD/ikfLM+KvmjcmjKBagsBMSXIrGiWJHNZaw4RYV4gPr0yrtQYiRF+s
 XbzUgmmGAWxnPB125eA5XmC+pOpdmCHQCX7Td/XoBgVqmJ4gjH0csPg+S7wNLwyOwO
 QrRRMXCGGZHPIJ2qZsnFaSW8sWMnKrw3L0+d4bXLpB3/vn47IMQEV+DuyQG5OfBMsM
 AqPkD6R2UBZ+g==
Date: Mon, 9 Feb 2026 10:13:54 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Message-ID: <yl4bbbev7lgrmnqys2izkolo5egzg24faukvqar5eh26q5ra7p@42rcegfpqqt6>
References: <20260125184654.17843-6-wsa+renesas@sang-engineering.com>
 <aXc7DxsqiCGdfzxi@smile.fi.intel.com> <aXc-Zxw05XQLb1Dy@ninjato>
 <aXdAB2bLTy6u8G8c@smile.fi.intel.com> <aXdCBu6kzdw1NWay@ninjato>
 <aXikZ5wc6bvgRqF6@ninjato> <aYnBrN0JRCf9-UjB@ninjato>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aYnBrN0JRCf9-UjB@ninjato>
Cc: linux-doc@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>,
 Waiman Long <longman@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 Will Deacon <will@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-omap@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@intel.com>,
 Jonathan Corbet <corbet@lwn.net>, Chunyan Zhang <zhang.lyra@gmail.com>,
 Lee Jones <lee@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Orson Zhai <orsonzhai@gmail.com>, David Lechner <dlechner@baylibre.com>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-sunxi@lists.linux.dev,
 Srinivas Kandagatla <srini@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 linux-arm-msm@vger.kernel.org, Boqun Feng <boqun.feng@gmail.com>,
 linux-gpio@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Shuah Khan <skhan@linuxfoundation.org>, Chen-Yu Tsai <wens@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Andy Shevchenko <andy@kernel.org>,
 Wilken Gottwalt <wilken.gottwalt@posteo.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linus Walleij <linusw@kernel.org>, Samuel Holland <samuel@sholland.org>,
 linux-spi@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Thomas Gleixner <tglx@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Jonathan Cameron <jic23@kernel.org>
Subject: Re: [Linux-stm32] [RFC PATCH 0/4] hwspinlock: refactor headers into
 public provider/consumer pair
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
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[andersson@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[42];
	FORGED_RECIPIENTS(0.00)[m:wsa+renesas@sang-engineering.com,m:linux-doc@vger.kernel.org,m:linux-iio@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:nuno.sa@analog.com,m:longman@redhat.com,m:dakr@kernel.org,m:will@kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-omap@vger.kernel.org,m:andriy.shevchenko@intel.com,m:corbet@lwn.net,m:zhang.lyra@gmail.com,m:lee@kernel.org,m:jernej.skrabec@gmail.com,m:peterz@infradead.org,m:mingo@redhat.com,m:orsonzhai@gmail.com,m:dlechner@baylibre.com,m:konradybcio@kernel.org,m:linux-sunxi@lists.linux.dev,m:srini@kernel.org,m:arnd@arndb.de,m:linux-arm-msm@vger.kernel.org,m:boqun.feng@gmail.com,m:linux-gpio@vger.kernel.org,m:broonie@kernel.org,m:baolin.wang@linux.alibaba.com,m:skhan@linuxfoundation.org,m:wens@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:andy@kernel.org,m:wilken.gottwalt@posteo.net,m:gregkh@linuxfoundation.org,m:linusw@kernel.org,m:samuel@sholland.org,m:linux-spi@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m
 :tglx@kernel.org,m:mcoquelin.stm32@gmail.com,m:rafael@kernel.org,m:jic23@kernel.org,m:wsa@sang-engineering.com,m:zhanglyra@gmail.com,m:jernejskrabec@gmail.com,m:boqunfeng@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:-];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,analog.com,redhat.com,kernel.org,st-md-mailman.stormreply.com,intel.com,lwn.net,gmail.com,infradead.org,baylibre.com,lists.linux.dev,arndb.de,linux.alibaba.com,linuxfoundation.org,lists.infradead.org,posteo.net,sholland.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,renesas];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: 3B05E112623
X-Rspamd-Action: no action

On Mon, Feb 09, 2026 at 12:14:52PM +0100, Wolfram Sang wrote:
> Hi Bjorn, Baolin Wang,
> 
> > > > > Providers need it, especially the 'priv' member. Consumers won't see it.
> > > > 
> > > > But can't we make it opaque?
> > > > 
> > > > We may have getters and setters for the priv member...
> > > 
> > > I think we could do that.
> > > 
> > > Two drivers use the bank member, but only for the device
> > > (lock->bank->dev). That can probably be refactored away, I'd guess.
> > 
> > I am willing to develop this series in the above direction. Before
> > though, I'd like to know from hwspinlock maintainers if they agree to
> > this refactoring in general.
> 
> Moving maintainers from CC to To ;) Do you, in general, approve this
> change to the headers?

Certainly, I don't think we should force unnatural slicing of drivers
across the source tree.

> I think it is more modern and e.g. the mailbox subsystem has a similar
> structure, a header for the client and a header for the controller.

gpio, regulators, resets to name a few more.

> And do you also prefer an opaque 'priv' member?
> 

'priv' is already opaque, so I presume you're asking if we can make
struct hwspinlock internal to hwspinlock_core.c?

I can see the allure of making hwspinlock::lock internal to the core,
but (luckily) I don't see it to be a matter of just slapping some OOP it
and call it solved. It would have to come with a new model for how we
create the hwspinlock in the first place - as this is currently
allocated as a whole by the provider driver.

I've always found the current model unergonomic, resolving this part
might very well have the side effect that Andy is looking for (and I'd
welcome that).

Regards,
Bjorn

> Happy hacking,
> 
>    Wolfram
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
