Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sDrhC/p+ummTWwIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 18 Mar 2026 11:31:22 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C05F02B9E47
	for <lists+linux-stm32@lfdr.de>; Wed, 18 Mar 2026 11:31:21 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 53856C87ECC;
	Wed, 18 Mar 2026 10:31:21 +0000 (UTC)
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 75D09C5A4C5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Mar 2026 10:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 sang-engineering.com; h=date:from:to:cc:subject:message-id
 :references:mime-version:content-type:in-reply-to; s=k1; bh=rnzd
 zNBShor5SsCSqm500KkuoYe6Fk+7EQmEipEUtYE=; b=j0+If8cXjhMytAuuv3jW
 symnEI673OxAipEnveU+8nsBw/z6ifDnQoZG1Tyr6Uju1kwDt8iDohWo/idrsNEA
 3ko5H9oRd3IAsn2ZU3XurgHC4R1rm3Il4M2A42M0JDsiwDeqDNNmpYiqZGJ6PR/U
 Lv2aQXzwdztSFpRROlkIRhb9S+J40Tn52TAu0AhTU22xbdbwxBWlKHyoAE33UqaJ
 SX8eTW9uDSpvGYcVOF4IE5699O/OX9ZNUSbJytWt9FuICEIFFgosMADLiu+zF+UR
 TLC3I3GNnrmpjH70/bQBdszMDNS6E49Dk20ySM0X2RfzvYtZOxC2GFahdHfgcIGN
 6g==
Received: (qmail 652465 invoked from network); 18 Mar 2026 11:31:19 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted,
 authenticated); 18 Mar 2026 11:31:19 +0100
X-UD-Smtp-Session: l3s3148p1@d+DX80lNYtsujnvy
Date: Wed, 18 Mar 2026 11:31:12 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Antonio Borneo <antonio.borneo@foss.st.com>
Message-ID: <abp-8GlLkoBAUJj8@ninjato>
References: <20260310075539.11701-1-wsa+renesas@sang-engineering.com>
 <20260310075539.11701-5-wsa+renesas@sang-engineering.com>
 <dd21653b7343e261ec9c88c622c5facbba69df95.camel@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <dd21653b7343e261ec9c88c622c5facbba69df95.camel@foss.st.com>
Cc: linux-omap@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Chunyan Zhang <zhang.lyra@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 linux-renesas-soc@vger.kernel.org,
 Wilken Gottwalt <wilken.gottwalt@posteo.net>,
 Baolin Wang <baolin.wang@linux.alibaba.com>, linux-arm-msm@vger.kernel.org,
 Orson Zhai <orsonzhai@gmail.com>, Chen-Yu Tsai <wens@kernel.org>,
 linux-sunxi@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v4 04/15] hwspinlock: add callback to fill
 private data of a hwspinlock
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
	TAGGED_FROM(0.00)[renesas];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[sang-engineering.com];
	FORGED_RECIPIENTS(0.00)[m:antonio.borneo@foss.st.com,m:linux-omap@vger.kernel.org,m:mcoquelin.stm32@gmail.com,m:samuel@sholland.org,m:zhang.lyra@gmail.com,m:andersson@kernel.org,m:linux-remoteproc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jernej.skrabec@gmail.com,m:linux-renesas-soc@vger.kernel.org,m:wilken.gottwalt@posteo.net,m:baolin.wang@linux.alibaba.com,m:linux-arm-msm@vger.kernel.org,m:orsonzhai@gmail.com,m:wens@kernel.org,m:linux-sunxi@lists.linux.dev,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:mcoquelinstm32@gmail.com,m:zhanglyra@gmail.com,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[wsa@sang-engineering.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[18];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[sang-engineering.com:-];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,sholland.org,kernel.org,posteo.net,linux.alibaba.com,lists.linux.dev,st-md-mailman.stormreply.com,lists.infradead.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	NEURAL_SPAM(0.00)[0.841];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:email,stormreply.com:url,st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: C05F02B9E47
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Antonio,

> this API is described in Documentation/locking/hwspinlock.rst
> in chapter 'API for implementors'.
> 
> Changing the API parameters should require updating the documentation too.

I totally agree. I missed that.

> Since this API is changed again in 10/15, it's probably fine to update the
> documentation only once in the last 15/15.

Well, the changes are little, so I will change the documentation
whenever the API itself gets modified.

Thanks for the heads up!

   Wolfram

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
