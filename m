Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GHquHpkZlmkSaAIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 18 Feb 2026 20:57:13 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F2640159431
	for <lists+linux-stm32@lfdr.de>; Wed, 18 Feb 2026 20:57:12 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 89057C87EC6;
	Wed, 18 Feb 2026 19:57:12 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 84F53C555BE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Feb 2026 19:57:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 643F76132F;
 Wed, 18 Feb 2026 19:57:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBA95C19422;
 Wed, 18 Feb 2026 19:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1771444630;
 bh=gat+rnnrUbK/Y6WytC8CslzBWIw44IxAUqnSKe3YTrY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=aU14TGs1bcBdcieOvY4AjyQhrda6+MkmVlhMOuzrvau4aRL1lBtCrYeKF/2apBpWE
 mtVLTp11y3++lF+DvWTLWjTb3rlyub4/6jOkIIVa5jeoZLNmR0DC96Ra7y7J1/lxuZ
 2GVQh9+zp74dG9vcowhY3oIVqAYtnMacHVkIUgmCIYAltAz/P72ZBvohIaHePwfsqv
 Yu/fx6ueqX3LNWeImBl2d5Z60hIyYgqacrdddRFOO+r45TjKGzXtYHZ9QeMOub1KOH
 iDZxYI8pQ4LyAQeZ1R2jHqYJit4AjCi3njx2mjkvP8M/su6w101t1y/Y32+YMWQ0rs
 qpK63qWL1ooJg==
Date: Wed, 18 Feb 2026 19:56:51 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Message-ID: <20260218195651.6a3fe5e8@jic23-huawei>
In-Reply-To: <20260215225501.6365-14-wsa+renesas@sang-engineering.com>
References: <20260215225501.6365-1-wsa+renesas@sang-engineering.com>
 <20260215225501.6365-14-wsa+renesas@sang-engineering.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Boqun Feng <boqun@kernel.org>,
 linux-remoteproc@vger.kernel.org, Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>,
 Waiman Long <longman@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 Will Deacon <will@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 driver-core@lists.linux.dev, Andy Shevchenko <andriy.shevchenko@intel.com>,
 Jonathan Corbet <corbet@lwn.net>, Chunyan Zhang <zhang.lyra@gmail.com>,
 Lee Jones <lee@kernel.org>, linux-iio@vger.kernel.org,
 Ingo Molnar <mingo@redhat.com>, Orson Zhai <orsonzhai@gmail.com>,
 David Lechner <dlechner@baylibre.com>, Konrad Dybcio <konradybcio@kernel.org>,
 Srinivas Kandagatla <srini@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 Shuah Khan <skhan@linuxfoundation.org>, linux-arm-kernel@lists.infradead.org,
 Andy Shevchenko <andy@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Bjorn Andersson <andersson@kernel.org>, linux-doc@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Thomas Gleixner <tglx@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Linus Walleij <linusw@kernel.org>
Subject: Re: [Linux-stm32] [RFC PATCH v2 13/13] hwspinlock: refactor
 consumer.h from public header
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
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[jic23@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[37];
	FORGED_RECIPIENTS(0.00)[m:wsa+renesas@sang-engineering.com,m:rafael@kernel.org,m:peterz@infradead.org,m:boqun@kernel.org,m:linux-remoteproc@vger.kernel.org,m:nuno.sa@analog.com,m:longman@redhat.com,m:dakr@kernel.org,m:will@kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:driver-core@lists.linux.dev,m:andriy.shevchenko@intel.com,m:corbet@lwn.net,m:zhang.lyra@gmail.com,m:lee@kernel.org,m:linux-iio@vger.kernel.org,m:mingo@redhat.com,m:orsonzhai@gmail.com,m:dlechner@baylibre.com,m:konradybcio@kernel.org,m:srini@kernel.org,m:arnd@arndb.de,m:linux-arm-msm@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:broonie@kernel.org,m:baolin.wang@linux.alibaba.com,m:skhan@linuxfoundation.org,m:linux-arm-kernel@lists.infradead.org,m:andy@kernel.org,m:gregkh@linuxfoundation.org,m:andersson@kernel.org,m:linux-doc@vger.kernel.org,m:linux-spi@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:tglx@kernel.org,m:mcoquelin.stm32@gmail.com,m:linusw@kernel.org,m:wsa@sang-engineering.com,m:zhanglyra@gm
 ail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
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
	FREEMAIL_CC(0.00)[kernel.org,infradead.org,vger.kernel.org,analog.com,redhat.com,st-md-mailman.stormreply.com,lists.linux.dev,intel.com,lwn.net,gmail.com,baylibre.com,arndb.de,linux.alibaba.com,linuxfoundation.org,lists.infradead.org];
	NEURAL_HAM(-0.00)[-0.976];
	TAGGED_RCPT(0.00)[linux-stm32,renesas];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[huawei.com:email,sang-engineering.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: F2640159431
X-Rspamd-Action: no action

On Sun, 15 Feb 2026 23:54:53 +0100
Wolfram Sang <wsa+renesas@sang-engineering.com> wrote:

> Factor out the entries only needed for consumers from the generic public
> header. This allows for a clean separation between providers and
> consumers.
> 
> FIXME: separate driver changes?
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Acked-by: Jonathan Cameron <jonathan.cameron@huawei.com>

for the IIO one.

Thanks,

Jonathan

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
