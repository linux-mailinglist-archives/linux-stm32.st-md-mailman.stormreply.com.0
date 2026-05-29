Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sH6TJOEnHWq6VwkAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 01 Jun 2026 08:34:09 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D1CF61A3A5
	for <lists+linux-stm32@lfdr.de>; Mon, 01 Jun 2026 08:34:08 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 701DFC8F265;
	Mon,  1 Jun 2026 06:34:08 +0000 (UTC)
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 48D8CC8F291
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 29 May 2026 08:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 sang-engineering.com; h=date:from:to:cc:subject:message-id
 :references:mime-version:content-type:in-reply-to; s=k1; bh=tXMJ
 6g32FbF+vmYJskN+9ZRbeRax+mLSw7WMHME551k=; b=VW2F7wM9ULRSeNwaG7U5
 3IAafL5JB8q+DQq/fKmYLtD4thpSmcOoY6t3yiePp4Z8Fa8v2Vx4EYm4T2kCurE0
 QlEWJvg1n852Cf3prQfdgsFqdCcJAKdzBBQReX8UMs5Sipuy6pjTf92OfF8MMons
 +n1frwEAiHL8QXyGPqp1zzt9Nbjp+fFCIPyfdRgtw7B24PqaX5YG3DXb0kMatn+k
 8x1qshYwysFqxRkcRAI/PUwTRKnacK8bTj6YWYnE4Tze92etxh9C2vZ85kF7H8MU
 cod7iGDtshg7AMcTwrVDdOEkN83CBkA4Sad+/O7/Yx0XZ0Z9RZ9VS8ys5Insj8ED
 2g==
Received: (qmail 1342587 invoked from network); 29 May 2026 10:42:30 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted,
 authenticated); 29 May 2026 10:42:30 +0200
X-UD-Smtp-Session: l3s3148p1@yp480/BSmuKSABmE
Date: Fri, 29 May 2026 10:42:29 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Ben Levinsky <ben.levinsky@amd.com>
Message-ID: <ahlRdSX24TsPPxCf@shikoro>
References: <20260529021637.2077602-1-ben.levinsky@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260529021637.2077602-1-ben.levinsky@amd.com>
X-Mailman-Approved-At: Mon, 01 Jun 2026 06:34:07 +0000
Cc: Daniel Baluta <daniel.baluta@nxp.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, imx@lists.linux.dev,
 Tanmay Shah <tanmay.shah@amd.com>, linux-remoteproc@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 linux-renesas-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org
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
X-Spamd-Result: default: False [4.79 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DATE_IN_PAST(1.00)[69];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[sang-engineering.com:s=k1];
	MID_RHS_NOT_FQDN(0.50)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[wsa@sang-engineering.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[renesas];
	RCPT_COUNT_TWELVE(0.00)[18];
	GREYLIST(0.00)[pass,meta];
	ARC_NA(0.00)[];
	DMARC_NA(0.00)[sang-engineering.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:ben.levinsky@amd.com,m:daniel.baluta@nxp.com,m:mcoquelin.stm32@gmail.com,m:magnus.damm@gmail.com,m:linux-kernel@vger.kernel.org,m:geert+renesas@glider.be,m:mathieu.poirier@linaro.org,m:imx@lists.linux.dev,m:tanmay.shah@amd.com,m:linux-remoteproc@vger.kernel.org,m:andersson@kernel.org,m:Frank.Li@nxp.com,m:linux-renesas-soc@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:kernel@pengutronix.de,m:festevam@gmail.com,m:s.hauer@pengutronix.de,m:linux-arm-kernel@lists.infradead.org,m:mcoquelinstm32@gmail.com,m:magnusdamm@gmail.com,m:geert@glider.be,s:lists@lfdr.de];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[nxp.com,gmail.com,vger.kernel.org,glider.be,linaro.org,lists.linux.dev,amd.com,kernel.org,st-md-mailman.stormreply.com,pengutronix.de,lists.infradead.org];
	TAGGED_RCPT(0.00)[linux-stm32,renesas];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DKIM_TRACE(0.00)[sang-engineering.com:-];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_SPAM(0.00)[0.907];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: 1D1CF61A3A5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Ben,

> For the carveout map/unmap cleanup, this series covers the exact-match
> users called out in review: xlnx_r5_remoteproc, rcar_rproc,
> st_remoteproc, stm32_rproc, imx_rproc, and imx_dsp_rproc. The zynqmp R5
> TCM mapping path is left alone because it also clears the mapped memory
> and is not an exact match.
> 
> For the optional resource-table handling, this series converts
> xlnx_r5_remoteproc, rcar_rproc, stm32_rproc, imx_rproc, and
> imx_dsp_rproc. st_remoteproc is intentionally left unchanged because its
> parse_fw() callback also builds carveouts and is therefore not a direct
> match for the helper introduced here.

Thank you for this work, much appreciated! I want to test the changes to
the Renesas R-Car driver but can only do so early next week due to
travels. I hope I have time for review comments earlier, though.

Thanks and happy hacking,

   Wolfram

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
