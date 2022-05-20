Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CC9C852E799
	for <lists+linux-stm32@lfdr.de>; Fri, 20 May 2022 10:32:34 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9328BC0D2BB;
	Fri, 20 May 2022 08:32:34 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 25C8BC0D2B8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 20 May 2022 08:32:33 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24K3tLjB028145;
 Fri, 20 May 2022 10:32:26 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=c/Lq0oy39Sxj5Cf7Ma+CafFIl6MIsyg+0GLBTzXk1No=;
 b=zRkUXEdtfH8syzUhy3lFopRF1TbdtxZIywyejyCWnUNX26LEVEDLybDrMkuoTAYKQ8/T
 653omNVZBb68VWCRg6tGVim8HxtRfYW+cfDoRuVn2Sqo8OaMnlj2cPgA3AKvcIZSiXBC
 6/AE7bTSMalsCjyAOEfpcwpgzRTC/XkHo5GGGlPl4XbktN3MYbSGCj/a8KW522zhqPuQ
 Z1W3/YkC2Si2Ggign9MmSNMJFqNypEXhp4qIQKQfeXOIAijYbuOfpcHDfIVuLUTevTeL
 X4o+jwGgm252pY5zmExI9C7gL6jCye1DWsZ5i0ovj1h4qPGGYH6ho8dFue9JgrTRLLG9 sQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3g23s22u1e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 May 2022 10:32:26 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D9A8010002A;
 Fri, 20 May 2022 10:32:23 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D11EB215124;
 Fri, 20 May 2022 10:32:23 +0200 (CEST)
Received: from localhost (10.75.127.46) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Fri, 20 May
 2022 10:32:22 +0200
From: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Mathieu Poirier
 <mathieu.poirier@linaro.org>
Date: Fri, 20 May 2022 10:29:40 +0200
Message-ID: <20220520082940.2984914-11-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220520082940.2984914-1-arnaud.pouliquen@foss.st.com>
References: <20220520082940.2984914-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-20_03,2022-05-19_03,2022-02-23_01
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Deepak Kumar Singh <quic_deesin@quicinc.com>,
 Chris Lew <quic_clew@quicinc.com>, arnaud.pouliquen@foss.st.com,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [RFC PATCH 10/10] rpmsg: virtio: Set default dst
	address on flow control
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

When a rpmsg channel has been created locally with a destination address
set to RPMSG_ADDR_ANY, a name service announcement message is sent to
the remote side. Then the destination address is never updated, making it
impossible to send messages to the remote.

An example of kernel trace observed:
rpmsg_tty virtio0.rpmsg-tty.29.-1: invalid addr (src 0x1d, dst 0xffffffff)

The flow control can be used to set the rpmsg device address.
If the destination address is RPMSG_ADDR_ANY, then set it to
address of the remote endpoint that send the message.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
---
This patch is an alternative of the fix proposed in patch [1]

[1] https://lore.kernel.org/lkml/20220316153001.662422-1-arnaud.pouliquen@foss.st.com/
---
 drivers/rpmsg/virtio_rpmsg_bus.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
index a8e60ca4cd08..0337a07e278c 100644
--- a/drivers/rpmsg/virtio_rpmsg_bus.c
+++ b/drivers/rpmsg/virtio_rpmsg_bus.c
@@ -393,6 +393,16 @@ static int virtio_rpmsg_remote_flowctrl(struct rpmsg_device *rpdev,
 	if (!ept)
 		return -EINVAL;
 
+	/*
+	 * If the endpoint is the rpmsg device default one, then it can not be yet associated
+	 * to the remote endpoint. This can occur if a ns announcement message has been
+	 * previously sent to the remote side.
+	 * Update the rpmsg device destination address in such case to store the remote
+	 * address as default remote endpoint.
+	 */
+	if (rpdev->ept == ept && rpdev->dst == RPMSG_ADDR_ANY)
+		rpdev->dst = __rpmsg32_to_cpu(virtio_is_little_endian(vrp->vdev), chinfo->src);
+
 	/* Make sure ept->sig_cb doesn't go away while we use it */
 	mutex_lock(&ept->cb_lock);
 
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
