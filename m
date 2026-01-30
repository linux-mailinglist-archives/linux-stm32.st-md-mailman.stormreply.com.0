Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0NXFEWB+fGk8NgIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 30 Jan 2026 10:48:16 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 47884B908B
	for <lists+linux-stm32@lfdr.de>; Fri, 30 Jan 2026 10:48:15 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C5B73C01FBF;
	Fri, 30 Jan 2026 09:48:14 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4E162C36B12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 30 Jan 2026 09:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769766494; x=1801302494;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=9EX3E35P6Hg1Iq7h2iJkGkUFnTJjztYiXmMhmEhbRFM=;
 b=j/xpirWQoft8Xk3CSNnmjK/wAkXOOILtLh8MECcoCnruMKtkz2wPTNQB
 KkbEULJvXMzLEwdQrK2eD9H/XXfYlnNDZUlFWeYZUl/7XrS9dw1v3Pz+B
 AhDrIVXnN6aW9J0aWKug33uwzvcSOBxRsC92NA4grKXuK9YuwlH1DArCf
 1np0f71ylJZmccrISXyNSbnzuEoiND7J7HNXcEbmwqO9LddsCL+5t5sj6
 pntVDeT1Z7JOAn/izhT8CbPb1BB4Wb08E6S2q99e5dXGgbiqmv1dlOlXJ
 VBFR3VyKHpzvnPHuaH0+qJC3Hd/N2p8pJ1DBtrOjlVrXDckECALH+7ijx Q==;
X-CSE-ConnectionGUID: kVzBKVkOTbm7ImKDZ7M2hA==
X-CSE-MsgGUID: AH5c/y7hR4qqHP7dz/Dfxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="74640841"
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; d="scan'208";a="74640841"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 01:48:12 -0800
X-CSE-ConnectionGUID: poeentPyTEmvZx/1oQTsMQ==
X-CSE-MsgGUID: xtlOClocSheYT7NO0kaQ2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; d="scan'208";a="240078451"
Received: from black.igk.intel.com (HELO black) ([10.91.253.5])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 01:48:07 -0800
From: Alexander Shishkin <alexander.shishkin@linux.intel.com>
To: Yingchao Deng <yingchao.deng@oss.qualcomm.com>, Steven Rostedt
 <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, Mathieu
 Desnoyers <mathieu.desnoyers@efficios.com>, Jonathan Corbet
 <corbet@lwn.net>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre
 Torgue <alexandre.torgue@foss.st.com>
In-Reply-To: <20260129-p_ost-v5-1-2b14fff39428@oss.qualcomm.com>
References: <20260129-p_ost-v5-1-2b14fff39428@oss.qualcomm.com>
Date: Fri, 30 Jan 2026 10:48:05 +0100
Message-ID: <83qzr7a0tm.fsf@black.igk.intel.com>
MIME-Version: 1.0
Cc: linux-doc@vger.kernel.org, alexander.shishkin@linux.intel.com,
 quic_yingdeng@quicinc.com, linux-kernel@vger.kernel.org,
 Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
 Jinlong Mao <jinlong.mao@oss.qualcomm.com>,
 Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
 Yingchao Deng <yingchao.deng@oss.qualcomm.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-trace-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v5] stm: class: Add MIPI OST protocol
	support
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
	R_DKIM_REJECT(1.00)[intel.com:s=Intel];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[intel.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,goodmis.org,kernel.org,efficios.com,lwn.net,gmail.com,foss.st.com];
	FORGED_SENDER(0.00)[alexander.shishkin@linux.intel.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_RECIPIENTS(0.00)[m:yingchao.deng@oss.qualcomm.com,m:rostedt@goodmis.org,m:mhiramat@kernel.org,m:mathieu.desnoyers@efficios.com,m:corbet@lwn.net,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:linux-doc@vger.kernel.org,m:alexander.shishkin@linux.intel.com,m:quic_yingdeng@quicinc.com,m:linux-kernel@vger.kernel.org,m:yuanfang.zhang@oss.qualcomm.com,m:jinlong.mao@oss.qualcomm.com,m:tingwei.zhang@oss.qualcomm.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:linux-trace-kernel@vger.kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[alexander.shishkin@linux.intel.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:-];
	NEURAL_HAM(-0.00)[-0.989];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[linux-stm32];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,stormreply.com:url,stormreply.com:email,st-md-mailman.stormreply.com:rdns,black.igk.intel.com:mid]
X-Rspamd-Queue-Id: 47884B908B
X-Rspamd-Action: no action

Yingchao Deng <yingchao.deng@oss.qualcomm.com> writes:

> +	for (i = 1; i < ARRAY_SIZE(str_ost_entity_type); i++) {
> +		if (i == pn->entity_type)
> +			sz += sysfs_emit_at(page, sz, "[%s] ", str_ost_entity_type[i]);
> +		else
> +			sz += sysfs_emit_at(page, sz, "%s ", str_ost_entity_type[i]);
> +	}

Greg hates this. Documentation [0] says "preferably": "Attributes should
be ASCII text files, preferably with only one value per file.", but
somebody will get yelled at if this gets spotted, and since it's
probably going to be me, let's maybe not do this.

Also, the ST Microsystems people don't need to be CC'd on Software Trace
Module patches: it's the same TLA meaning 2 different things. Everybody
does this, so I'm assuming they're cool with it, but FYI.

[0] https://docs.kernel.org/filesystems/sysfs.html#attributes

Thanks,
--
Alex
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
