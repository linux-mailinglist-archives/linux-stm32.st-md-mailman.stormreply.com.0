Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C3E71846F81
	for <lists+linux-stm32@lfdr.de>; Fri,  2 Feb 2024 12:53:50 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8BB17C71282;
	Fri,  2 Feb 2024 11:53:50 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5EF29C71281
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 Feb 2024 11:53:49 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-a370315191dso74564766b.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 02 Feb 2024 03:53:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706874828; x=1707479628;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=CP10ASwjzq21gj6cHPQz3XuKiRelwR6OnJvv0UFbQiI=;
 b=RjYPves3WPF+T8XkyU01lVFOm9pU1KK1l5rJamiVbSXttX6dmwHNYVFhg6V65PSn5p
 p3wMH1fw/JccqbLEF5HO7ZMVXSBLJ1lkhUP8M0EODgvXS4+ErUyw83gGkO18WSf9gntm
 4o8UWDSSQOwPuHBicSmmFKRKevb8DG1Idpx3sRBoNdcYK7CkaYxNDmSEydy61GVrvCXv
 qtXQBueWb2j1ssiY6U40aV2uMWfPlUpxTZ8OUsdraZcZQneN0av+2rBpGiouK/aLtcIk
 41tLzZRwturx7bZfQ/UDudP2R051+TWHLFEIKOK6Khl/X9Eon3MqDqDIrFqbZsD8YyYJ
 Eezw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706874828; x=1707479628;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CP10ASwjzq21gj6cHPQz3XuKiRelwR6OnJvv0UFbQiI=;
 b=BcSfOfEVHwZWm1H33gs/SaAecWT5O0Oa2Xoy+i4XxoE7ULPGhmDt3sgflyoc1xQxNb
 WgnbsTvX7u/kpx3+i0KwbnIox6VxYva+EFK9LhPJsh2g2fOruxWv27vLeAV4tKrWJcaJ
 MVa/sYq6iY8AXEiSeDBicYRosBPM6tC4+d3YmrhG6YtwPWenSBRaPnxKcaWoc4YHqIQE
 p+TUTbRiBAwb9vIacGD8NAxbgOBTknwPXei33RnzHFo/1/pulHjCH4Ar7fikyUq6KKxT
 5wXeGclH4VfP0KT7blHDVEk7QttP6CbCjirNL1Ror6EBy/7RP92WSzb3NFkdtHSa0zLP
 Pfjg==
X-Gm-Message-State: AOJu0Yx3Zb4v0YExvDvmRcnPSI9fLHqImnVI/U3czebulnogo+oNdRyW
 O8rv++jvGieEQ0CGZo0e+rfJ8ej6r5LvujJzwk9KJPVwJfjPagbiIwE/Hm45
X-Google-Smtp-Source: AGHT+IGHPPLYFBhqVR/gaDzrSKNq+tO5uK8z3aeMJR75LKxl6l5pqsJ2kUl8AjMTV9YnmXgCFMAI7Q==
X-Received: by 2002:a17:906:3185:b0:a37:e01:4ce1 with SMTP id
 5-20020a170906318500b00a370e014ce1mr692612ejy.16.1706874827906; 
 Fri, 02 Feb 2024 03:53:47 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCWpwEO69sEwY4KarB6KuShExChyl8/gKuL/RYOilEGJSvlaVKBSfDpVehx2iEXmfMIaZLWmtTQCtJ+sjljcmpysvqBVEp7Nf1ulXOCFJgVIdSGNGS8QLi+QbTu6BGA7NtzpGOUIMujKAVoPgnibkSdGZFigPCgslnzX5XGoN2emcFLKbhJ0y76V7+dWN8VEUUJ5BEFlpdC1bamWyqWjS8NwWiF1uA0+DkgjBKsrIEyuIkVTglbzMvTmXb5mX69llbu2vEnJ+dhEzuFiARgKNZvr88qrb0gfHpU0MbdWdloBUu0H8GZgEzLvuZZrkDVsCHYaO6aVXEhAbuGWNQz9wFKDlQodxYYkbOYDPVDj+HE8GuWJPAZG2fx3Fkz5EiI=
Received: from localhost
 (p200300e41f147f00f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f14:7f00:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 ll9-20020a170907190900b00a26f1f36708sm804631ejc.78.2024.02.02.03.53.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Feb 2024 03:53:47 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
Date: Fri, 02 Feb 2024 12:53:35 +0100
MIME-Version: 1.0
Message-Id: <20240202-stmmac-axi-config-v2-3-64eab2bab17b@nvidia.com>
References: <20240202-stmmac-axi-config-v2-0-64eab2bab17b@nvidia.com>
In-Reply-To: <20240202-stmmac-axi-config-v2-0-64eab2bab17b@nvidia.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1341; i=treding@nvidia.com;
 h=from:subject:message-id; bh=NJ6QmQ9rSuyu2yILzTMeD+XilmAw5wEYJDPvDZo2/VA=;
 b=owEBbQKS/ZANAwAIAd0jrNd/PrOhAcsmYgBlvNfF/cyXbjX6A8uf1KQJ9kvcSPEduJhDj4LrA
 fOD8DMzv7CJAjMEAAEIAB0WIQSI6sMIAUnM98CNyJ/dI6zXfz6zoQUCZbzXxQAKCRDdI6zXfz6z
 ofsQD/sHVqjo63aewWEpeBEYYBpoufs8O0jXYlUjVdfx3sWoSAD4EyEQibNxxEgQdDDh01kQUdn
 mAdnVTIaQtKuVyq1R0RAs1A/uY6hY2QhViuUT2/HfOysFV33fuSz71I802I9DZab9OCfRff/8Bx
 jCxmXr5nLHjNmVKRNgApgif4lxhav5TabbhWUTPm4L6/y8Vtzotm6yGxk81+2DucSmP0cSk7ahS
 VMLQIfPHN7tdmYkTs50s8n403jdDWj4YmD6dISZg9W/KQ8M6eCPpb8zGrYweL2tLYnDRwSYPfJF
 2CAYW3fg6hfNlBHvf3Fl1SxN5kaO0vXkWi7oYh6nohxWr1ZuWdhdJrVc3kz4MbO8vwB+EpTKWoQ
 einP7RipurGn/kM90sfm0I/n/B/StFGuykby1NcOeIftcoSWTSpL8nemCX3gt7myZpEVY3GHzin
 OvTzDoRN6LJr32Mn+gjDHYJyytzGGHJMCByXJScdmMQFt7CF3olFd4eqNoIdu9kBX00FLYWJDlr
 NNvP+sLeuS5My0svv+LeCu+uo28G3kG5Kkxt+X8uBD/rgzCiAWOuIWFcT4TZrJlwjFcYsiFdSlM
 IEM0dwocJb5Bnul9Pr0IrwbUvTbsRgiFqHJHhHS1aRaf0mHNFOWi3V+NvOXktUZa/7lrjU/EMQT
 GeJ1umG6jQE0PiQ==
X-Developer-Key: i=treding@nvidia.com; a=openpgp;
 fpr=88EAC3080149CCF7C08DC89FDD23ACD77F3EB3A1
Cc: linux-tegra@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH net-next v2 3/3] net: stmmac: Configure AXI on
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
