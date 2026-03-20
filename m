Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2G52CzyRvWnY+wIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 20 Mar 2026 19:26:04 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B96642DF5C5
	for <lists+linux-stm32@lfdr.de>; Fri, 20 Mar 2026 19:26:03 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 38A79C35E2B;
	Fri, 20 Mar 2026 18:26:03 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 43F91C36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 20 Mar 2026 18:26:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id F0CBB43BE9;
 Fri, 20 Mar 2026 18:26:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF8CEC4AF65;
 Fri, 20 Mar 2026 18:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1774031160;
 bh=jlrQP6CtospijAjR1wos41IMDs4DAGnm2KjWl19/ukk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=c7m/Av3S1jBwh4aIpwIEm9YlGIP56CKhDCFlVKaRpszyu5bhjBVFk1nMZYJwhzJez
 WYIoQT23O5DoFyFbY0THi/N9uUJoG3bs2m2Pw/jJDp4iH1FwGneZV9KKsrnJIasPAA
 WYTJYbR/iiXAq/bDhKGeNjNg4l3ZFf3eHRU7pCk7Dmq2tcMJ4V3YBW1Ey+qmkdexAf
 YojwZsvqmQ8jtZOmDZ4vBtUdHpmZjxdWnp375kNIbVjbEeBB/O6rrY8W32M0/keBxL
 eCayRRMpxenf78oyEXEwT+HxMKDj+q7xHEiBXDbjBjpbMVrQhG92Q9tXyJKutnlMSc
 YpylKX0mgne4g==
Date: Fri, 20 Mar 2026 11:26:00 -0700
From: Kees Cook <kees@kernel.org>
To: Thorsten Blum <thorsten.blum@linux.dev>
Message-ID: <202603201125.964AD89B@keescook>
References: <20260320084914.7180-3-thorsten.blum@linux.dev>
 <20260320084914.7180-4-thorsten.blum@linux.dev>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260320084914.7180-4-thorsten.blum@linux.dev>
Cc: linux-arm-kernel@lists.infradead.org,
 Herbert Xu <herbert@gondor.apana.org.au>, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-crypto@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Maxime =?iso-8859-1?Q?M=E9r=E9?= <maxime.mere@foss.st.com>,
 "David S. Miller" <davem@davemloft.net>,
 Colin Ian King <colin.i.king@gmail.com>
Subject: Re: [Linux-stm32] [PATCH 2/2] crypto: stm32 - use
 list_first_entry_or_null to simplify cryp_find_dev
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
X-Spamd-Result: default: False [5.29 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	MID_RHS_NOT_FQDN(0.50)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	GREYLIST(0.00)[pass,meta];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:thorsten.blum@linux.dev,m:linux-arm-kernel@lists.infradead.org,m:herbert@gondor.apana.org.au,m:linux-kernel@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:sakari.ailus@linux.intel.com,m:linux-crypto@vger.kernel.org,m:mcoquelin.stm32@gmail.com,m:maxime.mere@foss.st.com,m:davem@davemloft.net,m:colin.i.king@gmail.com,m:mcoquelinstm32@gmail.com,m:coliniking@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[kees@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[kees@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FREEMAIL_CC(0.00)[lists.infradead.org,gondor.apana.org.au,vger.kernel.org,st-md-mailman.stormreply.com,linux.intel.com,gmail.com,foss.st.com,davemloft.net];
	TAGGED_RCPT(0.00)[linux-stm32];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_SPAM(0.00)[0.039];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:email,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: B96642DF5C5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 20, 2026 at 09:49:14AM +0100, Thorsten Blum wrote:
> Use list_first_entry_or_null() to simplify stm32_cryp_find_dev() and
> remove the now-unused local variable 'struct stm32_cryp *tmp'.
> 
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>

Reviewed-by: Kees Cook <kees@kernel.org>

-- 
Kees Cook
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
