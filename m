Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D0C1782BDDE
	for <lists+linux-stm32@lfdr.de>; Fri, 12 Jan 2024 10:53:47 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 80532C6DD77;
	Fri, 12 Jan 2024 09:53:47 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1C559C6DD75
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Jan 2024 09:53:46 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40C8bCIZ006983; Fri, 12 Jan 2024 10:53:25 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:content-type; s=
 selector1; bh=BPsKvGwCvtumO70J1qmyLApJgoRqO+4A21EFeihpSLQ=; b=UD
 pBVYMjDjnJNjr1QLk+RLRTvjibKIvdCLuilnRkyyJgm3Gi/laODH+O4E1JUI5yaG
 gQHjiwnHxh/9hHiKmX8gbrH5K4ma785VRVyx9ZjQGrApkAti0jW5dtdsB4dwRUoc
 APAdygVQYZGIoLo3i6jmR2coDidTUzcMytJRFmZPEAfRqdVzpF1sZCuav4FNB6Mv
 poEnr8Fv8UfCPRJjFDEUyqbVZ2YBfGUj7f/QZw7XkdKZjmKkzYuuAkfTZJQQcbO6
 vqwB0IjhM9pAdxPyCHEemd+dmbnmYo8/vR5P9Vm7lq6R4O1O8eKw5v6h40899S9z
 yp/uSxoA+CjRQZ7OXkdg==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3vk22u0bk5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Jan 2024 10:53:25 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 21C7A10004F;
 Fri, 12 Jan 2024 10:53:25 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1AF58208D4E;
 Fri, 12 Jan 2024 10:53:25 +0100 (CET)
Received: from localhost (10.201.21.102) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 12 Jan
 2024 10:53:24 +0100
From: Valentin Caron <valentin.caron@foss.st.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby
 <jirislaby@kernel.org>
Date: Fri, 12 Jan 2024 10:52:58 +0100
Message-ID: <20240112095300.2004878-3-valentin.caron@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240112095300.2004878-1-valentin.caron@foss.st.com>
References: <20240112095300.2004878-1-valentin.caron@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.21.102]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-05_08,2024-01-05_01,2023-05-22_02
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 2/4] serial: stm32: extend max number of
	U(S)ART to 9
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

STM32MP25x got 9 instances of U(S)ART. So extend STM32_MAX_PORTS to 9, in
order to handle all instances.

Signed-off-by: Valentin Caron <valentin.caron@foss.st.com>
---
 drivers/tty/serial/stm32-usart.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tty/serial/stm32-usart.h b/drivers/tty/serial/stm32-usart.h
index 8cecfdce9386..5ce1d3aae07e 100644
--- a/drivers/tty/serial/stm32-usart.h
+++ b/drivers/tty/serial/stm32-usart.h
@@ -183,7 +183,7 @@ struct stm32_usart_info {
 #define USART_PRESC_MAX		0b1011
 
 #define STM32_SERIAL_NAME "ttySTM"
-#define STM32_MAX_PORTS 8
+#define STM32_MAX_PORTS 9
 
 #define RX_BUF_L 4096		 /* dma rx buffer length     */
 #define RX_BUF_P (RX_BUF_L / 2)	 /* dma rx buffer period     */
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
