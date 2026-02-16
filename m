Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yK2bAqzWkmnKywEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 16 Feb 2026 09:34:52 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A3590141976
	for <lists+linux-stm32@lfdr.de>; Mon, 16 Feb 2026 09:34:51 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2E61DC36B3C;
	Mon, 16 Feb 2026 08:34:51 +0000 (UTC)
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 87F91C36B30
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Feb 2026 08:34:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 sang-engineering.com; h=date:from:to:cc:subject:message-id
 :references:mime-version:content-type:in-reply-to; s=k1; bh=udWn
 s0/tE9VKlKkv9PZVrjAGz6UPCuc03cHhjm82iJE=; b=JiawxJRNnzOnh5J1hVMh
 E5duxMm3nyH2uDC+IPLFgg3q1xpmC7YqD9esUnX1lU/oL7BU9hRdwHsHasD69/fa
 gfyDd7xv69iBMmdpaeoSlfesWXrKB35LRWiALI/TJIhAAteXx697Uw6Z2QsWpNxZ
 JYobhZkrtlvxpVbjZ9nsh3dB+cpmAtgEt0WmB0vSJXkVOGRhxu93MVFPt7papNLM
 ZSfv0rFQ4rku+pla5XnOn7G+ab5NbnREMvkE/EBWTAGSP/AkabrJ6weMmqYFysIJ
 orrqckAcPD/DdHyruK3K0KYRCMwldOcIUxYCus5bHrfo8yM1kzBAT+jvmKSAcDiE
 vg==
Received: (qmail 3164830 invoked from network); 16 Feb 2026 09:34:44 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted,
 authenticated); 16 Feb 2026 09:34:44 +0100
X-UD-Smtp-Session: l3s3148p1@2umq0+xKxoEujnu0
Date: Mon, 16 Feb 2026 09:34:44 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Message-ID: <aZLWpM8XOvidXJl7@ninjato>
References: <20260215225501.6365-1-wsa+renesas@sang-engineering.com>
 <aZLJ8Z4XOTEUJfmh@smile.fi.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aZLJ8Z4XOTEUJfmh@smile.fi.intel.com>
Cc: linux-doc@vger.kernel.org, linux-iio@vger.kernel.org,
 Boqun Feng <boqun@kernel.org>, linux-remoteproc@vger.kernel.org,
 Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, Waiman Long <longman@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>, Will Deacon <will@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-omap@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>, Chunyan Zhang <zhang.lyra@gmail.com>,
 Lee Jones <lee@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Orson Zhai <orsonzhai@gmail.com>, Wilken Gottwalt <wilken.gottwalt@posteo.net>,
 David Lechner <dlechner@baylibre.com>, Konrad Dybcio <konradybcio@kernel.org>,
 linux-sunxi@lists.linux.dev, driver-core@lists.linux.dev,
 Arnd Bergmann <arnd@arndb.de>, linux-arm-msm@vger.kernel.org,
 linux-gpio@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Shuah Khan <skhan@linuxfoundation.org>, Chen-Yu Tsai <wens@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Andy Shevchenko <andy@kernel.org>,
 Srinivas Kandagatla <srini@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Bjorn Andersson <andersson@kernel.org>, Samuel Holland <samuel@sholland.org>,
 linux-spi@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Thomas Gleixner <tglx@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Jonathan Cameron <jic23@kernel.org>
Subject: Re: [Linux-stm32] [RFC v2 PATCH 00/13] hwspinlock: move device
 alloc into core and refactor includes
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
X-Spamd-Result: default: False [3.79 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[sang-engineering.com:s=k1];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	MID_RHS_NOT_FQDN(0.50)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[renesas];
	DMARC_NA(0.00)[sang-engineering.com];
	FORGED_RECIPIENTS(0.00)[m:andriy.shevchenko@intel.com,m:linux-doc@vger.kernel.org,m:linux-iio@vger.kernel.org,m:boqun@kernel.org,m:linux-remoteproc@vger.kernel.org,m:nuno.sa@analog.com,m:longman@redhat.com,m:dakr@kernel.org,m:will@kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-omap@vger.kernel.org,m:corbet@lwn.net,m:zhang.lyra@gmail.com,m:lee@kernel.org,m:jernej.skrabec@gmail.com,m:peterz@infradead.org,m:mingo@redhat.com,m:orsonzhai@gmail.com,m:wilken.gottwalt@posteo.net,m:dlechner@baylibre.com,m:konradybcio@kernel.org,m:linux-sunxi@lists.linux.dev,m:driver-core@lists.linux.dev,m:arnd@arndb.de,m:linux-arm-msm@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:broonie@kernel.org,m:baolin.wang@linux.alibaba.com,m:skhan@linuxfoundation.org,m:wens@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:andy@kernel.org,m:srini@kernel.org,m:gregkh@linuxfoundation.org,m:andersson@kernel.org,m:samuel@sholland.org,m:linux-spi@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:tglx@
 kernel.org,m:mcoquelin.stm32@gmail.com,m:rafael@kernel.org,m:linusw@kernel.org,m:jic23@kernel.org,m:zhanglyra@gmail.com,m:jernejskrabec@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[wsa@sang-engineering.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[43];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,analog.com,redhat.com,st-md-mailman.stormreply.com,lwn.net,gmail.com,infradead.org,posteo.net,baylibre.com,lists.linux.dev,arndb.de,linux.alibaba.com,linuxfoundation.org,lists.infradead.org,sholland.org];
	DKIM_TRACE(0.00)[sang-engineering.com:-];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[linux-stm32];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: A3590141976
X-Rspamd-Action: no action


> > Looking forward to comments. I especially wonder if the last patch
> > should stay as-is or if it should be broken out, so individual
> > subsystems can pick up their part (with a fallback in place, of course,
> > until the last user is converted).
> 
> Coincidentally I have briefly reviewed it in the Git tree before you have sent
> this to ML. I like the whole series, but what I have missed is the explanation
> of the removal of Contact: comment in some of the files.

Ah, thanks! True, documenting it slipped through the cracks. Sorry about
that. The reason is, of course, we have MAINTAINERS for this kind of
information. Plus, Ohad Ben-Cohen hasn't been commiting upstream to 10+
years according to git history.

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
