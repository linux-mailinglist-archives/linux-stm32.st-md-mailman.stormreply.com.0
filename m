Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sN3ZLvtX+GnTtAIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 04 May 2026 10:25:31 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D3FB4BA22F
	for <lists+linux-stm32@lfdr.de>; Mon, 04 May 2026 10:25:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 68D65C055F4;
	Mon,  4 May 2026 08:25:30 +0000 (UTC)
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 35C8EC2909A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  4 May 2026 08:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 sang-engineering.com; h=date:from:to:cc:subject:message-id
 :references:mime-version:content-type:in-reply-to; s=k1; bh=69yL
 hlBI16XoVN9bn+X224Mok/47DWhaQAjx6HzSTTc=; b=mD/zbGAP2702YJM1OPmA
 ub40M6Ut4DpN0w3RYqDDcsh29QDSXY0wM/vRVTbX0NA54uOKr4Jmry/szvORS14o
 FFBX/ozRpyki7PoKTe7eLJcKX76Y558PbSZKvcGRVuugNtLQZSvCz8eK7CkVCFGW
 43l8hbVWYFEwby8OeP8ETvg6pWyd/5ij4neBkuEu+YV5ZwfXIAdjQcieN4Cafpfy
 e2Ue3Ndw2B84JuiaKEGxUkDvY5NHyqaR1t4nt9Zcs9Zhyq/yIXq0SRhOKOQ8Xlv8
 EoMHbpxFYI++ZYwWfA7ozfIVSfLir6TYYUA9dfQdwceeuVzEyv8Xmij7TJ58tBF5
 nQ==
Received: (qmail 2102619 invoked from network); 4 May 2026 10:25:28 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted,
 authenticated); 4 May 2026 10:25:28 +0200
X-UD-Smtp-Session: l3s3148p1@hdhNrPlQZrcujnvR
Date: Mon, 4 May 2026 10:25:27 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Marek Vasut <marex@nabladev.com>
Message-ID: <afhX9z20oxSZxM6L@ninjato>
References: <20260502153218.56142-1-marex@nabladev.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260502153218.56142-1-marex@nabladev.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] i2c: stm32f7: Move reinit_completion() to
 stm32f7_i2c_xfer_core()
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
X-Rspamd-Queue-Id: 4D3FB4BA22F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.79 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[sang-engineering.com:s=k1];
	MID_RHS_NOT_FQDN(0.50)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[sang-engineering.com];
	TAGGED_FROM(0.00)[renesas];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:marex@nabladev.com,m:andi.shyti@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-i2c@vger.kernel.org,m:mcoquelin.stm32@gmail.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[wsa@sang-engineering.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[sang-engineering.com:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-0.785];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com,st-md-mailman.stormreply.com,lists.infradead.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo]

On Sat, May 02, 2026 at 05:31:54PM +0200, Marek Vasut wrote:
> Currently, the driver may repeatedly call reinit_completion() during
> transfer which contains multiple messages, while another thread is
> waiting for the completion.
> 
> This happens during transfer with more than 1 message, invoked via
> stm32f7_i2c_xfer_core() -> stm32f7_i2c_xfer_msg(). After invoking the
> stm32f7_i2c_xfer_msg() to start transfer, stm32f7_i2c_xfer_core()
> calls wait_for_completion_timeout() to wait for completion of the
> transfer of all messages. When the first message transfer completes,
> the hard IRQ handler triggers, and detects transfer completion, which
> leads to stm32f7_i2c_isr_event_thread() IRQ thread being started. The
> stm32f7_i2c_isr_event_thread() calls stm32f7_i2c_xfer_msg() in case
> there are more messages.
> 
> Without this change, the second and later stm32f7_i2c_xfer_msg() would
> call reinit_completion() on the completion which is still being waited
> for in stm32f7_i2c_xfer_core(). Fix this by moving the reinit_completion()
> into stm32f7_i2c_xfer_core(), together with wait_for_completion_timeout().
> 
> Since stm32f7_i2c_xfer_core() now waits for completion of the entire
> transfer, increase the default timeout. This fixes sporadic transfer
> timeouts on STM32MP25xx during kernel boot.
> 
> Fixes: aeb068c57214 ("i2c: i2c-stm32f7: add driver")
> Signed-off-by: Marek Vasut <marex@nabladev.com>

Reworded $subject a little and applied to for-current, thanks!

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
