Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id HEDhHBrUqWmcFwEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 05 Mar 2026 20:06:02 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1580521737F
	for <lists+linux-stm32@lfdr.de>; Thu, 05 Mar 2026 20:06:01 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3F63AC8F26D;
	Thu,  5 Mar 2026 19:06:01 +0000 (UTC)
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 16185C8F26C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  5 Mar 2026 19:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 sang-engineering.com; h=date:from:to:cc:subject:message-id
 :references:mime-version:content-type:in-reply-to; s=k1; bh=PoZh
 jt3uQ53hew80uagXcdFkYbFd19jlnF8DaZB6F8M=; b=EcVy/bhLK2eBwgExPMJ3
 1rbX27cmhWjc3rjGsjxF5dRov7fUUDlpNwgi9pngCGqJG5rKUq+J2C7p8l7IBa1n
 wAix8At/9KEPwT6JYyilYtj2K1NUn9Fe6iLpr+kWvIBDV6i4EuUfuN6Gi8/pycHE
 4vAwn6qRsLPrTXt0uIMwoQrYoe5V27+qZp4xfOoSuWX7fTIVZ0s80690f6qBtlHQ
 aykgx+mmEG8fCS2XDtombi/a32mAZGwytbmjpk8rnYFTpCSaNVHVEBXYPEPH+iwl
 s9fnwEBco4uAbN1zFVh8Nns87WyRd1m0ExV4cifwtmIFoWYBRJWERmLoh5POBXHa
 bA==
Received: (qmail 1304730 invoked from network); 5 Mar 2026 20:05:54 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted,
 authenticated); 5 Mar 2026 20:05:54 +0100
X-UD-Smtp-Session: l3s3148p1@FM0uoEtMkO4ujns5
Date: Thu, 5 Mar 2026 20:05:53 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Message-ID: <aanUEX9jq0Y9iNIe@shikoro>
References: <20260303192600.7224-17-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260303192600.7224-17-wsa+renesas@sang-engineering.com>
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
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 Thomas Gleixner <tglx@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Jonathan Cameron <jic23@kernel.org>
Subject: Re: [Linux-stm32] [PATCH v3 00/15] hwspinlock: move device alloc
 into core and refactor includes
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
X-Rspamd-Queue-Id: 1580521737F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.79 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[sang-engineering.com:s=k1];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	MID_RHS_NOT_FQDN(0.50)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[sang-engineering.com];
	TAGGED_FROM(0.00)[renesas];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-renesas-soc@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-iio@vger.kernel.org,m:boqun@kernel.org,m:linux-remoteproc@vger.kernel.org,m:nuno.sa@analog.com,m:longman@redhat.com,m:dakr@kernel.org,m:will@kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-omap@vger.kernel.org,m:corbet@lwn.net,m:zhang.lyra@gmail.com,m:lee@kernel.org,m:jernej.skrabec@gmail.com,m:peterz@infradead.org,m:mingo@redhat.com,m:orsonzhai@gmail.com,m:wilken.gottwalt@posteo.net,m:dlechner@baylibre.com,m:konradybcio@kernel.org,m:linux-sunxi@lists.linux.dev,m:driver-core@lists.linux.dev,m:arnd@arndb.de,m:linux-arm-msm@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:broonie@kernel.org,m:baolin.wang@linux.alibaba.com,m:skhan@linuxfoundation.org,m:wens@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:andy@kernel.org,m:srini@kernel.org,m:gregkh@linuxfoundation.org,m:andersson@kernel.org,m:samuel@sholland.org,m:linux-kernel@vger.kernel.org,m:linux-spi@vger.kernel.org,m:tglx
 @kernel.org,m:mcoquelin.stm32@gmail.com,m:rafael@kernel.org,m:linusw@kernel.org,m:jic23@kernel.org,m:zhanglyra@gmail.com,m:jernejskrabec@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[wsa@sang-engineering.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[43];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[sang-engineering.com:-];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-0.878];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,analog.com,redhat.com,st-md-mailman.stormreply.com,lwn.net,gmail.com,infradead.org,posteo.net,baylibre.com,lists.linux.dev,arndb.de,linux.alibaba.com,linuxfoundation.org,lists.infradead.org,sholland.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Action: no action


I need to fix __iomem annotations. Sorry, I didn't know I have to update
to top-of-tree sparse which is now required for v7.0-rc1...

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
