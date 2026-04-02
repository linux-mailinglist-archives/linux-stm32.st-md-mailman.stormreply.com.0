Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8MW9DkV/zmkWoAYAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 02 Apr 2026 16:37:57 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AAEB338AA68
	for <lists+linux-stm32@lfdr.de>; Thu, 02 Apr 2026 16:37:56 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0E9EDC87ECE;
	Thu,  2 Apr 2026 14:37:56 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 478C1C08D19
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  2 Apr 2026 14:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eglLKrveNJuj7YOcmdnYRMdVElmq6kVL9OzjVIGPajw=; b=PdGvsnb1gbCZELkYEOvXsBdgo3
 pxstB8JsTZnISW06js/AXkaTooQnQWt+WBKuQqCehMJU9pnAsm32Vs4AutzsTVrZJHfZLsvev30mt
 4mC9oBXgtWFugWpJ5Deg7kBR1L01IW4zS7JMCvFSqoBdCNBWw9DwCSdqZEJ8CrwzvpSWELrQRRdts
 QJKuHHK+CcVVgo3VfyUbRxI6h3/i8UAik0nzXVsRYEebECQueryJ2ANMQXZ6iea9mjyABtsSzIkkU
 6sj8650Uh8ssV+Dy/HjEMAwxmci/Tx8zsyaB2XFl8HDoJTOM76oXmvqIpSA0C5e6G3vN2q0AEAq5m
 poBIocag==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:45144)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <linux@armlinux.org.uk>) id 1w8JB2-000000004Zt-1mLj;
 Thu, 02 Apr 2026 15:37:44 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1w8JAz-000000005pB-2SHC; Thu, 02 Apr 2026 15:37:41 +0100
Date: Thu, 2 Apr 2026 15:37:41 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Message-ID: <ac5_NVLeRZTYm2yR@shell.armlinux.org.uk>
References: <E1w6AZm-0000000E54W-1F6E@rmk-PC.armlinux.org.uk>
 <9d0a529a-d065-4f46-a93b-23195a4f9727@oss.qualcomm.com>
 <acpqgpCsbo3lJs3l@shell.armlinux.org.uk>
 <acw1habUsiSqlrky@oss.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <acw1habUsiSqlrky@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Andrew Lunn <andrew@lunn.ch>, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, netdev@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH RFC net-next] net: stmmac: qcom-ethqos:
	set clk_csr
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
X-Spamd-Result: default: False [3.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[armlinux.org.uk:s=pandora-2019];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[armlinux.org.uk : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[linux@armlinux.org.uk,linux-stm32-bounces@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:mohd.anwar@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:andrew@lunn.ch,m:linux-arm-msm@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:netdev@vger.kernel.org,m:kuba@kernel.org,m:pabeni@redhat.com,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[armlinux.org.uk:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@armlinux.org.uk,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,armlinux.org.uk:url,shell.armlinux.org.uk:mid]
X-Rspamd-Queue-Id: AAEB338AA68
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 01, 2026 at 02:28:45AM +0530, Mohd Ayaan Anwar wrote:
> While I had made an identical change while retesting the PCS series,
> I was holding off on posting this patch for the same concern - what
> if some boards fall outside the 50 - 100 MHz range.
> 
> After some digging, the AHB clock appears to operate within:
>  - 50 to 100 MHz for lemans/monaco derivative boards (2500BASE-X
>    interface)
>  - 30 to 75 MHz for boards with an RGMII interface.

That's ever so slightly annoying, but it makes no difference for the
divisor selection.

CSR_F_60M is a divider of 42 giving:
	714kHz  @ 30MHz,
	1.19MHz @ 50MHz,
	1.79MHz @ 75MHz,
	2.42MHz @ 100MHz

If we were to use CSR_F_35M, that would be /26, giving:
	1.15MHz @ 30MHz
	1.92MHz @ 50MHz
	2.88MHz @ 75MHz (exceeding 802.3 spec)
	3.85MHz @ 100MHz (exceeding 802.3 spec)

Given the RGMII range, to stay within the 802.3 spec without knowing
the actual clock rate being used, CSR_F_60M is still the only possible
selection, even though it gives an extremely low clock rate for 30MHz.

I believe you said that firmware can change this clock rate dynamically
at runtime which makes it much harder. If there was a notification from
firmware into the kernel that the clocks had changed, and that was
communicated into the clk API such that the appropriate clock input for
stmmac, then we could look at updating the divisor.

We would need the firmware to give us a pre-rate change notification
and post-rate change notification (and be guaranteed that there would
always be a post notification after the pre notification) with that
coupled into the clk API.

We'd need stmmac to hook into the clk API notifier infrastructure,
where the PRE_RATE_CHANGE takes the MDIO bus lock to wait for any in-
progress transfer to finish, and then block further accesses, and
POST_RATE_CHANGE update the divisor, and finally both
ABORT_RATE_CHANGE and POST_RATE_CHANGE releasing the MDIO bus lock.

With firmware telling the kernel what this clock rate is, the manual
setting of priv->plat->clk_csr goes away.

Maybe this is something to consider for the future.

> If a future platform exceeds this range, we could switch to something
> like: plat_dat->clk_csr = data->clk_csr, with each EMAC version
> selecting the appropriate divisor.

Without firmware telling us what the clock rate actually is, that's the
only solution.

> Due to some urgent work tasks, I am still finishing PCS series
> testing. I will provide a t-b once done.
> 
> In the meanwhile, please feel free to add:
> 
> Reviewed-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

Thanks! I'll submit the patch non-RFC shortly.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
