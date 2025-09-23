Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BB83B96D73
	for <lists+linux-stm32@lfdr.de>; Tue, 23 Sep 2025 18:33:52 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6C517C3089F;
	Tue, 23 Sep 2025 16:33:51 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3CAF0C3089D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 23 Sep 2025 16:33:50 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 8307C1A0EA4;
 Tue, 23 Sep 2025 16:33:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 4701860690;
 Tue, 23 Sep 2025 16:33:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D8CC2102F1960; 
 Tue, 23 Sep 2025 18:33:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1758645227; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=Nf6TbTTKpnL7mG5m//aAjoL13/cGP7KHINrrFH8p8l8=;
 b=IxSv1tFbbPL+umkvEM7djR6Yg3cz7Q2UpQOiuIDLVBOMNmPas+rqfuSPpYEwwmPnwbbhX7
 iyU8gRAEFEJxOGVjk8oFOFWqQuy193oS6ZkWZpkcspm4SOvyMGLSOcQiClfSkZGuzzMd/x
 mLJHUPoAEORo8qPGaXuGZD9o2RMTCUz/YiULpu35NKxe33xKoLQGEGmuntusBxIE+/PuAx
 bvmgZZ8PVFakA5zNOGZgzYYrnHournuWPnsbUmBuK43eReNjZ28U2VPgEmhK/7LSESXVZ/
 wngvVxssQbdW6trXKSOS0w4l66tKt7FP4VecgcIMU7IYm57HE55YXPI6spxjHw==
Message-ID: <bbcca781-9ac4-4eec-b3fb-ff4e01950127@bootlin.com>
Date: Tue, 23 Sep 2025 22:03:09 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: weishangjuan@eswincomputing.com, devicetree@vger.kernel.org,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 netdev@vger.kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, vladimir.oltean@nxp.com,
 rmk+kernel@armlinux.org.uk, yong.liang.choong@linux.intel.com,
 anthony.l.nguyen@intel.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 jan.petrous@oss.nxp.com, jszhang@kernel.org, inochiama@gmail.com,
 0x1207@gmail.com, boon.khai.ng@altera.com, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
References: <20250918085612.3176-1-weishangjuan@eswincomputing.com>
 <20250918090026.3280-1-weishangjuan@eswincomputing.com>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <20250918090026.3280-1-weishangjuan@eswincomputing.com>
X-Last-TLS-Session-Version: TLSv1.3
Cc: ningyu@eswincomputing.com, pinkesh.vaghela@einfochips.com,
 lizhi2@eswincomputing.com, linmin@eswincomputing.com
Subject: Re: [Linux-stm32] [PATCH v7 2/2] ethernet: eswin: Add eic7700
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Hi,

On 18/09/2025 14:30, weishangjuan@eswincomputing.com wrote:
> From: Shangjuan Wei <weishangjuan@eswincomputing.com>
> 
> Add Ethernet controller support for Eswin's eic7700 SoC. The driver
> implements hardware initialization, clock configuration, delay
> adjustment functions based on DWC Ethernet controller, and supports
> device tree configuration and platform driver integration.
> 
> Signed-off-by: Zhi Li <lizhi2@eswincomputing.com>
> Signed-off-by: Shangjuan Wei <weishangjuan@eswincomputing.com>
> ---
>   drivers/net/ethernet/stmicro/stmmac/Kconfig   |  11 +
>   drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
>   .../ethernet/stmicro/stmmac/dwmac-eic7700.c   | 230 ++++++++++++++++++
>   3 files changed, 242 insertions(+)
>   create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-eic7700.c
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/Kconfig b/drivers/net/ethernet/stmicro/stmmac/Kconfig
> index 67fa879b1e52..a13b15ce1abd 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/Kconfig
> +++ b/drivers/net/ethernet/stmicro/stmmac/Kconfig
> @@ -67,6 +67,17 @@ config DWMAC_ANARION
> 
>   	  This selects the Anarion SoC glue layer support for the stmmac driver.
> 
> +config DWMAC_EIC7700
> +	tristate "Support for Eswin eic7700 ethernet driver"
> +	select CRC32
> +	select MII

Seems like CRC32 and MII are already selected by STMMAC_ETH. I guess 
this is inspired by CONFIG_DWMAC_DWC_QOS_ETH that also seems to have 
these unnecessary dependencies.

Maxime

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
