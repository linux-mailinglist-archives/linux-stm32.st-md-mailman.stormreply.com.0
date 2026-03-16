Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aHD3G0X+t2nrXwEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 16 Mar 2026 13:57:41 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 18058299B7D
	for <lists+linux-stm32@lfdr.de>; Mon, 16 Mar 2026 13:57:41 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A8B55C87ED8;
	Mon, 16 Mar 2026 12:57:40 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7FEDBC3F945
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Mar 2026 12:57:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 03C9440433;
 Mon, 16 Mar 2026 12:57:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D31AC19421;
 Mon, 16 Mar 2026 12:57:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1773665857;
 bh=tzu+r2qc7wCfm8REikgVroUxtUjdMAAfjpIXLK3YodM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uQlhNjPnw/+sGK8GvTKCPoZUhDhYl44fzqlqWrftUDqeMtbvxoKYn2T6C/RVS+Ust
 HK4Sw1FIffQBntafCLNjcpjmc2NeKQo5v8vL38/ERGybt1eC0kCQY6Zo/Qt5nU/QqU
 15917IM/CEEWtpSG2iaw10u6phrNYX+YompvRt4EH7CrUaSEunPRgLzlaoy4kvXgf3
 /cwtGWUo2f1P4U0AwsmUGEWOrOvjjNdkKWFvwebPQDGNC0mCP9S2MBe/YWLl/VM69B
 269nAYZTQ3aThTX02S784XZH1qs1uKwt64gHF//3klHmNmcuFfYE/EhQXfpfyTqCbH
 +KDvqMSWxjcvA==
Date: Mon, 16 Mar 2026 13:57:23 +0100
From: Niklas Cassel <cassel@kernel.org>
To: Christian Bruel <christian.bruel@foss.st.com>
Message-ID: <abf-LKj8V2MpJFEE@ryzen>
References: <20260124145012.2794108-1-den@valinux.co.jp>
 <20260124145012.2794108-4-den@valinux.co.jp>
 <b2b03ebe-9482-4a13-b22f-7b44da096eed@foss.st.com>
 <tkfhaovpmaoodo35attvmbnpukcqgmwyrxmfgiwjy2dga65cgl@hmj4mx2n44ki>
 <5e485218-becf-499b-8a07-d25358504807@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5e485218-becf-499b-8a07-d25358504807@foss.st.com>
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
 linux-tegra@vger.kernel.org, linux.amoon@gmail.com, jingoohan1@gmail.com,
 yoshihiro.shimoda.uh@renesas.com, linux-kernel@vger.kernel.org,
 vidyas@nvidia.com, linux-renesas-soc@vger.kernel.org, thierry.reding@gmail.com,
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
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	MID_RHS_NOT_FQDN(0.50)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:christian.bruel@foss.st.com,m:imx@lists.linux.dev,m:vigneshr@ti.com,m:geert+renesas@glider.be,m:linux-pci@vger.kernel.org,m:lpieralisi@kernel.org,m:Frank.Li@nxp.com,m:minghuan.Lian@nxp.com,m:den@valinux.co.jp,m:linux-kselftest@vger.kernel.org,m:festevam@gmail.com,m:linux-stm32@st-md-mailman.stormreply.com,m:heiko@sntech.de,m:kishon@kernel.org,m:robh@kernel.org,m:jesper.nilsson@axis.com,m:hayashi.kunihiko@socionext.com,m:jirislaby@kernel.org,m:magnus.damm@gmail.com,m:linux-arm-kernel@axis.com,m:jonathanh@nvidia.com,m:linux-rockchip@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:18255117159@163.com,m:marek.vasut+renesas@gmail.com,m:s-vadapalli@ti.com,m:kwilczynski@kernel.org,m:shawn.lin@rock-chips.com,m:srikanth.thokala@intel.com,m:shuah@kernel.org,m:hongxing.zhu@nxp.com,m:mcoquelin.stm32@gmail.com,m:mani@kernel.org,m:linux-arm-msm@vger.kernel.org,m:s.hauer@pengutronix.de,m:linuxppc-dev@lists.ozlabs.org,m:bhelgaas@google.com,m:linux-omap@vger.ke
 rnel.org,m:rongqianfeng@vivo.com,m:mingkai.hu@nxp.com,m:roy.zang@nxp.com,m:linux-tegra@vger.kernel.org,m:linux.amoon@gmail.com,m:jingoohan1@gmail.com,m:yoshihiro.shimoda.uh@renesas.com,m:linux-kernel@vger.kernel.org,m:vidyas@nvidia.com,m:linux-renesas-soc@vger.kernel.org,m:thierry.reding@gmail.com,m:mhiramat@kernel.org,m:kernel@pengutronix.de,m:shawnguo@kernel.org,m:nicolas.frattaroli@collabora.com,m:l.stach@pengutronix.de,m:geert@glider.be,m:magnusdamm@gmail.com,m:marekvasut@gmail.com,m:mcoquelinstm32@gmail.com,m:linuxamoon@gmail.com,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[cassel@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[lists.linux.dev,ti.com,glider.be,vger.kernel.org,kernel.org,nxp.com,valinux.co.jp,gmail.com,st-md-mailman.stormreply.com,sntech.de,axis.com,socionext.com,nvidia.com,lists.infradead.org,163.com,rock-chips.com,intel.com,pengutronix.de,lists.ozlabs.org,google.com,vivo.com,renesas.com,collabora.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[54];
	NEURAL_HAM(-0.00)[-0.143];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[cassel@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,renesas];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 18058299B7D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 16, 2026 at 01:41:03PM +0100, Christian Bruel wrote:
> Hi Koichiro,
> 
> > 
> > If I understood the problem correctly, would something like the patch below
> > address it? My expectation is that the subrange mapping test would then fail
> > consistently on platforms that do not have enough free IB iATU regions.
> > 
> 
> Thank you for your patch. Yes, now the bar subrange tests fail consistently,
> so that is enough to say this is not a regression.
> 
> However, I think there was a clear BAR missing somewhere before running the
> tests in the EPF driver, as the BARs could be reallocated during the other
> tests. This is not due to the subrange tests, but the EPF test driver
> supposes a 1:1 BAR/ATU mapping. Now this assumption is broken. I'm wondering
> if this could be improved to make the subrange tests pass on all platforms

Normally, you want one inbound iATU per enabled BAR, since you want the host
to be able to access all the enabled BARs at any time.

If you are thinking that we should somehow temporarily disable inbound
address translation for one of the enabled BARs, such that we can do "steal"
that iATU to test inbound subrange mapping, then I think that is a bad idea.

I think we should just let the test fail. Possibly we could call some API that
tells us that all inbound iATUs are occupied, and then SKIP instead of FAIL
the inbound subrange test case.

If you really want to test/use inbound subrange mapping, even if your SoC has
a very limited number of inbound iATUs, then I think a better solution is to
mark one or multiple of your BARs as disabled:
https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git/commit/?h=endpoint&id=33642e9e36dc084e4fc9245a266c9843bc8303b9

Then you should have at least one more inbound iATU available, and should be
able to run the inbound subrange test case.


Kind regards,
Niklas
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
