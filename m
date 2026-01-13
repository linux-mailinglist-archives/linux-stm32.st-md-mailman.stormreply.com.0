Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 095A8D17E4F
	for <lists+linux-stm32@lfdr.de>; Tue, 13 Jan 2026 11:13:14 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 86F18C8F283;
	Tue, 13 Jan 2026 10:13:13 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 53231C8F282
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Jan 2026 10:13:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id E228F43FCC;
 Tue, 13 Jan 2026 10:13:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED356C19423;
 Tue, 13 Jan 2026 10:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768299189;
 bh=B60Fgt62EI+KMFzznTOtUxbSOZ4bl9cL8ytB20WIh18=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TR1n3nxeNYKPBju7jSmTmUvHf2B07hvvjuClTqXpglYDTqUIy3Qc+ayTSIQ67kdIW
 M0dogUadKwpI8h4jvgScUNLHuPpfbDt72RggjaLhTMNJ7ilAdcNOaFZ7DP4BB8L3iQ
 pxtiM+2rAxz/7nXY1Gfa4Lf/sua6WJYBRwQl3QgHhT9y7zjGrl8I21BrlhCOtmeZ7M
 j/QK2RGJUmXm/TWFHY1viLqWV/1cRQnveztEjn7wZpPxhcp3HkUUE5GqdpNOtWv+Z3
 JSgAtsbANLy8Foi9gAgpkGw7D1b7Q4uu7lOrRkXsdRH4iHGFcjMTZa2D+8nBwldlOa
 l9AGfTdUR8RjQ==
Date: Tue, 13 Jan 2026 11:12:57 +0100
From: Niklas Cassel <cassel@kernel.org>
To: Koichiro Den <den@valinux.co.jp>
Message-ID: <aWYaqZLhNVHof4BW@ryzen>
References: <20260113023715.3463724-1-den@valinux.co.jp>
 <20260113023715.3463724-4-den@valinux.co.jp>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260113023715.3463724-4-den@valinux.co.jp>
Cc: imx@lists.linux.dev, vigneshr@ti.com, geert+renesas@glider.be,
 linux-pci@vger.kernel.org, lpieralisi@kernel.org, Frank.Li@nxp.com,
 minghuan.Lian@nxp.com, thierry.reding@gmail.com, festevam@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, marek.vasut+renesas@gmail.com,
 kishon@kernel.org, robh@kernel.org, jesper.nilsson@axis.com,
 hayashi.kunihiko@socionext.com, jirislaby@kernel.org, magnus.damm@gmail.com,
 linux-arm-kernel@axis.com, jonathanh@nvidia.com,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 18255117159@163.com, s-vadapalli@ti.com, kwilczynski@kernel.org,
 shawn.lin@rock-chips.com, srikanth.thokala@intel.com, hongxing.zhu@nxp.com,
 mcoquelin.stm32@gmail.com, mani@kernel.org, linux-arm-msm@vger.kernel.org,
 s.hauer@pengutronix.de, linuxppc-dev@lists.ozlabs.org, bhelgaas@google.com,
 linux-omap@vger.kernel.org, rongqianfeng@vivo.com, mingkai.hu@nxp.com,
 roy.zang@nxp.com, linux-tegra@vger.kernel.org, christian.bruel@foss.st.com,
 linux.amoon@gmail.com, jingoohan1@gmail.com, yoshihiro.shimoda.uh@renesas.com,
 heiko@sntech.de, linux-kernel@vger.kernel.org, vidyas@nvidia.com,
 linux-renesas-soc@vger.kernel.org, mhiramat@kernel.org, kernel@pengutronix.de,
 shawnguo@kernel.org, nicolas.frattaroli@collabora.com, l.stach@pengutronix.de
Subject: Re: [Linux-stm32] [PATCH v6 3/5] PCI: endpoint: Add
 dynamic_inbound_mapping EPC feature
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

On Tue, Jan 13, 2026 at 11:37:13AM +0900, Koichiro Den wrote:
> Introduce a new EPC feature bit (dynamic_inbound_mapping) that indicates
> whether an Endpoint Controller can update the inbound address
> translation for a BAR without requiring the EPF driver to clear/reset
> the BAR first.
> 
> Endpoint Function drivers (e.g. vNTB) can use this information to decide
> whether it really is safe to call pci_epc_set_bar() multiple times to
> update inbound mappings for the BAR.
> 
> Signed-off-by: Koichiro Den <den@valinux.co.jp>
> ---

Since your new feature depends on this feature, this patch should be first
in the series.

With that fixed:
Reviewed-by: Niklas Cassel <cassel@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
