Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 69B4999E95A
	for <lists+linux-stm32@lfdr.de>; Tue, 15 Oct 2024 14:16:26 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 31070C78030;
	Tue, 15 Oct 2024 12:16:26 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9DAA5C78033
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Oct 2024 12:16:25 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49F8bYfA027894;
 Tue, 15 Oct 2024 14:16:16 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 1FmGrSANQn07iSNnWCRz9WCfIaMI09hSsfRbqu2gnOU=; b=i+EpCeJP2v5lQoKP
 7wHXFfPiAb0MUdQuYdomotUyZGBeM3pWQhTsJz7KvjBqh8qg+8N7owPlycG9D/Uh
 l5akDnfr+1U+B81/BrulzujahyC1ij3h5eEUPTtyJXuXHuiJdzKxHGTEY+o2DA02
 ek3J2DIa+YrcnoETc85jrpccnTkJHlsDi6S22hsFiZ8KMQG86vTdoJD3t7OGF0p6
 hd0fY84V4HJpfbiIngHCdXo/1tQUnG/5hamgUBJJquiBrNYQT3a8IvcS92V6c5sY
 cy8mobAO4dO7ccFKQuvAjGk6P3McC9T+zTaHVInYrwTG+OR/IFd9gFMIPb6ebkf1
 jQV8zQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 427gewwakg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Oct 2024 14:16:16 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 084CB4004F;
 Tue, 15 Oct 2024 14:15:28 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4CA2322233B;
 Tue, 15 Oct 2024 14:14:47 +0200 (CEST)
Received: from localhost (10.48.87.35) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Tue, 15 Oct
 2024 14:14:47 +0200
From: Amelie Delaunay <amelie.delaunay@foss.st.com>
Date: Tue, 15 Oct 2024 14:14:37 +0200
MIME-Version: 1.0
Message-ID: <20241015-dma3-mp25-updates-v2-1-b63e21556ec8@foss.st.com>
References: <20241015-dma3-mp25-updates-v2-0-b63e21556ec8@foss.st.com>
In-Reply-To: <20241015-dma3-mp25-updates-v2-0-b63e21556ec8@foss.st.com>
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.14.2
X-Originating-IP: [10.48.87.35]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dmaengine@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 1/9] dt-bindings: dma: stm32-dma3: prevent
 packing/unpacking mode
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

When source data width/burst and destination data width/burst are
different, data are packed or unpacked in DMA3 channel FIFO.
Data are pushed out from DMA3 channel FIFO when the destination burst
length (= data width * burst) is reached.
If the channel is stopped before the transfer end, and if some bytes are
packed/unpacked in the DMA3 channel FIFO, these bytes are lost.
Indeed, DMA3 channel FIFO has no flush capability, only reset.
To avoid potential bytes lost, pack/unpack must be prevented by setting
memory data width/burst equal to peripheral data width/burst.
Memory accesses will be penalized. But it is the only way to avoid bytes
lost.

Some devices (e.g. cyclic RX like UART) need this, so add the possibility
to prevent pack/unpack feature, by setting bit 16 of the 'DMA transfer
requirements' bit mask.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
---
 Documentation/devicetree/bindings/dma/stm32/st,stm32-dma3.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/dma/stm32/st,stm32-dma3.yaml b/Documentation/devicetree/bindings/dma/stm32/st,stm32-dma3.yaml
index 7fdc44b2e6467928622a5bb25d9e0c74bb1790ae..5484848735f8ac3d2050104bbab1d986e82ba6a7 100644
--- a/Documentation/devicetree/bindings/dma/stm32/st,stm32-dma3.yaml
+++ b/Documentation/devicetree/bindings/dma/stm32/st,stm32-dma3.yaml
@@ -96,6 +96,9 @@ properties:
                including the update of the LLI if any
           0x3: at channel level, the transfer complete event is generated at the
                end of the last LLI
+        -bit 16: Prevent packing/unpacking mode
+          0x0: pack/unpack enabled when source data width/burst != destination data width/burst
+          0x1: memory data width/burst forced to peripheral data width/burst to prevent pack/unpack
 
 required:
   - compatible

-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
