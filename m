Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E48B455EF7
	for <lists+linux-stm32@lfdr.de>; Thu, 18 Nov 2021 16:09:00 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 51A7BC5EC6B;
	Thu, 18 Nov 2021 15:09:00 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0EA5BC5C82A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 18 Nov 2021 15:08:58 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AIEaFrA003091;
 Thu, 18 Nov 2021 16:08:33 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=fLHwZGxFdvc8NUUE5rvqoHjjl+hj0c4xGzAD1tetaYc=;
 b=pPzvk7HIcxM5fe9KlY0R1mEbg056qMdMqYSpGtN8+rBP5yZKmaJcG4VrqijSpKXb5GEU
 6iMTNMSQB2ZKPaNJK7WLJiAWEiroW+G2DpcqUKZhinT5r59XcaVi7A3ROvKphlUGl645
 /zdKbfiCZ6WH6vaFn9WzaqyM0OLQB3nB3xIvOGoDMKIdbpClebLfHhMimzA2C+tI2r7c
 XZVh5Osv4pQR2Wrj/POaCgKIhL9+Eplkk4UGro9oVYCs8EgE8NJHBxNKkw1GtKs9QgvJ
 kxXCf0vlUjeVyQK1lMpWeCa8GZNgd5Pb1zOGKr/0b8eZUoFTe1DFZcfv8uT26hR23XLi 7w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3cdm1n28kb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 Nov 2021 16:08:33 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8C6F710002A;
 Thu, 18 Nov 2021 16:08:30 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 55AAC231535;
 Thu, 18 Nov 2021 16:08:30 +0100 (CET)
Received: from localhost (10.75.127.48) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Thu, 18 Nov 2021 16:08:30
 +0100
From: Nicolas Toromanoff <nicolas.toromanoff@foss.st.com>
To: Herbert Xu <herbert@gondor.apana.org.au>, "David S . Miller"
 <davem@davemloft.net>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Thu, 18 Nov 2021 16:07:47 +0100
Message-ID: <20211118150756.6593-1-nicolas.toromanoff@foss.st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-18_12,2021-11-17_01,2020-04-07_01
Cc: Marek Vasut <marex@denx.de>, linux-kernel@vger.kernel.org,
 Ard Biesheuvel <ardb@kernel.org>, linux-crypto@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3 0/9] STM32 CRYP driver: many fixes
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

Hello,

This set of patches update the STM32 CRYP driver.

First two update about EPROBE_DEFER management.
Then many fixes to success the cryptomanager EXTRA_TESTS.
And finally we reorder the initialization to set the key as last step.

This patch series applies to cryptodev/master.

v1 -> v2 :
  - use crypto_inc() in "crypto: stm32/cryp - fix CTR counter carry".
  - more explicit commit description.
  - with CONFIG_CRYPTO_MANAGER_EXTRA_TESTS=y all tests pass, at boot
    if built into kernel, at insmod if in module. (as v1)

v2->v3:
  - fix smatch warning (that was a bug) in "crypto: stm32/cryp - fix bugs and crash in tests"
    add missing parenthesis in mask/shift operation in
    stm32_cryp_write_ccm_first_header(), was only visible in case of
    aad buffer bigger than 65280 bytes.
  - add a new commit to fix lrw chaining mode

Etienne Carriere (2):
  crypto: stm32/cryp - defer probe for reset controller
  crypto: stm32/cryp - don't print error on probe deferral

Nicolas Toromanoff (7):
  crypto: stm32/cryp - fix CTR counter carry
  crypto: stm32/cryp - fix race condition in crypto_engine requests
  crypto: stm32/cryp - check early input data
  crypto: stm32/cryp - fix double pm exit
  crypto: stm32/cryp - fix lrw chaining mode
  crypto: stm32/cryp - fix bugs and crash in tests
  crypto: stm32/cryp - reorder hw initialization

 drivers/crypto/stm32/stm32-cryp.c | 985 ++++++++++++------------------
 1 file changed, 404 insertions(+), 581 deletions(-)


base-commit: beaaaa37c664e9afdf2913aee19185d8e3793b50
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
