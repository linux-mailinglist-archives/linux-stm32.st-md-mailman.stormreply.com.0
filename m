Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E8F52AB9EA3
	for <lists+linux-stm32@lfdr.de>; Fri, 16 May 2025 16:32:20 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A22A2C7A840;
	Fri, 16 May 2025 14:32:20 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3DBA6C7A829
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 16 May 2025 14:32:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id C30AE436F1;
 Fri, 16 May 2025 14:32:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4DFCC4CEE4;
 Fri, 16 May 2025 14:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747405938;
 bh=E61O55q6UktoNqtIVZI86pVw7KFKbc5kPfAwhVWnqpo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=RWTIhTi1MNaNFwp7zWk7ELiRpUFWnDwGbP29IoJF3McVx/FS5/ZPlas/gGFEKluBU
 CvrWyZP6eKDTR0gzdXgeLxRs7fPRuLdXv7VrKiCDLKzenjgC5RbU5BAnGxt2MnhVvS
 zagHmUmi82y54v+FZAySqjsgcXXf8EYExOXj/LCt6CAShrbnlhU/bq6Xb4IpO2N8tE
 V+FC/C+rzgKaNIoYEaQ/Bpb98yJRfW1QSzYCbtQaATLp2E6iKtTcDu346He/bBknju
 ANuLxdYuiPFXlq3EgX2lB2myUyjll+2FebCSr2WaMpfitg59e0eb2HiVYiDzxm7tOI
 d1nRfNd/tAYlA==
Date: Fri, 16 May 2025 07:32:17 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: weishangjuan@eswincomputing.com
Message-ID: <20250516073217.115fc170@kernel.org>
In-Reply-To: <20250516011130.818-1-weishangjuan@eswincomputing.com>
References: <20250516010849.784-1-weishangjuan@eswincomputing.com>
 <20250516011130.818-1-weishangjuan@eswincomputing.com>
MIME-Version: 1.0
Cc: edumazet@google.com, jszhang@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, robh@kernel.org,
 ningyu@eswincomputing.com, 0x1207@gmail.com, lizhi2@eswincomputing.com,
 pabeni@redhat.com, devicetree@vger.kernel.org, conor+dt@kernel.org,
 mcoquelin.stm32@gmail.com, richardcochran@gmail.com, jan.petrous@oss.nxp.com,
 rmk+kernel@armlinux.org.uk, yong.liang.choong@linux.intel.com,
 dfustini@tenstorrent.com, linux-arm-kernel@lists.infradead.org,
 linmin@eswincomputing.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch, p.zabel@pengutronix.de,
 inochiama@gmail.com, krzk+dt@kernel.org, davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH v1 2/2] ethernet: eswin: Add eic7700
	ethernet driver
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

On Fri, 16 May 2025 09:11:28 +0800 weishangjuan@eswincomputing.com
wrote:
> +	dwc_priv->clk_tx = devm_clk_get(&pdev->dev, "tx");
> +	if (IS_ERR(plat_dat->pclk)) {

you're checking the wrong pointer here

> +		dev_err(&pdev->dev, "tx clock not found.\n");
> +		return PTR_ERR(dwc_priv->clk_tx);
-- 
pw-bot: cr
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
