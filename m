Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 302F2859D5E
	for <lists+linux-stm32@lfdr.de>; Mon, 19 Feb 2024 08:48:18 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AAE2BC6C859;
	Mon, 19 Feb 2024 07:48:17 +0000 (UTC)
Received: from cae.in-ulm.de (cae.in-ulm.de [217.10.14.231])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 339F0C6B46B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 18 Feb 2024 22:21:06 +0000 (UTC)
Received: by cae.in-ulm.de (Postfix, from userid 1000)
 id CE2C414033C; Sun, 18 Feb 2024 23:21:05 +0100 (CET)
From: "Christian A. Ehrhardt" <lk@c--e.de>
To: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Date: Sun, 18 Feb 2024 23:20:35 +0100
Message-Id: <20240218222039.822040-3-lk@c--e.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240218222039.822040-1-lk@c--e.de>
References: <20240218222039.822040-1-lk@c--e.de>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 19 Feb 2024 07:48:15 +0000
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Prashanth K <quic_prashk@quicinc.com>,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh@kernel.org>,
 "Christian A. Ehrhardt" <lk@c--e.de>, Luca Weiss <luca.weiss@fairphone.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
 Haotien Hsu <haotienh@nvidia.com>, Hans de Goede <hdegoede@redhat.com>,
 Utkarsh Patel <utkarsh.h.patel@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, Min-Hua Chen <minhuadotchen@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Bjorn Andersson <andersson@kernel.org>,
 =?UTF-8?q?Samuel=20=C4=8Cavoj?= <samuel@cavoj.net>,
 Saranya Gopal <saranya.gopal@intel.com>,
 Rajaram Regupathy <rajaram.regupathy@intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [Linux-stm32] [RFC PATCH 2/6] ucsi_ccg: Cleanup endianness confusion
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

When storing the cci value in the op_region struct it is
converted from host to little endian. However, the value is
read from hardware that is little endian according to the spec
and it is never converted to host byte order. However, the
value is used as if it where in host byte order.

Additionally, the message_in buffer is a byte array.
Any endian interpretation depends on the current command and
must be done in the ocntext of that command.

While all the UCSI world seems to be little endian and there
are many other endian issues if this is not true, this
particular value is treated with endian awareness, so it should
at least be done correctly.

Add the missing conversion from little endian to host byte order
when reading the CCI value from hardware. Additionally, make the
message_in buffer an u8 array and adjust the size macro accordingly.

Signed-off-by: Christian A. Ehrhardt <lk@c--e.de>
---
 drivers/usb/typec/ucsi/ucsi_ccg.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi_ccg.c b/drivers/usb/typec/ucsi/ucsi_ccg.c
index dda7c7c94e08..709295948c65 100644
--- a/drivers/usb/typec/ucsi/ucsi_ccg.c
+++ b/drivers/usb/typec/ucsi/ucsi_ccg.c
@@ -192,10 +192,10 @@ struct ucsi_ccg_altmode {
 	bool checked;
 } __packed;
 
-#define CCGX_MESSAGE_IN_MAX 4
+#define CCGX_MESSAGE_IN_MAX 16
 struct op_region {
 	__le32 cci;
-	__le32 message_in[CCGX_MESSAGE_IN_MAX];
+	u8 message_in[CCGX_MESSAGE_IN_MAX];
 };
 
 struct ucsi_ccg {
@@ -678,6 +678,7 @@ static irqreturn_t ccg_irq_handler(int irq, void *data)
 	u16 reg = CCGX_RAB_UCSI_DATA_BLOCK(UCSI_CCI);
 	struct ucsi_ccg *uc = data;
 	u8 intr_reg;
+	__le32 __cci;
 	u32 cci = 0;
 	int ret = 0;
 
@@ -690,9 +691,10 @@ static irqreturn_t ccg_irq_handler(int irq, void *data)
 	else if (!(intr_reg & UCSI_READ_INT))
 		goto err_clear_irq;
 
-	ret = ccg_read(uc, reg, (void *)&cci, sizeof(cci));
+	ret = ccg_read(uc, reg, (void *)&__cci, sizeof(__cci));
 	if (ret)
 		goto err_clear_irq;
+	cci = le32_to_cpu(__cci);
 
 	if (UCSI_CCI_CONNECTOR(cci))
 		ucsi_connector_change(uc->ucsi, UCSI_CCI_CONNECTOR(cci));
-- 
2.40.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
