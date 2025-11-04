Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AFB8C311EB
	for <lists+linux-stm32@lfdr.de>; Tue, 04 Nov 2025 14:09:17 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 06B86C62ECF;
	Tue,  4 Nov 2025 13:09:17 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0C2D1C62ECD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 Nov 2025 13:09:16 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-429b9b6ce96so3655105f8f.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 04 Nov 2025 05:09:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1762261755; x=1762866555;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Y+bD9XMSY/PxNEVtej7SYELNOHLIlDJsCB53kL01eGk=;
 b=kj/e5BL504Hc7CSApbh914XBqfe2EiggXghMiweIV+4j1OO+jncD8pw34+QAnrZbVo
 N+QluV8hWoqUrU+s+aoNj5u2y/6RDBIbjU8bb72/jTYPXxYb1XCy/zhunGoivcSK/SFn
 w3MD7T1EpZaWGdOYWtqMMeCEu5DsRLFGcPUreDz8cvEUgV1/y1HFQ1GIC2KWIFPQN2pv
 otDftems90PUsA3pfBIIsF8CgbwTiL7VSPdzo1z9Lp13w8ylAQXqZI39DT1rXskc52Mi
 oY2cyHzO5LUjay0AhglsKXr7QYqNWuERASGFSH4kiplomIm+/iA3Z6AASvc/UB17x2RE
 3usQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762261755; x=1762866555;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Y+bD9XMSY/PxNEVtej7SYELNOHLIlDJsCB53kL01eGk=;
 b=HFy2nkloZuvBVchG8hw3BAzTQKB2EOuknDwH8J72iUh7dK44v0Y0ehgkxQH7FaZnEw
 pWLd/40NkkB3nvHSWwu5wx3cKuJAOeRmLtvj08BQPdXj7ULe/HTW9Ex5dpXVq54gQvet
 In9wK+X60svpgYJU5ifQZNyedXRICucy9TP+vPBRdLP+kZzKPpjwgHIyfZioZLLQTxlY
 7vDboDke7Nmb/qsYbLQl+2lkfCbDM/biHf/mNzTHR8LxHs17xgi4paXj9Bm8VVPfAMSf
 9t088r5kPcuHM/0eVdrh4yEeg7Dx4DbO5OrNhvVTFJpxiBecO94Qw+Vfs1ZZwfk8FZVp
 DVrQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUErZ7CHZplnABx7ayvQPYV5YejymeM2F3UDoue+ixAZZnbwcgAxu0KiKihiZ0D/kvgVJcQIOmqHQv8ng==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzJkMnkSXjnrYVaj84GQ0t/WjYgMIam1lN7pgCvoBYsUzlSNIBb
 aMhhr6cY/J5c80e+ExTD21D0u0xGAy8yOsNfBPdt8hEpfSMo47U4aaic+y7oAgmvkoI=
X-Gm-Gg: ASbGncvWpvrTPrtFmw3zhrhLWQE02DSE3i4VCoHxmr6v47CqDGBwVOj/9Rq6kVFMd0C
 SzfoyaWhQVE05eaMHNCA8WNwJRTPeg85k66s38nOjHOnV7Eyg5G/WQYkMUdvWoXc/Bno4tA8OCA
 R8aO7fHc1vS7gfPLqfih9k+IWDorDi8LtavC/5oZyLx7TQ1f0jERZoNvhSedRW5YAnxbdMiAqCI
 K9sq8d0viDXq1Nbt2i/2wLFrJCKwrx1An6DLMgO0YHmS2tYpi+B765qPtNE4nLtFSxDxNnD+0fy
 ZQLces/lbKeLTRaIBa+G4BbxJoX0DLzWPvIG28xyhsgHwNkzRL98DroXDX7fzDZ2HZNukV8dPJn
 ZpNLRaL6+ZpK71jeUyC0tm9ZUGyFgYc2ZiVl7Ls4hTW03EUNox1281AN9vHNPGq12p+sQTXgJcK
 d284tB
X-Google-Smtp-Source: AGHT+IE9zk6mUyeMrPCGURPH5oFLkbzGYKtQvQUpX+mRV+CSiZEUcYKWUiZRVDA25BouoHB69mkSLQ==
X-Received: by 2002:a5d:5d0a:0:b0:429:d742:87f4 with SMTP id
 ffacd0b85a97d-429d7428a5dmr6172167f8f.11.1762261755321; 
 Tue, 04 Nov 2025 05:09:15 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:9ea1:7ab7:4748:cae3])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429dc18efd3sm4554431f8f.5.2025.11.04.05.09.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Nov 2025 05:09:13 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 04 Nov 2025 14:08:54 +0100
MIME-Version: 1.0
Message-Id: <20251104-qcom-sa8255p-emac-v4-3-f76660087cea@linaro.org>
References: <20251104-qcom-sa8255p-emac-v4-0-f76660087cea@linaro.org>
In-Reply-To: <20251104-qcom-sa8255p-emac-v4-0-f76660087cea@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Vinod Koul <vkoul@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Jose Abreu <joabreu@synopsys.com>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Matthew Gerlach <matthew.gerlach@altera.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Keguang Zhang <keguang.zhang@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Jan Petrous <jan.petrous@oss.nxp.com>, 
 s32@nxp.com, Romain Gantois <romain.gantois@bootlin.com>, 
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
 Heiko Stuebner <heiko@sntech.de>, Chen Wang <unicorn_wang@outlook.com>, 
 Inochi Amaoto <inochiama@gmail.com>, Emil Renner Berthing <kernel@esmil.dk>, 
 Minda Chen <minda.chen@starfivetech.com>, Drew Fustini <fustini@kernel.org>, 
 Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
 Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>, 
 Shuang Liang <liangshuang@eswincomputing.com>, 
 Zhi Li <lizhi2@eswincomputing.com>, 
 Shangjuan Wei <weishangjuan@eswincomputing.com>, 
 "G. Jaya Kumaran" <vineetha.g.jaya.kumaran@intel.com>, 
 Clark Wang <xiaoning.wang@nxp.com>, Linux Team <linux-imx@nxp.com>, 
 Frank Li <Frank.Li@nxp.com>, David Wu <david.wu@rock-chips.com>, 
 Samin Guo <samin.guo@starfivetech.com>, 
 Christophe Roullier <christophe.roullier@foss.st.com>, 
 Swathi K S <swathi.ks@samsung.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1037;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=/4v1a8QAtlU1YFnwlRQMWe0GMJqjCY4EA0FHsr43o1A=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBpCfrtQQMHHYMvRDKmcuOzena2zyxcsRk8Cq4Li
 n8c+fyXskKJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaQn67QAKCRARpy6gFHHX
 cu+sD/9xqcE1M8JRojXs6tNYxWwtB8fmuax3h76PbWJVTattQarQZMV+C6Dw0VjQrSSv0tEQhEJ
 GUsV70G8JQ7xE4b6MVOmV3Sgzx9hOs4BQCaLek8iBxlwKJ5vo3rbHJMR5K+2Uj+UgUOP2nskA6Z
 wd3yen9nsBOVyMs7ac9WQzSOPcgeNfxQedMUSvgTbyBR0GcS2CIy89UjHn+zj7Gx2ijsVuLffPd
 LlxsS8x/QR7QsISJ1ZeyK2515q0yW6X3TBOoKytSgJ8SroZZDX1i1hb+Z6+KhzUbWFSA67ONvkP
 DsVx1s/4rwloM3QXDV5SG+jc8DQBfeMiSh7tK8l8Ac7DTitkG3s4mmpz9X0dVr73UxVhMMJSYOA
 LT6fUEV/zpijp7Jj8GXy5EVwpRWGkVm3wj+KOKGoNoDyHDGVfPaMnaAwVaS4WzAl+hjuEgwhhYa
 ZYRh8qU/FZ3xHQN5JSspjIfCcrBVGbeA06m9w6MrkiOkHbh/o4PxhTGNyHcYf5DYBo56XPyVpkJ
 LIKcRLbinjavRjNPsp3TsIa872kJloDivMLAPXL08r7gnxp3Ndwyh8zIqDY6sbPG1/0rHrGcvJs
 IyCz8vr671iiry6UrE2hD3ISMBOM9TDY55vysMSVanhHHypdlq69f60xwNgklQfxHUAVO75i58L
 BqRbsnIAl52oHoQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
Cc: devicetree@vger.kernel.org, linux-mips@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-msm@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 sophgo@lists.linux.dev, netdev@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-riscv@lists.infradead.org,
 Drew Fustini <dfustini@tenstorrent.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v4 3/8] net: stmmac: qcom-ethqos: improve
 typing in devres callback
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

It's bad practice to just directly pass void pointers to functions which
expect concrete types. Make it more clear what type ethqos_clks_config()
expects.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 8578a2df8cf0d1d8808bcf7e7b57c93eb14c87db..8493131ca32f5c6ca7e1654da0bbf4ffa1eefa4e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -726,7 +726,9 @@ static int ethqos_clks_config(void *priv, bool enabled)
 
 static void ethqos_clks_disable(void *data)
 {
-	ethqos_clks_config(data, false);
+	struct qcom_ethqos *ethqos = data;
+
+	ethqos_clks_config(ethqos, false);
 }
 
 static void ethqos_ptp_clk_freq_config(struct stmmac_priv *priv)

-- 
2.51.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
