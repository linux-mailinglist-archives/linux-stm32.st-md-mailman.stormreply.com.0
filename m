Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EAFAAC6130
	for <lists+linux-stm32@lfdr.de>; Wed, 28 May 2025 07:24:59 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 07076C36B2A;
	Wed, 28 May 2025 05:24:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 446ADC36B29
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 May 2025 05:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748409899; x=1779945899;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=17rSp5U/xGeglZ8H7tF6/G2owk/7blSgg3sqoGfP+0U=;
 b=XfucxVGlCFLr6R7XBt/7oM9ovqZLPk/HAiRvYXjtSUKwFf3KzqWT6NeY
 nkScAG5abmv7JCgE/VQ4uC/FnF3EKkSdg/XdIjnEMGOMNBG8HMkkCz9kV
 rQ0LQ8HVeaUQli1VCZn4ZD6IRShVpsyx4xpnMKxxksWQQ7cS0oarFsgui
 UeMj+W0i7+AEYJz9gQWhOF3BOW98uyzdwDPYb5SU5zUxTqH8Nxwd/8mvO
 WjYjxmvy5NfOG5k7+3rzRKIOUinAlFkxddnlAr4mhU9kTEzHQGNpdTGPU
 WrXJkUfC0aRszXL+oKB05tHqt0LWzifELIgVkb5RXozQ2ld+wlYS5GID9 g==;
X-CSE-ConnectionGUID: /maYcicdSs2nmbmhFrZHoA==
X-CSE-MsgGUID: 3Kty1d8WTcS4Kpy3ro5G7w==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="50576506"
X-IronPort-AV: E=Sophos;i="6.15,320,1739865600"; d="scan'208";a="50576506"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2025 22:24:56 -0700
X-CSE-ConnectionGUID: 43PRHqaxS/iGGHO6XHx9aA==
X-CSE-MsgGUID: 9VBCuzvETsG4GSy2PbL5cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,320,1739865600"; d="scan'208";a="142947801"
Received: from mev-dev.igk.intel.com ([10.237.112.144])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2025 22:24:50 -0700
Date: Wed, 28 May 2025 07:24:11 +0200
From: Michal Swiatkowski <michal.swiatkowski@linux.intel.com>
To: weishangjuan@eswincomputing.com
Message-ID: <aDad+8YHEFdOIs38@mev-dev.igk.intel.com>
References: <20250528041455.878-1-weishangjuan@eswincomputing.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250528041455.878-1-weishangjuan@eswincomputing.com>
Cc: vladimir.oltean@nxp.com, edumazet@google.com, jszhang@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, robh@kernel.org,
 ningyu@eswincomputing.com, 0x1207@gmail.com, lizhi2@eswincomputing.com,
 kuba@kernel.org, pabeni@redhat.com, devicetree@vger.kernel.org,
 conor+dt@kernel.org, mcoquelin.stm32@gmail.com, jan.petrous@oss.nxp.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com, rmk+kernel@armlinux.org.uk,
 yong.liang.choong@linux.intel.com, linux-arm-kernel@lists.infradead.org,
 linmin@eswincomputing.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch, boon.khai.ng@altera.com,
 p.zabel@pengutronix.de, inochiama@gmail.com, krzk+dt@kernel.org,
 davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH v2 0/2] Add driver support for Eswin
 eic7700 SoC ethernet controller
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

On Wed, May 28, 2025 at 12:14:42PM +0800, weishangjuan@eswincomputing.com wrote:
> From: Shangjuan Wei <weishangjuan@eswincomputing.com>
> 
> Updates:
> 
>   dt-bindings: ethernet: eswin: Document for EIC7700 SoC
>   v1 -> v2:
>     1. Remove the code related to PHY LED configuration from the MAC driver.
>     2. Use phylib instead of the GPIO API in the driver to implement the PHY reset function.
>     3. Align with the latest stmmac API, use the API provided by stmmac helper to refactor the driver,
>        and replace or remove duplicate code.
>     4. Adjust the code format and driver interfaces, such as replacing kzalloc with devm_kzalloc, etc.
> 
>   ethernet: eswin: Add eic7700 ethernet driver
>   v1 -> v2:
>     1. Significant errors have been corrected in the email reply for version v1.
>     2. Add snps,dwmac.
>     3. Chang the names of reset-names and phy-mode.
>     4. Add descriptions of eswin, hsp_sp_csr, eswin, syscrg.csr, eswin, dly_hsp.reg.
> 
>   Regarding the question about delay parameters in the previous email reply, the explanation is as follows:
>     Dly_hsp_reg: Configure the delay compensation register between MAC/PHY;
>     Dly_param_ *: The value written to the dly_hsp_reg register at a rate of 1000/100/10, which varies due 
>                   to the routing of the board;
> 
>   In addition, your bot found errors running 'make dt_binding_check' on our patch about yamllint warnings/errors,
>   it looks like the validation failure is because missing eswin entry in vendor-prefixes.yaml. 
>   When we run "make dt_binding_check", we get the same error. We have already added 'eswin' in the vendor-prefixes.yaml 
>   file before, and the code has mentioned the community, but you have not yet integrated it.

Usualy description is above the changelog. Please try to follow 72 line
length rule.

net-next is closed, you should resend it when open (after June 9th) [1]

[1] https://lore.kernel.org/netdev/20250527191710.7d94a61c@kernel.org/T/#m0bc90575288f5f1bcf5e50ecff59fb904b79505c

> 
> Shangjuan Wei (2):
>   dt-bindings: ethernet: eswin: Document for EIC7700 SoC
>   ethernet: eswin: Add eic7700 ethernet driver
> 
>  .../bindings/net/eswin,eic7700-eth.yaml       | 200 +++++++++
>  drivers/net/ethernet/stmicro/stmmac/Kconfig   |  11 +
>  drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
>  .../ethernet/stmicro/stmmac/dwmac-eic7700.c   | 410 ++++++++++++++++++
>  4 files changed, 622 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/eswin,eic7700-eth.yaml
>  create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-eic7700.c
> 
> -- 
> 2.17.1
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
