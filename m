Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +OAnLH6T+Gl8wgIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 04 May 2026 14:39:26 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D99E4BCFFB
	for <lists+linux-stm32@lfdr.de>; Mon, 04 May 2026 14:39:26 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B5329C5A4C0;
	Mon,  4 May 2026 12:39:25 +0000 (UTC)
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BFCE5C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Apr 2026 15:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=o8
 u8w2UWcyZeZiwf05Vd1PKU6i5IHTCnVEoz7yLvk1c=; b=fnEcgzN2VFnVE3cMIH
 9ZUq5Q4C0+a+IlpYW+iGSTDe56JVGkJLGxSXC3uPO2+P+5p5N6L6UibBwGRUG3v1
 PV843Fz76Y+g8t8cRBuYMH6XK7KNltgmjSRbGADxjZrcUIcAM/DFDizXvFLFpxdP
 YGE/Q2KsUhdvyJLJ3YRE0mxfU=
Received: from zhb.. (unknown [])
 by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id
 _____wAXyu5Se_NpHedTCg--.49548S2; 
 Thu, 30 Apr 2026 23:54:59 +0800 (CST)
From: Hans Zhang <18255117159@163.com>
To: broonie@kernel.org, sunny.luo@amlogic.com, xianwei.zhao@amlogic.com,
 neil.armstrong@linaro.org, khilman@baylibre.com, han.xu@nxp.com,
 haibo.chen@nxp.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, lhjeff911@gmail.com,
 hayashi.kunihiko@socionext.com, mhiramat@kernel.org, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com
Date: Thu, 30 Apr 2026 23:54:46 +0800
Message-Id: <20260430155456.36998-1-18255117159@163.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CM-TRANSID: _____wAXyu5Se_NpHedTCg--.49548S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7tw43GF18GryUWryrGryrXrb_yoW8Jw1DpF
 4fGFyxZw4xJ3yYyF43CrWYkFyaga93WFWqg3W7twn3ZanYyFyUXrWDK3WrJrW7JF97GFWx
 KFWjkrZ8CFs2vrUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pi1SodUUUUU=
X-Originating-IP: [240e:b8f:927e:5900:c497:d540:b00d:97f4]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbC7BRL7mnze1RXzAAA3z
X-Mailman-Approved-At: Mon, 04 May 2026 12:39:23 +0000
Cc: imx@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, Hans Zhang <18255117159@163.com>,
 linux-amlogic@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 00/10] spi: Use FIELD_MODIFY() for bitfield
	operations
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
X-Rspamd-Queue-Id: 6D99E4BCFFB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [5.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	MID_CONTAINS_FROM(1.00)[];
	DATE_IN_PAST(1.00)[92];
	R_DKIM_REJECT(1.00)[163.com:s=s110527];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[163.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_FROM(0.00)[163.com];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_RECIPIENTS(0.00)[m:broonie@kernel.org,m:sunny.luo@amlogic.com,m:xianwei.zhao@amlogic.com,m:neil.armstrong@linaro.org,m:khilman@baylibre.com,m:han.xu@nxp.com,m:haibo.chen@nxp.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:lhjeff911@gmail.com,m:hayashi.kunihiko@socionext.com,m:mhiramat@kernel.org,m:jbrunet@baylibre.com,m:martin.blumenstingl@googlemail.com,m:imx@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:linux-spi@vger.kernel.org,m:18255117159@163.com,m:linux-amlogic@lists.infradead.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:mcoquelinstm32@gmail.com,m:martinblumenstingl@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,amlogic.com,linaro.org,baylibre.com,nxp.com,gmail.com,foss.st.com,socionext.com,googlemail.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[lists.linux.dev,vger.kernel.org,163.com,lists.infradead.org,st-md-mailman.stormreply.com];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER(0.00)[18255117159@163.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[18255117159@163.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCVD_TLS_LAST(0.00)[];
	NEURAL_HAM(-0.00)[-0.547];
	TAGGED_RCPT(0.00)[linux-stm32];
	DKIM_TRACE(0.00)[163.com:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns]

Replace open-coded bitfield modifications with the standard FIELD_MODIFY()
macro across multiple SPI controller drivers. This improves readability and
adds compile-time checking without functional changes.

Each patch modifies a single driver, allowing independent review and
application.

Hans Zhang (10):
  spi: amlogic-spifc-a1: Use FIELD_MODIFY()
  spi: amlogic-spisg: Use FIELD_MODIFY()
  spi: cadence-xspi: Use FIELD_MODIFY()
  spi: meson-spicc: Use FIELD_MODIFY()
  spi: nxp-xspi: Use FIELD_MODIFY()
  spi: sn-f-ospi: Use FIELD_MODIFY()
  spi: stm32-ospi: Use FIELD_MODIFY()
  spi: stm32-qspi: Use FIELD_MODIFY()
  spi: sunplus-sp7021: Use FIELD_MODIFY()
  spi: uniphier: Use FIELD_MODIFY()

 drivers/spi/spi-amlogic-spifc-a1.c |  5 ++---
 drivers/spi/spi-amlogic-spisg.c    | 13 +++++--------
 drivers/spi/spi-cadence-xspi.c     |  3 +--
 drivers/spi/spi-meson-spicc.c      |  5 ++---
 drivers/spi/spi-nxp-xspi.c         | 12 ++++--------
 drivers/spi/spi-sn-f-ospi.c        |  5 ++---
 drivers/spi/spi-stm32-ospi.c       |  7 +++----
 drivers/spi/spi-stm32-qspi.c       |  5 ++---
 drivers/spi/spi-sunplus-sp7021.c   |  3 +--
 drivers/spi/spi-uniphier.c         | 13 +++++--------
 10 files changed, 27 insertions(+), 44 deletions(-)


base-commit: 3b3bea6d4b9c162f9e555905d96b8c1da67ecd5b
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
