Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AONOBX6T+GmwwgIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 04 May 2026 14:39:26 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 904D44BCFDC
	for <lists+linux-stm32@lfdr.de>; Mon, 04 May 2026 14:39:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1F37ECFAC40;
	Mon,  4 May 2026 12:39:25 +0000 (UTC)
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1830CC36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Apr 2026 15:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=EZ
 yfT7HUgDZVpDW8FnDzfwicIGCHfxW7z0LSAJ2rXYg=; b=XQVBYSIfjg2SUfM4gw
 q62jHmuXr2HzZNhlmA4IqyN69WveUqMFdR4oXYdDKP1voIHOrxc0eJqFGdsVT5gh
 qQWlAP4F8qRTobbOtxBFcUYdIbN43rw8bBbp3t2u+Oj2cK7h5SIe033yFTZGO7+F
 DiORvwZ08IBBK47xtTjQfT0fU=
Received: from zhb.. (unknown [])
 by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id
 _____wAXyu5Se_NpHedTCg--.49548S9; 
 Thu, 30 Apr 2026 23:55:07 +0800 (CST)
From: Hans Zhang <18255117159@163.com>
To: broonie@kernel.org, sunny.luo@amlogic.com, xianwei.zhao@amlogic.com,
 neil.armstrong@linaro.org, khilman@baylibre.com, han.xu@nxp.com,
 haibo.chen@nxp.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, lhjeff911@gmail.com,
 hayashi.kunihiko@socionext.com, mhiramat@kernel.org, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com
Date: Thu, 30 Apr 2026 23:54:53 +0800
Message-Id: <20260430155456.36998-8-18255117159@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260430155456.36998-1-18255117159@163.com>
References: <20260430155456.36998-1-18255117159@163.com>
MIME-Version: 1.0
X-CM-TRANSID: _____wAXyu5Se_NpHedTCg--.49548S9
X-Coremail-Antispam: 1Uf129KBjvdXoWrur17tw4DXF1kXFW7Kr1xZrb_yoWDJrg_CF
 48AF4Ikw4Y9rZxAa1rurn3AF909aykWa109FyDtFZayrWDWw4Uu393Jrn8Ga4UZrs7Ar4f
 CFnrX3W8A34fKjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRN6pBPUUUUU==
X-Originating-IP: [240e:b8f:927e:5900:c497:d540:b00d:97f4]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbCxBtM72nze1tkuQAA3b
X-Mailman-Approved-At: Mon, 04 May 2026 12:39:23 +0000
Cc: imx@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, Hans Zhang <18255117159@163.com>,
 linux-amlogic@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 07/10] spi: stm32-ospi: Use FIELD_MODIFY()
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
X-Rspamd-Queue-Id: 904D44BCFDC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [5.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	DATE_IN_PAST(1.00)[92];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[163.com:s=s110527];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	DMARC_POLICY_SOFTFAIL(0.10)[163.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[163.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:broonie@kernel.org,m:sunny.luo@amlogic.com,m:xianwei.zhao@amlogic.com,m:neil.armstrong@linaro.org,m:khilman@baylibre.com,m:han.xu@nxp.com,m:haibo.chen@nxp.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:lhjeff911@gmail.com,m:hayashi.kunihiko@socionext.com,m:mhiramat@kernel.org,m:jbrunet@baylibre.com,m:martin.blumenstingl@googlemail.com,m:imx@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:linux-spi@vger.kernel.org,m:18255117159@163.com,m:linux-amlogic@lists.infradead.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:mcoquelinstm32@gmail.com,m:martinblumenstingl@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,amlogic.com,linaro.org,baylibre.com,nxp.com,gmail.com,foss.st.com,socionext.com,googlemail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_SENDER(0.00)[18255117159@163.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[18255117159@163.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[lists.linux.dev,vger.kernel.org,163.com,lists.infradead.org,st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-0.571];
	TAGGED_RCPT(0.00)[linux-stm32];
	DKIM_TRACE(0.00)[163.com:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns]

Use FIELD_MODIFY() to remove open-coded bit manipulation.
No functional change intended.

Signed-off-by: Hans Zhang <18255117159@163.com>
---
 drivers/spi/spi-stm32-ospi.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/spi/spi-stm32-ospi.c b/drivers/spi/spi-stm32-ospi.c
index 4461c6e24b9e..3757f6ba8fc6 100644
--- a/drivers/spi/spi-stm32-ospi.c
+++ b/drivers/spi/spi-stm32-ospi.c
@@ -470,10 +470,9 @@ static int stm32_ospi_send(struct spi_device *spi, const struct spi_mem_op *op)
 	u8 cs = spi->chip_select[ffs(spi->cs_index_mask) - 1];
 
 	cr = readl_relaxed(ospi->regs_base + OSPI_CR);
-	cr &= ~CR_CSSEL;
-	cr |= FIELD_PREP(CR_CSSEL, cs);
-	cr &= ~CR_FMODE_MASK;
-	cr |= FIELD_PREP(CR_FMODE_MASK, ospi->fmode);
+	FIELD_MODIFY(CR_CSSEL, &cr, cs);
+
+	FIELD_MODIFY(CR_FMODE_MASK, &cr, ospi->fmode);
 	writel_relaxed(cr, regs_base + OSPI_CR);
 
 	if (op->data.nbytes)
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
