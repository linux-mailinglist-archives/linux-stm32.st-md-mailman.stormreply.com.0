Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id LVfgE8W3eWl5ygEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 28 Jan 2026 08:16:21 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F10069DA41
	for <lists+linux-stm32@lfdr.de>; Wed, 28 Jan 2026 08:16:20 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 957ACC57A50;
	Wed, 28 Jan 2026 07:16:20 +0000 (UTC)
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2E98FC030CD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 Jan 2026 10:14:49 +0000 (UTC)
Received: from submission (posteo.de [185.67.36.169]) 
 by mout01.posteo.de (Postfix) with ESMTPS id C898B24002D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 Jan 2026 11:14:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.net; s=2017;
 t=1769422488; bh=E6JNIXiL4/1bW0+UR+jZtVn2Er2iWLO91YkvCOZjL/A=;
 h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
 Content-Transfer-Encoding:From;
 b=hNwJOWGkuy9s5Vl4Ecc7RozjABWGHRW71P7Ia51tTQaflGzXkf7uURBXgHE0i0wax
 s9PxnBQI3TpgkIs2XjIcc2bktcRFiuKpnDcbXYDcx+NYh41JricKsbjNSyko4kMDVj
 TN9vJilx/BfhCbim1axucVJ85xrs4+RF2J6WMHFqHcTtH5x4/7iM3YREeIExSek3U1
 BAVIpzN41R3uH2FBw4wMeU/8T9p9E5AMjH4qMKyhancoL3rKKE9fM7gmyAgiYmIG50
 cLsygKVFVXyDB/5rc2oHuyed8CaIAHip6A/pZO7Dv95D+2Pqftax9e6ReF54jN9jz9
 U6h6k3uvBE5rw==
Received: from customer (localhost [127.0.0.1])
 by submission (posteo.de) with ESMTPSA id 4f04CP3GGZz6tws;
 Mon, 26 Jan 2026 11:14:41 +0100 (CET)
Date: Mon, 26 Jan 2026 10:14:46 +0000
From: Wilken Gottwalt <wilken.gottwalt@posteo.net>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Message-ID: <20260126111440.67394323@posteo.net>
In-Reply-To: <aXc7DxsqiCGdfzxi@smile.fi.intel.com>
References: <20260125184654.17843-6-wsa+renesas@sang-engineering.com>
 <aXc7DxsqiCGdfzxi@smile.fi.intel.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 28 Jan 2026 07:16:18 +0000
Cc: linux-doc@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-remoteproc@vger.kernel.org,
 Nuno =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Waiman Long <longman@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 Will Deacon <will@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-omap@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Lee Jones <lee@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Orson Zhai <orsonzhai@gmail.com>, David Lechner <dlechner@baylibre.com>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-sunxi@lists.linux.dev,
 Srinivas Kandagatla <srini@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 linux-arm-msm@vger.kernel.org, Boqun Feng <boqun.feng@gmail.com>,
 linux-gpio@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Shuah Khan <skhan@linuxfoundation.org>, Chen-Yu Tsai <wens@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Andy Shevchenko <andy@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Bjorn Andersson <andersson@kernel.org>, Samuel Holland <samuel@sholland.org>,
 linux-spi@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Thomas Gleixner <tglx@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Jonathan Cameron <jic23@kernel.org>
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
X-Spamd-Result: default: False [4.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[posteo.net:s=2017];
	DATE_IN_PAST(1.00)[45];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	DMARC_POLICY_SOFTFAIL(0.10)[posteo.net : SPF not aligned (strict),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[wilken.gottwalt@posteo.net,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[42];
	FORGED_RECIPIENTS(0.00)[m:andriy.shevchenko@intel.com,m:linux-doc@vger.kernel.org,m:linux-iio@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:nuno.sa@analog.com,m:wsa+renesas@sang-engineering.com,m:longman@redhat.com,m:dakr@kernel.org,m:will@kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-omap@vger.kernel.org,m:corbet@lwn.net,m:zhang.lyra@gmail.com,m:lee@kernel.org,m:jernej.skrabec@gmail.com,m:peterz@infradead.org,m:mingo@redhat.com,m:orsonzhai@gmail.com,m:dlechner@baylibre.com,m:konradybcio@kernel.org,m:linux-sunxi@lists.linux.dev,m:srini@kernel.org,m:arnd@arndb.de,m:linux-arm-msm@vger.kernel.org,m:boqun.feng@gmail.com,m:linux-gpio@vger.kernel.org,m:broonie@kernel.org,m:baolin.wang@linux.alibaba.com,m:skhan@linuxfoundation.org,m:wens@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:andy@kernel.org,m:gregkh@linuxfoundation.org,m:andersson@kernel.org,m:samuel@sholland.org,m:linux-spi@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:tglx@kernel.org,m:mcoquel
 in.stm32@gmail.com,m:rafael@kernel.org,m:linusw@kernel.org,m:jic23@kernel.org,m:wsa@sang-engineering.com,m:zhanglyra@gmail.com,m:jernejskrabec@gmail.com,m:boqunfeng@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[posteo.net:-];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-0.983];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wilken.gottwalt@posteo.net,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,analog.com,sang-engineering.com,redhat.com,kernel.org,st-md-mailman.stormreply.com,lwn.net,gmail.com,infradead.org,baylibre.com,lists.linux.dev,arndb.de,linux.alibaba.com,linuxfoundation.org,lists.infradead.org,sholland.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,renesas];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo,intel.com:email]
X-Rspamd-Queue-Id: F10069DA41
X-Rspamd-Action: no action

On Mon, 26 Jan 2026 11:59:43 +0200
Andy Shevchenko <andriy.shevchenko@intel.com> wrote:

> On Sun, Jan 25, 2026 at 07:46:51PM +0100, Wolfram Sang wrote:
> > TLDR: I want to create a hwspinlock provider outside of the hwspinlock
> > directory. So, I refactored the headers into a provider/consumer pair.
> > Which seems to me like a reasonable seperation anyhow. No functional
> > changes. My build tests went fine and buildbots are happy, too.
> > 
> > Longer explanation:
> > 
> > There is a device (MFIS) in newer Renesas SoCs which combines various
> > things like hwspinlocks, mailboxes and other stuff. Sadly, these are not
> > strictly separated. Registers are kind of mixed and its register
> > unprotection scheme will need one of its own locks. I tried various
> > paths to handle this device (MFD, auxiliary bus) but I concluded that
> > the sub-device dependencies give enough reasons for a single driver in
> > drivers/soc/. So, this series will allow me to instantiate a hwspinlock
> > provider from the other directory.
> > 
> > Patches 1+2 do the actual refactoring with a fallback being in place. I
> > used '-B' with git-format-patch in this RFC, so the actual changes are
> > more visible when the headers are moved.
> > 
> > Patch 3 converts all the users. There are not many. We could try to get
> > all the acks for this single patch. Or I can break it into single
> > patches and send them to subsystems. I don't mind.
> > 
> > Patch 4 simply removes the fallback.
> > 
> > Looking forward to comments on this approach. If the hwspinlock
> > maintainers like it as is, I would kindly propose to apply patches 1+2
> > after 7.0-rc1 comes out. This might sound a bit hasty, but a) I want to
> > avoid chasing a moving target and b) this would remove one dependency of
> > the hwspinlock driver I originally intend to upstream, of course.
> > 
> > I would take care of patches 3+4 as needed.
> > 
> > A branch can be found here:
> > 
> > git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/hwspinlock/refactor-includes
> > 
> > Patches are based on linux-next as of 2026-01-21.
> > 
> > Opinions?
> 
> I don't like the idea of sharing internal stuff. Why would we need to have
> a struct hwspinlock to be visible?
> 

I see what Wolfram wants to achieve. It is the same issue I encounterd while I
wrote the sun6i hwspinlock driver. Currently it is impossible to write external
(out-of-kernel-tree) drivers because of internal structures. And it was a pain
in the ass for testing purposes. I prefer to be able to write external hwspinlock
drivers.

greetings
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
