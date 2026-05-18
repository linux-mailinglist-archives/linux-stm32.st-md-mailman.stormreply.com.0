Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MBc3MUu7CmrG6wQAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 18 May 2026 09:10:03 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A3CC56731A
	for <lists+linux-stm32@lfdr.de>; Mon, 18 May 2026 09:10:03 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0F1B0C56612;
	Mon, 18 May 2026 07:10:03 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9E7A1C36B3D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 18 May 2026 07:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779088200; x=1810624200;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=WR9oCIPIzojPSo64gRHZlaaIuIGSxs3/FGy0IJZb8Xg=;
 b=oIlqvY1c2fyKc0nMG3Jwf60CRz5XhYboFelap94CjbPNJpj1KvxpficQ
 JfDvWIUf0l7cOwsj+7YEXohev7tJuBEQKL3nuipR8zEuZjBdBOUtPENNy
 Py10zFQtvdFQ7ihy/3r8Z8yW92fVrWLb7jutkf7lNbGdLYmhohYuXfP+n
 f+aW06EBc0qFx5UhOKUIFwk3H1pltfClTdqW1EDNwvRvuPR6MYb3N/YCj
 QuPXRPLWe6nKcHqy3TR1gRxUKoj6KM5YXgaVdN9S0RWj6KTx7ec2Qr+ku
 XSEwcW98Q1Xr5G5FEJYt2/a6flWHnnb+mXe8zl3KED0fYbqR3fDvW2Y8h A==;
X-CSE-ConnectionGUID: jOaZYmZ+SmyuZDhGulZ96w==
X-CSE-MsgGUID: O5e35EeJTIOY/1f+cLm3tw==
X-IronPort-AV: E=McAfee;i="6800,10657,11789"; a="67462361"
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; d="scan'208";a="67462361"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2026 00:09:55 -0700
X-CSE-ConnectionGUID: WGMBSQXVQDaI/vj2+b6cVQ==
X-CSE-MsgGUID: fPi187sZTs+h8vWOE6IMeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; d="scan'208";a="277443483"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost)
 ([10.245.244.3])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2026 00:09:51 -0700
Date: Mon, 18 May 2026 10:09:48 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: David Lechner <dlechner@baylibre.com>
Message-ID: <agq7PPw0qupI_8Dh@ashevche-desk.local>
References: <20260517-iio-timestamp-cleanup-v1-0-61fb908c11c7@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260517-iio-timestamp-cleanup-v1-0-61fb908c11c7@baylibre.com>
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
X-Rspamd-Queue-Id: 6A3CC56731A
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,ashevche-desk.local:mid,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Action: no action

On Sun, May 17, 2026 at 01:17:17PM -0500, David Lechner wrote:
> While looking around the code, I noticed that there are a lot of places
> were we are manually filling all of the fields of an IIO timestamp.
> 
> This is error-prone (as seen in the first patch) and more verbose than
> it needs to be.
> 
> I went with the approach of using the existing IIO_CHAN_SOFT_TIMESTAMP()
> macro for doing a struct assignment. This does require a cast, which

No, it's *not* a cast. It's a compound literal. And instead of doing this in
every driver, add it to the macro (in a separate patch). Oh, let me just cook
it for you (I added that to several cases in the past).

> makes it a bit more verbose, but we were already doing that in to
> drivers, so I went with it anyway.

> If we want to consider alternatives, we could make a iio helper function
> or macro like the first and second patches did.

-- 
With Best Regards,
Andy Shevchenko


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
