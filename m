Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5408F84604C
	for <lists+linux-stm32@lfdr.de>; Thu,  1 Feb 2024 19:49:21 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1D23EC71280;
	Thu,  1 Feb 2024 18:49:21 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A8BB2C6DD68
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  1 Feb 2024 18:49:19 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id
 4fb4d7f45d1cf-55f2b0c5ae9so1701369a12.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 01 Feb 2024 10:49:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706813359; x=1707418159;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=CP10ASwjzq21gj6cHPQz3XuKiRelwR6OnJvv0UFbQiI=;
 b=XLfq0K3MDck8RC+0Q7t/g96XMp/cMPfIrul9eg6pnIkQU0sPBdlBjdyNrsCeujCpte
 BaX832PpXY2WjaIftR4HDLnDQbIvp39+rUHKOzDbh5haPr5ZgENjiYRKqzhJ1z6uePKe
 8SuQVQ7AX0Rd6S0uZ+irZttm0SO/rD6LlLFmBiSpYGvqj2VsJn59h5FYzQK+IKdP2Svy
 II7VmKY/tXP9tKbjohFxKfyZSduF87B+Az2heT1o2COVLVVwPa00Q33mYt+3jI7yF+Zm
 iOdPLVENDcfU6drXpFthxxrGxnMDSQXWc03kANGY+RlYjm24a40XWuNay9YOMD59Uw6U
 8yTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706813359; x=1707418159;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CP10ASwjzq21gj6cHPQz3XuKiRelwR6OnJvv0UFbQiI=;
 b=XO6Y0bYvQ55Pa8kEn14KrgNL0cBB/l16NSTOe1vvJ18ssHVZLq8dTjoDISbglW4Vim
 C73QliLGIJG/YYisrOgU5V6KquD7cQDEMqE8rVQuBGUSwkLu8k3idJaae0pwont5o0XJ
 lAKKAIgXKKI0nUJPtFo+ca6d0cinKLTfysb1aDHbnUubajJbgVimaOCujKa5RrlFd/if
 gihKoO+rnrp0JDuvgHcqFe8IhBiqYIduURNW7qoCEQPKCtEFh3EfN48qoXqtYMlKdeXu
 8Xb/NfkG/qe4VL7M9O2sW5vZebZQ/hdk/Iwa1xWnqi7AEUf1kvdhVD0Kw3FC8d0m3CzQ
 7Z7w==
X-Gm-Message-State: AOJu0YyeUmXaJToUXAiEzP4b1wNBOd7WR6toW3rrKhYtsghcS0KmwVjt
 PMehKywsa70BNjX+7t6A5a2wTUf+dy+ViPzAcYieXyIux01SHTVQ
X-Google-Smtp-Source: AGHT+IFKlOu8htL+VeocZQsCqcN2H5lOEv7UpM8fH+qAO6/+jfphQEQwjVFyg6IbQ9oupKKzRN2jWw==
X-Received: by 2002:aa7:d70b:0:b0:55f:caa3:f7c6 with SMTP id
 t11-20020aa7d70b000000b0055fcaa3f7c6mr1331654edq.31.1706813359117; 
 Thu, 01 Feb 2024 10:49:19 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCXbOS/rwccwJDrMvw00+Ow/75KWAzVeEtF8qq2WRWPm6ayDE121p8dbC3RHPHu9tOWrBYelgUWK4aTwC7J1FAzb9+KSW+tHWj6wtsbPG5QpiGXFAVp9gu0NItSxirPMXd+wWZK2owMbKeG8lbel2uXljcp7iziPhebh6QeBA9+P4HrdChU0ZKZNVIHTmcaAsulFx9dQlOW1KoJCEDLoZ9wZUcpZHWH46zoXisLtVBelrQMeGZzPsEmXoVzS7SeOBu02xZuvjc3AnA6xLOh1o3f+NSZ+wGiK1qWIoKM5qaTsO/5PO2LMpGplTh45gaqd/4cquHQ/sTWJjE2cfatRGAiP7QWontk2rXqDxJ9ZTBcI3I57X84iMHE8+QSvxIVVwizyfajFO5eSqy8ED//VogzugA==
Received: from localhost
 (p200300e41f147f00f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f14:7f00:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 g23-20020a50ee17000000b0055971af7a23sm75332eds.95.2024.02.01.10.49.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Feb 2024 10:49:18 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
Date: Thu, 01 Feb 2024 19:49:07 +0100
MIME-Version: 1.0
Message-Id: <20240201-stmmac-axi-config-v1-3-822e97b2d26e@nvidia.com>
References: <20240201-stmmac-axi-config-v1-0-822e97b2d26e@nvidia.com>
In-Reply-To: <20240201-stmmac-axi-config-v1-0-822e97b2d26e@nvidia.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1341; i=treding@nvidia.com;
 h=from:subject:message-id; bh=NJ6QmQ9rSuyu2yILzTMeD+XilmAw5wEYJDPvDZo2/VA=;
 b=owEBbQKS/ZANAwAIAd0jrNd/PrOhAcsmYgBlu+ep1zJWpEM8HRzktM8KpsERNnutRk7N84dvz
 K2El6DKvMuJAjMEAAEIAB0WIQSI6sMIAUnM98CNyJ/dI6zXfz6zoQUCZbvnqQAKCRDdI6zXfz6z
 ofTjD/9vqkLXf0KsRrAGJFdVsvmQwB4UULEK0xMOneRYgY1j7/xcxTaqvOZfJ81Z9hxI/U7CDRx
 XvwAIYUqbi66duOyf/viRcLGYwAWCsFdn8zvMgsM004MjLki6BhICcLabpaXoYQSwC9QtKWV4Qp
 JIHve3g6rlXez1V4SLhClwwXJRsw7iyHTeiVc9SYVEapCIaZmEJpgLNZqgQxgP/uxME4k6wwNS3
 6Zkon2xpBLVxxdw5dRRUVdWdw56JT1Xh229MaoLARsWUtaJmjpC0HSK1EBfHLzsV3fN9O58Dq9u
 0xVzUsOkHlvhUVPvqbJEgpzrjHaL3w4mfkpFxoDfP7qUnJKYZbFwKwl7sko4NgeYz/SQ+fiNXh1
 dIPA1FXHrHq6NyeO9/3MwKkuTiTWS1vpDhUbTXQUFzeCyFmakx9uk63lrM7fe2v3zSxmNGCBtyx
 TW3atIO720/GQc7okk8LM0MXlpg+UPEJYtQp7/G+6SludKy6yLf7v1gz8ovrQdfc0aeu8YaYahh
 +Uq35mjGpOTsDo7sYM+eONXk5zGkCaoNZCvleBvCaLJIkQvm+g1/3wJ8LeBjXNidPSGfBMsyxM+
 B7ePsc1guQNfMU1CjQITNzqu4fV/Hj5fepo+1mQmnsYmAjK/0ZA2hASSBW9cQ0GPsyxNSr6zXNX
 kCD605YF4Kg+Uig==
X-Developer-Key: i=treding@nvidia.com; a=openpgp;
 fpr=88EAC3080149CCF7C08DC89FDD23ACD77F3EB3A1
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-tegra@vger.kernel.org, Thierry Reding <treding@nvidia.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 3/3] net: stmmac: Configure AXI on
	Tegra234 MGBE
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

From: Thierry Reding <treding@nvidia.com>

Allow the device to use bursts and increase the maximum number of
outstanding requests to improve performance. Measurements show an
increase in throughput of around 5x on a 1 Gbps link.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-tegra.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-tegra.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-tegra.c
index bab57d1675df..b6bfa48f279d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-tegra.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-tegra.c
@@ -199,6 +199,12 @@ static void mgbe_uphy_lane_bringup_serdes_down(struct net_device *ndev, void *mg
 	writel(value, mgbe->xpcs + XPCS_WRAP_UPHY_RX_CONTROL);
 }
 
+static const struct stmmac_axi tegra234_mgbe_axi = {
+	.axi_wr_osr_lmt = 63,
+	.axi_rd_osr_lmt = 63,
+	.axi_blen = { 256, },
+};
+
 static int tegra_mgbe_probe(struct platform_device *pdev)
 {
 	struct plat_stmmacenet_data *plat;
@@ -284,6 +290,9 @@ static int tegra_mgbe_probe(struct platform_device *pdev)
 	if (err < 0)
 		goto disable_clks;
 
+	/* setup default AXI configuration */
+	res.axi = &tegra234_mgbe_axi;
+
 	plat = devm_stmmac_probe_config_dt(pdev, &res);
 	if (IS_ERR(plat)) {
 		err = PTR_ERR(plat);

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
