Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OBHgOrYKd2lebAEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 26 Jan 2026 07:33:26 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C38C84906
	for <lists+linux-stm32@lfdr.de>; Mon, 26 Jan 2026 07:33:26 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0E4E8C87EDB;
	Mon, 26 Jan 2026 06:33:26 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1662BC87ED5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 Jan 2026 06:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769409205; x=1800945205;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=EC8BKAcsOpPPEJnArc9xnjKjZWetOeHuGnnD7Ed12Mw=;
 b=ab8ow8d/CfgcyLckxHgLBGUYKIXH4faNsLI+h55sm6bprEyC8Xcwp+rZ
 I9FtmCu7F1QLv3uLHmW8griWFfhh0SRp8jhOFbxs3AENYLhT8dgcYk1/F
 yhK7ihxue0nzaxZF/63DhHvmBf9HkKpu8qahYC/p64vveifqv5lZ1BF40
 pUUMs8CnkGV/lfOwD27fOWd2NxLGu32Mv4VpYimJBitVqxsw+LzsVfWj+
 EK6d4mdHHIItEsoram3sLoZmjUV39Blbj4hQJxdb6eO3/+q4cGhaDRWlE
 Dqx3qPQ1NPOsUZBrAP1nXCdj4kINwwO9KUBzG27CP7BnwxRzGuizTueAn g==;
X-CSE-ConnectionGUID: ET4WhR9uS1mU9oMndRIX6A==
X-CSE-MsgGUID: PEkEWH+AR8emdsx/HjsUGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11682"; a="69781392"
X-IronPort-AV: E=Sophos;i="6.21,254,1763452800"; d="scan'208";a="69781392"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2026 22:33:22 -0800
X-CSE-ConnectionGUID: n0sG5d3HRQyuwMJyVlKMkw==
X-CSE-MsgGUID: 9Wdpytf0Qe+sxOQbP03XpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,254,1763452800"; d="scan'208";a="212465698"
Received: from black.igk.intel.com (HELO black) ([10.91.253.5])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2026 22:33:20 -0800
From: Alexander Shishkin <alexander.shishkin@linux.intel.com>
To: Thorsten Blum <thorsten.blum@linux.dev>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>
In-Reply-To: <20260126004312.210402-2-thorsten.blum@linux.dev>
References: <20260126004312.210402-2-thorsten.blum@linux.dev>
Date: Mon, 26 Jan 2026 07:33:18 +0100
Message-ID: <83v7goano1.fsf@black.igk.intel.com>
MIME-Version: 1.0
Cc: alexander.shishkin@linux.intel.com, linux-kernel@vger.kernel.org,
 Thorsten Blum <thorsten.blum@linux.dev>, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH RESEND] stm class: Remove unnecessary
 local variable in stm_write
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
X-Spamd-Result: default: False [3.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[intel.com:s=Intel];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	DMARC_POLICY_SOFTFAIL(0.10)[intel.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[linux.dev,gmail.com,foss.st.com];
	FORGED_SENDER(0.00)[alexander.shishkin@linux.intel.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:thorsten.blum@linux.dev,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:alexander.shishkin@linux.intel.com,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-stm32@st-md-mailman.stormreply.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexander.shishkin@linux.intel.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[intel.com:-];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	MISSING_XM_UA(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:email,black.igk.intel.com:mid,stormreply.com:url,stormreply.com:email]
X-Rspamd-Queue-Id: 6C38C84906
X-Rspamd-Action: no action

Thorsten Blum <thorsten.blum@linux.dev> writes:

> The local variable 'err' and the corresponding if check in stm_write()
> are unnecessary. Remove them.

Nice catch! Is this a result of manual code inspection or were any tools
used, an AI agent or a coccinelle script or whatnot?

Thanks,
--
Alex
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
