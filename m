Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YGqEMxdVtGk4kAAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 13 Mar 2026 19:19:03 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A66A288A38
	for <lists+linux-stm32@lfdr.de>; Fri, 13 Mar 2026 19:19:03 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C8BFBC8F29D;
	Fri, 13 Mar 2026 18:19:02 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4CD5DC87ED6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Mar 2026 18:19:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id CA7F46012B;
 Fri, 13 Mar 2026 18:18:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49944C19421;
 Fri, 13 Mar 2026 18:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1773425939;
 bh=2NXO+yF+55T7F+hpfAb0nuG4E5nybIth2x/Lfeit0v0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=WkuBmUY5zECY4w8HigOp4c5Dc0Y7y2nfHD6yuEYwFaBxRHSoHOnEVTjF7hkT0eQkA
 AFvQ0/U9ShmNbMyzF+0wQhrhDsQwyNxKjC32q2tl+0EsRInNZqjgNxUjA0SajeBrn6
 kHFj31oHvk4O5GY8i8NmF5RD6dgQrjiCuW1ZNS0TlFAoxlpUagAwvkYpFuqyVtZphY
 QVlHtHnRkgjRr9/4FntuZCDQbU9JYgsYDVeDARhaRlMuvQRsZqk8X1fkK1i1jrac4k
 8sYPWv4uyylodoV2LcLxP/nDTVvuq2bcgK0cxCWY0hcOSstFpl3VMDzH3SGAkgADCP
 f+nDIUI0cgl7Q==
Date: Fri, 13 Mar 2026 13:18:58 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Christian Bruel <christian.bruel@foss.st.com>
Message-ID: <20260313181858.GA1427542@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b2b03ebe-9482-4a13-b22f-7b44da096eed@foss.st.com>
Cc: imx@lists.linux.dev, vigneshr@ti.com, geert+renesas@glider.be,
 linux-pci@vger.kernel.org, lpieralisi@kernel.org, Frank.Li@nxp.com,
 minghuan.Lian@nxp.com, Koichiro Den <den@valinux.co.jp>,
 linux-kselftest@vger.kernel.org, festevam@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, heiko@sntech.de, kishon@kernel.org,
 robh@kernel.org, jesper.nilsson@axis.com, hayashi.kunihiko@socionext.com,
 jirislaby@kernel.org, magnus.damm@gmail.com, linux-arm-kernel@axis.com,
 jonathanh@nvidia.com, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, 18255117159@163.com,
 marek.vasut+renesas@gmail.com, s-vadapalli@ti.com, kwilczynski@kernel.org,
 shawn.lin@rock-chips.com, srikanth.thokala@intel.com, shuah@kernel.org,
 hongxing.zhu@nxp.com, mcoquelin.stm32@gmail.com, mani@kernel.org,
 linux-arm-msm@vger.kernel.org, s.hauer@pengutronix.de,
 linuxppc-dev@lists.ozlabs.org, bhelgaas@google.com, linux-omap@vger.kernel.org,
 rongqianfeng@vivo.com, mingkai.hu@nxp.com, roy.zang@nxp.com,
 linux-tegra@vger.kernel.org, cassel@kernel.org, linux.amoon@gmail.com,
 jingoohan1@gmail.com, yoshihiro.shimoda.uh@renesas.com,
 linux-kernel@vger.kernel.org, vidyas@nvidia.com,
 linux-renesas-soc@vger.kernel.org, thierry.reding@gmail.com,
 mhiramat@kernel.org, kernel@pengutronix.de, shawnguo@kernel.org,
 nicolas.frattaroli@collabora.com, l.stach@pengutronix.de
Subject: Re: [Linux-stm32] [PATCH v10 3/8] PCI: dwc: Advertise dynamic
 inbound mapping support
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
X-Spamd-Result: default: False [5.29 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	MID_RHS_NOT_FQDN(0.50)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[helgaas@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:christian.bruel@foss.st.com,m:imx@lists.linux.dev,m:vigneshr@ti.com,m:geert+renesas@glider.be,m:linux-pci@vger.kernel.org,m:lpieralisi@kernel.org,m:Frank.Li@nxp.com,m:minghuan.Lian@nxp.com,m:den@valinux.co.jp,m:linux-kselftest@vger.kernel.org,m:festevam@gmail.com,m:linux-stm32@st-md-mailman.stormreply.com,m:heiko@sntech.de,m:kishon@kernel.org,m:robh@kernel.org,m:jesper.nilsson@axis.com,m:hayashi.kunihiko@socionext.com,m:jirislaby@kernel.org,m:magnus.damm@gmail.com,m:linux-arm-kernel@axis.com,m:jonathanh@nvidia.com,m:linux-rockchip@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:18255117159@163.com,m:marek.vasut+renesas@gmail.com,m:s-vadapalli@ti.com,m:kwilczynski@kernel.org,m:shawn.lin@rock-chips.com,m:srikanth.thokala@intel.com,m:shuah@kernel.org,m:hongxing.zhu@nxp.com,m:mcoquelin.stm32@gmail.com,m:mani@kernel.org,m:linux-arm-msm@vger.kernel.org,m:s.hauer@pengutronix.de,m:linuxppc-dev@lists.ozlabs.org,m:bhelgaas@google.com,m:linux-omap@vger.ke
 rnel.org,m:rongqianfeng@vivo.com,m:mingkai.hu@nxp.com,m:roy.zang@nxp.com,m:linux-tegra@vger.kernel.org,m:cassel@kernel.org,m:linux.amoon@gmail.com,m:jingoohan1@gmail.com,m:yoshihiro.shimoda.uh@renesas.com,m:linux-kernel@vger.kernel.org,m:vidyas@nvidia.com,m:linux-renesas-soc@vger.kernel.org,m:thierry.reding@gmail.com,m:mhiramat@kernel.org,m:kernel@pengutronix.de,m:shawnguo@kernel.org,m:nicolas.frattaroli@collabora.com,m:l.stach@pengutronix.de,m:geert@glider.be,m:magnusdamm@gmail.com,m:marekvasut@gmail.com,m:mcoquelinstm32@gmail.com,m:linuxamoon@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:-];
	RCPT_COUNT_GT_50(0.00)[55];
	NEURAL_HAM(-0.00)[-0.999];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[helgaas@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FREEMAIL_CC(0.00)[lists.linux.dev,ti.com,glider.be,vger.kernel.org,kernel.org,nxp.com,valinux.co.jp,gmail.com,st-md-mailman.stormreply.com,sntech.de,axis.com,socionext.com,nvidia.com,lists.infradead.org,163.com,rock-chips.com,intel.com,pengutronix.de,lists.ozlabs.org,google.com,vivo.com,renesas.com,collabora.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,renesas];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,stormreply.com:email,stormreply.com:url,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: 4A66A288A38
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 13, 2026 at 04:59:26PM +0100, Christian Bruel wrote:
> Hello,
> 
> While testing after this series, I encountered regressions on the STM32MP2,
> which I am unsure how to fix. The failures depend on the order in which the
> tests are run.

c0f1506f6354 ("PCI: dwc: Advertise dynamic inbound mapping support")
appeared in v7.0-rc1, so apparently we added a regression in v7.0?  Do
we need to revert this?

> The STM32 ATU has 4 inbound entries. After enumeration, the first 4 ATU
> entries are allocated within ib_window_map.
> 
> On the first run of ./pci_endpoint_test -v BAR3(for example),
> SUBRRANGE_SETUP calls dw_pcie_ep_ib_atu_addr(), which frees only one ATU
> entry (BAR3), because we were in the bar_to_atu case, for the first submap
> but fails to allocate the second submap. So the test FAILs.
> 
> On the second run with a different BAR, SUBRRANGE_SETUP test calls
> dw_pcie_ep_ib_atu_addr() again, freeing the required ATU entry (BAR1) and
> successfully using the second ATU entry (3), which was left unallocated by
> the first test. then now the test PASSes
> 
> Therefore, the first invocation of ./pci_endpoint_test on any BAR always
> fails. Other invocations are fine because the first one has left the missing
> necessary ATU entry free. Whatever initial BAR number is used
> 
> I am unsure how to fix this. Always freeing all BARs before calling
> set_bar() in the epf-test seems overkill, but safe.
> I am also considering modifying dw_pcie_ep_clear_ib_maps() to clear N
> num_submap entries even if ib_atu_indexes was not used yet, since only the
> full BAR is used during the first invocation from bar_to_atu. But the
> question is which ATU entry to select ? BAR+1 ?. This seems empirical.
> 
> I am not bothered by test failures due to an insufficient number of BARs
> (this is already the case for BAR5,6), but the fact that the failures depend
> on the test order is frustrating and show a regression.
> 
> But I'm not satisfied with either of the 2 possible fixes mentioned above.
> 
> Do you have any other thought ?
> 
> thank you
> 
> Christian
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
