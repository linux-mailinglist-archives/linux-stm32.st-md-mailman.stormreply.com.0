Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eHpdMi53+GlavgIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 04 May 2026 12:38:38 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 719264BBD71
	for <lists+linux-stm32@lfdr.de>; Mon, 04 May 2026 12:38:38 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 04388C055F4;
	Mon,  4 May 2026 10:28:51 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0461AC2909A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  4 May 2026 10:28:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 0057C60125;
 Mon,  4 May 2026 10:28:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F9D7C2BCB8;
 Mon,  4 May 2026 10:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1777890528;
 bh=C8xErYLvhPi3/y5PT2xKoQR2XSjSO6oonC2p86NBA50=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ditjBDesUUK94v7TkQQRnjRwaJ732nv/8eUZqEi8iRb2kdbutLnnnqFgN47QwqQ/p
 0phoOneGTIIDY0Vk+TXrJTXbKPf+5Yyn6Hiz55PDQRqNLZ3t6KvKkaPlwK9aDvt81T
 dAApoGze9zzDj8XfUkbqYpuKRgYAa5/QWL/nh1cDLNmFj+ahpR13f22w0R9pyLzF0O
 lSHV/Y4jFKRhelvRTOgzuBdmBUvCVwALjoME4rr8Y+nOU4CL5iqSlfEKGWhgnfA6/l
 Ac/nXcoI6ECHc8+xDEl8mmt83TWDWBpFhYyqnWgc0JqM8jBHQve2WG/3tUP4on87ZD
 wCJGAOVM1XtfQ==
Date: Mon, 4 May 2026 12:28:46 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Manish Baing <manishbaing2789@gmail.com>
Message-ID: <20260504-urban-judicious-buzzard-14bd50@quoll>
References: <20260501073305.5866-1-manishbaing2789@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260501073305.5866-1-manishbaing2789@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, linux-pwm@vger.kernel.org,
 linusw@kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 thierry.reding@gmail.com, ukleinek@kernel.org, mcoquelin.stm32@gmail.com,
 krzk+dt@kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: pwm: stmpe: convert to DT
	schema
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
X-Rspamd-Queue-Id: 719264BBD71
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [5.29 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	MID_RHS_NOT_FQDN(0.50)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:manishbaing2789@gmail.com,m:robh@kernel.org,m:conor+dt@kernel.org,m:linux-pwm@vger.kernel.org,m:linusw@kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:thierry.reding@gmail.com,m:ukleinek@kernel.org,m:mcoquelin.stm32@gmail.com,m:krzk+dt@kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:conor@kernel.org,m:thierryreding@gmail.com,m:mcoquelinstm32@gmail.com,m:krzk@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[krzk@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	GREYLIST(0.00)[pass,body];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:-];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-0.898];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com,st-md-mailman.stormreply.com,lists.infradead.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,stormreply.com:url,stormreply.com:email]

On Fri, May 01, 2026 at 07:33:05AM +0000, Manish Baing wrote:
> Convert the STMicroelectronics STMPE PWM controller bindings
> from text format to YAML schema.
> 
> Signed-off-by: Manish Baing <manishbaing2789@gmail.com>
> ---
>  .../devicetree/bindings/pwm/st,stmpe-pwm.txt  | 18 --------

It is already covered by st,stmpe.yaml, which you were supposed to find
with git grep.

Instead, drop the TXT file.

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
