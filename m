Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id AIpUB8FoMWqtigUAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 16 Jun 2026 17:16:17 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 949CC690DF4
	for <lists+linux-stm32@lfdr.de>; Tue, 16 Jun 2026 17:16:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3AB79C8F26F;
	Tue, 16 Jun 2026 15:16:16 +0000 (UTC)
Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
 (using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E450DC712B4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Jun 2026 15:16:14 +0000 (UTC)
Received: from localhost.localdomain (unknown [111.196.245.140])
 by APP-03 (Coremail) with SMTP id rQCowAAH7OK7aDFqCiDxFA--.41914S2;
 Tue, 16 Jun 2026 23:16:11 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Gatien Chevallier <gatien.chevallier@foss.st.com>
Date: Tue, 16 Jun 2026 23:16:04 +0800
Message-ID: <20260616151604.10548-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-CM-TRANSID: rQCowAAH7OK7aDFqCiDxFA--.41914S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Cr15JryxZr4xur1rtw17trb_yoW8CF47pa
 n5Cr9xGr40yw43AFZxAF10qr9aqrZ7XrnxWryxu348uF4Syr10k3y5XrWY9FWUJa48Kayk
 XF45t34UZr1DCr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkC14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
 6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
 Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
 I7IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r
 4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AKxVWU
 AVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14
 v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkG
 c2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI
 0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4U
 MIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyTuYvjfUeTmhDU
 UUU
X-Originating-IP: [111.196.245.140]
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/
Cc: linux-kernel@vger.kernel.org, Pengpeng Hou <pengpeng@iscas.ac.cn>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] bus: stm32_rifsc: clean up debugfs file with
	device state
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [3.29 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	MID_CONTAINS_FROM(1.00)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[iscas.ac.cn];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS(0.00)[m:gatien.chevallier@foss.st.com,m:linux-kernel@vger.kernel.org,m:pengpeng@iscas.ac.cn,m:mcoquelin.stm32@gmail.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[pengpeng@iscas.ac.cn,linux-stm32-bounces@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pengpeng@iscas.ac.cn,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,iscas.ac.cn,gmail.com,st-md-mailman.stormreply.com,lists.infradead.org];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_DKIM_NA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[iscas.ac.cn:email,iscas.ac.cn:mid,iscas.ac.cn:from_mime,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 949CC690DF4

stm32_rifsc_register_debugfs() creates a debugfs file whose private data
is devm-allocated RIFSC debug state. If a later probe step fails, or if
the device is removed, that debugfs file can outlive the private data it
dereferences.

Keep the created dentry and register a devm cleanup action so the file is
removed before the RIFSC state is released.

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 drivers/bus/stm32_rifsc.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/bus/stm32_rifsc.c b/drivers/bus/stm32_rifsc.c
index 19d10379dcef..3877198e6eb9 100644
--- a/drivers/bus/stm32_rifsc.c
+++ b/drivers/bus/stm32_rifsc.c
@@ -602,11 +602,17 @@ static int stm32_rifsc_conf_dump_show(struct seq_file *s, void *data)
 }
 DEFINE_SHOW_ATTRIBUTE(stm32_rifsc_conf_dump);
 
+static void stm32_rifsc_remove_debugfs(void *data)
+{
+	debugfs_remove(data);
+}
+
 static int stm32_rifsc_register_debugfs(struct stm32_firewall_controller *rifsc_controller,
 					u32 nb_risup, u32 nb_rimu, u32 nb_risal)
 {
 	struct rifsc_dbg_private *rifsc_priv;
 	struct dentry *root = NULL;
+	struct dentry *file;
 
 	rifsc_priv = devm_kzalloc(rifsc_controller->dev, sizeof(*rifsc_priv), GFP_KERNEL);
 	if (!rifsc_priv)
@@ -625,9 +631,13 @@ static int stm32_rifsc_register_debugfs(struct stm32_firewall_controller *rifsc_
 	if (IS_ERR(root))
 		return PTR_ERR(root);
 
-	debugfs_create_file("rifsc", 0444, root, rifsc_priv, &stm32_rifsc_conf_dump_fops);
+	file = debugfs_create_file("rifsc", 0444, root, rifsc_priv,
+				   &stm32_rifsc_conf_dump_fops);
+	if (IS_ERR(file))
+		return PTR_ERR(file);
 
-	return 0;
+	return devm_add_action_or_reset(rifsc_controller->dev,
+					stm32_rifsc_remove_debugfs, file);
 }
 #endif /* defined(CONFIG_DEBUG_FS) */
 
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
