Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KEBvBX4jxGljwwQAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 25 Mar 2026 19:03:42 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 88DD232A425
	for <lists+linux-stm32@lfdr.de>; Wed, 25 Mar 2026 19:03:41 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 39DF9C8F261;
	Wed, 25 Mar 2026 18:03:41 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 50FC8C87ED3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Mar 2026 18:03:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id BAC5044529;
 Wed, 25 Mar 2026 18:03:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E8DAC4CEF7;
 Wed, 25 Mar 2026 18:03:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1774461817;
 bh=z+3MKcnaVgxUUEFrOwwtAjO55jdTD/Aap52HWyvjU10=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cgbXDzFKuEwm0erfN2A14a6MqFPpdOFQ+JZrgxmk4/cS1JbAJDF8DZga7kHsEW5bZ
 zDYC9Jir/eUEG4lbfiVZe4uP96ssgyIY6mC9r3aGjmXQ+dEfU+oewxtydbBUifUGEg
 qTuY79FjkjNFPwzlz+1D0lSMPKb0UQ/USGXaohr0W/6ZhTtG4INz1/q9/UDHusbsr+
 tfkSjgKZdLFKfiygvCDhjoEEIJ4WTeYnnVLTNA2ZfTTtVLbiBJUxuK0ALluwhxtlfH
 5QX5ElCYZzn8oYIv/rLT+1Y7hF027n1q3Xh4asYYc2UnGeCba+yIuvBc+ygqYIvYKQ
 ZZNqfjEBOpdLw==
Date: Wed, 25 Mar 2026 18:03:30 +0000
From: Simon Horman <horms@kernel.org>
To: lizhi2@eswincomputing.com
Message-ID: <20260325180330.GL111839@horms.kernel.org>
References: <20260324073017.376-1-lizhi2@eswincomputing.com>
 <20260324073408.439-1-lizhi2@eswincomputing.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260324073408.439-1-lizhi2@eswincomputing.com>
Cc: edumazet@google.com, linux-riscv@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, robh@kernel.org,
 pritesh.patel@einfochips.com, weishangjuan@eswincomputing.com, alex@ghiti.fr,
 ningyu@eswincomputing.com, kuba@kernel.org, pabeni@redhat.com,
 devicetree@vger.kernel.org, conor+dt@kernel.org, aou@eecs.berkeley.edu,
 rmk+kernel@armlinux.org.uk, krzk+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, pinkesh.vaghela@einfochips.com,
 linmin@eswincomputing.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch, palmer@dabbelt.com,
 mcoquelin.stm32@gmail.com, pjw@kernel.org, davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH net-next v5 3/3] riscv: dts: eswin:
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
X-Spamd-Result: default: False [4.79 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[google.com,lists.infradead.org,st-md-mailman.stormreply.com,kernel.org,einfochips.com,eswincomputing.com,ghiti.fr,redhat.com,vger.kernel.org,eecs.berkeley.edu,armlinux.org.uk,lunn.ch,dabbelt.com,gmail.com,davemloft.net];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[horms@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[26];
	FORGED_RECIPIENTS(0.00)[m:lizhi2@eswincomputing.com,m:edumazet@google.com,m:linux-riscv@lists.infradead.org,m:linux-stm32@st-md-mailman.stormreply.com,m:robh@kernel.org,m:pritesh.patel@einfochips.com,m:weishangjuan@eswincomputing.com,m:alex@ghiti.fr,m:ningyu@eswincomputing.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:aou@eecs.berkeley.edu,m:rmk+kernel@armlinux.org.uk,m:krzk+dt@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:pinkesh.vaghela@einfochips.com,m:linmin@eswincomputing.com,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:andrew+netdev@lunn.ch,m:palmer@dabbelt.com,m:mcoquelin.stm32@gmail.com,m:pjw@kernel.org,m:davem@davemloft.net,m:conor@kernel.org,m:rmk@armlinux.org.uk,m:krzk@kernel.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[kernel.org:-];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	DBL_PROHIBIT(0.00)[3.1.11.0:email];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[horms@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.722];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[linux-stm32,dt,kernel,netdev];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[eswincomputing.com:email,stormreply.com:email,stormreply.com:url,st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: 88DD232A425
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 24, 2026 at 03:34:08PM +0800, lizhi2@eswincomputing.com wrote:
> From: Zhi Li <lizhi2@eswincomputing.com>
> 
> Enable the on-board Gigabit Ethernet controller on the
> HiFive Premier P550 development board.
> 
> Signed-off-by: Zhi Li <lizhi2@eswincomputing.com>
> ---
>  .../dts/eswin/eic7700-hifive-premier-p550.dts | 42 ++++++++++++
>  arch/riscv/boot/dts/eswin/eic7700.dtsi        | 66 +++++++++++++++++++
>  2 files changed, 108 insertions(+)

Unfortunately this does not compile:

$ ARCH=riscv make allmodconfig dtbs
...
  DTC     arch/riscv/boot/dts/eswin/eic7700-hifive-premier-p550.dtb
arch/riscv/boot/dts/eswin/eic7700.dtsi:300.28-330.5: ERROR (phandle_references): /soc/ethernet@50400000: Reference to non-existent node or label "clk"
...

-- 
pw-bot: changes-requested
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
