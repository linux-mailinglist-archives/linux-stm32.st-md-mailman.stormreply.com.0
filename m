Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A92BA85D71
	for <lists+linux-stm32@lfdr.de>; Fri, 11 Apr 2025 14:44:28 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 18459C78028;
	Fri, 11 Apr 2025 12:44:28 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 14DEAC6DD9A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 11 Apr 2025 12:44:26 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53B9W3go002131;
 Fri, 11 Apr 2025 14:43:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=selector1; bh=j/lAi5eaVA+wpovEOgd7NZ
 L+lXloOZBsudzotdqZPWU=; b=UqoyPyu2cZP4mweG/lilyfuugIK7/mbywr3lMd
 AgfwdAyouFafno9I0oD9rQsb/gIFq3dAYA/YbKGgEKmL8uQbpaZH9N+Qm6MRZkOm
 KgXO9cd3Xdp8PFwqK30hPEsphF3xBi/9wbNIVUFhaQpbsTLOtf+P4ajc0TyggAfU
 YQg0k3PsF4dbmlq7lvObAPaQU3p9wfIXgX34pWgQdLmcQQGfCFpzEeiCrLOtD6EK
 vNRUbvRvd1qWUyeIRrq/m6qtKSTt50cJtupz2GIFDzqJIfyEuEO0Z/oR2OzTIyH1
 OlCyQnIwKhu8VMS151okJ0buvtJfEQ55rNPOzh7lqORSlEfQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 45tw8pwnc4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Apr 2025 14:43:53 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 58FDA400D4;
 Fri, 11 Apr 2025 14:42:43 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 30E629EC282;
 Fri, 11 Apr 2025 14:41:12 +0200 (CEST)
Received: from localhost (10.252.25.37) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 11 Apr
 2025 14:41:11 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Fri, 11 Apr 2025 14:41:09 +0200
Message-ID: <20250411-b4-upstream_ospi_reset_update-v2-0-4de7f5dd2a91@foss.st.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAOUN+WcC/x3MQQrCMBAF0KuUWRtoQiLoVUTC2Hx1FrZhJi1C6
 d0NLt/m7WRQgdF12Emxickyd4TTQNOb5xeclG4KY0hj9N49olurNQV/8mJVssLQ8loLN7h0OU8
 IMXFhT/2oiqd8///tfhw/o5oPsG8AAAA=
X-Change-ID: 20250411-b4-upstream_ospi_reset_update-596ce245ada1
To: Philipp Zabel <p.zabel@pengutronix.de>, Mark Brown <broonie@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.14.2
X-Originating-IP: [10.252.25.37]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_04,2025-04-10_01,2024-11-22_01
Cc: linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org
Subject: [Linux-stm32] [PATCH v2 0/2] reset: Add
 devm_reset_control_array_get_exclusive_released()
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

Add the released variant of devm_reset_control_array_get_exclusive().
Needed by spi-smt32-ospi driver as same reset line is also used also
by stm32-omm driver.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>

Changes in v2:
  - Rebased on spi/for-next (7a978d8fcf57).
  - Remove useless check on reset.
  - Add error handling on reset_control_acquire().
  - Link to v1: https://lore.kernel.org/all/20250410-b4-upstream_ospi_reset_update-v1-0-74126a8ceb9c@foss.st.com/

---
Patrice Chotard (2):
      reset: Add devm_reset_control_array_get_exclusive_released()
      spi: stm32-ospi: Make usage of reset_control_acquire/release() API

 drivers/spi/spi-stm32-ospi.c | 15 +++++++++------
 include/linux/reset.h        |  6 ++++++
 2 files changed, 15 insertions(+), 6 deletions(-)
---
base-commit: 7a978d8fcf57b283cb8c88dd4c9431502bd36ea8
change-id: 20250411-b4-upstream_ospi_reset_update-596ce245ada1

Best regards,
-- 
Patrice Chotard <patrice.chotard@foss.st.com>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
