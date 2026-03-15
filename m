Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CIHcHA4At2mKLQEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Sun, 15 Mar 2026 19:53:02 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 513C72920D7
	for <lists+linux-stm32@lfdr.de>; Sun, 15 Mar 2026 19:53:02 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0DB05C8F262;
	Sun, 15 Mar 2026 18:53:02 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 47CDEC01FB6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 15 Mar 2026 18:52:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id BCE144443E;
 Sun, 15 Mar 2026 18:52:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7DE74C2BCC7;
 Sun, 15 Mar 2026 18:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1773600773;
 bh=kD90Pnoe+NlXfnVFBh+ajGZPNGOL6hV6WmqC/acHvQQ=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=DIEVAqFz+8Ig+lvH4GhnPSysLvd8fLtPHSf/K0dTOnVTGcMny/vMw5UmySsRElzrD
 qxFUqSgN7RlO5msu1zM6BQaHhy+Sp8SZk30LB2GR0CxO2jnUMr5+8GcF94EWRcvOhM
 5tcYTIY8UU0faC/RzH0f9rai+gRe1finYC0UGa8WO6E3rwdYaxTD0fOGJ/PyDIjs+V
 irb+iEDgSvsqutIem04ALpq+jShyeME9X2dpWAl2cTp0rqqS0D33A2r/I0neJHnsHb
 Rp92NNFgs88kB85lQw7GI23FLMBLB8ZQVR9nGbFl2eW5ubeNJbpEGJjJSpl4ISPNUA
 XtJC3h2d3lNEA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 71D86F30280;
 Sun, 15 Mar 2026 18:52:53 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Sun, 15 Mar 2026 19:52:44 +0100
MIME-Version: 1.0
Message-Id: <20260315-stmfts5-v2-8-70bc83ee9591@ixit.cz>
References: <20260315-stmfts5-v2-0-70bc83ee9591@ixit.cz>
In-Reply-To: <20260315-stmfts5-v2-0-70bc83ee9591@ixit.cz>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Henrik Rydberg <rydberg@bitmath.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2354; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=Em8LYVoDWru3Ze7de0xKRKpEP94aiXt6/9C91H5R1mc=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBptv/6s4qIoNdujZmmRqRVBiJys5HkVglAFzyP+
 R5WsIFNQ/uJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCabb/+gAKCRBgAj/E00kg
 cn2qD/9kd9xFzBy/yAD4HTM/loZdNokNzuHgsxlh8FIsTOlDUoXtPe9sndnELN4qHVjtsfNtZ0O
 48PfOOvSsGY/rOFqRd/Jxi7OnTtZWDJozTdN55+Mph5DpENKt0s43YiaOkEmryRbDxEh/SM30zO
 DwrTbLld7eTGL6YohdtKi80fWKl8Mfj90fBbWeokSlDqA7qjxqsOHlNuNAlqTXd/kjU0n2m/O66
 XW3EEWdDP9Ck2PwuDsLWoxzRoTtU2RrxeDnX5jPDZru76QmAeGp5MlS2pvJ0wfb4BvoDfr9RJIt
 bDL40MULru+xiomx2EgRtpsnbNc2AV0oqYuJnxDPvkpOCzjnqfiYW6AsSjLtiZrzje5qxMwqZHH
 9UySLkVuLojNUyxsf1jRecSBIC2XNepZeiG01FjFHJlc2c+E+R/a817V1A+j14vnb/SwsQm7Y7D
 6fPK0981RJylEXuEgYAVqBZk0cfVKxpM+SIKwhZdvpjgIMsKBiBA7cQCbbo8mTB2RxpaygRl9eg
 OVjneIVOrUaaZ0cm0PgbdKGwizNAhYkiG6BQlq4IEtBHH1ckjbph3TBBKhRy9UTgATpmwExhPqD
 35e1LnfvEMwPTfkvBxbfCq9oG1b0fW2a5rMXciwEuy7Gc2uTcZhLiD9QWNzkbeOLLuqvkKzgUyO
 1bd2rYkG6kZyqew==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Petr Hodina <petr.hodina@protonmail.com>, David Heidelberg <david@ixit.cz>,
 linux-input@vger.kernel.org, phone-devel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH WIP v2 08/11] Input: stmfts - add optional
 reset GPIO support
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
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[david.ixit.cz];
	FORGED_RECIPIENTS(0.00)[m:dmitry.torokhov@gmail.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:rydberg@bitmath.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:devicetree@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:petr.hodina@protonmail.com,m:david@ixit.cz,m:linux-input@vger.kernel.org,m:phone-devel@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:dmitrytorokhov@gmail.com,m:mcoquelinstm32@gmail.com,m:conor@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,foss.st.com,kernel.org,bitmath.org];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,protonmail.com,ixit.cz,st-md-mailman.stormreply.com,lists.infradead.org];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[devnull@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:-];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-0.957];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	HAS_REPLYTO(0.00)[david@ixit.cz]
X-Rspamd-Queue-Id: 513C72920D7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Petr Hodina <petr.hodina@protonmail.com>

Add support for an optional "reset-gpios" property. If present, the
driver drives the reset line high at probe time and releases it during
power-on, after the regulators have been enabled.

Signed-off-by: Petr Hodina <petr.hodina@protonmail.com>
Co-developed-by: David Heidelberg <david@ixit.cz>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 drivers/input/touchscreen/stmfts.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/input/touchscreen/stmfts.c b/drivers/input/touchscreen/stmfts.c
index 4dfaf3a6077d9..2c10256e09c5e 100644
--- a/drivers/input/touchscreen/stmfts.c
+++ b/drivers/input/touchscreen/stmfts.c
@@ -77,6 +77,7 @@ static const struct regulator_bulk_data stmfts_supplies[] = {
 struct stmfts_data {
 	struct i2c_client *client;
 	struct input_dev *input;
+	struct gpio_desc *reset_gpio;
 	struct led_classdev led_cdev;
 	struct mutex mutex;
 
@@ -540,6 +541,15 @@ static int stmfts_read_system_info(struct stmfts_data *sdata)
 	return 0;
 }
 
+static void stmfts_reset(struct stmfts_data *sdata)
+{
+	gpiod_set_value_cansleep(sdata->reset_gpio, 1);
+	msleep(20);
+
+	gpiod_set_value_cansleep(sdata->reset_gpio, 0);
+	msleep(50);
+}
+
 static int stmfts_power_on(struct stmfts_data *sdata)
 {
 	int err;
@@ -549,6 +559,9 @@ static int stmfts_power_on(struct stmfts_data *sdata)
 	if (err)
 		return err;
 
+	if (sdata->reset_gpio)
+		stmfts_reset(sdata);
+
 	/*
 	 * The datasheet does not specify the power on time, but considering
 	 * that the reset time is < 10ms, I sleep 20ms to be sure
@@ -607,6 +620,10 @@ static void stmfts_power_off(void *data)
 	struct stmfts_data *sdata = data;
 
 	disable_irq(sdata->client->irq);
+
+	if (sdata->reset_gpio)
+		gpiod_set_value_cansleep(sdata->reset_gpio, 1);
+
 	regulator_bulk_disable(ARRAY_SIZE(stmfts_supplies),
 			       sdata->supplies);
 }
@@ -663,6 +680,12 @@ static int stmfts_probe(struct i2c_client *client)
 	if (err)
 		return err;
 
+	sdata->reset_gpio = devm_gpiod_get_optional(dev, "reset",
+						    GPIOD_OUT_HIGH);
+	if (IS_ERR(sdata->reset_gpio))
+		return dev_err_probe(dev, PTR_ERR(sdata->reset_gpio),
+				     "Failed to get GPIO 'reset'\n");
+
 	sdata->input = devm_input_allocate_device(dev);
 	if (!sdata->input)
 		return -ENOMEM;

-- 
2.53.0


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
