Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4CwYA2cKBWo1RwIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 14 May 2026 01:33:59 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CCEF53C086
	for <lists+linux-stm32@lfdr.de>; Thu, 14 May 2026 01:33:58 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4FE7DC8F290;
	Wed, 13 May 2026 23:33:58 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9287FC8F289
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 May 2026 23:33:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 7BC8A60052;
 Wed, 13 May 2026 23:33:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1579C19425;
 Wed, 13 May 2026 23:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1778715235;
 bh=ABN00HzQ91S9l2mJfmg1rfw+l+o9zTlnJwwutFGLwM0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sK6GldL0bTZVqO9OPG1ev4S3c6qMvI//wfjvKk1rZ0j69abHr9hqNO7J9Mmt6n1+o
 PdcPGN4X7wQ80RoyXo7u+OyrlnH+PCPkf9aXiN2kXqioWMnyINK3deRFbSUoo9/1X9
 QwOTMFJQmxv+qWAqU686nn9BgSd0m8dQCdoPNOG3TuLdb5wMD4oUjzlZhz/brJsFFb
 WaIopn7fsArYBuXAaxdgUaZptS4nQuvEJvxbMazt2Sr71IRgyhSQx7MlEQ9PMIbCHG
 SgUrYj5yJuLmVI7EzcBTPgoZTGFf0WDFPFBuLZP3+5/7RotCIq7KhKu76iOJbBZsPF
 b56EUDkUpi8Ww==
Date: Wed, 13 May 2026 18:33:52 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Manish Baing <manishbaing2789@gmail.com>
Message-ID: <177871523137.2307220.3066863194193334549.robh@kernel.org>
References: <20260508184626.15938-1-manishbaing2789@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260508184626.15938-1-manishbaing2789@gmail.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, linux-pwm@vger.kernel.org,
 linusw@kernel.org, linux-kernel@vger.kernel.org, thierry.reding@gmail.com,
 ukleinek@kernel.org, mcoquelin.stm32@gmail.com, krzk+dt@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2] dt-bindings: pwm: stmpe: drop legacy
	binding
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
X-Rspamd-Queue-Id: 9CCEF53C086
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [5.79 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:manishbaing2789@gmail.com,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:linux-pwm@vger.kernel.org,m:linusw@kernel.org,m:linux-kernel@vger.kernel.org,m:thierry.reding@gmail.com,m:ukleinek@kernel.org,m:mcoquelin.stm32@gmail.com,m:krzk+dt@kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:conor@kernel.org,m:thierryreding@gmail.com,m:mcoquelinstm32@gmail.com,m:krzk@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[robh@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:-];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-0.984];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,gmail.com,st-md-mailman.stormreply.com,lists.infradead.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Action: no action


On Fri, 08 May 2026 18:46:26 +0000, Manish Baing wrote:
> The st,stmpe-pwm binding is already covered by the MFD schema
> Documentation/devicetree/bindings/mfd/st,stmpe.yaml. Remove the
> obsolete and redundant text binding file.
> 
> Signed-off-by: Manish Baing <manishbaing2789@gmail.com>
> ---
> Changes in v2:
> - Drop the TXT file instead of converting to YAML, as the
>   functionality is already covered by st,stmpe.yaml.
> - Update the commit subject and description to reflect the drop.
> 
>  .../devicetree/bindings/pwm/st,stmpe-pwm.txt   | 18 ------------------
>  1 file changed, 18 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/pwm/st,stmpe-pwm.txt
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
