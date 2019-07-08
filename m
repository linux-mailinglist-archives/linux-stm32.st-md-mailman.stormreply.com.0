Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A82D561EAB
	for <lists+linux-stm32@lfdr.de>; Mon,  8 Jul 2019 14:43:22 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 33399C5C1F7
	for <lists+linux-stm32@lfdr.de>; Mon,  8 Jul 2019 12:43:21 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.73])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2FFF1C5C1F5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  8 Jul 2019 12:43:19 +0000 (UTC)
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue108 [212.227.15.145]) with ESMTPA (Nemesis) id
 1N9Mh8-1iY7ev3NFE-015Mij; Mon, 08 Jul 2019 14:43:13 +0200
From: Arnd Bergmann <arnd@arndb.de>
To: Ohad Ben-Cohen <ohad@wizery.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>
Date: Mon,  8 Jul 2019 14:42:51 +0200
Message-Id: <20190708124311.3448056-1-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:AkGDgfgp15g2CwVR7Facqvx2UQWGiD85o226q8pCrj+7T3ngYhv
 IfLF3dxuiyn7foiSJbI+CjDMOWeNFw4kgugGEH9s7CEP/ITyLDc0js2XWpv06vcn8jwcVdi
 htFSeTonIiSmWhiJ6NokkctrmpdXI6ajXctroI5KnraqIYGMuHO339AkvcR2SGhILxsSPPp
 oXbARlZOVAkKCNuffxW2g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:NOG3AWT7dhY=:I1yuk6/XhruMMQoRCnVKYH
 Dprmazilp2kNoyya7NhsRMMlH3fEEHyN+t7vYmASH7wZsnO8z9QnyNDYZD8PoF3PYbRSudiJr
 beYiBGXOaQDkiZAklGiIcNdrspzn35663iyk0GQfGE9iK7UrGgJIHznTWOtzrtjtNLGhAYLRr
 vVp1P2qtvMpmIk01cKQUB4BMDTDMHGU7IkkZHt+PtfqbkJD4ZqaPyNwpAKBnnFtEHJThM/rOc
 mTKdXDWuUc0e8XsvFrwD8FN+5L4eBVlO0fkt2Bj8deLez+mlSgC75Bk++RkbBTAXKgtqYwlj5
 4Ir7mGd2pIZRTZk1Hyb5EKQdvhWXWClUp2sRj1lKVTQ5wBq2zhdk63UKWUmr16rgK+CdZZteb
 XEKXOIEAfhTry3H0vfA8bm8WyJy4ZaJF7vFLzmxLit52Lt73TE9XN6giBVvGYS+hdoNcbNm3C
 GCDm3qZZYwx9kM2wq/NoJE3S7283goKM3I7NfeaNIzon+gR9SQCxDQIE1OJOvrIPulXpjd51R
 0tUD9uoBueidEyEuuoRo+70FeDZZgh+PxOSgJFtOFxfS25GLarZZN5Ezaq+wacrZQ4DVFqZ8S
 kmm1yamO+hiwkGBvfEC17KEgSZoRmfRDrGYdwG1X842K8zQCkf/Yrxw5PaPEQMtlk28+F2Qie
 Clb7hFMAFS8EayWbwBwUwmuGm8WCiTDZ+uff7WLeLLuCyLgm+yfCb2YL/PGJrq56E4kUi6UcY
 asXjZrOREjS+2fK2M//YtVvqIQpUbo66EFHOQg==
Cc: Arnd Bergmann <arnd@arndb.de>, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Fabien Dessenne <fabien.dessenne@st.com>,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH] remoteproc: stm32: fix building without ARM
	SMCC
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

When compile testing this driver without SMCC support enabled,
we get a link error:

drivers/remoteproc/stm32_rproc.o: In function `stm32_rproc_start':
stm32_rproc.c:(.text+0x776): undefined reference to `__arm_smccc_smc'
drivers/remoteproc/stm32_rproc.o: In function `stm32_rproc_stop':
stm32_rproc.c:(.text+0x92c): undefined reference to `__arm_smccc_smc'

Make the actual call to arm_smccc_smc conditional on the Kconfig
symbol controlling its implementation.

Fixes: 13140de09cc2 ("remoteproc: stm32: add an ST stm32_rproc driver")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/remoteproc/stm32_rproc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
index e83077b9ebf5..e2da7198b65f 100644
--- a/drivers/remoteproc/stm32_rproc.c
+++ b/drivers/remoteproc/stm32_rproc.c
@@ -344,7 +344,7 @@ static int stm32_rproc_set_hold_boot(struct rproc *rproc, bool hold)
 
 	val = hold ? HOLD_BOOT : RELEASE_BOOT;
 
-	if (ddata->secured_soc) {
+	if (IS_ENABLED(CONFIG_HAVE_ARM_SMCCC) && ddata->secured_soc) {
 		arm_smccc_smc(STM32_SMC_RCC, STM32_SMC_REG_WRITE,
 			      hold_boot.reg, val, 0, 0, 0, 0, &smc_res);
 		err = smc_res.a0;
-- 
2.20.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
