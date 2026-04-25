Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UO3lLGiK7GmtZgAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Sat, 25 Apr 2026 11:33:28 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DFB1465AF7
	for <lists+linux-stm32@lfdr.de>; Sat, 25 Apr 2026 11:33:28 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D6523C8F290;
	Sat, 25 Apr 2026 09:33:27 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A6680C87EDB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 25 Apr 2026 09:33:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 8FA5C60052;
 Sat, 25 Apr 2026 09:33:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89AEDC2BCB0;
 Sat, 25 Apr 2026 09:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1777109604;
 bh=vTnWUB3963217PH6E98v4MIyJ/E5FD6u2p/ki3Ycw2o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kT8Q+d6o6nw+n1KPS+w1ZpJZl3Yc/tDH77v0iMYo8pnCj7XYzNRzqn66o/+5loj06
 us0LWHBLCY0Uds+AjizRvxUzdDxpq3OEqzBhXN2rZVTAMXy+1f0/ElBO/GRYjTafII
 ldWiYfqhzxYU/08LZsfArV9vUlP5cCPZcSqTpvY1DmjbiIjpyE5zlnOTAyKkpa/TEz
 kYlnNDET7XxapKrMtaUi5ICdwN0WGH4T5M8XKc9kB6tRx9nDKJ6mbKKcGns/l2lZmQ
 l8DJu3YF8zaf7wa6vfbTLogAeRe1ENAnhvwLfA+/6d+R4wvi/Nmd5X+oNQN7v3KF1Y
 GNFTzaymKptEA==
Date: Sat, 25 Apr 2026 11:33:21 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: lizhi2@eswincomputing.com
Message-ID: <20260425-woodoo-righteous-earthworm-0ed34c@quoll>
References: <20260423085501.760-1-lizhi2@eswincomputing.com>
 <20260423085650.820-1-lizhi2@eswincomputing.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260423085650.820-1-lizhi2@eswincomputing.com>
Cc: edumazet@google.com, linux-riscv@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, robh@kernel.org,
 pritesh.patel@einfochips.com, weishangjuan@eswincomputing.com, alex@ghiti.fr,
 ningyu@eswincomputing.com, maxime.chevallier@bootlin.com, kuba@kernel.org,
 pabeni@redhat.com, devicetree@vger.kernel.org, conor+dt@kernel.org,
 aou@eecs.berkeley.edu, horms@kernel.org, rmk+kernel@armlinux.org.uk,
 krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 pinkesh.vaghela@einfochips.com, linmin@eswincomputing.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch,
 palmer@dabbelt.com, mcoquelin.stm32@gmail.com, pjw@kernel.org,
 davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH net-next v6 3/3] riscv: dts: eswin:
 eic7700-hifive-premier-p550: enable Ethernet controller
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
X-Rspamd-Queue-Id: 4DFB1465AF7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
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
	FORGED_RECIPIENTS(0.00)[m:lizhi2@eswincomputing.com,m:edumazet@google.com,m:linux-riscv@lists.infradead.org,m:linux-stm32@st-md-mailman.stormreply.com,m:robh@kernel.org,m:pritesh.patel@einfochips.com,m:weishangjuan@eswincomputing.com,m:alex@ghiti.fr,m:ningyu@eswincomputing.com,m:maxime.chevallier@bootlin.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:aou@eecs.berkeley.edu,m:horms@kernel.org,m:rmk+kernel@armlinux.org.uk,m:krzk+dt@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:pinkesh.vaghela@einfochips.com,m:linmin@eswincomputing.com,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:andrew+netdev@lunn.ch,m:palmer@dabbelt.com,m:mcoquelin.stm32@gmail.com,m:pjw@kernel.org,m:davem@davemloft.net,m:conor@kernel.org,m:rmk@armlinux.org.uk,m:krzk@kernel.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[krzk@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[google.com,lists.infradead.org,st-md-mailman.stormreply.com,kernel.org,einfochips.com,eswincomputing.com,ghiti.fr,bootlin.com,redhat.com,vger.kernel.org,eecs.berkeley.edu,armlinux.org.uk,lunn.ch,dabbelt.com,gmail.com,davemloft.net];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-0.999];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	TAGGED_RCPT(0.00)[linux-stm32,dt,kernel,netdev];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	FORGED_SENDER_MAILLIST(0.00)[]

On Thu, Apr 23, 2026 at 04:56:50PM +0800, lizhi2@eswincomputing.com wrote:
> From: Zhi Li <lizhi2@eswincomputing.com>
> 
> Enable the on-board Gigabit Ethernet controller on the
> HiFive Premier P550 development board.
> 
> Signed-off-by: Zhi Li <lizhi2@eswincomputing.com>
> ---
>  .../devicetree/bindings/mfd/syscon.yaml       |   2 +
>  .../dts/eswin/eic7700-hifive-premier-p550.dts | 232 ++++++++++++++++++
>  arch/riscv/boot/dts/eswin/eic7700.dtsi        | 103 ++++++++
>  3 files changed, 337 insertions(+)
> 

Please split the patches.

Please run scripts/checkpatch.pl on the patches and fix reported
warnings. After that, run also 'scripts/checkpatch.pl --strict' on the
patches and (probably) fix more warnings. Some warnings can be ignored,
especially from --strict run, but the code here looks like it needs a
fix. Feel free to get in touch if the warning is not clear.

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
