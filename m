Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DA57A82BDE0
	for <lists+linux-stm32@lfdr.de>; Fri, 12 Jan 2024 10:53:51 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A4809C6DD76;
	Fri, 12 Jan 2024 09:53:51 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3A06BC6A61D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Jan 2024 09:53:50 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40C8bHhU007737; Fri, 12 Jan 2024 10:53:24 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding:content-type; s=selector1; bh=o+HB9MM
 1kq6YyqCwu/Y2zli6EEym4Kd+0JVjoN0IbRo=; b=Fd9Bw38w+ixsNKMfkhmHgB8
 ucmEcU5fcjEiqTKOOOBNZvxQP3hsWM9nQOAV0uirntTUEA/b+wZFNMeRBg7Tk6a4
 zV41nEjKwAEGAW0E9weI3LyHzb/hYVsCaPbg4yOYpSzA4MkKxSqVdvyM3BFYghin
 4DQAc5xBHcPYYSfTSN7DbNPr59y/6txdVh6t09fX4kBDiolJxTNE1YAs4JQQhuf7
 CpNFMYUzBxAYpwww8R+nX0MhFjnnueSvvVNjj3StJAG+IunIHtrVH7KGR4UTQwk1
 s/Cw2UJ0WDP2wGROrfwKY5vP25Dudp3qeHo1HQJmR/Re2u4FZTFz5QB3sNJrUcA=
 =
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3vk22v8bed-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Jan 2024 10:53:24 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C5BA410002A;
 Fri, 12 Jan 2024 10:53:23 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 64641208D4E;
 Fri, 12 Jan 2024 10:53:23 +0100 (CET)
Received: from localhost (10.201.21.102) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 12 Jan
 2024 10:53:23 +0100
From: Valentin Caron <valentin.caron@foss.st.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby
 <jirislaby@kernel.org>
Date: Fri, 12 Jan 2024 10:52:56 +0100
Message-ID: <20240112095300.2004878-1-valentin.caron@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.201.21.102]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-05_08,2024-01-05_01,2023-05-22_02
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 0/4] serial: stm32: improve driver for
	stm32mp25
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

STM32MP25 got the same serial hardware block as STM32MP1x but with two improvements:
 - TX and RX FIFO have been extended to 64 bytes.
 - one instance more than in STM32MP1x series.
 
Since v1:
 - Correct include issue reported by kernel test robot:
   https://lore.kernel.org/oe-kbuild-all/202401121426.pnTJrQes-lkp@intel.com/

Valentin Caron (4):
  serial: stm32: implement prescaler tuning to compute low baudrate
  serial: stm32: extend max number of U(S)ART to 9
  serial: stm32: change register's offset type from u8 to u16
  serial: stm32: get FIFO size from hwcfg register

 drivers/tty/serial/stm32-usart.c | 223 +++++++++++++++++++------------
 drivers/tty/serial/stm32-usart.h |  38 ++++--
 2 files changed, 160 insertions(+), 101 deletions(-)

-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
