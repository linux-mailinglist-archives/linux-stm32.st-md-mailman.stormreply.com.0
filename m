Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2sVXFD4mVmpc0AAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 14 Jul 2026 14:06:22 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CAF0275443B
	for <lists+linux-stm32@lfdr.de>; Tue, 14 Jul 2026 14:06:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=JALI0fxf;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=kernel.org (policy=quarantine)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6FA36CA8E4A;
	Tue, 14 Jul 2026 12:06:21 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F1772C87EB6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Jul 2026 12:06:19 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id A0A8B411D9;
 Tue, 14 Jul 2026 12:06:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 985521F000E9;
 Tue, 14 Jul 2026 12:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1784030778;
 bh=zXjAh2537yo9G5vWAgQyYke6ki6Lnw1UTZmZWsxbjhc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=JALI0fxfqvUbwOcumUkWMdf9+m8l9v/z9X4lZj/ehsLJwp7ooqiwniR8gwMwjlGX4
 KQm5hPhANenPfd2Bwl7Lw10CTxhcLtoJlVyhmsg2A4CH0cM2OlgloQDORZXOtineLC
 LSXy7jBY23Sl0ZuCS3XZeGNWqADdOIypDvJINA7+5rlsAPvHLK4n6INGqXPYHq43z0
 TChJyIoFjVyZF6bcTAaSLXrQYMnVCU5gag1jLCsHntMDSLG6NIQt9Oy31Q263sVXSw
 1vNiRk46Ol5RAtKDAakIkefOUYXtHCPa0UXek/BlAs8NXTFuLNcB3vZN6MkZkKKMuD
 FpfTkmjJaiaEg==
Date: Tue, 14 Jul 2026 17:36:14 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Message-ID: <alYmNl--mxMK1-86@vaman>
References: <20260709135846.97972-1-panchuang@vivo.com>
 <ak-vkQ8g_ePdY15f@shikoro>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ak-vkQ8g_ePdY15f@shikoro>
Cc: "open list:FREESCALE eDMA DRIVER" <imx@lists.linux.dev>,
 Miaoqian Lin <linmq006@gmail.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Kees Cook <kees@kernel.org>,
 Frank Li <Frank.Li@nxp.com>,
 "open list:MIPS/LOONGSON1 ARCHITECTURE" <linux-mips@vger.kernel.org>,
 Biju Das <biju.das.jz@bp.renesas.com>, Laxman Dewangan <ldewangan@nvidia.com>,
 "open list:SIFIVE DRIVERS" <linux-riscv@lists.infradead.org>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 "moderated list:STM32 DMA DRIVERS" <linux-stm32@st-md-mailman.stormreply.com>,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
 Thierry Reding <thierry.reding@kernel.org>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Magnus Damm <magnus.damm@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jon Hunter <jonathanh@nvidia.com>,
 John Madieu <john.madieu.xa@bp.renesas.com>, Orson Zhai <orsonzhai@gmail.com>,
 Keguang Zhang <keguang.zhang@gmail.com>,
 Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>,
 "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>,
 "open list:ARM/QUALCOMM MAILING LIST" <linux-arm-msm@vger.kernel.org>,
 Sean Wang <sean.wang@mediatek.com>,
 "moderated list:ARM/ACTIONS SEMI ARCHITECTURE"
 <linux-actions@lists.infradead.org>, Haojian Zhuang <haojian.zhuang@gmail.com>,
 "moderated list:MEDIATEK DMA DRIVER" <linux-mediatek@lists.infradead.org>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>,
 Chen-Yu Tsai <wens@kernel.org>,
 "moderated list:MEDIATEK DMA DRIVER" <linux-arm-kernel@lists.infradead.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>, Pan Chuang <panchuang@vivo.com>,
 open list <linux-kernel@vger.kernel.org>,
 Thomas Andreatta <thomasandreatta2000@gmail.com>,
 Samuel Holland <samuel.holland@sifive.com>,
 "open list:ARM/RISC-V/RENESAS ARCHITECTURE"
 <linux-renesas-soc@vger.kernel.org>, Icenowy Zheng <zhengxingda@iscas.ac.cn>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "open list:FREESCALE eDMA DRIVER" <dmaengine@vger.kernel.org>,
 Paul Walmsley <pjw@kernel.org>,
 "open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>,
 Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
 Daniel Mack <daniel@zonque.org>
Subject: Re: [Linux-stm32] [PATCH 00/26] dmaengine: Remove redundant error
 messages on IRQ request failure
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
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20260515];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	MID_RHS_NOT_FQDN(0.50)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:wsa+renesas@sang-engineering.com,m:imx@lists.linux.dev,m:linmq006@gmail.com,m:vigneshr@ti.com,m:geert+renesas@glider.be,m:kees@kernel.org,m:Frank.Li@nxp.com,m:linux-mips@vger.kernel.org,m:biju.das.jz@bp.renesas.com,m:ldewangan@nvidia.com,m:linux-riscv@lists.infradead.org,m:robert.jarzmik@free.fr,m:linux-stm32@st-md-mailman.stormreply.com,m:claudiu.beznea.uj@bp.renesas.com,m:thierry.reding@kernel.org,m:hayashi.kunihiko@socionext.com,m:zhang.lyra@gmail.com,m:magnus.damm@gmail.com,m:jernej.skrabec@gmail.com,m:jonathanh@nvidia.com,m:john.madieu.xa@bp.renesas.com,m:orsonzhai@gmail.com,m:keguang.zhang@gmail.com,m:cosmin-gabriel.tanislav.xa@renesas.com,m:linux-tegra@vger.kernel.org,m:mani@kernel.org,m:linux-arm-msm@vger.kernel.org,m:sean.wang@mediatek.com,m:linux-actions@lists.infradead.org,m:haojian.zhuang@gmail.com,m:linux-mediatek@lists.infradead.org,m:baolin.wang@linux.alibaba.com,m:matthias.bgg@gmail.com,m:quic_jseerapu@quicinc.com,m:wens@kernel.org,m:linux-a
 rm-kernel@lists.infradead.org,m:angelogioacchino.delregno@collabora.com,m:dmitry.baryshkov@oss.qualcomm.com,m:andersson@kernel.org,m:panchuang@vivo.com,m:linux-kernel@vger.kernel.org,m:thomasandreatta2000@gmail.com,m:samuel.holland@sifive.com,m:linux-renesas-soc@vger.kernel.org,m:zhengxingda@iscas.ac.cn,m:mhiramat@kernel.org,m:mcoquelin.stm32@gmail.com,m:dmaengine@vger.kernel.org,m:pjw@kernel.org,m:linux-sunxi@lists.linux.dev,m:afaerber@suse.de,m:daniel@zonque.org,m:wsa@sang-engineering.com,m:geert@glider.be,m:zhanglyra@gmail.com,m:magnusdamm@gmail.com,m:jernejskrabec@gmail.com,m:keguangzhang@gmail.com,m:haojianzhuang@gmail.com,m:matthiasbgg@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[vkoul@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:-];
	RCPT_COUNT_GT_50(0.00)[52];
	ALIAS_RESOLVED(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[vkoul@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FREEMAIL_CC(0.00)[lists.linux.dev,gmail.com,ti.com,glider.be,kernel.org,nxp.com,vger.kernel.org,bp.renesas.com,nvidia.com,lists.infradead.org,free.fr,st-md-mailman.stormreply.com,socionext.com,renesas.com,mediatek.com,linux.alibaba.com,quicinc.com,collabora.com,oss.qualcomm.com,vivo.com,sifive.com,iscas.ac.cn,suse.de,zonque.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,renesas];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vaman:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CAF0275443B

On 09-07-26, 16:26, Wolfram Sang wrote:
> On Thu, Jul 09, 2026 at 09:58:04PM +0800, Pan Chuang wrote:
> > Commit 55b48e23f5c4b6f5ca9b7ab09599b17dcf501c10 ("genirq/devres: Add
> > error handling in devm_request_*_irq()") added automatic error logging
> > to devm_request_threaded_irq() and devm_request_any_context_irq() via
> > the new devm_request_result() helper. The helper prints device name,
> > IRQ number, handler functions, and error code on failure.
> > 
> > Since devm_request_irq() is a static inline wrapper around
> > devm_request_threaded_irq(), it also benefits from this automatic
> > logging.
> > 
> > This series removes the now-redundant dev_err() and dev_err_probe() calls
> > in dmaengine drivers that follow these devm_request_*_irq() functions,
> > as the core now provides more detailed diagnostic information on failure.
> > 
> > Pan Chuang (26):
> >   dmaengine: fsl-edma-main: Remove redundant dev_err()/dev_err_probe()
> >   dmaengine: fsl-qdma: Remove redundant dev_err()/dev_err_probe()
> >   dmaengine: loongson-loongson1-apb-dma: Remove redundant
> >     dev_err()/dev_err_probe()
> >   dmaengine: mediatek-mtk-cqdma: Remove redundant
> >     dev_err()/dev_err_probe()
> >   dmaengine: mediatek-mtk-hsdma: Remove redundant
> >     dev_err()/dev_err_probe()
> >   dmaengine: mmp_pdma: Remove redundant dev_err()/dev_err_probe()
> >   dmaengine: moxart-dma: Remove redundant dev_err()/dev_err_probe()
> >   dmaengine: owl-dma: Remove redundant dev_err()/dev_err_probe()
> >   dmaengine: pxa_dma: Remove redundant dev_err()/dev_err_probe()
> >   dmaengine: qcom-gpi: Remove redundant dev_err()/dev_err_probe()
> >   dmaengine: sf-pdma-sf-pdma: Remove redundant dev_err()/dev_err_probe()
> >   dmaengine: sh-rcar-dmac: Remove redundant dev_err()/dev_err_probe()
> >   dmaengine: sh-rz-dmac: Remove redundant dev_err()/dev_err_probe()
> >   dmaengine: sh-shdmac: Remove redundant dev_err()/dev_err_probe()
> >   dmaengine: sh-usb-dmac: Remove redundant dev_err()/dev_err_probe()
> >   dmaengine: sprd-dma: Remove redundant dev_err()/dev_err_probe()
> >   dmaengine: st_fdma: Remove redundant dev_err()/dev_err_probe()
> >   dmaengine: stm32-stm32-dma: Remove redundant dev_err()/dev_err_probe()
> >   dmaengine: stm32-stm32-dma3: Remove redundant
> >     dev_err()/dev_err_probe()
> >   dmaengine: stm32-stm32-mdma: Remove redundant
> >     dev_err()/dev_err_probe()
> >   dmaengine: sun4i-dma: Remove redundant dev_err()/dev_err_probe()
> >   dmaengine: sun6i-dma: Remove redundant dev_err()/dev_err_probe()
> >   dmaengine: tegra20-apb-dma: Remove redundant dev_err()/dev_err_probe()
> >   dmaengine: ti-edma: Remove redundant dev_err()/dev_err_probe()
> >   dmaengine: uniphier-xdmac: Remove redundant dev_err()/dev_err_probe()
> >   dmaengine: xgene-dma: Remove redundant dev_err()/dev_err_probe()
> 
> One patch per subsystem for such trivial changes, please.

Yes pretty please

-- 
~Vinod
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
