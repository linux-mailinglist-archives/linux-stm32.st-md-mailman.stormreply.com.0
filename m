Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BE419F92A8
	for <lists+linux-stm32@lfdr.de>; Fri, 20 Dec 2024 13:57:29 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8EDE8C78034;
	Fri, 20 Dec 2024 12:57:28 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7BBCDC78032
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 20 Dec 2024 12:57:21 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BKBdFUi004018;
 Fri, 20 Dec 2024 13:57:01 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=selector1; bh=dTNG0nibu7UYo45+nRmB7l
 qVuql0kGdP8sbH3SBpRbk=; b=cbNqS2HHeHCpZwYociD56gu52aYjKaeVeum1vu
 2NSL2Vs9on0oSTYygyae2nBwFolnr9WR1esvA5M7nsI1bEiyT5brGk/pc2Ealp77
 9d0KfCRyE3c3kZJVUkxNhzUEYA2wFUrGFK8TiAQhM9TavDO87lW1HWYHVOr3p5Mz
 aLaKNyTx9mWU7455jTl1CWDbcXqxyMuC/koH6iyEP5RlPHO4I/+Fo4BTATtXr7a6
 dNEa7oFsZZAFtaC22jeQAjul27YJ1X+V4KfviGhT58iM8TMzNRqUJBKk4v0bkxjf
 vgv4krrhOadXoMWTVkgVDx+0EXQ+VX9cJrAby19hFuk1hIRw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 43n34bsrpc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 Dec 2024 13:57:01 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id E8A8E4004F;
 Fri, 20 Dec 2024 13:55:51 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3B02C272C3A;
 Fri, 20 Dec 2024 13:55:10 +0100 (CET)
Received: from localhost (10.48.87.62) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Fri, 20 Dec
 2024 13:55:09 +0100
From: <patrice.chotard@foss.st.com>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Alexandre
 Torgue <alexandre.torgue@foss.st.com>,
 Russell King <linux@armlinux.org.uk>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Petr Mladek <pmladek@suse.com>, Yoann Congal <yoann.congal@smile.fr>
Date: Fri, 20 Dec 2024 13:55:02 +0100
Message-ID: <20241220125506.3157268-1-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SAFCAS1NODE2.st.com (10.75.90.13) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
Cc: soc@kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v2 0/4] ARM: config: stm32: Remove useless
	flags
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

From: Patrice Chotard <patrice.chotard@foss.st.com>

Running "make savedefconfig" highlights that some flags are no more used,
remove them.
Remove some flags to reduce the kernel image size as STM32 MCU's board
embeds low amount of RAM.

Changes in V2:
  _ squash patches 2-7
  _ split patch 1 in three parts and add epxlanations about flags removal.

Patrice Chotard (4):
  ARM: configs: stm32: Remove FLASH_MEM_BASE and FLASH_SIZE in STM32
    defconfig
  ARM: configs: stm32: Clean STM32 defconfig
  ARM: configs: stm32: Remove CRYPTO in STM32 defconfig
  ARM: configs: stm32: Remove useless flags in STM32 defconfig

 arch/arm/configs/stm32_defconfig | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
