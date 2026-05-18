Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yPivB4i+Cmrb7AQAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 18 May 2026 09:23:52 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B7D645676E7
	for <lists+linux-stm32@lfdr.de>; Mon, 18 May 2026 09:23:51 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E4C3EC56612;
	Mon, 18 May 2026 07:23:50 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D8900C36B3D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 18 May 2026 07:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779089029; x=1810625029;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Nn3A3vAmindilk1fNlnp7BEXPwv+U3vQxYhSLEMgtF8=;
 b=DC+LV0kNijfLH41CtS4w7wn2wwLGB8I93CLdIYswByi7DGASEO1OgZ/m
 lLsYPl0EQ6RuEeEnMImZPTEVoHgRQmyXddfPvXOHh+QS2dwFhYTkqwUpJ
 YVfhKCcE+YQbp6Vc4+jNXxzC0y+v9vZL4KBmso/XBzW9a7cGcfDqo7WdK
 GH9T+iy/3c+CwDt+Sfm3hJK//QMgQDV/MtSuommGv5nO0S6CCMykeP8Tr
 4ek/Mid0Jw0DNjUnkqeAEJ/3iCUfpe02C9GzXJWwPJxQXP5Yo3+m5yImy
 IQjuva5Qi0V5Nh/9j8CeGnqi8F0zjLWVYt1KdlcrjYg5wdCYfHzNchBXN A==;
X-CSE-ConnectionGUID: Etxf578cRXG1jB3rpeGg8w==
X-CSE-MsgGUID: EOm9rbyMS5W3ZY5D2Le2ew==
X-IronPort-AV: E=McAfee;i="6800,10657,11789"; a="79789004"
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; d="scan'208";a="79789004"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2026 00:23:46 -0700
X-CSE-ConnectionGUID: TTUB0lTQSJu1MzH6wr1ojw==
X-CSE-MsgGUID: i2NpznmuR4iym3GJQD2XPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; d="scan'208";a="263125293"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost)
 ([10.245.244.3])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2026 00:23:42 -0700
Date: Mon, 18 May 2026 10:23:40 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: David Lechner <dlechner@baylibre.com>
Message-ID: <agq-fF6dNl-fRVXE@ashevche-desk.local>
References: <20260517-iio-timestamp-cleanup-v1-0-61fb908c11c7@baylibre.com>
 <83c11e2c-9688-4cc9-b7ee-6380de30fb58@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <83c11e2c-9688-4cc9-b7ee-6380de30fb58@baylibre.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
Cc: Andy Shevchenko <andy@kernel.org>, chrome-platform@lists.linux.dev,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Jyoti Bhayana <jbhayana@google.com>, linux-kernel@vger.kernel.org,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>, linux-iio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Guenter Roeck <groeck@chromium.org>,
 Benson Leung <bleung@chromium.org>, linux-stm32@st-md-mailman.stormreply.com,
 Jonathan Cameron <jic23@kernel.org>
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
X-Rspamd-Queue-Id: B7D645676E7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[intel.com:s=Intel];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	DMARC_POLICY_SOFTFAIL(0.10)[intel.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dlechner@baylibre.com,m:andy@kernel.org,m:chrome-platform@lists.linux.dev,m:alexandre.belloni@bootlin.com,m:jbhayana@google.com,m:linux-kernel@vger.kernel.org,m:nicolas.ferre@microchip.com,m:nuno.sa@analog.com,m:linux-iio@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:mcoquelin.stm32@gmail.com,m:claudiu.beznea@tuxon.dev,m:groeck@chromium.org,m:bleung@chromium.org,m:linux-stm32@st-md-mailman.stormreply.com,m:jic23@kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[andriy.shevchenko@intel.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[kernel.org,lists.linux.dev,bootlin.com,google.com,vger.kernel.org,microchip.com,analog.com,lists.infradead.org,gmail.com,tuxon.dev,chromium.org,st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:-];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	TAGGED_RCPT(0.00)[linux-stm32];
	NEURAL_SPAM(0.00)[0.994];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Action: no action

On Sun, May 17, 2026 at 02:22:03PM -0500, David Lechner wrote:
> On 5/17/26 1:17 PM, David Lechner wrote:
> > While looking around the code, I noticed that there are a lot of places
> > were we are manually filling all of the fields of an IIO timestamp.
> > 
> > This is error-prone (as seen in the first patch) and more verbose than
> > it needs to be.
> > 
> > I went with the approach of using the existing IIO_CHAN_SOFT_TIMESTAMP()
> > macro for doing a struct assignment. This does require a cast, which
> > makes it a bit more verbose, but we were already doing that in to
> > drivers, so I went with it anyway.
> > 
> > If we want to consider alternatives, we could make a iio helper function
> > or macro like the first and second patches did.
> > 
> I should have looked harder for existing alternatives. Just found one
> more that avoids the cast via a local variable (in ad4170-4.c):
> 
> 	/* Add timestamp channel */
> 	struct iio_chan_spec ts_chan = IIO_CHAN_SOFT_TIMESTAMP(chan_num);
> 
> 	st->chans[chan_num] = ts_chan;
> 
> And similar code is found in ad7192.c.

See my patch. The above with my patch applied can be simplified to the
inline use.

-- 
With Best Regards,
Andy Shevchenko


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
