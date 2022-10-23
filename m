Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F8976094DA
	for <lists+linux-stm32@lfdr.de>; Sun, 23 Oct 2022 18:46:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 28514C03FC9;
	Sun, 23 Oct 2022 16:46:22 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7ECEEC03FC0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 23 Oct 2022 16:46:20 +0000 (UTC)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 0399684B51;
 Sun, 23 Oct 2022 18:46:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1666543579;
 bh=1SjSb6X2zIC4YiHwYb8YRI0rt4p/SSZUndc5Bapk06E=;
 h=From:To:Cc:Subject:Date:From;
 b=k2Z3ngPkEln3IlJu+rGR5Mdmyv3Tg9IhozSzM/1prVRhu/bHEKXzzJ5RTmwV5kHjK
 QkTUV6YLtqXuFFcsxXFAEvVo1rtHInY4tctKyOjGgiIbKTb/6WlUs70+5RmF1rtwHG
 b6+u06jbdSMYUJ+2xIN1F2FufE0UU4e1vP+7l/ruyO4k1N4gtsk4gp6YhQqCwIkQ2U
 YJBoRe2DDz5D2RHm4QTih2yPwp9YrAQE1dGgaU7UShFmneJ0A4/lnt0B1QSBF9fxxJ
 tVLt7rC3eAl6bL39MaUTkpsBmS2m10mo4E1zmTCo8GGPu8rt0uOzDdvvoY4yBGMRXp
 VLdtlxxU/cD1A==
From: Marek Vasut <marex@denx.de>
To: linux-clk@vger.kernel.org
Date: Sun, 23 Oct 2022 18:46:07 +0200
Message-Id: <20221023164607.556118-1-marex@denx.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Cc: Marek Vasut <marex@denx.de>, kernel test robot <lkp@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Johann Neuhauser <jneuhauser@dh-electronics.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
Subject: [Linux-stm32] [PATCH] clk: stm32mp1: Staticize ethrx_src
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

Make ethrx_src array static, this is local to clk-stm32mp1.c

Fixes: e9ed1ef18a37a ("clk: stm32mp1: Add parent_data to ETHRX clock")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Christophe Roullier <christophe.roullier@foss.st.com>
Cc: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Cc: Johann Neuhauser <jneuhauser@dh-electronics.com>
Cc: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
---
 drivers/clk/clk-stm32mp1.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/clk-stm32mp1.c b/drivers/clk/clk-stm32mp1.c
index 7ad2e6203baef..01e5a466897f8 100644
--- a/drivers/clk/clk-stm32mp1.c
+++ b/drivers/clk/clk-stm32mp1.c
@@ -155,7 +155,7 @@ static const char * const eth_src[] = {
 	"pll4_p", "pll3_q"
 };
 
-const struct clk_parent_data ethrx_src[] = {
+static const struct clk_parent_data ethrx_src[] = {
 	{ .name = "ethck_k", .fw_name = "ETH_RX_CLK/ETH_REF_CLK" },
 };
 
-- 
2.35.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
