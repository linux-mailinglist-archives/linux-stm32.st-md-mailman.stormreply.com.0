Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 44F1055074C
	for <lists+linux-stm32@lfdr.de>; Sun, 19 Jun 2022 00:23:42 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0A915C03FC4;
	Sat, 18 Jun 2022 22:23:42 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A310DC035BE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 18 Jun 2022 22:23:40 +0000 (UTC)
Received: from tr.lan (ip-86-49-12-201.net.upcbroadband.cz [86.49.12.201])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 14B0383F6A;
 Sun, 19 Jun 2022 00:23:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1655591020;
 bh=RCjH1QPo/2w7OjHRig25Ob2Y4ZrRSsmXBv51Nn+xmN8=;
 h=From:To:Cc:Subject:Date:From;
 b=n4bWJPUsUsyJcgwNnVe4Y+ejqeDmwr6I0HiB0LAQmgJnqifMlftO7YVGzLl7eoGsh
 PnPyJqO1jGpZtWyhBSpZVQECoL4ofq4bXrd5Id0caQ5dBeyj73rMVgUZaReK9DbTt2
 ostbcKZcqCelj1GkiUhLJH0lta2Lw3yxIdxGzmURvMyKzCj25olHoRcyp9fBRcLjt4
 DbCf0tZX/A9Gm28XSbL6ntEaunzaIB18pVPlw/EyjCUK0rT+9Pa1tFbW/oitJCKKM7
 TrLduJVv5AEAHrY7EKSJky+Gs7wEAv7oMpTS/gMsy16+tt+F6kJAm5/ZUxCWROXwNG
 0No5AEK3mm/8Q==
From: Marek Vasut <marex@denx.de>
To: linux-media@vger.kernel.org
Date: Sun, 19 Jun 2022 00:23:35 +0200
Message-Id: <20220618222335.478205-1-marex@denx.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
Cc: Marek Vasut <marex@denx.de>, Hugues FRUCHET <hugues.fruchet@foss.st.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Alain Volmat <alain.volmat@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] media: stm32: dcmi: Register V4L2 subdev nodes
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

Unless the V4L2 device calls v4l2_device_register_subdev_nodes(),
the /dev/v4l-subdev* sub-device nodes are not registered and thus
not created. Add the missing call.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Alain Volmat <alain.volmat@foss.st.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Amelie DELAUNAY <amelie.delaunay@foss.st.com>
Cc: Hugues FRUCHET <hugues.fruchet@foss.st.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Philippe CORNU <philippe.cornu@foss.st.com>
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/media/platform/st/stm32/stm32-dcmi.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/media/platform/st/stm32/stm32-dcmi.c b/drivers/media/platform/st/stm32/stm32-dcmi.c
index 5f08ba47ea96b..56f4e04bc7c49 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmi.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmi.c
@@ -1805,6 +1805,12 @@ static int dcmi_graph_notify_complete(struct v4l2_async_notifier *notifier)
 
 	dcmi->vdev->ctrl_handler = dcmi->source->ctrl_handler;
 
+	ret = v4l2_device_register_subdev_nodes(&dcmi->v4l2_dev);
+	if (ret) {
+		dev_err(dcmi->dev, "Count not register subdev nodes\n");
+		return ret;
+	}
+
 	ret = dcmi_formats_init(dcmi);
 	if (ret) {
 		dev_err(dcmi->dev, "No supported mediabus format found\n");
-- 
2.35.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
