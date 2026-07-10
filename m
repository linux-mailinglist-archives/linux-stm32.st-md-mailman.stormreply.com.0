Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id B2fJM9g0UWoTAwMAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 10 Jul 2026 20:07:20 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 61AAE73D349
	for <lists+linux-stm32@lfdr.de>; Fri, 10 Jul 2026 20:07:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=BPxLrC+I;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=kernel.org (policy=quarantine);
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1A236C8F273;
	Fri, 10 Jul 2026 18:07:20 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 123C8C7A836
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Jul 2026 18:07:18 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 00F2060052;
 Fri, 10 Jul 2026 18:07:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47CE61F00ACA;
 Fri, 10 Jul 2026 18:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1783706837;
 bh=UkFaimIiDuvVg5QqfDDDVkiPIUpMQHaNcCeDNhAHTm4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=BPxLrC+Ime/SQVaGgKwtVeyAQnVQQde2kS0zyMdfagX+iFjuIjde7h2LRYP16o543
 3M0Pyor2/8g2+9T/hAv0D0VmKQoYkuGi+sj8e8RJ14HP6hVqAnNKQYDsFh5CsnysUg
 6OgJmpZwC64XhBX+apwHhxJaRYXOJQBXF+FNHx3B7q83RvVsoy1xTvf+l6aWd3Ikli
 Lf9CWPdDsVjNwQa37+I0KOYIXdJd20ZGLh4ivWzF2LyCyacSjHxUMaCzTdT0hL6s8i
 fzAvap2otMnxNrly848WUmJH3le3sMtk442MSnIntaB+uRZMtu7afTZAiWIlgCUdT3
 nG8eL5QDQq/3Q==
From: Bjorn Andersson <andersson@kernel.org>
To: Baolin Wang <baolin.wang@linux.alibaba.com>, linux-kernel@vger.kernel.org,
 Antonio Borneo <antonio.borneo@foss.st.com>
Date: Fri, 10 Jul 2026 13:07:01 -0500
Message-ID: <178370682983.2572738.3929834953378902501.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260314170151.18319-1-antonio.borneo@foss.st.com>
References: <20260314170151.18319-1-antonio.borneo@foss.st.com>
MIME-Version: 1.0
Cc: linux-remoteproc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] MAINTAINERS: Update remoteproc repo url
	for hwspinlock
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
X-Spamd-Result: default: False [3.29 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20260515];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:baolin.wang@linux.alibaba.com,m:linux-kernel@vger.kernel.org,m:antonio.borneo@foss.st.com,m:linux-remoteproc@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[andersson@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:-];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:from_smtp,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 61AAE73D349


On Sat, 14 Mar 2026 18:01:51 +0100, Antonio Borneo wrote:
> Since 2021, the remoteproc repo is not hosted anymore in Bjorn's
> personal namespace, but commit cc73f503f7ec ("MAINTAINERS: Update
> remoteproc repo url") only updated the url for remoteproc and
> rpmsg in MAINTAINERS file.
> The old repository is still accessible, but it's not updated since
> 2021 and is not anymore listed in https://git.kernel.org/ .
> 
> [...]

Applied, thanks!

[1/1] MAINTAINERS: Update remoteproc repo url for hwspinlock
      commit: 014be5698ed0645f1d5263b354c27fc3ba77b281

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
