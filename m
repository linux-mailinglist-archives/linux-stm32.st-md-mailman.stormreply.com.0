Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D40CD76FB
	for <lists+linux-stm32@lfdr.de>; Tue, 15 Oct 2019 15:03:31 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D41ACC36B0B;
	Tue, 15 Oct 2019 13:03:30 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9E75FC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Oct 2019 13:03:29 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x9FD19iU028733; Tue, 15 Oct 2019 15:03:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=VHS+BxJ9bqoSYa+xH/IlFL4fMa0/Sv3mZVO6EbWq22c=;
 b=0Lj58A9xHYrxKdris99TmusVli4cURzyHTxxKuLM7DKc4aq6Qe/2a5y2kZbCOr/QZwTY
 OPdz2wDm6ziwgXKcppkiWLBH33LxmcGX6nbjkUtd6yS7Hvoywy9xZX12wnd0yxlyyGcR
 dfAzfeLIzRZcvxat5fWjIUqgE3ahLoqEc8WsbWEbWmYJ/MxaAf22DYvrDpSre0WdZ7Fb
 PzHVq1hX780fNsak25CV4sMZnKuiYLzS11o7nSi5rxCiyXn4+eveluM2VK5cEkU5IGta
 xajiHrem7QQCYzcu0eAZ75UyryHND4Opg/FlSSFIYHwDbPsFBbJ0bAr3FJR3E3HXZpga 8A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2vk4a18aw0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Oct 2019 15:03:10 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BCB6F10002A;
 Tue, 15 Oct 2019 15:03:09 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8EA7D206463;
 Tue, 15 Oct 2019 15:03:09 +0200 (CEST)
Received: from localhost (10.75.127.49) by SFHDAG3NODE2.st.com (10.75.127.8)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Tue, 15 Oct 2019 15:03:09
 +0200
From: Alain Volmat <alain.volmat@st.com>
To: <wsa@the-dreams.de>, <robh+dt@kernel.org>
Date: Tue, 15 Oct 2019 15:03:09 +0200
Message-ID: <1571144589-3066-1-git-send-email-alain.volmat@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG5NODE2.st.com (10.75.127.14) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-15_05:2019-10-15,2019-10-15 signatures=0
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, pierre-yves.mordret@st.com,
 linux-i2c@vger.kernel.org, mcoquelin.stm32@gmail.com, fabrice.gasnier@st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] i2c: i2c-stm32f7: rework slave_id allocation
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

The IP can handle two slave addresses. One address can either be
7 bits or 10 bits while the other can only be 7 bits.
In order to ensure that a 10 bits address can always be allocated
(assuming there is only one 7 bits address already allocated),
pick up the 7-bits only address slot in priority when performing a 7-bits
address allocation.

Fixes: 60d609f3 ("i2c: i2c-stm32f7: Add slave support")

Signed-off-by: Alain Volmat <alain.volmat@st.com>
---
 drivers/i2c/busses/i2c-stm32f7.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
index d36cf08461f7..cfae01b15243 100644
--- a/drivers/i2c/busses/i2c-stm32f7.c
+++ b/drivers/i2c/busses/i2c-stm32f7.c
@@ -1265,7 +1265,7 @@ static int stm32f7_i2c_get_free_slave_id(struct stm32f7_i2c_dev *i2c_dev,
 	 * slave[0] supports 7-bit and 10-bit slave address
 	 * slave[1] supports 7-bit slave address only
 	 */
-	for (i = 0; i < STM32F7_I2C_MAX_SLAVE; i++) {
+	for (i = STM32F7_I2C_MAX_SLAVE - 1; i >= 0; i--) {
 		if (i == 1 && (slave->flags & I2C_CLIENT_PEC))
 			continue;
 		if (!i2c_dev->slave[i]) {
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
