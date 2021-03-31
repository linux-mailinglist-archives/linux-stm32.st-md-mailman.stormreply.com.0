Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9766F34F99F
	for <lists+linux-stm32@lfdr.de>; Wed, 31 Mar 2021 09:16:48 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 288F1C58D5E;
	Wed, 31 Mar 2021 07:16:48 +0000 (UTC)
Received: from mail-m17637.qiye.163.com (mail-m17637.qiye.163.com
 [59.111.176.37])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 05F52C57B54
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 31 Mar 2021 02:39:25 +0000 (UTC)
Received: from wanjb-virtual-machine.localdomain (unknown [36.152.145.182])
 by mail-m17637.qiye.163.com (Hmail) with ESMTPA id 9CD07980166;
 Wed, 31 Mar 2021 10:39:21 +0800 (CST)
From: Wan Jiabing <wanjiabing@vivo.com>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Arend van Spriel <aspriel@gmail.com>, Franky Lin <franky.lin@broadcom.com>,
 Hante Meuleman <hante.meuleman@broadcom.com>,
 Chi-hsien Lin <chi-hsien.lin@infineon.com>,
 Wright Feng <wright.feng@infineon.com>,
 Chung-hsien Hsu <chung-hsien.hsu@infineon.com>,
 Kalle Valo <kvalo@codeaurora.org>, Ajay Singh <ajay.kathat@microchip.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Wan Jiabing <wanjiabing@vivo.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-wireless@vger.kernel.org, brcm80211-dev-list.pdl@broadcom.com,
 SHA-cyfmac-dev-list@infineon.com
Date: Wed, 31 Mar 2021 10:35:51 +0800
Message-Id: <20210331023557.2804128-3-wanjiabing@vivo.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210331023557.2804128-1-wanjiabing@vivo.com>
References: <20210331023557.2804128-1-wanjiabing@vivo.com>
MIME-Version: 1.0
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
 oVCBIfWUFZGU1LQkJDQkMeTxlKVkpNSkxKTkNITUlJQ0pVEwETFhoSFyQUDg9ZV1kWGg8SFR0UWU
 FZT0tIVUpKS0hKTFVLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Phg6GQw4CT8JSzYCSDlJD086
 DxkKFBZVSlVKTUpMSk5DSE1JTk1KVTMWGhIXVQwaFRESGhkSFRw7DRINFFUYFBZFWVdZEgtZQVlI
 TVVKTklVSk9OVUpDSVlXWQgBWUFISEJNNwY+
X-HM-Tid: 0a7886265476d992kuws9cd07980166
X-Mailman-Approved-At: Wed, 31 Mar 2021 07:16:45 +0000
Cc: kael_w@yeah.net
Subject: [Linux-stm32] [PATCH 2/4] net: wireless: microchip: Remove
	duplicate struct declaration
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

struct wilc is declared twice. One has been declared
at 352nd line. Remove the duplicate.

Signed-off-by: Wan Jiabing <wanjiabing@vivo.com>
---
 drivers/net/wireless/microchip/wilc1000/wlan.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/wireless/microchip/wilc1000/wlan.h b/drivers/net/wireless/microchip/wilc1000/wlan.h
index d55eb6b3a12a..0d24e711b62b 100644
--- a/drivers/net/wireless/microchip/wilc1000/wlan.h
+++ b/drivers/net/wireless/microchip/wilc1000/wlan.h
@@ -392,7 +392,6 @@ struct wilc_cfg_rsp {
 	u8 seq_no;
 };
 
-struct wilc;
 struct wilc_vif;
 
 int wilc_wlan_firmware_download(struct wilc *wilc, const u8 *buffer,
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
