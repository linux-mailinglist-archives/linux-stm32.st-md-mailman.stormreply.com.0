Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6BssEhn0z2lN2AYAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 03 Apr 2026 19:08:41 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C99B8396C72
	for <lists+linux-stm32@lfdr.de>; Fri, 03 Apr 2026 19:08:40 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5CF92C8F282;
	Fri,  3 Apr 2026 17:08:40 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4B83DC8F271
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  3 Apr 2026 17:08:38 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 277CE4456C;
 Fri,  3 Apr 2026 17:08:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 01543C4CEF7;
 Fri,  3 Apr 2026 17:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1775236117;
 bh=denZNa2pe33zmfsBlt78CCTctUT565Jw4aDwOLwwftk=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=iWY1VgQxq+ySoIy8isHEwqB2iAx5EFVYwZC/mVU6MmHUfjpX+d/UBPJctIaMpBFaA
 DnXaujaX19inbkRgG8+Y/MlkjkKhrmg507iZXEfyjveLUKX+pQakejr+oFRxnj0dw3
 gldJODj8yMlkYcvD32TR9II+v2iHjAIeHnXycM/j8SfNyTpJRoCucicnE5o2YFILxS
 4Cc80yn2MilGYEgH/wUEzPtgMFXcyBT5kvMhR3pIJbRWUmqIguiFolK0qMeFfqPay+
 eK+BGVWFD4k5NHBdF3OJvzR9hLbMfhxte6imsiZqHbIKFXEHplBpXs0/GPmujyuee6
 /1RD19B37bW5w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id D5ACDE85381;
 Fri,  3 Apr 2026 17:08:36 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Fri, 03 Apr 2026 19:08:31 +0200
MIME-Version: 1.0
Message-Id: <20260403-stmfts5-v3-2-5da768cfd201@ixit.cz>
References: <20260403-stmfts5-v3-0-5da768cfd201@ixit.cz>
In-Reply-To: <20260403-stmfts5-v3-0-5da768cfd201@ixit.cz>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Henrik Rydberg <rydberg@bitmath.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3250; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=tDcuGFSTfadOXIkwoSMoRncuEwaVSpDmbusBAFubYco=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpz/QP26woI/c8S+QvoRrhVe5w2YHAqfPiP5KbV
 uhxsfux4V2JAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCac/0DwAKCRBgAj/E00kg
 cqIfD/oDctPz8rrdDQiz6CmexAyD9MEPFX0KZd2EjbiJb35j/163wCZvi8pcpCEpxll75niVXL+
 BMQVGI3jGIrVki/N8nLjOzuMJI/rLvZkEZBqy4Si1Keeo/JXdJFre1Di7BpJOsJNBVo0l0jsT2a
 a6h9zEyk5u3IgL3cZYtDK7R5Bcw3HWE1Az+Zx52gRlJAKAaJ/ki0HGaIaHmEKm6kGFi4wdEL0RS
 oNGdoi2TrACbRassy1VfnnOj8t4+na/5voCaw7dy+51Ny7h13TmVXg6201/ec1RKX9LAC8qqeYB
 cg6oiG1gdUce45icvY+o7+2ZdlHJtfBdPUohhrmiRM7EU9j9HQqMKRtdZt+SYULfI8LYKDJP67H
 WcuqdFR9+JaeCv2DUkLyttpOB7pjkU4lVFiclM4gYNXcQnN4shKHsPdb5GW6inPleclf41U96sP
 KFXHr9omuIsBu5Gk5YDZyEJM4OFXZkh/LxI4066duZQyOQPkPISxa3UHxMAGLh3dyB4ljQc/GHd
 klWC+n6c3djRfmAa49bQJTB0FpkOu+6MRRVNTvnG16+kjtps1Otiyl+qT3bKFxUvBwAmW1arW4c
 pRDoQXmOaxSQXlkoKzQcMEbg9Vk6/xFbGiWzqZOBMXUo4A616hJzP0hFl8BieyxGxXReUItXcDO
 M46hDIo66PdGLTA==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Petr Hodina <petr.hodina@protonmail.com>, David Heidelberg <david@ixit.cz>,
 linux-input@vger.kernel.org, phone-devel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH WIP v3 02/11] Input: stmfts - Use dev struct
	directly
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
Reply-To: david@ixit.cz
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Spamd-Result: default: False [4.79 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,protonmail.com,ixit.cz,st-md-mailman.stormreply.com,lists.infradead.org];
	FORGED_RECIPIENTS(0.00)[m:dmitry.torokhov@gmail.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:rydberg@bitmath.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:devicetree@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:petr.hodina@protonmail.com,m:david@ixit.cz,m:linux-input@vger.kernel.org,m:phone-devel@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:dmitrytorokhov@gmail.com,m:mcoquelinstm32@gmail.com,m:conor@kernel.org,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[david.ixit.cz];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[devnull@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,foss.st.com,kernel.org,bitmath.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:-];
	HAS_REPLYTO(0.00)[david@ixit.cz];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-0.233];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,ixit.cz:email,ixit.cz:replyto,ixit.cz:mid]
X-Rspamd-Queue-Id: C99B8396C72
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: David Heidelberg <david@ixit.cz>

Makes the code better readable and noticably shorter.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 drivers/input/touchscreen/stmfts.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/drivers/input/touchscreen/stmfts.c b/drivers/input/touchscreen/stmfts.c
index def6bd0c8e059..7b1e975a85668 100644
--- a/drivers/input/touchscreen/stmfts.c
+++ b/drivers/input/touchscreen/stmfts.c
@@ -619,6 +619,7 @@ static int stmfts_enable_led(struct stmfts_data *sdata)
 
 static int stmfts_probe(struct i2c_client *client)
 {
+	struct device *dev = &client->dev;
 	int err;
 	struct stmfts_data *sdata;
 
@@ -627,7 +628,7 @@ static int stmfts_probe(struct i2c_client *client)
 						I2C_FUNC_SMBUS_I2C_BLOCK))
 		return -ENODEV;
 
-	sdata = devm_kzalloc(&client->dev, sizeof(*sdata), GFP_KERNEL);
+	sdata = devm_kzalloc(dev, sizeof(*sdata), GFP_KERNEL);
 	if (!sdata)
 		return -ENOMEM;
 
@@ -639,13 +640,13 @@ static int stmfts_probe(struct i2c_client *client)
 
 	sdata->regulators[STMFTS_REGULATOR_VDD].supply = "vdd";
 	sdata->regulators[STMFTS_REGULATOR_AVDD].supply = "avdd";
-	err = devm_regulator_bulk_get(&client->dev,
+	err = devm_regulator_bulk_get(dev,
 				      ARRAY_SIZE(sdata->regulators),
 				      sdata->regulators);
 	if (err)
 		return err;
 
-	sdata->input = devm_input_allocate_device(&client->dev);
+	sdata->input = devm_input_allocate_device(dev);
 	if (!sdata->input)
 		return -ENOMEM;
 
@@ -664,7 +665,7 @@ static int stmfts_probe(struct i2c_client *client)
 	input_set_abs_params(sdata->input, ABS_MT_PRESSURE, 0, 255, 0, 0);
 	input_set_abs_params(sdata->input, ABS_DISTANCE, 0, 255, 0, 0);
 
-	sdata->use_key = device_property_read_bool(&client->dev,
+	sdata->use_key = device_property_read_bool(dev,
 						   "touch-key-connected");
 	if (sdata->use_key) {
 		input_set_capability(sdata->input, EV_KEY, KEY_MENU);
@@ -685,20 +686,20 @@ static int stmfts_probe(struct i2c_client *client)
 	 * interrupts. To be on the safe side it's better to not enable
 	 * the interrupts during their request.
 	 */
-	err = devm_request_threaded_irq(&client->dev, client->irq,
+	err = devm_request_threaded_irq(dev, client->irq,
 					NULL, stmfts_irq_handler,
 					IRQF_ONESHOT | IRQF_NO_AUTOEN,
 					"stmfts_irq", sdata);
 	if (err)
 		return err;
 
-	dev_dbg(&client->dev, "initializing ST-Microelectronics FTS...\n");
+	dev_dbg(dev, "initializing ST-Microelectronics FTS...\n");
 
 	err = stmfts_power_on(sdata);
 	if (err)
 		return err;
 
-	err = devm_add_action_or_reset(&client->dev, stmfts_power_off, sdata);
+	err = devm_add_action_or_reset(dev, stmfts_power_off, sdata);
 	if (err)
 		return err;
 
@@ -715,13 +716,13 @@ static int stmfts_probe(struct i2c_client *client)
 			 * without LEDs. The ledvdd regulator pointer will be
 			 * used as a flag.
 			 */
-			dev_warn(&client->dev, "unable to use touchkey leds\n");
+			dev_warn(dev, "unable to use touchkey leds\n");
 			sdata->ledvdd = NULL;
 		}
 	}
 
-	pm_runtime_enable(&client->dev);
-	device_enable_async_suspend(&client->dev);
+	pm_runtime_enable(dev);
+	device_enable_async_suspend(dev);
 
 	return 0;
 }

-- 
2.53.0


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
