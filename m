Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xTMZNLP+J2qT6wIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 09 Jun 2026 13:53:23 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 728F565FB34
	for <lists+linux-stm32@lfdr.de>; Tue, 09 Jun 2026 13:53:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=sang-engineering.com header.s=k1 header.b=e0StwP3U;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=none
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3BF4EC90081;
	Tue,  9 Jun 2026 11:53:23 +0000 (UTC)
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 97B24C87ECE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  7 Jun 2026 14:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 sang-engineering.com; h=date:from:to:cc:subject:message-id
 :references:mime-version:content-type:in-reply-to; s=k1; bh=ZtqC
 +qnofvrCmCjX+K7HBaQPUaVjjEi2PlLXZ9QOs3U=; b=e0StwP3USm72zyvo2mQU
 YcHKr5/+CFQI2aKUNnf7qjdFK1HwL4d6INirsC0FkSENYKu8NxGVPaEu5tHsbfGA
 OCUcK25hBpWATPhRO7dix+lZ1Hge2swcF5GdaERhcwfGq71RoURu6tKz7cGzgczv
 E4Aq9NooUaf/ZgZHBDJqrEBfCzOA7zUbzazjxd+Ahi/sL4L+k53/J/88uCn//EfQ
 soOWQdw9cRVk1vNLPCsY7lVuqF7vdnbJFx3Rh9LX6/NxhE9zF309f5TgnRiQJHRk
 9u/4EIFtbBDZYcPauHG3gf9XE6UBznzg0DvF4d8suH+14Dre2sI0E1NGZiK/Rw6p
 Dw==
Received: (qmail 505574 invoked from network); 7 Jun 2026 16:57:15 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted,
 authenticated); 7 Jun 2026 16:57:15 +0200
X-UD-Smtp-Session: l3s3148p1@Eq0JHKtTCyRtKXG8
Date: Sun, 7 Jun 2026 16:57:14 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Message-ID: <aiWGyj0KJ5I3qB2U@shikoro>
References: <20260529021637.2077602-1-ben.levinsky@amd.com>
 <ah2aVdlsLqy9aeHP@p14s>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ah2aVdlsLqy9aeHP@p14s>
X-Mailman-Approved-At: Tue, 09 Jun 2026 11:53:22 +0000
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Magnus Damm <magnus.damm@gmail.com>,
 peng.fan@oss.nxp.com, Geert Uytterhoeven <geert+renesas@glider.be>,
 imx@lists.linux.dev, Tanmay Shah <tanmay.shah@amd.com>,
 Frank Li <Frank.Li@nxp.com>, Bjorn Andersson <andersson@kernel.org>,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Ben Levinsky <ben.levinsky@amd.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-renesas-soc@vger.kernel.org, daniel.baluta@nxp.com,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 0/5] remoteproc: cleanup shared
 carveout and resource-table helpers
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [4.79 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DATE_IN_PAST(1.00)[44];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[sang-engineering.com:s=k1];
	MID_RHS_NOT_FQDN(0.50)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[renesas];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[wsa@sang-engineering.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	DMARC_NA(0.00)[sang-engineering.com];
	ARC_NA(0.00)[];
	GREYLIST(0.00)[pass,meta];
	FORGED_RECIPIENTS(0.00)[m:mathieu.poirier@linaro.org,m:mcoquelin.stm32@gmail.com,m:festevam@gmail.com,m:magnus.damm@gmail.com,m:peng.fan@oss.nxp.com,m:geert+renesas@glider.be,m:imx@lists.linux.dev,m:tanmay.shah@amd.com,m:Frank.Li@nxp.com,m:andersson@kernel.org,m:linux-remoteproc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:ben.levinsky@amd.com,m:kernel@pengutronix.de,m:linux-renesas-soc@vger.kernel.org,m:daniel.baluta@nxp.com,m:s.hauer@pengutronix.de,m:linux-arm-kernel@lists.infradead.org,m:mcoquelinstm32@gmail.com,m:magnusdamm@gmail.com,m:geert@glider.be,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[gmail.com,oss.nxp.com,glider.be,lists.linux.dev,amd.com,nxp.com,kernel.org,vger.kernel.org,st-md-mailman.stormreply.com,pengutronix.de,lists.infradead.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[sang-engineering.com:-];
	TAGGED_RCPT(0.00)[linux-stm32,renesas];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,stormreply.com:url,stormreply.com:email,st-md-mailman.stormreply.com:rdns,st-md-mailman.stormreply.com:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 728F565FB34


> Wolfram has already indicated he wanted to test these changes - Arnaud, Daniel
> and Peng, please do the same for your platforms.

Testing is more involved than I expected. Didn't work out this week.
I'll keep trying for next week. But it may end up the week after that.

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
