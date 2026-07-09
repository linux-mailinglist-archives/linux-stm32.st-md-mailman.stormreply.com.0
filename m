Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0mAFLJ6vT2oCmwIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 09 Jul 2026 16:26:38 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 36DD173235A
	for <lists+linux-stm32@lfdr.de>; Thu, 09 Jul 2026 16:26:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=sang-engineering.com header.s=k1 header.b=PUzFH9mS;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E0321C8F289;
	Thu,  9 Jul 2026 14:26:37 +0000 (UTC)
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 41CB5C712B2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Jul 2026 14:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 sang-engineering.com; h=date:from:to:cc:subject:message-id
 :references:mime-version:content-type:in-reply-to; s=k1; bh=ULW9
 VBv4cRlM6iC85iVcPrTJ/RUoBanK7j5g1mX7o9s=; b=PUzFH9mSrFXR0BT7bcHZ
 Edu7cwpTc+qJ+OrNpmfIGFDVhxIXkWvuhCfoFDFMwIRDsg61YTEhJsUS9CVKi6az
 P6v9kZs22j7OxfFuONh4fL96A7/4aZXTeYEKXEFLvDnbaWjtQMvRU/sqEcZFKEHD
 8CbLj3eD9wSCrMFlNxTu44NT6Nq72wdBYP4Zha/eGHVeKZZ2hJbbBLrepfix+5y8
 wPbx7qBDvD10x4wZ1uvqlRfiKPJQNDeM6c9wbZwAjaetlqpPufip7tXqIrrtvEGv
 yj/byiXXftAa0kvhgazHR8mM/mwB9T9fZRFwzl2sGHwDRyxeR+oELM4DKsYB1m8w
 Vg==
Received: (qmail 1163672 invoked from network); 9 Jul 2026 16:26:26 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted,
 authenticated); 9 Jul 2026 16:26:26 +0200
X-UD-Smtp-Session: l3s3148p1@Of/AaC5WFLZQT+F6
Date: Thu, 9 Jul 2026 16:26:25 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Pan Chuang <panchuang@vivo.com>
Message-ID: <ak-vkQ8g_ePdY15f@shikoro>
References: <20260709135846.97972-1-panchuang@vivo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260709135846.97972-1-panchuang@vivo.com>
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
 Bjorn Andersson <andersson@kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 Thomas Andreatta <thomasandreatta2000@gmail.com>,
 Samuel Holland <samuel.holland@sifive.com>,
 "open list:ARM/RISC-V/RENESAS ARCHITECTURE"
 <linux-renesas-soc@vger.kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Icenowy Zheng <zhengxingda@iscas.ac.cn>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "open list:FREESCALE eDMA DRIVER" <dmaengine@vger.kernel.org>,
 Paul Walmsley <pjw@kernel.org>,
 "open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>,
 Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>,
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
X-Spamd-Result: default: False [3.79 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[sang-engineering.com:s=k1];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	MID_RHS_NOT_FQDN(0.50)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	DMARC_NA(0.00)[sang-engineering.com];
	TAGGED_FROM(0.00)[renesas];
	FORGED_RECIPIENTS(0.00)[m:panchuang@vivo.com,m:imx@lists.linux.dev,m:linmq006@gmail.com,m:vigneshr@ti.com,m:geert+renesas@glider.be,m:kees@kernel.org,m:Frank.Li@nxp.com,m:linux-mips@vger.kernel.org,m:biju.das.jz@bp.renesas.com,m:ldewangan@nvidia.com,m:linux-riscv@lists.infradead.org,m:robert.jarzmik@free.fr,m:linux-stm32@st-md-mailman.stormreply.com,m:claudiu.beznea.uj@bp.renesas.com,m:thierry.reding@kernel.org,m:hayashi.kunihiko@socionext.com,m:zhang.lyra@gmail.com,m:magnus.damm@gmail.com,m:jernej.skrabec@gmail.com,m:jonathanh@nvidia.com,m:john.madieu.xa@bp.renesas.com,m:orsonzhai@gmail.com,m:keguang.zhang@gmail.com,m:cosmin-gabriel.tanislav.xa@renesas.com,m:linux-tegra@vger.kernel.org,m:mani@kernel.org,m:linux-arm-msm@vger.kernel.org,m:sean.wang@mediatek.com,m:linux-actions@lists.infradead.org,m:haojian.zhuang@gmail.com,m:linux-mediatek@lists.infradead.org,m:baolin.wang@linux.alibaba.com,m:matthias.bgg@gmail.com,m:quic_jseerapu@quicinc.com,m:wens@kernel.org,m:linux-arm-kernel@list
 s.infradead.org,m:angelogioacchino.delregno@collabora.com,m:dmitry.baryshkov@oss.qualcomm.com,m:andersson@kernel.org,m:linux-kernel@vger.kernel.org,m:thomasandreatta2000@gmail.com,m:samuel.holland@sifive.com,m:linux-renesas-soc@vger.kernel.org,m:vkoul@kernel.org,m:zhengxingda@iscas.ac.cn,m:mhiramat@kernel.org,m:mcoquelin.stm32@gmail.com,m:dmaengine@vger.kernel.org,m:pjw@kernel.org,m:linux-sunxi@lists.linux.dev,m:afaerber@suse.de,m:daniel@zonque.org,m:geert@glider.be,m:zhanglyra@gmail.com,m:magnusdamm@gmail.com,m:jernejskrabec@gmail.com,m:keguangzhang@gmail.com,m:haojianzhuang@gmail.com,m:matthiasbgg@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[3];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[wsa@sang-engineering.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[sang-engineering.com:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[52];
	ALIAS_RESOLVED(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FREEMAIL_CC(0.00)[lists.linux.dev,gmail.com,ti.com,glider.be,kernel.org,nxp.com,vger.kernel.org,bp.renesas.com,nvidia.com,lists.infradead.org,free.fr,st-md-mailman.stormreply.com,socionext.com,renesas.com,mediatek.com,linux.alibaba.com,quicinc.com,collabora.com,oss.qualcomm.com,sifive.com,iscas.ac.cn,suse.de,zonque.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,renesas];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[shikoro:mid,stormreply.com:url,stormreply.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 36DD173235A

On Thu, Jul 09, 2026 at 09:58:04PM +0800, Pan Chuang wrote:
> Commit 55b48e23f5c4b6f5ca9b7ab09599b17dcf501c10 ("genirq/devres: Add
> error handling in devm_request_*_irq()") added automatic error logging
> to devm_request_threaded_irq() and devm_request_any_context_irq() via
> the new devm_request_result() helper. The helper prints device name,
> IRQ number, handler functions, and error code on failure.
> 
> Since devm_request_irq() is a static inline wrapper around
> devm_request_threaded_irq(), it also benefits from this automatic
> logging.
> 
> This series removes the now-redundant dev_err() and dev_err_probe() calls
> in dmaengine drivers that follow these devm_request_*_irq() functions,
> as the core now provides more detailed diagnostic information on failure.
> 
> Pan Chuang (26):
>   dmaengine: fsl-edma-main: Remove redundant dev_err()/dev_err_probe()
>   dmaengine: fsl-qdma: Remove redundant dev_err()/dev_err_probe()
>   dmaengine: loongson-loongson1-apb-dma: Remove redundant
>     dev_err()/dev_err_probe()
>   dmaengine: mediatek-mtk-cqdma: Remove redundant
>     dev_err()/dev_err_probe()
>   dmaengine: mediatek-mtk-hsdma: Remove redundant
>     dev_err()/dev_err_probe()
>   dmaengine: mmp_pdma: Remove redundant dev_err()/dev_err_probe()
>   dmaengine: moxart-dma: Remove redundant dev_err()/dev_err_probe()
>   dmaengine: owl-dma: Remove redundant dev_err()/dev_err_probe()
>   dmaengine: pxa_dma: Remove redundant dev_err()/dev_err_probe()
>   dmaengine: qcom-gpi: Remove redundant dev_err()/dev_err_probe()
>   dmaengine: sf-pdma-sf-pdma: Remove redundant dev_err()/dev_err_probe()
>   dmaengine: sh-rcar-dmac: Remove redundant dev_err()/dev_err_probe()
>   dmaengine: sh-rz-dmac: Remove redundant dev_err()/dev_err_probe()
>   dmaengine: sh-shdmac: Remove redundant dev_err()/dev_err_probe()
>   dmaengine: sh-usb-dmac: Remove redundant dev_err()/dev_err_probe()
>   dmaengine: sprd-dma: Remove redundant dev_err()/dev_err_probe()
>   dmaengine: st_fdma: Remove redundant dev_err()/dev_err_probe()
>   dmaengine: stm32-stm32-dma: Remove redundant dev_err()/dev_err_probe()
>   dmaengine: stm32-stm32-dma3: Remove redundant
>     dev_err()/dev_err_probe()
>   dmaengine: stm32-stm32-mdma: Remove redundant
>     dev_err()/dev_err_probe()
>   dmaengine: sun4i-dma: Remove redundant dev_err()/dev_err_probe()
>   dmaengine: sun6i-dma: Remove redundant dev_err()/dev_err_probe()
>   dmaengine: tegra20-apb-dma: Remove redundant dev_err()/dev_err_probe()
>   dmaengine: ti-edma: Remove redundant dev_err()/dev_err_probe()
>   dmaengine: uniphier-xdmac: Remove redundant dev_err()/dev_err_probe()
>   dmaengine: xgene-dma: Remove redundant dev_err()/dev_err_probe()

One patch per subsystem for such trivial changes, please.

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
