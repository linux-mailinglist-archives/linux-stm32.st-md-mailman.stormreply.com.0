Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3621B6E5F56
	for <lists+linux-stm32@lfdr.de>; Tue, 18 Apr 2023 13:07:48 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9BCA2C6A5FB;
	Tue, 18 Apr 2023 11:07:47 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 49D6DC03FC3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Apr 2023 11:07:46 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0FF2762691;
 Tue, 18 Apr 2023 11:07:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8CB9C433EF;
 Tue, 18 Apr 2023 11:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1681816064;
 bh=3sMgbHnYFmyo7o83otuBC8dc0GltIp1+zccjMGc95TQ=;
 h=From:Date:Subject:To:Cc:From;
 b=BYabJNlsgK6TddYgNWyKF8BZQcv9Uz7Oc3ij7SyvJJIf8DEMFVP/48d1Lg+ag1Lk2
 ny5UzarcmIHNPbH7srtzwI1uN2EU22fx8Rhdep+1O9WkZSkWMv0UrJqJFUwEfSq12p
 n3KANzk41FZb9zrUe1oCwu8RqSkJywujWhN0fXOKoBF7Kfy+wq2Hr/5ziGXbATAFvb
 6YFLf4NyW7c/a11XOdNzHSPIa7ikLVTsePC9AYHX/1BeEXNjJ56FQn5Ksgld0Bkac2
 gs/NThnM8TrVylSofi9CP8o6Yvb8hWmkywtMi7+Iqz0hOXnlRBvLXntHrOfatvq/gU
 XVijnh2ARv3Yw==
From: Simon Horman <horms@kernel.org>
Date: Tue, 18 Apr 2023 13:07:33 +0200
MIME-Version: 1.0
Message-Id: <20230418-dwmac-meson8b-clk-cb-cast-v1-1-e892b670cbbb@kernel.org>
X-B4-Tracking: v=1; b=H4sIAPR5PmQC/x2N2wrCMBBEf6XsswtNY2n1V8SHXLY2mG4lG7VQ+
 u8uPg1n4MzsIFQSCVybHQp9kqSVFcypgTA7fhCmqAxd29n2bEaM38UFXEhWHj2G/MSg4aTiZH0
 fbXcZTD+A+t4JoS+Ow6wL/M5Zy1ehKW3/wxswVWTaKtyP4weJcx0qigAAAA==
To: Jakub Kicinski <kuba@kernel.org>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Paolo Abeni <pabeni@redhat.com>
X-Mailer: b4 0.12.2
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, llvm@lists.linux.dev,
 Nick Desaulniers <ndesaulniers@google.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Nathan Chancellor <nathan@kernel.org>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Tom Rix <trix@redhat.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, linux-amlogic@lists.infradead.org,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
Subject: [Linux-stm32] [PATCH net-next] net: stmmac: dwmac-meson8b: Avoid
 cast to incompatible function type
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

Rather than casting clk_disable_unprepare to an incompatible function
type provide a trivial wrapper with the correct signature for the
use-case.

Reported by clang-16 with W=1:

 drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c:276:6: error: cast from 'void (*)(struct clk *)' to 'void (*)(void *)' converts to incompatible function type [-Werror,-Wcast-function-type-strict]
                                        (void(*)(void *))clk_disable_unprepare,
                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
No functional change intended.
Compile tested only.

Signed-off-by: Simon Horman <horms@kernel.org>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
index e8b507f88fbc..f6754e3643f3 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
@@ -263,6 +263,11 @@ static int meson_axg_set_phy_mode(struct meson8b_dwmac *dwmac)
 	return 0;
 }
 
+static void meson8b_clk_disable_unprepare(void *data)
+{
+	clk_disable_unprepare(data);
+}
+
 static int meson8b_devm_clk_prepare_enable(struct meson8b_dwmac *dwmac,
 					   struct clk *clk)
 {
@@ -273,8 +278,7 @@ static int meson8b_devm_clk_prepare_enable(struct meson8b_dwmac *dwmac,
 		return ret;
 
 	return devm_add_action_or_reset(dwmac->dev,
-					(void(*)(void *))clk_disable_unprepare,
-					clk);
+					meson8b_clk_disable_unprepare, clk);
 }
 
 static int meson8b_init_rgmii_delays(struct meson8b_dwmac *dwmac)

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
