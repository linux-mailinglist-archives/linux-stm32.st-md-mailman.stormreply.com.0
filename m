Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6Ge5D/szC2qgEgUAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 18 May 2026 17:44:59 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 98C105703B3
	for <lists+linux-stm32@lfdr.de>; Mon, 18 May 2026 17:44:58 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3E1F1C58D7C;
	Mon, 18 May 2026 15:44:58 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7A18CC1A979
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 18 May 2026 15:44:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 2A3B742DD7;
 Mon, 18 May 2026 15:44:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CE63C2BCB7;
 Mon, 18 May 2026 15:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1779119096;
 bh=gTu+hAwJZKRLTtD+A+avEeHzQqC6EwtEYG0HiI1fp9A=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=X1gim1Wewd9sNHDtgFPPToYX5SKVHGz0nzoOWrfIGr6ZyMJ10PN2Egti7EXrVR8Wa
 mId0oBVge4I3rGeM8hXIMJQwNXziR9yKy77esHXNPB1HDc6PMFrk0dmWipBmSgSNZ1
 apMywtgeKXmL1+utaE7kCj3kj61ONlYEJug5ylrTPQhp/NWNJVuWfRrKBX+LAI51B1
 f6n6mBxlo7Z8oZC/sVsX/1oI0iUfiOrsmzniMDPQUfjWBJuMEoao+ZtqquSXLBF/oW
 C7CN9pWLhdBNESKp7w/AjQ5KT576gFS/Jzhzn/f6wn6gjr1s7yoHPOU3gU8baW2CSo
 zK+IUq9VT36nQ==
Date: Mon, 18 May 2026 16:44:44 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: David Lechner <dlechner@baylibre.com>
Message-ID: <20260518164444.7fb5f616@jic23-huawei>
In-Reply-To: <41c0317d-2ce8-412c-818a-4a84201fce29@baylibre.com>
References: <20260517-iio-timestamp-cleanup-v1-0-61fb908c11c7@baylibre.com>
 <agq7PPw0qupI_8Dh@ashevche-desk.local>
 <agq8Q1wpzIw4XhNQ@ashevche-desk.local>
 <41c0317d-2ce8-412c-818a-4a84201fce29@baylibre.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: Andy Shevchenko <andy@kernel.org>, chrome-platform@lists.linux.dev,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Andy Shevchenko <andriy.shevchenko@intel.com>,
 Jyoti Bhayana <jbhayana@google.com>, linux-kernel@vger.kernel.org,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, linux-iio@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Guenter Roeck <groeck@chromium.org>,
 Benson Leung <bleung@chromium.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 0/8] iio: timestamp declaration cleanup
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
	FORGED_RECIPIENTS(0.00)[m:dlechner@baylibre.com,m:andy@kernel.org,m:chrome-platform@lists.linux.dev,m:alexandre.belloni@bootlin.com,m:andriy.shevchenko@intel.com,m:jbhayana@google.com,m:linux-kernel@vger.kernel.org,m:nicolas.ferre@microchip.com,m:nuno.sa@analog.com,m:linux-iio@vger.kernel.org,m:mcoquelin.stm32@gmail.com,m:claudiu.beznea@tuxon.dev,m:groeck@chromium.org,m:bleung@chromium.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:-];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[jic23@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,lists.linux.dev,bootlin.com,intel.com,google.com,vger.kernel.org,microchip.com,analog.com,gmail.com,tuxon.dev,chromium.org,st-md-mailman.stormreply.com,lists.infradead.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,baylibre.com:email,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: 98C105703B3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, 18 May 2026 09:34:48 -0500
David Lechner <dlechner@baylibre.com> wrote:

> On 5/18/26 2:14 AM, Andy Shevchenko wrote:
> > On Mon, May 18, 2026 at 10:09:48AM +0300, Andy Shevchenko wrote:  
> >> On Sun, May 17, 2026 at 01:17:17PM -0500, David Lechner wrote:  
> >>> While looking around the code, I noticed that there are a lot of places
> >>> were we are manually filling all of the fields of an IIO timestamp.
> >>>
> >>> This is error-prone (as seen in the first patch) and more verbose than
> >>> it needs to be.
> >>>
> >>> I went with the approach of using the existing IIO_CHAN_SOFT_TIMESTAMP()
> >>> macro for doing a struct assignment. This does require a cast, which  
> >>
> >> No, it's *not* a cast. It's a compound literal. And instead of doing this in
> >> every driver, add it to the macro (in a separate patch). Oh, let me just cook
> >> it for you (I added that to several cases in the past).  
> > 
> > 20260518071349.469748-1-andriy.shevchenko@linux.intel.com  
> 
> Nice, thanks. I agree this will be the cleanest solution.
With that the series looks good to me.

J
> 
> >   
> >>> makes it a bit more verbose, but we were already doing that in to
> >>> drivers, so I went with it anyway.  
> >>  
> >>> If we want to consider alternatives, we could make a iio helper function
> >>> or macro like the first and second patches did.  
> >   
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
