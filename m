Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2161976246E
	for <lists+linux-stm32@lfdr.de>; Tue, 25 Jul 2023 23:30:17 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DE4F7C6A61A;
	Tue, 25 Jul 2023 21:30:16 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0A99BC65E4C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Jul 2023 21:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1690320614;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uK3zP8luGfpdcnVrRakVsTeHLiN3hIMl3KOmXd3egZQ=;
 b=Gkjb/RxpS3iHEriRdpkhyhtbdHv+fc5HJpCcaqbBy0FW4sqhEQ0AmFSEPWCLGydelkh2oP
 nmk+gAwLI2BT5+9J0CtBfmVVe5AmkjYNMR884/Oh6yYMnDKwSVDtjldhb9o5odqZoPvGQ4
 Gs0OszQm1o7FpVTPZZpZcXXcdg9EBJ4=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-1-uO_l5sD3NxykG27huBkkPQ-1; Tue, 25 Jul 2023 17:30:12 -0400
X-MC-Unique: uO_l5sD3NxykG27huBkkPQ-1
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7682705c039so809767885a.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Jul 2023 14:30:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690320612; x=1690925412;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uK3zP8luGfpdcnVrRakVsTeHLiN3hIMl3KOmXd3egZQ=;
 b=f/6bVGH8z52FQ4JfZv8nAG96ujhHXKO0xitJ5gjLm9CJdqX22hYU9AXPGAsK6hro3c
 5I3eepkmt4TtF7AZXvJqm484U59ubjFB7H0yuEa1THfP+sZqdrhIuwwwtd7GGItRamk5
 Bayo1JgsMFMqMpfsn7EljF2h9Hw7ZRg97XVHfTX0nqh9TLhOS04osCzPQyATHSRDNckE
 20UGOWGhfh8yDXV2KOxrcHGptFgZT4rtmIQwd4Cna5CAq+7Q1HaC8KFV97xIb2HI060C
 6rFEAWV6jEfS4uyHREASEkL6X1ZJwQN+J/3eJyOKFkMbKaECENV3fSHAKYqH2vQiTuwA
 vlkQ==
X-Gm-Message-State: ABy/qLbJ9Wp/4OHkz7jctMC8ew0DZuPW3NL2jzYQopt0OyS/sISiiSAh
 iWcdF/YOvcKzugHfexDjsTDmBzBaTZSBtpV+B5TyffGLSmz4aXntbI+rJvPJUCX78ExMIJRahbX
 f5uwSx5ZbafxZVBpgDd8axsvNxNx7BoX26ukV+tQz
X-Received: by 2002:a05:620a:2545:b0:768:156e:41b8 with SMTP id
 s5-20020a05620a254500b00768156e41b8mr171371qko.56.1690320612188; 
 Tue, 25 Jul 2023 14:30:12 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFed3Kq4JhRY5nCg9QF+L66gABirAe874NXCX9weK6QU/6x4lyMcM2Gcjb9IOg9DiukLElQKA==
X-Received: by 2002:a05:620a:2545:b0:768:156e:41b8 with SMTP id
 s5-20020a05620a254500b00768156e41b8mr171347qko.56.1690320611986; 
 Tue, 25 Jul 2023 14:30:11 -0700 (PDT)
Received: from fedora.redhat.com ([2600:1700:1ff0:d0e0::17])
 by smtp.gmail.com with ESMTPSA id
 j3-20020a37c243000000b00767d7307490sm3943067qkm.34.2023.07.25.14.30.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jul 2023 14:30:11 -0700 (PDT)
From: Andrew Halaney <ahalaney@redhat.com>
To: linux-kernel@vger.kernel.org
Date: Tue, 25 Jul 2023 16:04:25 -0500
Message-ID: <20230725211853.895832-3-ahalaney@redhat.com>
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
Subject: [Linux-stm32] [PATCH net-next v2 1/2] net: stmmac: Make
	ptp_clk_freq_config variable type explicit
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

The priv variable is _always_ of type (struct stmmac_priv *), so let's
stop using (void *) since it isn't abstracting anything.

Reviewed-by: Simon Horman <simon.horman@corigine.com>
Signed-off-by: Andrew Halaney <ahalaney@redhat.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c | 3 +--
 include/linux/stmmac.h                            | 4 +++-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
index 0ffae785d8bd..979c755964b1 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
@@ -257,9 +257,8 @@ static void intel_speed_mode_2500(struct net_device *ndev, void *intel_data)
 /* Program PTP Clock Frequency for different variant of
  * Intel mGBE that has slightly different GPO mapping
  */
-static void intel_mgbe_ptp_clk_freq_config(void *npriv)
+static void intel_mgbe_ptp_clk_freq_config(struct stmmac_priv *priv)
 {
-	struct stmmac_priv *priv = (struct stmmac_priv *)npriv;
 	struct intel_priv_data *intel_priv;
 	u32 gpio_value;
 
diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
index ef67dba775d0..3d0702510224 100644
--- a/include/linux/stmmac.h
+++ b/include/linux/stmmac.h
@@ -76,6 +76,8 @@
 			| DMA_AXI_BLEN_32 | DMA_AXI_BLEN_64 \
 			| DMA_AXI_BLEN_128 | DMA_AXI_BLEN_256)
 
+struct stmmac_priv;
+
 /* Platfrom data for platform device structure's platform_data field */
 
 struct stmmac_mdio_bus_data {
@@ -258,7 +260,7 @@ struct plat_stmmacenet_data {
 	int (*serdes_powerup)(struct net_device *ndev, void *priv);
 	void (*serdes_powerdown)(struct net_device *ndev, void *priv);
 	void (*speed_mode_2500)(struct net_device *ndev, void *priv);
-	void (*ptp_clk_freq_config)(void *priv);
+	void (*ptp_clk_freq_config)(struct stmmac_priv *priv);
 	int (*init)(struct platform_device *pdev, void *priv);
 	void (*exit)(struct platform_device *pdev, void *priv);
 	struct mac_device_info *(*setup)(void *priv);
-- 
2.41.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
