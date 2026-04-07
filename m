Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WAVCBBJp1GlCtwcAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 07 Apr 2026 04:16:50 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 918833A8F28
	for <lists+linux-stm32@lfdr.de>; Tue, 07 Apr 2026 04:16:49 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 48FD9C8F281;
	Tue,  7 Apr 2026 02:10:04 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BAAB6C36B3C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 Apr 2026 02:10:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 886C94033D;
 Tue,  7 Apr 2026 02:10:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 965B2C2BC9E;
 Tue,  7 Apr 2026 02:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1775527801;
 bh=l09qNxpZb2Z1OjdsheCfqqB6WqqZEIYEjhtnuPN66eg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=K/XT+t2dUq4UZUpycoC/TjCJryznGtdzS7KsFBX/zOgT6p/Dyu+gZjCGebF8q1Fsu
 tRc3uUvMRPSl8hAEGe+1yUuM2rM4yAPo1wvlPy6dRkrt7xS5EAVniNWzawuJT5q57v
 j2ElEqf7orzMg09jO30j1Bh10HhlVMiHh/oQcS1V/zAw59MJ2LDfLXsJ5wNK2bc88T
 O6e8KRDP2qyeDnLJW0qagfnBY7YC/XJHzWTKYNUp947c+jndZsiz6lax+fu8i0dZwg
 nfE9ST9hBXBB1/oEuTje5L2oNyFWaw96a5IRopzwr6d3RMT6tulObgZ5Bne0+G7g0z
 hYJkTyeJLAh9g==
From: Jakub Kicinski <kuba@kernel.org>
To: jitendra.vegiraju@broadcom.com
Date: Mon,  6 Apr 2026 19:09:58 -0700
Message-ID: <20260407020958.3674568-1-kuba@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260402213629.1996133-3-jitendra.vegiraju@broadcom.com>
References: <20260402213629.1996133-3-jitendra.vegiraju@broadcom.com>
MIME-Version: 1.0
Cc: quic_abchauha@quicinc.com, me@ziyao.cc, chenchuangyu@xiaomi.com,
 edumazet@google.com, lizhi2@eswincomputing.com, yangtiezhu@loongson.cn,
 linux-stm32@st-md-mailman.stormreply.com, weishangjuan@eswincomputing.com,
 daniel@iogearbox.net, chenhuacai@kernel.org, john.fastabend@gmail.com,
 siyanteng@cqsoftware.com.cn, sdf@fomichev.me,
 bcm-kernel-feedback-list@broadcom.com, vladimir.oltean@nxp.com,
 Jakub Kicinski <kuba@kernel.org>, pabeni@redhat.com, hawk@kernel.org,
 richardcochran@gmail.com, rohan.g.thomas@altera.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com, ast@kernel.org,
 rmk+kernel@armlinux.org.uk, wens@kernel.org,
 linux-arm-kernel@lists.infradead.org, mcoquelin.stm32@gmail.com,
 florian.fainelli@broadcom.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch, boon.khai.ng@altera.com,
 horms@kernel.org, bpf@vger.kernel.org, davem@davemloft.net,
 ovidiu.panait.rb@renesas.com
Subject: Re: [Linux-stm32] [PATCH net-next v9 2/4] net: stmmac: Integrate
	dw25gmac into hwif handling
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
X-Spamd-Result: default: False [5.79 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	MID_CONTAINS_FROM(1.00)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[36];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[kuba@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[quicinc.com,ziyao.cc,xiaomi.com,google.com,eswincomputing.com,loongson.cn,st-md-mailman.stormreply.com,iogearbox.net,kernel.org,gmail.com,cqsoftware.com.cn,fomichev.me,broadcom.com,nxp.com,redhat.com,altera.com,bp.renesas.com,armlinux.org.uk,lists.infradead.org,vger.kernel.org,lunn.ch,davemloft.net,renesas.com];
	FORGED_RECIPIENTS(0.00)[m:jitendra.vegiraju@broadcom.com,m:quic_abchauha@quicinc.com,m:me@ziyao.cc,m:chenchuangyu@xiaomi.com,m:edumazet@google.com,m:lizhi2@eswincomputing.com,m:yangtiezhu@loongson.cn,m:linux-stm32@st-md-mailman.stormreply.com,m:weishangjuan@eswincomputing.com,m:daniel@iogearbox.net,m:chenhuacai@kernel.org,m:john.fastabend@gmail.com,m:siyanteng@cqsoftware.com.cn,m:sdf@fomichev.me,m:bcm-kernel-feedback-list@broadcom.com,m:vladimir.oltean@nxp.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:hawk@kernel.org,m:richardcochran@gmail.com,m:rohan.g.thomas@altera.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:ast@kernel.org,m:rmk+kernel@armlinux.org.uk,m:wens@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:mcoquelin.stm32@gmail.com,m:florian.fainelli@broadcom.com,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:andrew+netdev@lunn.ch,m:boon.khai.ng@altera.com,m:horms@kernel.org,m:bpf@vger.kernel.org,m:davem@davemloft.net,m:ovidiu.panait.rb@renesas.com,m:johnfastabend@
 gmail.com,m:rmk@armlinux.org.uk,m:mcoquelinstm32@gmail.com,m:andrew@lunn.ch,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[kuba@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,kernel,netdev];
	NEURAL_SPAM(0.00)[0.744];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: 918833A8F28
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This is an AI-generated review of your patch. The human sending this
email has considered the AI review valid, or at least plausible.
---
net: stmmac: Integrate dw25gmac into hwif handling

Integrate dw25gmac support into stmmac hardware interface handling.
Added a new entry to the stmmac_hw table in hwif.c.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.c b/drivers/net/ethernet/stmicro/stmmac/hwif.c
> index 511b0fd5e8343..a69f558c0db06 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/hwif.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/hwif.c
> @@ -287,6 +287,26 @@ static const struct stmmac_hwif_entry {
>  		.mmc = &dwxgmac_mmc_ops,
>  		.est = &dwmac510_est_ops,
>  		.setup = dwxlgmac2_setup,
> +	}, {
> +		.core_type = DWMAC_CORE_25GMAC,
> +		.min_id = DW25GMAC_CORE_3_20,

Are there other areas where the core capabilities will be misidentified?

Throughout stmmac_main.c and stmmac_ethtool.c, hardware features branch
explicitly on core_type == DWMAC_CORE_XGMAC instead of including
DWMAC_CORE_25GMAC.

This seems to cause a few side effects:
- stmmac_ethtool_get_drvinfo() misreports the driver as MAC100_ETHTOOL_NAME
  (st_mac100).
- stmmac_main.c enforces legacy MTU limits rather than XGMAC_JUMBO_LEN.
- stmmac_dma_cap_show() debugfs output treats the 25GMAC count of multiple
  MAC address registers as a simple boolean and omits Timestamp System Time
  Source details.

Does this also break MDIO communication for the PHY?

In stmmac_mdio_register(), XGMAC MDIO accessors are assigned strictly if
priv->plat->core_type == DWMAC_CORE_XGMAC. Because 25GMAC is omitted, it
falls into the else block and assigns legacy GMAC callbacks like
stmmac_mdio_read_c22().

The GMAC accessors format the control word using GMAC bitfields (checking
MII_ADDR_GBUSY at bit 0), while the XGMAC register layout expects
MII_XGMAC_BUSY at bit 22.

Could this misconfiguration write invalid bit patterns to the register and
wait on the wrong bit?

> +		.regs = {
> +			.ptp_off = PTP_XGMAC_OFFSET,
> +			.mmc_off = MMC_XGMAC_OFFSET,
> +			.est_off = EST_XGMAC_OFFSET,

Will this misconfigure the Time-to-Output Value for EST (802.3 Qbv)?

In stmmac_est.c, est_configure() and est_irq_status() use
if (priv->plat->core_type == DWMAC_CORE_XGMAC) to differentiate XGMAC from
GMAC5.

Without 25GMAC in that check, it falls through to the GMAC5 logic, applying
the EST_GMAC5_PTOV mask (bits 31:24) instead of the EST_XGMAC_PTOV mask
(bits 31:23) to the EST control register at EST_XGMAC_OFFSET.

> +		},
> +		.desc = &dwxgmac210_desc_ops,
> +		.dma = &dw25gmac400_dma_ops,
> +		.mac = &dwxgmac210_ops,

Does adding these ops introduce a buffer overflow during ethtool register
dumps?

Since stmmac_ethtool_get_regs_len() does not match DWMAC_CORE_25GMAC, it
falls back to returning REG_SPACE_SIZE (4192 bytes, or 1048 u32 elements).

However, these ops use the dwxgmac2_dump_regs() and dwxgmac2_dma_dump_regs()
callbacks, which write far beyond the 1048-element buffer:

- dwxgmac2_dump_regs() writes up to index XGMAC_MAC_REGSIZE (1309 elements).
- dwxgmac2_dma_dump_regs() writes from XGMAC_DMA_MODE / 4 (3072) to
  XGMAC_REGSIZE (3647 elements).

Will this corrupt kernel memory when a privileged user runs ethtool -d?

> +		.vlan = &dwxgmac210_vlan_ops,
> +		.hwtimestamp = &stmmac_ptp,
> +		.ptp = &stmmac_ptp_clock_ops,
> +		.mode = NULL,
> +		.tc = &dwmac510_tc_ops,
> +		.mmc = &dwxgmac_mmc_ops,
> +		.est = &dwmac510_est_ops,
> +		.setup = dw25gmac_setup,
> +		.quirks = NULL,
>  	},
>  };
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
