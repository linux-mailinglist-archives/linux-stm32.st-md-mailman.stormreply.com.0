Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 538573B2B9A
	for <lists+linux-stm32@lfdr.de>; Thu, 24 Jun 2021 11:40:25 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 20019C57B6C;
	Thu, 24 Jun 2021 09:40:25 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7069AC3FADC
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Jun 2021 09:40:20 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15O9c8Vv004857; Thu, 24 Jun 2021 11:40:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=qEDhYt2leubu9mAEDVbUmPNoFRyqAPacUpoePznnKfA=;
 b=Nwm8bRawBzC/qpnqKlVQgFY7oKw+Tc9AdgynK8AFL9epY57FDo6yE4nLFSD+Ek9zzJF9
 gNEZYSKBvFSLJu3GBp5PojyzPHHqWcbCcAVv7dns7RRucwUCsGPKM8kfWoCO5ZhWAkg2
 Ro1AdyCWPIxXtBASmeXsHcOC3LewqZ4mkJYo8M5WhIz5kf6BMEYayyesSK2YpftAbHaM
 nijTAKl2n5IxeOf/T9MK9qAZOabJQFGFhNCq7NqsZq0+0HNj3z4BCLjyZ+ITgOA48SrM
 1hk4qtiEqP2gKfv71NZmc+er+OMCZ5A9q+6DD5SNALirM0fJdn7MRnHr+M6Bw0SqgQXH 6w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 39chf6jsvb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 24 Jun 2021 11:40:04 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0A58810002A;
 Thu, 24 Jun 2021 11:40:04 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E7F1D21B51B;
 Thu, 24 Jun 2021 11:40:03 +0200 (CEST)
Received: from localhost (10.75.127.47) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 24 Jun 2021 11:40:03
 +0200
From: Amelie Delaunay <amelie.delaunay@foss.st.com>
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, Dan
 Williams <dan.j.williams@intel.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Thu, 24 Jun 2021 11:39:58 +0200
Message-ID: <20210624093959.142265-2-amelie.delaunay@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210624093959.142265-1-amelie.delaunay@foss.st.com>
References: <20210624093959.142265-1-amelie.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-24_06:2021-06-24,
 2021-06-24 signatures=0
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dmaengine@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 1/2] dt-bindings: dma: add alternative REQ/ACK
	protocol selection in stm32-dma
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

Default REQ/ACK protocol consists in maintaining ACK signal up to the
removal of REQuest and the transfer completion.
In case of alternative REQ/ACK protocol, ACK de-assertion does not wait the
removal of the REQuest, but only the transfer completion.
Due to a possible DMA stream lock when transferring data to/from STM32
USART/UART, this new bindings allow to select this alternative protocol in
device tree, especially for STM32 USART/UART nodes.

Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
---
 Documentation/devicetree/bindings/dma/st,stm32-dma.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/dma/st,stm32-dma.yaml b/Documentation/devicetree/bindings/dma/st,stm32-dma.yaml
index 2a5325f480f6..4bf676fd25dc 100644
--- a/Documentation/devicetree/bindings/dma/st,stm32-dma.yaml
+++ b/Documentation/devicetree/bindings/dma/st,stm32-dma.yaml
@@ -40,6 +40,13 @@ description: |
          0x0: FIFO mode with threshold selectable with bit 0-1
          0x1: Direct mode: each DMA request immediately initiates a transfer
               from/to the memory, FIFO is bypassed.
+       -bit 4: alternative DMA request/acknowledge protocol
+         0x0: Use standard DMA ACK management, where ACK signal is maintained
+              up to the removal of request and transfer completion
+         0x1: Use alternative DMA ACK management, where ACK de-assertion does
+              not wait for the de-assertion of the REQuest, ACK is only managed
+              by transfer completion. This must only be used on channels
+              managing transfers for STM32 USART/UART.
 
 
 maintainers:
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
