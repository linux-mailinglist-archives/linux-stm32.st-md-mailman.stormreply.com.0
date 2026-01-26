Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ONAlBA9Bd2mMdQEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 26 Jan 2026 11:25:19 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 94D4E86D4E
	for <lists+linux-stm32@lfdr.de>; Mon, 26 Jan 2026 11:25:18 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3E116C87EDD;
	Mon, 26 Jan 2026 10:25:18 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 48469C87EDC
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 Jan 2026 10:25:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 43EE4600B0;
 Mon, 26 Jan 2026 10:25:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CABA5C116C6;
 Mon, 26 Jan 2026 10:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1769423116;
 bh=X15mCfB1eLkM+Q70lpbeFtmKLy3xRRhtPt0DJGPJd1I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kigC4KnPkwuten2W4vry7/Q7uLnx5jkxhwNDPy0SmE0+vvbSCHF02ake/mqQ6lpDx
 k3o+5GdnskVWEhwFv+soH8UL3BFwTStxAXpVkb7npdZKtA0UMIAzg1tVPsbpFK6Rg6
 4I1DwGLJocJGNLwVtaDzP5qs/IXjbThjudzizPR9NNoCayirZ5zFwD+EhinoKSrkqO
 FEa8FbY08hWJdyw1ez2QCO5ymgyh4sujmDe9gD6sM5qhEicDEJ9FfhMQgnchnA1N6u
 xE9gTZtR5iqv2+uoDoCPjx2r7bV7yVpvWCG0stjTBpjqqoqt2A+mm+zAfNOJhw0pf0
 WqfejPPvWWhng==
Date: Mon, 26 Jan 2026 11:25:03 +0100
From: Niklas Cassel <cassel@kernel.org>
To: Koichiro Den <den@valinux.co.jp>
Message-ID: <aXdA_6shI23JBswI@ryzen>
References: <20260124145012.2794108-1-den@valinux.co.jp>
 <20260124145012.2794108-5-den@valinux.co.jp>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260124145012.2794108-5-den@valinux.co.jp>
Cc: imx@lists.linux.dev, vigneshr@ti.com, geert+renesas@glider.be,
 linux-pci@vger.kernel.org, lpieralisi@kernel.org, Frank.Li@nxp.com,
 minghuan.Lian@nxp.com, thierry.reding@gmail.com,
 linux-kselftest@vger.kernel.org, festevam@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, marek.vasut+renesas@gmail.com,
 kishon@kernel.org, robh@kernel.org, jesper.nilsson@axis.com,
 hayashi.kunihiko@socionext.com, jirislaby@kernel.org, magnus.damm@gmail.com,
 linux-arm-kernel@axis.com, jonathanh@nvidia.com,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 18255117159@163.com, s-vadapalli@ti.com, kwilczynski@kernel.org,
 shawn.lin@rock-chips.com, srikanth.thokala@intel.com, shuah@kernel.org,
 hongxing.zhu@nxp.com, mcoquelin.stm32@gmail.com, mani@kernel.org,
 linux-arm-msm@vger.kernel.org, s.hauer@pengutronix.de,
 linuxppc-dev@lists.ozlabs.org, bhelgaas@google.com, linux-omap@vger.kernel.org,
 rongqianfeng@vivo.com, mingkai.hu@nxp.com, roy.zang@nxp.com,
 linux-tegra@vger.kernel.org, christian.bruel@foss.st.com,
 linux.amoon@gmail.com, jingoohan1@gmail.com, yoshihiro.shimoda.uh@renesas.com,
 heiko@sntech.de, linux-kernel@vger.kernel.org, vidyas@nvidia.com,
 linux-renesas-soc@vger.kernel.org, mhiramat@kernel.org, kernel@pengutronix.de,
 shawnguo@kernel.org, nicolas.frattaroli@collabora.com, l.stach@pengutronix.de
Subject: Re: [Linux-stm32] [PATCH v10 4/8] PCI: dwc: ep: Support BAR
 subrange inbound mapping via Address Match Mode iATU
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
X-Spamd-Result: default: False [5.29 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	MID_RHS_NOT_FQDN(0.50)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[cassel@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:den@valinux.co.jp,m:imx@lists.linux.dev,m:vigneshr@ti.com,m:geert+renesas@glider.be,m:linux-pci@vger.kernel.org,m:lpieralisi@kernel.org,m:Frank.Li@nxp.com,m:minghuan.Lian@nxp.com,m:thierry.reding@gmail.com,m:linux-kselftest@vger.kernel.org,m:festevam@gmail.com,m:linux-stm32@st-md-mailman.stormreply.com,m:marek.vasut+renesas@gmail.com,m:kishon@kernel.org,m:robh@kernel.org,m:jesper.nilsson@axis.com,m:hayashi.kunihiko@socionext.com,m:jirislaby@kernel.org,m:magnus.damm@gmail.com,m:linux-arm-kernel@axis.com,m:jonathanh@nvidia.com,m:linux-rockchip@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:18255117159@163.com,m:s-vadapalli@ti.com,m:kwilczynski@kernel.org,m:shawn.lin@rock-chips.com,m:srikanth.thokala@intel.com,m:shuah@kernel.org,m:hongxing.zhu@nxp.com,m:mcoquelin.stm32@gmail.com,m:mani@kernel.org,m:linux-arm-msm@vger.kernel.org,m:s.hauer@pengutronix.de,m:linuxppc-dev@lists.ozlabs.org,m:bhelgaas@google.com,m:linux-omap@vger.kernel.org,m:rongqianfe
 ng@vivo.com,m:mingkai.hu@nxp.com,m:roy.zang@nxp.com,m:linux-tegra@vger.kernel.org,m:christian.bruel@foss.st.com,m:linux.amoon@gmail.com,m:jingoohan1@gmail.com,m:yoshihiro.shimoda.uh@renesas.com,m:heiko@sntech.de,m:linux-kernel@vger.kernel.org,m:vidyas@nvidia.com,m:linux-renesas-soc@vger.kernel.org,m:mhiramat@kernel.org,m:kernel@pengutronix.de,m:shawnguo@kernel.org,m:nicolas.frattaroli@collabora.com,m:l.stach@pengutronix.de,m:geert@glider.be,m:thierryreding@gmail.com,m:marekvasut@gmail.com,m:magnusdamm@gmail.com,m:mcoquelinstm32@gmail.com,m:linuxamoon@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:-];
	RCPT_COUNT_GT_50(0.00)[54];
	NEURAL_HAM(-0.00)[-0.993];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[cassel@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FREEMAIL_CC(0.00)[lists.linux.dev,ti.com,glider.be,vger.kernel.org,kernel.org,nxp.com,gmail.com,st-md-mailman.stormreply.com,axis.com,socionext.com,nvidia.com,lists.infradead.org,163.com,rock-chips.com,intel.com,pengutronix.de,lists.ozlabs.org,google.com,vivo.com,foss.st.com,renesas.com,sntech.de,collabora.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,renesas];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo,stormreply.com:url,stormreply.com:email,nxp.com:email]
X-Rspamd-Queue-Id: 94D4E86D4E
X-Rspamd-Action: no action

On Sat, Jan 24, 2026 at 11:50:08PM +0900, Koichiro Den wrote:
> Extend dw_pcie_ep_set_bar() to support inbound mappings for BAR
> subranges using Address Match Mode IB iATU when pci_epf_bar.num_submap
> is non-zero.
> 
> Rename the existing BAR-match helper into dw_pcie_ep_ib_atu_bar() and
> introduce dw_pcie_ep_ib_atu_addr() for Address Match Mode. When
> num_submap is non-zero, read the assigned BAR base address and program
> one inbound iATU window per subrange. Validate the submap array before
> programming:
> - each subrange is aligned to pci->region_align
> - subranges cover the whole BAR (no gaps and no overlaps)
> 
> Track Address Match Mode mappings and tear them down on clear_bar() and
> on set_bar() error paths to avoid leaving half-programmed state or
> untranslated BAR holes.
> 
> Advertise this capability by extending the common feature bit
> initializer macro (DWC_EPC_COMMON_FEATURES).
> 
> This enables multiple inbound windows within a single BAR, which is
> useful on platforms where usable BARs are scarce but EPFs need multiple
> inbound regions.
> 
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Koichiro Den <den@valinux.co.jp>
> ---

Reviewed-by: Niklas Cassel <cassel@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
