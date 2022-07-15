Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B0CB3576097
	for <lists+linux-stm32@lfdr.de>; Fri, 15 Jul 2022 13:34:39 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 52CD2C0D2BF;
	Fri, 15 Jul 2022 11:34:39 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B23C1C06F81
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 Jul 2022 11:34:38 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 55C48622A6;
 Fri, 15 Jul 2022 11:34:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4282FC34115;
 Fri, 15 Jul 2022 11:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657884876;
 bh=Gg9+rPfHnCv/g2fost5hnrWOOpgML/L64l2+FxYBMRw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=THwnBxzRcyhE5VjGQQ7K+awANTYSKYvRRM9ifEdfOuZodd71H0lp3za4HTl+knLYw
 6d8NT/IiX2NordgRXumj9xX+l0Epp/IMzjXKEoD7P0eEQkxdLKOCiyTvSGdPyZoojh
 I3AzD6EgHENSsnCbDILyDaNVSYaSN18ushW0aDFbQB5wosG7T4VjtJ+5ldv5dL5Dr2
 K0HRRpLGohWxC0sBwjLUIHQ8ttw5DopSeCdIBEy8yBnQxhQq+iYx42j3dIJCG0mC/u
 8FU3inju9RKI39rRUGH1dbZE9aEhyCGj5jiq+DVQqU4lEgIiKS/yN06aUf7Miywe+3
 XLXJ6rOoG5MZQ==
Date: Fri, 15 Jul 2022 17:04:32 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Message-ID: <YtFQyBCc2IRXOptK@matsya>
References: <20220713133953.595134-1-fabrice.gasnier@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220713133953.595134-1-fabrice.gasnier@foss.st.com>
Cc: linux-kernel@vger.kernel.org, kishon@ti.com, linux-phy@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] phy: stm32: fix error return in
	stm32_usbphyc_phy_init
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

On 13-07-22, 15:39, Fabrice Gasnier wrote:
> Error code is overridden, in case the PLL doesn't lock. So, the USB
> initialization can continue. This leads to a platform freeze.
> This can be avoided by returning proper error code to avoid USB probe
> freezing the platform. It also displays proper errors in log.

Applied, thanks

-- 
~Vinod
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
