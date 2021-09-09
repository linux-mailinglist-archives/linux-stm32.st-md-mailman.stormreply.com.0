Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 215764049FC
	for <lists+linux-stm32@lfdr.de>; Thu,  9 Sep 2021 13:43:55 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D5C94C5A4F3;
	Thu,  9 Sep 2021 11:43:54 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4E6EDC5A4D5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Sep 2021 11:43:51 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B961A61213;
 Thu,  9 Sep 2021 11:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631187829;
 bh=A/QQumOH8O6k/Xn5qDY6TMC4AxTRp7rzpMcWLtKRmjY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Fl14Y4YSxLbg/rUWjj3lLh9PW9y/AfsvAxLQP/OqUKqhtzAiXwOgAndEjCBePJEUS
 2ofrnAvsI6Kvez4tQMtEiRXwxnhrCUqXmMxTFqzqYi9oqBWjrQlOz9hGGm72i7yTKC
 78UkXCxiuFS5M+KNswTgQR/FKWvJC0OcPiFMMyPONE1kR3xRk/Ikq/qxLQVw00XWO5
 ExdiOMBRDsZjr86+l/DPetGtLw5/zHinsA4mOu5gm4dC7VU/WzkJBihW9SIyjsuyrw
 KZ2YEkGI9L9D/PqIQqXDnwh5PV0LM31yB+fErL5Jbl8W9zAFDaIiFcRULSun2J0oFa
 xXUcRMQcZ2oSA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Thu,  9 Sep 2021 07:39:00 -0400
Message-Id: <20210909114106.141462-126-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210909114106.141462-1-sashal@kernel.org>
References: <20210909114106.141462-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Cc: Sasha Levin <sashal@kernel.org>, netdev@vger.kernel.org,
 "David S . Miller" <davem@davemloft.net>,
 Nathan Chancellor <nathan@kernel.org>, clang-built-linux@googlegroups.com,
 Sami Tolvanen <samitolvanen@google.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH AUTOSEL 5.14 126/252] net: ethernet: stmmac:
	Do not use unreachable() in ipq806x_gmac_probe()
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

From: Nathan Chancellor <nathan@kernel.org>

[ Upstream commit 4367355dd90942a71641c98c40c74589c9bddf90 ]

When compiling with clang in certain configurations, an objtool warning
appears:

drivers/net/ethernet/stmicro/stmmac/dwmac-ipq806x.o: warning: objtool:
ipq806x_gmac_probe() falls through to next function phy_modes()

This happens because the unreachable annotation in the third switch
statement is not eliminated. The compiler should know that the first
default case would prevent the second and third from being reached as
the comment notes but sanitizer options can make it harder for the
compiler to reason this out.

Help the compiler out by eliminating the unreachable() annotation and
unifying the default case error handling so that there is no objtool
warning, the meaning of the code stays the same, and there is less
duplication.

Reported-by: Sami Tolvanen <samitolvanen@google.com>
Tested-by: Sami Tolvanen <samitolvanen@google.com>
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: David S. Miller <davem@davemloft.net>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../ethernet/stmicro/stmmac/dwmac-ipq806x.c    | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-ipq806x.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-ipq806x.c
index 28dd0ed85a82..f7dc8458cde8 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-ipq806x.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-ipq806x.c
@@ -289,10 +289,7 @@ static int ipq806x_gmac_probe(struct platform_device *pdev)
 		val &= ~NSS_COMMON_GMAC_CTL_PHY_IFACE_SEL;
 		break;
 	default:
-		dev_err(&pdev->dev, "Unsupported PHY mode: \"%s\"\n",
-			phy_modes(gmac->phy_mode));
-		err = -EINVAL;
-		goto err_remove_config_dt;
+		goto err_unsupported_phy;
 	}
 	regmap_write(gmac->nss_common, NSS_COMMON_GMAC_CTL(gmac->id), val);
 
@@ -309,10 +306,7 @@ static int ipq806x_gmac_probe(struct platform_device *pdev)
 			NSS_COMMON_CLK_SRC_CTRL_OFFSET(gmac->id);
 		break;
 	default:
-		dev_err(&pdev->dev, "Unsupported PHY mode: \"%s\"\n",
-			phy_modes(gmac->phy_mode));
-		err = -EINVAL;
-		goto err_remove_config_dt;
+		goto err_unsupported_phy;
 	}
 	regmap_write(gmac->nss_common, NSS_COMMON_CLK_SRC_CTRL, val);
 
@@ -329,8 +323,7 @@ static int ipq806x_gmac_probe(struct platform_device *pdev)
 				NSS_COMMON_CLK_GATE_GMII_TX_EN(gmac->id);
 		break;
 	default:
-		/* We don't get here; the switch above will have errored out */
-		unreachable();
+		goto err_unsupported_phy;
 	}
 	regmap_write(gmac->nss_common, NSS_COMMON_CLK_GATE, val);
 
@@ -361,6 +354,11 @@ static int ipq806x_gmac_probe(struct platform_device *pdev)
 
 	return 0;
 
+err_unsupported_phy:
+	dev_err(&pdev->dev, "Unsupported PHY mode: \"%s\"\n",
+		phy_modes(gmac->phy_mode));
+	err = -EINVAL;
+
 err_remove_config_dt:
 	stmmac_remove_config_dt(pdev, plat_dat);
 
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
