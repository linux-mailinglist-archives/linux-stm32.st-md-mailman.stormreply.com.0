Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 478AA76246F
	for <lists+linux-stm32@lfdr.de>; Tue, 25 Jul 2023 23:30:26 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0569CC6A61A;
	Tue, 25 Jul 2023 21:30:26 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C23C7C65E4C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Jul 2023 21:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1690320623;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M6R5PqHz89a5dYS6wq5jIGBjMTrYBr/afZbcaHTTyIA=;
 b=F0RQqs6vBWayEefcDpLTe3YUMiP6Rqc8UUht7x7qNwi3NXxQpRwB+NP+jLewqJCsbvd/1p
 ya1KvXnbb1J7SJz2bunVsvxc7i3DZGoIuDIY/CgJ6sw1nbMk+OVZL/ooVWwPdk6+PXWmgg
 7aAU+BRNRyywcdeAeRPGYSpsHEXUnfU=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-587-q-72E5-RPACb3fcPM_PNYQ-1; Tue, 25 Jul 2023 17:30:21 -0400
X-MC-Unique: q-72E5-RPACb3fcPM_PNYQ-1
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7683cdabcb7so808413985a.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Jul 2023 14:30:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690320621; x=1690925421;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=M6R5PqHz89a5dYS6wq5jIGBjMTrYBr/afZbcaHTTyIA=;
 b=O2m5t0I6+I7IoZcvETmDEsQzSACrNIVdgaqCCvgITNftwIOtyGFrvy7jaslAEYuoTD
 LpM9aGY/EeEqsydgLfVziQmL0BphWEA/Akyv084dA5PSHYYCgBWU7nPxBgB6EaSAOOMR
 KiDqu6EntVtse7JRODedllSK7bvbMyfdWpgFiuBCsYdam6m8m6W/dJSvZ/QuZzAm5+sE
 XUYfCo+HOqk9x+ijiAp8Tw69DY6E2fx0rpjWdMpFLoNS3kvSmE7Q9bO0ksAjIglRB0aX
 h5dw0mwlYUtns4/A862vTlO8jXN6G/3gcRGOAbNO7EbNBZ6ftA/GQ9FGEZUZ+Hg73piX
 wZkw==
X-Gm-Message-State: ABy/qLZpg6xteQkQjUI4+IbDuvoQA6AJ9T7q4H2Tr3zxe2PfQsgiHVu1
 +Xe+kH5r9GG3yIewXJIIefvWIVWa2572WQOVsSIGRMRjHinE16zhGTmoHUJKLpwwbdQbA5BpFUr
 6Mlyzuj1y/0xNVGu5S7lNzJiqRrZwCb9vtOCW5at5
X-Received: by 2002:a05:620a:2545:b0:768:156e:41b8 with SMTP id
 s5-20020a05620a254500b00768156e41b8mr171812qko.56.1690320621300; 
 Tue, 25 Jul 2023 14:30:21 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEXEDMipNpnjboiVX9tymuPzO29w0eF8hLR09Ab5g7ZDyLrlEARGaZBlmf5qh4U8wb5xzUttQ==
X-Received: by 2002:a05:620a:2545:b0:768:156e:41b8 with SMTP id
 s5-20020a05620a254500b00768156e41b8mr171797qko.56.1690320620999; 
 Tue, 25 Jul 2023 14:30:20 -0700 (PDT)
Received: from fedora.redhat.com ([2600:1700:1ff0:d0e0::17])
 by smtp.gmail.com with ESMTPSA id
 j3-20020a37c243000000b00767d7307490sm3943067qkm.34.2023.07.25.14.30.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jul 2023 14:30:20 -0700 (PDT)
From: Andrew Halaney <ahalaney@redhat.com>
To: linux-kernel@vger.kernel.org
Date: Tue, 25 Jul 2023 16:04:26 -0500
Message-ID: <20230725211853.895832-4-ahalaney@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230725211853.895832-2-ahalaney@redhat.com>
References: <20230725211853.895832-2-ahalaney@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: vkoul@kernel.org, bhupesh.sharma@linaro.org, netdev@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, jsuraj@qti.qualcomm.com, davem@davemloft.net,
 edumazet@google.com, joabreu@synopsys.com, mcoquelin.stm32@gmail.com,
 peppe.cavallaro@st.com, Simon Horman <simon.horman@corigine.com>,
 kuba@kernel.org, pabeni@redhat.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, ahalaney@redhat.com
Subject: [Linux-stm32] [PATCH net-next v2 2/2] net: stmmac:
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

Reviewed-by: Simon Horman <simon.horman@corigine.com>
Signed-off-by: Andrew Halaney <ahalaney@redhat.com>
---
 .../stmicro/stmmac/dwmac-qcom-ethqos.c         | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 735525ba8b93..a85501874801 100644
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
