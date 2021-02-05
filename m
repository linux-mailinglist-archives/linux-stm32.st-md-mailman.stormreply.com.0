Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B7150311086
	for <lists+linux-stm32@lfdr.de>; Fri,  5 Feb 2021 19:59:57 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3D6EEC57B56;
	Fri,  5 Feb 2021 18:59:57 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 54CB8C3FADC
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 Feb 2021 18:59:54 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 115IqALQ022865; Fri, 5 Feb 2021 19:59:45 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=wEvb5Q/4ECNnqwhiRqeWSntwF6nVSf+F1AIoLBO2axI=;
 b=a0RWIxmxhulU49xCWBg/J4Fwj6cG7TGqah9bXhaeoCjGD8OHI6ZPU2qRVrGa1hcM30lO
 LyPUt1NXKVknUMWCGVgJZHQKcI0lRZKLvTjb/6u8Yh4WnVcp7acX6RhQjKeFsP4COn9q
 7IE4L1fGC6uYz/cYzV8rUsOb6uqkgg0Fl3iPaNXRVfbx0j4DGyT5r+3o5dlHucVpKjkz
 I1jHHfHkmDDdeCvN1Py6YA64S63QU778EeGUh8NakMYgLKmhCM43MkO/plK+qBcEbDo+
 QXnEFODPnznGOSN7MCJk4qCYqNSY9Pr+JuQhaqCxKWL4a5vHKF2cp1NPTGocU55SCGEF Wg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 36d0fsgjqm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Feb 2021 19:59:45 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5108D10002A;
 Fri,  5 Feb 2021 19:59:45 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 42D512C38D3;
 Fri,  5 Feb 2021 19:59:45 +0100 (CET)
Received: from localhost (10.75.127.45) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 5 Feb 2021 19:59:45
 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
To: <broonie@kernel.org>, <amelie.delaunay@foss.st.com>
Date: Fri, 5 Feb 2021 19:59:24 +0100
Message-ID: <1612551572-495-1-git-send-email-alain.volmat@foss.st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-05_10:2021-02-05,
 2021-02-05 signatures=0
Cc: linux-kernel@vger.kernel.org, alexandre.torgue@foss.st.com,
 mcoquelin.stm32@gmail.com, alain.volmat@foss.st.com, linux-spi@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 0/8] spi: stm32: fix and enhancements for
	spi-stm32
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

The serie provides a fix for the spi-stm32 driver, allowing to properly
handle 0 byte transfer (and thus being able to run spi-loopback-test).

In addition to that, important enhancements are implemented, among them,
supporting transfer larger that what the IP can setup in one go or
allowing to use the SPI bus without cs_gpio.

v2: Fix within patch 'spi: stm32: properly handle 0 byte transfer'
    Reorder patches to avoid compilation issue

Alain Volmat (5):
  spi: stm32: properly handle 0 byte transfer
  spi: stm32: do not mandate cs_gpio
  spi: stm32h7: ensure message are smaller than max size
  spi: stm32: defer probe for reset
  spi: stm32: make spurious and overrun interrupts visible

Amelie Delaunay (2):
  spi: stm32: use bitfield macros
  spi: stm32h7: replace private SPI_1HZ_NS with NSEC_PER_SEC

Etienne Carriere (1):
  spi: stm32: driver uses reset controller only at init

 drivers/spi/spi-stm32.c | 114 ++++++++++++++++++----------------------
 1 file changed, 52 insertions(+), 62 deletions(-)

-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
