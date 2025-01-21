Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AEA9A17EAE
	for <lists+linux-stm32@lfdr.de>; Tue, 21 Jan 2025 14:17:44 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A7010C01E99;
	Tue, 21 Jan 2025 13:17:44 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EAEA6CFAC50
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Jan 2025 13:17:37 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E8AAC1C000E;
 Tue, 21 Jan 2025 13:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1737465457;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lE9ukk/VXHGDjSc+qLMUCRMXuWtuucO2/B4Z5t1Tgpo=;
 b=TNTNMZF5Pn/+YxXwDMkaY1a81PhSSuG7MtXztSCFNzqqQHsvhdOQpIO5LUuBNfsxlOfeVn
 3dvxnNhdreayztRnkQGdLI4ysUmHCsNv48m4haAWOwMxN4lagRYlL0YV02nogWy/xrjVwd
 oklk8cLfd+a88IkulEjOXXDOlXnr+Pl0Y0KQLDiAOYCs7WMik0wMwt5+/2DX0GBz2ZiCVS
 2sLpiqz00K7VnaI7yhZa3hP6QTEvS/F5NvyD6PDYBLkIMO2syadr5pX0ABAFSHezMj93Fm
 1k9jgaAqfG/pXm1wCu2aDaO5IJZTRoLa3w1tOqhF0fATo7JxqWinB8YIcNEcUA==
Date: Tue, 21 Jan 2025 14:17:34 +0100
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Yijie Yang <quic_yijiyang@quicinc.com>
Message-ID: <20250121141734.164ef891@device-291.home>
In-Reply-To: <20250121-dts_qcs615-v3-2-fa4496950d8a@quicinc.com>
References: <20250121-dts_qcs615-v3-0-fa4496950d8a@quicinc.com>
 <20250121-dts_qcs615-v3-2-fa4496950d8a@quicinc.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: maxime.chevallier@bootlin.com
Cc: Richard Cochran <richardcochran@gmail.com>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 netdev@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, Vinod Koul <vkoul@kernel.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-arm-msm@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Konrad Dybcio <konradybcio@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v3 2/4] net: stmmac: dwmac-qcom-ethqos:
 Mask PHY mode if configured with rgmii-id
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

Hi,

On Tue, 21 Jan 2025 15:54:54 +0800
Yijie Yang <quic_yijiyang@quicinc.com> wrote:

> The Qualcomm board always chooses the MAC to provide the delay instead of
> the PHY, which is completely opposite to the suggestion of the Linux
> kernel. The usage of phy-mode in legacy DTS was also incorrect. Change the
> phy_mode passed from the DTS to the driver from PHY_INTERFACE_MODE_RGMII_ID
> to PHY_INTERFACE_MODE_RGMII to ensure correct operation and adherence to
> the definition.
> To address the ABI compatibility issue between the kernel and DTS caused by
> this change, handle the compatible string 'qcom,qcs404-evb-4000' in the
> code, as it is the only legacy board that mistakenly uses the 'rgmii'
> phy-mode.
> 
> Signed-off-by: Yijie Yang <quic_yijiyang@quicinc.com>
> ---
>  .../net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 18 +++++++++++++-----
>  1 file changed, 13 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> index 2a5b38723635b5ef9233ca4709e99dd5ddf06b77..e228a62723e221d58d8c4f104109e0dcf682d06d 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> @@ -401,14 +401,11 @@ static int ethqos_dll_configure(struct qcom_ethqos *ethqos)
>  static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos)
>  {
>  	struct device *dev = &ethqos->pdev->dev;
> -	int phase_shift;
> +	int phase_shift = 0;
>  	int loopback;
>  
>  	/* Determine if the PHY adds a 2 ns TX delay or the MAC handles it */
> -	if (ethqos->phy_mode == PHY_INTERFACE_MODE_RGMII_ID ||
> -	    ethqos->phy_mode == PHY_INTERFACE_MODE_RGMII_TXID)
> -		phase_shift = 0;
> -	else
> +	if (ethqos->phy_mode == PHY_INTERFACE_MODE_RGMII_ID)
>  		phase_shift = RGMII_CONFIG2_TX_CLK_PHASE_SHIFT_EN;

So this looks like a driver modification to deal with errors in
devicetree, and these modifications don't seem to be correct.

You should set RGMII_CONFIG2_TX_CLK_PHASE_SHIFT_EN (i.e. adding a delay
n the TX line) when the PHY does not add internal delays on that line
(so, when the mode is rgmii or rgmii-rxid. The previous logic looks
correct in that regard.

Can you elaborate a bit more on the issue you are seeing ? On what
hardware is this happening ? What's the RGMII setup used (i.e. which
PHY, which mode, is there any delay lines on the PCB ?)

Thanks,

Maxime
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
