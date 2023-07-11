Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F4A474F96C
	for <lists+linux-stm32@lfdr.de>; Tue, 11 Jul 2023 22:58:20 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3431CC6B459;
	Tue, 11 Jul 2023 20:58:20 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EB874C6B44C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Jul 2023 20:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689109097;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jiBOM1KuLZEvS0bvIGnIKQCXCP0aV2NwdEa0u2AGH3g=;
 b=AWCIC7iZgMM4gxSEo5JVuLBoF8kebLFYBbML5+nUKK5KWCAtbSMMPO2a5EDFZBtCuNU2b6
 Y5JTe9DdEHg9RGM08GmFYY8d32yciMsYaNZNk9fThrzeJJq6Hdzf+8rIJ9zlqOVpZq0+Hv
 8lTIsCgv0MtrZA7cAAbd/M9ABTpWrYI=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-459-JRsAMSEgNZWWsWuyC8TQSw-1; Tue, 11 Jul 2023 16:58:16 -0400
X-MC-Unique: JRsAMSEgNZWWsWuyC8TQSw-1
Received: by mail-yw1-f199.google.com with SMTP id
 00721157ae682-56cf9a86277so68892747b3.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Jul 2023 13:58:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689109095; x=1691701095;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jiBOM1KuLZEvS0bvIGnIKQCXCP0aV2NwdEa0u2AGH3g=;
 b=Ba733PNq2J6LakmScT5Tk7HdaPytexCmOyR8NaNztRK05SW2URd/d1MEM2Uw35hogL
 ebwvnk2tubPOaKOALJlvkMbPG8k86Y2YIkFiIq1fyvsW4fToWOoCxS85HA09wQHopALK
 28i6WUWXJpspsthvknD86DSuN/4ocJEbj1Vc/e3TbyjhvThrFYHXv0OCbTXtsP/hj0Nt
 yXvsM/IQDMAgYbTMVXdTbHqQWhuAzaBUifngt8iJrbVr1iwvr6A3UDGpINPJ1+vABDx4
 DXdnO5Hmk64zRMDwzoz2WIbSH9ccoGpdb5brmG8v6vidQx8A8fTGyT5/cZmSqaUE/2zk
 DX4w==
X-Gm-Message-State: ABy/qLblWZdTVBeXGuPh82CBTkcMU//yjM5Z2cBNHYO0K88ydOzx1fPL
 /pgCnpmaE2AkbJeIO8ddBsHjIFBTWOeH9B8Qk9kDRv+WKxmm7S5YoxROQQzCA4xqyRQYQArtFcv
 dZaS9zWy+yi5AwDQNVhR8CgudXHRvv0OkqPxBUr4S
X-Received: by 2002:a0d:dd0f:0:b0:55a:3ce9:dc3d with SMTP id
 g15-20020a0ddd0f000000b0055a3ce9dc3dmr16784162ywe.13.1689109095599; 
 Tue, 11 Jul 2023 13:58:15 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGMM6rSAUBx2gHMgpN1hCMMVYXQ4ts3fvOEU1AYs0oR+Y47D9PvRxELDW1bK1hOX+hNQmSRfQ==
X-Received: by 2002:a0d:dd0f:0:b0:55a:3ce9:dc3d with SMTP id
 g15-20020a0ddd0f000000b0055a3ce9dc3dmr16784156ywe.13.1689109095299; 
 Tue, 11 Jul 2023 13:58:15 -0700 (PDT)
Received: from halaney-x13s.attlocal.net ([2600:1700:1ff0:d0e0::22])
 by smtp.gmail.com with ESMTPSA id
 j136-20020a81928e000000b00545a08184cesm785353ywg.94.2023.07.11.13.58.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jul 2023 13:58:14 -0700 (PDT)
From: Andrew Halaney <ahalaney@redhat.com>
To: linux-kernel@vger.kernel.org
Date: Tue, 11 Jul 2023 15:35:31 -0500
Message-ID: <20230711205732.364954-3-ahalaney@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230711205732.364954-1-ahalaney@redhat.com>
References: <20230711205732.364954-1-ahalaney@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: vkoul@kernel.org, bhupesh.sharma@linaro.org, netdev@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, jsuraj@qti.qualcomm.com, davem@davemloft.net,
 edumazet@google.com, joabreu@synopsys.com, mcoquelin.stm32@gmail.com,
 peppe.cavallaro@st.com, kuba@kernel.org, pabeni@redhat.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Andrew Halaney <ahalaney@redhat.com>
Subject: [Linux-stm32] [PATCH RFC/RFT net-next 2/3] net: stmmac:
	dwmac-qcom-ethqos: Use max frequency for clk_ptp_ref
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

Qualcomm clocks can set their frequency to a variety of levels
generally. Let's use the max for clk_ptp_ref to ensure the best
timestamping resolution possible.

Without this, the default value of the clock is used. For sa8775p-ride
this is 19.2 MHz, far less than the 230.4 MHz possible.

Signed-off-by: Andrew Halaney <ahalaney@redhat.com>
---
 .../stmicro/stmmac/dwmac-qcom-ethqos.c         | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 757504ebb676..f9e7440520fa 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -694,6 +694,23 @@ static void ethqos_clks_disable(void *data)
 	ethqos_clks_config(data, false);
 }
 
+static void ethqos_ptp_clk_freq_config(struct stmmac_priv *priv)
+{
+	struct plat_stmmacenet_data *plat_dat = priv->plat;
+	int err;
+
+	if (!plat_dat->clk_ptp_ref)
+		return;
+
+	/* Max the PTP ref clock out to get the best resolution possible */
+	err = clk_set_rate(plat_dat->clk_ptp_ref, ULONG_MAX);
+	if (err)
+		netdev_err(priv->dev, "Failed to max out clk_ptp_ref: %d\n", err);
+	plat_dat->clk_ptp_rate = clk_get_rate(plat_dat->clk_ptp_ref);
+
+	netdev_dbg(priv->dev, "PTP rate %d\n", plat_dat->clk_ptp_rate);
+}
+
 static int qcom_ethqos_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
@@ -779,6 +796,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	plat_dat->bsp_priv = ethqos;
 	plat_dat->fix_mac_speed = ethqos_fix_mac_speed;
 	plat_dat->dump_debug_regs = rgmii_dump;
+	plat_dat->ptp_clk_freq_config = ethqos_ptp_clk_freq_config;
 	plat_dat->has_gmac4 = 1;
 	if (ethqos->has_emac_ge_3)
 		plat_dat->dwmac4_addrs = &data->dwmac4_addrs;
-- 
2.41.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
