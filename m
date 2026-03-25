Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CBaAFjwTxGmfwAQAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 25 Mar 2026 17:54:20 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 986DB3296F4
	for <lists+linux-stm32@lfdr.de>; Wed, 25 Mar 2026 17:54:19 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 29095C8F261;
	Wed, 25 Mar 2026 16:54:19 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4B1CDC8F260
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Mar 2026 16:54:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id AA75740ADD;
 Wed, 25 Mar 2026 16:54:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49A05C4CEF7;
 Wed, 25 Mar 2026 16:54:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1774457655;
 bh=oMuUWLmoNITVcQzV/o3it6GVvrYLaH+S1Qr6U989rSY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qDB30oUW5a/3zO8cnh+u95v1NNfWmdGI2IjUhVXfyQO4SZA9TyoTDvTMqD+MHZCZB
 NbZtSa7ImOyDdMHoSkCtK7kMx2M9RnDL3kZd0WZAGqqSFNhJA4Vyj+bRdJUtT/WJ1+
 smzMbNGLEjkZHNkEwdIxqekKRq5iCdcpKCC+5KHh0JNGfGHt78pBcZNG2XZr+ZjCL8
 +pQPBWT2Qxf0S+D+n9gEGvUaIXjm0r1poXr0/YGLOZB2oBLm4MXdkhUtjKNkn3Qdqe
 uvMiMQG7Gvnj5hAOzCxfefchzrdYpSo9zodIbgOmf0vcfll+P9lh2ztHg9oF7j+3q5
 jVMvbkd5KgOww==
From: Simon Horman <horms@kernel.org>
To: bartosz.golaszewski@oss.qualcomm.com
Date: Wed, 25 Mar 2026 16:53:35 +0000
Message-ID: <20260325165335.326630-1-horms@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260323-qcom-sa8255p-emac-v10-6-79302b238a16@oss.qualcomm.com>
References: <20260323-qcom-sa8255p-emac-v10-6-79302b238a16@oss.qualcomm.com>
MIME-Version: 1.0
Cc: imx@lists.linux.dev, s32@nxp.com, geert+renesas@glider.be,
 rrendec@redhat.com, christophe.roullier@foss.st.com, edumazet@google.com,
 peppe.cavallaro@st.com, linux-riscv@lists.infradead.org, festevam@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, jbrunet@baylibre.com,
 robh@kernel.org, wens@kernel.org, romain.gantois@bootlin.com,
 khilman@baylibre.com, magnus.damm@gmail.com, jernej.skrabec@gmail.com,
 linux-rockchip@lists.infradead.org, kuba@kernel.org, pabeni@redhat.com,
 konradybcio@kernel.org, linux-sunxi@lists.linux.dev,
 devicetree@vger.kernel.org, conor+dt@kernel.org, mcoquelin.stm32@gmail.com,
 brgl@kernel.org, martin.blumenstingl@googlemail.com,
 linux-arm-msm@vger.kernel.org, jan.petrous@oss.nxp.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com, mripard@kernel.org,
 mohd.anwar@oss.qualcomm.com, sophgo@lists.linux.dev,
 linux-amlogic@lists.infradead.org, dfustini@tenstorrent.com,
 linux-arm-kernel@lists.infradead.org, konrad.dybcio@oss.qualcomm.com,
 neil.armstrong@linaro.org, krzysztof.kozlowski@oss.qualcomm.com,
 netdev@vger.kernel.org, andersson@kernel.org, bartosz.golaszewski@linaro.org,
 linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, andrew+netdev@lunn.ch, vkoul@kernel.org,
 Simon Horman <horms@kernel.org>, krzk+dt@kernel.org, shawnguo@kernel.org,
 davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH net-next v10 6/6] net: stmmac:
	qcom-ethqos: add support for sa8255p
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
X-Spamd-Result: default: False [5.79 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	MID_CONTAINS_FROM(1.00)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:bartosz.golaszewski@oss.qualcomm.com,m:imx@lists.linux.dev,m:s32@nxp.com,m:geert+renesas@glider.be,m:rrendec@redhat.com,m:christophe.roullier@foss.st.com,m:edumazet@google.com,m:peppe.cavallaro@st.com,m:linux-riscv@lists.infradead.org,m:festevam@gmail.com,m:linux-stm32@st-md-mailman.stormreply.com,m:jbrunet@baylibre.com,m:robh@kernel.org,m:wens@kernel.org,m:romain.gantois@bootlin.com,m:khilman@baylibre.com,m:magnus.damm@gmail.com,m:jernej.skrabec@gmail.com,m:linux-rockchip@lists.infradead.org,m:kuba@kernel.org,m:pabeni@redhat.com,m:konradybcio@kernel.org,m:linux-sunxi@lists.linux.dev,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:mcoquelin.stm32@gmail.com,m:brgl@kernel.org,m:martin.blumenstingl@googlemail.com,m:linux-arm-msm@vger.kernel.org,m:jan.petrous@oss.nxp.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:mripard@kernel.org,m:mohd.anwar@oss.qualcomm.com,m:sophgo@lists.linux.dev,m:linux-amlogic@lists.infradead.org,m:dfustini@tenstorrent.com,m:linux
 -arm-kernel@lists.infradead.org,m:konrad.dybcio@oss.qualcomm.com,m:neil.armstrong@linaro.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:netdev@vger.kernel.org,m:andersson@kernel.org,m:bartosz.golaszewski@linaro.org,m:linux-mips@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:andrew+netdev@lunn.ch,m:vkoul@kernel.org,m:horms@kernel.org,m:krzk+dt@kernel.org,m:shawnguo@kernel.org,m:davem@davemloft.net,m:geert@glider.be,m:magnusdamm@gmail.com,m:jernejskrabec@gmail.com,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,m:martinblumenstingl@gmail.com,m:andrew@lunn.ch,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[lists.linux.dev,nxp.com,glider.be,redhat.com,foss.st.com,google.com,st.com,lists.infradead.org,gmail.com,st-md-mailman.stormreply.com,baylibre.com,kernel.org,bootlin.com,vger.kernel.org,googlemail.com,oss.nxp.com,bp.renesas.com,oss.qualcomm.com,tenstorrent.com,linaro.org,lunn.ch,davemloft.net];
	FORGED_SENDER(0.00)[horms@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	TO_DN_SOME(0.00)[];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RCPT_COUNT_GT_50(0.00)[52];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[horms@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[kernel.org:-];
	NEURAL_HAM(-0.00)[-0.034];
	TAGGED_RCPT(0.00)[linux-stm32,renesas,dt,netdev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:url,stormreply.com:email,stormreply.com:url,st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: 986DB3296F4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This is an AI-generated review of your patch. The human sending this
email has considered the AI review valid, or at least plausible.

For local reproduction steps see https://netdev-ai.bots.linux.dev/ai-local.html
---
net: stmmac: qcom-ethqos: add support for sa8255p

Extend the driver to support a new model - sa8255p. Unlike the
previously supported variants, this one's power management is done in
the firmware using SCMI. This is modeled in linux using power domains so
add support for them.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> index f32ff0d9ce51..09ce80b446cb 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c

[ ... ]

> @@ -710,6 +785,45 @@ static int ethqos_mac_finish_serdes(struct net_device *ndev, void *priv,
>  	return ret;
>  }
>
> +static int ethqos_mac_finish_serdes_pd(struct net_device *ndev, void *priv,
> +				       unsigned int mode,
> +				       phy_interface_t interface)
> +{
> +	struct qcom_ethqos *ethqos = priv;
> +	struct device *dev = ethqos->pd.pd_list->pd_devs[ETHQOS_PD_SERDES];
> +	int ret = 0;
> +
> +	qcom_ethqos_set_sgmii_loopback(ethqos, false);
> +
> +	if (interface == PHY_INTERFACE_MODE_SGMII ||
> +	    interface == PHY_INTERFACE_MODE_2500BASEX)
> +		ret = dev_pm_opp_set_level(dev, ethqos->pd.serdes_level);
> +
> +	return ret;
> +}
> +
> +static int qcom_ethqos_pd_serdes_powerup(struct net_device *ndev, void *priv)
> +{
> +	struct qcom_ethqos *ethqos = priv;
> +	struct device *dev = ethqos->pd.pd_list->pd_devs[ETHQOS_PD_SERDES];
> +	int ret;
> +
> +	ret = qcom_ethqos_domain_on(ethqos, ETHQOS_PD_SERDES);
> +	if (ret < 0)
> +		return ret;
> +
> +	return dev_pm_opp_set_level(dev, ethqos->pd.serdes_level);
> +}

Does this leak the PM runtime reference if dev_pm_opp_set_level() fails?

qcom_ethqos_pd_serdes_powerup() calls qcom_ethqos_domain_on() which
acquires a PM runtime reference via pm_runtime_resume_and_get():

qcom_ethqos_pd_serdes_powerup()
  qcom_ethqos_domain_on()
    pm_runtime_resume_and_get(dev)

If the subsequent dev_pm_opp_set_level() fails, the function returns the
error without calling qcom_ethqos_domain_off() to release the reference.

The caller stmmac_legacy_serdes_power_up() in stmmac_main.c does not set
legacy_serdes_is_powered=true on error, so stmmac_legacy_serdes_power_down()
in the cleanup path skips the powerdown call.

In the existing non-PD code path, qcom_ethqos_serdes_powerup() correctly
handles this case by calling phy_exit() when phy_power_on() fails:

drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c:qcom_ethqos_serdes_powerup() {
	ret = phy_init(ethqos->pm.serdes_phy);
	if (ret)
		return ret;

	ret = phy_power_on(ethqos->pm.serdes_phy);
	if (ret) {
		phy_exit(ethqos->pm.serdes_phy);
		return ret;
	}
	...
}

Should qcom_ethqos_pd_serdes_powerup() call qcom_ethqos_domain_off()
before returning the error from dev_pm_opp_set_level()?

> +
> +static void qcom_ethqos_pd_serdes_powerdown(struct net_device *ndev, void *priv)
> +{
> +	struct qcom_ethqos *ethqos = priv;
> +	struct device *dev = ethqos->pd.pd_list->pd_devs[ETHQOS_PD_SERDES];
> +
> +	dev_pm_opp_set_level(dev, 0);
> +	qcom_ethqos_domain_off(ethqos, ETHQOS_PD_SERDES);
> +}

[ ... ]
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
