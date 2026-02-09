Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ILj6BBT8iWluFQAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 09 Feb 2026 16:24:04 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EDB3111DBD
	for <lists+linux-stm32@lfdr.de>; Mon, 09 Feb 2026 16:24:03 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B74B0C36B3E;
	Mon,  9 Feb 2026 15:24:02 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B250CC36B3D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  9 Feb 2026 15:24:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 60F2D43BEB;
 Mon,  9 Feb 2026 15:24:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A822C116C6;
 Mon,  9 Feb 2026 15:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1770650640;
 bh=CATv9n8/6UVhKAt6xSMvM8ZPSENEtVF49mw0FRzE/8Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IaGQUU6MZiYnBwbZV+WB6yl0LNLcHbFtCwOafK7v3aP9dNH6203w4KEZw+7MfEC4p
 83Wgv8mmFdTftmAFnx8rL/0BstQ/LljdeZcqY9QXbbtbvsZPj5g060jDq/IIb/ECzy
 mEqpXgr55tVRNNvmMytI2u+8Xf8Xnx+nCebj4Xag10AvuvTsukawTkaYHokUzqdE/R
 dYF4izP3eLQp1iKlJ9DC0/fr6nMgpMCWgQS82PyQuVIWIFTmPTk7o/svkZnFSvrx7+
 3nt8NXynVrm8Hc2Kw5RtqdN08lDOGLtlPDDvKBlNu6+F+dz11nnmThloWb5dTA8XHg
 Ef1ciNGC6eavQ==
Date: Mon, 9 Feb 2026 09:23:57 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Message-ID: <a62kzllm4dgqavg47utvhb6m7oswcgenvq5nhw7tutyrs436lr@vtilvllrxkfb>
References: <20260204105216.3929071-1-arnaud.pouliquen@foss.st.com>
 <20260204105216.3929071-2-arnaud.pouliquen@foss.st.com>
 <4a4e50f4-9e02-4ca2-8b3f-b01caa7df35e@ti.com>
 <1a175145-d29f-426a-a163-1d185b8b0348@foss.st.com>
 <b9b478ea-cec7-4b5b-8ae9-d0574c4eb02a@ti.com>
 <25df6720-da97-4f81-9124-bdb7e9542d56@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <25df6720-da97-4f81-9124-bdb7e9542d56@foss.st.com>
Cc: linux-stm32@st-md-mailman.stormreply.com, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Mathieu Poirier <mathieu.poirier@linaro.org>,
 Andrew Davis <afd@ti.com>
Subject: Re: [Linux-stm32] [PATCH v3 1/2] remoteproc: core: support fixed
 device index from DT aliases
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
X-Spamd-Result: default: False [3.79 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	MID_RHS_NOT_FQDN(0.50)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:arnaud.pouliquen@foss.st.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-remoteproc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mathieu.poirier@linaro.org,m:afd@ti.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[andersson@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	URIBL_MULTI_FAIL(0.00)[stormreply.com:server fail,stm-ict-prod-mailman-01.stormreply.prv:server fail,st-md-mailman.stormreply.com:server fail];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[kernel.org:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email]
X-Rspamd-Queue-Id: 2EDB3111DBD
X-Rspamd-Action: no action

On Mon, Feb 09, 2026 at 10:51:07AM +0100, Arnaud POULIQUEN wrote:
> On 2/5/26 21:07, Andrew Davis wrote:
> > On 2/5/26 11:58 AM, Arnaud POULIQUEN wrote:
> > > On 2/4/26 15:57, Andrew Davis wrote:
> > > > On 2/4/26 4:52 AM, Arnaud Pouliquen wrote:
[..]
> > 
> > It becomes immediately obvious this is valid only for a given platform.
> > 
> > The other thing I want to avoid is the ever-growing alias lists in DT.
> 
> For my understanding, is this only your expectation, or is it a general
> direction recommended by the Linux maintainers?
> 

If I remember correctly I did stand by the idea of using aliases to get
stable numbering in /sys/class/remoteproc when we spoke about it several
years ago (6-7?). But remoteprocs are coming and going, and any
information we would have encoded in those numbers would have been
confusing.

A big problem is that your numbering scheme will not be consistent over
time and as such prevent your customers from reusing the same userspace
between different platforms.

Another one is for the developer, who need to remember that on platform
A the R5F is id 2, but on platform B it's id 3 - when they sit and write
their echo commands.

Replying on properly maintained rproc->name handles both of these cases
for you.

> > Could be done without having to add a list of aliases to every DT. Is
> > there no other heuristic that we could use to produce an static ordering?
> 
> Other alternatives I can see are:
> - use of the reg property: whould break legacy.

That obviously wouldn't work if you remoteproc is a mmio device.

> - add a new proc node property: would do the same than the
>   existing alias.

If we decide that a global id-scheme is the right way to go, then alias
is the mechanism to express that. There's no reason to hack around it...

But I don't think it is the right solution. How about providing our
users a reference snippet, licensed as public domain, that just resolves
a remoteproc by the name property?

Regards,
Bjorn
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
