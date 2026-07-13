Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id g+21FPOYVGpLoAMAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Jul 2026 09:51:15 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D127E7485FB
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Jul 2026 09:51:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=Yyjr5rgx;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=kernel.org (policy=quarantine);
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 99F4CC5A4C4;
	Mon, 13 Jul 2026 07:51:14 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AAC7BC57B68
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Jul 2026 07:51:13 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 69A2941804;
 Mon, 13 Jul 2026 07:51:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6BEC1F000E9;
 Mon, 13 Jul 2026 07:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1783929072;
 bh=8FIFnPA4i8Uh9sav+OYDKSxMFjPguw66anaA/6adj9k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=Yyjr5rgxqGJLd4ab7WgiQ5BvmtH2qbg3TVLqR69cerg2tskgRThP731oNyfPPMcDd
 kE7/22nb1dwDakw5xZPhIP25qwp1tAPiYh0XlqLdb3PKU+xKVFUenWnD5Ma2BwaEMr
 aNzISpYVj+OP1cmTxrrSHN4U4jwseMxsH8ntgg0PPoyR/9jbeLKM8+ux4sb0G1GUGs
 WR2tgF7+0nyFlN661jajZULEn8S6TNcXMF+PtLv2f36Up5Leh2255oXMxGr8UAkMH9
 PmCv+3X8EGck8a0niArjVXBw7tt3sT1VH0eWIPEybI4XRIfC3xd11FouBAnmEraFv4
 mus9RceepRfPg==
Date: Mon, 13 Jul 2026 09:51:08 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Marek Vasut <marex@nabladev.com>
Message-ID: <20260713-rousing-transparent-mongrel-ee18c3@quoll>
References: <20260711210131.236025-1-marex@nabladev.com>
 <20260711210131.236025-11-marex@nabladev.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260711210131.236025-11-marex@nabladev.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>, Linus Walleij <linusw@kernel.org>,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, kernel@dh-electronics.com,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 10/10] MAINTAINERS: Add DH electronics
 DHCOS SoM entry and fix email address
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
X-Spamd-Result: default: False [5.29 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20260515];
	MID_RHS_NOT_FQDN(0.50)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:marex@nabladev.com,m:robh@kernel.org,m:conor+dt@kernel.org,m:brgl@kernel.org,m:linusw@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:kernel@dh-electronics.com,m:krzk+dt@kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:conor@kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[krzk@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[kernel.org:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:from_smtp,st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D127E7485FB

On Sat, Jul 11, 2026 at 10:59:39PM +0200, Marek Vasut wrote:
> Add another SoM type N: match and update email address to an
> up to date one in the process.
> 
> Signed-off-by: Marek Vasut <marex@nabladev.com>
> ---
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Bartosz Golaszewski <brgl@kernel.org>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Linus Walleij <linusw@kernel.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: kernel@dh-electronics.com
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-gpio@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> ---
>  MAINTAINERS | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 8729cea57c3dd..3532d425e41f1 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7518,11 +7518,12 @@ F:	drivers/iio/chemical/sen0322.c
>  
>  DH ELECTRONICS DHSOM SOM AND BOARD SUPPORT
>  M:	Christoph Niedermaier <cniedermaier@dh-electronics.com>
> -M:	Marek Vasut <marex@denx.de>
> +M:	Marek Vasut <marex@nabladev.com>
>  L:	kernel@dh-electronics.com
>  S:	Maintained

Commit is fine, but, assuming old address stops working, please send a
patch changing address in other MAINTAINERS entry + mailmap entry, and
in all of dt-bindings (one patch for DT is enough)

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
